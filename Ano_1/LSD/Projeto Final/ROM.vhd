library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity ROM is
	port(address	: in  std_logic_vector(3 downto 0);
		  freqOut	: out std_logic_vector(15 downto 0));
end ROM;

architecture Behavioral of ROM is
	
	type freq is array (0 to 11) of integer;
	constant notas : freq := (	26165,	--Dó
										27720,	--Ré b
										29365,	--Ré
										31115,	--Mi b
										32965,	--Mi
										34925,	--Fá
										37000,	--Sol b
										39200,	--Sol
										41530,	--Lá b
										44000,	--Lá
										46620,	--Si b
										49390);	--Si
begin
	freqOut <= std_logic_vector(to_signed(notas(to_integer(unsigned(address))), 16)); --(100/256)x a velocidade a que deve ser lida a onda
end Behavioral;
