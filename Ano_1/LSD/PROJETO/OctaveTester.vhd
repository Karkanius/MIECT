library ieee;
use ieee.std_logic_1164.all;

entity OctaveTester is
port ( dataIn   : in std_logic_vector(3 downto 0);
		 isOctave : out std_logic);
end OctaveTester;

architecture Behavioral of OctaveTester is
begin

	process (dataIn)
	begin
		if (dataIn = "1111" or dataIn = "1110" or dataIn = "1101") then
			isOctave <= '1';
		else
			isOctave <= '0';
		end if;
	end process;
end Behavioral;