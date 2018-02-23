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
			ps2_dat		: inout std_logic);
end AudioSynth;
			
architecture Shell of AudioSynth is

	constant clock_frequency: real := 50.0e6;

	signal s_dados_ps2  					:  std_logic_vector(3 downto 0);
	signal s_count		  					:  std_logic_vector(9 downto 0);
	signal s_audio							:  std_logic_vector(15 downto 0);
	signal s_pulso_audio 				:  std_logic;
	signal clock							:  std_logic;
	signal key_code,last_key_code 	:  std_logic_vector(7 downto 0);
   signal new_key_code 					:  std_logic;
	signal start_sound, stop_sound	:  std_logic;
	signal s_volume						:  std_logic_vector(6 downto 0) := "1110011";
	signal s_sound							:	std_logic_vector(6 downto 0);
	signal to_right, to_left			:  std_logic_vector(15 downto 0);
	signal bemol							: 	std_logic;
	signal s_isOctave						:  std_logic;


begin
	
	clock <= CLOCK_50;

---------- ROM ---------------------
	rom:				entity work.sound_rom(v1)
						port map( clock   => clock,
									 nota    => s_dados_ps2,
									 counter => s_count,
									 sample  => s_audio);

----- CONTROLO DE AUDIO -------------
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
									 valid 		 => s_pulso_audio,
									 to_left 	 => to_left,
									 to_right 	 => to_right);
	
process(clock) is
  begin
    if rising_edge(clock) then
      if s_pulso_audio = '1' then
			if s_isOctave= '0' then
				s_count <= std_logic_vector(unsigned(s_count)+1);
			else
				s_count <= std_logic_vector(unsigned(s_count)+2);
			end if;
      end if;
    end if;
  end process;
  to_left  <= s_audio;
  to_right <= s_audio;
									 
									 
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
									 volume			=> "1110101"); -- era suposto ligar ao s_sound, mas nao funciona
									 
									 --mais detalhes no relatório enviado em anexo

		
----- TECLADO -------------------		
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
						s_dados_ps2 <= "0000";
						start_sound <= '1';
						stop_sound <= '0';
						s_isOctave <= '0';
					else
						s_dados_ps2 <= "1111";
						start_sound <= '0';
						stop_sound <= '1';
					end if;
				end if;
				if key_code = x"1D" then				-- w
					if last_key_code/= x"F0" then
						s_dados_ps2 <= "0001";
						start_sound <= '1';
						stop_sound <= '0';
						s_isOctave <= '0';
					else
						s_dados_ps2 <= "1111";
						start_sound <= '0';
						stop_sound <= '1';
					end if;
				end if;
				if key_code = x"1B" then				-- s
					if last_key_code/= x"F0" then
						s_dados_ps2 <= "0010";
						start_sound <= '1';
						stop_sound <= '0';
						s_isOctave <= '0';
					else
						s_dados_ps2 <= "1111";
						start_sound <= '0';
						stop_sound <= '1';
					end if;
				end if;
				if key_code = x"24" then				-- e
					if last_key_code/= x"F0" then
						s_dados_ps2 <= "0011";
						start_sound <= '1';
						stop_sound <= '0';
						s_isOctave <= '0';
					else
						s_dados_ps2 <= "1111";
						start_sound <= '0';
						stop_sound <= '1';
					end if;
				end if;
				if key_code = x"23" then				-- d
					if last_key_code/= x"F0" then
						s_dados_ps2 <= "0100";
						start_sound <= '1';
						stop_sound <= '0';
						s_isOctave <= '0';
					else
						s_dados_ps2 <= "1111";
						start_sound <= '0';
						stop_sound <= '1';
					end if;
				end if;
				if key_code = x"2B" then				-- f
					if last_key_code/= x"F0" then
						s_dados_ps2 <= "0101";
						start_sound <= '1';
						stop_sound <= '0';
						s_isOctave <= '0';
					else
						s_dados_ps2 <= "1111";
						start_sound <= '0';
						stop_sound <= '1';
					end if;
				end if;
				if key_code = x"2C" then				-- t
					if last_key_code/= x"F0" then
						s_dados_ps2 <= "0110";
						start_sound <= '1';
						stop_sound <= '0';
						s_isOctave <= '0';
					else
						s_dados_ps2 <= "1111";
						start_sound <= '0';
						stop_sound <= '1';
					end if;
				end if;										-- g
				if key_code = x"34" then
					if last_key_code/= x"F0" then
						s_dados_ps2 <= "0111";
						start_sound <= '1';
						stop_sound <= '0';
						s_isOctave <= '0';
					else
						s_dados_ps2 <= "1111";
						start_sound <= '0';
						stop_sound <= '1';
					end if;
				end if;
				if key_code = x"35" then				-- y
					if last_key_code/= x"F0" then
						s_dados_ps2 <= "1000";
						start_sound <= '1';
						stop_sound <= '0';
						s_isOctave <= '0';
					else
						s_dados_ps2 <= "1111";
						start_sound <= '0';
						stop_sound <= '1';
					end if;
				end if;
				if key_code = x"33" then				-- h
					if last_key_code/= x"F0" then
						s_dados_ps2 <= "1001";
						start_sound <= '1';
						stop_sound <= '0';
						s_isOctave <= '0';
					else
						s_dados_ps2 <= "1111";
						start_sound <= '0';
						stop_sound <= '1';
					end if;
				end if;
				if key_code = x"3C" then				-- u
					if last_key_code/= x"F0" then
						s_dados_ps2 <= "1010";
						start_sound <= '1';
						stop_sound <= '0';
						s_isOctave <= '0';
					else
						s_dados_ps2 <= "1111";
						start_sound <= '0';
						stop_sound <= '1';
					end if;
				end if;
				if key_code = x"3B" then				-- j
					if last_key_code/= x"F0" then
						s_dados_ps2 <= "1011";
						start_sound <= '1';
						stop_sound <= '0';
						s_isOctave <= '0';
					else
						s_dados_ps2 <= "1111";
						start_sound <= '0';
						stop_sound <= '1';
					end if;
				end if;
				if key_code = x"42" then				-- k
					if last_key_code/= x"F0" then
						s_dados_ps2 <= "0000";
						start_sound <= '1';
						stop_sound <= '0';
						s_isOctave <= '1';
					else
						s_dados_ps2 <= "1111";
						start_sound <= '0';
						stop_sound <= '1';
					end if;
				end if;
				if key_code = x"44" then				-- o
					if last_key_code/= x"F0" then
						s_dados_ps2 <= "0001";
						start_sound <= '1';
						stop_sound <= '0';
						s_isOctave <= '1';
					else
						s_dados_ps2 <= "1111";
						start_sound <= '0';
						stop_sound <= '1';
					end if;
				end if;
				if key_code = x"4B" then				-- l
					if last_key_code/= x"F0" then
						s_dados_ps2 <= "0010";
						start_sound <= '1';
						stop_sound <= '0';
						s_isOctave <= '1';
					else
						s_dados_ps2 <= "1111";
						start_sound <= '0';
						stop_sound <= '1';
					end if;
				end if;
				if key_code = x"79" then				-- tecla +	
					if last_key_code/= x"F0" then
						if (s_volume > "1110101" and s_volume < "1111111") then
							s_volume <= "1111111";
						elsif (s_volume < "1111111") then
							s_volume <= std_logic_vector(unsigned(s_volume) + 10);
						end if;
					end if;
				end if;
				if key_code = x"7B" then				-- tecla -
					if last_key_code/= x"F0" then
						if (s_volume > "0101111") then
							s_volume <= std_logic_vector(unsigned(s_volume) - 10);
						end if;
					end if;
				end if;
			end if;
		end if;
	end process;
		
---- DISPLAYS ----------------

	Display1:		entity work.Bin7SegDecoder(Behavioral)
						port map( binInput => s_dados_ps2, -- teclado 
									 decOut_n => HEX1);
	
	Display0:		entity work.Mux2_1(Behavioral)
						generic map(N => 7)
						port map( dataIn0 => (others => '1'),
									 dataIn1 => "0000011",
									 sel 		=>  bemol,
									 dataOut => HEX0);
									 
									 
	process(s_dados_ps2)
	begin
		if (s_dados_ps2 = "0001" or s_dados_ps2 = "0011" or s_dados_ps2 = "0110"
				or s_dados_ps2 = "1000" or s_dados_ps2 = "1010" or s_dados_ps2 = "1101") then
			bemol <= '1';
		else
			bemol <= '0';
		end if;
	end process;							 
	

--------- CONTROLO DO VOLUME ---------

	vol: 			entity work.VolumeController(Behavioral)
					port map( start 	=> start_sound,
								 stop 	=> stop_sound,
								 clk 		=> clock,
								 reset	=> '0',
								 volume 	=> s_volume,
								 sound 	=> s_sound);

end Shell;