----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LSD.TOS, March 2017 (DO NOT REMOVE THIS LINE)
--
-- Generic debouncer with extra pulsed level change detectors (when instantiating this entity the output signals that are not needed can be left open).
--
-- This debouncer does not work properly when the dirty signal is full of noise (glitches). We will not encounter these situations in LSD.
-- TO DO: for long time windows sample the dirty input signal at regular intervals say, 5 times, and use a majority rule to produce the output.
--

library ieee;
use     ieee.std_logic_1164.all;
use     ieee.numeric_std.all;

entity debouncer is
  generic
  (
    clock_frequency : real range 1.0e6 to 200.0e6; -- (in Hz) frequency of the clock signal
    window_duration : real range 0.0 to 0.1;       -- (in seconds) the input signal has to be stable during this time for the output signal to change
    initial_level   : std_logic := '0'             -- the initial state of the debouncer
  );
  port
  (
    clock : in std_logic; -- main clock

    dirty             : in  std_logic;        -- signal to be debounced
    clean             : out std_logic;        -- debounced signal (warning: delay of at least window_duration seconds)
    zero_to_one_pulse : out std_logic := '0'; -- '0' to '1' transition pulse (warning: delay of window_duration seconds)
    one_to_zero_pulse : out std_logic := '0'  -- '1' to '0' transition pulse (warning: delay of window_duration seconds)
  );
end debouncer;

architecture v1 of debouncer is
  --
  -- Sampled input signal (must be done if the input signal comes directly from a FPGA pin)
  --
  signal sampled_dirty : std_logic := initial_level;
  --
  -- Current debouncer output
  --
  signal level : std_logic := initial_level;
  --
  -- Timer
  --
  constant timer_limit : integer := integer(clock_frequency*window_duration); -- for very small window durations this will be zero (no debouncing)
  signal timer_counter : integer range 0 to timer_limit := 0;
begin
  clean <= level;
  process(clock) is
  begin
    if rising_edge(clock) then
      sampled_dirty <= dirty;
      zero_to_one_pulse <= '0';
      one_to_zero_pulse <= '0';
      if sampled_dirty = level then
        timer_counter <= timer_limit; -- reinitialize the timer counter
      elsif timer_counter /= 0 then
        timer_counter <= timer_counter-1; -- inside the transition window (decrease the timer counter)
      else
        level <= sampled_dirty; -- new stable input level
        timer_counter <= timer_limit; -- initialize the timer counter
        if sampled_dirty = '1' then
          zero_to_one_pulse <= '1'; -- produce '0' to '1' pulse
        else
          one_to_zero_pulse <= '1'; -- produce '1' to '0' pulse
        end if;
      end if;
    end if;
  end process;
end v1;
