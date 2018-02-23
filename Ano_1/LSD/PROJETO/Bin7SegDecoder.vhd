library ieee;
use ieee.std_logic_1164.all;

entity Bin7SegDecoder is
		port(binInput : in std_logic_vector(3 downto 0);
			  decOut_n : out std_logic_vector(6 downto 0));
end Bin7SegDecoder;

architecture Behavioral of Bin7SegDecoder is
begin
	decOut_n <= "1000110" when (binInput = "0000" or binInput = "1100") else -- Dó (com ou sem oitava)
					"0100001" when (binInput = "0001" or binInput = "0010" or binInput = "1101" or binInput = "1110") else -- Ré ou Réb (com ou sem oitava)
					"0000110" when (binInput = "0011" or binInput = "0100") else -- Mi ou Mib		
					"0001110" when (binInput = "0101") else -- Fá
					"0000010" when (binInput = "0110" or binInput = "0111") else -- Sol ou Solb
					"0001000" when (binInput = "1000"or binInput = "1001") else -- Lá ou Láb
					"0000011" when (binInput = "1010" or binInput = "1011") else -- Si ou Sib
					"1111111";
end Behavioral;