----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LSD.TOS, March 2017 (DO NOT REMOVE THIS LINE)
--
-- The sin_function entity computes an approximation to the sin function.
--
-- The argument of the sin function has 18 bits in a fixed point format, representing numbers between 0 and 2*pi*(2^18-1)/2^18, in steps of 2*pi/2^18.
-- The computed value is a 16-bit signed integer, with values between -32767 and +32767.
-- The entity is fully pipelined and was optimized for speed, with 5 pipeline stages, and has a maximum frequency of operation (Fmax) of at least 160 MHz.
--
-- It uses a dual port ROM with 512 entries and, for better precision, it performs linear interpolation between ROM entries. More precisely:
-- * the most significant bit of arg_0 gives the sign of the result (stored in the sign_1 signal)
-- * the next 9 bits (bits 16 to 8, stored in the addr_p_1 signal) determine which ROM positions to access: addr_p_1 and addr_q_1 = (addr_p_1 + 1) mod 512
-- * the 8 least significant bits or arg_0 determine the linear interpolation factors: factor_p = 1 - (arg_0 mod 256) / 256 and factor_q = 1 - factor_q; after
--   multiplying them by 256, they are stored in the 10-bit signed signals factor_p_1 and factor_q_1, which, if the sign of the result is negative, are
--   negated in a subsequent pipeline stage, giving rise to the signals factor_p_2 and factor_q_2
-- * the final result is given by the formula
--     (factor_p_2 * ROM[addr_p_1] + factor_q_2 * ROM[addr_q_1]) / 256
--

library ieee;
use     ieee.std_logic_1164.all;
use     ieee.numeric_std.all;
use     ieee.math_real.all; -- for the sin() function, used only to compute constants at "compile" time

entity sin_function is
  port
  (
    clock : in  std_logic;                     -- main clock
    arg_0 : in  std_logic_vector(17 downto 0); -- sin argument (an input of n corresponds to the angle 2*pi/2^18*n, interpreted as an unsigned integer)
    sin_5 : out std_logic_vector(15 downto 0)  -- sin value (available five clock cycles later, interpreted as a signed integer)
  );
end sin_function;

architecture v1 of sin_function is
  -- stage 1
  signal arg_frac_0x           : std_logic_vector(9 downto 0);       -- unregistered "fractional" part of arg_0
  constant one_frac            : signed(9 downto 0) := "0100000000"; -- the constant 1 (scaled)
  signal sign_1                : std_logic;                          -- the "sign" of arg_0
  signal addr_p_1  ,addr_q_1   : std_logic_vector(8 downto 0);       -- the ROM addresses
  signal factor_p_1,factor_q_1 : signed( 9 downto 0);                -- the scaled interpolation factors
  -- stage 2
  signal value_p_2 ,value_q_2  : std_logic_vector(15 downto 0);      -- the values read from the ROM
  signal factor_p_2,factor_q_2 : signed( 9 downto 0);                -- the scaled interpolation factors, sign corrected
  -- stage 3
  signal value_p_3 ,value_q_3  : std_logic_vector(15 downto 0);      -- one clock cycle delay of the signals of the previous pipeline stage (better Fmax!)
  signal factor_p_3,factor_q_3 : signed( 9 downto 0);                -- one clock cycle delat of the signals of the previous pipeline stage (better Fmax!)
  -- stage 4
  signal prod_p_4  ,prod_q_4   : signed(25 downto 0);                -- products of values and factors
  -- stage 5
  signal value_4x              : signed(25 downto 0);                -- unregistered scaled final result
  -- ROM
  subtype word_t is std_logic_vector(15 downto 0);
  type array_t is array(0 to 511) of word_t;
  pure function init_rom return array_t is
    variable tmp : array_t;
  begin
    for idx in 0 to 511 loop
      tmp(idx) := std_logic_vector(to_signed(integer(32767.499*sin(real(idx)*(math_pi/512.0))),16)); -- integer(real) rounds its real argument to integer!
    end loop;
    return tmp;
  end init_rom;
  signal rom : array_t := init_rom;
begin
  --
  -- Pipeline stage 0 -> 1 (compute the dual port ROM addresses and compute linear interpolation factors)
  --   propagation delay: 9-bit addition and 10-bit subtraction (not critical)
  --
  arg_frac_0x <= "00" & arg_0(7 downto 0); -- combinational logic (no clock here!)
  process(clock) is
  begin
    if rising_edge(clock) then
      sign_1 <= arg_0(17);
      addr_p_1 <= arg_0(16 downto 8);
      addr_q_1 <= std_logic_vector(unsigned(arg_0(16 downto 8))+1);
      factor_p_1 <= one_frac - signed(arg_frac_0x);
      factor_q_1 <= signed(arg_frac_0x);
    end if;
  end process;
  --
  -- Pipeline stage 1 -> 2 (access the dual port ROM and correct the sign of the interpolation factors)
  --   propagation delay: internal memory block access (may be critical)
  --
  process(clock) is
  begin
    if rising_edge(clock) then
      value_p_2 <= rom(to_integer(unsigned(addr_p_1)));
      value_q_2 <= rom(to_integer(unsigned(addr_q_1)));
      if sign_1 = '0' then
        factor_p_2 <= factor_p_1;
        factor_q_2 <= factor_q_1;
      else
        factor_p_2 <= -factor_p_1;
        factor_q_2 <= -factor_q_1;
      end if;
    end if;
  end process;
  --
  -- Pipeline stage 2 -> 3 (propagate values and factors)
  --   propagation delay: negligible (definitely not critical)
  --
  -- This stage exists to eliminate the propagation delay between a memory block and a DSP block
  -- Without it the Fmax of the entity decreases about 20MHz
  --
  process(clock) is
  begin
    if rising_edge(clock) then
      value_p_3 <= value_p_2;
      value_q_3 <= value_q_2;
      factor_p_3 <= factor_p_2;
      factor_q_3 <= factor_q_2;
    end if;
  end process;
  --
  -- Pipeline stage 3 -> 4 (multiply values and factors)
  --   propagation delay: 16-bit by 10-bit signed multiplication (may be critical)
  --
  process(clock) is
  begin
    if rising_edge(clock) then
      prod_p_4 <= factor_p_3 * signed(value_p_3);
      prod_q_4 <= factor_q_3 * signed(value_q_3);
    end if;
  end process;
  --
  -- Pipeline stage 4 -> 5 (add products and truncate the sum to get the final result)
  --   propagation delay: 26-bit addition (probably not critical)
  --
  value_4x <= prod_p_4 + prod_q_4; -- combinational logic (no clock here!)
  process(clock) is
  begin
    if rising_edge(clock) then
      sin_5 <= std_logic_vector(value_4x(23 downto 8)); -- it would be better to round the result, but truncation is easier, and faster, to implement
    end if;
  end process;
end v1;
