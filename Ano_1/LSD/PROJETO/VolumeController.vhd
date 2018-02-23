library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity VolumeController is
	port( start		: in std_logic;
			stop		: in std_logic;
			clk		: in std_logic;
			reset		: in std_logic;
			volume	: in std_logic_vector(6 downto 0);
			sound		: out std_logic_vector(6 downto 0) -- ver quantos bits
			);
end VolumeController;

architecture Behavioral of VolumeController is

	type TState is (FadeIn, Normal, FadeOut, Mute);
	signal S: TState := Mute;
	signal s_sound : std_logic_vector(6 downto 0);
	signal counter : integer:= 0;

	begin
	
	sync_proc: process(clk)
	begin
		if(rising_edge(clk)) then
			if (reset = '1') then
				S <= Mute;
			else
				case S is
					when Mute =>
						s_sound <= "0101111";
						if (start = '1') then
							S <= FadeIn;
						end if;
					when FadeIn =>
						if (unsigned(s_sound) < unsigned(volume)) and (counter = 50000) then
							s_sound <= std_logic_vector(unsigned(s_sound) + 1);
						else 
							S <= Normal;
						end if;
					when Normal =>
						if (stop = '1') then
							S <= FadeOut;
						end if;
					when FadeOut =>
						if (unsigned(s_sound) > 0) and (counter = 50000) then
							s_sound <= std_logic_vector(unsigned(s_sound) - 1);
						else 
							S <= Mute;
						end if;
					when others =>
						S <= Mute;
				end case;
				if (counter = 50000) then
					counter <= 0;
				else
					counter <= counter+1;
				end if;
			end if;
		end if;
	end process;
	sound <= s_sound;
end Behavioral;