----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LSD.TOS, March 2017 (DO NOT REMOVE THIS LINE)
--
-- This file contains three audio-related entities: audio_io, audio_controller, and audio_i2c_controller. Only the first two should be instantiated directly.
--
-- It is usually considered bad practice to put more than one entity in a single source file, but in this case the three entities that are declared in this
--   file are meant to be used together, so, as a matter of convenience to the user, they were put in the same file (she/he only has to import one file to the
--   project). Designs that instantiate the audio_controller entity also instantiate indirectly the audio_i2c_controller entity.
--


----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LSD.TOS, March 2017 (DO NOT REMOVE THIS LINE)
--
-- Audio input/output (send and receive audio samples)
--
-- To use this entity, read the right and left signals when valid is active, and place new data in right_out and left_out as soon as possible (a delay of 8μs
-- is perfectly acceptable), and keep it there until valid is activated again. So, the audio loop should be:
-- * wait until active is asserted
-- * when that happens, read left and right (the new ADC data from the left and right channels)
-- * compute the next left and right data to output, and put then in left_out and right_out (this should be done before active is asserted again, you have
--   about 10μs to do this)
-- * repeat
--
-- ADC means Analog to Digital Converter
-- DAC means Digital to Analog COnverter
-- CODEC means COder-DECoder
-- dB means decibels (for amplitudes, a gain of G corresponds to 20*log_10(G) decibels, so, for example, a gain of 10 corresponds to +20 dB)
--

library ieee;
use     ieee.std_logic_1164.all;
use     ieee.numeric_std.all;

entity audio_io is
  generic
  (
    clock_frequency : real range 40.0e6 to 200.0e6 -- (in Hz) frequency of the clock signal
  );
  port
  (
    clock    : in std_logic;  -- main clock
    clock_50 : in std_logic;  -- the 50MHz clock (used to generate aud_xck)

    aud_xck     : out std_logic; -- audio master clock (12.288Mhz, corresponding to a 48kHz sampling frequency, with a oversampling factor of 256)
    aud_bclk    : in  std_logic; -- audio bit clock (digital interface to the audio codec)
    aud_adclrck : in  std_logic; -- audio left/right start pulse
    aud_adcdat  : in  std_logic; -- serialized left/right channel ADC data [both changed on the falling edge of aud_bclk, serial to parallel]
    aud_dacdat  : out std_logic; -- serialized left/right channel DAC data [  conversion triggered by a '0' to '1' transition of aud_adclrck]

    from_left  : out std_logic_vector(15 downto 0); -- left channel sample received from the codec ADC (deserialized aud_adcdat)
    from_right : out std_logic_vector(15 downto 0); -- right channel sample received from the codec ADC (deserialized aud_adcdat)
    valid      : out std_logic;                     -- received data valid pulse (active only during one clock cycle)

    to_left  : in std_logic_vector(15 downto 0); -- data to send to the left channel  [new data should be put here no later than 10μs]
    to_right : in std_logic_vector(15 downto 0)  -- data to send to the right channel [      after the activation of the valid signal]
  );
end audio_io;

architecture v1 of audio_io is
  signal bit_clock_0       : std_logic;
  signal bit_clock_1       : std_logic;
  signal left_right_0      : std_logic;
  signal left_right_1      : std_logic;
  signal adc_data_0        : std_logic;
  signal dac_shift_control : std_logic;

  signal adc_data : std_logic_vector(31 downto 0);
  signal dac_data : std_logic_vector(31 downto 0);
  signal n_bits : integer range 0 to 32;
begin
  --
  -- In our fully synchronous design we sample the aud_bclk external clock (and other audio-related signals), which has a frequency of 64*48 kHz (page 38),
  --   so our own main clock has to be considerably faster than that (12x faster is more than enough). Make sure this is so.
  --
  assert (clock_frequency >= 12.0*64.0*48.0e3) report "Clock frequency too low" severity failure;
  --
  -- Generate aud_xck (the actual frequency is 12.289562 MHz = 73/297 * 50 MHz, which gives an audio sampling frequency of approximately 48.006 kHz)
  --
  c : entity work.clock_generator(cyclone4e)
             generic map(frequency => 256.0*48.0e3)
             port map(clock_50 => clock_50,new_clock => aud_xck);
  --
  -- Get the ADC data and send the DAC data (initialize dac_data when left_right goes high and shift one bit when bit_clock goes low)
  -- It takes about 10.4μs (32 aud_bclk cycles, each with a duration of 4/12.288 μs) to get the ADC data, so there is an interval of about 10μs
  --   (1000/48-10.4) before the data for the next ADC samples start to arrive.
  --
  -- See figure 30 (page 38), to see a time diagram of what is happening here.
  -- Data lines change when aud_bclk goes low, and the sample aud_adcdat when aud_bclk goes high (in the middle of a aud_bclk clock cycle).
  -- It is assumed that there are no glitches in the digital audio lines.
  --
  aud_dacdat <= dac_data(31);
  process(clock) is
  begin
    if rising_edge(clock) then
      --
      -- sample audio signals
      --
      bit_clock_0 <= aud_bclk;
      bit_clock_1 <= bit_clock_0;
      left_right_0 <= aud_adclrck;
      left_right_1 <= left_right_0;
      adc_data_0 <= aud_adcdat;
      --
      -- Receive/send the audio samples
      --
      valid <= '0';
      if bit_clock_0 = '1' and bit_clock_1 = '0' then
        -- when the bit clock rises ('0' to '1' transition) ...
        dac_shift_control <= '1';                       -- from now on, accept '1' to '0' transitions of bit_clock (to shift the DAC data)
        adc_data <= adc_data(30 downto 0) & adc_data_0; -- it would be better to do this on the other bit_clock edge, but this also works
        if n_bits = 31 then
          from_left <= adc_data(30 downto 15);              -- last bit received
          from_right <= adc_data(14 downto 0) & adc_data_0; --   transfer ADC data to
          valid <= '1';                                     --   output ports
        end if;
        if n_bits /= 32 then
          n_bits <= n_bits+1;
        end if;
      end if;
      if left_right_0 = '1' and left_right_1 = '0' then
        -- when the left-right signal rises ('0' to '1' transition) ...
        dac_data <= to_left & to_right; -- copy left and right data to the shift register serializer
        dac_shift_control <= '0';       -- do not accept '1' to '0' transitions of bit_clock (bit_clock may fall slightly later than left_right rises)
        n_bits <= 0;                    -- prepare to read the ADC data
      elsif dac_shift_control = '1' and bit_clock_0 = '0' and bit_clock_1 = '1' then
        dac_data <= dac_data(30 downto 0) & '0'; -- start transmitting a new bit
      end if;
    end if;
  end process;
end v1;


----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LSD.TOS, March 2017 (DO NOT REMOVE THIS LINE)
--
-- Audio controller interface (choose line-in ou mic in, volume. etc.)
--
-- To understand the commands sent to the audio codec (codec means coder-decoder) please consult the WM8731 data sheet.
-- All references (in VHDL comments) to the WM8731 data sheet are with respect to the Production Data, April 2009, Revision 4.8, version of the data sheet.
-- The functional block diagram of figure 9 (page 21), presents an overview of what the codec is able to do.
--
-- This entity only programs the audio codec. To actually receive and send sound samples, use the audio_io entity.
--

library ieee;
use     ieee.std_logic_1164.all;
use     ieee.numeric_std.all;

entity audio_controller is
  generic
  (
    clock_frequency : real range 40.0e6 to 200.0e6 -- (in Hz) frequency of the clock signal
  );
  port
  (
    clock : in std_logic; -- main clock
    reset : in std_logic;

    i2c_sclk : inout std_logic; -- serial clock line
    i2c_sdat : inout std_logic; -- serial data line

    use_line_in  : in std_logic;                    -- if '1' select the line-in input for the DAC
    line_in_gain : in std_logic_vector(4 downto 0); -- line-in ADC gain ("00000" is -34.5dB, "11111" is +12.0dB, steps of 1.5dB)

    use_mic   : in std_logic;                       -- if '1' (and if use_line_in is '0'), select the mic input for the DAC
    mic_boost : in std_logic;                       -- mic gain ('0' is 0dB, '1' is 20dB)

    line_bypass : in std_logic;                     -- if '1', line-in is added, with a gain of -6dB, directly to the output
    mic_bypass  : in std_logic;                     -- if '1', mic is added, with a gain of -6dB, directly to the output
    volume      : in std_logic_vector(6 downto 0)   -- output volume ("1111111" is +6dB, "0110000" is -73 dB, steps of -1dB, "0101111" or below is mute)
  );
end audio_controller;

architecture v1 of audio_controller is
  signal delay : integer range 0 to integer(0.001*clock_frequency) := integer(0.001*clock_frequency); -- initial 1ms delay before starting operations
  --
  -- Interface with the I2C controller (entity audio_i2c_controller, below in this source code file)
  --
  signal txd_data     : std_logic_vector(15 downto 0);
  signal txd_request  : std_logic := '0';
  signal txd_accepted : std_logic;
  --
  -- Current audio configuration
  --
  type audio_config_t is record
    use_line_in  : std_logic;
    line_in_gain : std_logic_vector(4 downto 0);
    use_mic      : std_logic;
    mic_boost    : std_logic;
    line_bypass  : std_logic;
    mic_bypass   : std_logic;
    volume       : std_logic_vector(6 downto 0);
  end record audio_config_t;
  constant default_config : audio_config_t := (use_line_in => '1',      -- use line-in
                                               line_in_gain => "11011", -- line-in gain at +6dB
                                               use_mic => '0',          -- do not use mic
                                               mic_boost => '0',        -- miv boost gain at 0dB
                                               line_bypass => '0',      -- no line-in bypass
                                               mic_bypass => '0',       -- no mic bypass (called sidetone in the WM8731 documentation)
                                               volume => "1100101");    -- output volume at -20dB
  signal current_config : audio_config_t := default_config;
  signal desired_config : audio_config_t;
  --
  -- Audio configuration state
  --
  signal state : integer range 0 to 9; -- see the code below for a description of what is happening at each state
begin
  --
  -- The I2C controller (specialized for this case)
  --
  i2c : entity work.audio_i2c_controller(v1)
               generic map(clock_frequency => clock_frequency)
               port map(clock => clock,
                        i2c_sclk => i2c_sclk,i2c_sdat => i2c_sdat,
                        txd_data => txd_data,txd_request => txd_request,txd_accepted => txd_accepted);
  --
  -- Process the desired audio configuration
  --
  process(clock) is
  begin
    if rising_edge(clock) then
      desired_config.use_line_in  <= use_line_in;
      desired_config.line_in_gain <= line_in_gain;
      desired_config.use_mic      <= use_mic and (not use_line_in); -- give preference to line-in
      desired_config.mic_boost    <= mic_boost;
      desired_config.line_bypass  <= line_bypass;
      desired_config.mic_bypass   <= mic_bypass;
      if unsigned(volume) >= "0110000" then
        desired_config.volume     <= volume;
      else
        desired_config.volume     <= "0101111"; -- mute (page 50)
      end if;
    end if;
  end process;
  --
  -- The state machine
  --
  process(clock) is
  begin
    if rising_edge(clock) then
      if reset = '1' then
        delay <= delay'high;
        current_config <= default_config;
        state <= 0;
      elsif delay /= 0 then
        delay <= delay-1;
      elsif txd_request = '1' and txd_accepted = '1' then
        txd_request <= '0';
        state <= state+1; -- advance to the next state
      else
        txd_data <= (others => '0'); -- default
        case state is
          when 0 => -- reset WM8731
            txd_data(15 downto 9) <= "0001111";  -- reset command; table 12 (page 34), and page 54
            txd_data(8 downto 0) <= "000000000"; --   write zeros to reset device
            txd_request <= '1';
          when 1 => -- digital audio path control
            txd_data(15 downto 9) <= "0000101"; -- table 6 (page 26), table 7 (page 27), and page 52
            txd_data(4) <= '0';                 --   clear DC offset
            txd_data(3) <= '0';                 --   disable soft mute
            txd_data(2 downto 1) <= "00";       --   no de-emphasis
            txd_data(0) <= '0';                 --   enable high-pass filter
            txd_request <= '1';
          when 2 => -- digital audio interface format (see figure 30, page 38, for a description about how the data is transfered)
            txd_data(15 downto 9) <= "0000111";  -- table 15 (page 39), table 16 (page 40), and page 53
            txd_data(7) <= '0';                  --   do not invert bclk
            txd_data(6) <= '1';                  --   master mode (audio codec generates the digital interface control signals); see figure 3 (page 16)
            txd_data(5) <= '0';                  --   left channel DAC first
            txd_data(4) <= '0';                  --   most significant bit is available on the first bclk rising edge after a daclrc rising edge
            txd_data(3 downto 2) <= "00";        --   16 bits
            txd_data(1 downto 0) <= "11";        --   DSP mode (frame sync + 2 data packed words)
            txd_request <= '1';
          when 3 => -- sampling control
            txd_data(15 downto 9) <= "0001000";  -- table 17 (page 41), and page 53
            txd_data(7) <= '0';                  --   clock out is core clock (irrelevant, as the corresponding pin is not used); table 14 (page 35)
            txd_data(6) <= '1';                  --   core clock is mclk divided by 2; table 13 (page 34)
            txd_data(5 downto 2) <= "0000";      --   48kHz with 256 oversampling factor (requires an external clock of 12.288 MHz, 12228 = 48*256)
            txd_data(1) <= '0';                  --   oversampling factor of 256
            txd_data(0) <= '0';                  --   normal mode (oversampling factor of 256)
            txd_request <= '1';
          when 4 => -- power down control (negative logic)
            txd_data(15 downto 9) <= "0000110"; -- table 26 (page 47), and page 52
            txd_data(7) <= '0';                 --   device power: on
            txd_data(6) <= '1';                 --   clock out power: off (pin not used)
            txd_data(5) <= '1';                 --   oscillator power: off (clock generated externally)
            txd_data(4) <= '0';                 --   line-out power: on
            txd_data(3) <= '0';                 --   DAC power: on
            txd_data(2) <= '0';                 --   ADC power: on
            txd_data(1) <= '0';                 --   mic power: on
            txd_data(0) <= '0';                 --   line-in power: on
            txd_request <= '1';
          when 5 => -- digital interface
            txd_data(15 downto 9) <= "0001001";  -- table 23 (page 45), and page 54
            txd_data(0) <= '1';                  --   activate digital interface
            txd_request <= '1';
          when 6 => -- analog audio path control
            txd_data(15 downto 9) <= "0000100";                                         -- page 51
            txd_data(7 downto 6) <= "00";                                               --   side tone attenuation of -6dB; table 11 (page 33)
            txd_data(5) <= current_config.mic_bypass;                                   --   side tone control (mic bypass); table 8 (page 29)
            txd_data(4) <= current_config.use_line_in or current_config.use_mic;        --   select dac control; table 8 (page 29)
            txd_data(3) <= current_config.line_bypass;                                  --   line-in bypass control; table 8 (page 29)
            txd_data(2) <= (not current_config.use_line_in) and current_config.use_mic; --   ADC control; table 5 (page 26)
            txd_data(1) <= not current_config.use_mic;                                  --   mic mute control (for the ADC only); table 4 (page 24)
            txd_data(0) <= current_config.mic_boost;                                    --   mic boost control; table 4 (page 24)
            txd_request <= '1';
          when 7 => -- line-in control (left and right channels programmed at the same time)
            txd_data(15 downto 9) <= "0000000";                  -- table 3 (page 22), and page 50
            txd_data(8) <= '1';                                  --   left and right channels programmed at the same time
            txd_data(7) <= not current_config.use_line_in;       --   line-in mute control (for the ADC only)
            txd_data(4 downto 0) <= current_config.line_in_gain; --   line-in amplification gain
            txd_request <= '1';
          when 8 => -- output volume control (left and right channels programmed at the same time)
            txd_data(15 downto 9) <= "0000010";            -- table 9 (page 31), and page 50
            txd_data(8) <= '1';                            --   left and right channels programmed at the same time
            txd_data(7) <= '1';                            --   change volume only at zero crossings (no "clicking" noise when changing the volume)
            txd_data(6 downto 0) <= current_config.volume; --   line-out (headphones) volume
            txd_request <= '1';
          when 9 => -- your wish is my command
            if   desired_config.use_line_in /= current_config.use_line_in or
                     desired_config.use_mic /= current_config.use_mic or
                   desired_config.mic_boost /= current_config.mic_boost or
                 desired_config.line_bypass /= current_config.line_bypass or
                  desired_config.mic_bypass /= current_config.mic_bypass then
              current_config <= desired_config;
              state <= 6;
            elsif desired_config.line_in_gain /= current_config.line_in_gain then
              current_config <= desired_config;
              state <= 7;
            elsif desired_config.volume /= current_config.volume then
              current_config <= desired_config;
              state <= 8;
            end if;
        end case;
      end if;
    end if;
  end process;
end v1;


----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LSD.TOS, March 2017 (DO NOT REMOVE THIS LINE)
--
-- Special I2C controller interface (single master, fixed address, write 2 bytes, no clock stretching, errors silently ignored).
--

library ieee;
use     ieee.std_logic_1164.all;
use     ieee.numeric_std.all;

entity audio_i2c_controller is
  generic
  (
    clock_frequency : real range 40.0e6 to 200.0e6 -- (in Hz) frequency of the clock signal
  );
  port
  (
    clock : in std_logic; -- main clock

    i2c_sclk : inout std_logic; -- serial clock line
    i2c_sdat : inout std_logic; -- serial data line

    txd_data     : in  std_logic_vector(15 downto 0); -- the 2 bytes to send
    txd_request  : in  std_logic;                     -- send request
    txd_accepted : out std_logic                      -- send request accepted pulse (active only during one clock cycle)
  );
end audio_i2c_controller;

architecture v1 of audio_i2c_controller is
  constant sclk_frequency : real range 100.0e3 to 500.0e3 := 250.0e3; -- (in Hz) the frequency of the I2C clock
  constant write_addr     : std_logic_vector(7 downto 0) := x"34";    -- I2C write address, 0x34 (last bit is '0' for writes), of the audio codec chip
  --
  -- State machine
  --
  -- i2c_sclk and i2c_sdat lines data (high logic level is 'Z', low logic level is '0', "+==+" means that the audio codec should drive the line low)
  --
  --                idle            start               stop              zero              one           acknowledge
  --
  --           +--+--+--+--+     +--+--+--+           +--+--+--+        +--+--+           +--+--+           +--+--+
  -- i2c_sclk                             |           |                 |     |           |     |           |     |
  --                                      +--+     +--+              +--+     +--+     +--+     +--+     +--+     +--+
  --
  --           +--+--+--+--+     +--+                       +--+                       +--+--+--+--+     +--+--+--+--+
  -- i2c_sdat                       |                       |
  --                                +--+--+--+     +--+--+--+        +--+--+--+--+                       +==+==+==+==+
  --
  -- Notes:
  -- * as per the I2C standard, the FPGA should not force a '1' logic level in the i2c_sclk and i2c_sdat lines (common-drain line drivers, wired-and); as
  --   these lines have pullup resistors, output 'Z' instead of '1'
  -- * after receiving each byte the audio codec sends an acknowledge bit (it puts the i2d_sdat line in the '0' state)
  --
  type state_t is
  (
    idle,
    start_condition, -- producing the start condition
    in_progress,     -- either sending a bit or receiving an acknowledge bit
    stop_condition   -- producing the stop condition
  );                                                  -- possible states
  attribute syn_encoding : string;                    -- make sure the state machine recovers
  attribute syn_encoding of state_t : type is "safe"; --   from an illegal state
  signal state : state_t := idle;
  signal data_to_write : std_logic_vector(26 downto 0); -- 7-bit address, 1 bit read/write command ('0' for writes), 2 bytes of data, 3 acknowledge bits
  signal n_bits : integer range 0 to 27 := 0;           -- number of bits to transmit (this includes the 3 acknowledge bits)
  signal phase   : integer range 0 to 3 := 0;                                              -- each 1-bit time interval has four phases
  signal counter : integer range 0 to integer(0.25*clock_frequency/sclk_frequency)-1 := 0; -- phase duration counter
  signal sampled_sdat : std_logic;                                                         -- state of the i2c_sdat line
begin
  --
  -- Drive the i2c_sclk and i2c_sdat lines
  --
  process(state,phase,data_to_write) is
  begin
    i2c_sclk <= 'Z'; -- default is high impedance
    i2c_sdat <= 'Z'; -- default is high impedance
    if state = start_condition then
      if phase = 3 then i2c_sclk <= '0'; end if;
      if phase /= 0 then i2c_sdat <= '0'; end if;
    elsif state = stop_condition then
      if phase = 0 then i2c_sclk <= '0'; end if;
      if phase /= 3 then i2c_sdat <= '0'; end if;
    elsif state = in_progress then
      if phase = 0 or phase = 3 then i2c_sclk <= '0'; end if;
      if data_to_write(26) = '0' then i2c_sdat <= '0'; end if;
    end if;
  end process;
  --
  -- State update
  --
  process(clock) is
  begin
    if rising_edge(clock) then
      txd_accepted <= '0';
      sampled_sdat <= i2c_sdat; -- sample the i2c_sdat line (to confirm an acknowledge)
      --
      -- State update
      --
      if state = idle then
        if txd_request = '1' then
          -- there is only one bus master (the FPGA), so there cannot be any activity in the I2C lines if the state is idle
          txd_accepted <= '1';
          data_to_write <= write_addr & '1' & txd_data(15 downto 8) & '1' & txd_data(7 downto 0) & '1'; -- the '1's are the acknowledge bits
          state <= start_condition;
          phase <= 0;
          counter <= 0;
          n_bits <= 27;
        end if;
      elsif counter /= counter'high then
        counter <= counter+1; -- the current phase is not over, so advance the counter (no clock stretching)
      else
        counter <= 0;
        if phase /= 3 then
          phase <= phase+1; -- not the last phase, so advance the next phase
        else
          phase <= 0; -- return to phase 0
          if state = start_condition then
            state <= in_progress; -- start sending bits
          elsif state = stop_condition then
            state <= idle; -- done!
          else
            data_to_write <= data_to_write(25 downto 0) & '1'; -- shift out one bit
            n_bits <= n_bits-1; -- one less bit to send
            if n_bits = 1 then
              state <= stop_condition; -- done with all the bits
            end if;
          end if;
        end if;
      end if;
      if state = in_progress and phase = 2 and counter = 0 and (n_bits = 1 or n_bits = 10 or n_bits = 19) and sampled_sdat = '1' then
        state <= idle; -- acknowledge bit not received (will not happen if there are no coding mistakes and if the hardware is functioning correctly)
      end if;
    end if;
  end process;
end v1;
