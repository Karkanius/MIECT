----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LSD.TOS, March 2017 (DO NOT REMOVE THIS LINE)
--
-- Infrared remote command decoder (NEC protocol).
--
-- The terasIC infrared remote control unit sends the following codes:
--
--  +----------------+----------------+----------------+----------------+
--  | <A>            | <B>            | <C>            | <power>        |
--  | x"F0_0F_6B_86" | x"EC_13_6B_86" | x"EF_10_6B_86" | x"ED_12_6B_86" |
--  +----------------+----------------+----------------+----------------+
--  | <1>            | <2>            | <3>            | <channel up>   |
--  | x"FE_01_6B_86" | x"FD_02_6B_86" | x"FC_03_6B_86" | x"E5_1A_6B_86" |
--  +----------------+----------------+----------------+----------------+
--  | <4>            | <5>            | <6>            | <channel down> |
--  | x"FB_04_6B_86" | x"FA_05_6B_86" | x"F9_06_6B_86" | x"E1_1E_6B_86" |
--  +----------------+----------------+----------------+----------------+
--  | <7>            | <8>            | <9>            | <volume up>    |
--  | x"F8_07_6B_86" | x"F7_08_6B_86" | x"F6_09_6B_86" | x"E4_1B_6B_86" |
--  +----------------+----------------+----------------+----------------+
--  | <menu>         | <0>            | <return>       | <volume down>  |
--  | x"EE_11_6B_86" | x"FF_00_6B_86" | x"E8_17_6B_86" | x"E0_1F_6B_86" |
--  +----------------+----------------+----------------+----------------+
--  | <play>         | <adjust left>  | <adjust right> | <mute>         |
--  | x"E9_16_6B_86" | x"EB_14_6B_86" | x"E7_18_6B_86" | x"F3_0C_6B_86" |
--  +----------------+----------------+----------------+----------------+
--
-- NEC format --- 16 remote ID code bits + 8+8(inverted) command code bits
--            --- 107.9ms between transmissions
--   idle ------- high (logic levels for the DE2-115 board)
--   start ------ 8.99ms low followed by 4.64ms high
--   0 bit ------ 0.56ms low followed by 0.60ms high
--   1 bit ------ 0.56ms low followed by 1.76ms high
--   repeat ----- 8.99ms low followed by 2.32ms high followed by 0.60ms low [NOT DECODED]
--

library ieee;
use     ieee.std_logic_1164.all;
use     ieee.numeric_std.all;

entity ir_nec_decoder is
  generic
  (
    clock_frequency : real range 1.0e6 to 200.0e6 -- (in Hz) frequency of the clock signal
  );
  port
  (
    clock : in std_logic; -- main clock

    irda_rxd : in std_logic; -- received infrared signal

    data  : out std_logic_vector(31 downto 0); -- decoded received data (the least significant bit is the first received bit)
                                               --   bits 31 downto 24: not command, bits 23 downto 16: command, bits 15 downto 0: remote ID code
    valid : out std_logic := '0'               -- valid data pulse (active only during one clock cycle)
  );
end ir_nec_decoder;

architecture v1 of ir_nec_decoder is
  signal pulse_10kHz                 : std_logic;                     -- 10 kHz pulse
  signal rxd_0,rxd_1                 : std_logic;                     -- sampled irda_rxd
  signal n_bits_0,n_bits_0x,n_bits_1 : integer range 0 to 33;         -- number of bits already decoded
  signal data_0,data_0x              : std_logic_vector(31 downto 0); -- decoded data
  signal count_0,count_0x            : integer range 0 to 120;        -- number or 0.1ms pulses with ir_data at the same value
begin
  p : entity work.pulse_generator(v1)
             generic map(clock_frequency => clock_frequency,pulse_frequency => 10.0e3)
             port map(clock => clock,reset => '0',pulse => pulse_10kHz);
  --
  -- Slow time (10 kHz) state machinery, using two processes (sequential logic for the state, combinational logic for the state update)
  --
  process(clock,pulse_10kHz) is
  begin
    if rising_edge(clock) and pulse_10kHz = '1' then
      -- sample irda_rxd
      rxd_0    <= irda_rxd;
      rxd_1    <= rxd_0;
      -- state update
      n_bits_0 <= n_bits_0x;
      data_0   <= data_0x;
      count_0  <= count_0x;
    end if;
  end process;
  process(rxd_0,rxd_1,n_bits_0,data_0,count_0) is
  begin
    if rxd_0 = rxd_1 then
      -- no change of logic level
      if count_0 < 120 then
        -- normal operation (counting the duration of a '0' or a '1' pulse)
        n_bits_0x <= n_bits_0;
        data_0x   <= data_0;
        count_0x  <= count_0+1;
      else
        -- pulse too long, reset state machine
        n_bits_0x <= 0;
        data_0x   <= (others => '0');
        count_0x  <= 0;
      end if;
    else
      -- change of logic level
      if (n_bits_0  = 0 and rxd_1 = '0' and (count_0 < 70 or count_0 > 110)) or   -- start bit,  low state (7.0ms <= T <= 11.0ms)
         (n_bits_0  = 0 and rxd_1 = '1' and (count_0 < 25 or count_0 >  65)) or   -- start bit, high state (2.5ms <= T <=  6.5ms)
         (n_bits_0 /= 0 and rxd_1 = '0' and (count_0 <  3 or count_0 >  10)) or   -- data  bit,  low state (0.3ms <= T <=  1.0ms)
         (n_bits_0 /= 0 and rxd_1 = '1' and (count_0 <  3 or count_0 >  22)) then -- data  bit, high state (0.3ms <= T <=  2.2ms)
        -- pulse too short or too long, reset state machine
        n_bits_0x <= 0;
        data_0x   <= (others => '0');
        count_0x  <= 0;
      elsif rxd_1 = '0' then
        -- ok, no information here, just reset counter
        n_bits_0x <= n_bits_0;
        data_0x   <= data_0;
        count_0x  <= 0;
      else
        -- ok, new bit
        n_bits_0x <= n_bits_0+1;
        if count_0 < 12 then
          data_0x <= '0' & data_0(31 downto 1);
        else
          data_0x <= '1' & data_0(31 downto 1);
        end if;
        if n_bits_0 < 32 then
          count_0x <= 0;
        else
          count_0x <= 120; -- force a state machine reset on the next 10 kHz pulse (the stop bit is ignored)
        end if;
      end if;
    end if;
  end process;
  --
  -- Fast time state machinery (generate output signals)
  --
  process(clock) is
  begin
    if rising_edge(clock) then
      n_bits_1 <= n_bits_0;
      if n_bits_0 = 33 and n_bits_1 = 32 then
        valid <= '1';
        data <= data_0(31 downto 0);
      else
        valid <= '0';
      end if;
    end if;
  end process;
end v1;
