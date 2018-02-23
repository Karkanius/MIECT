----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LSD.TOS, March 2017 (DO NOT REMOVE THIS LINE)
--
-- This file contains two PS/2-related entities: ps2_controller and low_level_ps2_controller. Only the first should be instantiated directly.
--
-- It is usually considered bad practice to put more than one entity in a single source file, but in this case the two entities that are declared in this
--   file are meant to be used together, so, as a matter of convenience to the user, they were put in the same file (she/he only has to import one file to the
--   project). Designs that instantiate the ps2_controller entity also instantiate indirectly the low_level_ps2_controller entity.
--


----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LSD.TOS, March 2017 (DO NOT REMOVE THIS LINE)
--
-- PS/2 keyboard and mouse controller.
--
-- TO be done: after 5 seconds of inactivity, send a harmless command to the PS/2 device (and wait for its reply) to ensure that the PS/2 device is still connected
--

library ieee;
use     ieee.std_logic_1164.all;
use     ieee.numeric_std.all;

entity ps2_controller is
  generic
  (
    clock_frequency : real range 2.0e6 to 200.0e6 -- (in Hz) frequency of the clock signal
  );
  port
  (
    clock : in std_logic;        -- main clock
    reset : in std_logic := '0'; -- reset signal

    ps2_clk : inout std_logic; -- PS/2 clock line (open drain with pull-up resistor, output only '0' or 'Z')
    ps2_dat : inout std_logic; -- PS/2 data line (open drain with pull-up resistor, output only '0' or 'Z')

    keyboard_detected : out std_logic;                    -- asserted when a keyboard is detected
    keyboard_leds     : in  std_logic_vector(2 downto 0); -- desired state of the keyboard leds (bit 0: scroll lock, bit 1; num lock, bit 2: caps lock)
    key_code          : out std_logic_vector(7 downto 0); -- received key code
    valid_key_code    : out std_logic;                    -- valid key code pulse (active only during one clock cycle)

    mouse_detected    : out std_logic;                    -- asserted when a mouse is detected
    mouse_delta_x     : out std_logic_vector(8 downto 0); -- mouse movement in the x direction
    mouse_delta_y     : out std_logic_vector(8 downto 0); -- mouse movement in the y direction
    mouse_buttons     : out std_logic_vector(2 downto 0); -- state of the left, middle, and right mouse buttons
    valid_mouse_data  : out std_logic                     -- valid mouse data pulse (active only during one clock cycle)
  );
end ps2_controller;

architecture v1 of ps2_controller is
  --
  -- Time out counter
  --
  pure function number_of_clock_cycles(elapsed_time : real range 0.0 to 4.0) return integer is -- used only for "compile time" evaluation of constants
  begin
    return integer(elapsed_time*clock_frequency); -- conversion from time (in seconds) to number of clock cycles
  end number_of_clock_cycles;
  signal time_out_counter : integer range 0 to number_of_clock_cycles(4.0) := number_of_clock_cycles(1.0);
  --
  -- High level/low level PS/2 controller interface
  --
  signal rxd_data     : std_logic_vector(7 downto 0);
  signal rxd_valid    : std_logic;
  signal txd_data     : std_logic_vector(7 downto 0);
  signal txd_request  : std_logic;
  signal txd_accepted : std_logic;
  --
  -- State of the keyboard leds
  --
  signal keyboard_leds_state : std_logic_vector(2 downto 0) := "000";
  --
  -- Received mouse data
  --
  signal first_mouse_byte  : std_logic_vector(7 downto 0); -- recorded first byte of a mouse message
  signal second_mouse_byte : std_logic_vector(7 downto 0); -- recorded second byte of a mouse message
  signal third_mouse_byte  : std_logic_vector(7 downto 0); -- third byte of a mouse message (asynchronous signal)
  signal delta_x           : std_logic_vector(8 downto 0); -- raw mouse delta x value (asynchronous signal)
  signal delta_y           : std_logic_vector(8 downto 0); -- raw mouse delta y value (asynchronous signal)
  --
  -- State machine
  --
  type state_t is
  (
    restart,
    -- detection
    periodic_reset,
    wait_for_reset_acknowledge,
    wait_for_bat,
    wait_for_mouse_bat,
    -- keyboard
    enable_keyboard,
    wait_for_enable_keyboard_acknowledge,
    keyboard_wait_for_change,
    wait_for_keyboard_set_led_acknowledge,
    send_keyboard_set_led_data,
    wait_for_keyboard_set_led_data_acknowledge,
    -- mouse
    enable_mouse,
    wait_for_enable_mouse_acknowledge,
    wait_for_first_mouse_byte,
    wait_for_second_mouse_byte,
    wait_for_third_mouse_byte
  );                                                  -- possible states
  attribute syn_encoding : string;                    -- make sure the state machine recovers
  attribute syn_encoding of state_t : type is "safe"; --   from an illegal state
  signal state : state_t := periodic_reset;
begin
  --
  -- Low-level PS/2 controller
  --
  ll : entity work.low_level_ps2_controller(v1)
              generic map(clock_frequency => clock_frequency)
              port map(clock => clock,
                       ps2_clk => ps2_clk,ps2_dat => ps2_dat,
                       rxd_data => rxd_data,rxd_valid => rxd_valid,
                       txd_data => txd_data,txd_request => txd_request,txd_accepted => txd_accepted);
  --
  -- State machine combinational logic
  --
  third_mouse_byte <= rxd_data;
  delta_x <= first_mouse_byte(4) & second_mouse_byte;
  delta_y <= first_mouse_byte(5) & third_mouse_byte;
  --
  -- State machine update (very relaxed time out values)
  --
  process(clock) is
  begin
    if rising_edge(clock) then
      txd_request <= '0';                       -- by default, no request to send a byte of the PS/2 device
      valid_key_code <= '0';                    -- by default, no key code received
      valid_mouse_data <= '0';                  -- by default, no mouse data packet received
      if time_out_counter /= 0 then
        time_out_counter <= time_out_counter-1; -- by default, if the time out counter is not zero decrease it
      end if;
      case state is
        --
        -- Restart
        --
        when restart =>
          keyboard_detected <= '0';
          mouse_detected <= '0';
          keyboard_leds_state <= "000";
          state <= periodic_reset;
          time_out_counter <= number_of_clock_cycles(1.0); -- wait 1 second after a restart (or reset)
        --
        -- PS/2 device detection
        --
        when periodic_reset =>
          if time_out_counter = 0 then
            txd_data <= x"FF"; -- set reset command
            txd_request <= '1';
            if txd_accepted = '1' then
              state <= wait_for_reset_acknowledge;
              time_out_counter <= number_of_clock_cycles(1.0); -- wait 1 second for an acknowledge response
            end if;
          end if;
        when wait_for_reset_acknowledge =>
          if time_out_counter = 0 then
            state <= restart; -- reset command acknowledge did not arrive in time
          elsif rxd_valid = '1' and rxd_data = x"FA" then
            state <= wait_for_bat; -- keyboard or mouse detected (wait for the BAT)
            time_out_counter <= number_of_clock_cycles(1.0); -- the BAT must the received in no more than 1 second
          end if;
        when wait_for_bat =>
          if time_out_counter = 0 then
            state <= restart; -- the BAT did not arrive in time
          elsif rxd_valid = '1' and rxd_data = x"AA" then
            state <= wait_for_mouse_bat; -- the mouse BAT is x"AA" followed by x"00", the keyboard BAT is just x"AA"
            time_out_counter <= number_of_clock_cycles(0.1); -- the rest of the BAT, if any, must the received in no more than a tenth of a second
          end if;
        when wait_for_mouse_bat =>
          if time_out_counter = 0 then
            keyboard_detected <= '1'; -- the second mouse BAT byte did not arrive in time: infer keyboard
            state <= enable_keyboard;
            time_out_counter <= number_of_clock_cycles(1.0); -- must complete the enable keyboard command within 1 second
          elsif rxd_valid = '1' and rxd_data = x"00" then
            mouse_detected <= '1'; -- mouse BAT received
            state <= enable_mouse;
            time_out_counter <= number_of_clock_cycles(1.0); -- must complete the enable mouse command within 1 second
          end if;
        --
        -- Keyboard stuff
        --
        when enable_keyboard =>
          if time_out_counter = 0 then
            state <= restart; -- time out
          else
            txd_data <= x"F4"; -- enable command (not needed for a keyboard, but we do it anyway)
            txd_request <= '1';
            if txd_accepted = '1' then
              state <= wait_for_enable_keyboard_acknowledge;
            end if;
          end if;
        when wait_for_enable_keyboard_acknowledge =>
          if time_out_counter = 0 then
            state <= restart; -- the keyboard acknowledge did not arrive in time
          elsif rxd_valid = '1' and rxd_data = x"FA" then
            state <= keyboard_wait_for_change;
          end if;
        when keyboard_wait_for_change =>
          if rxd_valid = '1' then
            key_code <= rxd_data;
            valid_key_code <= '1';
          elsif keyboard_leds /= keyboard_leds_state then
            txd_data <= x"ED"; -- set/reset leds command
            txd_request <= '1';
            if txd_accepted = '1' then
              keyboard_leds_state <= keyboard_leds;
              state <= wait_for_keyboard_set_led_acknowledge;
              time_out_counter <= number_of_clock_cycles(1.0); -- must receive acknowledge within 1 second
            end if;
          end if;
        when wait_for_keyboard_set_led_acknowledge =>
          if time_out_counter = 0 then
            state <= restart; -- the reply did not arrive in time
          elsif rxd_valid = '1' and rxd_data = x"FA" then
            state <= send_keyboard_set_led_data;
          end if;
        when send_keyboard_set_led_data =>
          if time_out_counter = 0 then
            state <= restart; -- time out
          else
            txd_data <= "00000" & keyboard_leds_state; -- leds on/off data
            txd_request <= '1';
            if txd_accepted = '1' then
              state <= wait_for_keyboard_set_led_data_acknowledge;
            end if;
          end if;
        when wait_for_keyboard_set_led_data_acknowledge =>
          if time_out_counter = 0 then
            state <= restart; -- the acknowledge did not arrive in time
          elsif rxd_valid = '1' and rxd_data = x"FA" then
            state <= keyboard_wait_for_change;
          end if;
        --
        -- Mouse stuff
        --
        when enable_mouse =>
          if time_out_counter = 0 then
            state <= restart; -- time out
          else
            txd_data <= x"F4"; -- enable command (needed for a mouse)
            txd_request <= '1';
            if txd_accepted = '1' then
              state <= wait_for_enable_mouse_acknowledge;
            end if;
          end if;
        when wait_for_enable_mouse_acknowledge =>
          if time_out_counter = 0 then
            state <= restart; -- the mouse acknowledge did not arrive in time
          elsif rxd_valid = '1' and rxd_data = x"FA" then
            state <= wait_for_first_mouse_byte;
          end if;
        when wait_for_first_mouse_byte =>
          if rxd_valid = '1' and rxd_data(3) = '1' then
            first_mouse_byte <= rxd_data;
            state <= wait_for_second_mouse_byte;
            time_out_counter <= number_of_clock_cycles(0.1); -- must receive the other two bytes within 0.1 second
          end if;
        when wait_for_second_mouse_byte =>
          if time_out_counter = 0 then
            state <= restart; -- the second byte did not arrive in time
          elsif rxd_valid = '1' then
            second_mouse_byte <= rxd_data;
            state <= wait_for_third_mouse_byte;
          end if;
        when wait_for_third_mouse_byte =>
          if time_out_counter = 0 then
            state <= restart; -- the third byte did not arrive in time
          elsif rxd_valid = '1' then
            mouse_delta_x <= delta_x;
            mouse_delta_y <= delta_y;
            mouse_buttons <= first_mouse_byte(0) & first_mouse_byte(2) & first_mouse_byte(1); -- left & middle & right
            valid_mouse_data <= '1';
            state <= wait_for_first_mouse_byte;
          end if;
      end case;
      --
      -- Reset override
      --
      if reset = '1' then
        state <= restart;
      end if;
    end if;
  end process;
end v1;


----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LSD.TOS, March 2017 (DO NOT REMOVE THIS LINE)
--
-- Low level PS/2 keyboard and mouse controller (errors are silently ignored).
--

library ieee;
use     ieee.std_logic_1164.all;
use     ieee.numeric_std.all;

entity low_level_ps2_controller is
  generic
  (
    clock_frequency : real range 2.0e6 to 200.0e6 -- (in Hz) frequency of the clock signal
  );
  port
  (
    clock : in std_logic; -- main clock

    ps2_clk : inout std_logic; -- PS/2 clock line (open drain with pull-up resistor, output only '0' or 'Z')
    ps2_dat : inout std_logic; -- PS/2 data line (open drain with pull-up resistor, output only '0' or 'Z')

    rxd_data  : out std_logic_vector(7 downto 0); -- received data
    rxd_valid : out std_logic;                    -- valid received data pulse (active only during one clock cycle)

    txd_data     : in  std_logic_vector(7 downto 0); -- data to send
    txd_request  : in  std_logic;                    -- send request (must be asserted until txd_accepted is asserted)
    txd_accepted : out std_logic := '0'              -- send request accepted pulse (active only during one clock cycle)
  );
end low_level_ps2_controller;

architecture v1 of low_level_ps2_controller is
  --
  -- Sampled PS/2 clock and data signals
  --
  constant sampling_frequency : real range 200.0e3 to 500.0e3 := 400.0e3;  -- sampling frequency
  signal sampling_counter     : integer range 0 to integer(clock_frequency/sampling_frequency)-1 := 0;
  pure function number_of_pulses(elapsed_time : real range 10.0e-6 to 5.0e-3) return integer is -- used only for "compile time" evaluation of constants
  begin
    return integer(elapsed_time*sampling_frequency); -- conversion from time (in seconds) to number of pulses
  end number_of_pulses;
  signal ps2_clk_0 : std_logic := '1'; -- sampled ps2_clk
  signal ps2_clk_1 : std_logic := '1'; --   and its previous value
  signal ps2_dat_0 : std_logic := '1'; -- sampled ps2_dat
  signal ps2_dat_1 : std_logic := '1'; --   and its previous value
  --
  -- State machine
  --
  type state_t is
  (
    idle,                    -- nothing to do
    receiving,               -- receiving a byte
    interrupting,            -- applying the start condition
    sending,                 -- sending a byte
    waiting_for_acknowledge, -- waiting for an acknowledge
    finishing                -- applying the stop condition
  );                                                  -- possible states
  attribute syn_encoding : string;                    -- make sure the state machine recovers
  attribute syn_encoding of state_t : type is "safe"; --   from an illegal state
  signal state            : state_t := idle;
  signal data             : std_logic_vector(10 downto 0);                                           -- data to send or data received
  signal n_bits           : integer range 0 to 11;                                                   -- number of bits already decoded/sent
  signal idle_counter     : integer range 0 to number_of_pulses(1.0e-3) := number_of_pulses(1.0e-3); -- idle counter
  signal time_out_counter : integer range 0 to number_of_pulses(5.0e-3) := 0;                        -- time out counter
  signal start_bit        : std_logic;                                                               -- start bit send indicator
  --
  -- Parity bits
  --
  signal rxd_parity : std_logic; -- odd parity of the received data (asyncronous signal)
  signal txd_parity : std_logic; -- odd parity of the data to be sent (asyncronous signal)
begin
  assert (sampling_counter'high > 0) report "Bad sampling frequency" severity failure;
  assert false report "Sampling period = " & integer'image(sampling_counter'high) & " clock cycles" severity note;
  --
  -- Combinational logic
  --
  rxd_parity <= '1' xor data(2) xor data(3) xor data(4) xor data(5) xor data(6) xor data(7) xor data(8) xor data(9);
  txd_parity <= '1' xor txd_data(0) xor txd_data(1) xor txd_data(2) xor txd_data(3) xor txd_data(4) xor txd_data(5) xor txd_data(6) xor txd_data(7);
  --
  -- State machine
  --
  process(clock) is
  begin
    if rising_edge(clock) then
      --
      -- Things that have to be done every clock cycle
      --
      rxd_valid <= '0';                       -- by default, no received byte
      txd_accepted <= '0';                    -- by default, no byte accepted
      sampling_counter <= sampling_counter-1; -- by default, decrease the sampling counter
      --
      -- Sample PS/2 clock and data lines one clock cycle before we update the state machine
      -- Hopefully, this is slow enough to automatically debounce the PS/2 signals (glitches in the ps2_clk line will derail the state machine)
      --
      if sampling_counter = 1 then
        ps2_clk_0 <= ps2_clk;
        ps2_dat_0 <= ps2_dat;
        ps2_clk_1 <= ps2_clk_0;
        ps2_dat_1 <= ps2_dat_0;
      end if;
      --
      -- Things that are done one clock cycle after the sampling instants
      --
      if sampling_counter = 0 then
        ps2_clk <= 'Z'; -- by default, the PS/2 clock line is left in a high impedance state (port direction: in)
        ps2_dat <= 'Z'; -- by default, the PS/2 data line is left in a high impedance state (port direction: in)
        --
        -- Restart the sampling counter
        --
        sampling_counter <= sampling_counter'high;
        --
        -- Update the idle timer
        --
        if ps2_clk_0 = '0' or ps2_dat_0 = '0' then
          idle_counter <= idle_counter'high; -- not idle
        elsif idle_counter /= 0 then
          idle_counter <= idle_counter-1; -- count down
        end if;
        --
        -- Update the time out timer
        --
        if time_out_counter /= 0 then
          time_out_counter <= time_out_counter-1;
        end if;
        --
        -- State update
        -- * the period of ps2_clk should be about 80μs (can be as low as 60μs and as high as 100μs)
        -- * data sent by the PS/2 device: ps2_dat should change only when ps2_clk is high (device controls both data lines)
        -- * data sent to the PS/2 device: ps2_dat should change only when ps2_clk is low (mixed control of both data lines)
        --
        case state is
          when idle =>
            if ps2_clk_0 = '1' and ps2_dat_0 = '0' then
              -- start bit condition: the PS/2 device is going to send a byte
              state <= receiving;
              n_bits <= 0;
              time_out_counter <= number_of_pulses(500.0e-6); -- very liberal value (500μs)
            elsif txd_request = '1' and idle_counter = 0 then
              -- accept send request
              txd_accepted <= '1';
              state <= interrupting;
              n_bits <= 0;
              data <= '1' & txd_parity & txd_data & '0'; -- least significant bit sent first!
              time_out_counter <= number_of_pulses(200.0e-6); -- the interrupting state will last 200μs
            end if;
          when receiving =>
            --
            --       -------------+     +-----+     +-----+     +---   ...   ---+     +-----+     +-----+     +-----------
            --   CLK              +-----+     +-----+     +-----+      ...      +-----+     +-----+     +-----+
            --
            --       ----------+           +-----------+-----------+   ...   +-----------+-----------+-----------+--------
            --   DAT           +-----------+-----------+-----------+   ...   +-----------+-----------+
            --          idle     start bit     bit 0       bit 1                 bit 7     parity bit   stop bit    idle
            --
            --  when the stop
            -- bit is accepted    data(1)     data(2)     data(3)               data(9)     data(10)   ps2_dat_1
            --
            if time_out_counter = 0 then
              state <= idle; -- error
            elsif ps2_clk_0 = '1' and ps2_clk_1 = '0' then
              -- end of a bit ('0' to '1' transition on the clock line, ps2_dat_1 has the new bit)
              data <= ps2_dat_1 & data(10 downto 1); -- right shift
              n_bits <= n_bits+1;
              time_out_counter <= number_of_pulses(200.0e-6); -- very liberal value (200μs)
              if n_bits = 10 and data(1) = '0' and data(10) = rxd_parity and ps2_dat_1 = '1' then
                -- byte received with success
                rxd_data <= data(9 downto 2);
                rxd_valid <= '1';
                state <= idle;
              end if;
            end if;
          when interrupting =>
            --
            --        --------+     +-----+     +-----+     +---   ...   ---+     +-----+     +-----+     +-----+     +-----------
            --   CLK          +=====+     +-----+     +-----+      ...      +-----+     +-----+     +-----+     +-----+
            --
            --        -----------+           +===========+===========+   ...   +===========+===========+===========+     +--------
            --   DAT             +===========+===========+===========+   ...   +===========+===========+           +-----+
            --          idle       start bit     bit 0       bit 1                 bit 7     parity bit   stop bit   ack    idle
            --
            -- (=== means that the line is being driven by the FPGA)
            --
            -- drive ps2_clk low for 200μs to inhibit a PS/2 device transmission (very conservative time)
            -- at the same time, drive ps2_dat low after 150μs to get the attention of the PS/2 device
            --
            ps2_clk <= '0';
            if time_out_counter <= number_of_pulses(50.0e-6) then
              ps2_dat <= data(0); -- in the last 50μs of the interrupting state drive ps2_dat low (start bit)
            end if;
            if time_out_counter = 0 then
              state <= sending;
              time_out_counter <= number_of_pulses(5.0e-3); -- very liberal value (5ms)
              start_bit <= '1';
            end if;
          when sending =>
            ps2_dat <= data(0);
            if start_bit = '0' and time_out_counter = number_of_pulses(195.0e-6) then
              data <= '1' & data(10 downto 1); -- change the data line 5μs after a '1' to '0' transition on the clock line
              n_bits <= n_bits+1;
            end if;
            if time_out_counter = 0 then
              state <= idle; -- error
            elsif n_bits = 11 then
              state <= waiting_for_acknowledge;
            elsif ps2_clk_0 = '0' and ps2_clk_1 = '1' then
              -- end of a bit ('1' to '0' transition on the clock line)
              time_out_counter <= number_of_pulses(200.0e-6); -- very liberal value (200μs)
              start_bit <= '0';
            end if;
          when waiting_for_acknowledge =>
            if time_out_counter = 0 then
              state <= idle; -- error
            elsif ps2_clk_0 = '1' and ps2_clk_1 = '0' then
              if ps2_dat_1 = '0' then
                state <= finishing;
              else
                state <= idle; -- error
              end if;
            end if;
          when finishing =>
            if time_out_counter = 0 then
              state <= idle; -- error
            elsif ps2_dat_0 = '1' then
              state <= idle; -- all is well
            end if;
        end case;
      end if;
    end if;
  end process;
end v1;
