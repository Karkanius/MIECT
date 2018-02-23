library ieee;
use ieee.std_logic_1164.all;

entity OctaveCreation is

port( dataIn  : in std_logic_vector(15 downto 0);
		dataOut : out std_logic_vector(15 downto 0));
end OctaveCreation;

architecture Behavioral of OctaveCreation is
begin
	dataOut <= dataIn(14 downto 0) & '0';
end Behavioral;