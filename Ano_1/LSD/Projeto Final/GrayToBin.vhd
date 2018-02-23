library ieee;
use ieee.std_logic_1164.all;

entity GrayToBin is
port( dataIn  : in std_logic_vector(3 downto 0);
		dataOut : out std_logic_vector(3 downto 0));
end GrayToBin;

architecture Behavioral of GrayToBin is
begin

with dataIn select
	dataOut <=  "0000" when "0000",
					"0001" when "0001", 
					"0010" when "0011",
					"0011" when "0010",
					"0100" when "0110",
					"0101" when "0111",
					"0110" when "0101",
					"0111" when "0100",
					"1000" when "1100",
					"1001" when "1101",
					"1010" when "1111",
					"1011" when "1110",
					"1100" when "1010",
					"0000" when others;
					
end Behavioral;