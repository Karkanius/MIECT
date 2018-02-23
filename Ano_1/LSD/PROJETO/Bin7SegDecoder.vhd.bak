library ieee;
use ieee.std_logic_1164.all;

entity Bin7SegDecoder is
		port(binInput : in std_logic_vector(3 downto 0);
			  decOut_n : out std_logic_vector(6 downto 0));
end Bin7SegDecoder;

architecture Behavioral of Bin7SegDecoder is
begin
	decOut_n <= "1000110" when (binInput = "0001" or binInput = "1101") else -- Dó (com ou sem oitava)
					"0100001" when (binInput = "0010" or binInput = "0011" or binInput = "1110" or binInput = "1111") else -- Ré ou Réb (com ou sem oitava)
					"0000110" when (binInput = "0100" or binInput = "0101") else -- Mi ou Mib		
					"0001110" when (binInput = "0110") else -- Fá
					"0000010" when (binInput = "0111" or binInput = "1000") else -- Sol ou Solb
					"0001000" when (binInput = "1001"or binInput = "1010") else -- Lá ou Láb
					"0000011" when (binInput = "1011" or binInput = "1100") else -- Si ou Sib
					"1111111";
end Behavioral;

-- ver lógica positiva/negativa