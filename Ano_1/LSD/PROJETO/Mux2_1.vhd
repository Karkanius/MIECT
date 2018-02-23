library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MUX2_1 is
	generic (N: positive:= 4);
	port(dataIn0, dataIn1	: in  std_logic_vector(N-1 downto 0);
		  dataOut				: out std_logic_vector(N-1 downto 0);
		  sel						: in	std_logic);
end MUX2_1;

architecture Behavioral of MUX2_1 is

begin
	process (sel, dataIn1, dataIn0)
	begin
		if (sel ='1') then
			dataOut <= dataIn1;
		else
			dataOut <= dataIn0;
		end if;
	end process;
end Behavioral;
