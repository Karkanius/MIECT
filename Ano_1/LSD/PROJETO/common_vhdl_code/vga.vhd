----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LSD.TOS, March 2017 (DO NOT REMOVE THIS LINE)
--
-- This file contains three VGA-related entities: vga_controller, vga_clock_generator, and vga_output.
--
-- WARNING: all designs that generate a VGA image should use the VGA pixel clock as the main clock.
--
-- It is usually considered bad practice to put more than one entity in a single source file, but in this case the three entities that are declared in this
--   file are meant to be used together, so, as a matter of convenience to the user, they were put in the same file (she/he only has to import one file to the
--   project). Designs that instantiate the vga_controller entity will almost certainly also elaborate the other two (vga_clock_generator and vga_output), so
--   there will be no wasted analysis work.
--
-- Recall that we use signal names ending in _0, _1, and so on, to make explicit the relative time alignment of signals traveling along a pipeline; for
--   example, if some computation is performed on, say, vga_rgb_3, then the result should named vga_rgb_4 if it is registered (and it should be named
--   vga_rgb_3x if not). If this is done consistently then the time alignment of the various signals that travel through a long or complex pipeline can be
--   easily maintained.
--


----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LSD.TOS, March 2017 (DO NOT REMOVE THIS LINE)
--
-- VGA controller
--
-- WARNING: all signals in the vga_data record are registered (they change at the same time), on the rising edge of the pixel clock. However, the clock signal
--   that is sent to the video DAC (see the vga_output entity) uses an inverted clock. Thus, the logic that computes the color of each pixel must also
--   register its results, with the consequence that the vga_data signals have to be delayed one clock cycle. See the block diagrams in the support
--   documentation for a more detailed explanation and for examples of use of the entities declared in this file. Things are done in this way to allow pixel
--   clocks as high as possible.
--

library ieee;
use     ieee.std_logic_1164.all;
use     ieee.numeric_std.all;
use     work.vga_config.all;

entity vga_controller is
  port
  (
    clock      : in  std_logic;        -- pixel clock (main clock)
    reset      : in  std_logic := '0'; -- if active, reset the VGA controller
    vga_data_0 : out vga_data_t        -- control signals
  );
end vga_controller;

architecture v1 of vga_controller is
  signal x : integer range 0 to vga_mode.h_period-1; -- x coordinate
  signal y : integer range 0 to vga_mode.v_period-1; -- y coordinate
begin
  --
  -- Update pixel coordinates
  --
  process(clock) is
  begin
    if rising_edge(clock) then
      if reset = '1' then
        x <= 0;
        y <= 0;
      elsif x < vga_mode.h_period-1 then -- possible optimization: < can be replaced by /=
        x <= x+1;
        y <= y;
      elsif y < vga_mode.v_period-1 then -- possible optimization: < can be replaced by /=
        x <= 0;
        y <= y+1;
      else
        x <= 0;
        y <= 0;
      end if;
    end if;
  end process;
  --
  -- Output data (registered); in this way the external logic has one full clock cycle to do its thing,
  --   say, to compute red, green, and blue values for the current pixel, which has coordinates (x,y)
  --
  process(clock) is
  begin
    if rising_edge(clock) then
      -- hsync
      if (x >= vga_mode.hsync_init) and (x < vga_mode.hsync_end) then
        vga_data_0.h_sync <=     vga_mode.hsync_polarity;
      else
        vga_data_0.h_sync <= not vga_mode.hsync_polarity;
      end if;
      -- vsync
      if (y >= vga_mode.vsync_init) and (y < vga_mode.vsync_end) then
        vga_data_0.v_sync <=     vga_mode.vsync_polarity;
      else
        vga_data_0.v_sync <= not vga_mode.vsync_polarity;
      end if;
      -- blank_n
      if (x < vga_width) and (y < vga_height) then
        vga_data_0.blank_n <= '1'; -- do not blank (red, green, and blue data are important)
      else
        vga_data_0.blank_n <= '0'; -- blank (red, green, and blue data are irrelevant)
      end if;
      -- x and y coordinates
      vga_data_0.x <= x;
      vga_data_0.y <= y;
      -- end of a video line
      if (x = vga_width) and (y < vga_height) then
        vga_data_0.end_of_line <= '1';
      else
        vga_data_0.end_of_line <= '0';
      end if;
      -- end of a video frame
      if (x = vga_width) and (y = vga_height) then
        vga_data_0.end_of_frame <= '1';
      else
        vga_data_0.end_of_frame <= '0';
      end if;
    end if;
  end process;
end v1;


----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LSD.TOS, March 2017 (DO NOT REMOVE THIS LINE)
--
-- Generate the VGA pixel clock
--
-- The maximum pixel clock frequency supported by the video DAC chip (ADV7123 KSTZ140) of the DE2-115 board is 140MHz
-- We accept here frequencies up to 150MHz, to support the video mode 1920x1080@50Hz
--

library ieee;
use     ieee.std_logic_1164.all;
use     ieee.numeric_std.all;
use     work.vga_config.all;

entity vga_clock_generator is
  port
  (
    clock_50  : in  std_logic; -- 50MHz clock
    vga_clock : out std_logic  -- VGA pixel clock
  );
end vga_clock_generator;

architecture v1 of vga_clock_generator is
begin
  assert false report "desired vga pixel clock = " & real'image(vga_mode.pixel_clock_freq) & " Hz" severity note;
  assert false report "real vga pixel clock = " & real'image(vga_frequency) & " Hz" severity note;
  assert (vga_frequency <= 150.0e6) report "vga pixel clock too high" severity failure;
  I: if (vga_frequency > 49.999e6) and (vga_frequency < 50.001e6) generate
    vga_clock <= clock_50;
  else generate
    c : entity work.clock_generator(cyclone4e)
               generic map(frequency => vga_frequency)
               port map(clock_50 => clock_50,new_clock => vga_clock);
  end generate;
end v1;


----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LSD.TOS, March 2017 (DO NOT REMOVE THIS LINE)
--
-- VGA output
--
-- The signals h_sync, v_sync, sync_n, blank_n, as well as the signals r, g, and b, are sampled by the video DAC chip (the chip outside of the FPGA that
--   generates the analog VGA signals that are actually sent to the monitor), on the rising edge of the vga clock signal. As all these signals are usually
--   changed inside of the FPGA on the rising edge of that same clock, that poses a potential timing problem if the hold and setup times of the FPGA output
--   pins is too small. Thus, it is STRONGLY RECOMMENDED to register these signals (pass them through flip-flops), so that they become stable for almost all
--   the duration of an entire clock cycle, and to send to the outside of the FPGA a negated clock. If all this is done, the video DAC chip will sample these
--   signals in time instants where they are stable, and so setup and hold times become almost irrelevant.
--
-- Note that vga_data and vga_rgb SHOULD refer to the same pixel (this implies that they must be temporally aligned); this can be done by delaying vga_data as
--   many clock cycles as it takes vga_rgb to be computed.
--

library ieee;
use     ieee.std_logic_1164.all;
use     ieee.numeric_std.all;
use     work.vga_config.all;

entity vga_output is
  port
  (
    clock    : in std_logic;  -- pixel clock
    vga_data : in vga_data_t; -- the control signals
    vga_rgb  : in vga_rgb_t;  -- the corresponding pixel color

    vga_clk     : out std_logic;                    -- vga pixel clock
    vga_hs      : out std_logic;                    -- vga horizontal sync
    vga_vs      : out std_logic;                    -- vga vertical sync
    vga_sync_n  : out std_logic;                    -- vga sync signal (active low)
    vga_blank_n : out std_logic;                    -- vga blank signal (active low)
    vga_r       : out std_logic_vector(7 downto 0); -- vga red component
    vga_g       : out std_logic_vector(7 downto 0); -- vga green component
    vga_b       : out std_logic_vector(7 downto 0)  -- vga blue component
  );
end vga_output;

architecture v1 of vga_output is
begin
  --
  -- registered outputs (note the inverted output clock)
  --
  vga_clk <= not clock;
  process(clock) is
  begin
    if rising_edge(clock) then
      vga_hs      <= vga_data.h_sync;
      vga_vs      <= vga_data.v_sync;
      vga_sync_n  <= '0'; -- no sync signal on the green channel
      vga_blank_n <= vga_data.blank_n;
      vga_r       <= vga_rgb.r;
      vga_g       <= vga_rgb.g;
      vga_b       <= vga_rgb.b;
    end if;
  end process;
end v1;
