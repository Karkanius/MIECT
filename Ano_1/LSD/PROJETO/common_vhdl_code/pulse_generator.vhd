----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LSD.TOS, March 2017 (DO NOT REMOVE THIS LINE)
--
-- Generic pulse generator.
--
-- Pulses last one clock cycle.
-- After a reset, the first pulse occurs at the end of a pulse period.
--

library ieee;
use     ieee.std_logic_1164.all;
use     ieee.numeric_std.all;

entity pulse_generator is
  generic
  (
    clock_frequency : real range 1.0e6 to 200.0e6; -- (in Hz) frequency of the clock signal
    pulse_frequency : real range 0.1   to 200.0e6  -- (in Hz) frequency of the pulse signal
  );
  port
  (
    clock : in  std_logic;        -- main clock
    reset : in  std_logic := '0'; -- reset
    pulse : out std_logic         -- pulse signal (will be set to '1' at the pulse frequency)
  );
end pulse_generator;

architecture v1 of pulse_generator is
  --
  -- Number of clock cycles in one period of the pulse signal (rounded to the nearest integer)
  --
  constant period : integer := integer(clock_frequency/pulse_frequency);
  --
  -- Pulse generator state
  --
  signal phase : integer range 0 to period-1 := 0;
begin
  --
  -- make sure the generic parameters make sense
  --
  assert (period > 0) report "Bad pulse frequency" severity failure;
  assert false report "Pulse generator period = " & integer'image(period) & " clock cycles" severity note;
  --
  -- Generate the pulse signal
  --
  process(clock) is
  begin
    if rising_edge(clock) then
      if reset = '1' then
        phase <= 0;
        pulse <= '0';
      elsif phase = period-1 then
        phase <= 0;
        pulse <= '1';
      else
        phase <= phase+1;
        pulse <= '0';
      end if;
    end if;
  end process;
end v1;
