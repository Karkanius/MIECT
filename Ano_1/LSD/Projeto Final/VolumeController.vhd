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
	signal PS, NS: TState;
	signal s_sound : std_logic_vector(6 downto 0);

	begin
	
	sync_proc: process(clk)
	begin
		if(rising_edge(clk)) then
			if (reset = '1') then
				PS <= Mute;
			else
				PS <= NS;
			end if;
		end if;
	end process;
	
	comb_proc: process(start, stop, s_sound, volume)
	begin
		case PS is
			when Mute =>
				s_sound <= "0101111";
				if (start = '1') then
					NS <= FadeIn;
				else
					NS <= Mute;
				end if;
			when FadeIn =>
				if (s_sound < volume) then
					s_sound <= std_logic_vector(unsigned(s_sound) + 1);
				else 
					NS <= Normal;
				end if;
			when Normal =>
				if (stop = '1') then
					NS <= FadeOut;
				else
					NS <= Normal;
				end if;
			when FadeOut =>
				if (s_sound < volume) then
					s_sound <= std_logic_vector(unsigned(s_sound) - 1);
				else 
					NS <= Mute;
				end if;
			when others =>
				NS <= Mute;
			end case;
		end process;
		
		sound <= s_sound;
end Behavioral;