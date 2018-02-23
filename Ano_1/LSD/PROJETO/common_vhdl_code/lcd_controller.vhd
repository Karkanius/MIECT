----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LSD.TOS, March 2017 (DO NOT REMOVE THIS LINE)
--
-- Custom LCD controller interface (write only, don't look at the busy signal, performs a reset initialization sequence)
--
-- Instead of waiting for the completion of an instruction by looking at the busy signal, after sending an instruction we wait a fixed amount of time for it
--   to complete (the LCD module data sheet specifies maximum times for each operation; to be safe, we use slightly more).
-- Dealing with the busy signal would have made the state machine more complex, because of the need to respect the hold time after a write cycle, and because
--   in the initial phases of the power-on sequence the busy signal is not available (the delay mechanism is therefore necessary, so we use it also later on
--   instead of looking at the busy signal). The price we pay is a slightly slower interface.
--

library ieee;
use     ieee.std_logic_1164.all;
use     ieee.numeric_std.all;
use     ieee.math_real.all; -- for the ceil() function, used only to compute constants at "compile" time

entity lcd_controller is
  generic
  (
    clock_frequency : real range 1.0e6 to 200.0e6 -- (in Hz) frequency of the clock signal
  );
  port
  (
    clock : in std_logic;
    reset : in std_logic := '0';

    lcd_on   : out   std_logic;
    lcd_blon : out   std_logic;
    lcd_rw   : out   std_logic;
    lcd_en   : out   std_logic;
    lcd_rs   : out   std_logic;
    lcd_data : inout std_logic_vector(7 downto 0);

    txd_rs_and_data : in std_logic_vector(8 downto 0);
    txd_request     : in std_logic;
    txd_accepted    : out std_logic
  );
end lcd_controller;

architecture v1 of lcd_controller is
  --
  -- Timers
  --
  pure function number_of_clock_cycles(elapsed_time : real range 0.0 to 100.0e3) return integer is -- used only for "compile time" evaluation of constants
  begin
    return integer(ceil(elapsed_time*clock_frequency)); -- conversion from time (in seconds) to number of clock cycles
  end number_of_clock_cycles;
  signal reset_counter  : integer range 0 to number_of_clock_cycles( 20.0e-3) := number_of_clock_cycles(20.0e-3); -- a reset lasts 20ms (our choice)
  signal enable_counter : integer range 0 to number_of_clock_cycles(300.0e-9); -- the (write) enable signal has to be asserted for at least 230ns
  signal delay_counter  : integer range 0 to number_of_clock_cycles( 20.0e-3);
  --
  -- State
  --
  type state_t is
  (
    power_on_phase1,
    power_on_phase2,
    power_on_phase3,
    power_on_phase4,
    power_on_phase5,
    power_on_phase6,
    power_on_phase7,
    power_on_phase8,
    process_txd_requests
  );                                                  -- possible states
  attribute syn_encoding : string;                    -- make sure the state machine recovers
  attribute syn_encoding of state_t : type is "safe"; --   from an illegal state
  signal state : state_t := power_on_phase1;          -- the state
begin
  lcd_blon <= '0'; -- this output pin does nothing useful on the DE2-115 board, so we keep it always at '0'
  process(clock) is
  begin
    if rising_edge(clock) then
      --
      -- Defaults for some signals
      --
      lcd_on <= '1';       -- LCD on
      lcd_rw <= '0';       -- write
      lcd_en <= '0';       -- not enabled (no write operation in progress)
      txd_accepted <= '0'; -- possible write request not accepted
      --
      -- Reset and timers
      --
      if reset = '1' or reset_counter /= 0 then
        state <= power_on_phase1;
        enable_counter <= 0; -- no write
        delay_counter <= number_of_clock_cycles(20.0e-3); -- nothing happens during 20ms after a reset
        lcd_on <= '0'; -- turn LCD off
        lcd_rw <= '1'; -- select read (but we don't read because lcd_en, by default, is '0')
        lcd_rs <= '0';
        lcd_data <= "ZZZZZZZZ";
        if reset = '1' then
          reset_counter <= reset_counter'high;
        else
          reset_counter <= reset_counter-1;
        end if;
      elsif enable_counter /= 0 then
        lcd_en <= '1'; -- write cycle in progress (this has to be be '1' for at least 230ns)
        enable_counter <= enable_counter-1;
      elsif delay_counter /= 0 then
        delay_counter <= delay_counter-1; -- to implement a delay after each write operation
      else
        --
        -- State update (this only happens when all counters are 0)
        --
        case state is
          --
          -- Our power-on sequence (see page 17 of the LCD module data sheet for the initial phases of the power-on sequence)
          --
          when power_on_phase1 =>
            state <= power_on_phase2;
            enable_counter <= enable_counter'high; -- write
            delay_counter <= number_of_clock_cycles(6.0e-3); -- wait 6ms after the write cycle
            lcd_rs <= '0';
            lcd_data <= "00110000"; -- function set instruction: DL=1 (interface is 8 bits long), N and F are don't cares
          when power_on_phase2 =>
            state <= power_on_phase3;
            enable_counter <= enable_counter'high; -- write
            delay_counter <= number_of_clock_cycles(150.0e-6); -- wait 150μs after the write cycle
            lcd_rs <= '0';
            lcd_data <= "00110000"; -- function set instruction: DL=1 (interface is 8 bits long), N and F are don't cares
          when power_on_phase3 =>
            state <= power_on_phase4;
            enable_counter <= enable_counter'high; -- write
            delay_counter <= number_of_clock_cycles(50.0e-6); -- the function set instruction requires at least 39μs
            lcd_rs <= '0';
            lcd_data <= "00111000"; -- function set instruction: DL=1 (interface is 8 bits long), N=1 (2 display lines), F=0 (5x8 characters)
          when power_on_phase4 =>
            state <= power_on_phase5;
            enable_counter <= enable_counter'high; -- write
            delay_counter <= number_of_clock_cycles(50.0e-6); -- the entry mode set instruction requires at least 39μs
            lcd_rs <= '0';
            lcd_data <= "00000110"; -- entry mode set instruction: I/D=1 (move cursor on writes), SH=0 (do not shift the display)
          when power_on_phase5 => -- ??? TOS: is this needed ???
            state <= power_on_phase6;
            enable_counter <= enable_counter'high; -- write
            delay_counter <= number_of_clock_cycles(50.0e-6); -- the cursor and display shift instruction requires at least 39μs
            lcd_rs <= '0';
            lcd_data <= "00010000"; -- cursor and display shift instruction: S/C=0 (do not shift on cursor), R/L=0 (shift direction is don't care, we use '0')
          when power_on_phase6 =>
            state <= power_on_phase7;
            enable_counter <= enable_counter'high; -- write
            delay_counter <= number_of_clock_cycles(50.0e-6); -- the display on/off control instruction requires at least 39μs
            lcd_rs <= '0';
            lcd_data <= "00001100"; -- display on/off control instruction: D=1 (display on), C=0 (cursor off), B=0 (cursor blinking off)
          when power_on_phase7 =>
            state <= power_on_phase8;
            enable_counter <= enable_counter'high; -- write
            delay_counter <= number_of_clock_cycles(1.8e-3); -- the clear display instruction requires at least 1.53ms
            lcd_rs <= '0';
            lcd_data <= "00000001"; -- clear display instruction
          when power_on_phase8 =>
            state <= process_txd_requests;
            enable_counter <= enable_counter'high; -- write
            delay_counter <= number_of_clock_cycles(1.8e-3); -- the return home instruction requires at least 1.53ms
            lcd_rs <= '0';
            lcd_data <= "00000010"; -- return home instruction
          when process_txd_requests =>
            if txd_request = '1' then
              txd_accepted <= '1';
              enable_counter <= enable_counter'high; -- write
              if txd_rs_and_data = "000000001" or txd_rs_and_data(8 downto 1) = "00000001" then
                delay_counter <= number_of_clock_cycles(1.8e-3);  -- for these instructions it is necessary to wait at least 1.53ms
              else
                delay_counter <= number_of_clock_cycles(60.0e-6); -- for all other instructions it is necessary to wait at least 43μs
              end if;
              lcd_rs <= txd_rs_and_data(8);
              lcd_data <= txd_rs_and_data(7 downto 0);
            end if;
        end case;
      end if;
    end if;
  end process;
end v1;
