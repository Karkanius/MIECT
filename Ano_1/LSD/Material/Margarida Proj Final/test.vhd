library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity test is
	port(-- Clock and reset
		  CLOCK_50		: in    std_logic;
		  KEY				: in    std_logic_vector(0 downto 0);
		  SW				: in    std_logic_vector(11 downto 0);
		  -- Audio Serial Data Interface
		  AUD_ADCLRCK	: inout std_logic;
		  AUD_ADCDAT	: in    std_logic;
		  AUD_DACLRCK	: inout std_logic;
		  AUD_DACDAT	: out   std_logic;
		  AUD_BCLK		: inout std_logic;
		  AUD_XCK		: out   std_logic;
		  -- Audio I2C Configuration Interface
		  I2C_SCLK		: out   std_logic;
		  I2C_SDAT		: inout std_logic);
end test;

architecture Structural of test is

	-- Definition of the Audio Interface Module Black Box
	component AudioInterfaceCore is
		port(-- Clock and reset
			  CLOCK_50			: in    std_logic;
			  RESET_N			: in    std_logic;
			  -- Parallel Samples Interface (to/from client logic)
			  IN_SAMPLE_VALID	: out   std_logic;
			  CH_L_IN_SAMPLE	: out   std_logic_vector(15 downto 0);
			  CH_R_IN_SAMPLE	: out   std_logic_vector(15 downto 0);
			  OUT_SAMPLE_RQST	: out   std_logic;
			  CH_L_OUT_SAMPLE	: in    std_logic_vector(15 downto 0);
			  CH_R_OUT_SAMPLE	: in    std_logic_vector(15 downto 0);
			  -- Audio Serial Data Interface (to/from FPGA pins)
			  AUD_ADCLRCK		: inout std_logic;
			  AUD_ADCDAT		: in    std_logic;
			  AUD_DACLRCK		: inout std_logic;
			  AUD_DACDAT		: out   std_logic;
			  AUD_BCLK			: inout std_logic;
			  AUD_XCK			: out   std_logic;
			  -- Audio I2C Configuration Interface (to/from FPGA pins)
			  I2C_SCLK			: out   std_logic;
			  I2C_SDAT			: inout std_logic);
	end component;

	signal s_outSample	: std_logic_vector(15 downto 0);
	signal s_pos         : unsigned(3 downto 0);
	signal s_freq        : unsigned(8 downto 0);
	signal s_updatepos   : std_logic;

begin
	-- Instantiation of the Audio Interface Module
	audio_interface : AudioInterfaceCore
		port map(CLOCK_50				=> CLOCK_50,
					RESET_N				=> KEY(0),
					IN_SAMPLE_VALID	=> open,
					CH_L_IN_SAMPLE		=> open,
					CH_R_IN_SAMPLE		=> open,
					OUT_SAMPLE_RQST	=> open,
					CH_L_OUT_SAMPLE	=> s_outSample,
					CH_R_OUT_SAMPLE	=> s_outSample,
					AUD_ADCLRCK			=> AUD_ADCLRCK,
					AUD_ADCDAT			=> AUD_ADCDAT,
					AUD_DACLRCK			=> AUD_DACLRCK,
					AUD_DACDAT			=> AUD_DACDAT,
					AUD_BCLK				=> AUD_BCLK,
					AUD_XCK				=> AUD_XCK,
					I2C_SCLK				=> I2C_SCLK,
					I2C_SDAT				=> I2C_SDAT);
		
	clkf : entity work.clk_dsm(Behavioral)
		generic map(N=>26)
		port map(reset=>'0',divFactor=>std_logic_vector(5000000/("00000000000000000"&s_freq)),clkIn=>CLOCK_50,clkOut=>s_updatepos);
		
	rom : entity work.romA(Behavioral)
		port map(arg=>std_logic_vector(s_pos),val=>s_outSample);
	
	s_pos<=s_pos+1 when(rising_edge(CLOCK_50) and s_updatepos='1');
	
	with SW select s_freq<=
		to_unsigned(262,s_freq'length) when "000000000001", --C4
		to_unsigned(277,s_freq'length) when "000000000010", --Csharp4
		to_unsigned(294,s_freq'length) when "000000000100", --D4
		to_unsigned(311,s_freq'length) when "000000001000", --Dsharp4
		to_unsigned(329,s_freq'length) when "000000010000", --E4
		to_unsigned(349,s_freq'length) when "000000100000", --F4
		to_unsigned(370,s_freq'length) when "000001000000", --Fsharp4
		to_unsigned(392,s_freq'length) when "000010000000", --G4
		to_unsigned(415,s_freq'length) when "000100000000", --Gsharp4
		to_unsigned(440,s_freq'length) when "001000000000", --A4
		to_unsigned(466,s_freq'length) when "010000000000", --Asharp4
		to_unsigned(494,s_freq'length) when "100000000000", --B4
		to_unsigned(1,s_freq'length)   when others;
				
end Structural;
