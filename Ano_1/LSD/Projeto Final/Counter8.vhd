library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Counter8 is
	port(clk : in std_logic;
		  count : out std_logic_vector(7 downto 0));
end Counter8;

architecture Behavioral of Counter8 is
	signal s_count : unsigned(7 downto 0);
	begin
		process(clk)
		begin
			if (rising_edge(clk)) then
				if (s_count = "11111110") then
					s_count <= (others=>'0');
				else
					s_count <= s_count + 1;
				end if;
			end if;
		end process;
	count <= std_logic_vector(s_count);
end Behavioral;