library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity DuplicadorOitava is
	port(dataIn		: in  std_logic_vector(17 downto 0);
		  dataOut	: out std_logic_vector(17 downto 0));
end DuplicadorOitava;

architecture Behavioral of DuplicadorOitava is
	
begin
		dataOut <= std_logic_vector(2*unsigned(dataIn));
end Behavioral;
