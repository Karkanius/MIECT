--Esta vai ser a top-level
--
--A arquitetura vai ser do tipo Shell
--Vai instanciar todas as outras entidades

library ieee;
use     ieee.std_logic_1164.all;
use     ieee.numeric_std.all;


entity AudioSynth is
	port(	CLOCK_50 	: in std_logic;
			HEX0			: out std_logic_vector(6 downto 0);
			HEX1			: out std_logic_vector(6 downto 0);
			
			i2c_sclk 	: inout std_logic;
			i2c_sdat 	: inout std_logic;

			aud_xck    	: out std_logic;
			aud_bclk   	: in  std_logic;
			aud_adclrck	: in  std_logic;
			aud_adcdat 	: in  std_logic;
			aud_dacdat 	: out std_logic;
			ps2_clk		: inout std_logic;
			ps2_dat		: inout std_logic
			
			---outras entradas e saídas
			);
end AudioSynth;

architecture Shell of AudioSynth is
	constant clock_frequency: real := 50.0e6;
	constant sin_arg_increment : integer := integer(2.0**18*1.0e3/48.0e3);
--sinais a declarar
--mais sinais
	signal freq_ROMtoMUX0				:	std_logic_vector(15 downto 0);
	signal freq_ROMtoMUX1				:	std_logic_vector(15 downto 0);
	signal freq_MUXtoSIN					:	std_logic_vector(15 downto 0);
	signal to_left, to_right			:	std_logic_vector(15 downto 0);
	signal s_isOctave       			:  std_logic;
	signal bemol							: 	std_logic;
	signal s_SINtoAUDIO					:  std_logic_vector(15 downto 0);
	signal audio_pulse					:  std_logic;
	signal clock							:  std_logic;
	signal key_code,last_key_code 	:  std_logic_vector(7 downto 0);
   signal new_key_code 					:  std_logic;
	signal s_dados_do_ps2				:  std_logic_vector(3 downto 0);
	signal start_sound, stop_sound	:  std_logic;
	signal s_volume						:  std_logic_vector(6 downto 0) := "1100000";
	signal s_sound							:	std_logic_vector(6 downto 0);
	signal ContadorTempo					:	std_logic_vector(7 downto 0);

begin

	clock <= clock_50;

	-- tudo o que tiver o comentário "teclado" necessita de alteração.

	ROM_FREQ:		entity work.ROM (Behavioral)
						port map (	address =>	s_dados_do_ps2,
										freqOut =>	freq_ROMtoMUX0);
	
	ROM_SIN:			entity work.ROM_sin (Behavioral)
						port map (	address =>	ContadorTempo,			--aqui não pode ser os dados ps2, basta-nos que seja
																					--um contador qq que vá alternando entre os diferentes valores
										sin_out =>	freq_ROMtoMUX0);
							
							
	MudaOitava :	entity work.OctaveCreation (Behavioral) -- mudei para aquele modificador de oitava que tinha criado. Ver dps a melhor forma de fazer isto
						port map (	dataIn	=> freq_ROMtoMUX0,
										dataOut	=> freq_ROMtoMUX1);
	
--	Sin :				entity work.sin_function (v1)
--						port map (	clock =>	clock,
--										arg_0 =>	freq_MUXtoSIN, -- sin_arg
--										sin_5 =>	s_SINtoAUDIO); -- sin_val
										
	MuxOitava:	   entity work.Mux2_1(Behavioral)  -- escolhe entre haver ou não oitava
						generic map(N => 16)
						port map( dataIn0 => freq_ROMtoMUX0, -- ligação da saída da ROM com a entrada do Mux
									 dataIn1 => freq_ROMtoMUX1, -- o mesmo de cima, mas a passar pelo Duplicador
									 sel  	=> s_isOctave,     -- ligação ao testador de oitava
									 dataOut => freq_MUXtoSIN); -- ligação ao SinFunction
									 
	TestaOitava:   entity work.OctaveTester(Behavioral)
						port map( dataIn   => s_dados_do_ps2, -- teclado
									 isOctave => s_isOctave);

									 
	Display1:		entity work.Bin7SegDecoder(Behavioral)
						port map( binInput => s_dados_do_ps2, -- teclado 
									 decOut_n => HEX1);
	
	Display0:		entity work.Mux2_1(Behavioral)
						generic map(N => 7)
						port map( dataIn0 => (others => '1'), -- nao tenho a certeza se é assim
									 dataIn1 => "0000011",
									 sel 		=>  bemol,
									 dataOut => HEX0);
									 
	aio:				entity work.audio_io(v1)
						generic map(clock_frequency => clock_frequency)
						port map( clock 		 => clock,
									 clock_50 	 => clock_50,
									 aud_xck 	 => aud_xck, 
									 aud_bclk 	 => aud_bclk,
									 aud_adclrck => aud_adclrck, 
									 aud_adcdat  => aud_adcdat,
									 aud_dacdat  => aud_dacdat,
									 from_left   => open,
									 from_right  => open,
									 valid 		 => audio_pulse,  -- em principio convém mudar o nome do sinal
									 to_left 	 => to_left,
									 to_right 	 => to_right);
									 
									 
	process(clock) is
	begin
    if rising_edge(clock) then
      if audio_pulse = '1' then
        freq_MUXtoSIN <= std_logic_vector(unsigned(freq_MUXtoSIN) + sin_arg_increment);
      end if;
    end if;
	end process;
	to_left  <= s_SINtoAUDIO;
	to_right <= s_SINtoAUDIO;			


	
									 
	ac:				entity work.audio_controller(v1)
						generic map(clock_frequency => clock_frequency)
						port map( clock 			=> clock, 
									 reset 			=> '0',
									 i2c_sclk		=> i2c_sclk,
									 i2c_sdat		=> i2c_sdat,
									 use_line_in	=> '1',
									 line_in_gain	=> "10000",
									 use_mic   		=> '0',
									 mic_boost		=> '0',
									 line_bypass	=> '0',
									 mic_bypass		=> '0',
									 volume			=> s_sound); -- está ligado ao volume controller
	
	
	process(s_dados_do_ps2)
	begin
		if (s_dados_do_ps2 = "0010" or s_dados_do_ps2 = "0100" or s_dados_do_ps2 = "0111"
				or s_dados_do_ps2 = "1001" or s_dados_do_ps2 = "1011" or s_dados_do_ps2 = "1110") then
			bemol <= '1';
		else
			bemol <= '0';
		end if;
	end process;
	
	ps2 : 			entity work.ps2_controller(v1)
								generic map(clock_frequency => clock_frequency)
								port map(clock => clock,reset => '0',
											ps2_clk => ps2_clk,ps2_dat => ps2_dat,
											keyboard_detected => open,keyboard_leds => "000",
											key_code => key_code,valid_key_code => new_key_code,
											mouse_detected => open,
											mouse_delta_x => open,mouse_delta_y => open,mouse_buttons => open,valid_mouse_data => open);
	
	
	process(clock) is
	begin
		if rising_edge(clock) then
			if new_key_code = '1' then
				last_key_code <= key_code;
				if key_code = x"1C" then 				-- a
					if last_key_code /= x"F0"then
						s_dados_do_ps2 <= "0001";
						start_sound <= '1';
						stop_sound <= '0';
					else
						s_dados_do_ps2 <= "0000";
						start_sound <= '0';
						stop_sound <= '1';
					end if;
				end if;
				if key_code = x"1D" then				-- w
					if last_key_code/= x"F0" then
						s_dados_do_ps2 <= "0010";
						start_sound <= '1';
						stop_sound <= '0';
					else
						s_dados_do_ps2 <= "0000";
						start_sound <= '0';
						stop_sound <= '1';
					end if;
				end if;
				if key_code = x"1B" then				-- s
					if last_key_code/= x"F0" then
						s_dados_do_ps2 <= "0011";
						start_sound <= '1';
						stop_sound <= '0';
					else
						s_dados_do_ps2 <= "0000";
						start_sound <= '0';
						stop_sound <= '1';
					end if;
				end if;
				if key_code = x"24" then				-- e
					if last_key_code/= x"F0" then
						s_dados_do_ps2 <= "0100";
						start_sound <= '1';
						stop_sound <= '0';
					else
						s_dados_do_ps2 <= "0000";
						start_sound <= '0';
						stop_sound <= '1';
					end if;
				end if;
				if key_code = x"23" then				-- d
					if last_key_code/= x"F0" then
						s_dados_do_ps2 <= "0101";
						start_sound <= '1';
						stop_sound <= '0';
					else
						s_dados_do_ps2 <= "0000";
						start_sound <= '0';
						stop_sound <= '1';
					end if;
				end if;
				if key_code = x"2B" then				-- f
					if last_key_code/= x"F0" then
						s_dados_do_ps2 <= "0110";
						start_sound <= '1';
						stop_sound <= '0';
					else
						s_dados_do_ps2 <= "0000";
						start_sound <= '0';
						stop_sound <= '1';
					end if;
				end if;
				if key_code = x"2C" then				-- t
					if last_key_code/= x"F0" then
						s_dados_do_ps2 <= "0111";
						start_sound <= '1';
						stop_sound <= '0';
					else
						s_dados_do_ps2 <= "0000";
						start_sound <= '0';
						stop_sound <= '1';
					end if;
				end if;										-- g
				if key_code = x"34" then
					if last_key_code/= x"F0" then
						s_dados_do_ps2 <= "1000";
						start_sound <= '1';
						stop_sound <= '0';
					else
						s_dados_do_ps2 <= "0000";
						start_sound <= '0';
						stop_sound <= '1';
					end if;
				end if;
				if key_code = x"35" then				-- y
					if last_key_code/= x"F0" then
						s_dados_do_ps2 <= "1001";
						start_sound <= '1';
						stop_sound <= '0';
					else
						s_dados_do_ps2 <= "0000";
						start_sound <= '0';
						stop_sound <= '1';
					end if;
				end if;
				if key_code = x"33" then				-- h
					if last_key_code/= x"F0" then
						s_dados_do_ps2 <= "1010";
						start_sound <= '1';
						stop_sound <= '0';
					else
						s_dados_do_ps2 <= "0000";
						start_sound <= '0';
						stop_sound <= '1';
					end if;
				end if;
				if key_code = x"3C" then				-- u
					if last_key_code/= x"F0" then
						s_dados_do_ps2 <= "1011";
						start_sound <= '1';
						stop_sound <= '0';
					else
						s_dados_do_ps2 <= "0000";
						start_sound <= '0';
						stop_sound <= '1';
					end if;
				end if;
				if key_code = x"3B" then				-- j
					if last_key_code/= x"F0" then
						s_dados_do_ps2 <= "1100";
						start_sound <= '1';
						stop_sound <= '0';
					else
						s_dados_do_ps2 <= "0000";
						start_sound <= '0';
						stop_sound <= '1';
					end if;
				end if;
				if key_code = x"42" then				-- k
					if last_key_code/= x"F0" then
						s_dados_do_ps2 <= "1101";
						start_sound <= '1';
						stop_sound <= '0';
					else
						s_dados_do_ps2 <= "0000";
						start_sound <= '0';
						stop_sound <= '1';
					end if;
				end if;
				if key_code = x"44" then				-- o
					if last_key_code/= x"F0" then
						s_dados_do_ps2 <= "1110";
						start_sound <= '1';
						stop_sound <= '0';
					else
						s_dados_do_ps2 <= "0000";
						start_sound <= '0';
						stop_sound <= '1';
					end if;
				end if;
				if key_code = x"4B" then				-- l
					if last_key_code/= x"F0" then
						s_dados_do_ps2 <= "1111";
						start_sound <= '1';
						stop_sound <= '0';
					else
						s_dados_do_ps2 <= "0000";
						start_sound <= '0';
						stop_sound <= '1';
					end if;
				end if;
	----------------------------------------------------------------
	-- daqui para baixo ainda tem de ser revisto. tem a ver com o som
	
				if key_code = x"79" then				-- tecla +	
					if last_key_code/= x"F0" then
						if (s_volume < "1111111") then
							s_volume <= std_logic_vector(unsigned(s_volume) + 1);
						else
							s_volume <= s_volume;
						end if;
					else
						s_volume <= s_volume;
					end if;
				end if;
				if key_code = x"7B" then				-- tecla -
					if last_key_code/= x"F0" then
						if (s_volume > "0101111") then
							s_volume <= std_logic_vector(unsigned(s_volume) - 1);
						else
							s_volume <= s_volume;
						end if;
					else
						s_volume <= s_volume;
					end if;
				end if;
			end if;
		end if;
	end process;
	
	
	vol: 			entity work.VolumeController(Behavioral)
					port map( start 	=> start_sound,
								 stop 	=> stop_sound,
								 clk 		=> clock,
								 reset	=> '0',
								 volume 	=> s_volume,
								 sound 	=> s_sound);
								 
-----------------------------------------------------------------------------------

end Shell;