library ieee;
use ieee.std_logic_1164.all;

entity parking_phase2 is
	port( KEY    	: in std_logic_vector(0 downto 0);
			CLOCK_50	: in std_logic;
			LEDR   	: out std_logic_vector(1 downto 0);
			LEDG   	: out std_logic_vector(8 downto 8));
end parking_phase2;


architecture Shell of parking_phase2 is

signal s_key_start, s_pulseOut, s_clk_2hz: std_logic;

begin

t1: 	 entity work.timer(Behavioral)
			generic map(TIME_S => 10)	-- Time in seconds (10 s)
			port map(clk		=> CLOCK_50, 
						start		=> s_key_start,
						pulseOut_10	=> s_pulseOut,
						pulseOut_8	=> LEDR(1),
						pulseOut_1	=> LEDR(0));
						
f2: 	entity work.freqDivider(Behavioral)
			generic map(DIV_FACTOR => 25E6)
			port map( 	clkIn  => CLOCK_50,
							clkOut => s_clk_2hz);
	
	LEDG(8) <= s_pulseOut and s_clk_2hz;
	s_key_start<= not KEY(0);

	
end Shell;