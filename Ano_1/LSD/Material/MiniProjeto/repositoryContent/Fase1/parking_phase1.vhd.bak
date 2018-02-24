library ieee;
use ieee.std_logic_1164.all;

entity parking_Phase1 is
	port( KEY 		: in std_logic_vector(0 downto 0);
			LEDR		: out std_logic_vector(0 downto 0);
			LEDG		: out std_logic_vector(8 downto 8);
			CLOCK_50	: in std_logic);
end parking_Phase1;


architecture Shell of parking_Phase1 is
	signal s_clk_2hz, s_pulseOut : std_logic;
begin

t1:	entity work.timer(Behavioral)
			generic map(TIME_S => 10)	-- Time in seconds (10 s)
			port map(clk		=> CLOCK_50, 
						reset 	=> '0',
						start		=> not KEY(0),
						pulseOut	=> s_pulseOut);

f1:	entity work.freqDivider(Behavioral)
			generic map(DIV_FACTOR => 25E6)	-- fout is 50E6 / 25E6 = 2Hz
			port map(clkIn		=> CLOCK_50,
						clkOut	=> s_clk_2hz);

		LEDR(0) <= s_pulseOut;
		LEDG(8) <= s_pulseOut and s_clk_2hz;
end Shell;
