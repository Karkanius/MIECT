-- Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 15.1.1 Build 189 12/02/2015 SJ Lite Edition"

-- DATE "05/29/2017 13:39:46"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	AudioSynth IS
    PORT (
	CLOCK_50 : IN std_logic;
	HEX0 : OUT std_logic_vector(6 DOWNTO 0);
	HEX1 : OUT std_logic_vector(6 DOWNTO 0);
	i2c_sclk : INOUT std_logic;
	i2c_sdat : INOUT std_logic;
	aud_xck : OUT std_logic;
	aud_bclk : IN std_logic;
	aud_adclrck : IN std_logic;
	aud_adcdat : IN std_logic;
	aud_dacdat : OUT std_logic;
	ps2_clk : INOUT std_logic;
	ps2_dat : INOUT std_logic
	);
END AudioSynth;

-- Design Ports Information
-- HEX0[0]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[1]	=>  Location: PIN_F22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[2]	=>  Location: PIN_E17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[3]	=>  Location: PIN_L26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[4]	=>  Location: PIN_L25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[5]	=>  Location: PIN_J22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[6]	=>  Location: PIN_H22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[0]	=>  Location: PIN_M24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[1]	=>  Location: PIN_Y22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[2]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[3]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[4]	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[5]	=>  Location: PIN_U23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[6]	=>  Location: PIN_U24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- aud_xck	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- aud_adcdat	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- aud_dacdat	=>  Location: PIN_D1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i2c_sclk	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i2c_sdat	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ps2_clk	=>  Location: PIN_G6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ps2_dat	=>  Location: PIN_H5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- aud_adclrck	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- aud_bclk	=>  Location: PIN_F2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF AudioSynth IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_HEX0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_aud_xck : std_logic;
SIGNAL ww_aud_bclk : std_logic;
SIGNAL ww_aud_adclrck : std_logic;
SIGNAL ww_aud_adcdat : std_logic;
SIGNAL ww_aud_dacdat : std_logic;
SIGNAL \aio|c|PLL|auto_generated|pll1_INCLK_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \aio|c|PLL|auto_generated|pll1_CLK_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \Sin|Mult0|auto_generated|mac_out2_DATAA_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \Sin|Mult1|auto_generated|mac_out2_DATAA_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \Sin|Mult0|auto_generated|mac_mult1_DATAA_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \Sin|Mult0|auto_generated|mac_mult1_DATAB_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \Sin|Mult1|auto_generated|mac_mult1_DATAA_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \Sin|Mult1|auto_generated|mac_mult1_DATAB_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTBDATAIN_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \aio|c|PLL|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \vol|Selector12~1clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Sin|Mult0|auto_generated|mac_out2~DATAOUT24\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_out2~DATAOUT25\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_out2~0\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_out2~1\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_out2~2\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_out2~3\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_out2~4\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_out2~5\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_out2~6\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_out2~7\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_out2~8\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_out2~9\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_out2~DATAOUT24\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_out2~0\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_out2~1\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_out2~2\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_out2~3\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_out2~4\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_out2~5\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_out2~6\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_out2~7\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_out2~8\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_out2~9\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_out2~10\ : std_logic;
SIGNAL \aud_adcdat~input_o\ : std_logic;
SIGNAL \i2c_sclk~input_o\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \ac|i2c|phase~2_combout\ : std_logic;
SIGNAL \ac|i2c|counter[0]~6_combout\ : std_logic;
SIGNAL \ac|i2c|counter[1]~8_combout\ : std_logic;
SIGNAL \ac|i2c|txd_accepted~0_combout\ : std_logic;
SIGNAL \ac|i2c|txd_accepted~q\ : std_logic;
SIGNAL \ac|process_1~0_combout\ : std_logic;
SIGNAL \ac|delay[0]~0_combout\ : std_logic;
SIGNAL \ac|Add0~1_cout\ : std_logic;
SIGNAL \ac|Add0~2_combout\ : std_logic;
SIGNAL \ac|delay[1]~1_combout\ : std_logic;
SIGNAL \ac|Add0~3\ : std_logic;
SIGNAL \ac|Add0~4_combout\ : std_logic;
SIGNAL \ac|delay[2]~2_combout\ : std_logic;
SIGNAL \ac|Add0~5\ : std_logic;
SIGNAL \ac|Add0~6_combout\ : std_logic;
SIGNAL \ac|delay[3]~3_combout\ : std_logic;
SIGNAL \ac|Equal0~0_combout\ : std_logic;
SIGNAL \ac|Add0~7\ : std_logic;
SIGNAL \ac|Add0~8_combout\ : std_logic;
SIGNAL \ac|delay[4]~4_combout\ : std_logic;
SIGNAL \ac|Add0~9\ : std_logic;
SIGNAL \ac|Add0~10_combout\ : std_logic;
SIGNAL \ac|delay[5]~6_combout\ : std_logic;
SIGNAL \ac|Add0~11\ : std_logic;
SIGNAL \ac|Add0~12_combout\ : std_logic;
SIGNAL \ac|delay[6]~5_combout\ : std_logic;
SIGNAL \ac|Add0~13\ : std_logic;
SIGNAL \ac|Add0~14_combout\ : std_logic;
SIGNAL \ac|delay[7]~7_combout\ : std_logic;
SIGNAL \ac|Add0~15\ : std_logic;
SIGNAL \ac|Add0~16_combout\ : std_logic;
SIGNAL \ac|delay[8]~8_combout\ : std_logic;
SIGNAL \ac|Add0~17\ : std_logic;
SIGNAL \ac|Add0~18_combout\ : std_logic;
SIGNAL \ac|delay[9]~9_combout\ : std_logic;
SIGNAL \ac|Add0~19\ : std_logic;
SIGNAL \ac|Add0~20_combout\ : std_logic;
SIGNAL \ac|delay[10]~10_combout\ : std_logic;
SIGNAL \ac|Add0~21\ : std_logic;
SIGNAL \ac|Add0~22_combout\ : std_logic;
SIGNAL \ac|delay[11]~11_combout\ : std_logic;
SIGNAL \ac|Add0~23\ : std_logic;
SIGNAL \ac|Add0~24_combout\ : std_logic;
SIGNAL \ac|delay[12]~14_combout\ : std_logic;
SIGNAL \ac|Add0~25\ : std_logic;
SIGNAL \ac|Add0~26_combout\ : std_logic;
SIGNAL \ac|delay[13]~15_combout\ : std_logic;
SIGNAL \ac|Add0~27\ : std_logic;
SIGNAL \ac|Add0~28_combout\ : std_logic;
SIGNAL \ac|delay[14]~12_combout\ : std_logic;
SIGNAL \ac|Add0~29\ : std_logic;
SIGNAL \ac|Add0~30_combout\ : std_logic;
SIGNAL \ac|delay[15]~13_combout\ : std_logic;
SIGNAL \ac|Equal0~3_combout\ : std_logic;
SIGNAL \ac|Equal0~1_combout\ : std_logic;
SIGNAL \ac|Equal0~2_combout\ : std_logic;
SIGNAL \ac|Equal0~4_combout\ : std_logic;
SIGNAL \ps2_clk~input_o\ : std_logic;
SIGNAL \ps2|ll|ps2_clk_0~0_combout\ : std_logic;
SIGNAL \ps2|ll|Add0~0_combout\ : std_logic;
SIGNAL \ps2|ll|Add0~5\ : std_logic;
SIGNAL \ps2|ll|Add0~6_combout\ : std_logic;
SIGNAL \ps2|ll|Add0~7\ : std_logic;
SIGNAL \ps2|ll|Add0~8_combout\ : std_logic;
SIGNAL \ps2|ll|Add0~9\ : std_logic;
SIGNAL \ps2|ll|Add0~10_combout\ : std_logic;
SIGNAL \ps2|ll|Add0~11\ : std_logic;
SIGNAL \ps2|ll|Add0~12_combout\ : std_logic;
SIGNAL \ps2|ll|Equal1~0_combout\ : std_logic;
SIGNAL \ps2|ll|sampling_counter~1_combout\ : std_logic;
SIGNAL \ps2|ll|Add0~1\ : std_logic;
SIGNAL \ps2|ll|Add0~2_combout\ : std_logic;
SIGNAL \ps2|ll|sampling_counter~0_combout\ : std_logic;
SIGNAL \ps2|ll|Add0~3\ : std_logic;
SIGNAL \ps2|ll|Add0~4_combout\ : std_logic;
SIGNAL \ps2|ll|Equal0~0_combout\ : std_logic;
SIGNAL \ps2|ll|Equal0~1_combout\ : std_logic;
SIGNAL \ps2|ll|ps2_clk_0~q\ : std_logic;
SIGNAL \ps2_dat~input_o\ : std_logic;
SIGNAL \ps2|ll|ps2_dat_0~0_combout\ : std_logic;
SIGNAL \ps2|ll|ps2_dat_0~q\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[0]~5_combout\ : std_logic;
SIGNAL \ps2|ll|Selector9~0_combout\ : std_logic;
SIGNAL \ps2|ll|Add1~0_combout\ : std_logic;
SIGNAL \ps2|ll|Add1~2_combout\ : std_logic;
SIGNAL \ps2|ll|Equal2~0_combout\ : std_logic;
SIGNAL \ps2|ll|Equal2~1_combout\ : std_logic;
SIGNAL \ps2|ll|Equal2~2_combout\ : std_logic;
SIGNAL \ps2|ll|idle_counter[0]~0_combout\ : std_logic;
SIGNAL \ps2|ll|Add1~1\ : std_logic;
SIGNAL \ps2|ll|Add1~3_combout\ : std_logic;
SIGNAL \ps2|ll|Add1~5_combout\ : std_logic;
SIGNAL \ps2|ll|Add1~4\ : std_logic;
SIGNAL \ps2|ll|Add1~6_combout\ : std_logic;
SIGNAL \ps2|ll|Add1~8_combout\ : std_logic;
SIGNAL \ps2|ll|Add1~7\ : std_logic;
SIGNAL \ps2|ll|Add1~9_combout\ : std_logic;
SIGNAL \ps2|ll|Add1~11_combout\ : std_logic;
SIGNAL \ps2|ll|Add1~10\ : std_logic;
SIGNAL \ps2|ll|Add1~12_combout\ : std_logic;
SIGNAL \ps2|ll|Add1~23_combout\ : std_logic;
SIGNAL \ps2|ll|Add1~13\ : std_logic;
SIGNAL \ps2|ll|Add1~14_combout\ : std_logic;
SIGNAL \ps2|ll|Add1~25_combout\ : std_logic;
SIGNAL \ps2|ll|Add1~15\ : std_logic;
SIGNAL \ps2|ll|Add1~16_combout\ : std_logic;
SIGNAL \ps2|ll|Add1~26_combout\ : std_logic;
SIGNAL \ps2|ll|Add1~17\ : std_logic;
SIGNAL \ps2|ll|Add1~18_combout\ : std_logic;
SIGNAL \ps2|ll|Add1~24_combout\ : std_logic;
SIGNAL \ps2|ll|Add1~19\ : std_logic;
SIGNAL \ps2|ll|Add1~20_combout\ : std_logic;
SIGNAL \ps2|ll|Add1~22_combout\ : std_logic;
SIGNAL \ps2|Equal2~9_combout\ : std_logic;
SIGNAL \ps2|Add0~0_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[0]~9_combout\ : std_logic;
SIGNAL \ps2|Add0~1\ : std_logic;
SIGNAL \ps2|Add0~2_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[1]~10_combout\ : std_logic;
SIGNAL \ps2|Add0~3\ : std_logic;
SIGNAL \ps2|Add0~4_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[2]~11_combout\ : std_logic;
SIGNAL \ps2|Add0~5\ : std_logic;
SIGNAL \ps2|Add0~6_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[3]~12_combout\ : std_logic;
SIGNAL \ps2|Add0~7\ : std_logic;
SIGNAL \ps2|Add0~8_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[4]~14_combout\ : std_logic;
SIGNAL \ps2|Add0~9\ : std_logic;
SIGNAL \ps2|Add0~11\ : std_logic;
SIGNAL \ps2|Add0~12_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[6]~16_combout\ : std_logic;
SIGNAL \ps2|Add0~13\ : std_logic;
SIGNAL \ps2|Add0~14_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[7]~13_combout\ : std_logic;
SIGNAL \ps2|Add0~15\ : std_logic;
SIGNAL \ps2|Add0~16_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[8]~17_combout\ : std_logic;
SIGNAL \ps2|Add0~17\ : std_logic;
SIGNAL \ps2|Add0~18_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[9]~18_combout\ : std_logic;
SIGNAL \ps2|Add0~19\ : std_logic;
SIGNAL \ps2|Add0~20_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[10]~19_combout\ : std_logic;
SIGNAL \ps2|Add0~21\ : std_logic;
SIGNAL \ps2|Add0~22_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[11]~20_combout\ : std_logic;
SIGNAL \ps2|Add0~23\ : std_logic;
SIGNAL \ps2|Add0~24_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[12]~21_combout\ : std_logic;
SIGNAL \ps2|Add0~25\ : std_logic;
SIGNAL \ps2|Add0~26_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[13]~22_combout\ : std_logic;
SIGNAL \ps2|Add0~27\ : std_logic;
SIGNAL \ps2|Add0~28_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[14]~23_combout\ : std_logic;
SIGNAL \ps2|Add0~29\ : std_logic;
SIGNAL \ps2|Add0~30_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[15]~24_combout\ : std_logic;
SIGNAL \ps2|Add0~31\ : std_logic;
SIGNAL \ps2|Add0~32_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[16]~27_combout\ : std_logic;
SIGNAL \ps2|Add0~33\ : std_logic;
SIGNAL \ps2|Add0~34_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[17]~25_combout\ : std_logic;
SIGNAL \ps2|Add0~35\ : std_logic;
SIGNAL \ps2|Add0~36_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[18]~28_combout\ : std_logic;
SIGNAL \ps2|Add0~37\ : std_logic;
SIGNAL \ps2|Add0~38_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[19]~26_combout\ : std_logic;
SIGNAL \ps2|Equal2~5_combout\ : std_logic;
SIGNAL \ps2|state~38_combout\ : std_logic;
SIGNAL \ps2|ll|rxd_data[1]~feeder_combout\ : std_logic;
SIGNAL \ps2|ll|Selector29~0_combout\ : std_logic;
SIGNAL \ps2|ll|Add2~0_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[0]~15_combout\ : std_logic;
SIGNAL \ps2|ll|Add2~1\ : std_logic;
SIGNAL \ps2|ll|Add2~2_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[1]~16_combout\ : std_logic;
SIGNAL \ps2|ll|Add2~3\ : std_logic;
SIGNAL \ps2|ll|Add2~4_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[2]~17_combout\ : std_logic;
SIGNAL \ps2|ll|Add2~5\ : std_logic;
SIGNAL \ps2|ll|Add2~6_combout\ : std_logic;
SIGNAL \ps2|ll|Selector17~0_combout\ : std_logic;
SIGNAL \ps2|ll|ps2_clk_1~feeder_combout\ : std_logic;
SIGNAL \ps2|ll|ps2_clk_1~q\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[0]~19_combout\ : std_logic;
SIGNAL \ps2|ll|start_bit~0_combout\ : std_logic;
SIGNAL \ps2|ll|start_bit~1_combout\ : std_logic;
SIGNAL \ps2|ll|start_bit~q\ : std_logic;
SIGNAL \ps2|ll|process_0~8_combout\ : std_logic;
SIGNAL \ps2|ll|Selector21~0_combout\ : std_logic;
SIGNAL \ps2|ll|process_0~6_combout\ : std_logic;
SIGNAL \ps2|ll|Selector21~1_combout\ : std_logic;
SIGNAL \ps2|ll|data[2]~3_combout\ : std_logic;
SIGNAL \ps2|ll|Selector27~0_combout\ : std_logic;
SIGNAL \ps2|ll|rxd_data[2]~feeder_combout\ : std_logic;
SIGNAL \ps2|process_0~0_combout\ : std_logic;
SIGNAL \ps2|ll|rxd_data[4]~feeder_combout\ : std_logic;
SIGNAL \ps2|process_0~2_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[0]~6_combout\ : std_logic;
SIGNAL \ps2|ll|txd_accepted~0_combout\ : std_logic;
SIGNAL \ps2|ll|txd_accepted~q\ : std_logic;
SIGNAL \ps2|Selector10~0_combout\ : std_logic;
SIGNAL \ps2|process_0~4_combout\ : std_logic;
SIGNAL \ps2|ll|rxd_data[5]~feeder_combout\ : std_logic;
SIGNAL \ps2|process_0~5_combout\ : std_logic;
SIGNAL \ps2|process_0~6_combout\ : std_logic;
SIGNAL \ps2|Selector6~13_combout\ : std_logic;
SIGNAL \ps2|state~52_combout\ : std_logic;
SIGNAL \ps2|state~51_combout\ : std_logic;
SIGNAL \ps2|state~53_combout\ : std_logic;
SIGNAL \ps2|state.enable_mouse~q\ : std_logic;
SIGNAL \ps2|txd_data[1]~0_combout\ : std_logic;
SIGNAL \ps2|state~49_combout\ : std_logic;
SIGNAL \ps2|state~50_combout\ : std_logic;
SIGNAL \ps2|state.wait_for_second_mouse_byte~q\ : std_logic;
SIGNAL \ps2|state~45_combout\ : std_logic;
SIGNAL \ps2|state.wait_for_third_mouse_byte~q\ : std_logic;
SIGNAL \ps2|Selector6~10_combout\ : std_logic;
SIGNAL \ps2|Selector6~11_combout\ : std_logic;
SIGNAL \ps2|state~59_combout\ : std_logic;
SIGNAL \ps2|state~60_combout\ : std_logic;
SIGNAL \ps2|state.wait_for_reset_acknowledge~q\ : std_logic;
SIGNAL \ps2|state~54_combout\ : std_logic;
SIGNAL \ps2|state~55_combout\ : std_logic;
SIGNAL \ps2|state.wait_for_enable_mouse_acknowledge~q\ : std_logic;
SIGNAL \ps2|Selector6~8_combout\ : std_logic;
SIGNAL \ps2|process_0~7_combout\ : std_logic;
SIGNAL \ps2|Selector6~9_combout\ : std_logic;
SIGNAL \ps2|state~46_combout\ : std_logic;
SIGNAL \ps2|state~47_combout\ : std_logic;
SIGNAL \ps2|state~48_combout\ : std_logic;
SIGNAL \ps2|state.wait_for_first_mouse_byte~q\ : std_logic;
SIGNAL \ps2|Selector6~5_combout\ : std_logic;
SIGNAL \ps2|Selector6~6_combout\ : std_logic;
SIGNAL \ps2|Selector6~12_combout\ : std_logic;
SIGNAL \ps2|Selector6~7_combout\ : std_logic;
SIGNAL \ps2|Selector6~15_combout\ : std_logic;
SIGNAL \ps2|state~62_combout\ : std_logic;
SIGNAL \ps2|state~57_combout\ : std_logic;
SIGNAL \ps2|state.enable_keyboard~q\ : std_logic;
SIGNAL \ps2|state~39_combout\ : std_logic;
SIGNAL \ps2|state~40_combout\ : std_logic;
SIGNAL \ps2|state.wait_for_enable_keyboard_acknowledge~q\ : std_logic;
SIGNAL \ps2|state~36_combout\ : std_logic;
SIGNAL \ps2|state~37_combout\ : std_logic;
SIGNAL \ps2|state.keyboard_wait_for_change~q\ : std_logic;
SIGNAL \ps2|Selector56~0_combout\ : std_logic;
SIGNAL \ps2|ll|Selector30~0_combout\ : std_logic;
SIGNAL \ps2|ll|process_0~0_combout\ : std_logic;
SIGNAL \ps2|ll|rxd_data[1]~0_combout\ : std_logic;
SIGNAL \ps2|ll|state~29_combout\ : std_logic;
SIGNAL \ps2|ll|state~30_combout\ : std_logic;
SIGNAL \ps2|ll|state.waiting_for_acknowledge~q\ : std_logic;
SIGNAL \ps2|ll|state~24_combout\ : std_logic;
SIGNAL \ps2|ll|state~25_combout\ : std_logic;
SIGNAL \ps2|ll|state~27_combout\ : std_logic;
SIGNAL \ps2|ll|state~20_combout\ : std_logic;
SIGNAL \ps2|ll|state.interrupting~q\ : std_logic;
SIGNAL \ps2|ll|state~22_combout\ : std_logic;
SIGNAL \ps2|ll|state~31_combout\ : std_logic;
SIGNAL \ps2|ll|state~26_combout\ : std_logic;
SIGNAL \ps2|ll|state~28_combout\ : std_logic;
SIGNAL \ps2|ll|ps2_dat_1~feeder_combout\ : std_logic;
SIGNAL \ps2|ll|ps2_dat_1~q\ : std_logic;
SIGNAL \ps2|ll|state.finishing~0_combout\ : std_logic;
SIGNAL \ps2|ll|state.finishing~1_combout\ : std_logic;
SIGNAL \ps2|ll|state.finishing~q\ : std_logic;
SIGNAL \ps2|ll|state.idle~0_combout\ : std_logic;
SIGNAL \ps2|ll|state.idle~1_combout\ : std_logic;
SIGNAL \ps2|ll|state.idle~2_combout\ : std_logic;
SIGNAL \ps2|ll|state~19_combout\ : std_logic;
SIGNAL \ps2|ll|state.receiving~q\ : std_logic;
SIGNAL \ps2|ll|rxd_data[1]~1_combout\ : std_logic;
SIGNAL \ps2|process_0~1_combout\ : std_logic;
SIGNAL \ps2|process_0~3_combout\ : std_logic;
SIGNAL \ps2|Selector6~16_combout\ : std_logic;
SIGNAL \ps2|state~61_combout\ : std_logic;
SIGNAL \ps2|state.wait_for_bat~q\ : std_logic;
SIGNAL \ps2|state.restart~5_combout\ : std_logic;
SIGNAL \ps2|state.restart~0_combout\ : std_logic;
SIGNAL \ps2|state.restart~3_combout\ : std_logic;
SIGNAL \ps2|state.restart~2_combout\ : std_logic;
SIGNAL \ps2|state.restart~1_combout\ : std_logic;
SIGNAL \ps2|state.restart~4_combout\ : std_logic;
SIGNAL \ps2|state.restart~6_combout\ : std_logic;
SIGNAL \ps2|state.restart~7_combout\ : std_logic;
SIGNAL \ps2|state.restart~8_combout\ : std_logic;
SIGNAL \ps2|state.restart~9_combout\ : std_logic;
SIGNAL \ps2|state~42_combout\ : std_logic;
SIGNAL \ps2|state~43_combout\ : std_logic;
SIGNAL \ps2|state~44_combout\ : std_logic;
SIGNAL \ps2|state.restart~q\ : std_logic;
SIGNAL \ps2|state~58_combout\ : std_logic;
SIGNAL \ps2|state.periodic_reset~q\ : std_logic;
SIGNAL \ps2|state~41_combout\ : std_logic;
SIGNAL \ps2|Selector53~0_combout\ : std_logic;
SIGNAL \ps2|Selector53~1_combout\ : std_logic;
SIGNAL \ps2|txd_data[4]~2_combout\ : std_logic;
SIGNAL \ps2|ll|txd_parity~0_combout\ : std_logic;
SIGNAL \ps2|ll|data[9]~feeder_combout\ : std_logic;
SIGNAL \ps2|ll|Selector21~2_combout\ : std_logic;
SIGNAL \ps2|ll|Selector21~3_combout\ : std_logic;
SIGNAL \ps2|ll|rxd_valid~0_combout\ : std_logic;
SIGNAL \ps2|ll|Selector21~4_combout\ : std_logic;
SIGNAL \ps2|ll|Selector23~0_combout\ : std_logic;
SIGNAL \ps2|ll|Selector24~0_combout\ : std_logic;
SIGNAL \ps2|ll|Selector25~0_combout\ : std_logic;
SIGNAL \ps2|ll|Selector26~0_combout\ : std_logic;
SIGNAL \ps2|Selector6~4_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[1]~1_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[1]~0_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[1]~2_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[1]~3_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[1]~5_combout\ : std_logic;
SIGNAL \ps2|Add0~39\ : std_logic;
SIGNAL \ps2|Add0~40_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[20]~29_combout\ : std_logic;
SIGNAL \ps2|Add0~41\ : std_logic;
SIGNAL \ps2|Add0~42_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[21]~30_combout\ : std_logic;
SIGNAL \ps2|Add0~43\ : std_logic;
SIGNAL \ps2|Add0~44_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[22]~31_combout\ : std_logic;
SIGNAL \ps2|Add0~45\ : std_logic;
SIGNAL \ps2|Add0~46_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[23]~32_combout\ : std_logic;
SIGNAL \ps2|Equal2~6_combout\ : std_logic;
SIGNAL \ps2|Equal2~10_combout\ : std_logic;
SIGNAL \ps2|Selector6~14_combout\ : std_logic;
SIGNAL \ps2|state~56_combout\ : std_logic;
SIGNAL \ps2|state.wait_for_mouse_bat~q\ : std_logic;
SIGNAL \ps2|time_out_counter[1]~4_combout\ : std_logic;
SIGNAL \ps2|Selector42~0_combout\ : std_logic;
SIGNAL \ps2|Add0~47\ : std_logic;
SIGNAL \ps2|Add0~48_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[24]~34_combout\ : std_logic;
SIGNAL \ps2|Add0~49\ : std_logic;
SIGNAL \ps2|Add0~50_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[25]~33_combout\ : std_logic;
SIGNAL \ps2|Add0~51\ : std_logic;
SIGNAL \ps2|Add0~52_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[26]~35_combout\ : std_logic;
SIGNAL \ps2|Add0~53\ : std_logic;
SIGNAL \ps2|Add0~54_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[27]~36_combout\ : std_logic;
SIGNAL \ps2|Equal2~7_combout\ : std_logic;
SIGNAL \ps2|Equal2~8_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[1]~6_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[1]~7_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[1]~8_combout\ : std_logic;
SIGNAL \ps2|Add0~10_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[5]~15_combout\ : std_logic;
SIGNAL \ps2|Equal2~1_combout\ : std_logic;
SIGNAL \ps2|Equal2~3_combout\ : std_logic;
SIGNAL \ps2|Equal2~2_combout\ : std_logic;
SIGNAL \ps2|Equal2~0_combout\ : std_logic;
SIGNAL \ps2|Equal2~4_combout\ : std_logic;
SIGNAL \ps2|txd_data[1]~1_combout\ : std_logic;
SIGNAL \ps2|txd_request~q\ : std_logic;
SIGNAL \ps2|ll|process_0~7_combout\ : std_logic;
SIGNAL \ps2|ll|state~16_combout\ : std_logic;
SIGNAL \ps2|ll|state~32_combout\ : std_logic;
SIGNAL \ps2|ll|state~33_combout\ : std_logic;
SIGNAL \ps2|ll|state~17_combout\ : std_logic;
SIGNAL \ps2|ll|state~18_combout\ : std_logic;
SIGNAL \ps2|ll|state~21_combout\ : std_logic;
SIGNAL \ps2|ll|state.sending~q\ : std_logic;
SIGNAL \ps2|ll|data[7]~0_combout\ : std_logic;
SIGNAL \ps2|ll|data[7]~1_combout\ : std_logic;
SIGNAL \ps2|ll|data[7]~2_combout\ : std_logic;
SIGNAL \ps2|ll|n_bits[0]~3_combout\ : std_logic;
SIGNAL \ps2|ll|n_bits[0]~2_combout\ : std_logic;
SIGNAL \ps2|ll|Add3~0_combout\ : std_logic;
SIGNAL \ps2|ll|Add3~2_combout\ : std_logic;
SIGNAL \ps2|ll|Add3~1_combout\ : std_logic;
SIGNAL \ps2|ll|Equal6~0_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[0]~7_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[0]~8_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[0]~9_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[0]~10_combout\ : std_logic;
SIGNAL \ps2|ll|Add2~7\ : std_logic;
SIGNAL \ps2|ll|Add2~8_combout\ : std_logic;
SIGNAL \ps2|ll|Selector16~0_combout\ : std_logic;
SIGNAL \ps2|ll|Add2~9\ : std_logic;
SIGNAL \ps2|ll|Add2~10_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[5]~13_combout\ : std_logic;
SIGNAL \ps2|ll|Add2~11\ : std_logic;
SIGNAL \ps2|ll|Add2~13\ : std_logic;
SIGNAL \ps2|ll|Add2~14_combout\ : std_logic;
SIGNAL \ps2|ll|Selector13~0_combout\ : std_logic;
SIGNAL \ps2|ll|Add2~15\ : std_logic;
SIGNAL \ps2|ll|Add2~16_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[8]~0_combout\ : std_logic;
SIGNAL \ps2|ll|Add2~17\ : std_logic;
SIGNAL \ps2|ll|Add2~18_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[9]~1_combout\ : std_logic;
SIGNAL \ps2|ll|Equal3~0_combout\ : std_logic;
SIGNAL \ps2|ll|Equal3~4_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[0]~14_combout\ : std_logic;
SIGNAL \ps2|ll|Add2~19\ : std_logic;
SIGNAL \ps2|ll|Add2~20_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[10]~2_combout\ : std_logic;
SIGNAL \ps2|ll|Equal3~1_combout\ : std_logic;
SIGNAL \ps2|ll|Equal3~3_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[0]~11_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[0]~20_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[0]~12_combout\ : std_logic;
SIGNAL \ps2|ll|Add2~12_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[6]~18_combout\ : std_logic;
SIGNAL \ps2|ll|Equal3~2_combout\ : std_logic;
SIGNAL \ps2|ll|state~23_combout\ : std_logic;
SIGNAL \ps2|ll|state.idle~3_combout\ : std_logic;
SIGNAL \ps2|ll|state.idle~4_combout\ : std_logic;
SIGNAL \ps2|ll|state.idle~q\ : std_logic;
SIGNAL \ps2|ll|Selector28~0_combout\ : std_logic;
SIGNAL \ps2|ll|process_0~2_combout\ : std_logic;
SIGNAL \ps2|ll|process_0~1_combout\ : std_logic;
SIGNAL \ps2|ll|process_0~3_combout\ : std_logic;
SIGNAL \ps2|ll|process_0~4_combout\ : std_logic;
SIGNAL \ps2|ll|process_0~5_combout\ : std_logic;
SIGNAL \ps2|ll|rxd_valid~1_combout\ : std_logic;
SIGNAL \ps2|ll|rxd_valid~q\ : std_logic;
SIGNAL \ps2|key_code[0]~0_combout\ : std_logic;
SIGNAL \ps2|valid_key_code~q\ : std_logic;
SIGNAL \Equal7~1_combout\ : std_logic;
SIGNAL \ps2|key_code[1]~feeder_combout\ : std_logic;
SIGNAL \last_key_code[1]~feeder_combout\ : std_logic;
SIGNAL \Equal7~0_combout\ : std_logic;
SIGNAL \Equal7~2_combout\ : std_logic;
SIGNAL \Equal19~0_combout\ : std_logic;
SIGNAL \Equal19~1_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~18_combout\ : std_logic;
SIGNAL \s_volume[6]~0_combout\ : std_logic;
SIGNAL \Equal11~0_combout\ : std_logic;
SIGNAL \Equal6~0_combout\ : std_logic;
SIGNAL \Equal10~0_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~17_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~19_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~20_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~21_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~14_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~15_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~16_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~77_combout\ : std_logic;
SIGNAL \start_sound~0_combout\ : std_logic;
SIGNAL \start_sound~q\ : std_logic;
SIGNAL \vol|Selector12~0_combout\ : std_logic;
SIGNAL \vol|Add0~0_combout\ : std_logic;
SIGNAL \vol|Add0~18_combout\ : std_logic;
SIGNAL \vol|Add0~1\ : std_logic;
SIGNAL \vol|Add0~3\ : std_logic;
SIGNAL \vol|Add0~5_combout\ : std_logic;
SIGNAL \vol|Add0~20_combout\ : std_logic;
SIGNAL \vol|Add0~6\ : std_logic;
SIGNAL \vol|Add0~7_combout\ : std_logic;
SIGNAL \vol|Add0~19_combout\ : std_logic;
SIGNAL \vol|Add0~8\ : std_logic;
SIGNAL \vol|Add0~9_combout\ : std_logic;
SIGNAL \vol|Add0~11_combout\ : std_logic;
SIGNAL \vol|Add0~10\ : std_logic;
SIGNAL \vol|Add0~12_combout\ : std_logic;
SIGNAL \vol|Add0~14_combout\ : std_logic;
SIGNAL \vol|Add0~13\ : std_logic;
SIGNAL \vol|Add0~15_combout\ : std_logic;
SIGNAL \vol|Add0~17_combout\ : std_logic;
SIGNAL \Equal23~0_combout\ : std_logic;
SIGNAL \Equal23~1_combout\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \s_volume[6]~2_combout\ : std_logic;
SIGNAL \s_volume[6]~3_combout\ : std_logic;
SIGNAL \s_volume[6]~4_combout\ : std_logic;
SIGNAL \s_volume[6]~1_combout\ : std_logic;
SIGNAL \s_volume[6]~5_combout\ : std_logic;
SIGNAL \Add1~1\ : std_logic;
SIGNAL \Add1~2_combout\ : std_logic;
SIGNAL \Add1~3\ : std_logic;
SIGNAL \Add1~4_combout\ : std_logic;
SIGNAL \Add1~5\ : std_logic;
SIGNAL \Add1~6_combout\ : std_logic;
SIGNAL \Add1~7\ : std_logic;
SIGNAL \Add1~8_combout\ : std_logic;
SIGNAL \Add1~9\ : std_logic;
SIGNAL \Add1~10_combout\ : std_logic;
SIGNAL \s_volume[5]~7_combout\ : std_logic;
SIGNAL \Add1~11\ : std_logic;
SIGNAL \Add1~12_combout\ : std_logic;
SIGNAL \s_volume[6]~6_combout\ : std_logic;
SIGNAL \vol|LessThan0~1_cout\ : std_logic;
SIGNAL \vol|LessThan0~3_cout\ : std_logic;
SIGNAL \vol|LessThan0~5_cout\ : std_logic;
SIGNAL \vol|LessThan0~7_cout\ : std_logic;
SIGNAL \vol|LessThan0~9_cout\ : std_logic;
SIGNAL \vol|LessThan0~11_cout\ : std_logic;
SIGNAL \vol|LessThan0~12_combout\ : std_logic;
SIGNAL \vol|Selector12~1_combout\ : std_logic;
SIGNAL \vol|Selector12~1clkctrl_outclk\ : std_logic;
SIGNAL \vol|Selector3~0_combout\ : std_logic;
SIGNAL \vol|NS.Normal_141~combout\ : std_logic;
SIGNAL \vol|PS.Normal~q\ : std_logic;
SIGNAL \vol|Selector1~0_combout\ : std_logic;
SIGNAL \vol|NS.FadeOut_129~combout\ : std_logic;
SIGNAL \vol|PS.FadeOut~feeder_combout\ : std_logic;
SIGNAL \vol|PS.FadeOut~q\ : std_logic;
SIGNAL \vol|Selector0~0_combout\ : std_logic;
SIGNAL \vol|NS.Mute_117~combout\ : std_logic;
SIGNAL \vol|PS.Mute~0_combout\ : std_logic;
SIGNAL \vol|PS.Mute~q\ : std_logic;
SIGNAL \vol|Selector4~0_combout\ : std_logic;
SIGNAL \vol|NS.FadeIn_153~combout\ : std_logic;
SIGNAL \vol|PS.FadeIn~q\ : std_logic;
SIGNAL \vol|Add0~2_combout\ : std_logic;
SIGNAL \vol|Add0~4_combout\ : std_logic;
SIGNAL \ac|desired_config~0_combout\ : std_logic;
SIGNAL \ac|desired_config~1_combout\ : std_logic;
SIGNAL \ac|current_config.volume[6]~2_combout\ : std_logic;
SIGNAL \ac|current_config.volume[0]~3_combout\ : std_logic;
SIGNAL \ac|state[2]~6_combout\ : std_logic;
SIGNAL \ac|desired_config~3_combout\ : std_logic;
SIGNAL \ac|current_config.volume[2]~4_combout\ : std_logic;
SIGNAL \ac|desired_config~2_combout\ : std_logic;
SIGNAL \ac|state[2]~7_combout\ : std_logic;
SIGNAL \ac|current_config.volume[6]~6_combout\ : std_logic;
SIGNAL \ac|desired_config~4_combout\ : std_logic;
SIGNAL \ac|desired_config~5_combout\ : std_logic;
SIGNAL \ac|current_config.volume[5]~5_combout\ : std_logic;
SIGNAL \ac|state[2]~8_combout\ : std_logic;
SIGNAL \ac|current_config.line_in_gain[0]~0_combout\ : std_logic;
SIGNAL \ac|state[2]~9_combout\ : std_logic;
SIGNAL \ac|state[2]~10_combout\ : std_logic;
SIGNAL \ac|state[0]~14_combout\ : std_logic;
SIGNAL \ac|state[0]~11_combout\ : std_logic;
SIGNAL \ac|state~13_combout\ : std_logic;
SIGNAL \ac|Add1~1_combout\ : std_logic;
SIGNAL \ac|state~16_combout\ : std_logic;
SIGNAL \ac|Add1~0_combout\ : std_logic;
SIGNAL \ac|state[3]~15_combout\ : std_logic;
SIGNAL \ac|state[3]~12_combout\ : std_logic;
SIGNAL \ac|txd_request~1_combout\ : std_logic;
SIGNAL \ac|txd_request~0_combout\ : std_logic;
SIGNAL \ac|txd_request~q\ : std_logic;
SIGNAL \ac|i2c|counter[1]~9_combout\ : std_logic;
SIGNAL \ac|i2c|counter[0]~7\ : std_logic;
SIGNAL \ac|i2c|counter[1]~10_combout\ : std_logic;
SIGNAL \ac|i2c|counter[1]~11\ : std_logic;
SIGNAL \ac|i2c|counter[2]~12_combout\ : std_logic;
SIGNAL \ac|i2c|counter[2]~13\ : std_logic;
SIGNAL \ac|i2c|counter[3]~14_combout\ : std_logic;
SIGNAL \ac|i2c|counter[3]~15\ : std_logic;
SIGNAL \ac|i2c|counter[4]~16_combout\ : std_logic;
SIGNAL \ac|i2c|process_1~3_combout\ : std_logic;
SIGNAL \ac|i2c|counter[4]~17\ : std_logic;
SIGNAL \ac|i2c|counter[5]~18_combout\ : std_logic;
SIGNAL \ac|i2c|Equal2~0_combout\ : std_logic;
SIGNAL \ac|i2c|phase~4_combout\ : std_logic;
SIGNAL \ac|i2c|n_bits[0]~7_combout\ : std_logic;
SIGNAL \ac|i2c|i2c_sclk~3_combout\ : std_logic;
SIGNAL \ac|i2c|state~12_combout\ : std_logic;
SIGNAL \ac|i2c|n_bits[3]~14\ : std_logic;
SIGNAL \ac|i2c|n_bits[4]~15_combout\ : std_logic;
SIGNAL \ac|i2c|Equal3~0_combout\ : std_logic;
SIGNAL \ac|i2c|state~21_combout\ : std_logic;
SIGNAL \ac|i2c|state~15_combout\ : std_logic;
SIGNAL \ac|i2c|state~17_combout\ : std_logic;
SIGNAL \ac|i2c|state~18_combout\ : std_logic;
SIGNAL \ac|i2c|state.start_condition~q\ : std_logic;
SIGNAL \ac|i2c|state~13_combout\ : std_logic;
SIGNAL \ac|i2c|state~14_combout\ : std_logic;
SIGNAL \ac|i2c|state.in_progress~q\ : std_logic;
SIGNAL \ac|i2c|state.idle~0_combout\ : std_logic;
SIGNAL \ac|i2c|state~16_combout\ : std_logic;
SIGNAL \ac|i2c|state.stop_condition~q\ : std_logic;
SIGNAL \ac|i2c|n_bits~5_combout\ : std_logic;
SIGNAL \ac|i2c|n_bits~6_combout\ : std_logic;
SIGNAL \ac|i2c|n_bits[0]~8\ : std_logic;
SIGNAL \ac|i2c|n_bits[1]~9_combout\ : std_logic;
SIGNAL \ac|i2c|n_bits[1]~10\ : std_logic;
SIGNAL \ac|i2c|n_bits[2]~11_combout\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \ac|i2c|n_bits[2]~12\ : std_logic;
SIGNAL \ac|i2c|n_bits[3]~13_combout\ : std_logic;
SIGNAL \ac|i2c|process_1~2_combout\ : std_logic;
SIGNAL \ac|i2c|process_1~7_combout\ : std_logic;
SIGNAL \i2c_sdat~input_o\ : std_logic;
SIGNAL \ac|i2c|sampled_sdat~q\ : std_logic;
SIGNAL \ac|i2c|process_1~4_combout\ : std_logic;
SIGNAL \ac|i2c|process_1~5_combout\ : std_logic;
SIGNAL \ac|i2c|process_1~6_combout\ : std_logic;
SIGNAL \ac|i2c|state~19_combout\ : std_logic;
SIGNAL \ac|i2c|state~20_combout\ : std_logic;
SIGNAL \ac|i2c|state.idle~q\ : std_logic;
SIGNAL \ac|i2c|phase~3_combout\ : std_logic;
SIGNAL \ac|i2c|i2c_sclk~4_combout\ : std_logic;
SIGNAL \ac|i2c|i2c_sclk~5_combout\ : std_logic;
SIGNAL \ac|Mux0~0_combout\ : std_logic;
SIGNAL \ac|txd_data[1]~2_combout\ : std_logic;
SIGNAL \ac|Mux1~0_combout\ : std_logic;
SIGNAL \ac|Mux2~0_combout\ : std_logic;
SIGNAL \ac|Mux3~0_combout\ : std_logic;
SIGNAL \ac|Mux5~0_combout\ : std_logic;
SIGNAL \ac|Mux6~0_combout\ : std_logic;
SIGNAL \ac|txd_data[6]~feeder_combout\ : std_logic;
SIGNAL \ac|state[2]~_wirecell_combout\ : std_logic;
SIGNAL \ac|Mux7~0_combout\ : std_logic;
SIGNAL \ac|Mux7~1_combout\ : std_logic;
SIGNAL \ac|Mux8~2_combout\ : std_logic;
SIGNAL \ac|Mux8~3_combout\ : std_logic;
SIGNAL \ac|Mux11~0_combout\ : std_logic;
SIGNAL \ac|Mux9~0_combout\ : std_logic;
SIGNAL \ac|Mux9~1_combout\ : std_logic;
SIGNAL \ac|Mux10~0_combout\ : std_logic;
SIGNAL \ac|Mux12~0_combout\ : std_logic;
SIGNAL \ac|Mux12~1_combout\ : std_logic;
SIGNAL \ac|Mux12~2_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~25_combout\ : std_logic;
SIGNAL \ac|Mux11~1_combout\ : std_logic;
SIGNAL \ac|Mux11~2_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~24_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~23_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~22_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~21_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~20_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~19_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~18_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~17_combout\ : std_logic;
SIGNAL \ac|Mux4~0_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~16_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~15_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~14_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~13_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~12_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~11_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~10_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~9_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~8_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~7_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~6_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~5_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~4_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~3_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~2_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~1_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~0_combout\ : std_logic;
SIGNAL \ac|i2c|i2c_sdat~1_combout\ : std_logic;
SIGNAL \ac|i2c|i2c_sdat~2_combout\ : std_logic;
SIGNAL \ps2|ll|ps2_clk~en_q\ : std_logic;
SIGNAL \ps2|ll|Selector31~0_combout\ : std_logic;
SIGNAL \ps2|ll|Selector31~1_combout\ : std_logic;
SIGNAL \ps2|ll|Selector31~2_combout\ : std_logic;
SIGNAL \ps2|ll|Selector31~3_combout\ : std_logic;
SIGNAL \ps2|ll|ps2_dat~reg0feeder_combout\ : std_logic;
SIGNAL \ps2|ll|ps2_dat~reg0_q\ : std_logic;
SIGNAL \ps2|ll|Selector34~0_combout\ : std_logic;
SIGNAL \ps2|ll|Selector34~1_combout\ : std_logic;
SIGNAL \ps2|ll|Selector34~2_combout\ : std_logic;
SIGNAL \ps2|ll|ps2_dat~en_q\ : std_logic;
SIGNAL \s_dados_do_ps2~68_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~69_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~29_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~70_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~63_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~47_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~66_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~65_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~67_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~71_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~59_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~83_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~26_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~34_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~61_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~60_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~62_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~64_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~74_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~72_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~73_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~75_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~76_combout\ : std_logic;
SIGNAL \s_dados_do_ps2[0]~40_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~22_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~23_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~82_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~80_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~81_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~56_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~57_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~42_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~43_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~44_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~79_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~41_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~46_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~50_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~52_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~45_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~51_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~53_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~54_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~48_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~49_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~55_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~58_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~37_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~35_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~36_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~33_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~78_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~38_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~24_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~25_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~27_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~28_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~30_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~31_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~32_combout\ : std_logic;
SIGNAL \s_dados_do_ps2~39_combout\ : std_logic;
SIGNAL \bemol~0_combout\ : std_logic;
SIGNAL \Display1|decOut_n[0]~36_combout\ : std_logic;
SIGNAL \Display1|decOut_n[1]~37_combout\ : std_logic;
SIGNAL \Display1|decOut_n[2]~32_combout\ : std_logic;
SIGNAL \Display1|decOut_n[3]~31_combout\ : std_logic;
SIGNAL \Display1|decOut_n[4]~33_combout\ : std_logic;
SIGNAL \Display1|decOut_n[5]~34_combout\ : std_logic;
SIGNAL \Display1|decOut_n[6]~35_combout\ : std_logic;
SIGNAL \aio|c|PLL|auto_generated|wire_pll1_fbout\ : std_logic;
SIGNAL \aio|c|PLL|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\ : std_logic;
SIGNAL \aud_adclrck~input_o\ : std_logic;
SIGNAL \aio|left_right_0~feeder_combout\ : std_logic;
SIGNAL \aio|left_right_0~q\ : std_logic;
SIGNAL \aio|left_right_1~q\ : std_logic;
SIGNAL \MuxOitava|dataOut[8]~45_combout\ : std_logic;
SIGNAL \Sin|addr_q_1[0]~24_combout\ : std_logic;
SIGNAL \Sin|addr_q_1[0]~_wirecell_combout\ : std_logic;
SIGNAL \MuxOitava|dataOut[9]~46_combout\ : std_logic;
SIGNAL \MuxOitava|dataOut[10]~54_combout\ : std_logic;
SIGNAL \Sin|addr_p_1[2]~0_combout\ : std_logic;
SIGNAL \MuxOitava|dataOut[11]~55_combout\ : std_logic;
SIGNAL \Sin|addr_p_1[3]~1_combout\ : std_logic;
SIGNAL \MuxOitava|dataOut[12]~47_combout\ : std_logic;
SIGNAL \Sin|addr_p_1[4]~2_combout\ : std_logic;
SIGNAL \MuxOitava|dataOut[13]~56_combout\ : std_logic;
SIGNAL \Sin|addr_p_1[5]~3_combout\ : std_logic;
SIGNAL \MuxOitava|dataOut[14]~57_combout\ : std_logic;
SIGNAL \Sin|addr_p_1[6]~4_combout\ : std_logic;
SIGNAL \MuxOitava|dataOut[15]~58_combout\ : std_logic;
SIGNAL \TestaOitava|isOctave~0_combout\ : std_logic;
SIGNAL \Sin|addr_q_1[1]~8_combout\ : std_logic;
SIGNAL \Sin|addr_q_1[1]~9\ : std_logic;
SIGNAL \Sin|addr_q_1[2]~10_combout\ : std_logic;
SIGNAL \Sin|addr_q_1[2]~11\ : std_logic;
SIGNAL \Sin|addr_q_1[3]~12_combout\ : std_logic;
SIGNAL \Sin|addr_q_1[3]~13\ : std_logic;
SIGNAL \Sin|addr_q_1[4]~14_combout\ : std_logic;
SIGNAL \Sin|addr_q_1[4]~15\ : std_logic;
SIGNAL \Sin|addr_q_1[5]~16_combout\ : std_logic;
SIGNAL \Sin|addr_q_1[5]~17\ : std_logic;
SIGNAL \Sin|addr_q_1[6]~18_combout\ : std_logic;
SIGNAL \Sin|addr_q_1[6]~19\ : std_logic;
SIGNAL \Sin|addr_q_1[7]~20_combout\ : std_logic;
SIGNAL \ROM|Mux0~0_combout\ : std_logic;
SIGNAL \Sin|addr_q_1[7]~21\ : std_logic;
SIGNAL \Sin|addr_q_1[8]~22_combout\ : std_logic;
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a7~PORTBDATAOUT0\ : std_logic;
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a8~PORTBDATAOUT0\ : std_logic;
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a9~PORTBDATAOUT0\ : std_logic;
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a10~PORTBDATAOUT0\ : std_logic;
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a11~PORTBDATAOUT0\ : std_logic;
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a12~PORTBDATAOUT0\ : std_logic;
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a13~PORTBDATAOUT0\ : std_logic;
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a14~PORTBDATAOUT0\ : std_logic;
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a15~PORTBDATAOUT0\ : std_logic;
SIGNAL \MuxOitava|dataOut[0]~43_combout\ : std_logic;
SIGNAL \Sin|factor_q_1[0]~0_combout\ : std_logic;
SIGNAL \Sin|factor_q_2[0]~feeder_combout\ : std_logic;
SIGNAL \MuxOitava|dataOut[1]~44_combout\ : std_logic;
SIGNAL \Sin|factor_q_2[1]~feeder_combout\ : std_logic;
SIGNAL \MuxOitava|dataOut[2]~48_combout\ : std_logic;
SIGNAL \Sin|factor_q_2[2]~feeder_combout\ : std_logic;
SIGNAL \MuxOitava|dataOut[3]~49_combout\ : std_logic;
SIGNAL \Sin|factor_q_2[3]~feeder_combout\ : std_logic;
SIGNAL \MuxOitava|dataOut[4]~50_combout\ : std_logic;
SIGNAL \Sin|factor_q_2[4]~feeder_combout\ : std_logic;
SIGNAL \MuxOitava|dataOut[5]~53_combout\ : std_logic;
SIGNAL \Sin|factor_q_1[5]~1_combout\ : std_logic;
SIGNAL \Sin|factor_q_2[5]~feeder_combout\ : std_logic;
SIGNAL \MuxOitava|dataOut[6]~52_combout\ : std_logic;
SIGNAL \MuxOitava|dataOut[7]~51_combout\ : std_logic;
SIGNAL \Sin|factor_q_2[7]~feeder_combout\ : std_logic;
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a0~PORTBDATAOUT0\ : std_logic;
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a1~PORTBDATAOUT0\ : std_logic;
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a2~PORTBDATAOUT0\ : std_logic;
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a3~PORTBDATAOUT0\ : std_logic;
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a4~PORTBDATAOUT0\ : std_logic;
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a5~PORTBDATAOUT0\ : std_logic;
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a6~PORTBDATAOUT0\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~dataout\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~DATAOUT1\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~DATAOUT2\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~DATAOUT3\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~DATAOUT4\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~DATAOUT5\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~DATAOUT6\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~DATAOUT7\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~DATAOUT8\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~DATAOUT9\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~DATAOUT10\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~DATAOUT11\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~DATAOUT12\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~DATAOUT13\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~DATAOUT14\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~DATAOUT15\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~DATAOUT16\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~DATAOUT17\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~DATAOUT18\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~DATAOUT19\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~DATAOUT20\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~DATAOUT21\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~DATAOUT22\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~DATAOUT23\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~DATAOUT24\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~0\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~1\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~2\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~3\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~4\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~5\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~6\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~7\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~8\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~9\ : std_logic;
SIGNAL \Sin|Mult1|auto_generated|mac_mult1~10\ : std_logic;
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a6\ : std_logic;
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a7\ : std_logic;
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a8\ : std_logic;
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a9\ : std_logic;
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a10\ : std_logic;
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a11\ : std_logic;
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a12\ : std_logic;
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a13\ : std_logic;
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a14\ : std_logic;
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a15\ : std_logic;
SIGNAL \Sin|factor_p_1[1]~8_combout\ : std_logic;
SIGNAL \Sin|factor_p_2[1]~feeder_combout\ : std_logic;
SIGNAL \Sin|factor_p_1[1]~9\ : std_logic;
SIGNAL \Sin|factor_p_1[2]~10_combout\ : std_logic;
SIGNAL \Sin|factor_p_2[2]~feeder_combout\ : std_logic;
SIGNAL \Sin|factor_p_1[2]~11\ : std_logic;
SIGNAL \Sin|factor_p_1[3]~12_combout\ : std_logic;
SIGNAL \Sin|factor_p_2[3]~feeder_combout\ : std_logic;
SIGNAL \Sin|factor_p_1[3]~13\ : std_logic;
SIGNAL \Sin|factor_p_1[4]~14_combout\ : std_logic;
SIGNAL \Sin|factor_p_1[4]~15\ : std_logic;
SIGNAL \Sin|factor_p_1[5]~16_combout\ : std_logic;
SIGNAL \Sin|factor_p_2[5]~feeder_combout\ : std_logic;
SIGNAL \Sin|factor_p_1[5]~17\ : std_logic;
SIGNAL \Sin|factor_p_1[6]~18_combout\ : std_logic;
SIGNAL \Sin|factor_p_1[6]~19\ : std_logic;
SIGNAL \Sin|factor_p_1[7]~20_combout\ : std_logic;
SIGNAL \Sin|factor_p_2[7]~feeder_combout\ : std_logic;
SIGNAL \Sin|factor_p_1[7]~21\ : std_logic;
SIGNAL \Sin|factor_p_1[8]~22_combout\ : std_logic;
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a0~portadataout\ : std_logic;
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a1\ : std_logic;
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a2\ : std_logic;
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a3\ : std_logic;
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a4\ : std_logic;
SIGNAL \Sin|rom_rtl_0|auto_generated|ram_block1a5\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~dataout\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~DATAOUT1\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~DATAOUT2\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~DATAOUT3\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~DATAOUT4\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~DATAOUT5\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~DATAOUT6\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~DATAOUT7\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~DATAOUT8\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~DATAOUT9\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~DATAOUT10\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~DATAOUT11\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~DATAOUT12\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~DATAOUT13\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~DATAOUT14\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~DATAOUT15\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~DATAOUT16\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~DATAOUT17\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~DATAOUT18\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~DATAOUT19\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~DATAOUT20\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~DATAOUT21\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~DATAOUT22\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~DATAOUT23\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~DATAOUT24\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~DATAOUT25\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~0\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~1\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~2\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~3\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~4\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~5\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~6\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~7\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~8\ : std_logic;
SIGNAL \Sin|Mult0|auto_generated|mac_mult1~9\ : std_logic;
SIGNAL \Sin|sin_5[0]~17_cout\ : std_logic;
SIGNAL \Sin|sin_5[0]~19_cout\ : std_logic;
SIGNAL \Sin|sin_5[0]~21_cout\ : std_logic;
SIGNAL \Sin|sin_5[0]~23_cout\ : std_logic;
SIGNAL \Sin|sin_5[0]~25_cout\ : std_logic;
SIGNAL \Sin|sin_5[0]~27_cout\ : std_logic;
SIGNAL \Sin|sin_5[0]~29_cout\ : std_logic;
SIGNAL \Sin|sin_5[0]~31_cout\ : std_logic;
SIGNAL \Sin|sin_5[0]~33\ : std_logic;
SIGNAL \Sin|sin_5[1]~35\ : std_logic;
SIGNAL \Sin|sin_5[2]~37\ : std_logic;
SIGNAL \Sin|sin_5[3]~39\ : std_logic;
SIGNAL \Sin|sin_5[4]~41\ : std_logic;
SIGNAL \Sin|sin_5[5]~43\ : std_logic;
SIGNAL \Sin|sin_5[6]~45\ : std_logic;
SIGNAL \Sin|sin_5[7]~47\ : std_logic;
SIGNAL \Sin|sin_5[8]~49\ : std_logic;
SIGNAL \Sin|sin_5[9]~51\ : std_logic;
SIGNAL \Sin|sin_5[10]~53\ : std_logic;
SIGNAL \Sin|sin_5[11]~55\ : std_logic;
SIGNAL \Sin|sin_5[12]~57\ : std_logic;
SIGNAL \Sin|sin_5[13]~58_combout\ : std_logic;
SIGNAL \Sin|sin_5[12]~56_combout\ : std_logic;
SIGNAL \Sin|sin_5[11]~54_combout\ : std_logic;
SIGNAL \Sin|sin_5[10]~52_combout\ : std_logic;
SIGNAL \Sin|sin_5[9]~50_combout\ : std_logic;
SIGNAL \Sin|sin_5[8]~48_combout\ : std_logic;
SIGNAL \Sin|sin_5[7]~46_combout\ : std_logic;
SIGNAL \Sin|sin_5[6]~44_combout\ : std_logic;
SIGNAL \Sin|sin_5[5]~42_combout\ : std_logic;
SIGNAL \Sin|sin_5[4]~40_combout\ : std_logic;
SIGNAL \Sin|sin_5[2]~36_combout\ : std_logic;
SIGNAL \Sin|sin_5[1]~34_combout\ : std_logic;
SIGNAL \Sin|sin_5[0]~32_combout\ : std_logic;
SIGNAL \Sin|sin_5[13]~59\ : std_logic;
SIGNAL \Sin|sin_5[14]~61\ : std_logic;
SIGNAL \Sin|sin_5[15]~62_combout\ : std_logic;
SIGNAL \aud_bclk~input_o\ : std_logic;
SIGNAL \aio|bit_clock_0~feeder_combout\ : std_logic;
SIGNAL \aio|bit_clock_0~q\ : std_logic;
SIGNAL \aio|bit_clock_1~q\ : std_logic;
SIGNAL \aio|process_0~0_combout\ : std_logic;
SIGNAL \aio|dac_shift_control~0_combout\ : std_logic;
SIGNAL \aio|dac_shift_control~q\ : std_logic;
SIGNAL \aio|dac_data[24]~1_combout\ : std_logic;
SIGNAL \aio|dac_data~32_combout\ : std_logic;
SIGNAL \aio|dac_data~31_combout\ : std_logic;
SIGNAL \aio|dac_data~30_combout\ : std_logic;
SIGNAL \Sin|sin_5[3]~38_combout\ : std_logic;
SIGNAL \aio|dac_data~29_combout\ : std_logic;
SIGNAL \aio|dac_data~28_combout\ : std_logic;
SIGNAL \aio|dac_data~27_combout\ : std_logic;
SIGNAL \aio|dac_data~26_combout\ : std_logic;
SIGNAL \aio|dac_data~25_combout\ : std_logic;
SIGNAL \aio|dac_data~24_combout\ : std_logic;
SIGNAL \aio|dac_data~23_combout\ : std_logic;
SIGNAL \aio|dac_data~22_combout\ : std_logic;
SIGNAL \aio|dac_data~21_combout\ : std_logic;
SIGNAL \aio|dac_data~20_combout\ : std_logic;
SIGNAL \aio|dac_data~19_combout\ : std_logic;
SIGNAL \Sin|sin_5[14]~60_combout\ : std_logic;
SIGNAL \aio|dac_data~18_combout\ : std_logic;
SIGNAL \aio|dac_data~17_combout\ : std_logic;
SIGNAL \aio|dac_data~16_combout\ : std_logic;
SIGNAL \aio|dac_data~15_combout\ : std_logic;
SIGNAL \aio|dac_data~14_combout\ : std_logic;
SIGNAL \aio|dac_data~13_combout\ : std_logic;
SIGNAL \aio|dac_data~12_combout\ : std_logic;
SIGNAL \aio|dac_data~11_combout\ : std_logic;
SIGNAL \aio|dac_data~10_combout\ : std_logic;
SIGNAL \aio|dac_data~9_combout\ : std_logic;
SIGNAL \aio|dac_data~8_combout\ : std_logic;
SIGNAL \aio|dac_data~7_combout\ : std_logic;
SIGNAL \aio|dac_data~6_combout\ : std_logic;
SIGNAL \aio|dac_data~5_combout\ : std_logic;
SIGNAL \aio|dac_data~4_combout\ : std_logic;
SIGNAL \aio|dac_data~3_combout\ : std_logic;
SIGNAL \aio|dac_data~2_combout\ : std_logic;
SIGNAL \aio|dac_data~0_combout\ : std_logic;
SIGNAL \vol|s_sound\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \aio|c|PLL|auto_generated|wire_pll1_clk\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \ac|i2c|counter\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \Sin|factor_p_1\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \ps2|ll|data\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \Sin|sin_5\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \ac|i2c|n_bits\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \ps2|ll|n_bits\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ps2|ll|time_out_counter\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \Sin|prod_p_4\ : std_logic_vector(25 DOWNTO 0);
SIGNAL \Sin|prod_q_4\ : std_logic_vector(25 DOWNTO 0);
SIGNAL \ps2|txd_data\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \Sin|addr_q_1\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \ac|txd_data\ : std_logic_vector(15 DOWNTO 0);
SIGNAL s_dados_do_ps2 : std_logic_vector(3 DOWNTO 0);
SIGNAL \aio|dac_data\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \ps2|key_code\ : std_logic_vector(7 DOWNTO 0);
SIGNAL last_key_code : std_logic_vector(7 DOWNTO 0);
SIGNAL \Sin|factor_q_1\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \ps2|ll|rxd_data\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ac|i2c|phase\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \ac|i2c|data_to_write\ : std_logic_vector(26 DOWNTO 0);
SIGNAL \Sin|factor_q_2\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \ps2|ll|sampling_counter\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \ps2|time_out_counter\ : std_logic_vector(27 DOWNTO 0);
SIGNAL \Sin|factor_p_2\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \ps2|ll|idle_counter\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \ac|state\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ac|delay\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \ac|current_config.line_in_gain\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \ac|current_config.volume\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \ac|desired_config.volume\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \Sin|addr_p_1\ : std_logic_vector(8 DOWNTO 0);
SIGNAL s_volume : std_logic_vector(6 DOWNTO 0);
SIGNAL \Display1|ALT_INV_decOut_n[4]~33_combout\ : std_logic;
SIGNAL \ps2|ll|ALT_INV_time_out_counter[0]~12_combout\ : std_logic;
SIGNAL \ps2|ll|ALT_INV_state.idle~q\ : std_logic;
SIGNAL \ac|i2c|ALT_INV_state.idle~q\ : std_logic;
SIGNAL \ps2|ll|ALT_INV_ps2_clk~en_q\ : std_logic;
SIGNAL \ALT_INV_bemol~0_combout\ : std_logic;

BEGIN

ww_CLOCK_50 <= CLOCK_50;
HEX0 <= ww_HEX0;
HEX1 <= ww_HEX1;
aud_xck <= ww_aud_xck;
ww_aud_bclk <= aud_bclk;
ww_aud_adclrck <= aud_adclrck;
ww_aud_adcdat <= aud_adcdat;
aud_dacdat <= ww_aud_dacdat;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\aio|c|PLL|auto_generated|pll1_INCLK_bus\ <= (gnd & \CLOCK_50~input_o\);

\aio|c|PLL|auto_generated|wire_pll1_clk\(0) <= \aio|c|PLL|auto_generated|pll1_CLK_bus\(0);
\aio|c|PLL|auto_generated|wire_pll1_clk\(1) <= \aio|c|PLL|auto_generated|pll1_CLK_bus\(1);
\aio|c|PLL|auto_generated|wire_pll1_clk\(2) <= \aio|c|PLL|auto_generated|pll1_CLK_bus\(2);
\aio|c|PLL|auto_generated|wire_pll1_clk\(3) <= \aio|c|PLL|auto_generated|pll1_CLK_bus\(3);
\aio|c|PLL|auto_generated|wire_pll1_clk\(4) <= \aio|c|PLL|auto_generated|pll1_CLK_bus\(4);

\Sin|Mult0|auto_generated|mac_out2_DATAA_bus\ <= (\Sin|Mult0|auto_generated|mac_mult1~DATAOUT25\ & \Sin|Mult0|auto_generated|mac_mult1~DATAOUT24\ & \Sin|Mult0|auto_generated|mac_mult1~DATAOUT23\ & \Sin|Mult0|auto_generated|mac_mult1~DATAOUT22\ & 
\Sin|Mult0|auto_generated|mac_mult1~DATAOUT21\ & \Sin|Mult0|auto_generated|mac_mult1~DATAOUT20\ & \Sin|Mult0|auto_generated|mac_mult1~DATAOUT19\ & \Sin|Mult0|auto_generated|mac_mult1~DATAOUT18\ & \Sin|Mult0|auto_generated|mac_mult1~DATAOUT17\ & 
\Sin|Mult0|auto_generated|mac_mult1~DATAOUT16\ & \Sin|Mult0|auto_generated|mac_mult1~DATAOUT15\ & \Sin|Mult0|auto_generated|mac_mult1~DATAOUT14\ & \Sin|Mult0|auto_generated|mac_mult1~DATAOUT13\ & \Sin|Mult0|auto_generated|mac_mult1~DATAOUT12\ & 
\Sin|Mult0|auto_generated|mac_mult1~DATAOUT11\ & \Sin|Mult0|auto_generated|mac_mult1~DATAOUT10\ & \Sin|Mult0|auto_generated|mac_mult1~DATAOUT9\ & \Sin|Mult0|auto_generated|mac_mult1~DATAOUT8\ & \Sin|Mult0|auto_generated|mac_mult1~DATAOUT7\ & 
\Sin|Mult0|auto_generated|mac_mult1~DATAOUT6\ & \Sin|Mult0|auto_generated|mac_mult1~DATAOUT5\ & \Sin|Mult0|auto_generated|mac_mult1~DATAOUT4\ & \Sin|Mult0|auto_generated|mac_mult1~DATAOUT3\ & \Sin|Mult0|auto_generated|mac_mult1~DATAOUT2\ & 
\Sin|Mult0|auto_generated|mac_mult1~DATAOUT1\ & \Sin|Mult0|auto_generated|mac_mult1~dataout\ & \Sin|Mult0|auto_generated|mac_mult1~9\ & \Sin|Mult0|auto_generated|mac_mult1~8\ & \Sin|Mult0|auto_generated|mac_mult1~7\ & 
\Sin|Mult0|auto_generated|mac_mult1~6\ & \Sin|Mult0|auto_generated|mac_mult1~5\ & \Sin|Mult0|auto_generated|mac_mult1~4\ & \Sin|Mult0|auto_generated|mac_mult1~3\ & \Sin|Mult0|auto_generated|mac_mult1~2\ & \Sin|Mult0|auto_generated|mac_mult1~1\ & 
\Sin|Mult0|auto_generated|mac_mult1~0\);

\Sin|Mult0|auto_generated|mac_out2~0\ <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(0);
\Sin|Mult0|auto_generated|mac_out2~1\ <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(1);
\Sin|Mult0|auto_generated|mac_out2~2\ <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(2);
\Sin|Mult0|auto_generated|mac_out2~3\ <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(3);
\Sin|Mult0|auto_generated|mac_out2~4\ <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(4);
\Sin|Mult0|auto_generated|mac_out2~5\ <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(5);
\Sin|Mult0|auto_generated|mac_out2~6\ <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(6);
\Sin|Mult0|auto_generated|mac_out2~7\ <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(7);
\Sin|Mult0|auto_generated|mac_out2~8\ <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(8);
\Sin|Mult0|auto_generated|mac_out2~9\ <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(9);
\Sin|prod_p_4\(0) <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(10);
\Sin|prod_p_4\(1) <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(11);
\Sin|prod_p_4\(2) <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(12);
\Sin|prod_p_4\(3) <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(13);
\Sin|prod_p_4\(4) <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(14);
\Sin|prod_p_4\(5) <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(15);
\Sin|prod_p_4\(6) <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(16);
\Sin|prod_p_4\(7) <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(17);
\Sin|prod_p_4\(8) <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(18);
\Sin|prod_p_4\(9) <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(19);
\Sin|prod_p_4\(10) <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(20);
\Sin|prod_p_4\(11) <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(21);
\Sin|prod_p_4\(12) <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(22);
\Sin|prod_p_4\(13) <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(23);
\Sin|prod_p_4\(14) <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(24);
\Sin|prod_p_4\(15) <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(25);
\Sin|prod_p_4\(16) <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(26);
\Sin|prod_p_4\(17) <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(27);
\Sin|prod_p_4\(18) <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(28);
\Sin|prod_p_4\(19) <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(29);
\Sin|prod_p_4\(20) <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(30);
\Sin|prod_p_4\(21) <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(31);
\Sin|prod_p_4\(22) <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(32);
\Sin|prod_p_4\(23) <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(33);
\Sin|Mult0|auto_generated|mac_out2~DATAOUT24\ <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(34);
\Sin|Mult0|auto_generated|mac_out2~DATAOUT25\ <= \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\(35);

\Sin|Mult1|auto_generated|mac_out2_DATAA_bus\ <= (\Sin|Mult1|auto_generated|mac_mult1~DATAOUT24\ & \Sin|Mult1|auto_generated|mac_mult1~DATAOUT23\ & \Sin|Mult1|auto_generated|mac_mult1~DATAOUT22\ & \Sin|Mult1|auto_generated|mac_mult1~DATAOUT21\ & 
\Sin|Mult1|auto_generated|mac_mult1~DATAOUT20\ & \Sin|Mult1|auto_generated|mac_mult1~DATAOUT19\ & \Sin|Mult1|auto_generated|mac_mult1~DATAOUT18\ & \Sin|Mult1|auto_generated|mac_mult1~DATAOUT17\ & \Sin|Mult1|auto_generated|mac_mult1~DATAOUT16\ & 
\Sin|Mult1|auto_generated|mac_mult1~DATAOUT15\ & \Sin|Mult1|auto_generated|mac_mult1~DATAOUT14\ & \Sin|Mult1|auto_generated|mac_mult1~DATAOUT13\ & \Sin|Mult1|auto_generated|mac_mult1~DATAOUT12\ & \Sin|Mult1|auto_generated|mac_mult1~DATAOUT11\ & 
\Sin|Mult1|auto_generated|mac_mult1~DATAOUT10\ & \Sin|Mult1|auto_generated|mac_mult1~DATAOUT9\ & \Sin|Mult1|auto_generated|mac_mult1~DATAOUT8\ & \Sin|Mult1|auto_generated|mac_mult1~DATAOUT7\ & \Sin|Mult1|auto_generated|mac_mult1~DATAOUT6\ & 
\Sin|Mult1|auto_generated|mac_mult1~DATAOUT5\ & \Sin|Mult1|auto_generated|mac_mult1~DATAOUT4\ & \Sin|Mult1|auto_generated|mac_mult1~DATAOUT3\ & \Sin|Mult1|auto_generated|mac_mult1~DATAOUT2\ & \Sin|Mult1|auto_generated|mac_mult1~DATAOUT1\ & 
\Sin|Mult1|auto_generated|mac_mult1~dataout\ & \Sin|Mult1|auto_generated|mac_mult1~10\ & \Sin|Mult1|auto_generated|mac_mult1~9\ & \Sin|Mult1|auto_generated|mac_mult1~8\ & \Sin|Mult1|auto_generated|mac_mult1~7\ & \Sin|Mult1|auto_generated|mac_mult1~6\ & 
\Sin|Mult1|auto_generated|mac_mult1~5\ & \Sin|Mult1|auto_generated|mac_mult1~4\ & \Sin|Mult1|auto_generated|mac_mult1~3\ & \Sin|Mult1|auto_generated|mac_mult1~2\ & \Sin|Mult1|auto_generated|mac_mult1~1\ & \Sin|Mult1|auto_generated|mac_mult1~0\);

\Sin|Mult1|auto_generated|mac_out2~0\ <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(0);
\Sin|Mult1|auto_generated|mac_out2~1\ <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(1);
\Sin|Mult1|auto_generated|mac_out2~2\ <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(2);
\Sin|Mult1|auto_generated|mac_out2~3\ <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(3);
\Sin|Mult1|auto_generated|mac_out2~4\ <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(4);
\Sin|Mult1|auto_generated|mac_out2~5\ <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(5);
\Sin|Mult1|auto_generated|mac_out2~6\ <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(6);
\Sin|Mult1|auto_generated|mac_out2~7\ <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(7);
\Sin|Mult1|auto_generated|mac_out2~8\ <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(8);
\Sin|Mult1|auto_generated|mac_out2~9\ <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(9);
\Sin|Mult1|auto_generated|mac_out2~10\ <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(10);
\Sin|prod_q_4\(0) <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(11);
\Sin|prod_q_4\(1) <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(12);
\Sin|prod_q_4\(2) <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(13);
\Sin|prod_q_4\(3) <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(14);
\Sin|prod_q_4\(4) <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(15);
\Sin|prod_q_4\(5) <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(16);
\Sin|prod_q_4\(6) <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(17);
\Sin|prod_q_4\(7) <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(18);
\Sin|prod_q_4\(8) <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(19);
\Sin|prod_q_4\(9) <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(20);
\Sin|prod_q_4\(10) <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(21);
\Sin|prod_q_4\(11) <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(22);
\Sin|prod_q_4\(12) <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(23);
\Sin|prod_q_4\(13) <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(24);
\Sin|prod_q_4\(14) <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(25);
\Sin|prod_q_4\(15) <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(26);
\Sin|prod_q_4\(16) <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(27);
\Sin|prod_q_4\(17) <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(28);
\Sin|prod_q_4\(18) <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(29);
\Sin|prod_q_4\(19) <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(30);
\Sin|prod_q_4\(20) <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(31);
\Sin|prod_q_4\(21) <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(32);
\Sin|prod_q_4\(22) <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(33);
\Sin|prod_q_4\(23) <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(34);
\Sin|Mult1|auto_generated|mac_out2~DATAOUT24\ <= \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\(35);

\Sin|Mult0|auto_generated|mac_mult1_DATAA_bus\ <= (\Sin|rom_rtl_0|auto_generated|ram_block1a15\ & \Sin|rom_rtl_0|auto_generated|ram_block1a14\ & \Sin|rom_rtl_0|auto_generated|ram_block1a13\ & \Sin|rom_rtl_0|auto_generated|ram_block1a12\ & 
\Sin|rom_rtl_0|auto_generated|ram_block1a11\ & \Sin|rom_rtl_0|auto_generated|ram_block1a10\ & \Sin|rom_rtl_0|auto_generated|ram_block1a9\ & \Sin|rom_rtl_0|auto_generated|ram_block1a8\ & \Sin|rom_rtl_0|auto_generated|ram_block1a7\ & 
\Sin|rom_rtl_0|auto_generated|ram_block1a6\ & \Sin|rom_rtl_0|auto_generated|ram_block1a5\ & \Sin|rom_rtl_0|auto_generated|ram_block1a4\ & \Sin|rom_rtl_0|auto_generated|ram_block1a3\ & \Sin|rom_rtl_0|auto_generated|ram_block1a2\ & 
\Sin|rom_rtl_0|auto_generated|ram_block1a1\ & \Sin|rom_rtl_0|auto_generated|ram_block1a0~portadataout\ & gnd & gnd);

\Sin|Mult0|auto_generated|mac_mult1_DATAB_bus\ <= (gnd & \Sin|factor_p_2\(8) & \Sin|factor_p_2\(7) & \Sin|factor_p_2\(6) & \Sin|factor_p_2\(5) & \Sin|factor_p_2\(4) & \Sin|factor_p_2\(3) & \Sin|factor_p_2\(2) & \Sin|factor_p_2\(1) & 
\Sin|factor_q_2\(0) & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Sin|Mult0|auto_generated|mac_mult1~0\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(0);
\Sin|Mult0|auto_generated|mac_mult1~1\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(1);
\Sin|Mult0|auto_generated|mac_mult1~2\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(2);
\Sin|Mult0|auto_generated|mac_mult1~3\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(3);
\Sin|Mult0|auto_generated|mac_mult1~4\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(4);
\Sin|Mult0|auto_generated|mac_mult1~5\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(5);
\Sin|Mult0|auto_generated|mac_mult1~6\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(6);
\Sin|Mult0|auto_generated|mac_mult1~7\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(7);
\Sin|Mult0|auto_generated|mac_mult1~8\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(8);
\Sin|Mult0|auto_generated|mac_mult1~9\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(9);
\Sin|Mult0|auto_generated|mac_mult1~dataout\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(10);
\Sin|Mult0|auto_generated|mac_mult1~DATAOUT1\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(11);
\Sin|Mult0|auto_generated|mac_mult1~DATAOUT2\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(12);
\Sin|Mult0|auto_generated|mac_mult1~DATAOUT3\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(13);
\Sin|Mult0|auto_generated|mac_mult1~DATAOUT4\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(14);
\Sin|Mult0|auto_generated|mac_mult1~DATAOUT5\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(15);
\Sin|Mult0|auto_generated|mac_mult1~DATAOUT6\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(16);
\Sin|Mult0|auto_generated|mac_mult1~DATAOUT7\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(17);
\Sin|Mult0|auto_generated|mac_mult1~DATAOUT8\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(18);
\Sin|Mult0|auto_generated|mac_mult1~DATAOUT9\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(19);
\Sin|Mult0|auto_generated|mac_mult1~DATAOUT10\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(20);
\Sin|Mult0|auto_generated|mac_mult1~DATAOUT11\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(21);
\Sin|Mult0|auto_generated|mac_mult1~DATAOUT12\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(22);
\Sin|Mult0|auto_generated|mac_mult1~DATAOUT13\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(23);
\Sin|Mult0|auto_generated|mac_mult1~DATAOUT14\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(24);
\Sin|Mult0|auto_generated|mac_mult1~DATAOUT15\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(25);
\Sin|Mult0|auto_generated|mac_mult1~DATAOUT16\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(26);
\Sin|Mult0|auto_generated|mac_mult1~DATAOUT17\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(27);
\Sin|Mult0|auto_generated|mac_mult1~DATAOUT18\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(28);
\Sin|Mult0|auto_generated|mac_mult1~DATAOUT19\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(29);
\Sin|Mult0|auto_generated|mac_mult1~DATAOUT20\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(30);
\Sin|Mult0|auto_generated|mac_mult1~DATAOUT21\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(31);
\Sin|Mult0|auto_generated|mac_mult1~DATAOUT22\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(32);
\Sin|Mult0|auto_generated|mac_mult1~DATAOUT23\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(33);
\Sin|Mult0|auto_generated|mac_mult1~DATAOUT24\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(34);
\Sin|Mult0|auto_generated|mac_mult1~DATAOUT25\ <= \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(35);

\Sin|Mult1|auto_generated|mac_mult1_DATAA_bus\ <= (\Sin|rom_rtl_0|auto_generated|ram_block1a15~PORTBDATAOUT0\ & \Sin|rom_rtl_0|auto_generated|ram_block1a14~PORTBDATAOUT0\ & \Sin|rom_rtl_0|auto_generated|ram_block1a13~PORTBDATAOUT0\ & 
\Sin|rom_rtl_0|auto_generated|ram_block1a12~PORTBDATAOUT0\ & \Sin|rom_rtl_0|auto_generated|ram_block1a11~PORTBDATAOUT0\ & \Sin|rom_rtl_0|auto_generated|ram_block1a10~PORTBDATAOUT0\ & \Sin|rom_rtl_0|auto_generated|ram_block1a9~PORTBDATAOUT0\ & 
\Sin|rom_rtl_0|auto_generated|ram_block1a8~PORTBDATAOUT0\ & \Sin|rom_rtl_0|auto_generated|ram_block1a7~PORTBDATAOUT0\ & \Sin|rom_rtl_0|auto_generated|ram_block1a6~PORTBDATAOUT0\ & \Sin|rom_rtl_0|auto_generated|ram_block1a5~PORTBDATAOUT0\ & 
\Sin|rom_rtl_0|auto_generated|ram_block1a4~PORTBDATAOUT0\ & \Sin|rom_rtl_0|auto_generated|ram_block1a3~PORTBDATAOUT0\ & \Sin|rom_rtl_0|auto_generated|ram_block1a2~PORTBDATAOUT0\ & \Sin|rom_rtl_0|auto_generated|ram_block1a1~PORTBDATAOUT0\ & 
\Sin|rom_rtl_0|auto_generated|ram_block1a0~PORTBDATAOUT0\ & gnd & gnd);

\Sin|Mult1|auto_generated|mac_mult1_DATAB_bus\ <= (gnd & \Sin|factor_q_2\(7) & \Sin|factor_q_2\(6) & \Sin|factor_q_2\(5) & \Sin|factor_q_2\(4) & \Sin|factor_q_2\(3) & \Sin|factor_q_2\(2) & \Sin|factor_q_2\(1) & \Sin|factor_q_2\(0) & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Sin|Mult1|auto_generated|mac_mult1~0\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(0);
\Sin|Mult1|auto_generated|mac_mult1~1\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(1);
\Sin|Mult1|auto_generated|mac_mult1~2\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(2);
\Sin|Mult1|auto_generated|mac_mult1~3\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(3);
\Sin|Mult1|auto_generated|mac_mult1~4\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(4);
\Sin|Mult1|auto_generated|mac_mult1~5\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(5);
\Sin|Mult1|auto_generated|mac_mult1~6\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(6);
\Sin|Mult1|auto_generated|mac_mult1~7\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(7);
\Sin|Mult1|auto_generated|mac_mult1~8\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(8);
\Sin|Mult1|auto_generated|mac_mult1~9\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(9);
\Sin|Mult1|auto_generated|mac_mult1~10\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(10);
\Sin|Mult1|auto_generated|mac_mult1~dataout\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(11);
\Sin|Mult1|auto_generated|mac_mult1~DATAOUT1\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(12);
\Sin|Mult1|auto_generated|mac_mult1~DATAOUT2\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(13);
\Sin|Mult1|auto_generated|mac_mult1~DATAOUT3\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(14);
\Sin|Mult1|auto_generated|mac_mult1~DATAOUT4\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(15);
\Sin|Mult1|auto_generated|mac_mult1~DATAOUT5\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(16);
\Sin|Mult1|auto_generated|mac_mult1~DATAOUT6\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(17);
\Sin|Mult1|auto_generated|mac_mult1~DATAOUT7\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(18);
\Sin|Mult1|auto_generated|mac_mult1~DATAOUT8\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(19);
\Sin|Mult1|auto_generated|mac_mult1~DATAOUT9\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(20);
\Sin|Mult1|auto_generated|mac_mult1~DATAOUT10\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(21);
\Sin|Mult1|auto_generated|mac_mult1~DATAOUT11\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(22);
\Sin|Mult1|auto_generated|mac_mult1~DATAOUT12\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(23);
\Sin|Mult1|auto_generated|mac_mult1~DATAOUT13\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(24);
\Sin|Mult1|auto_generated|mac_mult1~DATAOUT14\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(25);
\Sin|Mult1|auto_generated|mac_mult1~DATAOUT15\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(26);
\Sin|Mult1|auto_generated|mac_mult1~DATAOUT16\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(27);
\Sin|Mult1|auto_generated|mac_mult1~DATAOUT17\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(28);
\Sin|Mult1|auto_generated|mac_mult1~DATAOUT18\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(29);
\Sin|Mult1|auto_generated|mac_mult1~DATAOUT19\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(30);
\Sin|Mult1|auto_generated|mac_mult1~DATAOUT20\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(31);
\Sin|Mult1|auto_generated|mac_mult1~DATAOUT21\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(32);
\Sin|Mult1|auto_generated|mac_mult1~DATAOUT22\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(33);
\Sin|Mult1|auto_generated|mac_mult1~DATAOUT23\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(34);
\Sin|Mult1|auto_generated|mac_mult1~DATAOUT24\ <= \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\(35);

\Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ <= (gnd & gnd & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTBDATAIN_bus\ <= (gnd & gnd & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\Sin|addr_p_1\(8) & \Sin|addr_p_1\(7) & \Sin|addr_p_1\(6) & \Sin|addr_p_1\(5) & \Sin|addr_p_1\(4) & \Sin|addr_p_1\(3) & \Sin|addr_p_1\(2) & \Sin|addr_p_1\(1) & 
\Sin|addr_q_1[0]~_wirecell_combout\);

\Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (\Sin|addr_q_1\(8) & \Sin|addr_q_1\(7) & \Sin|addr_q_1\(6) & \Sin|addr_q_1\(5) & \Sin|addr_q_1\(4) & \Sin|addr_q_1\(3) & \Sin|addr_q_1\(2) & \Sin|addr_q_1\(1) & 
\Sin|addr_q_1\(0));

\Sin|rom_rtl_0|auto_generated|ram_block1a0~portadataout\ <= \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);
\Sin|rom_rtl_0|auto_generated|ram_block1a1\ <= \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(1);
\Sin|rom_rtl_0|auto_generated|ram_block1a2\ <= \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(2);
\Sin|rom_rtl_0|auto_generated|ram_block1a3\ <= \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(3);
\Sin|rom_rtl_0|auto_generated|ram_block1a4\ <= \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(4);
\Sin|rom_rtl_0|auto_generated|ram_block1a5\ <= \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(5);
\Sin|rom_rtl_0|auto_generated|ram_block1a6\ <= \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(6);
\Sin|rom_rtl_0|auto_generated|ram_block1a7\ <= \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(7);
\Sin|rom_rtl_0|auto_generated|ram_block1a8\ <= \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(8);
\Sin|rom_rtl_0|auto_generated|ram_block1a9\ <= \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(9);
\Sin|rom_rtl_0|auto_generated|ram_block1a10\ <= \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(10);
\Sin|rom_rtl_0|auto_generated|ram_block1a11\ <= \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(11);
\Sin|rom_rtl_0|auto_generated|ram_block1a12\ <= \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(12);
\Sin|rom_rtl_0|auto_generated|ram_block1a13\ <= \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(13);
\Sin|rom_rtl_0|auto_generated|ram_block1a14\ <= \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(14);
\Sin|rom_rtl_0|auto_generated|ram_block1a15\ <= \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(15);

\Sin|rom_rtl_0|auto_generated|ram_block1a0~PORTBDATAOUT0\ <= \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(0);
\Sin|rom_rtl_0|auto_generated|ram_block1a1~PORTBDATAOUT0\ <= \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(1);
\Sin|rom_rtl_0|auto_generated|ram_block1a2~PORTBDATAOUT0\ <= \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(2);
\Sin|rom_rtl_0|auto_generated|ram_block1a3~PORTBDATAOUT0\ <= \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(3);
\Sin|rom_rtl_0|auto_generated|ram_block1a4~PORTBDATAOUT0\ <= \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(4);
\Sin|rom_rtl_0|auto_generated|ram_block1a5~PORTBDATAOUT0\ <= \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(5);
\Sin|rom_rtl_0|auto_generated|ram_block1a6~PORTBDATAOUT0\ <= \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(6);
\Sin|rom_rtl_0|auto_generated|ram_block1a7~PORTBDATAOUT0\ <= \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(7);
\Sin|rom_rtl_0|auto_generated|ram_block1a8~PORTBDATAOUT0\ <= \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(8);
\Sin|rom_rtl_0|auto_generated|ram_block1a9~PORTBDATAOUT0\ <= \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(9);
\Sin|rom_rtl_0|auto_generated|ram_block1a10~PORTBDATAOUT0\ <= \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(10);
\Sin|rom_rtl_0|auto_generated|ram_block1a11~PORTBDATAOUT0\ <= \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(11);
\Sin|rom_rtl_0|auto_generated|ram_block1a12~PORTBDATAOUT0\ <= \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(12);
\Sin|rom_rtl_0|auto_generated|ram_block1a13~PORTBDATAOUT0\ <= \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(13);
\Sin|rom_rtl_0|auto_generated|ram_block1a14~PORTBDATAOUT0\ <= \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(14);
\Sin|rom_rtl_0|auto_generated|ram_block1a15~PORTBDATAOUT0\ <= \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(15);

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);

\aio|c|PLL|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \aio|c|PLL|auto_generated|wire_pll1_clk\(0));

\vol|Selector12~1clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \vol|Selector12~1_combout\);
\Display1|ALT_INV_decOut_n[4]~33_combout\ <= NOT \Display1|decOut_n[4]~33_combout\;
\ps2|ll|ALT_INV_time_out_counter[0]~12_combout\ <= NOT \ps2|ll|time_out_counter[0]~12_combout\;
\ps2|ll|ALT_INV_state.idle~q\ <= NOT \ps2|ll|state.idle~q\;
\ac|i2c|ALT_INV_state.idle~q\ <= NOT \ac|i2c|state.idle~q\;
\ps2|ll|ALT_INV_ps2_clk~en_q\ <= NOT \ps2|ll|ps2_clk~en_q\;
\ALT_INV_bemol~0_combout\ <= NOT \bemol~0_combout\;

-- Location: IOOBUF_X69_Y73_N23
\HEX0[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_HEX0(0));

-- Location: IOOBUF_X107_Y73_N23
\HEX0[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_HEX0(1));

-- Location: IOOBUF_X67_Y73_N23
\HEX0[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_bemol~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(2));

-- Location: IOOBUF_X115_Y50_N2
\HEX0[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_bemol~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(3));

-- Location: IOOBUF_X115_Y54_N16
\HEX0[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_bemol~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(4));

-- Location: IOOBUF_X115_Y67_N16
\HEX0[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_bemol~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(5));

-- Location: IOOBUF_X115_Y69_N2
\HEX0[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_bemol~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(6));

-- Location: IOOBUF_X115_Y41_N2
\HEX1[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Display1|decOut_n[0]~36_combout\,
	devoe => ww_devoe,
	o => ww_HEX1(0));

-- Location: IOOBUF_X115_Y30_N9
\HEX1[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Display1|decOut_n[1]~37_combout\,
	devoe => ww_devoe,
	o => ww_HEX1(1));

-- Location: IOOBUF_X115_Y25_N23
\HEX1[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Display1|decOut_n[2]~32_combout\,
	devoe => ww_devoe,
	o => ww_HEX1(2));

-- Location: IOOBUF_X115_Y30_N2
\HEX1[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Display1|decOut_n[3]~31_combout\,
	devoe => ww_devoe,
	o => ww_HEX1(3));

-- Location: IOOBUF_X115_Y20_N9
\HEX1[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Display1|ALT_INV_decOut_n[4]~33_combout\,
	devoe => ww_devoe,
	o => ww_HEX1(4));

-- Location: IOOBUF_X115_Y22_N2
\HEX1[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Display1|decOut_n[5]~34_combout\,
	devoe => ww_devoe,
	o => ww_HEX1(5));

-- Location: IOOBUF_X115_Y28_N9
\HEX1[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Display1|decOut_n[6]~35_combout\,
	devoe => ww_devoe,
	o => ww_HEX1(6));

-- Location: IOOBUF_X0_Y61_N23
\aud_xck~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \aio|c|PLL|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	devoe => ww_devoe,
	o => ww_aud_xck);

-- Location: IOOBUF_X0_Y68_N9
\aud_dacdat~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \aio|dac_data\(31),
	devoe => ww_devoe,
	o => ww_aud_dacdat);

-- Location: IOOBUF_X29_Y73_N9
\i2c_sclk~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => \ac|i2c|i2c_sclk~5_combout\,
	oe => VCC,
	devoe => ww_devoe,
	o => i2c_sclk);

-- Location: IOOBUF_X18_Y73_N23
\i2c_sdat~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => \ac|i2c|i2c_sdat~2_combout\,
	oe => VCC,
	devoe => ww_devoe,
	o => i2c_sdat);

-- Location: IOOBUF_X0_Y67_N16
\ps2_clk~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => \ps2|ll|ALT_INV_ps2_clk~en_q\,
	oe => VCC,
	devoe => ww_devoe,
	o => ps2_clk);

-- Location: IOOBUF_X0_Y59_N23
\ps2_dat~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ps2|ll|ps2_dat~reg0_q\,
	oe => \ps2|ll|ps2_dat~en_q\,
	devoe => ww_devoe,
	o => ps2_dat);

-- Location: IOIBUF_X0_Y36_N15
\CLOCK_50~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: CLKCTRL_G4
\CLOCK_50~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK_50~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLOCK_50~inputclkctrl_outclk\);

-- Location: LCCOMB_X12_Y36_N0
\ac|i2c|phase~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|phase~2_combout\ = (!\ac|i2c|phase\(0) & \ac|i2c|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ac|i2c|phase\(0),
	datad => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|phase~2_combout\);

-- Location: LCCOMB_X13_Y37_N10
\ac|i2c|counter[0]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|counter[0]~6_combout\ = \ac|i2c|counter\(0) $ (VCC)
-- \ac|i2c|counter[0]~7\ = CARRY(\ac|i2c|counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|counter\(0),
	datad => VCC,
	combout => \ac|i2c|counter[0]~6_combout\,
	cout => \ac|i2c|counter[0]~7\);

-- Location: LCCOMB_X13_Y37_N8
\ac|i2c|counter[1]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|counter[1]~8_combout\ = (!\ac|i2c|state.idle~q\) # (!\ac|i2c|Equal2~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ac|i2c|Equal2~0_combout\,
	datad => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|counter[1]~8_combout\);

-- Location: LCCOMB_X13_Y36_N12
\ac|i2c|txd_accepted~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|txd_accepted~0_combout\ = (!\ac|i2c|state.idle~q\ & \ac|txd_request~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ac|i2c|state.idle~q\,
	datad => \ac|txd_request~q\,
	combout => \ac|i2c|txd_accepted~0_combout\);

-- Location: FF_X13_Y36_N13
\ac|i2c|txd_accepted\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|txd_accepted~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|txd_accepted~q\);

-- Location: LCCOMB_X9_Y35_N16
\ac|process_1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|process_1~0_combout\ = (\ac|txd_request~q\ & \ac|i2c|txd_accepted~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ac|txd_request~q\,
	datad => \ac|i2c|txd_accepted~q\,
	combout => \ac|process_1~0_combout\);

-- Location: LCCOMB_X11_Y37_N16
\ac|delay[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|delay[0]~0_combout\ = (!\ac|delay\(0) & \ac|Equal0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ac|delay\(0),
	datad => \ac|Equal0~4_combout\,
	combout => \ac|delay[0]~0_combout\);

-- Location: FF_X11_Y37_N17
\ac|delay[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|delay[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|delay\(0));

-- Location: LCCOMB_X12_Y37_N0
\ac|Add0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Add0~1_cout\ = CARRY(\ac|delay\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|delay\(0),
	datad => VCC,
	cout => \ac|Add0~1_cout\);

-- Location: LCCOMB_X12_Y37_N2
\ac|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Add0~2_combout\ = (\ac|delay\(1) & (\ac|Add0~1_cout\ & VCC)) # (!\ac|delay\(1) & (!\ac|Add0~1_cout\))
-- \ac|Add0~3\ = CARRY((!\ac|delay\(1) & !\ac|Add0~1_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ac|delay\(1),
	datad => VCC,
	cin => \ac|Add0~1_cout\,
	combout => \ac|Add0~2_combout\,
	cout => \ac|Add0~3\);

-- Location: LCCOMB_X11_Y37_N6
\ac|delay[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|delay[1]~1_combout\ = (\ac|Equal0~4_combout\ & \ac|Add0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|Equal0~4_combout\,
	datad => \ac|Add0~2_combout\,
	combout => \ac|delay[1]~1_combout\);

-- Location: FF_X11_Y37_N7
\ac|delay[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|delay[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|delay\(1));

-- Location: LCCOMB_X12_Y37_N4
\ac|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Add0~4_combout\ = (\ac|delay\(2) & ((GND) # (!\ac|Add0~3\))) # (!\ac|delay\(2) & (\ac|Add0~3\ $ (GND)))
-- \ac|Add0~5\ = CARRY((\ac|delay\(2)) # (!\ac|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ac|delay\(2),
	datad => VCC,
	cin => \ac|Add0~3\,
	combout => \ac|Add0~4_combout\,
	cout => \ac|Add0~5\);

-- Location: LCCOMB_X11_Y37_N8
\ac|delay[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|delay[2]~2_combout\ = (\ac|Equal0~4_combout\ & \ac|Add0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|Equal0~4_combout\,
	datad => \ac|Add0~4_combout\,
	combout => \ac|delay[2]~2_combout\);

-- Location: FF_X11_Y37_N9
\ac|delay[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|delay[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|delay\(2));

-- Location: LCCOMB_X12_Y37_N6
\ac|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Add0~6_combout\ = (\ac|delay\(3) & (\ac|Add0~5\ & VCC)) # (!\ac|delay\(3) & (!\ac|Add0~5\))
-- \ac|Add0~7\ = CARRY((!\ac|delay\(3) & !\ac|Add0~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ac|delay\(3),
	datad => VCC,
	cin => \ac|Add0~5\,
	combout => \ac|Add0~6_combout\,
	cout => \ac|Add0~7\);

-- Location: LCCOMB_X11_Y37_N30
\ac|delay[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|delay[3]~3_combout\ = (\ac|Equal0~4_combout\ & \ac|Add0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|Equal0~4_combout\,
	datad => \ac|Add0~6_combout\,
	combout => \ac|delay[3]~3_combout\);

-- Location: FF_X11_Y37_N31
\ac|delay[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|delay[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|delay\(3));

-- Location: LCCOMB_X11_Y37_N12
\ac|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Equal0~0_combout\ = (!\ac|delay\(1) & (!\ac|delay\(2) & (!\ac|delay\(3) & !\ac|delay\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|delay\(1),
	datab => \ac|delay\(2),
	datac => \ac|delay\(3),
	datad => \ac|delay\(0),
	combout => \ac|Equal0~0_combout\);

-- Location: LCCOMB_X12_Y37_N8
\ac|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Add0~8_combout\ = (\ac|delay\(4) & (\ac|Add0~7\ $ (GND))) # (!\ac|delay\(4) & ((GND) # (!\ac|Add0~7\)))
-- \ac|Add0~9\ = CARRY((!\ac|Add0~7\) # (!\ac|delay\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ac|delay\(4),
	datad => VCC,
	cin => \ac|Add0~7\,
	combout => \ac|Add0~8_combout\,
	cout => \ac|Add0~9\);

-- Location: LCCOMB_X11_Y37_N22
\ac|delay[4]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|delay[4]~4_combout\ = (!\ac|Equal0~4_combout\) # (!\ac|Add0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ac|Add0~8_combout\,
	datad => \ac|Equal0~4_combout\,
	combout => \ac|delay[4]~4_combout\);

-- Location: FF_X11_Y37_N23
\ac|delay[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|delay[4]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|delay\(4));

-- Location: LCCOMB_X12_Y37_N10
\ac|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Add0~10_combout\ = (\ac|delay\(5) & (\ac|Add0~9\ & VCC)) # (!\ac|delay\(5) & (!\ac|Add0~9\))
-- \ac|Add0~11\ = CARRY((!\ac|delay\(5) & !\ac|Add0~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ac|delay\(5),
	datad => VCC,
	cin => \ac|Add0~9\,
	combout => \ac|Add0~10_combout\,
	cout => \ac|Add0~11\);

-- Location: LCCOMB_X11_Y37_N18
\ac|delay[5]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|delay[5]~6_combout\ = (\ac|Add0~10_combout\ & \ac|Equal0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ac|Add0~10_combout\,
	datad => \ac|Equal0~4_combout\,
	combout => \ac|delay[5]~6_combout\);

-- Location: FF_X11_Y37_N19
\ac|delay[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|delay[5]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|delay\(5));

-- Location: LCCOMB_X12_Y37_N12
\ac|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Add0~12_combout\ = (\ac|delay\(6) & (\ac|Add0~11\ $ (GND))) # (!\ac|delay\(6) & ((GND) # (!\ac|Add0~11\)))
-- \ac|Add0~13\ = CARRY((!\ac|Add0~11\) # (!\ac|delay\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ac|delay\(6),
	datad => VCC,
	cin => \ac|Add0~11\,
	combout => \ac|Add0~12_combout\,
	cout => \ac|Add0~13\);

-- Location: LCCOMB_X11_Y37_N28
\ac|delay[6]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|delay[6]~5_combout\ = (!\ac|Equal0~4_combout\) # (!\ac|Add0~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ac|Add0~12_combout\,
	datad => \ac|Equal0~4_combout\,
	combout => \ac|delay[6]~5_combout\);

-- Location: FF_X11_Y37_N29
\ac|delay[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|delay[6]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|delay\(6));

-- Location: LCCOMB_X12_Y37_N14
\ac|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Add0~14_combout\ = (\ac|delay\(7) & (\ac|Add0~13\ & VCC)) # (!\ac|delay\(7) & (!\ac|Add0~13\))
-- \ac|Add0~15\ = CARRY((!\ac|delay\(7) & !\ac|Add0~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ac|delay\(7),
	datad => VCC,
	cin => \ac|Add0~13\,
	combout => \ac|Add0~14_combout\,
	cout => \ac|Add0~15\);

-- Location: LCCOMB_X11_Y37_N4
\ac|delay[7]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|delay[7]~7_combout\ = (\ac|Add0~14_combout\ & \ac|Equal0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ac|Add0~14_combout\,
	datad => \ac|Equal0~4_combout\,
	combout => \ac|delay[7]~7_combout\);

-- Location: FF_X11_Y37_N5
\ac|delay[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|delay[7]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|delay\(7));

-- Location: LCCOMB_X12_Y37_N16
\ac|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Add0~16_combout\ = (\ac|delay\(8) & (\ac|Add0~15\ $ (GND))) # (!\ac|delay\(8) & ((GND) # (!\ac|Add0~15\)))
-- \ac|Add0~17\ = CARRY((!\ac|Add0~15\) # (!\ac|delay\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ac|delay\(8),
	datad => VCC,
	cin => \ac|Add0~15\,
	combout => \ac|Add0~16_combout\,
	cout => \ac|Add0~17\);

-- Location: LCCOMB_X13_Y37_N2
\ac|delay[8]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|delay[8]~8_combout\ = (!\ac|Add0~16_combout\) # (!\ac|Equal0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|Equal0~4_combout\,
	datac => \ac|Add0~16_combout\,
	combout => \ac|delay[8]~8_combout\);

-- Location: FF_X13_Y37_N3
\ac|delay[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|delay[8]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|delay\(8));

-- Location: LCCOMB_X12_Y37_N18
\ac|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Add0~18_combout\ = (\ac|delay\(9) & (!\ac|Add0~17\)) # (!\ac|delay\(9) & (\ac|Add0~17\ & VCC))
-- \ac|Add0~19\ = CARRY((\ac|delay\(9) & !\ac|Add0~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ac|delay\(9),
	datad => VCC,
	cin => \ac|Add0~17\,
	combout => \ac|Add0~18_combout\,
	cout => \ac|Add0~19\);

-- Location: LCCOMB_X13_Y37_N0
\ac|delay[9]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|delay[9]~9_combout\ = (!\ac|Add0~18_combout\) # (!\ac|Equal0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ac|Equal0~4_combout\,
	datad => \ac|Add0~18_combout\,
	combout => \ac|delay[9]~9_combout\);

-- Location: FF_X13_Y37_N1
\ac|delay[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|delay[9]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|delay\(9));

-- Location: LCCOMB_X12_Y37_N20
\ac|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Add0~20_combout\ = (\ac|delay\(10) & ((GND) # (!\ac|Add0~19\))) # (!\ac|delay\(10) & (\ac|Add0~19\ $ (GND)))
-- \ac|Add0~21\ = CARRY((\ac|delay\(10)) # (!\ac|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ac|delay\(10),
	datad => VCC,
	cin => \ac|Add0~19\,
	combout => \ac|Add0~20_combout\,
	cout => \ac|Add0~21\);

-- Location: LCCOMB_X13_Y37_N22
\ac|delay[10]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|delay[10]~10_combout\ = (\ac|Equal0~4_combout\ & \ac|Add0~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ac|Equal0~4_combout\,
	datad => \ac|Add0~20_combout\,
	combout => \ac|delay[10]~10_combout\);

-- Location: FF_X13_Y37_N23
\ac|delay[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|delay[10]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|delay\(10));

-- Location: LCCOMB_X12_Y37_N22
\ac|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Add0~22_combout\ = (\ac|delay\(11) & (\ac|Add0~21\ & VCC)) # (!\ac|delay\(11) & (!\ac|Add0~21\))
-- \ac|Add0~23\ = CARRY((!\ac|delay\(11) & !\ac|Add0~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ac|delay\(11),
	datad => VCC,
	cin => \ac|Add0~21\,
	combout => \ac|Add0~22_combout\,
	cout => \ac|Add0~23\);

-- Location: LCCOMB_X13_Y37_N4
\ac|delay[11]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|delay[11]~11_combout\ = (\ac|Equal0~4_combout\ & \ac|Add0~22_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ac|Equal0~4_combout\,
	datad => \ac|Add0~22_combout\,
	combout => \ac|delay[11]~11_combout\);

-- Location: FF_X13_Y37_N5
\ac|delay[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|delay[11]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|delay\(11));

-- Location: LCCOMB_X12_Y37_N24
\ac|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Add0~24_combout\ = (\ac|delay\(12) & ((GND) # (!\ac|Add0~23\))) # (!\ac|delay\(12) & (\ac|Add0~23\ $ (GND)))
-- \ac|Add0~25\ = CARRY((\ac|delay\(12)) # (!\ac|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ac|delay\(12),
	datad => VCC,
	cin => \ac|Add0~23\,
	combout => \ac|Add0~24_combout\,
	cout => \ac|Add0~25\);

-- Location: LCCOMB_X11_Y37_N0
\ac|delay[12]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|delay[12]~14_combout\ = (\ac|Equal0~4_combout\ & \ac|Add0~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|Equal0~4_combout\,
	datad => \ac|Add0~24_combout\,
	combout => \ac|delay[12]~14_combout\);

-- Location: FF_X11_Y37_N1
\ac|delay[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|delay[12]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|delay\(12));

-- Location: LCCOMB_X12_Y37_N26
\ac|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Add0~26_combout\ = (\ac|delay\(13) & (\ac|Add0~25\ & VCC)) # (!\ac|delay\(13) & (!\ac|Add0~25\))
-- \ac|Add0~27\ = CARRY((!\ac|delay\(13) & !\ac|Add0~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ac|delay\(13),
	datad => VCC,
	cin => \ac|Add0~25\,
	combout => \ac|Add0~26_combout\,
	cout => \ac|Add0~27\);

-- Location: LCCOMB_X11_Y37_N10
\ac|delay[13]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|delay[13]~15_combout\ = (\ac|Equal0~4_combout\ & \ac|Add0~26_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|Equal0~4_combout\,
	datad => \ac|Add0~26_combout\,
	combout => \ac|delay[13]~15_combout\);

-- Location: FF_X11_Y37_N11
\ac|delay[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|delay[13]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|delay\(13));

-- Location: LCCOMB_X12_Y37_N28
\ac|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Add0~28_combout\ = (\ac|delay\(14) & (\ac|Add0~27\ $ (GND))) # (!\ac|delay\(14) & ((GND) # (!\ac|Add0~27\)))
-- \ac|Add0~29\ = CARRY((!\ac|Add0~27\) # (!\ac|delay\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ac|delay\(14),
	datad => VCC,
	cin => \ac|Add0~27\,
	combout => \ac|Add0~28_combout\,
	cout => \ac|Add0~29\);

-- Location: LCCOMB_X11_Y37_N20
\ac|delay[14]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|delay[14]~12_combout\ = (!\ac|Add0~28_combout\) # (!\ac|Equal0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|Equal0~4_combout\,
	datad => \ac|Add0~28_combout\,
	combout => \ac|delay[14]~12_combout\);

-- Location: FF_X11_Y37_N21
\ac|delay[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|delay[14]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|delay\(14));

-- Location: LCCOMB_X12_Y37_N30
\ac|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Add0~30_combout\ = \ac|Add0~29\ $ (\ac|delay\(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \ac|delay\(15),
	cin => \ac|Add0~29\,
	combout => \ac|Add0~30_combout\);

-- Location: LCCOMB_X11_Y37_N14
\ac|delay[15]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|delay[15]~13_combout\ = (!\ac|Equal0~4_combout\) # (!\ac|Add0~30_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ac|Add0~30_combout\,
	datad => \ac|Equal0~4_combout\,
	combout => \ac|delay[15]~13_combout\);

-- Location: FF_X11_Y37_N15
\ac|delay[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|delay[15]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|delay\(15));

-- Location: LCCOMB_X11_Y37_N24
\ac|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Equal0~3_combout\ = (!\ac|delay\(13) & (\ac|delay\(14) & (\ac|delay\(15) & !\ac|delay\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|delay\(13),
	datab => \ac|delay\(14),
	datac => \ac|delay\(15),
	datad => \ac|delay\(12),
	combout => \ac|Equal0~3_combout\);

-- Location: LCCOMB_X11_Y37_N26
\ac|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Equal0~1_combout\ = (\ac|delay\(4) & (\ac|delay\(6) & (!\ac|delay\(7) & !\ac|delay\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|delay\(4),
	datab => \ac|delay\(6),
	datac => \ac|delay\(7),
	datad => \ac|delay\(5),
	combout => \ac|Equal0~1_combout\);

-- Location: LCCOMB_X13_Y37_N30
\ac|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Equal0~2_combout\ = (!\ac|delay\(10) & (\ac|delay\(9) & (!\ac|delay\(11) & \ac|delay\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|delay\(10),
	datab => \ac|delay\(9),
	datac => \ac|delay\(11),
	datad => \ac|delay\(8),
	combout => \ac|Equal0~2_combout\);

-- Location: LCCOMB_X11_Y37_N2
\ac|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Equal0~4_combout\ = (((!\ac|Equal0~2_combout\) # (!\ac|Equal0~1_combout\)) # (!\ac|Equal0~3_combout\)) # (!\ac|Equal0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|Equal0~0_combout\,
	datab => \ac|Equal0~3_combout\,
	datac => \ac|Equal0~1_combout\,
	datad => \ac|Equal0~2_combout\,
	combout => \ac|Equal0~4_combout\);

-- Location: IOIBUF_X0_Y67_N15
\ps2_clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ps2_clk,
	o => \ps2_clk~input_o\);

-- Location: LCCOMB_X6_Y47_N6
\ps2|ll|ps2_clk_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|ps2_clk_0~0_combout\ = !\ps2_clk~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ps2_clk~input_o\,
	combout => \ps2|ll|ps2_clk_0~0_combout\);

-- Location: LCCOMB_X6_Y49_N18
\ps2|ll|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add0~0_combout\ = \ps2|ll|sampling_counter\(0) $ (VCC)
-- \ps2|ll|Add0~1\ = CARRY(\ps2|ll|sampling_counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|sampling_counter\(0),
	datad => VCC,
	combout => \ps2|ll|Add0~0_combout\,
	cout => \ps2|ll|Add0~1\);

-- Location: LCCOMB_X6_Y49_N22
\ps2|ll|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add0~4_combout\ = (\ps2|ll|sampling_counter\(2) & ((GND) # (!\ps2|ll|Add0~3\))) # (!\ps2|ll|sampling_counter\(2) & (\ps2|ll|Add0~3\ $ (GND)))
-- \ps2|ll|Add0~5\ = CARRY((\ps2|ll|sampling_counter\(2)) # (!\ps2|ll|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|sampling_counter\(2),
	datad => VCC,
	cin => \ps2|ll|Add0~3\,
	combout => \ps2|ll|Add0~4_combout\,
	cout => \ps2|ll|Add0~5\);

-- Location: LCCOMB_X6_Y49_N24
\ps2|ll|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add0~6_combout\ = (\ps2|ll|sampling_counter\(3) & (\ps2|ll|Add0~5\ & VCC)) # (!\ps2|ll|sampling_counter\(3) & (!\ps2|ll|Add0~5\))
-- \ps2|ll|Add0~7\ = CARRY((!\ps2|ll|sampling_counter\(3) & !\ps2|ll|Add0~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|sampling_counter\(3),
	datad => VCC,
	cin => \ps2|ll|Add0~5\,
	combout => \ps2|ll|Add0~6_combout\,
	cout => \ps2|ll|Add0~7\);

-- Location: FF_X6_Y49_N25
\ps2|ll|sampling_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|Add0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|sampling_counter\(3));

-- Location: LCCOMB_X6_Y49_N26
\ps2|ll|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add0~8_combout\ = (\ps2|ll|sampling_counter\(4) & ((GND) # (!\ps2|ll|Add0~7\))) # (!\ps2|ll|sampling_counter\(4) & (\ps2|ll|Add0~7\ $ (GND)))
-- \ps2|ll|Add0~9\ = CARRY((\ps2|ll|sampling_counter\(4)) # (!\ps2|ll|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|sampling_counter\(4),
	datad => VCC,
	cin => \ps2|ll|Add0~7\,
	combout => \ps2|ll|Add0~8_combout\,
	cout => \ps2|ll|Add0~9\);

-- Location: FF_X6_Y49_N27
\ps2|ll|sampling_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|Add0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|sampling_counter\(4));

-- Location: LCCOMB_X6_Y49_N28
\ps2|ll|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add0~10_combout\ = (\ps2|ll|sampling_counter\(5) & (\ps2|ll|Add0~9\ & VCC)) # (!\ps2|ll|sampling_counter\(5) & (!\ps2|ll|Add0~9\))
-- \ps2|ll|Add0~11\ = CARRY((!\ps2|ll|sampling_counter\(5) & !\ps2|ll|Add0~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|sampling_counter\(5),
	datad => VCC,
	cin => \ps2|ll|Add0~9\,
	combout => \ps2|ll|Add0~10_combout\,
	cout => \ps2|ll|Add0~11\);

-- Location: FF_X6_Y49_N29
\ps2|ll|sampling_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|Add0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|sampling_counter\(5));

-- Location: LCCOMB_X6_Y49_N30
\ps2|ll|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add0~12_combout\ = \ps2|ll|sampling_counter\(6) $ (\ps2|ll|Add0~11\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|sampling_counter\(6),
	cin => \ps2|ll|Add0~11\,
	combout => \ps2|ll|Add0~12_combout\);

-- Location: FF_X6_Y49_N31
\ps2|ll|sampling_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|Add0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|sampling_counter\(6));

-- Location: LCCOMB_X6_Y49_N14
\ps2|ll|Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Equal1~0_combout\ = (\ps2|ll|Equal0~0_combout\ & (!\ps2|ll|sampling_counter\(0) & (!\ps2|ll|sampling_counter\(6) & !\ps2|ll|sampling_counter\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Equal0~0_combout\,
	datab => \ps2|ll|sampling_counter\(0),
	datac => \ps2|ll|sampling_counter\(6),
	datad => \ps2|ll|sampling_counter\(5),
	combout => \ps2|ll|Equal1~0_combout\);

-- Location: LCCOMB_X6_Y49_N0
\ps2|ll|sampling_counter~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|sampling_counter~1_combout\ = (\ps2|ll|Add0~0_combout\ & !\ps2|ll|Equal1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|Add0~0_combout\,
	datac => \ps2|ll|Equal1~0_combout\,
	combout => \ps2|ll|sampling_counter~1_combout\);

-- Location: FF_X6_Y49_N1
\ps2|ll|sampling_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|sampling_counter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|sampling_counter\(0));

-- Location: LCCOMB_X6_Y49_N20
\ps2|ll|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add0~2_combout\ = (\ps2|ll|sampling_counter\(1) & (\ps2|ll|Add0~1\ & VCC)) # (!\ps2|ll|sampling_counter\(1) & (!\ps2|ll|Add0~1\))
-- \ps2|ll|Add0~3\ = CARRY((!\ps2|ll|sampling_counter\(1) & !\ps2|ll|Add0~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|sampling_counter\(1),
	datad => VCC,
	cin => \ps2|ll|Add0~1\,
	combout => \ps2|ll|Add0~2_combout\,
	cout => \ps2|ll|Add0~3\);

-- Location: LCCOMB_X6_Y49_N12
\ps2|ll|sampling_counter~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|sampling_counter~0_combout\ = (\ps2|ll|Add0~2_combout\ & !\ps2|ll|Equal1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|Add0~2_combout\,
	datac => \ps2|ll|Equal1~0_combout\,
	combout => \ps2|ll|sampling_counter~0_combout\);

-- Location: FF_X6_Y49_N13
\ps2|ll|sampling_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|sampling_counter~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|sampling_counter\(1));

-- Location: FF_X6_Y49_N23
\ps2|ll|sampling_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|Add0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|sampling_counter\(2));

-- Location: LCCOMB_X6_Y49_N10
\ps2|ll|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Equal0~0_combout\ = (!\ps2|ll|sampling_counter\(2) & (!\ps2|ll|sampling_counter\(3) & (!\ps2|ll|sampling_counter\(4) & !\ps2|ll|sampling_counter\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|sampling_counter\(2),
	datab => \ps2|ll|sampling_counter\(3),
	datac => \ps2|ll|sampling_counter\(4),
	datad => \ps2|ll|sampling_counter\(1),
	combout => \ps2|ll|Equal0~0_combout\);

-- Location: LCCOMB_X6_Y49_N6
\ps2|ll|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Equal0~1_combout\ = (\ps2|ll|Equal0~0_combout\ & (\ps2|ll|sampling_counter\(0) & (!\ps2|ll|sampling_counter\(6) & !\ps2|ll|sampling_counter\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Equal0~0_combout\,
	datab => \ps2|ll|sampling_counter\(0),
	datac => \ps2|ll|sampling_counter\(6),
	datad => \ps2|ll|sampling_counter\(5),
	combout => \ps2|ll|Equal0~1_combout\);

-- Location: FF_X6_Y47_N7
\ps2|ll|ps2_clk_0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|ps2_clk_0~0_combout\,
	ena => \ps2|ll|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|ps2_clk_0~q\);

-- Location: IOIBUF_X0_Y59_N22
\ps2_dat~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ps2_dat,
	o => \ps2_dat~input_o\);

-- Location: LCCOMB_X6_Y49_N4
\ps2|ll|ps2_dat_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|ps2_dat_0~0_combout\ = !\ps2_dat~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ps2_dat~input_o\,
	combout => \ps2|ll|ps2_dat_0~0_combout\);

-- Location: FF_X6_Y49_N5
\ps2|ll|ps2_dat_0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|ps2_dat_0~0_combout\,
	ena => \ps2|ll|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|ps2_dat_0~q\);

-- Location: LCCOMB_X6_Y47_N24
\ps2|ll|time_out_counter[0]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[0]~5_combout\ = (!\ps2|ll|ps2_clk_0~q\ & (!\ps2|ll|state.idle~q\ & \ps2|ll|ps2_dat_0~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|ps2_clk_0~q\,
	datac => \ps2|ll|state.idle~q\,
	datad => \ps2|ll|ps2_dat_0~q\,
	combout => \ps2|ll|time_out_counter[0]~5_combout\);

-- Location: LCCOMB_X5_Y47_N14
\ps2|ll|Selector9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector9~0_combout\ = (!\ps2|ll|n_bits\(0) & \ps2|ll|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ps2|ll|n_bits\(0),
	datad => \ps2|ll|state.idle~q\,
	combout => \ps2|ll|Selector9~0_combout\);

-- Location: LCCOMB_X4_Y47_N12
\ps2|ll|Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add1~0_combout\ = \ps2|ll|idle_counter\(0) $ (VCC)
-- \ps2|ll|Add1~1\ = CARRY(\ps2|ll|idle_counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|idle_counter\(0),
	datad => VCC,
	combout => \ps2|ll|Add1~0_combout\,
	cout => \ps2|ll|Add1~1\);

-- Location: LCCOMB_X4_Y47_N8
\ps2|ll|Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add1~2_combout\ = (\ps2|ll|Add1~0_combout\ & (!\ps2|ll|ps2_clk_0~q\ & !\ps2|ll|ps2_dat_0~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Add1~0_combout\,
	datab => \ps2|ll|ps2_clk_0~q\,
	datac => \ps2|ll|ps2_dat_0~q\,
	combout => \ps2|ll|Add1~2_combout\);

-- Location: LCCOMB_X4_Y47_N4
\ps2|ll|Equal2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Equal2~0_combout\ = (!\ps2|ll|idle_counter\(1) & (!\ps2|ll|idle_counter\(2) & (!\ps2|ll|idle_counter\(0) & !\ps2|ll|idle_counter\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|idle_counter\(1),
	datab => \ps2|ll|idle_counter\(2),
	datac => \ps2|ll|idle_counter\(0),
	datad => \ps2|ll|idle_counter\(3),
	combout => \ps2|ll|Equal2~0_combout\);

-- Location: LCCOMB_X5_Y47_N10
\ps2|ll|Equal2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Equal2~1_combout\ = (!\ps2|ll|idle_counter\(5) & (!\ps2|ll|idle_counter\(6) & (\ps2|ll|idle_counter\(4) & \ps2|ll|idle_counter\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|idle_counter\(5),
	datab => \ps2|ll|idle_counter\(6),
	datac => \ps2|ll|idle_counter\(4),
	datad => \ps2|ll|idle_counter\(7),
	combout => \ps2|ll|Equal2~1_combout\);

-- Location: LCCOMB_X5_Y47_N12
\ps2|ll|Equal2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Equal2~2_combout\ = (\ps2|ll|idle_counter\(8) & (\ps2|ll|Equal2~0_combout\ & \ps2|ll|Equal2~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|idle_counter\(8),
	datac => \ps2|ll|Equal2~0_combout\,
	datad => \ps2|ll|Equal2~1_combout\,
	combout => \ps2|ll|Equal2~2_combout\);

-- Location: LCCOMB_X5_Y47_N18
\ps2|ll|idle_counter[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|idle_counter[0]~0_combout\ = (\ps2|ll|Equal1~0_combout\ & ((\ps2|ll|ps2_clk_0~q\) # ((\ps2|ll|ps2_dat_0~q\) # (!\ps2|ll|Equal2~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|ps2_clk_0~q\,
	datab => \ps2|ll|ps2_dat_0~q\,
	datac => \ps2|ll|Equal2~2_combout\,
	datad => \ps2|ll|Equal1~0_combout\,
	combout => \ps2|ll|idle_counter[0]~0_combout\);

-- Location: FF_X4_Y47_N9
\ps2|ll|idle_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|Add1~2_combout\,
	ena => \ps2|ll|idle_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|idle_counter\(0));

-- Location: LCCOMB_X4_Y47_N14
\ps2|ll|Add1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add1~3_combout\ = (\ps2|ll|idle_counter\(1) & (\ps2|ll|Add1~1\ & VCC)) # (!\ps2|ll|idle_counter\(1) & (!\ps2|ll|Add1~1\))
-- \ps2|ll|Add1~4\ = CARRY((!\ps2|ll|idle_counter\(1) & !\ps2|ll|Add1~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|idle_counter\(1),
	datad => VCC,
	cin => \ps2|ll|Add1~1\,
	combout => \ps2|ll|Add1~3_combout\,
	cout => \ps2|ll|Add1~4\);

-- Location: LCCOMB_X4_Y47_N30
\ps2|ll|Add1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add1~5_combout\ = (!\ps2|ll|ps2_dat_0~q\ & (!\ps2|ll|ps2_clk_0~q\ & \ps2|ll|Add1~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|ps2_dat_0~q\,
	datab => \ps2|ll|ps2_clk_0~q\,
	datac => \ps2|ll|Add1~3_combout\,
	combout => \ps2|ll|Add1~5_combout\);

-- Location: FF_X4_Y47_N31
\ps2|ll|idle_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|Add1~5_combout\,
	ena => \ps2|ll|idle_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|idle_counter\(1));

-- Location: LCCOMB_X4_Y47_N16
\ps2|ll|Add1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add1~6_combout\ = (\ps2|ll|idle_counter\(2) & ((GND) # (!\ps2|ll|Add1~4\))) # (!\ps2|ll|idle_counter\(2) & (\ps2|ll|Add1~4\ $ (GND)))
-- \ps2|ll|Add1~7\ = CARRY((\ps2|ll|idle_counter\(2)) # (!\ps2|ll|Add1~4\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|idle_counter\(2),
	datad => VCC,
	cin => \ps2|ll|Add1~4\,
	combout => \ps2|ll|Add1~6_combout\,
	cout => \ps2|ll|Add1~7\);

-- Location: LCCOMB_X4_Y47_N0
\ps2|ll|Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add1~8_combout\ = (!\ps2|ll|ps2_dat_0~q\ & (\ps2|ll|Add1~6_combout\ & !\ps2|ll|ps2_clk_0~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|ps2_dat_0~q\,
	datab => \ps2|ll|Add1~6_combout\,
	datac => \ps2|ll|ps2_clk_0~q\,
	combout => \ps2|ll|Add1~8_combout\);

-- Location: FF_X4_Y47_N1
\ps2|ll|idle_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|Add1~8_combout\,
	ena => \ps2|ll|idle_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|idle_counter\(2));

-- Location: LCCOMB_X4_Y47_N18
\ps2|ll|Add1~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add1~9_combout\ = (\ps2|ll|idle_counter\(3) & (\ps2|ll|Add1~7\ & VCC)) # (!\ps2|ll|idle_counter\(3) & (!\ps2|ll|Add1~7\))
-- \ps2|ll|Add1~10\ = CARRY((!\ps2|ll|idle_counter\(3) & !\ps2|ll|Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|idle_counter\(3),
	datad => VCC,
	cin => \ps2|ll|Add1~7\,
	combout => \ps2|ll|Add1~9_combout\,
	cout => \ps2|ll|Add1~10\);

-- Location: LCCOMB_X4_Y47_N10
\ps2|ll|Add1~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add1~11_combout\ = (!\ps2|ll|ps2_dat_0~q\ & (\ps2|ll|Add1~9_combout\ & !\ps2|ll|ps2_clk_0~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|ps2_dat_0~q\,
	datab => \ps2|ll|Add1~9_combout\,
	datac => \ps2|ll|ps2_clk_0~q\,
	combout => \ps2|ll|Add1~11_combout\);

-- Location: FF_X4_Y47_N11
\ps2|ll|idle_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|Add1~11_combout\,
	ena => \ps2|ll|idle_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|idle_counter\(3));

-- Location: LCCOMB_X4_Y47_N20
\ps2|ll|Add1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add1~12_combout\ = (\ps2|ll|idle_counter\(4) & (\ps2|ll|Add1~10\ $ (GND))) # (!\ps2|ll|idle_counter\(4) & ((GND) # (!\ps2|ll|Add1~10\)))
-- \ps2|ll|Add1~13\ = CARRY((!\ps2|ll|Add1~10\) # (!\ps2|ll|idle_counter\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|idle_counter\(4),
	datad => VCC,
	cin => \ps2|ll|Add1~10\,
	combout => \ps2|ll|Add1~12_combout\,
	cout => \ps2|ll|Add1~13\);

-- Location: LCCOMB_X4_Y47_N6
\ps2|ll|Add1~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add1~23_combout\ = (!\ps2|ll|ps2_dat_0~q\ & (!\ps2|ll|Add1~12_combout\ & !\ps2|ll|ps2_clk_0~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|ps2_dat_0~q\,
	datab => \ps2|ll|Add1~12_combout\,
	datac => \ps2|ll|ps2_clk_0~q\,
	combout => \ps2|ll|Add1~23_combout\);

-- Location: FF_X4_Y47_N7
\ps2|ll|idle_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|Add1~23_combout\,
	ena => \ps2|ll|idle_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|idle_counter\(4));

-- Location: LCCOMB_X4_Y47_N22
\ps2|ll|Add1~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add1~14_combout\ = (\ps2|ll|idle_counter\(5) & (\ps2|ll|Add1~13\ & VCC)) # (!\ps2|ll|idle_counter\(5) & (!\ps2|ll|Add1~13\))
-- \ps2|ll|Add1~15\ = CARRY((!\ps2|ll|idle_counter\(5) & !\ps2|ll|Add1~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|idle_counter\(5),
	datad => VCC,
	cin => \ps2|ll|Add1~13\,
	combout => \ps2|ll|Add1~14_combout\,
	cout => \ps2|ll|Add1~15\);

-- Location: LCCOMB_X5_Y47_N6
\ps2|ll|Add1~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add1~25_combout\ = (!\ps2|ll|ps2_clk_0~q\ & (\ps2|ll|Add1~14_combout\ & !\ps2|ll|ps2_dat_0~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|ps2_clk_0~q\,
	datab => \ps2|ll|Add1~14_combout\,
	datad => \ps2|ll|ps2_dat_0~q\,
	combout => \ps2|ll|Add1~25_combout\);

-- Location: FF_X5_Y47_N7
\ps2|ll|idle_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|Add1~25_combout\,
	ena => \ps2|ll|idle_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|idle_counter\(5));

-- Location: LCCOMB_X4_Y47_N24
\ps2|ll|Add1~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add1~16_combout\ = (\ps2|ll|idle_counter\(6) & ((GND) # (!\ps2|ll|Add1~15\))) # (!\ps2|ll|idle_counter\(6) & (\ps2|ll|Add1~15\ $ (GND)))
-- \ps2|ll|Add1~17\ = CARRY((\ps2|ll|idle_counter\(6)) # (!\ps2|ll|Add1~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|idle_counter\(6),
	datad => VCC,
	cin => \ps2|ll|Add1~15\,
	combout => \ps2|ll|Add1~16_combout\,
	cout => \ps2|ll|Add1~17\);

-- Location: LCCOMB_X5_Y47_N20
\ps2|ll|Add1~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add1~26_combout\ = (!\ps2|ll|ps2_clk_0~q\ & (\ps2|ll|Add1~16_combout\ & !\ps2|ll|ps2_dat_0~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|ps2_clk_0~q\,
	datab => \ps2|ll|Add1~16_combout\,
	datad => \ps2|ll|ps2_dat_0~q\,
	combout => \ps2|ll|Add1~26_combout\);

-- Location: FF_X5_Y47_N21
\ps2|ll|idle_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|Add1~26_combout\,
	ena => \ps2|ll|idle_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|idle_counter\(6));

-- Location: LCCOMB_X4_Y47_N26
\ps2|ll|Add1~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add1~18_combout\ = (\ps2|ll|idle_counter\(7) & (!\ps2|ll|Add1~17\)) # (!\ps2|ll|idle_counter\(7) & (\ps2|ll|Add1~17\ & VCC))
-- \ps2|ll|Add1~19\ = CARRY((\ps2|ll|idle_counter\(7) & !\ps2|ll|Add1~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|idle_counter\(7),
	datad => VCC,
	cin => \ps2|ll|Add1~17\,
	combout => \ps2|ll|Add1~18_combout\,
	cout => \ps2|ll|Add1~19\);

-- Location: LCCOMB_X5_Y47_N0
\ps2|ll|Add1~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add1~24_combout\ = (!\ps2|ll|ps2_clk_0~q\ & (!\ps2|ll|Add1~18_combout\ & !\ps2|ll|ps2_dat_0~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|ps2_clk_0~q\,
	datac => \ps2|ll|Add1~18_combout\,
	datad => \ps2|ll|ps2_dat_0~q\,
	combout => \ps2|ll|Add1~24_combout\);

-- Location: FF_X5_Y47_N1
\ps2|ll|idle_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|Add1~24_combout\,
	ena => \ps2|ll|idle_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|idle_counter\(7));

-- Location: LCCOMB_X4_Y47_N28
\ps2|ll|Add1~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add1~20_combout\ = \ps2|ll|Add1~19\ $ (!\ps2|ll|idle_counter\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \ps2|ll|idle_counter\(8),
	cin => \ps2|ll|Add1~19\,
	combout => \ps2|ll|Add1~20_combout\);

-- Location: LCCOMB_X4_Y47_N2
\ps2|ll|Add1~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add1~22_combout\ = (!\ps2|ll|ps2_dat_0~q\ & (!\ps2|ll|Add1~20_combout\ & !\ps2|ll|ps2_clk_0~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|ps2_dat_0~q\,
	datab => \ps2|ll|Add1~20_combout\,
	datac => \ps2|ll|ps2_clk_0~q\,
	combout => \ps2|ll|Add1~22_combout\);

-- Location: FF_X4_Y47_N3
\ps2|ll|idle_counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|Add1~22_combout\,
	ena => \ps2|ll|idle_counter[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|idle_counter\(8));

-- Location: LCCOMB_X8_Y46_N22
\ps2|Equal2~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Equal2~9_combout\ = (\ps2|Equal2~6_combout\ & \ps2|Equal2~7_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ps2|Equal2~6_combout\,
	datad => \ps2|Equal2~7_combout\,
	combout => \ps2|Equal2~9_combout\);

-- Location: LCCOMB_X9_Y48_N4
\ps2|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~0_combout\ = \ps2|time_out_counter\(0) $ (VCC)
-- \ps2|Add0~1\ = CARRY(\ps2|time_out_counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter\(0),
	datad => VCC,
	combout => \ps2|Add0~0_combout\,
	cout => \ps2|Add0~1\);

-- Location: LCCOMB_X8_Y48_N16
\ps2|time_out_counter[0]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[0]~9_combout\ = (\ps2|time_out_counter[1]~5_combout\ & (!\ps2|time_out_counter[1]~8_combout\ & \ps2|Add0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[1]~5_combout\,
	datac => \ps2|time_out_counter[1]~8_combout\,
	datad => \ps2|Add0~0_combout\,
	combout => \ps2|time_out_counter[0]~9_combout\);

-- Location: FF_X8_Y48_N17
\ps2|time_out_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|time_out_counter[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|time_out_counter\(0));

-- Location: LCCOMB_X9_Y48_N6
\ps2|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~2_combout\ = (\ps2|time_out_counter\(1) & (\ps2|Add0~1\ & VCC)) # (!\ps2|time_out_counter\(1) & (!\ps2|Add0~1\))
-- \ps2|Add0~3\ = CARRY((!\ps2|time_out_counter\(1) & !\ps2|Add0~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter\(1),
	datad => VCC,
	cin => \ps2|Add0~1\,
	combout => \ps2|Add0~2_combout\,
	cout => \ps2|Add0~3\);

-- Location: LCCOMB_X8_Y48_N14
\ps2|time_out_counter[1]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[1]~10_combout\ = (\ps2|time_out_counter[1]~5_combout\ & (!\ps2|time_out_counter[1]~8_combout\ & \ps2|Add0~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[1]~5_combout\,
	datac => \ps2|time_out_counter[1]~8_combout\,
	datad => \ps2|Add0~2_combout\,
	combout => \ps2|time_out_counter[1]~10_combout\);

-- Location: FF_X8_Y48_N15
\ps2|time_out_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|time_out_counter[1]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|time_out_counter\(1));

-- Location: LCCOMB_X9_Y48_N8
\ps2|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~4_combout\ = (\ps2|time_out_counter\(2) & ((GND) # (!\ps2|Add0~3\))) # (!\ps2|time_out_counter\(2) & (\ps2|Add0~3\ $ (GND)))
-- \ps2|Add0~5\ = CARRY((\ps2|time_out_counter\(2)) # (!\ps2|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|time_out_counter\(2),
	datad => VCC,
	cin => \ps2|Add0~3\,
	combout => \ps2|Add0~4_combout\,
	cout => \ps2|Add0~5\);

-- Location: LCCOMB_X9_Y48_N0
\ps2|time_out_counter[2]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[2]~11_combout\ = (!\ps2|time_out_counter[1]~8_combout\ & (\ps2|Add0~4_combout\ & \ps2|time_out_counter[1]~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|time_out_counter[1]~8_combout\,
	datac => \ps2|Add0~4_combout\,
	datad => \ps2|time_out_counter[1]~5_combout\,
	combout => \ps2|time_out_counter[2]~11_combout\);

-- Location: FF_X9_Y48_N1
\ps2|time_out_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|time_out_counter[2]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|time_out_counter\(2));

-- Location: LCCOMB_X9_Y48_N10
\ps2|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~6_combout\ = (\ps2|time_out_counter\(3) & (\ps2|Add0~5\ & VCC)) # (!\ps2|time_out_counter\(3) & (!\ps2|Add0~5\))
-- \ps2|Add0~7\ = CARRY((!\ps2|time_out_counter\(3) & !\ps2|Add0~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|time_out_counter\(3),
	datad => VCC,
	cin => \ps2|Add0~5\,
	combout => \ps2|Add0~6_combout\,
	cout => \ps2|Add0~7\);

-- Location: LCCOMB_X8_Y48_N24
\ps2|time_out_counter[3]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[3]~12_combout\ = (!\ps2|time_out_counter[1]~8_combout\ & (\ps2|Add0~6_combout\ & \ps2|time_out_counter[1]~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|time_out_counter[1]~8_combout\,
	datac => \ps2|Add0~6_combout\,
	datad => \ps2|time_out_counter[1]~5_combout\,
	combout => \ps2|time_out_counter[3]~12_combout\);

-- Location: FF_X8_Y48_N25
\ps2|time_out_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|time_out_counter[3]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|time_out_counter\(3));

-- Location: LCCOMB_X9_Y48_N12
\ps2|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~8_combout\ = (\ps2|time_out_counter\(4) & ((GND) # (!\ps2|Add0~7\))) # (!\ps2|time_out_counter\(4) & (\ps2|Add0~7\ $ (GND)))
-- \ps2|Add0~9\ = CARRY((\ps2|time_out_counter\(4)) # (!\ps2|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|time_out_counter\(4),
	datad => VCC,
	cin => \ps2|Add0~7\,
	combout => \ps2|Add0~8_combout\,
	cout => \ps2|Add0~9\);

-- Location: LCCOMB_X8_Y48_N20
\ps2|time_out_counter[4]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[4]~14_combout\ = (!\ps2|time_out_counter[1]~8_combout\ & (\ps2|Add0~8_combout\ & \ps2|time_out_counter[1]~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|time_out_counter[1]~8_combout\,
	datac => \ps2|Add0~8_combout\,
	datad => \ps2|time_out_counter[1]~5_combout\,
	combout => \ps2|time_out_counter[4]~14_combout\);

-- Location: FF_X8_Y48_N21
\ps2|time_out_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|time_out_counter[4]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|time_out_counter\(4));

-- Location: LCCOMB_X9_Y48_N14
\ps2|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~10_combout\ = (\ps2|time_out_counter\(5) & (\ps2|Add0~9\ & VCC)) # (!\ps2|time_out_counter\(5) & (!\ps2|Add0~9\))
-- \ps2|Add0~11\ = CARRY((!\ps2|time_out_counter\(5) & !\ps2|Add0~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|time_out_counter\(5),
	datad => VCC,
	cin => \ps2|Add0~9\,
	combout => \ps2|Add0~10_combout\,
	cout => \ps2|Add0~11\);

-- Location: LCCOMB_X9_Y48_N16
\ps2|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~12_combout\ = (\ps2|time_out_counter\(6) & ((GND) # (!\ps2|Add0~11\))) # (!\ps2|time_out_counter\(6) & (\ps2|Add0~11\ $ (GND)))
-- \ps2|Add0~13\ = CARRY((\ps2|time_out_counter\(6)) # (!\ps2|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|time_out_counter\(6),
	datad => VCC,
	cin => \ps2|Add0~11\,
	combout => \ps2|Add0~12_combout\,
	cout => \ps2|Add0~13\);

-- Location: LCCOMB_X8_Y48_N4
\ps2|time_out_counter[6]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[6]~16_combout\ = (!\ps2|time_out_counter[1]~8_combout\ & (((\ps2|Add0~12_combout\ & \ps2|time_out_counter[1]~5_combout\)) # (!\ps2|Selector42~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Selector42~0_combout\,
	datab => \ps2|Add0~12_combout\,
	datac => \ps2|time_out_counter[1]~8_combout\,
	datad => \ps2|time_out_counter[1]~5_combout\,
	combout => \ps2|time_out_counter[6]~16_combout\);

-- Location: FF_X8_Y48_N5
\ps2|time_out_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|time_out_counter[6]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|time_out_counter\(6));

-- Location: LCCOMB_X9_Y48_N18
\ps2|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~14_combout\ = (\ps2|time_out_counter\(7) & (!\ps2|Add0~13\)) # (!\ps2|time_out_counter\(7) & (\ps2|Add0~13\ & VCC))
-- \ps2|Add0~15\ = CARRY((\ps2|time_out_counter\(7) & !\ps2|Add0~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|time_out_counter\(7),
	datad => VCC,
	cin => \ps2|Add0~13\,
	combout => \ps2|Add0~14_combout\,
	cout => \ps2|Add0~15\);

-- Location: LCCOMB_X8_Y48_N18
\ps2|time_out_counter[7]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[7]~13_combout\ = ((\ps2|time_out_counter[1]~8_combout\) # ((!\ps2|Add0~14_combout\ & \ps2|time_out_counter[1]~5_combout\))) # (!\ps2|Selector42~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Selector42~0_combout\,
	datab => \ps2|Add0~14_combout\,
	datac => \ps2|time_out_counter[1]~8_combout\,
	datad => \ps2|time_out_counter[1]~5_combout\,
	combout => \ps2|time_out_counter[7]~13_combout\);

-- Location: FF_X8_Y48_N19
\ps2|time_out_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|time_out_counter[7]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|time_out_counter\(7));

-- Location: LCCOMB_X9_Y48_N20
\ps2|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~16_combout\ = (\ps2|time_out_counter\(8) & ((GND) # (!\ps2|Add0~15\))) # (!\ps2|time_out_counter\(8) & (\ps2|Add0~15\ $ (GND)))
-- \ps2|Add0~17\ = CARRY((\ps2|time_out_counter\(8)) # (!\ps2|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|time_out_counter\(8),
	datad => VCC,
	cin => \ps2|Add0~15\,
	combout => \ps2|Add0~16_combout\,
	cout => \ps2|Add0~17\);

-- Location: LCCOMB_X8_Y48_N28
\ps2|time_out_counter[8]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[8]~17_combout\ = (!\ps2|time_out_counter[1]~8_combout\ & (((\ps2|Add0~16_combout\ & \ps2|time_out_counter[1]~5_combout\)) # (!\ps2|Selector42~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Selector42~0_combout\,
	datab => \ps2|time_out_counter[1]~8_combout\,
	datac => \ps2|Add0~16_combout\,
	datad => \ps2|time_out_counter[1]~5_combout\,
	combout => \ps2|time_out_counter[8]~17_combout\);

-- Location: FF_X8_Y48_N29
\ps2|time_out_counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|time_out_counter[8]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|time_out_counter\(8));

-- Location: LCCOMB_X9_Y48_N22
\ps2|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~18_combout\ = (\ps2|time_out_counter\(9) & (\ps2|Add0~17\ & VCC)) # (!\ps2|time_out_counter\(9) & (!\ps2|Add0~17\))
-- \ps2|Add0~19\ = CARRY((!\ps2|time_out_counter\(9) & !\ps2|Add0~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter\(9),
	datad => VCC,
	cin => \ps2|Add0~17\,
	combout => \ps2|Add0~18_combout\,
	cout => \ps2|Add0~19\);

-- Location: LCCOMB_X8_Y48_N2
\ps2|time_out_counter[9]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[9]~18_combout\ = (!\ps2|time_out_counter[1]~8_combout\ & (((\ps2|Add0~18_combout\ & \ps2|time_out_counter[1]~5_combout\)) # (!\ps2|Selector42~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Selector42~0_combout\,
	datab => \ps2|Add0~18_combout\,
	datac => \ps2|time_out_counter[1]~8_combout\,
	datad => \ps2|time_out_counter[1]~5_combout\,
	combout => \ps2|time_out_counter[9]~18_combout\);

-- Location: FF_X8_Y48_N3
\ps2|time_out_counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|time_out_counter[9]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|time_out_counter\(9));

-- Location: LCCOMB_X9_Y48_N24
\ps2|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~20_combout\ = (\ps2|time_out_counter\(10) & ((GND) # (!\ps2|Add0~19\))) # (!\ps2|time_out_counter\(10) & (\ps2|Add0~19\ $ (GND)))
-- \ps2|Add0~21\ = CARRY((\ps2|time_out_counter\(10)) # (!\ps2|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter\(10),
	datad => VCC,
	cin => \ps2|Add0~19\,
	combout => \ps2|Add0~20_combout\,
	cout => \ps2|Add0~21\);

-- Location: LCCOMB_X8_Y48_N0
\ps2|time_out_counter[10]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[10]~19_combout\ = (\ps2|time_out_counter[1]~5_combout\ & (!\ps2|time_out_counter[1]~8_combout\ & \ps2|Add0~20_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[1]~5_combout\,
	datac => \ps2|time_out_counter[1]~8_combout\,
	datad => \ps2|Add0~20_combout\,
	combout => \ps2|time_out_counter[10]~19_combout\);

-- Location: FF_X8_Y48_N1
\ps2|time_out_counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|time_out_counter[10]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|time_out_counter\(10));

-- Location: LCCOMB_X9_Y48_N26
\ps2|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~22_combout\ = (\ps2|time_out_counter\(11) & (\ps2|Add0~21\ & VCC)) # (!\ps2|time_out_counter\(11) & (!\ps2|Add0~21\))
-- \ps2|Add0~23\ = CARRY((!\ps2|time_out_counter\(11) & !\ps2|Add0~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|time_out_counter\(11),
	datad => VCC,
	cin => \ps2|Add0~21\,
	combout => \ps2|Add0~22_combout\,
	cout => \ps2|Add0~23\);

-- Location: LCCOMB_X8_Y48_N22
\ps2|time_out_counter[11]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[11]~20_combout\ = (!\ps2|time_out_counter[1]~8_combout\ & (((\ps2|Add0~22_combout\ & \ps2|time_out_counter[1]~5_combout\)) # (!\ps2|Selector42~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Selector42~0_combout\,
	datab => \ps2|Add0~22_combout\,
	datac => \ps2|time_out_counter[1]~8_combout\,
	datad => \ps2|time_out_counter[1]~5_combout\,
	combout => \ps2|time_out_counter[11]~20_combout\);

-- Location: FF_X8_Y48_N23
\ps2|time_out_counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|time_out_counter[11]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|time_out_counter\(11));

-- Location: LCCOMB_X9_Y48_N28
\ps2|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~24_combout\ = (\ps2|time_out_counter\(12) & (\ps2|Add0~23\ $ (GND))) # (!\ps2|time_out_counter\(12) & ((GND) # (!\ps2|Add0~23\)))
-- \ps2|Add0~25\ = CARRY((!\ps2|Add0~23\) # (!\ps2|time_out_counter\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|time_out_counter\(12),
	datad => VCC,
	cin => \ps2|Add0~23\,
	combout => \ps2|Add0~24_combout\,
	cout => \ps2|Add0~25\);

-- Location: LCCOMB_X8_Y48_N30
\ps2|time_out_counter[12]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[12]~21_combout\ = ((\ps2|time_out_counter[1]~8_combout\) # ((!\ps2|Add0~24_combout\ & \ps2|time_out_counter[1]~5_combout\))) # (!\ps2|Selector42~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Selector42~0_combout\,
	datab => \ps2|Add0~24_combout\,
	datac => \ps2|time_out_counter[1]~8_combout\,
	datad => \ps2|time_out_counter[1]~5_combout\,
	combout => \ps2|time_out_counter[12]~21_combout\);

-- Location: FF_X8_Y48_N31
\ps2|time_out_counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|time_out_counter[12]~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|time_out_counter\(12));

-- Location: LCCOMB_X9_Y48_N30
\ps2|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~26_combout\ = (\ps2|time_out_counter\(13) & (!\ps2|Add0~25\)) # (!\ps2|time_out_counter\(13) & (\ps2|Add0~25\ & VCC))
-- \ps2|Add0~27\ = CARRY((\ps2|time_out_counter\(13) & !\ps2|Add0~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter\(13),
	datad => VCC,
	cin => \ps2|Add0~25\,
	combout => \ps2|Add0~26_combout\,
	cout => \ps2|Add0~27\);

-- Location: LCCOMB_X8_Y48_N12
\ps2|time_out_counter[13]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[13]~22_combout\ = ((\ps2|time_out_counter[1]~8_combout\) # ((!\ps2|Add0~26_combout\ & \ps2|time_out_counter[1]~5_combout\))) # (!\ps2|Selector42~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111111011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Selector42~0_combout\,
	datab => \ps2|time_out_counter[1]~8_combout\,
	datac => \ps2|Add0~26_combout\,
	datad => \ps2|time_out_counter[1]~5_combout\,
	combout => \ps2|time_out_counter[13]~22_combout\);

-- Location: FF_X8_Y48_N13
\ps2|time_out_counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|time_out_counter[13]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|time_out_counter\(13));

-- Location: LCCOMB_X9_Y47_N0
\ps2|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~28_combout\ = (\ps2|time_out_counter\(14) & (\ps2|Add0~27\ $ (GND))) # (!\ps2|time_out_counter\(14) & ((GND) # (!\ps2|Add0~27\)))
-- \ps2|Add0~29\ = CARRY((!\ps2|Add0~27\) # (!\ps2|time_out_counter\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter\(14),
	datad => VCC,
	cin => \ps2|Add0~27\,
	combout => \ps2|Add0~28_combout\,
	cout => \ps2|Add0~29\);

-- Location: LCCOMB_X8_Y47_N16
\ps2|time_out_counter[14]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[14]~23_combout\ = (\ps2|time_out_counter[1]~8_combout\) # ((\ps2|time_out_counter[1]~5_combout\ & !\ps2|Add0~28_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[1]~8_combout\,
	datab => \ps2|time_out_counter[1]~5_combout\,
	datac => \ps2|Add0~28_combout\,
	combout => \ps2|time_out_counter[14]~23_combout\);

-- Location: FF_X8_Y47_N17
\ps2|time_out_counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|time_out_counter[14]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|time_out_counter\(14));

-- Location: LCCOMB_X9_Y47_N2
\ps2|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~30_combout\ = (\ps2|time_out_counter\(15) & (!\ps2|Add0~29\)) # (!\ps2|time_out_counter\(15) & (\ps2|Add0~29\ & VCC))
-- \ps2|Add0~31\ = CARRY((\ps2|time_out_counter\(15) & !\ps2|Add0~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter\(15),
	datad => VCC,
	cin => \ps2|Add0~29\,
	combout => \ps2|Add0~30_combout\,
	cout => \ps2|Add0~31\);

-- Location: LCCOMB_X8_Y47_N10
\ps2|time_out_counter[15]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[15]~24_combout\ = (\ps2|time_out_counter[1]~8_combout\) # (((\ps2|time_out_counter[1]~5_combout\ & !\ps2|Add0~30_combout\)) # (!\ps2|Selector42~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[1]~8_combout\,
	datab => \ps2|Selector42~0_combout\,
	datac => \ps2|time_out_counter[1]~5_combout\,
	datad => \ps2|Add0~30_combout\,
	combout => \ps2|time_out_counter[15]~24_combout\);

-- Location: FF_X8_Y47_N11
\ps2|time_out_counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|time_out_counter[15]~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|time_out_counter\(15));

-- Location: LCCOMB_X9_Y47_N4
\ps2|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~32_combout\ = (\ps2|time_out_counter\(16) & ((GND) # (!\ps2|Add0~31\))) # (!\ps2|time_out_counter\(16) & (\ps2|Add0~31\ $ (GND)))
-- \ps2|Add0~33\ = CARRY((\ps2|time_out_counter\(16)) # (!\ps2|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|time_out_counter\(16),
	datad => VCC,
	cin => \ps2|Add0~31\,
	combout => \ps2|Add0~32_combout\,
	cout => \ps2|Add0~33\);

-- Location: LCCOMB_X8_Y47_N28
\ps2|time_out_counter[16]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[16]~27_combout\ = (\ps2|time_out_counter[1]~5_combout\ & (!\ps2|time_out_counter[1]~8_combout\ & \ps2|Add0~32_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|time_out_counter[1]~5_combout\,
	datac => \ps2|time_out_counter[1]~8_combout\,
	datad => \ps2|Add0~32_combout\,
	combout => \ps2|time_out_counter[16]~27_combout\);

-- Location: FF_X8_Y47_N29
\ps2|time_out_counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|time_out_counter[16]~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|time_out_counter\(16));

-- Location: LCCOMB_X9_Y47_N6
\ps2|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~34_combout\ = (\ps2|time_out_counter\(17) & (!\ps2|Add0~33\)) # (!\ps2|time_out_counter\(17) & (\ps2|Add0~33\ & VCC))
-- \ps2|Add0~35\ = CARRY((\ps2|time_out_counter\(17) & !\ps2|Add0~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|time_out_counter\(17),
	datad => VCC,
	cin => \ps2|Add0~33\,
	combout => \ps2|Add0~34_combout\,
	cout => \ps2|Add0~35\);

-- Location: LCCOMB_X8_Y47_N6
\ps2|time_out_counter[17]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[17]~25_combout\ = (\ps2|time_out_counter[1]~8_combout\) # (((\ps2|time_out_counter[1]~5_combout\ & !\ps2|Add0~34_combout\)) # (!\ps2|Selector42~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[1]~8_combout\,
	datab => \ps2|Selector42~0_combout\,
	datac => \ps2|time_out_counter[1]~5_combout\,
	datad => \ps2|Add0~34_combout\,
	combout => \ps2|time_out_counter[17]~25_combout\);

-- Location: FF_X8_Y47_N7
\ps2|time_out_counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|time_out_counter[17]~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|time_out_counter\(17));

-- Location: LCCOMB_X9_Y47_N8
\ps2|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~36_combout\ = (\ps2|time_out_counter\(18) & ((GND) # (!\ps2|Add0~35\))) # (!\ps2|time_out_counter\(18) & (\ps2|Add0~35\ $ (GND)))
-- \ps2|Add0~37\ = CARRY((\ps2|time_out_counter\(18)) # (!\ps2|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter\(18),
	datad => VCC,
	cin => \ps2|Add0~35\,
	combout => \ps2|Add0~36_combout\,
	cout => \ps2|Add0~37\);

-- Location: LCCOMB_X8_Y47_N2
\ps2|time_out_counter[18]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[18]~28_combout\ = (!\ps2|time_out_counter[1]~8_combout\ & (((\ps2|time_out_counter[1]~5_combout\ & \ps2|Add0~36_combout\)) # (!\ps2|Selector42~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[1]~8_combout\,
	datab => \ps2|time_out_counter[1]~5_combout\,
	datac => \ps2|Selector42~0_combout\,
	datad => \ps2|Add0~36_combout\,
	combout => \ps2|time_out_counter[18]~28_combout\);

-- Location: FF_X8_Y47_N3
\ps2|time_out_counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|time_out_counter[18]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|time_out_counter\(18));

-- Location: LCCOMB_X9_Y47_N10
\ps2|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~38_combout\ = (\ps2|time_out_counter\(19) & (!\ps2|Add0~37\)) # (!\ps2|time_out_counter\(19) & (\ps2|Add0~37\ & VCC))
-- \ps2|Add0~39\ = CARRY((\ps2|time_out_counter\(19) & !\ps2|Add0~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|time_out_counter\(19),
	datad => VCC,
	cin => \ps2|Add0~37\,
	combout => \ps2|Add0~38_combout\,
	cout => \ps2|Add0~39\);

-- Location: LCCOMB_X9_Y47_N28
\ps2|time_out_counter[19]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[19]~26_combout\ = (\ps2|time_out_counter[1]~8_combout\) # ((\ps2|time_out_counter[1]~5_combout\ & !\ps2|Add0~38_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|time_out_counter[1]~5_combout\,
	datac => \ps2|time_out_counter[1]~8_combout\,
	datad => \ps2|Add0~38_combout\,
	combout => \ps2|time_out_counter[19]~26_combout\);

-- Location: FF_X9_Y47_N29
\ps2|time_out_counter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|time_out_counter[19]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|time_out_counter\(19));

-- Location: LCCOMB_X8_Y47_N8
\ps2|Equal2~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Equal2~5_combout\ = (\ps2|time_out_counter\(17) & (!\ps2|time_out_counter\(16) & (\ps2|time_out_counter\(19) & !\ps2|time_out_counter\(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter\(17),
	datab => \ps2|time_out_counter\(16),
	datac => \ps2|time_out_counter\(19),
	datad => \ps2|time_out_counter\(18),
	combout => \ps2|Equal2~5_combout\);

-- Location: LCCOMB_X9_Y45_N16
\ps2|state~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~38_combout\ = (\ps2|state.restart~9_combout\ & !\ps2|Equal2~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ps2|state.restart~9_combout\,
	datad => \ps2|Equal2~8_combout\,
	combout => \ps2|state~38_combout\);

-- Location: LCCOMB_X8_Y43_N14
\ps2|ll|rxd_data[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|rxd_data[1]~feeder_combout\ = \ps2|ll|data\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ps2|ll|data\(3),
	combout => \ps2|ll|rxd_data[1]~feeder_combout\);

-- Location: FF_X8_Y45_N25
\ps2|txd_data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \ps2|state.periodic_reset~q\,
	sload => VCC,
	ena => \ps2|txd_data[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|txd_data\(1));

-- Location: LCCOMB_X7_Y45_N8
\ps2|ll|Selector29~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector29~0_combout\ = (\ps2|ll|state.idle~q\ & (\ps2|ll|data\(3))) # (!\ps2|ll|state.idle~q\ & ((\ps2|txd_data\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state.idle~q\,
	datac => \ps2|ll|data\(3),
	datad => \ps2|txd_data\(1),
	combout => \ps2|ll|Selector29~0_combout\);

-- Location: LCCOMB_X4_Y51_N6
\ps2|ll|Add2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add2~0_combout\ = \ps2|ll|time_out_counter\(0) $ (VCC)
-- \ps2|ll|Add2~1\ = CARRY(\ps2|ll|time_out_counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|time_out_counter\(0),
	datad => VCC,
	combout => \ps2|ll|Add2~0_combout\,
	cout => \ps2|ll|Add2~1\);

-- Location: LCCOMB_X5_Y51_N12
\ps2|ll|time_out_counter[0]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[0]~15_combout\ = (\ps2|ll|time_out_counter[0]~12_combout\ & (\ps2|ll|Add2~0_combout\ & ((\ps2|ll|time_out_counter[0]~10_combout\)))) # (!\ps2|ll|time_out_counter[0]~12_combout\ & (((\ps2|ll|time_out_counter\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter[0]~12_combout\,
	datab => \ps2|ll|Add2~0_combout\,
	datac => \ps2|ll|time_out_counter\(0),
	datad => \ps2|ll|time_out_counter[0]~10_combout\,
	combout => \ps2|ll|time_out_counter[0]~15_combout\);

-- Location: FF_X5_Y51_N13
\ps2|ll|time_out_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|time_out_counter[0]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|time_out_counter\(0));

-- Location: LCCOMB_X4_Y51_N8
\ps2|ll|Add2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add2~2_combout\ = (\ps2|ll|time_out_counter\(1) & (\ps2|ll|Add2~1\ & VCC)) # (!\ps2|ll|time_out_counter\(1) & (!\ps2|ll|Add2~1\))
-- \ps2|ll|Add2~3\ = CARRY((!\ps2|ll|time_out_counter\(1) & !\ps2|ll|Add2~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter\(1),
	datad => VCC,
	cin => \ps2|ll|Add2~1\,
	combout => \ps2|ll|Add2~2_combout\,
	cout => \ps2|ll|Add2~3\);

-- Location: LCCOMB_X5_Y51_N20
\ps2|ll|time_out_counter[1]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[1]~16_combout\ = (\ps2|ll|time_out_counter[0]~12_combout\ & (\ps2|ll|time_out_counter[0]~10_combout\ & ((\ps2|ll|Add2~2_combout\)))) # (!\ps2|ll|time_out_counter[0]~12_combout\ & (((\ps2|ll|time_out_counter\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter[0]~12_combout\,
	datab => \ps2|ll|time_out_counter[0]~10_combout\,
	datac => \ps2|ll|time_out_counter\(1),
	datad => \ps2|ll|Add2~2_combout\,
	combout => \ps2|ll|time_out_counter[1]~16_combout\);

-- Location: FF_X5_Y51_N21
\ps2|ll|time_out_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|time_out_counter[1]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|time_out_counter\(1));

-- Location: LCCOMB_X4_Y51_N10
\ps2|ll|Add2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add2~4_combout\ = (\ps2|ll|time_out_counter\(2) & ((GND) # (!\ps2|ll|Add2~3\))) # (!\ps2|ll|time_out_counter\(2) & (\ps2|ll|Add2~3\ $ (GND)))
-- \ps2|ll|Add2~5\ = CARRY((\ps2|ll|time_out_counter\(2)) # (!\ps2|ll|Add2~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter\(2),
	datad => VCC,
	cin => \ps2|ll|Add2~3\,
	combout => \ps2|ll|Add2~4_combout\,
	cout => \ps2|ll|Add2~5\);

-- Location: LCCOMB_X5_Y51_N2
\ps2|ll|time_out_counter[2]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[2]~17_combout\ = (\ps2|ll|time_out_counter[0]~12_combout\ & (\ps2|ll|Add2~4_combout\ & ((\ps2|ll|time_out_counter[0]~10_combout\)))) # (!\ps2|ll|time_out_counter[0]~12_combout\ & (((\ps2|ll|time_out_counter\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter[0]~12_combout\,
	datab => \ps2|ll|Add2~4_combout\,
	datac => \ps2|ll|time_out_counter\(2),
	datad => \ps2|ll|time_out_counter[0]~10_combout\,
	combout => \ps2|ll|time_out_counter[2]~17_combout\);

-- Location: FF_X5_Y51_N3
\ps2|ll|time_out_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|time_out_counter[2]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|time_out_counter\(2));

-- Location: LCCOMB_X4_Y51_N12
\ps2|ll|Add2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add2~6_combout\ = (\ps2|ll|time_out_counter\(3) & (\ps2|ll|Add2~5\ & VCC)) # (!\ps2|ll|time_out_counter\(3) & (!\ps2|ll|Add2~5\))
-- \ps2|ll|Add2~7\ = CARRY((!\ps2|ll|time_out_counter\(3) & !\ps2|ll|Add2~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|time_out_counter\(3),
	datad => VCC,
	cin => \ps2|ll|Add2~5\,
	combout => \ps2|ll|Add2~6_combout\,
	cout => \ps2|ll|Add2~7\);

-- Location: LCCOMB_X3_Y51_N26
\ps2|ll|Selector17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector17~0_combout\ = (!\ps2|ll|time_out_counter[0]~14_combout\ & ((\ps2|ll|time_out_counter[0]~9_combout\ & ((\ps2|ll|Add2~6_combout\))) # (!\ps2|ll|time_out_counter[0]~9_combout\ & (\ps2|ll|time_out_counter[0]~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter[0]~9_combout\,
	datab => \ps2|ll|time_out_counter[0]~5_combout\,
	datac => \ps2|ll|Add2~6_combout\,
	datad => \ps2|ll|time_out_counter[0]~14_combout\,
	combout => \ps2|ll|Selector17~0_combout\);

-- Location: FF_X3_Y51_N27
\ps2|ll|time_out_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|Selector17~0_combout\,
	ena => \ps2|ll|time_out_counter[0]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|time_out_counter\(3));

-- Location: LCCOMB_X6_Y47_N8
\ps2|ll|ps2_clk_1~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|ps2_clk_1~feeder_combout\ = \ps2|ll|ps2_clk_0~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ps2|ll|ps2_clk_0~q\,
	combout => \ps2|ll|ps2_clk_1~feeder_combout\);

-- Location: FF_X6_Y47_N9
\ps2|ll|ps2_clk_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|ps2_clk_1~feeder_combout\,
	ena => \ps2|ll|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|ps2_clk_1~q\);

-- Location: LCCOMB_X6_Y47_N0
\ps2|ll|time_out_counter[0]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[0]~19_combout\ = (\ps2|ll|ps2_clk_0~q\ & (\ps2|ll|state.sending~q\ & (!\ps2|ll|ps2_clk_1~q\ & \ps2|ll|Equal6~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|ps2_clk_0~q\,
	datab => \ps2|ll|state.sending~q\,
	datac => \ps2|ll|ps2_clk_1~q\,
	datad => \ps2|ll|Equal6~0_combout\,
	combout => \ps2|ll|time_out_counter[0]~19_combout\);

-- Location: LCCOMB_X6_Y48_N14
\ps2|ll|start_bit~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|start_bit~0_combout\ = (\ps2|ll|start_bit~q\ & (((\ps2|ll|Equal3~3_combout\) # (!\ps2|ll|Equal1~0_combout\)) # (!\ps2|ll|time_out_counter[0]~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter[0]~19_combout\,
	datab => \ps2|ll|Equal3~3_combout\,
	datac => \ps2|ll|start_bit~q\,
	datad => \ps2|ll|Equal1~0_combout\,
	combout => \ps2|ll|start_bit~0_combout\);

-- Location: LCCOMB_X6_Y48_N28
\ps2|ll|start_bit~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|start_bit~1_combout\ = (\ps2|ll|start_bit~0_combout\) # ((!\ps2|ll|state.sending~q\ & (\ps2|ll|time_out_counter[0]~14_combout\ & \ps2|ll|Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state.sending~q\,
	datab => \ps2|ll|time_out_counter[0]~14_combout\,
	datac => \ps2|ll|start_bit~0_combout\,
	datad => \ps2|ll|Equal1~0_combout\,
	combout => \ps2|ll|start_bit~1_combout\);

-- Location: FF_X6_Y48_N29
\ps2|ll|start_bit\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|start_bit~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|start_bit~q\);

-- Location: LCCOMB_X5_Y51_N14
\ps2|ll|process_0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|process_0~8_combout\ = (\ps2|ll|time_out_counter\(2) & (\ps2|ll|time_out_counter\(1) & (\ps2|ll|time_out_counter\(3) & !\ps2|ll|start_bit~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter\(2),
	datab => \ps2|ll|time_out_counter\(1),
	datac => \ps2|ll|time_out_counter\(3),
	datad => \ps2|ll|start_bit~q\,
	combout => \ps2|ll|process_0~8_combout\);

-- Location: LCCOMB_X5_Y51_N8
\ps2|ll|Selector21~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector21~0_combout\ = (\ps2|ll|state.sending~q\ & (\ps2|ll|Equal3~4_combout\ & (\ps2|ll|process_0~8_combout\ & \ps2|ll|time_out_counter\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state.sending~q\,
	datab => \ps2|ll|Equal3~4_combout\,
	datac => \ps2|ll|process_0~8_combout\,
	datad => \ps2|ll|time_out_counter\(6),
	combout => \ps2|ll|Selector21~0_combout\);

-- Location: LCCOMB_X6_Y47_N18
\ps2|ll|process_0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|process_0~6_combout\ = (!\ps2|ll|ps2_clk_0~q\ & \ps2|ll|ps2_dat_0~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|ps2_clk_0~q\,
	datad => \ps2|ll|ps2_dat_0~q\,
	combout => \ps2|ll|process_0~6_combout\);

-- Location: LCCOMB_X5_Y47_N26
\ps2|ll|Selector21~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector21~1_combout\ = (!\ps2|ll|Selector21~0_combout\ & ((\ps2|ll|state.idle~q\) # ((\ps2|ll|process_0~6_combout\) # (!\ps2|ll|process_0~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state.idle~q\,
	datab => \ps2|ll|process_0~7_combout\,
	datac => \ps2|ll|Selector21~0_combout\,
	datad => \ps2|ll|process_0~6_combout\,
	combout => \ps2|ll|Selector21~1_combout\);

-- Location: LCCOMB_X5_Y47_N28
\ps2|ll|data[2]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|data[2]~3_combout\ = (\ps2|ll|Equal1~0_combout\ & ((!\ps2|ll|Selector21~1_combout\) # (!\ps2|ll|data[7]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|data[7]~2_combout\,
	datac => \ps2|ll|Selector21~1_combout\,
	datad => \ps2|ll|Equal1~0_combout\,
	combout => \ps2|ll|data[2]~3_combout\);

-- Location: FF_X7_Y45_N9
\ps2|ll|data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|Selector29~0_combout\,
	ena => \ps2|ll|data[2]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|data\(2));

-- Location: FF_X8_Y43_N1
\ps2|ll|rxd_data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \ps2|ll|data\(8),
	sload => VCC,
	ena => \ps2|ll|rxd_data[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|rxd_data\(6));

-- Location: LCCOMB_X7_Y45_N4
\ps2|ll|Selector27~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector27~0_combout\ = (\ps2|ll|state.idle~q\ & (\ps2|ll|data\(5))) # (!\ps2|ll|state.idle~q\ & ((\ps2|txd_data\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state.idle~q\,
	datac => \ps2|ll|data\(5),
	datad => \ps2|txd_data\(3),
	combout => \ps2|ll|Selector27~0_combout\);

-- Location: FF_X7_Y45_N5
\ps2|ll|data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|Selector27~0_combout\,
	ena => \ps2|ll|data[2]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|data\(4));

-- Location: LCCOMB_X8_Y43_N12
\ps2|ll|rxd_data[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|rxd_data[2]~feeder_combout\ = \ps2|ll|data\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ps2|ll|data\(4),
	combout => \ps2|ll|rxd_data[2]~feeder_combout\);

-- Location: FF_X8_Y43_N13
\ps2|ll|rxd_data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|rxd_data[2]~feeder_combout\,
	ena => \ps2|ll|rxd_data[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|rxd_data\(2));

-- Location: FF_X8_Y43_N21
\ps2|ll|rxd_data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \ps2|ll|data\(2),
	sload => VCC,
	ena => \ps2|ll|rxd_data[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|rxd_data\(0));

-- Location: LCCOMB_X8_Y43_N4
\ps2|process_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|process_0~0_combout\ = (!\ps2|ll|rxd_data\(2) & (!\ps2|ll|rxd_data\(0) & (\ps2|ll|rxd_data\(3) & \ps2|ll|rxd_valid~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|rxd_data\(2),
	datab => \ps2|ll|rxd_data\(0),
	datac => \ps2|ll|rxd_data\(3),
	datad => \ps2|ll|rxd_valid~q\,
	combout => \ps2|process_0~0_combout\);

-- Location: LCCOMB_X8_Y43_N16
\ps2|ll|rxd_data[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|rxd_data[4]~feeder_combout\ = \ps2|ll|data\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ps2|ll|data\(6),
	combout => \ps2|ll|rxd_data[4]~feeder_combout\);

-- Location: FF_X8_Y43_N17
\ps2|ll|rxd_data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|rxd_data[4]~feeder_combout\,
	ena => \ps2|ll|rxd_data[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|rxd_data\(4));

-- Location: LCCOMB_X8_Y43_N26
\ps2|process_0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|process_0~2_combout\ = (\ps2|process_0~1_combout\ & (\ps2|ll|rxd_data\(6) & (\ps2|process_0~0_combout\ & \ps2|ll|rxd_data\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|process_0~1_combout\,
	datab => \ps2|ll|rxd_data\(6),
	datac => \ps2|process_0~0_combout\,
	datad => \ps2|ll|rxd_data\(4),
	combout => \ps2|process_0~2_combout\);

-- Location: LCCOMB_X6_Y47_N30
\ps2|ll|time_out_counter[0]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[0]~6_combout\ = (!\ps2|ll|state.idle~q\ & ((\ps2|ll|ps2_clk_0~q\) # (!\ps2|ll|ps2_dat_0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|ps2_clk_0~q\,
	datac => \ps2|ll|state.idle~q\,
	datad => \ps2|ll|ps2_dat_0~q\,
	combout => \ps2|ll|time_out_counter[0]~6_combout\);

-- Location: LCCOMB_X6_Y47_N2
\ps2|ll|txd_accepted~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|txd_accepted~0_combout\ = (\ps2|ll|time_out_counter[0]~6_combout\ & (\ps2|ll|Equal1~0_combout\ & \ps2|ll|process_0~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter[0]~6_combout\,
	datac => \ps2|ll|Equal1~0_combout\,
	datad => \ps2|ll|process_0~7_combout\,
	combout => \ps2|ll|txd_accepted~0_combout\);

-- Location: FF_X6_Y47_N3
\ps2|ll|txd_accepted\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|txd_accepted~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|txd_accepted~q\);

-- Location: LCCOMB_X8_Y46_N24
\ps2|Selector10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector10~0_combout\ = (\ps2|state.wait_for_mouse_bat~q\ & (\ps2|Equal2~5_combout\ & (\ps2|Equal2~9_combout\ & \ps2|Equal2~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.wait_for_mouse_bat~q\,
	datab => \ps2|Equal2~5_combout\,
	datac => \ps2|Equal2~9_combout\,
	datad => \ps2|Equal2~4_combout\,
	combout => \ps2|Selector10~0_combout\);

-- Location: LCCOMB_X8_Y43_N20
\ps2|process_0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|process_0~4_combout\ = (!\ps2|ll|rxd_data\(2) & (!\ps2|ll|rxd_data\(4) & (!\ps2|ll|rxd_data\(0) & !\ps2|ll|rxd_data\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|rxd_data\(2),
	datab => \ps2|ll|rxd_data\(4),
	datac => \ps2|ll|rxd_data\(0),
	datad => \ps2|ll|rxd_data\(6),
	combout => \ps2|process_0~4_combout\);

-- Location: FF_X8_Y43_N31
\ps2|ll|rxd_data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \ps2|ll|data\(9),
	sload => VCC,
	ena => \ps2|ll|rxd_data[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|rxd_data\(7));

-- Location: LCCOMB_X8_Y43_N18
\ps2|ll|rxd_data[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|rxd_data[5]~feeder_combout\ = \ps2|ll|data\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ps2|ll|data\(7),
	combout => \ps2|ll|rxd_data[5]~feeder_combout\);

-- Location: FF_X8_Y43_N19
\ps2|ll|rxd_data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|rxd_data[5]~feeder_combout\,
	ena => \ps2|ll|rxd_data[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|rxd_data\(5));

-- Location: LCCOMB_X8_Y43_N10
\ps2|process_0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|process_0~5_combout\ = (!\ps2|ll|rxd_data\(7) & (!\ps2|ll|rxd_data\(1) & (!\ps2|ll|rxd_data\(3) & !\ps2|ll|rxd_data\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|rxd_data\(7),
	datab => \ps2|ll|rxd_data\(1),
	datac => \ps2|ll|rxd_data\(3),
	datad => \ps2|ll|rxd_data\(5),
	combout => \ps2|process_0~5_combout\);

-- Location: LCCOMB_X8_Y43_N8
\ps2|process_0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|process_0~6_combout\ = (\ps2|process_0~4_combout\ & (\ps2|ll|rxd_valid~q\ & \ps2|process_0~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|process_0~4_combout\,
	datac => \ps2|ll|rxd_valid~q\,
	datad => \ps2|process_0~5_combout\,
	combout => \ps2|process_0~6_combout\);

-- Location: LCCOMB_X8_Y45_N28
\ps2|Selector6~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector6~13_combout\ = (\ps2|state.wait_for_mouse_bat~q\ & ((\ps2|process_0~6_combout\) # ((\ps2|Equal2~4_combout\ & \ps2|Equal2~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Equal2~4_combout\,
	datab => \ps2|state.wait_for_mouse_bat~q\,
	datac => \ps2|Equal2~10_combout\,
	datad => \ps2|process_0~6_combout\,
	combout => \ps2|Selector6~13_combout\);

-- Location: LCCOMB_X9_Y45_N28
\ps2|state~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~52_combout\ = (!\ps2|Selector6~15_combout\ & (\ps2|state.restart~9_combout\ & !\ps2|Selector6~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Selector6~15_combout\,
	datac => \ps2|state.restart~9_combout\,
	datad => \ps2|Selector6~4_combout\,
	combout => \ps2|state~52_combout\);

-- Location: LCCOMB_X9_Y45_N18
\ps2|state~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~51_combout\ = (!\ps2|Equal2~8_combout\ & (\ps2|state.restart~9_combout\ & !\ps2|Selector6~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|Equal2~8_combout\,
	datac => \ps2|state.restart~9_combout\,
	datad => \ps2|Selector6~4_combout\,
	combout => \ps2|state~51_combout\);

-- Location: LCCOMB_X8_Y45_N4
\ps2|state~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~53_combout\ = (\ps2|Selector6~13_combout\ & ((\ps2|state~51_combout\) # ((\ps2|state~52_combout\ & \ps2|state.enable_mouse~q\)))) # (!\ps2|Selector6~13_combout\ & (\ps2|state~52_combout\ & (\ps2|state.enable_mouse~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Selector6~13_combout\,
	datab => \ps2|state~52_combout\,
	datac => \ps2|state.enable_mouse~q\,
	datad => \ps2|state~51_combout\,
	combout => \ps2|state~53_combout\);

-- Location: FF_X8_Y45_N5
\ps2|state.enable_mouse\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|state~53_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|state.enable_mouse~q\);

-- Location: LCCOMB_X8_Y44_N20
\ps2|txd_data[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|txd_data[1]~0_combout\ = (!\ps2|state.enable_mouse~q\ & !\ps2|state.enable_keyboard~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ps2|state.enable_mouse~q\,
	datad => \ps2|state.enable_keyboard~q\,
	combout => \ps2|txd_data[1]~0_combout\);

-- Location: LCCOMB_X9_Y45_N20
\ps2|state~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~49_combout\ = (!\ps2|ll|rxd_valid~q\ & \ps2|state.wait_for_second_mouse_byte~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ps2|ll|rxd_valid~q\,
	datad => \ps2|state.wait_for_second_mouse_byte~q\,
	combout => \ps2|state~49_combout\);

-- Location: LCCOMB_X9_Y45_N22
\ps2|state~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~50_combout\ = (\ps2|state.restart~9_combout\ & ((\ps2|Selector6~4_combout\) # ((!\ps2|Equal2~8_combout\ & \ps2|state~49_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Selector6~4_combout\,
	datab => \ps2|Equal2~8_combout\,
	datac => \ps2|state.restart~9_combout\,
	datad => \ps2|state~49_combout\,
	combout => \ps2|state~50_combout\);

-- Location: FF_X9_Y45_N23
\ps2|state.wait_for_second_mouse_byte\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|state~50_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|state.wait_for_second_mouse_byte~q\);

-- Location: LCCOMB_X9_Y45_N6
\ps2|state~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~45_combout\ = (\ps2|state~38_combout\ & ((\ps2|ll|rxd_valid~q\ & ((\ps2|state.wait_for_second_mouse_byte~q\))) # (!\ps2|ll|rxd_valid~q\ & (\ps2|state.wait_for_third_mouse_byte~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|rxd_valid~q\,
	datab => \ps2|state~38_combout\,
	datac => \ps2|state.wait_for_third_mouse_byte~q\,
	datad => \ps2|state.wait_for_second_mouse_byte~q\,
	combout => \ps2|state~45_combout\);

-- Location: FF_X9_Y45_N7
\ps2|state.wait_for_third_mouse_byte\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|state~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|state.wait_for_third_mouse_byte~q\);

-- Location: LCCOMB_X9_Y45_N26
\ps2|Selector6~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector6~10_combout\ = (\ps2|ll|rxd_valid~q\ & ((\ps2|state.wait_for_third_mouse_byte~q\) # (\ps2|state.wait_for_second_mouse_byte~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.wait_for_third_mouse_byte~q\,
	datac => \ps2|ll|rxd_valid~q\,
	datad => \ps2|state.wait_for_second_mouse_byte~q\,
	combout => \ps2|Selector6~10_combout\);

-- Location: LCCOMB_X8_Y45_N12
\ps2|Selector6~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector6~11_combout\ = (\ps2|Selector6~10_combout\) # ((\ps2|ll|txd_accepted~q\ & ((\ps2|Selector56~0_combout\) # (!\ps2|txd_data[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Selector56~0_combout\,
	datab => \ps2|txd_data[1]~0_combout\,
	datac => \ps2|ll|txd_accepted~q\,
	datad => \ps2|Selector6~10_combout\,
	combout => \ps2|Selector6~11_combout\);

-- Location: LCCOMB_X8_Y45_N8
\ps2|state~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~59_combout\ = (\ps2|state.wait_for_reset_acknowledge~q\ & (!\ps2|process_0~2_combout\ & ((!\ps2|Equal2~4_combout\) # (!\ps2|Equal2~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.wait_for_reset_acknowledge~q\,
	datab => \ps2|Equal2~10_combout\,
	datac => \ps2|Equal2~4_combout\,
	datad => \ps2|process_0~2_combout\,
	combout => \ps2|state~59_combout\);

-- Location: LCCOMB_X8_Y44_N0
\ps2|state~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~60_combout\ = (\ps2|state.restart~9_combout\ & ((\ps2|state~59_combout\) # ((\ps2|state~41_combout\ & \ps2|ll|txd_accepted~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state~41_combout\,
	datab => \ps2|state~59_combout\,
	datac => \ps2|ll|txd_accepted~q\,
	datad => \ps2|state.restart~9_combout\,
	combout => \ps2|state~60_combout\);

-- Location: FF_X8_Y44_N1
\ps2|state.wait_for_reset_acknowledge\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|state~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|state.wait_for_reset_acknowledge~q\);

-- Location: LCCOMB_X8_Y44_N6
\ps2|state~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~54_combout\ = (\ps2|ll|txd_accepted~q\ & \ps2|state.enable_mouse~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|txd_accepted~q\,
	datac => \ps2|state.enable_mouse~q\,
	combout => \ps2|state~54_combout\);

-- Location: LCCOMB_X8_Y44_N2
\ps2|state~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~55_combout\ = (\ps2|state~38_combout\ & ((\ps2|state~54_combout\) # ((!\ps2|process_0~2_combout\ & \ps2|state.wait_for_enable_mouse_acknowledge~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state~54_combout\,
	datab => \ps2|process_0~2_combout\,
	datac => \ps2|state.wait_for_enable_mouse_acknowledge~q\,
	datad => \ps2|state~38_combout\,
	combout => \ps2|state~55_combout\);

-- Location: FF_X8_Y44_N3
\ps2|state.wait_for_enable_mouse_acknowledge\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|state~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|state.wait_for_enable_mouse_acknowledge~q\);

-- Location: LCCOMB_X8_Y43_N22
\ps2|Selector6~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector6~8_combout\ = (\ps2|state.wait_for_reset_acknowledge~q\) # ((\ps2|state.wait_for_enable_mouse_acknowledge~q\) # (\ps2|state.wait_for_enable_keyboard_acknowledge~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.wait_for_reset_acknowledge~q\,
	datab => \ps2|state.wait_for_enable_mouse_acknowledge~q\,
	datac => \ps2|state.wait_for_enable_keyboard_acknowledge~q\,
	combout => \ps2|Selector6~8_combout\);

-- Location: LCCOMB_X8_Y43_N0
\ps2|process_0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|process_0~7_combout\ = (\ps2|ll|rxd_data\(6) & \ps2|ll|rxd_data\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ps2|ll|rxd_data\(6),
	datad => \ps2|ll|rxd_data\(4),
	combout => \ps2|process_0~7_combout\);

-- Location: LCCOMB_X8_Y43_N28
\ps2|Selector6~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector6~9_combout\ = (\ps2|Selector6~8_combout\ & (\ps2|process_0~0_combout\ & (\ps2|process_0~1_combout\ & \ps2|process_0~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Selector6~8_combout\,
	datab => \ps2|process_0~0_combout\,
	datac => \ps2|process_0~1_combout\,
	datad => \ps2|process_0~7_combout\,
	combout => \ps2|Selector6~9_combout\);

-- Location: LCCOMB_X9_Y45_N8
\ps2|state~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~46_combout\ = (\ps2|state.wait_for_first_mouse_byte~q\ & ((!\ps2|ll|rxd_valid~q\) # (!\ps2|ll|rxd_data\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|rxd_data\(3),
	datac => \ps2|ll|rxd_valid~q\,
	datad => \ps2|state.wait_for_first_mouse_byte~q\,
	combout => \ps2|state~46_combout\);

-- Location: LCCOMB_X9_Y45_N2
\ps2|state~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~47_combout\ = (\ps2|ll|rxd_valid~q\ & ((\ps2|state.wait_for_third_mouse_byte~q\) # ((\ps2|process_0~2_combout\ & \ps2|state.wait_for_enable_mouse_acknowledge~q\)))) # (!\ps2|ll|rxd_valid~q\ & (\ps2|process_0~2_combout\ & 
-- (\ps2|state.wait_for_enable_mouse_acknowledge~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|rxd_valid~q\,
	datab => \ps2|process_0~2_combout\,
	datac => \ps2|state.wait_for_enable_mouse_acknowledge~q\,
	datad => \ps2|state.wait_for_third_mouse_byte~q\,
	combout => \ps2|state~47_combout\);

-- Location: LCCOMB_X9_Y45_N0
\ps2|state~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~48_combout\ = (\ps2|state.restart~9_combout\ & ((\ps2|state~46_combout\) # ((!\ps2|Equal2~8_combout\ & \ps2|state~47_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.restart~9_combout\,
	datab => \ps2|Equal2~8_combout\,
	datac => \ps2|state~46_combout\,
	datad => \ps2|state~47_combout\,
	combout => \ps2|state~48_combout\);

-- Location: FF_X9_Y45_N1
\ps2|state.wait_for_first_mouse_byte\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|state~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|state.wait_for_first_mouse_byte~q\);

-- Location: LCCOMB_X8_Y46_N6
\ps2|Selector6~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector6~5_combout\ = (!\ps2|state.wait_for_mouse_bat~q\ & (!\ps2|state.wait_for_first_mouse_byte~q\ & (!\ps2|state.periodic_reset~q\ & \ps2|state.restart~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.wait_for_mouse_bat~q\,
	datab => \ps2|state.wait_for_first_mouse_byte~q\,
	datac => \ps2|state.periodic_reset~q\,
	datad => \ps2|state.restart~q\,
	combout => \ps2|Selector6~5_combout\);

-- Location: LCCOMB_X8_Y46_N2
\ps2|Selector6~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector6~6_combout\ = (\ps2|Selector6~5_combout\ & (!\ps2|state.keyboard_wait_for_change~q\ & !\ps2|state.wait_for_bat~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Selector6~5_combout\,
	datab => \ps2|state.keyboard_wait_for_change~q\,
	datad => \ps2|state.wait_for_bat~q\,
	combout => \ps2|Selector6~6_combout\);

-- Location: LCCOMB_X8_Y45_N10
\ps2|Selector6~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector6~12_combout\ = (\ps2|Selector6~11_combout\ & (((\ps2|state~41_combout\) # (\ps2|Selector6~6_combout\)))) # (!\ps2|Selector6~11_combout\ & (\ps2|Selector6~9_combout\ & ((\ps2|state~41_combout\) # (\ps2|Selector6~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Selector6~11_combout\,
	datab => \ps2|Selector6~9_combout\,
	datac => \ps2|state~41_combout\,
	datad => \ps2|Selector6~6_combout\,
	combout => \ps2|Selector6~12_combout\);

-- Location: LCCOMB_X8_Y45_N18
\ps2|Selector6~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector6~7_combout\ = ((\ps2|Equal2~10_combout\ & (\ps2|Equal2~4_combout\ & \ps2|Selector6~6_combout\))) # (!\ps2|state.restart~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.restart~q\,
	datab => \ps2|Equal2~10_combout\,
	datac => \ps2|Equal2~4_combout\,
	datad => \ps2|Selector6~6_combout\,
	combout => \ps2|Selector6~7_combout\);

-- Location: LCCOMB_X8_Y45_N26
\ps2|Selector6~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector6~15_combout\ = (\ps2|Selector6~12_combout\) # ((\ps2|Selector6~13_combout\) # ((\ps2|Selector6~14_combout\) # (\ps2|Selector6~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Selector6~12_combout\,
	datab => \ps2|Selector6~13_combout\,
	datac => \ps2|Selector6~14_combout\,
	datad => \ps2|Selector6~7_combout\,
	combout => \ps2|Selector6~15_combout\);

-- Location: LCCOMB_X9_Y45_N14
\ps2|state~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~62_combout\ = (\ps2|state.restart~9_combout\ & (((!\ps2|state.wait_for_first_mouse_byte~q\) # (!\ps2|ll|rxd_valid~q\)) # (!\ps2|ll|rxd_data\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.restart~9_combout\,
	datab => \ps2|ll|rxd_data\(3),
	datac => \ps2|ll|rxd_valid~q\,
	datad => \ps2|state.wait_for_first_mouse_byte~q\,
	combout => \ps2|state~62_combout\);

-- Location: LCCOMB_X9_Y44_N26
\ps2|state~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~57_combout\ = (\ps2|state~62_combout\ & ((\ps2|Selector6~15_combout\ & (\ps2|Selector10~0_combout\)) # (!\ps2|Selector6~15_combout\ & ((\ps2|state.enable_keyboard~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Selector10~0_combout\,
	datab => \ps2|Selector6~15_combout\,
	datac => \ps2|state.enable_keyboard~q\,
	datad => \ps2|state~62_combout\,
	combout => \ps2|state~57_combout\);

-- Location: FF_X9_Y44_N27
\ps2|state.enable_keyboard\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|state~57_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|state.enable_keyboard~q\);

-- Location: LCCOMB_X8_Y44_N18
\ps2|state~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~39_combout\ = (\ps2|ll|txd_accepted~q\ & \ps2|state.enable_keyboard~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ps2|ll|txd_accepted~q\,
	datad => \ps2|state.enable_keyboard~q\,
	combout => \ps2|state~39_combout\);

-- Location: LCCOMB_X8_Y44_N30
\ps2|state~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~40_combout\ = (\ps2|state~38_combout\ & ((\ps2|state~39_combout\) # ((!\ps2|process_0~2_combout\ & \ps2|state.wait_for_enable_keyboard_acknowledge~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|process_0~2_combout\,
	datab => \ps2|state~39_combout\,
	datac => \ps2|state.wait_for_enable_keyboard_acknowledge~q\,
	datad => \ps2|state~38_combout\,
	combout => \ps2|state~40_combout\);

-- Location: FF_X8_Y44_N31
\ps2|state.wait_for_enable_keyboard_acknowledge\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|state~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|state.wait_for_enable_keyboard_acknowledge~q\);

-- Location: LCCOMB_X8_Y44_N8
\ps2|state~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~36_combout\ = (\ps2|state.keyboard_wait_for_change~q\) # ((\ps2|state.wait_for_enable_keyboard_acknowledge~q\ & (!\ps2|Equal2~8_combout\ & \ps2|process_0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.wait_for_enable_keyboard_acknowledge~q\,
	datab => \ps2|Equal2~8_combout\,
	datac => \ps2|process_0~2_combout\,
	datad => \ps2|state.keyboard_wait_for_change~q\,
	combout => \ps2|state~36_combout\);

-- Location: LCCOMB_X8_Y44_N24
\ps2|state~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~37_combout\ = (\ps2|state~36_combout\ & \ps2|state.restart~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ps2|state~36_combout\,
	datad => \ps2|state.restart~9_combout\,
	combout => \ps2|state~37_combout\);

-- Location: FF_X8_Y44_N25
\ps2|state.keyboard_wait_for_change\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|state~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|state.keyboard_wait_for_change~q\);

-- Location: LCCOMB_X8_Y45_N22
\ps2|Selector56~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector56~0_combout\ = (\ps2|state.keyboard_wait_for_change~q\) # (\ps2|state.periodic_reset~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|state.keyboard_wait_for_change~q\,
	datad => \ps2|state.periodic_reset~q\,
	combout => \ps2|Selector56~0_combout\);

-- Location: FF_X8_Y45_N23
\ps2|txd_data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|Selector56~0_combout\,
	ena => \ps2|txd_data[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|txd_data\(0));

-- Location: LCCOMB_X7_Y45_N18
\ps2|ll|Selector30~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector30~0_combout\ = (\ps2|ll|state.idle~q\ & (\ps2|ll|data\(2))) # (!\ps2|ll|state.idle~q\ & ((\ps2|txd_data\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state.idle~q\,
	datac => \ps2|ll|data\(2),
	datad => \ps2|txd_data\(0),
	combout => \ps2|ll|Selector30~0_combout\);

-- Location: FF_X7_Y45_N19
\ps2|ll|data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|Selector30~0_combout\,
	ena => \ps2|ll|data[2]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|data\(1));

-- Location: LCCOMB_X6_Y47_N28
\ps2|ll|process_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|process_0~0_combout\ = (\ps2|ll|ps2_clk_1~q\ & !\ps2|ll|ps2_clk_0~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ps2|ll|ps2_clk_1~q\,
	datad => \ps2|ll|ps2_clk_0~q\,
	combout => \ps2|ll|process_0~0_combout\);

-- Location: LCCOMB_X4_Y48_N14
\ps2|ll|rxd_data[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|rxd_data[1]~0_combout\ = (\ps2|ll|process_0~4_combout\ & (!\ps2|ll|n_bits\(0) & (!\ps2|ll|data\(1) & \ps2|ll|process_0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|process_0~4_combout\,
	datab => \ps2|ll|n_bits\(0),
	datac => \ps2|ll|data\(1),
	datad => \ps2|ll|process_0~0_combout\,
	combout => \ps2|ll|rxd_data[1]~0_combout\);

-- Location: LCCOMB_X6_Y48_N10
\ps2|ll|state~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~29_combout\ = (\ps2|ll|state.sending~q\ & ((!\ps2|ll|Equal3~2_combout\) # (!\ps2|ll|Equal3~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|Equal3~4_combout\,
	datac => \ps2|ll|state.sending~q\,
	datad => \ps2|ll|Equal3~2_combout\,
	combout => \ps2|ll|state~29_combout\);

-- Location: LCCOMB_X6_Y48_N0
\ps2|ll|state~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~30_combout\ = (\ps2|ll|state.idle~2_combout\ & ((\ps2|ll|state~18_combout\ & ((\ps2|ll|state.waiting_for_acknowledge~q\))) # (!\ps2|ll|state~18_combout\ & (\ps2|ll|state~29_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state~29_combout\,
	datab => \ps2|ll|state.idle~2_combout\,
	datac => \ps2|ll|state.waiting_for_acknowledge~q\,
	datad => \ps2|ll|state~18_combout\,
	combout => \ps2|ll|state~30_combout\);

-- Location: FF_X6_Y48_N1
\ps2|ll|state.waiting_for_acknowledge\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|state~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|state.waiting_for_acknowledge~q\);

-- Location: LCCOMB_X5_Y48_N4
\ps2|ll|state~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~24_combout\ = (\ps2|ll|state.finishing~q\ & (\ps2|ll|ps2_dat_0~q\)) # (!\ps2|ll|state.finishing~q\ & ((\ps2|ll|state.receiving~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state.finishing~q\,
	datac => \ps2|ll|ps2_dat_0~q\,
	datad => \ps2|ll|state.receiving~q\,
	combout => \ps2|ll|state~24_combout\);

-- Location: LCCOMB_X5_Y48_N10
\ps2|ll|state~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~25_combout\ = (\ps2|ll|state~24_combout\ & (!\ps2|ll|Equal3~3_combout\ & ((\ps2|ll|state.finishing~q\) # (!\ps2|ll|rxd_data[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|rxd_data[1]~0_combout\,
	datab => \ps2|ll|state~24_combout\,
	datac => \ps2|ll|state.finishing~q\,
	datad => \ps2|ll|Equal3~3_combout\,
	combout => \ps2|ll|state~25_combout\);

-- Location: LCCOMB_X5_Y48_N8
\ps2|ll|state~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~27_combout\ = ((!\ps2|ll|process_0~0_combout\ & (\ps2|ll|state.waiting_for_acknowledge~q\ & !\ps2|ll|Equal3~3_combout\))) # (!\ps2|ll|Equal1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Equal1~0_combout\,
	datab => \ps2|ll|process_0~0_combout\,
	datac => \ps2|ll|state.waiting_for_acknowledge~q\,
	datad => \ps2|ll|Equal3~3_combout\,
	combout => \ps2|ll|state~27_combout\);

-- Location: LCCOMB_X6_Y48_N12
\ps2|ll|state~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~20_combout\ = (\ps2|ll|state.idle~2_combout\ & ((\ps2|ll|state~18_combout\ & ((\ps2|ll|state.interrupting~q\))) # (!\ps2|ll|state~18_combout\ & (\ps2|ll|time_out_counter[0]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter[0]~6_combout\,
	datab => \ps2|ll|state.idle~2_combout\,
	datac => \ps2|ll|state.interrupting~q\,
	datad => \ps2|ll|state~18_combout\,
	combout => \ps2|ll|state~20_combout\);

-- Location: FF_X6_Y48_N13
\ps2|ll|state.interrupting\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|state~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|state.interrupting~q\);

-- Location: LCCOMB_X6_Y48_N18
\ps2|ll|state~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~22_combout\ = (\ps2|ll|time_out_counter[0]~6_combout\) # ((\ps2|ll|state.interrupting~q\) # ((!\ps2|ll|Equal3~3_combout\ & \ps2|ll|state.sending~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter[0]~6_combout\,
	datab => \ps2|ll|Equal3~3_combout\,
	datac => \ps2|ll|state.sending~q\,
	datad => \ps2|ll|state.interrupting~q\,
	combout => \ps2|ll|state~22_combout\);

-- Location: LCCOMB_X6_Y47_N14
\ps2|ll|state~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~31_combout\ = (\ps2|ll|state.idle~q\ & ((\ps2|ll|state.sending~q\ & ((\ps2|ll|Equal6~0_combout\))) # (!\ps2|ll|state.sending~q\ & (!\ps2|ll|Equal3~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Equal3~3_combout\,
	datab => \ps2|ll|state.sending~q\,
	datac => \ps2|ll|state.idle~q\,
	datad => \ps2|ll|Equal6~0_combout\,
	combout => \ps2|ll|state~31_combout\);

-- Location: LCCOMB_X6_Y48_N4
\ps2|ll|state~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~26_combout\ = (\ps2|ll|state~22_combout\ & ((\ps2|ll|state~31_combout\) # ((!\ps2|ll|process_0~7_combout\ & !\ps2|ll|state.idle~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|process_0~7_combout\,
	datab => \ps2|ll|state~22_combout\,
	datac => \ps2|ll|state.idle~q\,
	datad => \ps2|ll|state~31_combout\,
	combout => \ps2|ll|state~26_combout\);

-- Location: LCCOMB_X5_Y48_N18
\ps2|ll|state~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~28_combout\ = ((!\ps2|ll|state~25_combout\ & (!\ps2|ll|state~27_combout\ & !\ps2|ll|state~26_combout\))) # (!\ps2|ll|state.idle~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state~25_combout\,
	datab => \ps2|ll|state.idle~2_combout\,
	datac => \ps2|ll|state~27_combout\,
	datad => \ps2|ll|state~26_combout\,
	combout => \ps2|ll|state~28_combout\);

-- Location: LCCOMB_X6_Y47_N10
\ps2|ll|ps2_dat_1~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|ps2_dat_1~feeder_combout\ = \ps2|ll|ps2_dat_0~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ps2|ll|ps2_dat_0~q\,
	combout => \ps2|ll|ps2_dat_1~feeder_combout\);

-- Location: FF_X6_Y47_N11
\ps2|ll|ps2_dat_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|ps2_dat_1~feeder_combout\,
	ena => \ps2|ll|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|ps2_dat_1~q\);

-- Location: LCCOMB_X6_Y48_N16
\ps2|ll|state.finishing~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state.finishing~0_combout\ = (\ps2|ll|ps2_dat_1~q\ & (\ps2|ll|state.waiting_for_acknowledge~q\ & ((!\ps2|ll|Equal3~4_combout\) # (!\ps2|ll|Equal3~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Equal3~2_combout\,
	datab => \ps2|ll|Equal3~4_combout\,
	datac => \ps2|ll|ps2_dat_1~q\,
	datad => \ps2|ll|state.waiting_for_acknowledge~q\,
	combout => \ps2|ll|state.finishing~0_combout\);

-- Location: LCCOMB_X5_Y48_N26
\ps2|ll|state.finishing~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state.finishing~1_combout\ = (\ps2|ll|state~28_combout\ & (\ps2|ll|state.idle~2_combout\ & ((\ps2|ll|state.finishing~0_combout\)))) # (!\ps2|ll|state~28_combout\ & (((\ps2|ll|state.finishing~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state~28_combout\,
	datab => \ps2|ll|state.idle~2_combout\,
	datac => \ps2|ll|state.finishing~q\,
	datad => \ps2|ll|state.finishing~0_combout\,
	combout => \ps2|ll|state.finishing~1_combout\);

-- Location: FF_X5_Y48_N27
\ps2|ll|state.finishing\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|state.finishing~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|state.finishing~q\);

-- Location: LCCOMB_X5_Y48_N12
\ps2|ll|state.idle~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state.idle~0_combout\ = (\ps2|ll|state.idle~q\ & (!\ps2|ll|state.waiting_for_acknowledge~q\ & (!\ps2|ll|state.finishing~q\ & !\ps2|ll|state.sending~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state.idle~q\,
	datab => \ps2|ll|state.waiting_for_acknowledge~q\,
	datac => \ps2|ll|state.finishing~q\,
	datad => \ps2|ll|state.sending~q\,
	combout => \ps2|ll|state.idle~0_combout\);

-- Location: LCCOMB_X5_Y48_N14
\ps2|ll|state.idle~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state.idle~1_combout\ = (\ps2|ll|state.idle~q\ & ((\ps2|ll|state.waiting_for_acknowledge~q\ & (!\ps2|ll|state.finishing~q\ & !\ps2|ll|state.sending~q\)) # (!\ps2|ll|state.waiting_for_acknowledge~q\ & (\ps2|ll|state.finishing~q\ $ 
-- (\ps2|ll|state.sending~q\))))) # (!\ps2|ll|state.idle~q\ & (!\ps2|ll|state.waiting_for_acknowledge~q\ & (!\ps2|ll|state.finishing~q\ & !\ps2|ll|state.sending~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000101001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state.idle~q\,
	datab => \ps2|ll|state.waiting_for_acknowledge~q\,
	datac => \ps2|ll|state.finishing~q\,
	datad => \ps2|ll|state.sending~q\,
	combout => \ps2|ll|state.idle~1_combout\);

-- Location: LCCOMB_X5_Y48_N24
\ps2|ll|state.idle~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state.idle~2_combout\ = (\ps2|ll|state.interrupting~q\ & (\ps2|ll|state.idle~0_combout\ & ((!\ps2|ll|state.receiving~q\)))) # (!\ps2|ll|state.interrupting~q\ & ((\ps2|ll|state.receiving~q\ & (\ps2|ll|state.idle~0_combout\)) # 
-- (!\ps2|ll|state.receiving~q\ & ((\ps2|ll|state.idle~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state.idle~0_combout\,
	datab => \ps2|ll|state.interrupting~q\,
	datac => \ps2|ll|state.idle~1_combout\,
	datad => \ps2|ll|state.receiving~q\,
	combout => \ps2|ll|state.idle~2_combout\);

-- Location: LCCOMB_X6_Y48_N8
\ps2|ll|state~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~19_combout\ = (\ps2|ll|state.idle~2_combout\ & ((\ps2|ll|state~18_combout\ & ((\ps2|ll|state.receiving~q\))) # (!\ps2|ll|state~18_combout\ & (\ps2|ll|time_out_counter[0]~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter[0]~5_combout\,
	datab => \ps2|ll|state.idle~2_combout\,
	datac => \ps2|ll|state.receiving~q\,
	datad => \ps2|ll|state~18_combout\,
	combout => \ps2|ll|state~19_combout\);

-- Location: FF_X6_Y48_N9
\ps2|ll|state.receiving\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|state~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|state.receiving~q\);

-- Location: LCCOMB_X5_Y48_N0
\ps2|ll|rxd_data[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|rxd_data[1]~1_combout\ = (\ps2|ll|rxd_data[1]~0_combout\ & (\ps2|ll|Equal1~0_combout\ & (\ps2|ll|state.receiving~q\ & !\ps2|ll|Equal3~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|rxd_data[1]~0_combout\,
	datab => \ps2|ll|Equal1~0_combout\,
	datac => \ps2|ll|state.receiving~q\,
	datad => \ps2|ll|Equal3~3_combout\,
	combout => \ps2|ll|rxd_data[1]~1_combout\);

-- Location: FF_X8_Y43_N15
\ps2|ll|rxd_data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|rxd_data[1]~feeder_combout\,
	ena => \ps2|ll|rxd_data[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|rxd_data\(1));

-- Location: LCCOMB_X8_Y43_N30
\ps2|process_0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|process_0~1_combout\ = (\ps2|ll|rxd_data\(1) & (\ps2|ll|rxd_data\(7) & \ps2|ll|rxd_data\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|rxd_data\(1),
	datac => \ps2|ll|rxd_data\(7),
	datad => \ps2|ll|rxd_data\(5),
	combout => \ps2|process_0~1_combout\);

-- Location: LCCOMB_X8_Y43_N6
\ps2|process_0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|process_0~3_combout\ = (\ps2|process_0~1_combout\ & (!\ps2|ll|rxd_data\(6) & (\ps2|process_0~0_combout\ & !\ps2|ll|rxd_data\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|process_0~1_combout\,
	datab => \ps2|ll|rxd_data\(6),
	datac => \ps2|process_0~0_combout\,
	datad => \ps2|ll|rxd_data\(4),
	combout => \ps2|process_0~3_combout\);

-- Location: LCCOMB_X8_Y43_N2
\ps2|Selector6~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector6~16_combout\ = (\ps2|state.wait_for_reset_acknowledge~q\ & (\ps2|process_0~0_combout\ & (\ps2|process_0~1_combout\ & \ps2|process_0~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.wait_for_reset_acknowledge~q\,
	datab => \ps2|process_0~0_combout\,
	datac => \ps2|process_0~1_combout\,
	datad => \ps2|process_0~7_combout\,
	combout => \ps2|Selector6~16_combout\);

-- Location: LCCOMB_X8_Y43_N24
\ps2|state~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~61_combout\ = (\ps2|state~38_combout\ & ((\ps2|Selector6~16_combout\) # ((!\ps2|process_0~3_combout\ & \ps2|state.wait_for_bat~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state~38_combout\,
	datab => \ps2|process_0~3_combout\,
	datac => \ps2|state.wait_for_bat~q\,
	datad => \ps2|Selector6~16_combout\,
	combout => \ps2|state~61_combout\);

-- Location: FF_X8_Y43_N25
\ps2|state.wait_for_bat\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|state~61_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|state.wait_for_bat~q\);

-- Location: LCCOMB_X8_Y44_N22
\ps2|state.restart~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state.restart~5_combout\ = (!\ps2|state.wait_for_enable_keyboard_acknowledge~q\ & (!\ps2|state.enable_keyboard~q\ & (!\ps2|state.wait_for_mouse_bat~q\ & !\ps2|state.periodic_reset~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.wait_for_enable_keyboard_acknowledge~q\,
	datab => \ps2|state.enable_keyboard~q\,
	datac => \ps2|state.wait_for_mouse_bat~q\,
	datad => \ps2|state.periodic_reset~q\,
	combout => \ps2|state.restart~5_combout\);

-- Location: LCCOMB_X9_Y45_N24
\ps2|state.restart~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state.restart~0_combout\ = (\ps2|state.wait_for_third_mouse_byte~q\ & (!\ps2|state.wait_for_first_mouse_byte~q\ & (\ps2|state.restart~q\ & !\ps2|state.wait_for_second_mouse_byte~q\))) # (!\ps2|state.wait_for_third_mouse_byte~q\ & 
-- ((\ps2|state.wait_for_first_mouse_byte~q\ & (\ps2|state.restart~q\ & !\ps2|state.wait_for_second_mouse_byte~q\)) # (!\ps2|state.wait_for_first_mouse_byte~q\ & (\ps2|state.restart~q\ $ (!\ps2|state.wait_for_second_mouse_byte~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000001100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.wait_for_third_mouse_byte~q\,
	datab => \ps2|state.wait_for_first_mouse_byte~q\,
	datac => \ps2|state.restart~q\,
	datad => \ps2|state.wait_for_second_mouse_byte~q\,
	combout => \ps2|state.restart~0_combout\);

-- Location: LCCOMB_X8_Y44_N14
\ps2|state.restart~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state.restart~3_combout\ = (!\ps2|state.keyboard_wait_for_change~q\ & (!\ps2|state.enable_mouse~q\ & !\ps2|state.wait_for_enable_mouse_acknowledge~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|state.keyboard_wait_for_change~q\,
	datac => \ps2|state.enable_mouse~q\,
	datad => \ps2|state.wait_for_enable_mouse_acknowledge~q\,
	combout => \ps2|state.restart~3_combout\);

-- Location: LCCOMB_X9_Y45_N30
\ps2|state.restart~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state.restart~2_combout\ = (!\ps2|state.wait_for_third_mouse_byte~q\ & (!\ps2|state.wait_for_first_mouse_byte~q\ & (\ps2|state.restart~q\ & !\ps2|state.wait_for_second_mouse_byte~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.wait_for_third_mouse_byte~q\,
	datab => \ps2|state.wait_for_first_mouse_byte~q\,
	datac => \ps2|state.restart~q\,
	datad => \ps2|state.wait_for_second_mouse_byte~q\,
	combout => \ps2|state.restart~2_combout\);

-- Location: LCCOMB_X8_Y44_N16
\ps2|state.restart~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state.restart~1_combout\ = (\ps2|state.keyboard_wait_for_change~q\ & (!\ps2|state.enable_mouse~q\ & !\ps2|state.wait_for_enable_mouse_acknowledge~q\)) # (!\ps2|state.keyboard_wait_for_change~q\ & (\ps2|state.enable_mouse~q\ $ 
-- (\ps2|state.wait_for_enable_mouse_acknowledge~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|state.keyboard_wait_for_change~q\,
	datac => \ps2|state.enable_mouse~q\,
	datad => \ps2|state.wait_for_enable_mouse_acknowledge~q\,
	combout => \ps2|state.restart~1_combout\);

-- Location: LCCOMB_X8_Y44_N12
\ps2|state.restart~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state.restart~4_combout\ = (\ps2|state.restart~0_combout\ & ((\ps2|state.restart~3_combout\) # ((\ps2|state.restart~2_combout\ & \ps2|state.restart~1_combout\)))) # (!\ps2|state.restart~0_combout\ & (((\ps2|state.restart~2_combout\ & 
-- \ps2|state.restart~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.restart~0_combout\,
	datab => \ps2|state.restart~3_combout\,
	datac => \ps2|state.restart~2_combout\,
	datad => \ps2|state.restart~1_combout\,
	combout => \ps2|state.restart~4_combout\);

-- Location: LCCOMB_X8_Y44_N26
\ps2|state.restart~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state.restart~6_combout\ = (!\ps2|state.wait_for_bat~q\ & (!\ps2|state.wait_for_reset_acknowledge~q\ & (\ps2|state.restart~5_combout\ & \ps2|state.restart~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.wait_for_bat~q\,
	datab => \ps2|state.wait_for_reset_acknowledge~q\,
	datac => \ps2|state.restart~5_combout\,
	datad => \ps2|state.restart~4_combout\,
	combout => \ps2|state.restart~6_combout\);

-- Location: LCCOMB_X8_Y44_N4
\ps2|state.restart~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state.restart~7_combout\ = (\ps2|state.wait_for_enable_keyboard_acknowledge~q\ & (!\ps2|state.enable_keyboard~q\ & (!\ps2|state.wait_for_mouse_bat~q\ & !\ps2|state.periodic_reset~q\))) # (!\ps2|state.wait_for_enable_keyboard_acknowledge~q\ & 
-- ((\ps2|state.enable_keyboard~q\ & (!\ps2|state.wait_for_mouse_bat~q\ & !\ps2|state.periodic_reset~q\)) # (!\ps2|state.enable_keyboard~q\ & (\ps2|state.wait_for_mouse_bat~q\ $ (\ps2|state.periodic_reset~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.wait_for_enable_keyboard_acknowledge~q\,
	datab => \ps2|state.enable_keyboard~q\,
	datac => \ps2|state.wait_for_mouse_bat~q\,
	datad => \ps2|state.periodic_reset~q\,
	combout => \ps2|state.restart~7_combout\);

-- Location: LCCOMB_X8_Y44_N10
\ps2|state.restart~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state.restart~8_combout\ = (\ps2|state.wait_for_bat~q\ & (\ps2|state.restart~5_combout\ & ((!\ps2|state.wait_for_reset_acknowledge~q\)))) # (!\ps2|state.wait_for_bat~q\ & ((\ps2|state.wait_for_reset_acknowledge~q\ & (\ps2|state.restart~5_combout\)) # 
-- (!\ps2|state.wait_for_reset_acknowledge~q\ & ((\ps2|state.restart~7_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.restart~5_combout\,
	datab => \ps2|state.restart~7_combout\,
	datac => \ps2|state.wait_for_bat~q\,
	datad => \ps2|state.wait_for_reset_acknowledge~q\,
	combout => \ps2|state.restart~8_combout\);

-- Location: LCCOMB_X8_Y44_N28
\ps2|state.restart~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state.restart~9_combout\ = (\ps2|state.restart~6_combout\) # ((\ps2|state.restart~3_combout\ & (\ps2|state.restart~2_combout\ & \ps2|state.restart~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.restart~6_combout\,
	datab => \ps2|state.restart~3_combout\,
	datac => \ps2|state.restart~2_combout\,
	datad => \ps2|state.restart~8_combout\,
	combout => \ps2|state.restart~9_combout\);

-- Location: LCCOMB_X8_Y45_N20
\ps2|state~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~42_combout\ = (\ps2|Selector6~14_combout\) # ((\ps2|Selector6~6_combout\ & \ps2|state.restart~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|Selector6~6_combout\,
	datac => \ps2|Selector6~14_combout\,
	datad => \ps2|state.restart~q\,
	combout => \ps2|state~42_combout\);

-- Location: LCCOMB_X8_Y45_N14
\ps2|state~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~43_combout\ = (\ps2|Equal2~4_combout\ & (\ps2|Equal2~10_combout\ & (!\ps2|Selector6~4_combout\ & !\ps2|state.wait_for_mouse_bat~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Equal2~4_combout\,
	datab => \ps2|Equal2~10_combout\,
	datac => \ps2|Selector6~4_combout\,
	datad => \ps2|state.wait_for_mouse_bat~q\,
	combout => \ps2|state~43_combout\);

-- Location: LCCOMB_X9_Y45_N4
\ps2|state~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~44_combout\ = (\ps2|state.restart~9_combout\ & (((!\ps2|state~43_combout\) # (!\ps2|Selector6~15_combout\)) # (!\ps2|state~42_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.restart~9_combout\,
	datab => \ps2|state~42_combout\,
	datac => \ps2|Selector6~15_combout\,
	datad => \ps2|state~43_combout\,
	combout => \ps2|state~44_combout\);

-- Location: FF_X9_Y45_N5
\ps2|state.restart\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|state~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|state.restart~q\);

-- Location: LCCOMB_X9_Y44_N4
\ps2|state~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~58_combout\ = (\ps2|state~62_combout\ & (((!\ps2|Selector6~15_combout\ & \ps2|state.periodic_reset~q\)) # (!\ps2|state.restart~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.restart~q\,
	datab => \ps2|Selector6~15_combout\,
	datac => \ps2|state.periodic_reset~q\,
	datad => \ps2|state~62_combout\,
	combout => \ps2|state~58_combout\);

-- Location: FF_X9_Y44_N5
\ps2|state.periodic_reset\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|state~58_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|state.periodic_reset~q\);

-- Location: LCCOMB_X8_Y46_N12
\ps2|state~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~41_combout\ = (\ps2|Equal2~9_combout\ & (\ps2|Equal2~5_combout\ & (\ps2|state.periodic_reset~q\ & \ps2|Equal2~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Equal2~9_combout\,
	datab => \ps2|Equal2~5_combout\,
	datac => \ps2|state.periodic_reset~q\,
	datad => \ps2|Equal2~4_combout\,
	combout => \ps2|state~41_combout\);

-- Location: LCCOMB_X8_Y45_N6
\ps2|Selector53~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector53~0_combout\ = (\ps2|Selector56~0_combout\) # ((\ps2|txd_data[1]~0_combout\) # ((\ps2|Equal2~4_combout\ & \ps2|Equal2~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Equal2~4_combout\,
	datab => \ps2|Equal2~10_combout\,
	datac => \ps2|Selector56~0_combout\,
	datad => \ps2|txd_data[1]~0_combout\,
	combout => \ps2|Selector53~0_combout\);

-- Location: LCCOMB_X8_Y45_N2
\ps2|Selector53~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector53~1_combout\ = (\ps2|state~41_combout\) # ((\ps2|txd_data\(3) & \ps2|Selector53~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state~41_combout\,
	datac => \ps2|txd_data\(3),
	datad => \ps2|Selector53~0_combout\,
	combout => \ps2|Selector53~1_combout\);

-- Location: FF_X8_Y45_N3
\ps2|txd_data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|Selector53~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|txd_data\(3));

-- Location: LCCOMB_X8_Y45_N16
\ps2|txd_data[4]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|txd_data[4]~2_combout\ = (\ps2|txd_data[1]~1_combout\ & (!\ps2|state.keyboard_wait_for_change~q\)) # (!\ps2|txd_data[1]~1_combout\ & ((\ps2|txd_data\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|state.keyboard_wait_for_change~q\,
	datac => \ps2|txd_data\(4),
	datad => \ps2|txd_data[1]~1_combout\,
	combout => \ps2|txd_data[4]~2_combout\);

-- Location: FF_X8_Y45_N17
\ps2|txd_data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|txd_data[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|txd_data\(4));

-- Location: LCCOMB_X8_Y45_N24
\ps2|ll|txd_parity~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|txd_parity~0_combout\ = \ps2|txd_data\(3) $ (\ps2|txd_data\(4) $ (\ps2|txd_data\(1) $ (!\ps2|txd_data\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001101001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|txd_data\(3),
	datab => \ps2|txd_data\(4),
	datac => \ps2|txd_data\(1),
	datad => \ps2|txd_data\(0),
	combout => \ps2|ll|txd_parity~0_combout\);

-- Location: LCCOMB_X7_Y45_N28
\ps2|ll|data[9]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|data[9]~feeder_combout\ = \ps2|ll|txd_parity~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ps2|ll|txd_parity~0_combout\,
	combout => \ps2|ll|data[9]~feeder_combout\);

-- Location: LCCOMB_X5_Y48_N2
\ps2|ll|Selector21~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector21~2_combout\ = (!\ps2|ll|state.interrupting~q\ & (((\ps2|ll|process_0~0_combout\ & !\ps2|ll|Equal3~3_combout\)) # (!\ps2|ll|state.receiving~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state.receiving~q\,
	datab => \ps2|ll|process_0~0_combout\,
	datac => \ps2|ll|state.interrupting~q\,
	datad => \ps2|ll|Equal3~3_combout\,
	combout => \ps2|ll|Selector21~2_combout\);

-- Location: LCCOMB_X4_Y48_N28
\ps2|ll|Selector21~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector21~3_combout\ = (\ps2|ll|data\(10) & ((!\ps2|ll|state.idle~0_combout\) # (!\ps2|ll|Selector21~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Selector21~2_combout\,
	datab => \ps2|ll|state.idle~0_combout\,
	datac => \ps2|ll|data\(10),
	combout => \ps2|ll|Selector21~3_combout\);

-- Location: LCCOMB_X6_Y48_N22
\ps2|ll|rxd_valid~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|rxd_valid~0_combout\ = (\ps2|ll|state.receiving~q\ & (\ps2|ll|process_0~0_combout\ & ((!\ps2|ll|Equal3~4_combout\) # (!\ps2|ll|Equal3~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Equal3~2_combout\,
	datab => \ps2|ll|Equal3~4_combout\,
	datac => \ps2|ll|state.receiving~q\,
	datad => \ps2|ll|process_0~0_combout\,
	combout => \ps2|ll|rxd_valid~0_combout\);

-- Location: LCCOMB_X4_Y48_N8
\ps2|ll|Selector21~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector21~4_combout\ = (\ps2|ll|Selector21~3_combout\) # (((!\ps2|ll|ps2_dat_1~q\ & \ps2|ll|rxd_valid~0_combout\)) # (!\ps2|ll|Selector21~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|ps2_dat_1~q\,
	datab => \ps2|ll|Selector21~3_combout\,
	datac => \ps2|ll|Selector21~1_combout\,
	datad => \ps2|ll|rxd_valid~0_combout\,
	combout => \ps2|ll|Selector21~4_combout\);

-- Location: FF_X4_Y48_N9
\ps2|ll|data[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|Selector21~4_combout\,
	ena => \ps2|ll|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|data\(10));

-- Location: FF_X7_Y45_N29
\ps2|ll|data[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|data[9]~feeder_combout\,
	asdata => \ps2|ll|data\(10),
	sload => \ps2|ll|state.idle~q\,
	ena => \ps2|ll|data[2]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|data\(9));

-- Location: LCCOMB_X7_Y45_N20
\ps2|ll|Selector23~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector23~0_combout\ = (\ps2|ll|data\(9)) # (!\ps2|ll|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ps2|ll|state.idle~q\,
	datad => \ps2|ll|data\(9),
	combout => \ps2|ll|Selector23~0_combout\);

-- Location: FF_X7_Y45_N21
\ps2|ll|data[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|Selector23~0_combout\,
	ena => \ps2|ll|data[2]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|data\(8));

-- Location: LCCOMB_X7_Y45_N14
\ps2|ll|Selector24~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector24~0_combout\ = (\ps2|ll|data\(8)) # (!\ps2|ll|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110111011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state.idle~q\,
	datab => \ps2|ll|data\(8),
	combout => \ps2|ll|Selector24~0_combout\);

-- Location: FF_X7_Y45_N15
\ps2|ll|data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|Selector24~0_combout\,
	ena => \ps2|ll|data[2]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|data\(7));

-- Location: LCCOMB_X7_Y45_N26
\ps2|ll|Selector25~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector25~0_combout\ = (\ps2|ll|data\(7)) # (!\ps2|ll|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state.idle~q\,
	datac => \ps2|ll|data\(7),
	combout => \ps2|ll|Selector25~0_combout\);

-- Location: FF_X7_Y45_N27
\ps2|ll|data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|Selector25~0_combout\,
	ena => \ps2|ll|data[2]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|data\(6));

-- Location: LCCOMB_X7_Y45_N22
\ps2|ll|Selector26~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector26~0_combout\ = (\ps2|ll|state.idle~q\ & (\ps2|ll|data\(6))) # (!\ps2|ll|state.idle~q\ & ((\ps2|txd_data\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state.idle~q\,
	datac => \ps2|ll|data\(6),
	datad => \ps2|txd_data\(4),
	combout => \ps2|ll|Selector26~0_combout\);

-- Location: FF_X7_Y45_N23
\ps2|ll|data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|Selector26~0_combout\,
	ena => \ps2|ll|data[2]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|data\(5));

-- Location: FF_X8_Y43_N11
\ps2|ll|rxd_data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \ps2|ll|data\(5),
	sload => VCC,
	ena => \ps2|ll|rxd_data[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|rxd_data\(3));

-- Location: LCCOMB_X9_Y45_N10
\ps2|Selector6~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector6~4_combout\ = (\ps2|ll|rxd_data\(3) & (\ps2|ll|rxd_valid~q\ & \ps2|state.wait_for_first_mouse_byte~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|rxd_data\(3),
	datac => \ps2|ll|rxd_valid~q\,
	datad => \ps2|state.wait_for_first_mouse_byte~q\,
	combout => \ps2|Selector6~4_combout\);

-- Location: LCCOMB_X8_Y46_N16
\ps2|time_out_counter[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[1]~1_combout\ = (!\ps2|Selector6~4_combout\ & ((\ps2|state.wait_for_first_mouse_byte~q\) # ((!\ps2|state.wait_for_bat~q\) # (!\ps2|process_0~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Selector6~4_combout\,
	datab => \ps2|state.wait_for_first_mouse_byte~q\,
	datac => \ps2|process_0~3_combout\,
	datad => \ps2|state.wait_for_bat~q\,
	combout => \ps2|time_out_counter[1]~1_combout\);

-- Location: LCCOMB_X8_Y46_N26
\ps2|time_out_counter[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[1]~0_combout\ = (!\ps2|Selector10~0_combout\ & (\ps2|state.restart~q\ & ((!\ps2|process_0~2_combout\) # (!\ps2|state.wait_for_reset_acknowledge~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.wait_for_reset_acknowledge~q\,
	datab => \ps2|Selector10~0_combout\,
	datac => \ps2|process_0~2_combout\,
	datad => \ps2|state.restart~q\,
	combout => \ps2|time_out_counter[1]~0_combout\);

-- Location: LCCOMB_X8_Y46_N14
\ps2|time_out_counter[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[1]~2_combout\ = (!\ps2|state.wait_for_reset_acknowledge~q\ & ((\ps2|state.wait_for_mouse_bat~q\ & (\ps2|process_0~6_combout\)) # (!\ps2|state.wait_for_mouse_bat~q\ & ((\ps2|ll|txd_accepted~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.wait_for_mouse_bat~q\,
	datab => \ps2|process_0~6_combout\,
	datac => \ps2|state.wait_for_reset_acknowledge~q\,
	datad => \ps2|ll|txd_accepted~q\,
	combout => \ps2|time_out_counter[1]~2_combout\);

-- Location: LCCOMB_X9_Y46_N24
\ps2|time_out_counter[1]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[1]~3_combout\ = (\ps2|time_out_counter[1]~2_combout\) # ((\ps2|process_0~2_combout\ & \ps2|state.wait_for_reset_acknowledge~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|process_0~2_combout\,
	datac => \ps2|state.wait_for_reset_acknowledge~q\,
	datad => \ps2|time_out_counter[1]~2_combout\,
	combout => \ps2|time_out_counter[1]~3_combout\);

-- Location: LCCOMB_X8_Y46_N28
\ps2|time_out_counter[1]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[1]~5_combout\ = (\ps2|time_out_counter[1]~1_combout\ & (\ps2|time_out_counter[1]~0_combout\ & ((!\ps2|time_out_counter[1]~3_combout\) # (!\ps2|time_out_counter[1]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[1]~4_combout\,
	datab => \ps2|time_out_counter[1]~1_combout\,
	datac => \ps2|time_out_counter[1]~0_combout\,
	datad => \ps2|time_out_counter[1]~3_combout\,
	combout => \ps2|time_out_counter[1]~5_combout\);

-- Location: LCCOMB_X9_Y47_N12
\ps2|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~40_combout\ = (\ps2|time_out_counter\(20) & (\ps2|Add0~39\ $ (GND))) # (!\ps2|time_out_counter\(20) & ((GND) # (!\ps2|Add0~39\)))
-- \ps2|Add0~41\ = CARRY((!\ps2|Add0~39\) # (!\ps2|time_out_counter\(20)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|time_out_counter\(20),
	datad => VCC,
	cin => \ps2|Add0~39\,
	combout => \ps2|Add0~40_combout\,
	cout => \ps2|Add0~41\);

-- Location: LCCOMB_X8_Y47_N26
\ps2|time_out_counter[20]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[20]~29_combout\ = (\ps2|time_out_counter[1]~8_combout\) # (((\ps2|time_out_counter[1]~5_combout\ & !\ps2|Add0~40_combout\)) # (!\ps2|Selector42~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[1]~8_combout\,
	datab => \ps2|time_out_counter[1]~5_combout\,
	datac => \ps2|Selector42~0_combout\,
	datad => \ps2|Add0~40_combout\,
	combout => \ps2|time_out_counter[20]~29_combout\);

-- Location: FF_X8_Y47_N27
\ps2|time_out_counter[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|time_out_counter[20]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|time_out_counter\(20));

-- Location: LCCOMB_X9_Y47_N14
\ps2|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~42_combout\ = (\ps2|time_out_counter\(21) & (!\ps2|Add0~41\)) # (!\ps2|time_out_counter\(21) & (\ps2|Add0~41\ & VCC))
-- \ps2|Add0~43\ = CARRY((\ps2|time_out_counter\(21) & !\ps2|Add0~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|time_out_counter\(21),
	datad => VCC,
	cin => \ps2|Add0~41\,
	combout => \ps2|Add0~42_combout\,
	cout => \ps2|Add0~43\);

-- Location: LCCOMB_X8_Y47_N24
\ps2|time_out_counter[21]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[21]~30_combout\ = (\ps2|time_out_counter[1]~8_combout\) # (((\ps2|time_out_counter[1]~5_combout\ & !\ps2|Add0~42_combout\)) # (!\ps2|Selector42~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[1]~8_combout\,
	datab => \ps2|time_out_counter[1]~5_combout\,
	datac => \ps2|Selector42~0_combout\,
	datad => \ps2|Add0~42_combout\,
	combout => \ps2|time_out_counter[21]~30_combout\);

-- Location: FF_X8_Y47_N25
\ps2|time_out_counter[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|time_out_counter[21]~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|time_out_counter\(21));

-- Location: LCCOMB_X9_Y47_N16
\ps2|Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~44_combout\ = (\ps2|time_out_counter\(22) & (\ps2|Add0~43\ $ (GND))) # (!\ps2|time_out_counter\(22) & ((GND) # (!\ps2|Add0~43\)))
-- \ps2|Add0~45\ = CARRY((!\ps2|Add0~43\) # (!\ps2|time_out_counter\(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|time_out_counter\(22),
	datad => VCC,
	cin => \ps2|Add0~43\,
	combout => \ps2|Add0~44_combout\,
	cout => \ps2|Add0~45\);

-- Location: LCCOMB_X8_Y47_N22
\ps2|time_out_counter[22]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[22]~31_combout\ = (\ps2|time_out_counter[1]~8_combout\) # ((\ps2|time_out_counter[1]~5_combout\ & !\ps2|Add0~44_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|time_out_counter[1]~5_combout\,
	datac => \ps2|time_out_counter[1]~8_combout\,
	datad => \ps2|Add0~44_combout\,
	combout => \ps2|time_out_counter[22]~31_combout\);

-- Location: FF_X8_Y47_N23
\ps2|time_out_counter[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|time_out_counter[22]~31_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|time_out_counter\(22));

-- Location: LCCOMB_X9_Y47_N18
\ps2|Add0~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~46_combout\ = (\ps2|time_out_counter\(23) & (!\ps2|Add0~45\)) # (!\ps2|time_out_counter\(23) & (\ps2|Add0~45\ & VCC))
-- \ps2|Add0~47\ = CARRY((\ps2|time_out_counter\(23) & !\ps2|Add0~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|time_out_counter\(23),
	datad => VCC,
	cin => \ps2|Add0~45\,
	combout => \ps2|Add0~46_combout\,
	cout => \ps2|Add0~47\);

-- Location: LCCOMB_X8_Y47_N20
\ps2|time_out_counter[23]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[23]~32_combout\ = (\ps2|time_out_counter[1]~8_combout\) # (((\ps2|time_out_counter[1]~5_combout\ & !\ps2|Add0~46_combout\)) # (!\ps2|Selector42~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[1]~8_combout\,
	datab => \ps2|Selector42~0_combout\,
	datac => \ps2|time_out_counter[1]~5_combout\,
	datad => \ps2|Add0~46_combout\,
	combout => \ps2|time_out_counter[23]~32_combout\);

-- Location: FF_X8_Y47_N21
\ps2|time_out_counter[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|time_out_counter[23]~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|time_out_counter\(23));

-- Location: LCCOMB_X8_Y47_N30
\ps2|Equal2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Equal2~6_combout\ = (\ps2|time_out_counter\(20) & (\ps2|time_out_counter\(23) & (\ps2|time_out_counter\(22) & \ps2|time_out_counter\(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter\(20),
	datab => \ps2|time_out_counter\(23),
	datac => \ps2|time_out_counter\(22),
	datad => \ps2|time_out_counter\(21),
	combout => \ps2|Equal2~6_combout\);

-- Location: LCCOMB_X8_Y46_N20
\ps2|Equal2~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Equal2~10_combout\ = (\ps2|Equal2~7_combout\ & (\ps2|Equal2~6_combout\ & \ps2|Equal2~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|Equal2~7_combout\,
	datac => \ps2|Equal2~6_combout\,
	datad => \ps2|Equal2~5_combout\,
	combout => \ps2|Equal2~10_combout\);

-- Location: LCCOMB_X8_Y46_N30
\ps2|Selector6~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector6~14_combout\ = (\ps2|state.wait_for_bat~q\ & ((\ps2|process_0~3_combout\) # ((\ps2|Equal2~10_combout\ & \ps2|Equal2~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Equal2~10_combout\,
	datab => \ps2|state.wait_for_bat~q\,
	datac => \ps2|process_0~3_combout\,
	datad => \ps2|Equal2~4_combout\,
	combout => \ps2|Selector6~14_combout\);

-- Location: LCCOMB_X8_Y45_N30
\ps2|state~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~56_combout\ = (\ps2|Selector6~14_combout\ & ((\ps2|state~51_combout\) # ((\ps2|state~52_combout\ & \ps2|state.wait_for_mouse_bat~q\)))) # (!\ps2|Selector6~14_combout\ & (\ps2|state~52_combout\ & (\ps2|state.wait_for_mouse_bat~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Selector6~14_combout\,
	datab => \ps2|state~52_combout\,
	datac => \ps2|state.wait_for_mouse_bat~q\,
	datad => \ps2|state~51_combout\,
	combout => \ps2|state~56_combout\);

-- Location: FF_X8_Y45_N31
\ps2|state.wait_for_mouse_bat\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|state~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|state.wait_for_mouse_bat~q\);

-- Location: LCCOMB_X8_Y46_N10
\ps2|time_out_counter[1]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[1]~4_combout\ = (\ps2|Equal2~10_combout\ & ((\ps2|Equal2~4_combout\ & ((\ps2|state.periodic_reset~q\))) # (!\ps2|Equal2~4_combout\ & (\ps2|state.wait_for_mouse_bat~q\)))) # (!\ps2|Equal2~10_combout\ & 
-- (\ps2|state.wait_for_mouse_bat~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.wait_for_mouse_bat~q\,
	datab => \ps2|Equal2~10_combout\,
	datac => \ps2|state.periodic_reset~q\,
	datad => \ps2|Equal2~4_combout\,
	combout => \ps2|time_out_counter[1]~4_combout\);

-- Location: LCCOMB_X8_Y46_N4
\ps2|Selector42~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector42~0_combout\ = (\ps2|time_out_counter[1]~1_combout\) # (((\ps2|time_out_counter[1]~4_combout\ & \ps2|time_out_counter[1]~3_combout\)) # (!\ps2|time_out_counter[1]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[1]~4_combout\,
	datab => \ps2|time_out_counter[1]~1_combout\,
	datac => \ps2|time_out_counter[1]~0_combout\,
	datad => \ps2|time_out_counter[1]~3_combout\,
	combout => \ps2|Selector42~0_combout\);

-- Location: LCCOMB_X9_Y47_N20
\ps2|Add0~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~48_combout\ = (\ps2|time_out_counter\(24) & ((GND) # (!\ps2|Add0~47\))) # (!\ps2|time_out_counter\(24) & (\ps2|Add0~47\ $ (GND)))
-- \ps2|Add0~49\ = CARRY((\ps2|time_out_counter\(24)) # (!\ps2|Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|time_out_counter\(24),
	datad => VCC,
	cin => \ps2|Add0~47\,
	combout => \ps2|Add0~48_combout\,
	cout => \ps2|Add0~49\);

-- Location: LCCOMB_X8_Y47_N18
\ps2|time_out_counter[24]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[24]~34_combout\ = (!\ps2|time_out_counter[1]~8_combout\ & (\ps2|time_out_counter[1]~5_combout\ & \ps2|Add0~48_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[1]~8_combout\,
	datab => \ps2|time_out_counter[1]~5_combout\,
	datac => \ps2|Add0~48_combout\,
	combout => \ps2|time_out_counter[24]~34_combout\);

-- Location: FF_X8_Y47_N19
\ps2|time_out_counter[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|time_out_counter[24]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|time_out_counter\(24));

-- Location: LCCOMB_X9_Y47_N22
\ps2|Add0~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~50_combout\ = (\ps2|time_out_counter\(25) & (!\ps2|Add0~49\)) # (!\ps2|time_out_counter\(25) & (\ps2|Add0~49\ & VCC))
-- \ps2|Add0~51\ = CARRY((\ps2|time_out_counter\(25) & !\ps2|Add0~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter\(25),
	datad => VCC,
	cin => \ps2|Add0~49\,
	combout => \ps2|Add0~50_combout\,
	cout => \ps2|Add0~51\);

-- Location: LCCOMB_X8_Y47_N12
\ps2|time_out_counter[25]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[25]~33_combout\ = (\ps2|time_out_counter[1]~8_combout\) # (((\ps2|time_out_counter[1]~5_combout\ & !\ps2|Add0~50_combout\)) # (!\ps2|Selector42~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[1]~8_combout\,
	datab => \ps2|Selector42~0_combout\,
	datac => \ps2|time_out_counter[1]~5_combout\,
	datad => \ps2|Add0~50_combout\,
	combout => \ps2|time_out_counter[25]~33_combout\);

-- Location: FF_X8_Y47_N13
\ps2|time_out_counter[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|time_out_counter[25]~33_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|time_out_counter\(25));

-- Location: LCCOMB_X9_Y47_N24
\ps2|Add0~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~52_combout\ = (\ps2|time_out_counter\(26) & ((GND) # (!\ps2|Add0~51\))) # (!\ps2|time_out_counter\(26) & (\ps2|Add0~51\ $ (GND)))
-- \ps2|Add0~53\ = CARRY((\ps2|time_out_counter\(26)) # (!\ps2|Add0~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter\(26),
	datad => VCC,
	cin => \ps2|Add0~51\,
	combout => \ps2|Add0~52_combout\,
	cout => \ps2|Add0~53\);

-- Location: LCCOMB_X9_Y47_N30
\ps2|time_out_counter[26]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[26]~35_combout\ = (\ps2|time_out_counter[1]~5_combout\ & (!\ps2|time_out_counter[1]~8_combout\ & \ps2|Add0~52_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|time_out_counter[1]~5_combout\,
	datac => \ps2|time_out_counter[1]~8_combout\,
	datad => \ps2|Add0~52_combout\,
	combout => \ps2|time_out_counter[26]~35_combout\);

-- Location: FF_X9_Y47_N31
\ps2|time_out_counter[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|time_out_counter[26]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|time_out_counter\(26));

-- Location: LCCOMB_X9_Y47_N26
\ps2|Add0~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~54_combout\ = \ps2|time_out_counter\(27) $ (!\ps2|Add0~53\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|time_out_counter\(27),
	cin => \ps2|Add0~53\,
	combout => \ps2|Add0~54_combout\);

-- Location: LCCOMB_X8_Y47_N4
\ps2|time_out_counter[27]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[27]~36_combout\ = (\ps2|time_out_counter[1]~5_combout\ & (!\ps2|time_out_counter[1]~8_combout\ & \ps2|Add0~54_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|time_out_counter[1]~5_combout\,
	datac => \ps2|time_out_counter[1]~8_combout\,
	datad => \ps2|Add0~54_combout\,
	combout => \ps2|time_out_counter[27]~36_combout\);

-- Location: FF_X8_Y47_N5
\ps2|time_out_counter[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|time_out_counter[27]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|time_out_counter\(27));

-- Location: LCCOMB_X8_Y47_N14
\ps2|Equal2~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Equal2~7_combout\ = (\ps2|time_out_counter\(25) & (!\ps2|time_out_counter\(27) & (!\ps2|time_out_counter\(26) & !\ps2|time_out_counter\(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter\(25),
	datab => \ps2|time_out_counter\(27),
	datac => \ps2|time_out_counter\(26),
	datad => \ps2|time_out_counter\(24),
	combout => \ps2|Equal2~7_combout\);

-- Location: LCCOMB_X8_Y46_N8
\ps2|Equal2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Equal2~8_combout\ = (\ps2|Equal2~7_combout\ & (\ps2|Equal2~5_combout\ & (\ps2|Equal2~6_combout\ & \ps2|Equal2~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Equal2~7_combout\,
	datab => \ps2|Equal2~5_combout\,
	datac => \ps2|Equal2~6_combout\,
	datad => \ps2|Equal2~4_combout\,
	combout => \ps2|Equal2~8_combout\);

-- Location: LCCOMB_X9_Y45_N12
\ps2|time_out_counter[1]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[1]~6_combout\ = (\ps2|state.keyboard_wait_for_change~q\) # ((\ps2|state.wait_for_first_mouse_byte~q\ & ((!\ps2|ll|rxd_valid~q\) # (!\ps2|ll|rxd_data\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.keyboard_wait_for_change~q\,
	datab => \ps2|ll|rxd_data\(3),
	datac => \ps2|ll|rxd_valid~q\,
	datad => \ps2|state.wait_for_first_mouse_byte~q\,
	combout => \ps2|time_out_counter[1]~6_combout\);

-- Location: LCCOMB_X8_Y46_N0
\ps2|time_out_counter[1]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[1]~7_combout\ = (\ps2|Selector6~5_combout\) # ((\ps2|time_out_counter[1]~6_combout\) # ((\ps2|state.wait_for_reset_acknowledge~q\) # (\ps2|state.wait_for_bat~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Selector6~5_combout\,
	datab => \ps2|time_out_counter[1]~6_combout\,
	datac => \ps2|state.wait_for_reset_acknowledge~q\,
	datad => \ps2|state.wait_for_bat~q\,
	combout => \ps2|time_out_counter[1]~7_combout\);

-- Location: LCCOMB_X8_Y46_N18
\ps2|time_out_counter[1]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[1]~8_combout\ = (\ps2|Equal2~8_combout\ & ((\ps2|time_out_counter[1]~7_combout\) # ((\ps2|state.periodic_reset~q\ & !\ps2|time_out_counter[1]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Equal2~8_combout\,
	datab => \ps2|time_out_counter[1]~7_combout\,
	datac => \ps2|state.periodic_reset~q\,
	datad => \ps2|time_out_counter[1]~3_combout\,
	combout => \ps2|time_out_counter[1]~8_combout\);

-- Location: LCCOMB_X8_Y48_N6
\ps2|time_out_counter[5]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[5]~15_combout\ = (!\ps2|time_out_counter[1]~8_combout\ & (\ps2|Add0~10_combout\ & \ps2|time_out_counter[1]~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|time_out_counter[1]~8_combout\,
	datac => \ps2|Add0~10_combout\,
	datad => \ps2|time_out_counter[1]~5_combout\,
	combout => \ps2|time_out_counter[5]~15_combout\);

-- Location: FF_X8_Y48_N7
\ps2|time_out_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|time_out_counter[5]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|time_out_counter\(5));

-- Location: LCCOMB_X8_Y48_N10
\ps2|Equal2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Equal2~1_combout\ = (!\ps2|time_out_counter\(5) & (\ps2|time_out_counter\(7) & (!\ps2|time_out_counter\(6) & !\ps2|time_out_counter\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter\(5),
	datab => \ps2|time_out_counter\(7),
	datac => \ps2|time_out_counter\(6),
	datad => \ps2|time_out_counter\(4),
	combout => \ps2|Equal2~1_combout\);

-- Location: LCCOMB_X8_Y47_N0
\ps2|Equal2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Equal2~3_combout\ = (\ps2|time_out_counter\(15) & (\ps2|time_out_counter\(14) & (\ps2|time_out_counter\(12) & \ps2|time_out_counter\(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter\(15),
	datab => \ps2|time_out_counter\(14),
	datac => \ps2|time_out_counter\(12),
	datad => \ps2|time_out_counter\(13),
	combout => \ps2|Equal2~3_combout\);

-- Location: LCCOMB_X8_Y48_N8
\ps2|Equal2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Equal2~2_combout\ = (!\ps2|time_out_counter\(10) & (!\ps2|time_out_counter\(9) & (!\ps2|time_out_counter\(11) & !\ps2|time_out_counter\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter\(10),
	datab => \ps2|time_out_counter\(9),
	datac => \ps2|time_out_counter\(11),
	datad => \ps2|time_out_counter\(8),
	combout => \ps2|Equal2~2_combout\);

-- Location: LCCOMB_X9_Y48_N2
\ps2|Equal2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Equal2~0_combout\ = (!\ps2|time_out_counter\(1) & (!\ps2|time_out_counter\(3) & (!\ps2|time_out_counter\(0) & !\ps2|time_out_counter\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter\(1),
	datab => \ps2|time_out_counter\(3),
	datac => \ps2|time_out_counter\(0),
	datad => \ps2|time_out_counter\(2),
	combout => \ps2|Equal2~0_combout\);

-- Location: LCCOMB_X8_Y48_N26
\ps2|Equal2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Equal2~4_combout\ = (\ps2|Equal2~1_combout\ & (\ps2|Equal2~3_combout\ & (\ps2|Equal2~2_combout\ & \ps2|Equal2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Equal2~1_combout\,
	datab => \ps2|Equal2~3_combout\,
	datac => \ps2|Equal2~2_combout\,
	datad => \ps2|Equal2~0_combout\,
	combout => \ps2|Equal2~4_combout\);

-- Location: LCCOMB_X8_Y45_N0
\ps2|txd_data[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|txd_data[1]~1_combout\ = (\ps2|Equal2~4_combout\ & ((\ps2|Equal2~10_combout\ & ((\ps2|state.periodic_reset~q\))) # (!\ps2|Equal2~10_combout\ & (!\ps2|txd_data[1]~0_combout\)))) # (!\ps2|Equal2~4_combout\ & (((!\ps2|txd_data[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111100000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Equal2~4_combout\,
	datab => \ps2|Equal2~10_combout\,
	datac => \ps2|txd_data[1]~0_combout\,
	datad => \ps2|state.periodic_reset~q\,
	combout => \ps2|txd_data[1]~1_combout\);

-- Location: FF_X8_Y45_N1
\ps2|txd_request\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|txd_data[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|txd_request~q\);

-- Location: LCCOMB_X5_Y47_N16
\ps2|ll|process_0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|process_0~7_combout\ = (\ps2|ll|idle_counter\(8) & (\ps2|ll|Equal2~0_combout\ & (\ps2|txd_request~q\ & \ps2|ll|Equal2~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|idle_counter\(8),
	datab => \ps2|ll|Equal2~0_combout\,
	datac => \ps2|txd_request~q\,
	datad => \ps2|ll|Equal2~1_combout\,
	combout => \ps2|ll|process_0~7_combout\);

-- Location: LCCOMB_X5_Y48_N6
\ps2|ll|state~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~16_combout\ = (\ps2|ll|state.finishing~q\ & (((!\ps2|ll|process_0~0_combout\ & \ps2|ll|state.waiting_for_acknowledge~q\)) # (!\ps2|ll|state.receiving~q\))) # (!\ps2|ll|state.finishing~q\ & (!\ps2|ll|process_0~0_combout\ & 
-- (\ps2|ll|state.waiting_for_acknowledge~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state.finishing~q\,
	datab => \ps2|ll|process_0~0_combout\,
	datac => \ps2|ll|state.waiting_for_acknowledge~q\,
	datad => \ps2|ll|state.receiving~q\,
	combout => \ps2|ll|state~16_combout\);

-- Location: LCCOMB_X5_Y51_N0
\ps2|ll|state~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~32_combout\ = (\ps2|ll|state.interrupting~q\) # ((\ps2|ll|state.sending~q\ & \ps2|ll|Equal6~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state.sending~q\,
	datac => \ps2|ll|state.interrupting~q\,
	datad => \ps2|ll|Equal6~0_combout\,
	combout => \ps2|ll|state~32_combout\);

-- Location: LCCOMB_X4_Y48_N16
\ps2|ll|state~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~33_combout\ = (\ps2|ll|state~32_combout\) # ((\ps2|ll|state~16_combout\ & ((\ps2|ll|ps2_dat_0~q\) # (!\ps2|ll|state.finishing~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state~16_combout\,
	datab => \ps2|ll|state~32_combout\,
	datac => \ps2|ll|ps2_dat_0~q\,
	datad => \ps2|ll|state.finishing~q\,
	combout => \ps2|ll|state~33_combout\);

-- Location: LCCOMB_X5_Y48_N20
\ps2|ll|state~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~17_combout\ = (!\ps2|ll|Equal3~3_combout\ & ((\ps2|ll|state~33_combout\) # ((!\ps2|ll|rxd_data[1]~0_combout\ & \ps2|ll|state.receiving~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|rxd_data[1]~0_combout\,
	datab => \ps2|ll|Equal3~3_combout\,
	datac => \ps2|ll|state~33_combout\,
	datad => \ps2|ll|state.receiving~q\,
	combout => \ps2|ll|state~17_combout\);

-- Location: LCCOMB_X6_Y48_N2
\ps2|ll|state~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~18_combout\ = (\ps2|ll|state~17_combout\) # (((!\ps2|ll|process_0~7_combout\ & \ps2|ll|time_out_counter[0]~6_combout\)) # (!\ps2|ll|Equal1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|process_0~7_combout\,
	datab => \ps2|ll|state~17_combout\,
	datac => \ps2|ll|time_out_counter[0]~6_combout\,
	datad => \ps2|ll|Equal1~0_combout\,
	combout => \ps2|ll|state~18_combout\);

-- Location: LCCOMB_X5_Y48_N30
\ps2|ll|state~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~21_combout\ = (\ps2|ll|state.idle~2_combout\ & ((\ps2|ll|state~18_combout\ & ((\ps2|ll|state.sending~q\))) # (!\ps2|ll|state~18_combout\ & (\ps2|ll|state.interrupting~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state~18_combout\,
	datab => \ps2|ll|state.interrupting~q\,
	datac => \ps2|ll|state.sending~q\,
	datad => \ps2|ll|state.idle~2_combout\,
	combout => \ps2|ll|state~21_combout\);

-- Location: FF_X5_Y48_N31
\ps2|ll|state.sending\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|state~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|state.sending~q\);

-- Location: LCCOMB_X6_Y48_N6
\ps2|ll|data[7]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|data[7]~0_combout\ = (!\ps2|ll|state.sending~q\ & (((\ps2|ll|Equal3~2_combout\ & \ps2|ll|Equal3~4_combout\)) # (!\ps2|ll|process_0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Equal3~2_combout\,
	datab => \ps2|ll|Equal3~4_combout\,
	datac => \ps2|ll|state.sending~q\,
	datad => \ps2|ll|process_0~0_combout\,
	combout => \ps2|ll|data[7]~0_combout\);

-- Location: LCCOMB_X5_Y51_N22
\ps2|ll|data[7]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|data[7]~1_combout\ = (\ps2|ll|state.sending~q\ & (((!\ps2|ll|time_out_counter\(6)) # (!\ps2|ll|process_0~8_combout\)) # (!\ps2|ll|Equal3~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state.sending~q\,
	datab => \ps2|ll|Equal3~4_combout\,
	datac => \ps2|ll|process_0~8_combout\,
	datad => \ps2|ll|time_out_counter\(6),
	combout => \ps2|ll|data[7]~1_combout\);

-- Location: LCCOMB_X5_Y48_N16
\ps2|ll|data[7]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|data[7]~2_combout\ = (\ps2|ll|data[7]~0_combout\) # ((\ps2|ll|data[7]~1_combout\) # (!\ps2|ll|state.receiving~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|data[7]~0_combout\,
	datac => \ps2|ll|data[7]~1_combout\,
	datad => \ps2|ll|state.receiving~q\,
	combout => \ps2|ll|data[7]~2_combout\);

-- Location: LCCOMB_X6_Y47_N22
\ps2|ll|n_bits[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|n_bits[0]~3_combout\ = (!\ps2|ll|state.idle~q\ & ((\ps2|ll|process_0~7_combout\) # ((\ps2|ll|ps2_dat_0~q\ & !\ps2|ll|ps2_clk_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|process_0~7_combout\,
	datab => \ps2|ll|ps2_dat_0~q\,
	datac => \ps2|ll|state.idle~q\,
	datad => \ps2|ll|ps2_clk_0~q\,
	combout => \ps2|ll|n_bits[0]~3_combout\);

-- Location: LCCOMB_X5_Y47_N8
\ps2|ll|n_bits[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|n_bits[0]~2_combout\ = (\ps2|ll|Equal1~0_combout\ & (((\ps2|ll|n_bits[0]~3_combout\) # (\ps2|ll|Selector21~0_combout\)) # (!\ps2|ll|data[7]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|data[7]~2_combout\,
	datab => \ps2|ll|n_bits[0]~3_combout\,
	datac => \ps2|ll|Selector21~0_combout\,
	datad => \ps2|ll|Equal1~0_combout\,
	combout => \ps2|ll|n_bits[0]~2_combout\);

-- Location: FF_X5_Y47_N15
\ps2|ll|n_bits[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|Selector9~0_combout\,
	ena => \ps2|ll|n_bits[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|n_bits\(0));

-- Location: LCCOMB_X5_Y47_N4
\ps2|ll|Add3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add3~0_combout\ = \ps2|ll|n_bits\(1) $ (\ps2|ll|n_bits\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ps2|ll|n_bits\(1),
	datad => \ps2|ll|n_bits\(0),
	combout => \ps2|ll|Add3~0_combout\);

-- Location: FF_X5_Y47_N5
\ps2|ll|n_bits[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|Add3~0_combout\,
	sclr => \ps2|ll|ALT_INV_state.idle~q\,
	ena => \ps2|ll|n_bits[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|n_bits\(1));

-- Location: LCCOMB_X5_Y47_N24
\ps2|ll|Add3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add3~2_combout\ = \ps2|ll|n_bits\(2) $ (((\ps2|ll|n_bits\(1) & \ps2|ll|n_bits\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|n_bits\(1),
	datac => \ps2|ll|n_bits\(2),
	datad => \ps2|ll|n_bits\(0),
	combout => \ps2|ll|Add3~2_combout\);

-- Location: FF_X5_Y47_N25
\ps2|ll|n_bits[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|Add3~2_combout\,
	sclr => \ps2|ll|ALT_INV_state.idle~q\,
	ena => \ps2|ll|n_bits[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|n_bits\(2));

-- Location: LCCOMB_X5_Y47_N2
\ps2|ll|Add3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add3~1_combout\ = \ps2|ll|n_bits\(3) $ (((\ps2|ll|n_bits\(1) & (\ps2|ll|n_bits\(2) & \ps2|ll|n_bits\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|n_bits\(1),
	datab => \ps2|ll|n_bits\(2),
	datac => \ps2|ll|n_bits\(3),
	datad => \ps2|ll|n_bits\(0),
	combout => \ps2|ll|Add3~1_combout\);

-- Location: FF_X5_Y47_N3
\ps2|ll|n_bits[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|Add3~1_combout\,
	sclr => \ps2|ll|ALT_INV_state.idle~q\,
	ena => \ps2|ll|n_bits[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|n_bits\(3));

-- Location: LCCOMB_X5_Y47_N30
\ps2|ll|Equal6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Equal6~0_combout\ = (((\ps2|ll|n_bits\(2)) # (!\ps2|ll|n_bits\(1))) # (!\ps2|ll|n_bits\(3))) # (!\ps2|ll|n_bits\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|n_bits\(0),
	datab => \ps2|ll|n_bits\(3),
	datac => \ps2|ll|n_bits\(1),
	datad => \ps2|ll|n_bits\(2),
	combout => \ps2|ll|Equal6~0_combout\);

-- Location: LCCOMB_X6_Y47_N16
\ps2|ll|time_out_counter[0]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[0]~7_combout\ = (\ps2|ll|ps2_clk_1~q\ & ((\ps2|ll|ps2_clk_0~q\) # (\ps2|ll|state.receiving~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|ps2_clk_0~q\,
	datab => \ps2|ll|ps2_clk_1~q\,
	datac => \ps2|ll|state.receiving~q\,
	combout => \ps2|ll|time_out_counter[0]~7_combout\);

-- Location: LCCOMB_X6_Y47_N26
\ps2|ll|time_out_counter[0]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[0]~8_combout\ = (\ps2|ll|ps2_clk_0~q\ & (\ps2|ll|Equal6~0_combout\ & (\ps2|ll|state.sending~q\ & !\ps2|ll|time_out_counter[0]~7_combout\))) # (!\ps2|ll|ps2_clk_0~q\ & (((!\ps2|ll|state.sending~q\ & 
-- \ps2|ll|time_out_counter[0]~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|ps2_clk_0~q\,
	datab => \ps2|ll|Equal6~0_combout\,
	datac => \ps2|ll|state.sending~q\,
	datad => \ps2|ll|time_out_counter[0]~7_combout\,
	combout => \ps2|ll|time_out_counter[0]~8_combout\);

-- Location: LCCOMB_X6_Y47_N12
\ps2|ll|time_out_counter[0]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[0]~9_combout\ = (\ps2|ll|state.idle~q\ & (!\ps2|ll|time_out_counter[0]~8_combout\)) # (!\ps2|ll|state.idle~q\ & (((!\ps2|ll|process_0~7_combout\ & !\ps2|ll|process_0~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter[0]~8_combout\,
	datab => \ps2|ll|state.idle~q\,
	datac => \ps2|ll|process_0~7_combout\,
	datad => \ps2|ll|process_0~6_combout\,
	combout => \ps2|ll|time_out_counter[0]~9_combout\);

-- Location: LCCOMB_X5_Y51_N24
\ps2|ll|time_out_counter[0]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[0]~10_combout\ = (\ps2|ll|time_out_counter[0]~9_combout\ & ((!\ps2|ll|state.interrupting~q\) # (!\ps2|ll|Equal3~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Equal3~3_combout\,
	datab => \ps2|ll|time_out_counter[0]~9_combout\,
	datac => \ps2|ll|state.interrupting~q\,
	combout => \ps2|ll|time_out_counter[0]~10_combout\);

-- Location: LCCOMB_X4_Y51_N14
\ps2|ll|Add2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add2~8_combout\ = (\ps2|ll|time_out_counter\(4) & ((GND) # (!\ps2|ll|Add2~7\))) # (!\ps2|ll|time_out_counter\(4) & (\ps2|ll|Add2~7\ $ (GND)))
-- \ps2|ll|Add2~9\ = CARRY((\ps2|ll|time_out_counter\(4)) # (!\ps2|ll|Add2~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|time_out_counter\(4),
	datad => VCC,
	cin => \ps2|ll|Add2~7\,
	combout => \ps2|ll|Add2~8_combout\,
	cout => \ps2|ll|Add2~9\);

-- Location: LCCOMB_X3_Y51_N4
\ps2|ll|Selector16~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector16~0_combout\ = (\ps2|ll|time_out_counter[0]~14_combout\) # ((\ps2|ll|time_out_counter[0]~9_combout\ & ((\ps2|ll|Add2~8_combout\))) # (!\ps2|ll|time_out_counter[0]~9_combout\ & (!\ps2|ll|time_out_counter[0]~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter[0]~9_combout\,
	datab => \ps2|ll|time_out_counter[0]~5_combout\,
	datac => \ps2|ll|Add2~8_combout\,
	datad => \ps2|ll|time_out_counter[0]~14_combout\,
	combout => \ps2|ll|Selector16~0_combout\);

-- Location: FF_X3_Y51_N5
\ps2|ll|time_out_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|Selector16~0_combout\,
	ena => \ps2|ll|time_out_counter[0]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|time_out_counter\(4));

-- Location: LCCOMB_X4_Y51_N16
\ps2|ll|Add2~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add2~10_combout\ = (\ps2|ll|time_out_counter\(5) & (\ps2|ll|Add2~9\ & VCC)) # (!\ps2|ll|time_out_counter\(5) & (!\ps2|ll|Add2~9\))
-- \ps2|ll|Add2~11\ = CARRY((!\ps2|ll|time_out_counter\(5) & !\ps2|ll|Add2~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter\(5),
	datad => VCC,
	cin => \ps2|ll|Add2~9\,
	combout => \ps2|ll|Add2~10_combout\,
	cout => \ps2|ll|Add2~11\);

-- Location: LCCOMB_X3_Y51_N16
\ps2|ll|time_out_counter[5]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[5]~13_combout\ = (\ps2|ll|time_out_counter[0]~12_combout\ & (\ps2|ll|time_out_counter[0]~10_combout\ & ((\ps2|ll|Add2~10_combout\)))) # (!\ps2|ll|time_out_counter[0]~12_combout\ & (((\ps2|ll|time_out_counter\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter[0]~10_combout\,
	datab => \ps2|ll|time_out_counter[0]~12_combout\,
	datac => \ps2|ll|time_out_counter\(5),
	datad => \ps2|ll|Add2~10_combout\,
	combout => \ps2|ll|time_out_counter[5]~13_combout\);

-- Location: FF_X3_Y51_N17
\ps2|ll|time_out_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|time_out_counter[5]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|time_out_counter\(5));

-- Location: LCCOMB_X4_Y51_N18
\ps2|ll|Add2~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add2~12_combout\ = (\ps2|ll|time_out_counter\(6) & ((GND) # (!\ps2|ll|Add2~11\))) # (!\ps2|ll|time_out_counter\(6) & (\ps2|ll|Add2~11\ $ (GND)))
-- \ps2|ll|Add2~13\ = CARRY((\ps2|ll|time_out_counter\(6)) # (!\ps2|ll|Add2~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|time_out_counter\(6),
	datad => VCC,
	cin => \ps2|ll|Add2~11\,
	combout => \ps2|ll|Add2~12_combout\,
	cout => \ps2|ll|Add2~13\);

-- Location: LCCOMB_X4_Y51_N20
\ps2|ll|Add2~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add2~14_combout\ = (\ps2|ll|time_out_counter\(7) & (\ps2|ll|Add2~13\ & VCC)) # (!\ps2|ll|time_out_counter\(7) & (!\ps2|ll|Add2~13\))
-- \ps2|ll|Add2~15\ = CARRY((!\ps2|ll|time_out_counter\(7) & !\ps2|ll|Add2~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|time_out_counter\(7),
	datad => VCC,
	cin => \ps2|ll|Add2~13\,
	combout => \ps2|ll|Add2~14_combout\,
	cout => \ps2|ll|Add2~15\);

-- Location: LCCOMB_X3_Y51_N6
\ps2|ll|Selector13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector13~0_combout\ = (\ps2|ll|time_out_counter[0]~14_combout\) # ((\ps2|ll|time_out_counter[0]~9_combout\ & ((\ps2|ll|Add2~14_combout\))) # (!\ps2|ll|time_out_counter[0]~9_combout\ & (\ps2|ll|time_out_counter[0]~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter[0]~9_combout\,
	datab => \ps2|ll|time_out_counter[0]~5_combout\,
	datac => \ps2|ll|Add2~14_combout\,
	datad => \ps2|ll|time_out_counter[0]~14_combout\,
	combout => \ps2|ll|Selector13~0_combout\);

-- Location: FF_X3_Y51_N7
\ps2|ll|time_out_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|Selector13~0_combout\,
	ena => \ps2|ll|time_out_counter[0]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|time_out_counter\(7));

-- Location: LCCOMB_X4_Y51_N22
\ps2|ll|Add2~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add2~16_combout\ = (\ps2|ll|time_out_counter\(8) & ((GND) # (!\ps2|ll|Add2~15\))) # (!\ps2|ll|time_out_counter\(8) & (\ps2|ll|Add2~15\ $ (GND)))
-- \ps2|ll|Add2~17\ = CARRY((\ps2|ll|time_out_counter\(8)) # (!\ps2|ll|Add2~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|time_out_counter\(8),
	datad => VCC,
	cin => \ps2|ll|Add2~15\,
	combout => \ps2|ll|Add2~16_combout\,
	cout => \ps2|ll|Add2~17\);

-- Location: LCCOMB_X4_Y51_N28
\ps2|ll|time_out_counter[8]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[8]~0_combout\ = (\ps2|ll|time_out_counter[0]~10_combout\ & ((\ps2|ll|Add2~16_combout\))) # (!\ps2|ll|time_out_counter[0]~10_combout\ & (\ps2|ll|time_out_counter[0]~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter[0]~14_combout\,
	datab => \ps2|ll|time_out_counter[0]~10_combout\,
	datad => \ps2|ll|Add2~16_combout\,
	combout => \ps2|ll|time_out_counter[8]~0_combout\);

-- Location: FF_X4_Y51_N29
\ps2|ll|time_out_counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|time_out_counter[8]~0_combout\,
	asdata => \ps2|ll|time_out_counter\(8),
	sload => \ps2|ll|ALT_INV_time_out_counter[0]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|time_out_counter\(8));

-- Location: LCCOMB_X4_Y51_N24
\ps2|ll|Add2~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add2~18_combout\ = (\ps2|ll|time_out_counter\(9) & (\ps2|ll|Add2~17\ & VCC)) # (!\ps2|ll|time_out_counter\(9) & (!\ps2|ll|Add2~17\))
-- \ps2|ll|Add2~19\ = CARRY((!\ps2|ll|time_out_counter\(9) & !\ps2|ll|Add2~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter\(9),
	datad => VCC,
	cin => \ps2|ll|Add2~17\,
	combout => \ps2|ll|Add2~18_combout\,
	cout => \ps2|ll|Add2~19\);

-- Location: LCCOMB_X4_Y51_N30
\ps2|ll|time_out_counter[9]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[9]~1_combout\ = (\ps2|ll|time_out_counter[0]~10_combout\ & ((\ps2|ll|Add2~18_combout\))) # (!\ps2|ll|time_out_counter[0]~10_combout\ & (\ps2|ll|time_out_counter[0]~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter[0]~14_combout\,
	datab => \ps2|ll|time_out_counter[0]~10_combout\,
	datad => \ps2|ll|Add2~18_combout\,
	combout => \ps2|ll|time_out_counter[9]~1_combout\);

-- Location: FF_X4_Y51_N31
\ps2|ll|time_out_counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|time_out_counter[9]~1_combout\,
	asdata => \ps2|ll|time_out_counter\(9),
	sload => \ps2|ll|ALT_INV_time_out_counter[0]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|time_out_counter\(9));

-- Location: LCCOMB_X4_Y51_N4
\ps2|ll|Equal3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Equal3~0_combout\ = (!\ps2|ll|time_out_counter\(5) & (!\ps2|ll|time_out_counter\(7) & (!\ps2|ll|time_out_counter\(9) & !\ps2|ll|time_out_counter\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter\(5),
	datab => \ps2|ll|time_out_counter\(7),
	datac => \ps2|ll|time_out_counter\(9),
	datad => \ps2|ll|time_out_counter\(8),
	combout => \ps2|ll|Equal3~0_combout\);

-- Location: LCCOMB_X5_Y51_N28
\ps2|ll|Equal3~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Equal3~4_combout\ = (!\ps2|ll|time_out_counter\(10) & (\ps2|ll|Equal3~0_combout\ & (!\ps2|ll|time_out_counter\(4) & !\ps2|ll|time_out_counter\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter\(10),
	datab => \ps2|ll|Equal3~0_combout\,
	datac => \ps2|ll|time_out_counter\(4),
	datad => \ps2|ll|time_out_counter\(0),
	combout => \ps2|ll|Equal3~4_combout\);

-- Location: LCCOMB_X6_Y48_N24
\ps2|ll|time_out_counter[0]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[0]~14_combout\ = (\ps2|ll|Equal3~2_combout\ & (\ps2|ll|Equal3~4_combout\ & \ps2|ll|state.interrupting~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Equal3~2_combout\,
	datab => \ps2|ll|Equal3~4_combout\,
	datad => \ps2|ll|state.interrupting~q\,
	combout => \ps2|ll|time_out_counter[0]~14_combout\);

-- Location: LCCOMB_X4_Y51_N26
\ps2|ll|Add2~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add2~20_combout\ = \ps2|ll|time_out_counter\(10) $ (\ps2|ll|Add2~19\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter\(10),
	cin => \ps2|ll|Add2~19\,
	combout => \ps2|ll|Add2~20_combout\);

-- Location: LCCOMB_X4_Y51_N0
\ps2|ll|time_out_counter[10]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[10]~2_combout\ = (\ps2|ll|time_out_counter[0]~10_combout\ & ((\ps2|ll|Add2~20_combout\))) # (!\ps2|ll|time_out_counter[0]~10_combout\ & (\ps2|ll|time_out_counter[0]~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter[0]~14_combout\,
	datab => \ps2|ll|time_out_counter[0]~10_combout\,
	datad => \ps2|ll|Add2~20_combout\,
	combout => \ps2|ll|time_out_counter[10]~2_combout\);

-- Location: FF_X4_Y51_N1
\ps2|ll|time_out_counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|time_out_counter[10]~2_combout\,
	asdata => \ps2|ll|time_out_counter\(10),
	sload => \ps2|ll|ALT_INV_time_out_counter[0]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|time_out_counter\(10));

-- Location: LCCOMB_X5_Y51_N10
\ps2|ll|Equal3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Equal3~1_combout\ = (!\ps2|ll|time_out_counter\(4) & !\ps2|ll|time_out_counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ps2|ll|time_out_counter\(4),
	datad => \ps2|ll|time_out_counter\(0),
	combout => \ps2|ll|Equal3~1_combout\);

-- Location: LCCOMB_X5_Y51_N26
\ps2|ll|Equal3~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Equal3~3_combout\ = (!\ps2|ll|time_out_counter\(10) & (\ps2|ll|Equal3~0_combout\ & (\ps2|ll|Equal3~2_combout\ & \ps2|ll|Equal3~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter\(10),
	datab => \ps2|ll|Equal3~0_combout\,
	datac => \ps2|ll|Equal3~2_combout\,
	datad => \ps2|ll|Equal3~1_combout\,
	combout => \ps2|ll|Equal3~3_combout\);

-- Location: LCCOMB_X5_Y48_N28
\ps2|ll|time_out_counter[0]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[0]~11_combout\ = (!\ps2|ll|state.finishing~q\ & (!\ps2|ll|state.waiting_for_acknowledge~q\ & (!\ps2|ll|state.sending~q\ & !\ps2|ll|state.receiving~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state.finishing~q\,
	datab => \ps2|ll|state.waiting_for_acknowledge~q\,
	datac => \ps2|ll|state.sending~q\,
	datad => \ps2|ll|state.receiving~q\,
	combout => \ps2|ll|time_out_counter[0]~11_combout\);

-- Location: LCCOMB_X6_Y47_N4
\ps2|ll|time_out_counter[0]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[0]~20_combout\ = (\ps2|ll|process_0~7_combout\) # ((\ps2|ll|state.idle~q\) # ((\ps2|ll|ps2_dat_0~q\ & !\ps2|ll|ps2_clk_0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|process_0~7_combout\,
	datab => \ps2|ll|ps2_dat_0~q\,
	datac => \ps2|ll|state.idle~q\,
	datad => \ps2|ll|ps2_clk_0~q\,
	combout => \ps2|ll|time_out_counter[0]~20_combout\);

-- Location: LCCOMB_X5_Y51_N6
\ps2|ll|time_out_counter[0]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[0]~12_combout\ = (\ps2|ll|Equal1~0_combout\ & (((\ps2|ll|time_out_counter[0]~11_combout\ & \ps2|ll|time_out_counter[0]~20_combout\)) # (!\ps2|ll|Equal3~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Equal3~3_combout\,
	datab => \ps2|ll|Equal1~0_combout\,
	datac => \ps2|ll|time_out_counter[0]~11_combout\,
	datad => \ps2|ll|time_out_counter[0]~20_combout\,
	combout => \ps2|ll|time_out_counter[0]~12_combout\);

-- Location: LCCOMB_X4_Y51_N2
\ps2|ll|time_out_counter[6]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[6]~18_combout\ = (\ps2|ll|time_out_counter[0]~12_combout\ & (((\ps2|ll|Add2~12_combout\)) # (!\ps2|ll|time_out_counter[0]~10_combout\))) # (!\ps2|ll|time_out_counter[0]~12_combout\ & (((\ps2|ll|time_out_counter\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter[0]~12_combout\,
	datab => \ps2|ll|time_out_counter[0]~10_combout\,
	datac => \ps2|ll|time_out_counter\(6),
	datad => \ps2|ll|Add2~12_combout\,
	combout => \ps2|ll|time_out_counter[6]~18_combout\);

-- Location: FF_X4_Y51_N3
\ps2|ll|time_out_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|time_out_counter[6]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|time_out_counter\(6));

-- Location: LCCOMB_X5_Y51_N4
\ps2|ll|Equal3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Equal3~2_combout\ = (!\ps2|ll|time_out_counter\(6) & (!\ps2|ll|time_out_counter\(2) & (!\ps2|ll|time_out_counter\(3) & !\ps2|ll|time_out_counter\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter\(6),
	datab => \ps2|ll|time_out_counter\(2),
	datac => \ps2|ll|time_out_counter\(3),
	datad => \ps2|ll|time_out_counter\(1),
	combout => \ps2|ll|Equal3~2_combout\);

-- Location: LCCOMB_X6_Y48_N20
\ps2|ll|state~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~23_combout\ = (\ps2|ll|state.waiting_for_acknowledge~q\ & ((!\ps2|ll|Equal3~4_combout\) # (!\ps2|ll|Equal3~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Equal3~2_combout\,
	datab => \ps2|ll|Equal3~4_combout\,
	datad => \ps2|ll|state.waiting_for_acknowledge~q\,
	combout => \ps2|ll|state~23_combout\);

-- Location: LCCOMB_X6_Y48_N26
\ps2|ll|state.idle~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state.idle~3_combout\ = (\ps2|ll|state~23_combout\ & (((\ps2|ll|ps2_dat_1~q\)))) # (!\ps2|ll|state~23_combout\ & ((\ps2|ll|time_out_counter[0]~5_combout\) # ((\ps2|ll|state~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter[0]~5_combout\,
	datab => \ps2|ll|state~23_combout\,
	datac => \ps2|ll|ps2_dat_1~q\,
	datad => \ps2|ll|state~22_combout\,
	combout => \ps2|ll|state.idle~3_combout\);

-- Location: LCCOMB_X6_Y48_N30
\ps2|ll|state.idle~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state.idle~4_combout\ = (\ps2|ll|state~28_combout\ & (\ps2|ll|state.idle~3_combout\ & ((\ps2|ll|state.idle~2_combout\)))) # (!\ps2|ll|state~28_combout\ & (((\ps2|ll|state.idle~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state.idle~3_combout\,
	datab => \ps2|ll|state~28_combout\,
	datac => \ps2|ll|state.idle~q\,
	datad => \ps2|ll|state.idle~2_combout\,
	combout => \ps2|ll|state.idle~4_combout\);

-- Location: FF_X6_Y48_N31
\ps2|ll|state.idle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|state.idle~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|state.idle~q\);

-- Location: LCCOMB_X7_Y45_N30
\ps2|ll|Selector28~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector28~0_combout\ = (\ps2|ll|data\(4)) # (!\ps2|ll|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state.idle~q\,
	datac => \ps2|ll|data\(4),
	combout => \ps2|ll|Selector28~0_combout\);

-- Location: FF_X7_Y45_N31
\ps2|ll|data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|Selector28~0_combout\,
	ena => \ps2|ll|data[2]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|data\(3));

-- Location: LCCOMB_X7_Y45_N12
\ps2|ll|process_0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|process_0~2_combout\ = \ps2|ll|data\(3) $ (\ps2|ll|data\(4) $ (\ps2|ll|data\(5) $ (\ps2|ll|data\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|data\(3),
	datab => \ps2|ll|data\(4),
	datac => \ps2|ll|data\(5),
	datad => \ps2|ll|data\(2),
	combout => \ps2|ll|process_0~2_combout\);

-- Location: LCCOMB_X6_Y47_N20
\ps2|ll|process_0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|process_0~1_combout\ = (\ps2|ll|n_bits\(3) & (!\ps2|ll|n_bits\(2) & (\ps2|ll|n_bits\(1) & !\ps2|ll|ps2_dat_1~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|n_bits\(3),
	datab => \ps2|ll|n_bits\(2),
	datac => \ps2|ll|n_bits\(1),
	datad => \ps2|ll|ps2_dat_1~q\,
	combout => \ps2|ll|process_0~1_combout\);

-- Location: LCCOMB_X7_Y45_N10
\ps2|ll|process_0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|process_0~3_combout\ = \ps2|ll|data\(6) $ (\ps2|ll|data\(7) $ (\ps2|ll|data\(10) $ (\ps2|ll|data\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|data\(6),
	datab => \ps2|ll|data\(7),
	datac => \ps2|ll|data\(10),
	datad => \ps2|ll|data\(8),
	combout => \ps2|ll|process_0~3_combout\);

-- Location: LCCOMB_X7_Y45_N24
\ps2|ll|process_0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|process_0~4_combout\ = (\ps2|ll|process_0~1_combout\ & (\ps2|ll|process_0~2_combout\ $ (\ps2|ll|data\(9) $ (\ps2|ll|process_0~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|process_0~2_combout\,
	datab => \ps2|ll|data\(9),
	datac => \ps2|ll|process_0~1_combout\,
	datad => \ps2|ll|process_0~3_combout\,
	combout => \ps2|ll|process_0~4_combout\);

-- Location: LCCOMB_X4_Y48_N12
\ps2|ll|process_0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|process_0~5_combout\ = (!\ps2|ll|n_bits\(0) & !\ps2|ll|data\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|n_bits\(0),
	datac => \ps2|ll|data\(1),
	combout => \ps2|ll|process_0~5_combout\);

-- Location: LCCOMB_X4_Y48_N4
\ps2|ll|rxd_valid~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|rxd_valid~1_combout\ = (\ps2|ll|process_0~4_combout\ & (\ps2|ll|rxd_valid~0_combout\ & (\ps2|ll|Equal1~0_combout\ & \ps2|ll|process_0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|process_0~4_combout\,
	datab => \ps2|ll|rxd_valid~0_combout\,
	datac => \ps2|ll|Equal1~0_combout\,
	datad => \ps2|ll|process_0~5_combout\,
	combout => \ps2|ll|rxd_valid~1_combout\);

-- Location: FF_X4_Y48_N5
\ps2|ll|rxd_valid\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|rxd_valid~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|rxd_valid~q\);

-- Location: LCCOMB_X9_Y44_N24
\ps2|key_code[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|key_code[0]~0_combout\ = (\ps2|ll|rxd_valid~q\ & \ps2|state.keyboard_wait_for_change~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ps2|ll|rxd_valid~q\,
	datad => \ps2|state.keyboard_wait_for_change~q\,
	combout => \ps2|key_code[0]~0_combout\);

-- Location: FF_X11_Y39_N3
\ps2|valid_key_code\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \ps2|key_code[0]~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|valid_key_code~q\);

-- Location: FF_X11_Y39_N23
\ps2|key_code[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \ps2|ll|rxd_data\(6),
	sload => VCC,
	ena => \ps2|key_code[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|key_code\(6));

-- Location: FF_X11_Y38_N23
\last_key_code[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \ps2|key_code\(6),
	sload => VCC,
	ena => \ps2|valid_key_code~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => last_key_code(6));

-- Location: FF_X11_Y39_N31
\ps2|key_code[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \ps2|ll|rxd_data\(5),
	sload => VCC,
	ena => \ps2|key_code[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|key_code\(5));

-- Location: FF_X11_Y38_N17
\last_key_code[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \ps2|key_code\(5),
	sload => VCC,
	ena => \ps2|valid_key_code~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => last_key_code(5));

-- Location: FF_X11_Y39_N1
\ps2|key_code[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \ps2|ll|rxd_data\(7),
	sload => VCC,
	ena => \ps2|key_code[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|key_code\(7));

-- Location: FF_X11_Y38_N9
\last_key_code[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \ps2|key_code\(7),
	sload => VCC,
	ena => \ps2|valid_key_code~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => last_key_code(7));

-- Location: FF_X11_Y39_N9
\ps2|key_code[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \ps2|ll|rxd_data\(4),
	sload => VCC,
	ena => \ps2|key_code[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|key_code\(4));

-- Location: FF_X11_Y38_N19
\last_key_code[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \ps2|key_code\(4),
	sload => VCC,
	ena => \ps2|valid_key_code~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => last_key_code(4));

-- Location: LCCOMB_X11_Y38_N8
\Equal7~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal7~1_combout\ = (((!last_key_code(4)) # (!last_key_code(7))) # (!last_key_code(5))) # (!last_key_code(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => last_key_code(6),
	datab => last_key_code(5),
	datac => last_key_code(7),
	datad => last_key_code(4),
	combout => \Equal7~1_combout\);

-- Location: FF_X11_Y39_N5
\ps2|key_code[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \ps2|ll|rxd_data\(2),
	sload => VCC,
	ena => \ps2|key_code[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|key_code\(2));

-- Location: FF_X12_Y39_N7
\last_key_code[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \ps2|key_code\(2),
	sload => VCC,
	ena => \ps2|valid_key_code~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => last_key_code(2));

-- Location: LCCOMB_X12_Y39_N16
\ps2|key_code[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|key_code[1]~feeder_combout\ = \ps2|ll|rxd_data\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ps2|ll|rxd_data\(1),
	combout => \ps2|key_code[1]~feeder_combout\);

-- Location: FF_X12_Y39_N17
\ps2|key_code[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|key_code[1]~feeder_combout\,
	ena => \ps2|key_code[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|key_code\(1));

-- Location: LCCOMB_X12_Y39_N28
\last_key_code[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \last_key_code[1]~feeder_combout\ = \ps2|key_code\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ps2|key_code\(1),
	combout => \last_key_code[1]~feeder_combout\);

-- Location: FF_X12_Y39_N29
\last_key_code[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \last_key_code[1]~feeder_combout\,
	ena => \ps2|valid_key_code~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => last_key_code(1));

-- Location: FF_X11_Y39_N17
\ps2|key_code[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \ps2|ll|rxd_data\(3),
	sload => VCC,
	ena => \ps2|key_code[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|key_code\(3));

-- Location: FF_X12_Y39_N25
\last_key_code[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \ps2|key_code\(3),
	sload => VCC,
	ena => \ps2|valid_key_code~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => last_key_code(3));

-- Location: FF_X11_Y39_N15
\ps2|key_code[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \ps2|ll|rxd_data\(0),
	sload => VCC,
	ena => \ps2|key_code[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|key_code\(0));

-- Location: FF_X12_Y39_N19
\last_key_code[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \ps2|key_code\(0),
	sload => VCC,
	ena => \ps2|valid_key_code~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => last_key_code(0));

-- Location: LCCOMB_X12_Y39_N24
\Equal7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal7~0_combout\ = (last_key_code(2)) # ((last_key_code(1)) # ((last_key_code(3)) # (last_key_code(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => last_key_code(2),
	datab => last_key_code(1),
	datac => last_key_code(3),
	datad => last_key_code(0),
	combout => \Equal7~0_combout\);

-- Location: LCCOMB_X11_Y38_N6
\Equal7~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal7~2_combout\ = (\Equal7~1_combout\) # (\Equal7~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Equal7~1_combout\,
	datad => \Equal7~0_combout\,
	combout => \Equal7~2_combout\);

-- Location: LCCOMB_X11_Y39_N10
\Equal19~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal19~0_combout\ = (!\ps2|key_code\(3) & (!\ps2|key_code\(0) & (!\ps2|key_code\(4) & \ps2|key_code\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(3),
	datab => \ps2|key_code\(0),
	datac => \ps2|key_code\(4),
	datad => \ps2|key_code\(6),
	combout => \Equal19~0_combout\);

-- Location: LCCOMB_X11_Y39_N28
\Equal19~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal19~1_combout\ = (!\ps2|key_code\(7) & !\ps2|key_code\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ps2|key_code\(7),
	datad => \ps2|key_code\(5),
	combout => \Equal19~1_combout\);

-- Location: LCCOMB_X11_Y39_N18
\s_dados_do_ps2~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~18_combout\ = ((\ps2|key_code\(1) $ (!\ps2|key_code\(2))) # (!\Equal19~1_combout\)) # (!\Equal19~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101011111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal19~0_combout\,
	datab => \ps2|key_code\(1),
	datac => \ps2|key_code\(2),
	datad => \Equal19~1_combout\,
	combout => \s_dados_do_ps2~18_combout\);

-- Location: LCCOMB_X11_Y39_N14
\s_volume[6]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_volume[6]~0_combout\ = (!\ps2|key_code\(7) & (!\ps2|key_code\(2) & \ps2|key_code\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(7),
	datab => \ps2|key_code\(2),
	datac => \ps2|key_code\(0),
	combout => \s_volume[6]~0_combout\);

-- Location: LCCOMB_X11_Y39_N22
\Equal11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal11~0_combout\ = (\ps2|key_code\(5) & (\s_volume[6]~0_combout\ & (!\ps2|key_code\(6) & \ps2|key_code\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(5),
	datab => \s_volume[6]~0_combout\,
	datac => \ps2|key_code\(6),
	datad => \ps2|key_code\(1),
	combout => \Equal11~0_combout\);

-- Location: LCCOMB_X11_Y39_N0
\Equal6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal6~0_combout\ = (!\ps2|key_code\(6) & (\ps2|key_code\(2) & (!\ps2|key_code\(7) & !\ps2|key_code\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(6),
	datab => \ps2|key_code\(2),
	datac => \ps2|key_code\(7),
	datad => \ps2|key_code\(1),
	combout => \Equal6~0_combout\);

-- Location: LCCOMB_X11_Y39_N4
\Equal10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal10~0_combout\ = (!\ps2|key_code\(0) & (\Equal6~0_combout\ & \ps2|key_code\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(0),
	datab => \Equal6~0_combout\,
	datad => \ps2|key_code\(5),
	combout => \Equal10~0_combout\);

-- Location: LCCOMB_X11_Y39_N16
\s_dados_do_ps2~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~17_combout\ = ((!\Equal11~0_combout\ & !\Equal10~0_combout\)) # (!\ps2|key_code\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001101110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal11~0_combout\,
	datab => \ps2|key_code\(4),
	datad => \Equal10~0_combout\,
	combout => \s_dados_do_ps2~17_combout\);

-- Location: LCCOMB_X11_Y39_N12
\s_dados_do_ps2~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~19_combout\ = (\ps2|key_code\(6) & (\s_volume[6]~0_combout\ & \ps2|key_code\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|key_code\(6),
	datac => \s_volume[6]~0_combout\,
	datad => \ps2|key_code\(1),
	combout => \s_dados_do_ps2~19_combout\);

-- Location: LCCOMB_X11_Y39_N8
\s_dados_do_ps2~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~20_combout\ = (\ps2|key_code\(3) & (((\ps2|key_code\(4)) # (\ps2|key_code\(5))))) # (!\ps2|key_code\(3) & (\ps2|key_code\(0) & (\ps2|key_code\(4) & \ps2|key_code\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(3),
	datab => \ps2|key_code\(0),
	datac => \ps2|key_code\(4),
	datad => \ps2|key_code\(5),
	combout => \s_dados_do_ps2~20_combout\);

-- Location: LCCOMB_X11_Y39_N26
\s_dados_do_ps2~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~21_combout\ = (\ps2|key_code\(3) & (((\s_dados_do_ps2~20_combout\)) # (!\s_dados_do_ps2~19_combout\))) # (!\ps2|key_code\(3) & (((!\s_dados_do_ps2~20_combout\) # (!\Equal6~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_dados_do_ps2~19_combout\,
	datab => \Equal6~0_combout\,
	datac => \ps2|key_code\(3),
	datad => \s_dados_do_ps2~20_combout\,
	combout => \s_dados_do_ps2~21_combout\);

-- Location: LCCOMB_X11_Y39_N2
\s_dados_do_ps2~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~14_combout\ = (\s_volume[6]~0_combout\ & (!\ps2|key_code\(6) & \ps2|key_code\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_volume[6]~0_combout\,
	datab => \ps2|key_code\(6),
	datad => \ps2|key_code\(1),
	combout => \s_dados_do_ps2~14_combout\);

-- Location: LCCOMB_X11_Y39_N30
\s_dados_do_ps2~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~15_combout\ = (\ps2|key_code\(3) & (!\ps2|key_code\(5) & ((\Equal6~0_combout\) # (\s_dados_do_ps2~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(3),
	datab => \Equal6~0_combout\,
	datac => \ps2|key_code\(5),
	datad => \s_dados_do_ps2~14_combout\,
	combout => \s_dados_do_ps2~15_combout\);

-- Location: LCCOMB_X11_Y39_N24
\s_dados_do_ps2~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~16_combout\ = (\ps2|key_code\(4) & (((!\s_dados_do_ps2~15_combout\)))) # (!\ps2|key_code\(4) & (!\Equal11~0_combout\ & ((!\Equal10~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal11~0_combout\,
	datab => \ps2|key_code\(4),
	datac => \s_dados_do_ps2~15_combout\,
	datad => \Equal10~0_combout\,
	combout => \s_dados_do_ps2~16_combout\);

-- Location: LCCOMB_X11_Y39_N6
\s_dados_do_ps2~77\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~77_combout\ = (\s_dados_do_ps2~18_combout\ & (\s_dados_do_ps2~17_combout\ & (\s_dados_do_ps2~21_combout\ & \s_dados_do_ps2~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_dados_do_ps2~18_combout\,
	datab => \s_dados_do_ps2~17_combout\,
	datac => \s_dados_do_ps2~21_combout\,
	datad => \s_dados_do_ps2~16_combout\,
	combout => \s_dados_do_ps2~77_combout\);

-- Location: LCCOMB_X4_Y34_N6
\start_sound~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \start_sound~0_combout\ = (\ps2|valid_key_code~q\ & ((\s_dados_do_ps2~77_combout\ & ((\start_sound~q\))) # (!\s_dados_do_ps2~77_combout\ & (\Equal7~2_combout\)))) # (!\ps2|valid_key_code~q\ & (((\start_sound~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|valid_key_code~q\,
	datab => \Equal7~2_combout\,
	datac => \s_dados_do_ps2~77_combout\,
	datad => \start_sound~q\,
	combout => \start_sound~0_combout\);

-- Location: FF_X5_Y34_N31
start_sound : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \start_sound~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \start_sound~q\);

-- Location: LCCOMB_X6_Y34_N2
\vol|Selector12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|Selector12~0_combout\ = ((\vol|LessThan0~12_combout\ & ((\vol|PS.FadeOut~q\) # (\vol|PS.FadeIn~q\)))) # (!\vol|PS.Mute~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vol|PS.FadeOut~q\,
	datab => \vol|LessThan0~12_combout\,
	datac => \vol|PS.FadeIn~q\,
	datad => \vol|PS.Mute~q\,
	combout => \vol|Selector12~0_combout\);

-- Location: LCCOMB_X5_Y34_N10
\vol|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|Add0~0_combout\ = \vol|s_sound\(0) $ (VCC)
-- \vol|Add0~1\ = CARRY(\vol|s_sound\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \vol|s_sound\(0),
	datad => VCC,
	combout => \vol|Add0~0_combout\,
	cout => \vol|Add0~1\);

-- Location: LCCOMB_X6_Y34_N8
\vol|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|Add0~18_combout\ = (\vol|Add0~0_combout\) # (!\vol|PS.Mute~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vol|Add0~0_combout\,
	datad => \vol|PS.Mute~q\,
	combout => \vol|Add0~18_combout\);

-- Location: LCCOMB_X6_Y34_N14
\vol|s_sound[0]\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|s_sound\(0) = (\vol|Selector12~0_combout\ & ((\vol|Add0~18_combout\))) # (!\vol|Selector12~0_combout\ & (\vol|s_sound\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vol|s_sound\(0),
	datac => \vol|Add0~18_combout\,
	datad => \vol|Selector12~0_combout\,
	combout => \vol|s_sound\(0));

-- Location: LCCOMB_X5_Y34_N12
\vol|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|Add0~2_combout\ = (\vol|PS.FadeIn~q\ & ((\vol|s_sound\(1) & (!\vol|Add0~1\)) # (!\vol|s_sound\(1) & ((\vol|Add0~1\) # (GND))))) # (!\vol|PS.FadeIn~q\ & ((\vol|s_sound\(1) & (\vol|Add0~1\ & VCC)) # (!\vol|s_sound\(1) & (!\vol|Add0~1\))))
-- \vol|Add0~3\ = CARRY((\vol|PS.FadeIn~q\ & ((!\vol|Add0~1\) # (!\vol|s_sound\(1)))) # (!\vol|PS.FadeIn~q\ & (!\vol|s_sound\(1) & !\vol|Add0~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \vol|PS.FadeIn~q\,
	datab => \vol|s_sound\(1),
	datad => VCC,
	cin => \vol|Add0~1\,
	combout => \vol|Add0~2_combout\,
	cout => \vol|Add0~3\);

-- Location: LCCOMB_X5_Y34_N14
\vol|Add0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|Add0~5_combout\ = ((\vol|PS.FadeIn~q\ $ (\vol|s_sound\(2) $ (\vol|Add0~3\)))) # (GND)
-- \vol|Add0~6\ = CARRY((\vol|PS.FadeIn~q\ & (\vol|s_sound\(2) & !\vol|Add0~3\)) # (!\vol|PS.FadeIn~q\ & ((\vol|s_sound\(2)) # (!\vol|Add0~3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \vol|PS.FadeIn~q\,
	datab => \vol|s_sound\(2),
	datad => VCC,
	cin => \vol|Add0~3\,
	combout => \vol|Add0~5_combout\,
	cout => \vol|Add0~6\);

-- Location: LCCOMB_X6_Y34_N22
\vol|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|Add0~20_combout\ = (\vol|Add0~5_combout\) # (!\vol|PS.Mute~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \vol|Add0~5_combout\,
	datad => \vol|PS.Mute~q\,
	combout => \vol|Add0~20_combout\);

-- Location: LCCOMB_X6_Y34_N26
\vol|s_sound[2]\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|s_sound\(2) = (\vol|Selector12~0_combout\ & ((\vol|Add0~20_combout\))) # (!\vol|Selector12~0_combout\ & (\vol|s_sound\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vol|s_sound\(2),
	datac => \vol|Add0~20_combout\,
	datad => \vol|Selector12~0_combout\,
	combout => \vol|s_sound\(2));

-- Location: LCCOMB_X5_Y34_N16
\vol|Add0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|Add0~7_combout\ = (\vol|PS.FadeIn~q\ & ((\vol|s_sound\(3) & (!\vol|Add0~6\)) # (!\vol|s_sound\(3) & ((\vol|Add0~6\) # (GND))))) # (!\vol|PS.FadeIn~q\ & ((\vol|s_sound\(3) & (\vol|Add0~6\ & VCC)) # (!\vol|s_sound\(3) & (!\vol|Add0~6\))))
-- \vol|Add0~8\ = CARRY((\vol|PS.FadeIn~q\ & ((!\vol|Add0~6\) # (!\vol|s_sound\(3)))) # (!\vol|PS.FadeIn~q\ & (!\vol|s_sound\(3) & !\vol|Add0~6\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \vol|PS.FadeIn~q\,
	datab => \vol|s_sound\(3),
	datad => VCC,
	cin => \vol|Add0~6\,
	combout => \vol|Add0~7_combout\,
	cout => \vol|Add0~8\);

-- Location: LCCOMB_X6_Y34_N20
\vol|Add0~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|Add0~19_combout\ = (\vol|Add0~7_combout\) # (!\vol|PS.Mute~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \vol|Add0~7_combout\,
	datad => \vol|PS.Mute~q\,
	combout => \vol|Add0~19_combout\);

-- Location: LCCOMB_X6_Y34_N10
\vol|s_sound[3]\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|s_sound\(3) = (\vol|Selector12~0_combout\ & ((\vol|Add0~19_combout\))) # (!\vol|Selector12~0_combout\ & (\vol|s_sound\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vol|s_sound\(3),
	datab => \vol|Selector12~0_combout\,
	datad => \vol|Add0~19_combout\,
	combout => \vol|s_sound\(3));

-- Location: LCCOMB_X5_Y34_N18
\vol|Add0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|Add0~9_combout\ = ((\vol|PS.FadeIn~q\ $ (\vol|s_sound\(4) $ (\vol|Add0~8\)))) # (GND)
-- \vol|Add0~10\ = CARRY((\vol|PS.FadeIn~q\ & (\vol|s_sound\(4) & !\vol|Add0~8\)) # (!\vol|PS.FadeIn~q\ & ((\vol|s_sound\(4)) # (!\vol|Add0~8\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \vol|PS.FadeIn~q\,
	datab => \vol|s_sound\(4),
	datad => VCC,
	cin => \vol|Add0~8\,
	combout => \vol|Add0~9_combout\,
	cout => \vol|Add0~10\);

-- Location: LCCOMB_X6_Y34_N0
\vol|Add0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|Add0~11_combout\ = (\vol|PS.Mute~q\ & \vol|Add0~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \vol|PS.Mute~q\,
	datad => \vol|Add0~9_combout\,
	combout => \vol|Add0~11_combout\);

-- Location: LCCOMB_X6_Y34_N24
\vol|s_sound[4]\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|s_sound\(4) = (\vol|Selector12~0_combout\ & ((\vol|Add0~11_combout\))) # (!\vol|Selector12~0_combout\ & (\vol|s_sound\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \vol|s_sound\(4),
	datac => \vol|Selector12~0_combout\,
	datad => \vol|Add0~11_combout\,
	combout => \vol|s_sound\(4));

-- Location: LCCOMB_X5_Y34_N20
\vol|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|Add0~12_combout\ = (\vol|s_sound\(5) & ((\vol|PS.FadeIn~q\ & (!\vol|Add0~10\)) # (!\vol|PS.FadeIn~q\ & (\vol|Add0~10\ & VCC)))) # (!\vol|s_sound\(5) & ((\vol|PS.FadeIn~q\ & ((\vol|Add0~10\) # (GND))) # (!\vol|PS.FadeIn~q\ & (!\vol|Add0~10\))))
-- \vol|Add0~13\ = CARRY((\vol|s_sound\(5) & (\vol|PS.FadeIn~q\ & !\vol|Add0~10\)) # (!\vol|s_sound\(5) & ((\vol|PS.FadeIn~q\) # (!\vol|Add0~10\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \vol|s_sound\(5),
	datab => \vol|PS.FadeIn~q\,
	datad => VCC,
	cin => \vol|Add0~10\,
	combout => \vol|Add0~12_combout\,
	cout => \vol|Add0~13\);

-- Location: LCCOMB_X5_Y34_N28
\vol|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|Add0~14_combout\ = (\vol|Add0~12_combout\) # (!\vol|PS.Mute~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \vol|Add0~12_combout\,
	datad => \vol|PS.Mute~q\,
	combout => \vol|Add0~14_combout\);

-- Location: LCCOMB_X5_Y34_N6
\vol|s_sound[5]\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|s_sound\(5) = (\vol|Selector12~0_combout\ & ((\vol|Add0~14_combout\))) # (!\vol|Selector12~0_combout\ & (\vol|s_sound\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vol|Selector12~0_combout\,
	datab => \vol|s_sound\(5),
	datad => \vol|Add0~14_combout\,
	combout => \vol|s_sound\(5));

-- Location: LCCOMB_X5_Y34_N22
\vol|Add0~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|Add0~15_combout\ = \vol|s_sound\(6) $ (\vol|PS.FadeIn~q\ $ (\vol|Add0~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \vol|s_sound\(6),
	datab => \vol|PS.FadeIn~q\,
	cin => \vol|Add0~13\,
	combout => \vol|Add0~15_combout\);

-- Location: LCCOMB_X5_Y34_N0
\vol|Add0~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|Add0~17_combout\ = (\vol|Add0~15_combout\ & \vol|PS.Mute~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vol|Add0~15_combout\,
	datad => \vol|PS.Mute~q\,
	combout => \vol|Add0~17_combout\);

-- Location: LCCOMB_X5_Y34_N2
\vol|s_sound[6]\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|s_sound\(6) = (\vol|Selector12~0_combout\ & ((\vol|Add0~17_combout\))) # (!\vol|Selector12~0_combout\ & (\vol|s_sound\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vol|Selector12~0_combout\,
	datab => \vol|s_sound\(6),
	datad => \vol|Add0~17_combout\,
	combout => \vol|s_sound\(6));

-- Location: LCCOMB_X11_Y38_N28
\Equal23~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal23~0_combout\ = (\ps2|key_code\(4) & (\ps2|key_code\(6) & (\ps2|key_code\(5) & \ps2|key_code\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(4),
	datab => \ps2|key_code\(6),
	datac => \ps2|key_code\(5),
	datad => \ps2|key_code\(3),
	combout => \Equal23~0_combout\);

-- Location: LCCOMB_X4_Y34_N22
\Equal23~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal23~1_combout\ = (\s_volume[6]~0_combout\ & (\Equal23~0_combout\ & \ps2|key_code\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \s_volume[6]~0_combout\,
	datac => \Equal23~0_combout\,
	datad => \ps2|key_code\(1),
	combout => \Equal23~1_combout\);

-- Location: LCCOMB_X7_Y34_N2
\Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = s_volume(0) $ (VCC)
-- \Add1~1\ = CARRY(s_volume(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => s_volume(0),
	datad => VCC,
	combout => \Add1~0_combout\,
	cout => \Add1~1\);

-- Location: LCCOMB_X4_Y34_N10
\s_volume[6]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_volume[6]~2_combout\ = ((s_volume(5)) # ((s_volume(6)) # (!s_volume(4)))) # (!s_volume(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_volume(3),
	datab => s_volume(5),
	datac => s_volume(6),
	datad => s_volume(4),
	combout => \s_volume[6]~2_combout\);

-- Location: LCCOMB_X4_Y34_N28
\s_volume[6]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_volume[6]~3_combout\ = (((\s_volume[6]~2_combout\) # (!s_volume(0))) # (!s_volume(1))) # (!s_volume(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_volume(2),
	datab => s_volume(1),
	datac => s_volume(0),
	datad => \s_volume[6]~2_combout\,
	combout => \s_volume[6]~3_combout\);

-- Location: LCCOMB_X4_Y34_N26
\s_volume[6]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_volume[6]~4_combout\ = (\Equal23~0_combout\ & (\s_volume[6]~3_combout\ & (\s_volume[6]~0_combout\ & !\ps2|key_code\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal23~0_combout\,
	datab => \s_volume[6]~3_combout\,
	datac => \s_volume[6]~0_combout\,
	datad => \ps2|key_code\(1),
	combout => \s_volume[6]~4_combout\);

-- Location: LCCOMB_X4_Y34_N18
\s_volume[6]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_volume[6]~1_combout\ = (\Equal23~1_combout\ & (((s_volume(4) & !s_volume(5))) # (!s_volume(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_volume(4),
	datab => s_volume(6),
	datac => \Equal23~1_combout\,
	datad => s_volume(5),
	combout => \s_volume[6]~1_combout\);

-- Location: LCCOMB_X4_Y34_N30
\s_volume[6]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_volume[6]~5_combout\ = (\Equal7~2_combout\ & (\ps2|valid_key_code~q\ & ((\s_volume[6]~4_combout\) # (\s_volume[6]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_volume[6]~4_combout\,
	datab => \s_volume[6]~1_combout\,
	datac => \Equal7~2_combout\,
	datad => \ps2|valid_key_code~q\,
	combout => \s_volume[6]~5_combout\);

-- Location: FF_X7_Y34_N3
\s_volume[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \Add1~0_combout\,
	ena => \s_volume[6]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_volume(0));

-- Location: LCCOMB_X7_Y34_N4
\Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~2_combout\ = (\Equal23~1_combout\ & ((s_volume(1) & (\Add1~1\ & VCC)) # (!s_volume(1) & (!\Add1~1\)))) # (!\Equal23~1_combout\ & ((s_volume(1) & (!\Add1~1\)) # (!s_volume(1) & ((\Add1~1\) # (GND)))))
-- \Add1~3\ = CARRY((\Equal23~1_combout\ & (!s_volume(1) & !\Add1~1\)) # (!\Equal23~1_combout\ & ((!\Add1~1\) # (!s_volume(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Equal23~1_combout\,
	datab => s_volume(1),
	datad => VCC,
	cin => \Add1~1\,
	combout => \Add1~2_combout\,
	cout => \Add1~3\);

-- Location: FF_X7_Y34_N5
\s_volume[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \Add1~2_combout\,
	ena => \s_volume[6]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_volume(1));

-- Location: LCCOMB_X7_Y34_N6
\Add1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~4_combout\ = ((s_volume(2) $ (\Equal23~1_combout\ $ (!\Add1~3\)))) # (GND)
-- \Add1~5\ = CARRY((s_volume(2) & ((\Equal23~1_combout\) # (!\Add1~3\))) # (!s_volume(2) & (\Equal23~1_combout\ & !\Add1~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_volume(2),
	datab => \Equal23~1_combout\,
	datad => VCC,
	cin => \Add1~3\,
	combout => \Add1~4_combout\,
	cout => \Add1~5\);

-- Location: FF_X7_Y34_N7
\s_volume[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \Add1~4_combout\,
	ena => \s_volume[6]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_volume(2));

-- Location: LCCOMB_X7_Y34_N8
\Add1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~6_combout\ = (\Equal23~1_combout\ & ((s_volume(3) & (\Add1~5\ & VCC)) # (!s_volume(3) & (!\Add1~5\)))) # (!\Equal23~1_combout\ & ((s_volume(3) & (!\Add1~5\)) # (!s_volume(3) & ((\Add1~5\) # (GND)))))
-- \Add1~7\ = CARRY((\Equal23~1_combout\ & (!s_volume(3) & !\Add1~5\)) # (!\Equal23~1_combout\ & ((!\Add1~5\) # (!s_volume(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Equal23~1_combout\,
	datab => s_volume(3),
	datad => VCC,
	cin => \Add1~5\,
	combout => \Add1~6_combout\,
	cout => \Add1~7\);

-- Location: FF_X7_Y34_N9
\s_volume[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \Add1~6_combout\,
	ena => \s_volume[6]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_volume(3));

-- Location: LCCOMB_X7_Y34_N10
\Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~8_combout\ = ((\Equal23~1_combout\ $ (s_volume(4) $ (!\Add1~7\)))) # (GND)
-- \Add1~9\ = CARRY((\Equal23~1_combout\ & ((s_volume(4)) # (!\Add1~7\))) # (!\Equal23~1_combout\ & (s_volume(4) & !\Add1~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Equal23~1_combout\,
	datab => s_volume(4),
	datad => VCC,
	cin => \Add1~7\,
	combout => \Add1~8_combout\,
	cout => \Add1~9\);

-- Location: FF_X7_Y34_N11
\s_volume[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \Add1~8_combout\,
	ena => \s_volume[6]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_volume(4));

-- Location: LCCOMB_X7_Y34_N12
\Add1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~10_combout\ = (\Equal23~1_combout\ & ((s_volume(5) & (!\Add1~9\)) # (!s_volume(5) & (\Add1~9\ & VCC)))) # (!\Equal23~1_combout\ & ((s_volume(5) & ((\Add1~9\) # (GND))) # (!s_volume(5) & (!\Add1~9\))))
-- \Add1~11\ = CARRY((\Equal23~1_combout\ & (s_volume(5) & !\Add1~9\)) # (!\Equal23~1_combout\ & ((s_volume(5)) # (!\Add1~9\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Equal23~1_combout\,
	datab => s_volume(5),
	datad => VCC,
	cin => \Add1~9\,
	combout => \Add1~10_combout\,
	cout => \Add1~11\);

-- Location: LCCOMB_X7_Y34_N30
\s_volume[5]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_volume[5]~7_combout\ = !\Add1~10_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Add1~10_combout\,
	combout => \s_volume[5]~7_combout\);

-- Location: FF_X7_Y34_N31
\s_volume[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \s_volume[5]~7_combout\,
	ena => \s_volume[6]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_volume(5));

-- Location: LCCOMB_X7_Y34_N14
\Add1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~12_combout\ = s_volume(6) $ (\Add1~11\ $ (\Equal23~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_volume(6),
	datad => \Equal23~1_combout\,
	cin => \Add1~11\,
	combout => \Add1~12_combout\);

-- Location: LCCOMB_X7_Y34_N0
\s_volume[6]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_volume[6]~6_combout\ = !\Add1~12_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add1~12_combout\,
	combout => \s_volume[6]~6_combout\);

-- Location: FF_X7_Y34_N1
\s_volume[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \s_volume[6]~6_combout\,
	ena => \s_volume[6]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_volume(6));

-- Location: LCCOMB_X7_Y34_N16
\vol|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|LessThan0~1_cout\ = CARRY((!\vol|s_sound\(0) & s_volume(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \vol|s_sound\(0),
	datab => s_volume(0),
	datad => VCC,
	cout => \vol|LessThan0~1_cout\);

-- Location: LCCOMB_X7_Y34_N18
\vol|LessThan0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|LessThan0~3_cout\ = CARRY((\vol|s_sound\(1) & ((!\vol|LessThan0~1_cout\) # (!s_volume(1)))) # (!\vol|s_sound\(1) & (!s_volume(1) & !\vol|LessThan0~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \vol|s_sound\(1),
	datab => s_volume(1),
	datad => VCC,
	cin => \vol|LessThan0~1_cout\,
	cout => \vol|LessThan0~3_cout\);

-- Location: LCCOMB_X7_Y34_N20
\vol|LessThan0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|LessThan0~5_cout\ = CARRY((\vol|s_sound\(2) & (s_volume(2) & !\vol|LessThan0~3_cout\)) # (!\vol|s_sound\(2) & ((s_volume(2)) # (!\vol|LessThan0~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \vol|s_sound\(2),
	datab => s_volume(2),
	datad => VCC,
	cin => \vol|LessThan0~3_cout\,
	cout => \vol|LessThan0~5_cout\);

-- Location: LCCOMB_X7_Y34_N22
\vol|LessThan0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|LessThan0~7_cout\ = CARRY((\vol|s_sound\(3) & ((!\vol|LessThan0~5_cout\) # (!s_volume(3)))) # (!\vol|s_sound\(3) & (!s_volume(3) & !\vol|LessThan0~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \vol|s_sound\(3),
	datab => s_volume(3),
	datad => VCC,
	cin => \vol|LessThan0~5_cout\,
	cout => \vol|LessThan0~7_cout\);

-- Location: LCCOMB_X7_Y34_N24
\vol|LessThan0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|LessThan0~9_cout\ = CARRY((s_volume(4) & ((!\vol|LessThan0~7_cout\) # (!\vol|s_sound\(4)))) # (!s_volume(4) & (!\vol|s_sound\(4) & !\vol|LessThan0~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_volume(4),
	datab => \vol|s_sound\(4),
	datad => VCC,
	cin => \vol|LessThan0~7_cout\,
	cout => \vol|LessThan0~9_cout\);

-- Location: LCCOMB_X7_Y34_N26
\vol|LessThan0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|LessThan0~11_cout\ = CARRY((\vol|s_sound\(5) & ((s_volume(5)) # (!\vol|LessThan0~9_cout\))) # (!\vol|s_sound\(5) & (s_volume(5) & !\vol|LessThan0~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \vol|s_sound\(5),
	datab => s_volume(5),
	datad => VCC,
	cin => \vol|LessThan0~9_cout\,
	cout => \vol|LessThan0~11_cout\);

-- Location: LCCOMB_X7_Y34_N28
\vol|LessThan0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|LessThan0~12_combout\ = (\vol|s_sound\(6) & (!\vol|LessThan0~11_cout\ & !s_volume(6))) # (!\vol|s_sound\(6) & ((!s_volume(6)) # (!\vol|LessThan0~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \vol|s_sound\(6),
	datad => s_volume(6),
	cin => \vol|LessThan0~11_cout\,
	combout => \vol|LessThan0~12_combout\);

-- Location: LCCOMB_X4_Y34_N20
\vol|Selector12~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|Selector12~1_combout\ = (\vol|LessThan0~12_combout\ & ((\vol|PS.FadeIn~q\) # (\vol|PS.FadeOut~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vol|PS.FadeIn~q\,
	datac => \vol|LessThan0~12_combout\,
	datad => \vol|PS.FadeOut~q\,
	combout => \vol|Selector12~1_combout\);

-- Location: CLKCTRL_G1
\vol|Selector12~1clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \vol|Selector12~1clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \vol|Selector12~1clkctrl_outclk\);

-- Location: LCCOMB_X5_Y34_N30
\vol|Selector3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|Selector3~0_combout\ = (\vol|PS.FadeIn~q\) # ((\start_sound~q\ & \vol|PS.Normal~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \vol|PS.FadeIn~q\,
	datac => \start_sound~q\,
	datad => \vol|PS.Normal~q\,
	combout => \vol|Selector3~0_combout\);

-- Location: LCCOMB_X5_Y34_N26
\vol|NS.Normal_141\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|NS.Normal_141~combout\ = (GLOBAL(\vol|Selector12~1clkctrl_outclk\) & (\vol|NS.Normal_141~combout\)) # (!GLOBAL(\vol|Selector12~1clkctrl_outclk\) & ((\vol|Selector3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vol|NS.Normal_141~combout\,
	datac => \vol|Selector3~0_combout\,
	datad => \vol|Selector12~1clkctrl_outclk\,
	combout => \vol|NS.Normal_141~combout\);

-- Location: FF_X5_Y34_N3
\vol|PS.Normal\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \vol|NS.Normal_141~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vol|PS.Normal~q\);

-- Location: LCCOMB_X4_Y34_N4
\vol|Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|Selector1~0_combout\ = (!\start_sound~q\ & \vol|PS.Normal~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \start_sound~q\,
	datad => \vol|PS.Normal~q\,
	combout => \vol|Selector1~0_combout\);

-- Location: LCCOMB_X4_Y34_N24
\vol|NS.FadeOut_129\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|NS.FadeOut_129~combout\ = (GLOBAL(\vol|Selector12~1clkctrl_outclk\) & (\vol|NS.FadeOut_129~combout\)) # (!GLOBAL(\vol|Selector12~1clkctrl_outclk\) & ((\vol|Selector1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \vol|NS.FadeOut_129~combout\,
	datac => \vol|Selector12~1clkctrl_outclk\,
	datad => \vol|Selector1~0_combout\,
	combout => \vol|NS.FadeOut_129~combout\);

-- Location: LCCOMB_X4_Y34_N16
\vol|PS.FadeOut~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|PS.FadeOut~feeder_combout\ = \vol|NS.FadeOut_129~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \vol|NS.FadeOut_129~combout\,
	combout => \vol|PS.FadeOut~feeder_combout\);

-- Location: FF_X4_Y34_N17
\vol|PS.FadeOut\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \vol|PS.FadeOut~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vol|PS.FadeOut~q\);

-- Location: LCCOMB_X6_Y34_N18
\vol|Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|Selector0~0_combout\ = (\vol|PS.FadeOut~q\) # ((!\vol|PS.Mute~q\ & !\start_sound~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \vol|PS.Mute~q\,
	datac => \vol|PS.FadeOut~q\,
	datad => \start_sound~q\,
	combout => \vol|Selector0~0_combout\);

-- Location: LCCOMB_X6_Y34_N6
\vol|NS.Mute_117\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|NS.Mute_117~combout\ = (GLOBAL(\vol|Selector12~1clkctrl_outclk\) & ((\vol|NS.Mute_117~combout\))) # (!GLOBAL(\vol|Selector12~1clkctrl_outclk\) & (\vol|Selector0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vol|Selector0~0_combout\,
	datac => \vol|NS.Mute_117~combout\,
	datad => \vol|Selector12~1clkctrl_outclk\,
	combout => \vol|NS.Mute_117~combout\);

-- Location: LCCOMB_X6_Y34_N28
\vol|PS.Mute~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|PS.Mute~0_combout\ = !\vol|NS.Mute_117~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \vol|NS.Mute_117~combout\,
	combout => \vol|PS.Mute~0_combout\);

-- Location: FF_X6_Y34_N29
\vol|PS.Mute\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~input_o\,
	d => \vol|PS.Mute~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vol|PS.Mute~q\);

-- Location: LCCOMB_X5_Y34_N8
\vol|Selector4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|Selector4~0_combout\ = (\start_sound~q\ & !\vol|PS.Mute~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \start_sound~q\,
	datad => \vol|PS.Mute~q\,
	combout => \vol|Selector4~0_combout\);

-- Location: LCCOMB_X5_Y34_N4
\vol|NS.FadeIn_153\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|NS.FadeIn_153~combout\ = (GLOBAL(\vol|Selector12~1clkctrl_outclk\) & ((\vol|NS.FadeIn_153~combout\))) # (!GLOBAL(\vol|Selector12~1clkctrl_outclk\) & (\vol|Selector4~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vol|Selector4~0_combout\,
	datac => \vol|NS.FadeIn_153~combout\,
	datad => \vol|Selector12~1clkctrl_outclk\,
	combout => \vol|NS.FadeIn_153~combout\);

-- Location: FF_X5_Y34_N7
\vol|PS.FadeIn\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \vol|NS.FadeIn_153~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vol|PS.FadeIn~q\);

-- Location: LCCOMB_X6_Y34_N4
\vol|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|Add0~4_combout\ = (\vol|Add0~2_combout\) # (!\vol|PS.Mute~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vol|Add0~2_combout\,
	datad => \vol|PS.Mute~q\,
	combout => \vol|Add0~4_combout\);

-- Location: LCCOMB_X6_Y34_N16
\vol|s_sound[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- \vol|s_sound\(1) = (\vol|Selector12~0_combout\ & ((\vol|Add0~4_combout\))) # (!\vol|Selector12~0_combout\ & (\vol|s_sound\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vol|s_sound\(1),
	datac => \vol|Add0~4_combout\,
	datad => \vol|Selector12~0_combout\,
	combout => \vol|s_sound\(1));

-- Location: LCCOMB_X5_Y34_N24
\ac|desired_config~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|desired_config~0_combout\ = (\vol|s_sound\(1)) # ((!\vol|s_sound\(6) & ((!\vol|s_sound\(5)) # (!\vol|s_sound\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vol|s_sound\(1),
	datab => \vol|s_sound\(4),
	datac => \vol|s_sound\(6),
	datad => \vol|s_sound\(5),
	combout => \ac|desired_config~0_combout\);

-- Location: FF_X5_Y34_N25
\ac|desired_config.volume[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|desired_config~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|desired_config.volume\(1));

-- Location: LCCOMB_X5_Y35_N28
\ac|desired_config~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|desired_config~1_combout\ = (\vol|s_sound\(0)) # ((!\vol|s_sound\(6) & ((!\vol|s_sound\(5)) # (!\vol|s_sound\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vol|s_sound\(4),
	datab => \vol|s_sound\(0),
	datac => \vol|s_sound\(6),
	datad => \vol|s_sound\(5),
	combout => \ac|desired_config~1_combout\);

-- Location: FF_X5_Y35_N29
\ac|desired_config.volume[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|desired_config~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|desired_config.volume\(0));

-- Location: LCCOMB_X9_Y35_N8
\ac|current_config.volume[6]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|current_config.volume[6]~2_combout\ = (!\ac|Equal0~4_combout\ & (!\ac|state[2]~10_combout\ & ((!\ac|i2c|txd_accepted~q\) # (!\ac|txd_request~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|Equal0~4_combout\,
	datab => \ac|state[2]~10_combout\,
	datac => \ac|txd_request~q\,
	datad => \ac|i2c|txd_accepted~q\,
	combout => \ac|current_config.volume[6]~2_combout\);

-- Location: FF_X6_Y35_N23
\ac|current_config.volume[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \ac|desired_config.volume\(1),
	sload => VCC,
	ena => \ac|current_config.volume[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|current_config.volume\(1));

-- Location: LCCOMB_X6_Y35_N24
\ac|current_config.volume[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|current_config.volume[0]~3_combout\ = !\ac|desired_config.volume\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ac|desired_config.volume\(0),
	combout => \ac|current_config.volume[0]~3_combout\);

-- Location: FF_X6_Y35_N25
\ac|current_config.volume[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|current_config.volume[0]~3_combout\,
	ena => \ac|current_config.volume[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|current_config.volume\(0));

-- Location: LCCOMB_X6_Y35_N22
\ac|state[2]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|state[2]~6_combout\ = (\ac|desired_config.volume\(1) & (\ac|current_config.volume\(1) & (\ac|desired_config.volume\(0) $ (\ac|current_config.volume\(0))))) # (!\ac|desired_config.volume\(1) & (!\ac|current_config.volume\(1) & 
-- (\ac|desired_config.volume\(0) $ (\ac|current_config.volume\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000110000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|desired_config.volume\(1),
	datab => \ac|desired_config.volume\(0),
	datac => \ac|current_config.volume\(1),
	datad => \ac|current_config.volume\(0),
	combout => \ac|state[2]~6_combout\);

-- Location: LCCOMB_X6_Y34_N30
\ac|desired_config~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|desired_config~3_combout\ = (\vol|s_sound\(2)) # ((!\vol|s_sound\(6) & ((!\vol|s_sound\(4)) # (!\vol|s_sound\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vol|s_sound\(5),
	datab => \vol|s_sound\(6),
	datac => \vol|s_sound\(2),
	datad => \vol|s_sound\(4),
	combout => \ac|desired_config~3_combout\);

-- Location: FF_X6_Y34_N31
\ac|desired_config.volume[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|desired_config~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|desired_config.volume\(2));

-- Location: LCCOMB_X7_Y35_N30
\ac|current_config.volume[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|current_config.volume[2]~4_combout\ = !\ac|desired_config.volume\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ac|desired_config.volume\(2),
	combout => \ac|current_config.volume[2]~4_combout\);

-- Location: FF_X7_Y35_N31
\ac|current_config.volume[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|current_config.volume[2]~4_combout\,
	ena => \ac|current_config.volume[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|current_config.volume\(2));

-- Location: LCCOMB_X6_Y34_N12
\ac|desired_config~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|desired_config~2_combout\ = (\vol|s_sound\(3)) # ((!\vol|s_sound\(6) & ((!\vol|s_sound\(5)) # (!\vol|s_sound\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vol|s_sound\(4),
	datab => \vol|s_sound\(6),
	datac => \vol|s_sound\(3),
	datad => \vol|s_sound\(5),
	combout => \ac|desired_config~2_combout\);

-- Location: FF_X6_Y34_N13
\ac|desired_config.volume[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|desired_config~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|desired_config.volume\(3));

-- Location: FF_X7_Y35_N25
\ac|current_config.volume[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \ac|desired_config.volume\(3),
	sload => VCC,
	ena => \ac|current_config.volume[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|current_config.volume\(3));

-- Location: LCCOMB_X7_Y35_N24
\ac|state[2]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|state[2]~7_combout\ = (\ac|current_config.volume\(2) & (!\ac|desired_config.volume\(2) & (\ac|desired_config.volume\(3) $ (!\ac|current_config.volume\(3))))) # (!\ac|current_config.volume\(2) & (\ac|desired_config.volume\(2) & 
-- (\ac|desired_config.volume\(3) $ (!\ac|current_config.volume\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000110000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|current_config.volume\(2),
	datab => \ac|desired_config.volume\(3),
	datac => \ac|current_config.volume\(3),
	datad => \ac|desired_config.volume\(2),
	combout => \ac|state[2]~7_combout\);

-- Location: FF_X6_Y35_N9
\ac|desired_config.volume[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \vol|s_sound\(6),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|desired_config.volume\(6));

-- Location: LCCOMB_X6_Y35_N12
\ac|current_config.volume[6]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|current_config.volume[6]~6_combout\ = !\ac|desired_config.volume\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ac|desired_config.volume\(6),
	combout => \ac|current_config.volume[6]~6_combout\);

-- Location: FF_X6_Y35_N13
\ac|current_config.volume[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|current_config.volume[6]~6_combout\,
	ena => \ac|current_config.volume[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|current_config.volume\(6));

-- Location: LCCOMB_X6_Y35_N30
\ac|desired_config~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|desired_config~4_combout\ = (\vol|s_sound\(4) & ((\vol|s_sound\(5)) # (\vol|s_sound\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \vol|s_sound\(5),
	datab => \vol|s_sound\(4),
	datac => \vol|s_sound\(6),
	combout => \ac|desired_config~4_combout\);

-- Location: FF_X6_Y35_N31
\ac|desired_config.volume[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|desired_config~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|desired_config.volume\(4));

-- Location: LCCOMB_X6_Y35_N4
\ac|desired_config~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|desired_config~5_combout\ = (\vol|s_sound\(5)) # (!\vol|s_sound\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \vol|s_sound\(5),
	datad => \vol|s_sound\(6),
	combout => \ac|desired_config~5_combout\);

-- Location: FF_X6_Y35_N5
\ac|desired_config.volume[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|desired_config~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|desired_config.volume\(5));

-- Location: LCCOMB_X6_Y35_N28
\ac|current_config.volume[5]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|current_config.volume[5]~5_combout\ = !\ac|desired_config.volume\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ac|desired_config.volume\(5),
	combout => \ac|current_config.volume[5]~5_combout\);

-- Location: FF_X6_Y35_N29
\ac|current_config.volume[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|current_config.volume[5]~5_combout\,
	ena => \ac|current_config.volume[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|current_config.volume\(5));

-- Location: FF_X6_Y35_N17
\ac|current_config.volume[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \ac|desired_config.volume\(4),
	sload => VCC,
	ena => \ac|current_config.volume[6]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|current_config.volume\(4));

-- Location: LCCOMB_X6_Y35_N16
\ac|state[2]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|state[2]~8_combout\ = (\ac|desired_config.volume\(4) & (\ac|current_config.volume\(4) & (\ac|current_config.volume\(5) $ (\ac|desired_config.volume\(5))))) # (!\ac|desired_config.volume\(4) & (!\ac|current_config.volume\(4) & 
-- (\ac|current_config.volume\(5) $ (\ac|desired_config.volume\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000110000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|desired_config.volume\(4),
	datab => \ac|current_config.volume\(5),
	datac => \ac|current_config.volume\(4),
	datad => \ac|desired_config.volume\(5),
	combout => \ac|state[2]~8_combout\);

-- Location: LCCOMB_X9_Y35_N26
\ac|current_config.line_in_gain[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|current_config.line_in_gain[0]~0_combout\ = (\ac|current_config.line_in_gain\(0)) # ((!\ac|Equal0~4_combout\ & (!\ac|process_1~0_combout\ & !\ac|txd_request~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|Equal0~4_combout\,
	datab => \ac|process_1~0_combout\,
	datac => \ac|current_config.line_in_gain\(0),
	datad => \ac|txd_request~1_combout\,
	combout => \ac|current_config.line_in_gain[0]~0_combout\);

-- Location: FF_X9_Y35_N27
\ac|current_config.line_in_gain[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|current_config.line_in_gain[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|current_config.line_in_gain\(0));

-- Location: LCCOMB_X6_Y35_N8
\ac|state[2]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|state[2]~9_combout\ = (\ac|state[2]~8_combout\ & (\ac|current_config.line_in_gain\(0) & (\ac|current_config.volume\(6) $ (\ac|desired_config.volume\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|current_config.volume\(6),
	datab => \ac|state[2]~8_combout\,
	datac => \ac|desired_config.volume\(6),
	datad => \ac|current_config.line_in_gain\(0),
	combout => \ac|state[2]~9_combout\);

-- Location: LCCOMB_X6_Y35_N20
\ac|state[2]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|state[2]~10_combout\ = (\ac|txd_request~1_combout\) # ((\ac|state[2]~6_combout\ & (\ac|state[2]~7_combout\ & \ac|state[2]~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|state[2]~6_combout\,
	datab => \ac|state[2]~7_combout\,
	datac => \ac|state[2]~9_combout\,
	datad => \ac|txd_request~1_combout\,
	combout => \ac|state[2]~10_combout\);

-- Location: LCCOMB_X9_Y35_N20
\ac|state[0]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|state[0]~14_combout\ = (!\ac|Equal0~4_combout\ & (((\ac|txd_request~q\ & \ac|i2c|txd_accepted~q\)) # (!\ac|state[2]~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|Equal0~4_combout\,
	datab => \ac|state[2]~10_combout\,
	datac => \ac|txd_request~q\,
	datad => \ac|i2c|txd_accepted~q\,
	combout => \ac|state[0]~14_combout\);

-- Location: LCCOMB_X9_Y35_N30
\ac|state[0]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|state[0]~11_combout\ = (\ac|state[0]~14_combout\ & ((\ac|process_1~0_combout\ & (!\ac|state\(0))) # (!\ac|process_1~0_combout\ & ((!\ac|current_config.line_in_gain\(0)))))) # (!\ac|state[0]~14_combout\ & (((\ac|state\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011100001111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|process_1~0_combout\,
	datab => \ac|state[0]~14_combout\,
	datac => \ac|state\(0),
	datad => \ac|current_config.line_in_gain\(0),
	combout => \ac|state[0]~11_combout\);

-- Location: FF_X9_Y35_N31
\ac|state[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|state[0]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|state\(0));

-- Location: LCCOMB_X9_Y35_N2
\ac|state~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|state~13_combout\ = (\ac|process_1~0_combout\ & (\ac|state\(0) $ ((\ac|state\(1))))) # (!\ac|process_1~0_combout\ & (((!\ac|current_config.line_in_gain\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100001111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|state\(0),
	datab => \ac|process_1~0_combout\,
	datac => \ac|state\(1),
	datad => \ac|current_config.line_in_gain\(0),
	combout => \ac|state~13_combout\);

-- Location: FF_X9_Y35_N3
\ac|state[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|state~13_combout\,
	ena => \ac|state[0]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|state\(1));

-- Location: LCCOMB_X9_Y35_N22
\ac|Add1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Add1~1_combout\ = \ac|state\(2) $ (((\ac|state\(1) & \ac|state\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|state\(2),
	datab => \ac|state\(1),
	datac => \ac|state\(0),
	combout => \ac|Add1~1_combout\);

-- Location: LCCOMB_X9_Y35_N24
\ac|state~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|state~16_combout\ = (\ac|txd_request~q\ & ((\ac|i2c|txd_accepted~q\ & (\ac|Add1~1_combout\)) # (!\ac|i2c|txd_accepted~q\ & ((!\ac|current_config.line_in_gain\(0)))))) # (!\ac|txd_request~q\ & (((!\ac|current_config.line_in_gain\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|Add1~1_combout\,
	datab => \ac|current_config.line_in_gain\(0),
	datac => \ac|txd_request~q\,
	datad => \ac|i2c|txd_accepted~q\,
	combout => \ac|state~16_combout\);

-- Location: FF_X9_Y35_N25
\ac|state[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|state~16_combout\,
	ena => \ac|state[0]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|state\(2));

-- Location: LCCOMB_X9_Y35_N12
\ac|Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Add1~0_combout\ = \ac|state\(3) $ (((\ac|state\(2) & (\ac|state\(1) & \ac|state\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|state\(2),
	datab => \ac|state\(1),
	datac => \ac|state\(0),
	datad => \ac|state\(3),
	combout => \ac|Add1~0_combout\);

-- Location: LCCOMB_X9_Y35_N18
\ac|state[3]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|state[3]~15_combout\ = (\ac|txd_request~q\ & ((\ac|i2c|txd_accepted~q\ & (\ac|Add1~0_combout\)) # (!\ac|i2c|txd_accepted~q\ & ((\ac|current_config.line_in_gain\(0)))))) # (!\ac|txd_request~q\ & (((\ac|current_config.line_in_gain\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|Add1~0_combout\,
	datab => \ac|current_config.line_in_gain\(0),
	datac => \ac|txd_request~q\,
	datad => \ac|i2c|txd_accepted~q\,
	combout => \ac|state[3]~15_combout\);

-- Location: LCCOMB_X9_Y35_N28
\ac|state[3]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|state[3]~12_combout\ = (\ac|state[0]~14_combout\ & (\ac|state[3]~15_combout\)) # (!\ac|state[0]~14_combout\ & ((\ac|state\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|state[3]~15_combout\,
	datac => \ac|state\(3),
	datad => \ac|state[0]~14_combout\,
	combout => \ac|state[3]~12_combout\);

-- Location: FF_X9_Y35_N29
\ac|state[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|state[3]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|state\(3));

-- Location: LCCOMB_X9_Y35_N10
\ac|txd_request~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|txd_request~1_combout\ = (!\ac|state\(3)) # (!\ac|state\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ac|state\(0),
	datad => \ac|state\(3),
	combout => \ac|txd_request~1_combout\);

-- Location: LCCOMB_X9_Y35_N4
\ac|txd_request~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|txd_request~0_combout\ = (\ac|txd_request~q\ & (!\ac|i2c|txd_accepted~q\)) # (!\ac|txd_request~q\ & ((\ac|txd_request~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|txd_accepted~q\,
	datac => \ac|txd_request~q\,
	datad => \ac|txd_request~1_combout\,
	combout => \ac|txd_request~0_combout\);

-- Location: FF_X9_Y35_N5
\ac|txd_request\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|txd_request~0_combout\,
	asdata => \ac|txd_request~q\,
	sload => \ac|Equal0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|txd_request~q\);

-- Location: LCCOMB_X13_Y36_N14
\ac|i2c|counter[1]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|counter[1]~9_combout\ = (\ac|i2c|state.idle~q\) # (\ac|txd_request~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ac|i2c|state.idle~q\,
	datad => \ac|txd_request~q\,
	combout => \ac|i2c|counter[1]~9_combout\);

-- Location: FF_X13_Y37_N11
\ac|i2c|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|counter[0]~6_combout\,
	sclr => \ac|i2c|counter[1]~8_combout\,
	ena => \ac|i2c|counter[1]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|counter\(0));

-- Location: LCCOMB_X13_Y37_N12
\ac|i2c|counter[1]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|counter[1]~10_combout\ = (\ac|i2c|counter\(1) & (!\ac|i2c|counter[0]~7\)) # (!\ac|i2c|counter\(1) & ((\ac|i2c|counter[0]~7\) # (GND)))
-- \ac|i2c|counter[1]~11\ = CARRY((!\ac|i2c|counter[0]~7\) # (!\ac|i2c|counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|counter\(1),
	datad => VCC,
	cin => \ac|i2c|counter[0]~7\,
	combout => \ac|i2c|counter[1]~10_combout\,
	cout => \ac|i2c|counter[1]~11\);

-- Location: FF_X13_Y37_N13
\ac|i2c|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|counter[1]~10_combout\,
	sclr => \ac|i2c|counter[1]~8_combout\,
	ena => \ac|i2c|counter[1]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|counter\(1));

-- Location: LCCOMB_X13_Y37_N14
\ac|i2c|counter[2]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|counter[2]~12_combout\ = (\ac|i2c|counter\(2) & (\ac|i2c|counter[1]~11\ $ (GND))) # (!\ac|i2c|counter\(2) & (!\ac|i2c|counter[1]~11\ & VCC))
-- \ac|i2c|counter[2]~13\ = CARRY((\ac|i2c|counter\(2) & !\ac|i2c|counter[1]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|counter\(2),
	datad => VCC,
	cin => \ac|i2c|counter[1]~11\,
	combout => \ac|i2c|counter[2]~12_combout\,
	cout => \ac|i2c|counter[2]~13\);

-- Location: FF_X13_Y37_N15
\ac|i2c|counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|counter[2]~12_combout\,
	sclr => \ac|i2c|counter[1]~8_combout\,
	ena => \ac|i2c|counter[1]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|counter\(2));

-- Location: LCCOMB_X13_Y37_N16
\ac|i2c|counter[3]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|counter[3]~14_combout\ = (\ac|i2c|counter\(3) & (!\ac|i2c|counter[2]~13\)) # (!\ac|i2c|counter\(3) & ((\ac|i2c|counter[2]~13\) # (GND)))
-- \ac|i2c|counter[3]~15\ = CARRY((!\ac|i2c|counter[2]~13\) # (!\ac|i2c|counter\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|counter\(3),
	datad => VCC,
	cin => \ac|i2c|counter[2]~13\,
	combout => \ac|i2c|counter[3]~14_combout\,
	cout => \ac|i2c|counter[3]~15\);

-- Location: FF_X13_Y37_N17
\ac|i2c|counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|counter[3]~14_combout\,
	sclr => \ac|i2c|counter[1]~8_combout\,
	ena => \ac|i2c|counter[1]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|counter\(3));

-- Location: LCCOMB_X13_Y37_N18
\ac|i2c|counter[4]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|counter[4]~16_combout\ = (\ac|i2c|counter\(4) & (\ac|i2c|counter[3]~15\ $ (GND))) # (!\ac|i2c|counter\(4) & (!\ac|i2c|counter[3]~15\ & VCC))
-- \ac|i2c|counter[4]~17\ = CARRY((\ac|i2c|counter\(4) & !\ac|i2c|counter[3]~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|counter\(4),
	datad => VCC,
	cin => \ac|i2c|counter[3]~15\,
	combout => \ac|i2c|counter[4]~16_combout\,
	cout => \ac|i2c|counter[4]~17\);

-- Location: FF_X13_Y37_N19
\ac|i2c|counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|counter[4]~16_combout\,
	sclr => \ac|i2c|counter[1]~8_combout\,
	ena => \ac|i2c|counter[1]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|counter\(4));

-- Location: LCCOMB_X13_Y37_N28
\ac|i2c|process_1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|process_1~3_combout\ = (!\ac|i2c|counter\(3) & (!\ac|i2c|counter\(2) & !\ac|i2c|counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|counter\(3),
	datac => \ac|i2c|counter\(2),
	datad => \ac|i2c|counter\(1),
	combout => \ac|i2c|process_1~3_combout\);

-- Location: LCCOMB_X13_Y37_N20
\ac|i2c|counter[5]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|counter[5]~18_combout\ = \ac|i2c|counter\(5) $ (\ac|i2c|counter[4]~17\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|counter\(5),
	cin => \ac|i2c|counter[4]~17\,
	combout => \ac|i2c|counter[5]~18_combout\);

-- Location: FF_X13_Y37_N21
\ac|i2c|counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|counter[5]~18_combout\,
	sclr => \ac|i2c|counter[1]~8_combout\,
	ena => \ac|i2c|counter[1]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|counter\(5));

-- Location: LCCOMB_X13_Y37_N26
\ac|i2c|Equal2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|Equal2~0_combout\ = (((!\ac|i2c|counter\(5)) # (!\ac|i2c|process_1~3_combout\)) # (!\ac|i2c|counter\(4))) # (!\ac|i2c|counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|counter\(0),
	datab => \ac|i2c|counter\(4),
	datac => \ac|i2c|process_1~3_combout\,
	datad => \ac|i2c|counter\(5),
	combout => \ac|i2c|Equal2~0_combout\);

-- Location: LCCOMB_X13_Y36_N0
\ac|i2c|phase~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|phase~4_combout\ = (\ac|i2c|state.idle~q\ & (!\ac|i2c|Equal2~0_combout\)) # (!\ac|i2c|state.idle~q\ & ((\ac|txd_request~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|state.idle~q\,
	datac => \ac|i2c|Equal2~0_combout\,
	datad => \ac|txd_request~q\,
	combout => \ac|i2c|phase~4_combout\);

-- Location: FF_X12_Y36_N1
\ac|i2c|phase[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|phase~2_combout\,
	ena => \ac|i2c|phase~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|phase\(0));

-- Location: LCCOMB_X13_Y36_N18
\ac|i2c|n_bits[0]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|n_bits[0]~7_combout\ = \ac|i2c|n_bits\(0) $ (VCC)
-- \ac|i2c|n_bits[0]~8\ = CARRY(\ac|i2c|n_bits\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|n_bits\(0),
	datad => VCC,
	combout => \ac|i2c|n_bits[0]~7_combout\,
	cout => \ac|i2c|n_bits[0]~8\);

-- Location: LCCOMB_X12_Y36_N28
\ac|i2c|i2c_sclk~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|i2c_sclk~3_combout\ = (\ac|i2c|phase\(1) & \ac|i2c|phase\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|phase\(1),
	datad => \ac|i2c|phase\(0),
	combout => \ac|i2c|i2c_sclk~3_combout\);

-- Location: LCCOMB_X13_Y36_N6
\ac|i2c|state~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|state~12_combout\ = (\ac|i2c|state.idle~q\ & (((!\ac|i2c|Equal2~0_combout\ & \ac|i2c|i2c_sclk~3_combout\)))) # (!\ac|i2c|state.idle~q\ & (\ac|txd_request~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|state.idle~q\,
	datab => \ac|txd_request~q\,
	datac => \ac|i2c|Equal2~0_combout\,
	datad => \ac|i2c|i2c_sclk~3_combout\,
	combout => \ac|i2c|state~12_combout\);

-- Location: LCCOMB_X13_Y36_N24
\ac|i2c|n_bits[3]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|n_bits[3]~13_combout\ = (\ac|i2c|n_bits\(3) & (\ac|i2c|n_bits[2]~12\ & VCC)) # (!\ac|i2c|n_bits\(3) & (!\ac|i2c|n_bits[2]~12\))
-- \ac|i2c|n_bits[3]~14\ = CARRY((!\ac|i2c|n_bits\(3) & !\ac|i2c|n_bits[2]~12\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|n_bits\(3),
	datad => VCC,
	cin => \ac|i2c|n_bits[2]~12\,
	combout => \ac|i2c|n_bits[3]~13_combout\,
	cout => \ac|i2c|n_bits[3]~14\);

-- Location: LCCOMB_X13_Y36_N26
\ac|i2c|n_bits[4]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|n_bits[4]~15_combout\ = \ac|i2c|n_bits\(4) $ (\ac|i2c|n_bits[3]~14\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|n_bits\(4),
	cin => \ac|i2c|n_bits[3]~14\,
	combout => \ac|i2c|n_bits[4]~15_combout\);

-- Location: FF_X13_Y36_N27
\ac|i2c|n_bits[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|n_bits[4]~15_combout\,
	asdata => VCC,
	sload => \ac|i2c|ALT_INV_state.idle~q\,
	ena => \ac|i2c|n_bits~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|n_bits\(4));

-- Location: LCCOMB_X13_Y36_N28
\ac|i2c|Equal3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|Equal3~0_combout\ = (\ac|i2c|n_bits\(3)) # (((\ac|i2c|n_bits\(2)) # (\ac|i2c|n_bits\(1))) # (!\ac|i2c|n_bits\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|n_bits\(3),
	datab => \ac|i2c|n_bits\(0),
	datac => \ac|i2c|n_bits\(2),
	datad => \ac|i2c|n_bits\(1),
	combout => \ac|i2c|Equal3~0_combout\);

-- Location: LCCOMB_X13_Y36_N10
\ac|i2c|state~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|state~21_combout\ = (\ac|i2c|state~12_combout\ & (((!\ac|i2c|n_bits\(4) & !\ac|i2c|Equal3~0_combout\)) # (!\ac|i2c|n_bits~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|state~12_combout\,
	datab => \ac|i2c|n_bits~5_combout\,
	datac => \ac|i2c|n_bits\(4),
	datad => \ac|i2c|Equal3~0_combout\,
	combout => \ac|i2c|state~21_combout\);

-- Location: LCCOMB_X12_Y36_N12
\ac|i2c|state~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|state~15_combout\ = (!\ac|i2c|process_1~6_combout\ & ((\ac|i2c|state~21_combout\ & (\ac|i2c|n_bits~5_combout\)) # (!\ac|i2c|state~21_combout\ & ((\ac|i2c|state.stop_condition~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|n_bits~5_combout\,
	datab => \ac|i2c|state.stop_condition~q\,
	datac => \ac|i2c|state~21_combout\,
	datad => \ac|i2c|process_1~6_combout\,
	combout => \ac|i2c|state~15_combout\);

-- Location: LCCOMB_X12_Y36_N22
\ac|i2c|state~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|state~17_combout\ = (!\ac|i2c|process_1~6_combout\ & ((\ac|i2c|state~21_combout\ & (!\ac|i2c|state.idle~q\)) # (!\ac|i2c|state~21_combout\ & ((\ac|i2c|state.start_condition~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|process_1~6_combout\,
	datab => \ac|i2c|state.idle~q\,
	datac => \ac|i2c|state~21_combout\,
	datad => \ac|i2c|state.start_condition~q\,
	combout => \ac|i2c|state~17_combout\);

-- Location: LCCOMB_X12_Y36_N18
\ac|i2c|state~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|state~18_combout\ = (\ac|i2c|state.idle~0_combout\ & \ac|i2c|state~17_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|state.idle~0_combout\,
	datac => \ac|i2c|state~17_combout\,
	combout => \ac|i2c|state~18_combout\);

-- Location: FF_X12_Y36_N19
\ac|i2c|state.start_condition\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|state~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|state.start_condition~q\);

-- Location: LCCOMB_X12_Y36_N30
\ac|i2c|state~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|state~13_combout\ = (!\ac|i2c|process_1~6_combout\ & ((\ac|i2c|state~21_combout\ & ((\ac|i2c|state.start_condition~q\))) # (!\ac|i2c|state~21_combout\ & (\ac|i2c|state.in_progress~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|process_1~6_combout\,
	datab => \ac|i2c|state.in_progress~q\,
	datac => \ac|i2c|state~21_combout\,
	datad => \ac|i2c|state.start_condition~q\,
	combout => \ac|i2c|state~13_combout\);

-- Location: LCCOMB_X11_Y36_N16
\ac|i2c|state~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|state~14_combout\ = (\ac|i2c|state~13_combout\ & \ac|i2c|state.idle~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ac|i2c|state~13_combout\,
	datad => \ac|i2c|state.idle~0_combout\,
	combout => \ac|i2c|state~14_combout\);

-- Location: FF_X12_Y36_N29
\ac|i2c|state.in_progress\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \ac|i2c|state~14_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|state.in_progress~q\);

-- Location: LCCOMB_X12_Y36_N24
\ac|i2c|state.idle~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|state.idle~0_combout\ = (\ac|i2c|state.stop_condition~q\ & (\ac|i2c|state.idle~q\ & (!\ac|i2c|state.start_condition~q\ & !\ac|i2c|state.in_progress~q\))) # (!\ac|i2c|state.stop_condition~q\ & ((\ac|i2c|state.idle~q\ & 
-- (\ac|i2c|state.start_condition~q\ $ (\ac|i2c|state.in_progress~q\))) # (!\ac|i2c|state.idle~q\ & (!\ac|i2c|state.start_condition~q\ & !\ac|i2c|state.in_progress~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010001001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|state.stop_condition~q\,
	datab => \ac|i2c|state.idle~q\,
	datac => \ac|i2c|state.start_condition~q\,
	datad => \ac|i2c|state.in_progress~q\,
	combout => \ac|i2c|state.idle~0_combout\);

-- Location: LCCOMB_X12_Y36_N10
\ac|i2c|state~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|state~16_combout\ = (\ac|i2c|state~15_combout\ & \ac|i2c|state.idle~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|state~15_combout\,
	datac => \ac|i2c|state.idle~0_combout\,
	combout => \ac|i2c|state~16_combout\);

-- Location: FF_X12_Y36_N11
\ac|i2c|state.stop_condition\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|state~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|state.stop_condition~q\);

-- Location: LCCOMB_X12_Y36_N6
\ac|i2c|n_bits~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|n_bits~5_combout\ = (!\ac|i2c|state.stop_condition~q\ & (\ac|i2c|state.idle~q\ & !\ac|i2c|state.start_condition~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|state.stop_condition~q\,
	datab => \ac|i2c|state.idle~q\,
	datad => \ac|i2c|state.start_condition~q\,
	combout => \ac|i2c|n_bits~5_combout\);

-- Location: LCCOMB_X13_Y36_N4
\ac|i2c|n_bits~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|n_bits~6_combout\ = (\ac|i2c|txd_accepted~0_combout\) # ((!\ac|i2c|Equal2~0_combout\ & (\ac|i2c|n_bits~5_combout\ & \ac|i2c|i2c_sclk~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|txd_accepted~0_combout\,
	datab => \ac|i2c|Equal2~0_combout\,
	datac => \ac|i2c|n_bits~5_combout\,
	datad => \ac|i2c|i2c_sclk~3_combout\,
	combout => \ac|i2c|n_bits~6_combout\);

-- Location: FF_X13_Y36_N19
\ac|i2c|n_bits[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|n_bits[0]~7_combout\,
	asdata => VCC,
	sload => \ac|i2c|ALT_INV_state.idle~q\,
	ena => \ac|i2c|n_bits~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|n_bits\(0));

-- Location: LCCOMB_X13_Y36_N20
\ac|i2c|n_bits[1]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|n_bits[1]~9_combout\ = (\ac|i2c|n_bits\(1) & (\ac|i2c|n_bits[0]~8\ & VCC)) # (!\ac|i2c|n_bits\(1) & (!\ac|i2c|n_bits[0]~8\))
-- \ac|i2c|n_bits[1]~10\ = CARRY((!\ac|i2c|n_bits\(1) & !\ac|i2c|n_bits[0]~8\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|n_bits\(1),
	datad => VCC,
	cin => \ac|i2c|n_bits[0]~8\,
	combout => \ac|i2c|n_bits[1]~9_combout\,
	cout => \ac|i2c|n_bits[1]~10\);

-- Location: FF_X13_Y36_N21
\ac|i2c|n_bits[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|n_bits[1]~9_combout\,
	asdata => VCC,
	sload => \ac|i2c|ALT_INV_state.idle~q\,
	ena => \ac|i2c|n_bits~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|n_bits\(1));

-- Location: LCCOMB_X13_Y36_N22
\ac|i2c|n_bits[2]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|n_bits[2]~11_combout\ = (\ac|i2c|n_bits\(2) & ((GND) # (!\ac|i2c|n_bits[1]~10\))) # (!\ac|i2c|n_bits\(2) & (\ac|i2c|n_bits[1]~10\ $ (GND)))
-- \ac|i2c|n_bits[2]~12\ = CARRY((\ac|i2c|n_bits\(2)) # (!\ac|i2c|n_bits[1]~10\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|n_bits\(2),
	datad => VCC,
	cin => \ac|i2c|n_bits[1]~10\,
	combout => \ac|i2c|n_bits[2]~11_combout\,
	cout => \ac|i2c|n_bits[2]~12\);

-- Location: LCCOMB_X13_Y36_N30
\~GND\ : cycloneive_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

-- Location: FF_X13_Y36_N23
\ac|i2c|n_bits[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|n_bits[2]~11_combout\,
	asdata => \~GND~combout\,
	sload => \ac|i2c|ALT_INV_state.idle~q\,
	ena => \ac|i2c|n_bits~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|n_bits\(2));

-- Location: FF_X13_Y36_N25
\ac|i2c|n_bits[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|n_bits[3]~13_combout\,
	asdata => VCC,
	sload => \ac|i2c|ALT_INV_state.idle~q\,
	ena => \ac|i2c|n_bits~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|n_bits\(3));

-- Location: LCCOMB_X13_Y36_N8
\ac|i2c|process_1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|process_1~2_combout\ = (\ac|i2c|n_bits\(3) & (!\ac|i2c|n_bits\(0) & (!\ac|i2c|n_bits\(4) & \ac|i2c|n_bits\(1)))) # (!\ac|i2c|n_bits\(3) & (\ac|i2c|n_bits\(0) & (\ac|i2c|n_bits\(4) $ (!\ac|i2c|n_bits\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100001000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|n_bits\(3),
	datab => \ac|i2c|n_bits\(0),
	datac => \ac|i2c|n_bits\(4),
	datad => \ac|i2c|n_bits\(1),
	combout => \ac|i2c|process_1~2_combout\);

-- Location: LCCOMB_X13_Y36_N16
\ac|i2c|process_1~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|process_1~7_combout\ = (\ac|i2c|process_1~2_combout\ & !\ac|i2c|n_bits\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|process_1~2_combout\,
	datac => \ac|i2c|n_bits\(2),
	combout => \ac|i2c|process_1~7_combout\);

-- Location: IOIBUF_X18_Y73_N22
\i2c_sdat~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => i2c_sdat,
	o => \i2c_sdat~input_o\);

-- Location: FF_X12_Y36_N17
\ac|i2c|sampled_sdat\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \i2c_sdat~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|sampled_sdat~q\);

-- Location: LCCOMB_X12_Y36_N16
\ac|i2c|process_1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|process_1~4_combout\ = (\ac|i2c|phase\(1) & (\ac|i2c|state.in_progress~q\ & (\ac|i2c|sampled_sdat~q\ & !\ac|i2c|counter\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|phase\(1),
	datab => \ac|i2c|state.in_progress~q\,
	datac => \ac|i2c|sampled_sdat~q\,
	datad => \ac|i2c|counter\(0),
	combout => \ac|i2c|process_1~4_combout\);

-- Location: LCCOMB_X13_Y37_N24
\ac|i2c|process_1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|process_1~5_combout\ = (!\ac|i2c|counter\(5) & (\ac|i2c|process_1~4_combout\ & !\ac|i2c|counter\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|counter\(5),
	datac => \ac|i2c|process_1~4_combout\,
	datad => \ac|i2c|counter\(4),
	combout => \ac|i2c|process_1~5_combout\);

-- Location: LCCOMB_X13_Y36_N2
\ac|i2c|process_1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|process_1~6_combout\ = (!\ac|i2c|phase\(0) & (\ac|i2c|process_1~7_combout\ & (\ac|i2c|process_1~5_combout\ & \ac|i2c|process_1~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|phase\(0),
	datab => \ac|i2c|process_1~7_combout\,
	datac => \ac|i2c|process_1~5_combout\,
	datad => \ac|i2c|process_1~3_combout\,
	combout => \ac|i2c|process_1~6_combout\);

-- Location: LCCOMB_X12_Y36_N20
\ac|i2c|state~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|state~19_combout\ = (\ac|i2c|process_1~6_combout\) # ((\ac|i2c|state~21_combout\ & (\ac|i2c|state.stop_condition~q\)) # (!\ac|i2c|state~21_combout\ & ((!\ac|i2c|state.idle~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|process_1~6_combout\,
	datab => \ac|i2c|state~21_combout\,
	datac => \ac|i2c|state.stop_condition~q\,
	datad => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|state~19_combout\);

-- Location: LCCOMB_X11_Y36_N18
\ac|i2c|state~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|state~20_combout\ = (!\ac|i2c|state~19_combout\ & \ac|i2c|state.idle~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ac|i2c|state~19_combout\,
	datad => \ac|i2c|state.idle~0_combout\,
	combout => \ac|i2c|state~20_combout\);

-- Location: FF_X11_Y36_N19
\ac|i2c|state.idle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|state~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|state.idle~q\);

-- Location: LCCOMB_X12_Y36_N26
\ac|i2c|phase~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|phase~3_combout\ = (\ac|i2c|state.idle~q\ & (\ac|i2c|phase\(1) $ (\ac|i2c|phase\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|state.idle~q\,
	datac => \ac|i2c|phase\(1),
	datad => \ac|i2c|phase\(0),
	combout => \ac|i2c|phase~3_combout\);

-- Location: FF_X12_Y36_N27
\ac|i2c|phase[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|phase~3_combout\,
	ena => \ac|i2c|phase~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|phase\(1));

-- Location: LCCOMB_X12_Y36_N8
\ac|i2c|i2c_sclk~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|i2c_sclk~4_combout\ = (\ac|i2c|state.stop_condition~q\ & (((!\ac|i2c|phase\(1) & !\ac|i2c|phase\(0))))) # (!\ac|i2c|state.stop_condition~q\ & (\ac|i2c|state.in_progress~q\ & (\ac|i2c|phase\(1) $ (!\ac|i2c|phase\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|state.stop_condition~q\,
	datab => \ac|i2c|state.in_progress~q\,
	datac => \ac|i2c|phase\(1),
	datad => \ac|i2c|phase\(0),
	combout => \ac|i2c|i2c_sclk~4_combout\);

-- Location: LCCOMB_X12_Y36_N14
\ac|i2c|i2c_sclk~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|i2c_sclk~5_combout\ = (\ac|i2c|state.start_condition~q\ & (((!\ac|i2c|phase\(0))) # (!\ac|i2c|phase\(1)))) # (!\ac|i2c|state.start_condition~q\ & (((!\ac|i2c|i2c_sclk~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100011111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|phase\(1),
	datab => \ac|i2c|state.start_condition~q\,
	datac => \ac|i2c|i2c_sclk~4_combout\,
	datad => \ac|i2c|phase\(0),
	combout => \ac|i2c|i2c_sclk~5_combout\);

-- Location: LCCOMB_X7_Y35_N0
\ac|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux0~0_combout\ = (!\ac|state\(3) & ((\ac|state\(0) & (\ac|state\(1) $ (\ac|state\(2)))) # (!\ac|state\(0) & (!\ac|state\(1) & !\ac|state\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|state\(3),
	datab => \ac|state\(0),
	datac => \ac|state\(1),
	datad => \ac|state\(2),
	combout => \ac|Mux0~0_combout\);

-- Location: LCCOMB_X9_Y35_N6
\ac|txd_data[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|txd_data[1]~2_combout\ = (!\ac|Equal0~4_combout\ & ((!\ac|i2c|txd_accepted~q\) # (!\ac|txd_request~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|Equal0~4_combout\,
	datac => \ac|txd_request~q\,
	datad => \ac|i2c|txd_accepted~q\,
	combout => \ac|txd_data[1]~2_combout\);

-- Location: FF_X7_Y35_N1
\ac|txd_data[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|Mux0~0_combout\,
	ena => \ac|txd_data[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|txd_data\(12));

-- Location: LCCOMB_X7_Y35_N22
\ac|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux1~0_combout\ = (!\ac|state\(3) & (((!\ac|state\(1) & !\ac|state\(2))) # (!\ac|state\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|state\(3),
	datab => \ac|state\(0),
	datac => \ac|state\(1),
	datad => \ac|state\(2),
	combout => \ac|Mux1~0_combout\);

-- Location: FF_X7_Y35_N23
\ac|txd_data[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|Mux1~0_combout\,
	ena => \ac|txd_data[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|txd_data\(11));

-- Location: LCCOMB_X7_Y35_N12
\ac|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux2~0_combout\ = (!\ac|state\(0) & ((!\ac|state\(2)) # (!\ac|state\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|state\(0),
	datac => \ac|state\(1),
	datad => \ac|state\(2),
	combout => \ac|Mux2~0_combout\);

-- Location: FF_X7_Y35_N13
\ac|txd_data[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|Mux2~0_combout\,
	ena => \ac|txd_data[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|txd_data\(10));

-- Location: LCCOMB_X7_Y35_N10
\ac|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux3~0_combout\ = (!\ac|state\(3) & ((\ac|state\(0) & (!\ac|state\(1))) # (!\ac|state\(0) & ((!\ac|state\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|state\(3),
	datab => \ac|state\(0),
	datac => \ac|state\(1),
	datad => \ac|state\(2),
	combout => \ac|Mux3~0_combout\);

-- Location: FF_X7_Y35_N11
\ac|txd_data[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|Mux3~0_combout\,
	ena => \ac|txd_data[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|txd_data\(9));

-- Location: LCCOMB_X7_Y35_N2
\ac|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux5~0_combout\ = (!\ac|state\(0) & \ac|state\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|state\(0),
	datac => \ac|state\(3),
	combout => \ac|Mux5~0_combout\);

-- Location: FF_X7_Y35_N3
\ac|txd_data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|Mux5~0_combout\,
	ena => \ac|txd_data[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|txd_data\(7));

-- Location: LCCOMB_X6_Y35_N0
\ac|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux6~0_combout\ = (!\ac|state\(0) & ((\ac|state\(2)) # ((!\ac|current_config.volume\(6) & \ac|state\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|current_config.volume\(6),
	datab => \ac|state\(3),
	datac => \ac|state\(2),
	datad => \ac|state\(0),
	combout => \ac|Mux6~0_combout\);

-- Location: LCCOMB_X8_Y35_N12
\ac|txd_data[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|txd_data[6]~feeder_combout\ = \ac|Mux6~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|Mux6~0_combout\,
	combout => \ac|txd_data[6]~feeder_combout\);

-- Location: LCCOMB_X7_Y35_N6
\ac|state[2]~_wirecell\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|state[2]~_wirecell_combout\ = !\ac|state\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ac|state\(2),
	combout => \ac|state[2]~_wirecell_combout\);

-- Location: FF_X8_Y35_N13
\ac|txd_data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|txd_data[6]~feeder_combout\,
	asdata => \ac|state[2]~_wirecell_combout\,
	sload => \ac|state\(1),
	ena => \ac|txd_data[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|txd_data\(6));

-- Location: LCCOMB_X6_Y35_N18
\ac|Mux7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux7~0_combout\ = (!\ac|state\(0) & ((\ac|state\(2)) # ((\ac|state\(3) & !\ac|current_config.volume\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|state\(2),
	datab => \ac|state\(3),
	datac => \ac|state\(0),
	datad => \ac|current_config.volume\(5),
	combout => \ac|Mux7~0_combout\);

-- Location: LCCOMB_X7_Y35_N16
\ac|Mux7~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux7~1_combout\ = (!\ac|state\(1) & \ac|Mux7~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ac|state\(1),
	datad => \ac|Mux7~0_combout\,
	combout => \ac|Mux7~1_combout\);

-- Location: FF_X7_Y35_N17
\ac|txd_data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|Mux7~1_combout\,
	ena => \ac|txd_data[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|txd_data\(5));

-- Location: LCCOMB_X7_Y35_N26
\ac|Mux8~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux8~2_combout\ = (\ac|current_config.volume\(4) & (\ac|Mux5~0_combout\ & (!\ac|state\(1) & !\ac|state\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|current_config.volume\(4),
	datab => \ac|Mux5~0_combout\,
	datac => \ac|state\(1),
	datad => \ac|state\(2),
	combout => \ac|Mux8~2_combout\);

-- Location: LCCOMB_X7_Y35_N14
\ac|Mux8~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux8~3_combout\ = (\ac|Mux8~2_combout\) # ((!\ac|state\(3) & (\ac|state\(1) & \ac|state\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|state\(3),
	datab => \ac|state\(1),
	datac => \ac|Mux8~2_combout\,
	datad => \ac|state\(2),
	combout => \ac|Mux8~3_combout\);

-- Location: FF_X7_Y35_N15
\ac|txd_data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|Mux8~3_combout\,
	ena => \ac|txd_data[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|txd_data\(4));

-- Location: LCCOMB_X6_Y35_N10
\ac|Mux11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux11~0_combout\ = (\ac|state\(1) & !\ac|state\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ac|state\(1),
	datad => \ac|state\(3),
	combout => \ac|Mux11~0_combout\);

-- Location: LCCOMB_X6_Y35_N2
\ac|Mux9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux9~0_combout\ = (\ac|state\(2) & (\ac|state\(0) & (\ac|Mux11~0_combout\ & !\ac|current_config.line_in_gain\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|state\(2),
	datab => \ac|state\(0),
	datac => \ac|Mux11~0_combout\,
	datad => \ac|current_config.line_in_gain\(0),
	combout => \ac|Mux9~0_combout\);

-- Location: LCCOMB_X7_Y35_N4
\ac|Mux9~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux9~1_combout\ = (\ac|Mux9~0_combout\) # ((\ac|Mux5~0_combout\ & (!\ac|state\(1) & \ac|current_config.volume\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|Mux9~0_combout\,
	datab => \ac|Mux5~0_combout\,
	datac => \ac|state\(1),
	datad => \ac|current_config.volume\(3),
	combout => \ac|Mux9~1_combout\);

-- Location: FF_X7_Y35_N5
\ac|txd_data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|Mux9~1_combout\,
	ena => \ac|txd_data[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|txd_data\(3));

-- Location: LCCOMB_X7_Y35_N20
\ac|Mux10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux10~0_combout\ = (!\ac|current_config.volume\(2) & (\ac|Mux5~0_combout\ & (!\ac|state\(1) & !\ac|state\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|current_config.volume\(2),
	datab => \ac|Mux5~0_combout\,
	datac => \ac|state\(1),
	datad => \ac|state\(2),
	combout => \ac|Mux10~0_combout\);

-- Location: FF_X7_Y35_N21
\ac|txd_data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|Mux10~0_combout\,
	ena => \ac|txd_data[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|txd_data\(2));

-- Location: LCCOMB_X6_Y35_N14
\ac|Mux12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux12~0_combout\ = (\ac|state\(3) & (((!\ac|state\(1) & !\ac|current_config.volume\(0))))) # (!\ac|state\(3) & (!\ac|state\(2) & (\ac|state\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|state\(2),
	datab => \ac|state\(3),
	datac => \ac|state\(1),
	datad => \ac|current_config.volume\(0),
	combout => \ac|Mux12~0_combout\);

-- Location: LCCOMB_X6_Y35_N6
\ac|Mux12~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux12~1_combout\ = (\ac|state\(2) & (\ac|state\(0) & ((!\ac|current_config.line_in_gain\(0)) # (!\ac|state\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|state\(2),
	datab => \ac|state\(0),
	datac => \ac|state\(1),
	datad => \ac|current_config.line_in_gain\(0),
	combout => \ac|Mux12~1_combout\);

-- Location: LCCOMB_X7_Y35_N28
\ac|Mux12~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux12~2_combout\ = (\ac|Mux12~0_combout\ & (((\ac|Mux12~1_combout\ & !\ac|state\(3))) # (!\ac|state\(0)))) # (!\ac|Mux12~0_combout\ & (\ac|Mux12~1_combout\ & (!\ac|state\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|Mux12~0_combout\,
	datab => \ac|Mux12~1_combout\,
	datac => \ac|state\(3),
	datad => \ac|state\(0),
	combout => \ac|Mux12~2_combout\);

-- Location: FF_X7_Y35_N29
\ac|txd_data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|Mux12~2_combout\,
	ena => \ac|txd_data[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|txd_data\(0));

-- Location: LCCOMB_X8_Y35_N10
\ac|i2c|data_to_write~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~25_combout\ = (\ac|i2c|state.idle~q\) # (\ac|txd_data\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|state.idle~q\,
	datad => \ac|txd_data\(0),
	combout => \ac|i2c|data_to_write~25_combout\);

-- Location: FF_X8_Y35_N11
\ac|i2c|data_to_write[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|data_to_write~25_combout\,
	ena => \ac|i2c|n_bits~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|data_to_write\(1));

-- Location: LCCOMB_X6_Y35_N26
\ac|Mux11~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux11~1_combout\ = (\ac|Mux11~0_combout\ & (((\ac|state\(2) & !\ac|current_config.line_in_gain\(0))) # (!\ac|state\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|state\(2),
	datab => \ac|state\(0),
	datac => \ac|Mux11~0_combout\,
	datad => \ac|current_config.line_in_gain\(0),
	combout => \ac|Mux11~1_combout\);

-- Location: LCCOMB_X7_Y35_N18
\ac|Mux11~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux11~2_combout\ = (\ac|Mux11~1_combout\) # ((\ac|current_config.volume\(1) & (!\ac|state\(1) & \ac|Mux5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|Mux11~1_combout\,
	datab => \ac|current_config.volume\(1),
	datac => \ac|state\(1),
	datad => \ac|Mux5~0_combout\,
	combout => \ac|Mux11~2_combout\);

-- Location: FF_X7_Y35_N19
\ac|txd_data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|Mux11~2_combout\,
	ena => \ac|txd_data[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|txd_data\(1));

-- Location: LCCOMB_X8_Y35_N16
\ac|i2c|data_to_write~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~24_combout\ = (\ac|i2c|state.idle~q\ & (\ac|i2c|data_to_write\(1))) # (!\ac|i2c|state.idle~q\ & ((\ac|txd_data\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|data_to_write\(1),
	datab => \ac|txd_data\(1),
	datad => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|data_to_write~24_combout\);

-- Location: FF_X8_Y35_N17
\ac|i2c|data_to_write[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|data_to_write~24_combout\,
	ena => \ac|i2c|n_bits~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|data_to_write\(2));

-- Location: LCCOMB_X8_Y35_N26
\ac|i2c|data_to_write~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~23_combout\ = (\ac|i2c|state.idle~q\ & ((\ac|i2c|data_to_write\(2)))) # (!\ac|i2c|state.idle~q\ & (\ac|txd_data\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|txd_data\(2),
	datab => \ac|i2c|data_to_write\(2),
	datad => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|data_to_write~23_combout\);

-- Location: FF_X8_Y35_N27
\ac|i2c|data_to_write[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|data_to_write~23_combout\,
	ena => \ac|i2c|n_bits~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|data_to_write\(3));

-- Location: LCCOMB_X8_Y35_N24
\ac|i2c|data_to_write~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~22_combout\ = (\ac|i2c|state.idle~q\ & ((\ac|i2c|data_to_write\(3)))) # (!\ac|i2c|state.idle~q\ & (\ac|txd_data\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|txd_data\(3),
	datac => \ac|i2c|data_to_write\(3),
	datad => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|data_to_write~22_combout\);

-- Location: FF_X8_Y35_N25
\ac|i2c|data_to_write[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|data_to_write~22_combout\,
	ena => \ac|i2c|n_bits~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|data_to_write\(4));

-- Location: LCCOMB_X8_Y35_N2
\ac|i2c|data_to_write~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~21_combout\ = (\ac|i2c|state.idle~q\ & ((\ac|i2c|data_to_write\(4)))) # (!\ac|i2c|state.idle~q\ & (\ac|txd_data\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|txd_data\(4),
	datab => \ac|i2c|data_to_write\(4),
	datad => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|data_to_write~21_combout\);

-- Location: FF_X8_Y35_N3
\ac|i2c|data_to_write[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|data_to_write~21_combout\,
	ena => \ac|i2c|n_bits~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|data_to_write\(5));

-- Location: LCCOMB_X8_Y35_N20
\ac|i2c|data_to_write~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~20_combout\ = (\ac|i2c|state.idle~q\ & ((\ac|i2c|data_to_write\(5)))) # (!\ac|i2c|state.idle~q\ & (\ac|txd_data\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|txd_data\(5),
	datab => \ac|i2c|data_to_write\(5),
	datad => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|data_to_write~20_combout\);

-- Location: FF_X8_Y35_N21
\ac|i2c|data_to_write[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|data_to_write~20_combout\,
	ena => \ac|i2c|n_bits~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|data_to_write\(6));

-- Location: LCCOMB_X8_Y35_N30
\ac|i2c|data_to_write~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~19_combout\ = (\ac|i2c|state.idle~q\ & ((\ac|i2c|data_to_write\(6)))) # (!\ac|i2c|state.idle~q\ & (\ac|txd_data\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|txd_data\(6),
	datab => \ac|i2c|data_to_write\(6),
	datad => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|data_to_write~19_combout\);

-- Location: FF_X8_Y35_N31
\ac|i2c|data_to_write[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|data_to_write~19_combout\,
	ena => \ac|i2c|n_bits~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|data_to_write\(7));

-- Location: LCCOMB_X8_Y35_N0
\ac|i2c|data_to_write~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~18_combout\ = (\ac|i2c|state.idle~q\ & ((\ac|i2c|data_to_write\(7)))) # (!\ac|i2c|state.idle~q\ & (\ac|txd_data\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|txd_data\(7),
	datac => \ac|i2c|data_to_write\(7),
	datad => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|data_to_write~18_combout\);

-- Location: FF_X8_Y35_N1
\ac|i2c|data_to_write[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|data_to_write~18_combout\,
	ena => \ac|i2c|n_bits~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|data_to_write\(8));

-- Location: LCCOMB_X8_Y35_N6
\ac|i2c|data_to_write~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~17_combout\ = (\ac|i2c|data_to_write\(8)) # (!\ac|i2c|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|data_to_write\(8),
	datad => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|data_to_write~17_combout\);

-- Location: FF_X8_Y35_N7
\ac|i2c|data_to_write[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|data_to_write~17_combout\,
	ena => \ac|i2c|n_bits~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|data_to_write\(9));

-- Location: LCCOMB_X7_Y35_N8
\ac|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux4~0_combout\ = (\ac|state\(3) & (!\ac|state\(0) & (!\ac|state\(1) & !\ac|state\(2)))) # (!\ac|state\(3) & (\ac|state\(0) & (\ac|state\(1) & \ac|state\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|state\(3),
	datab => \ac|state\(0),
	datac => \ac|state\(1),
	datad => \ac|state\(2),
	combout => \ac|Mux4~0_combout\);

-- Location: FF_X7_Y35_N9
\ac|txd_data[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|Mux4~0_combout\,
	ena => \ac|txd_data[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|txd_data\(8));

-- Location: LCCOMB_X8_Y35_N28
\ac|i2c|data_to_write~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~16_combout\ = (\ac|i2c|state.idle~q\ & (\ac|i2c|data_to_write\(9))) # (!\ac|i2c|state.idle~q\ & ((\ac|txd_data\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|data_to_write\(9),
	datab => \ac|i2c|state.idle~q\,
	datad => \ac|txd_data\(8),
	combout => \ac|i2c|data_to_write~16_combout\);

-- Location: FF_X8_Y35_N29
\ac|i2c|data_to_write[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|data_to_write~16_combout\,
	ena => \ac|i2c|n_bits~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|data_to_write\(10));

-- Location: LCCOMB_X8_Y35_N14
\ac|i2c|data_to_write~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~15_combout\ = (\ac|i2c|state.idle~q\ & ((\ac|i2c|data_to_write\(10)))) # (!\ac|i2c|state.idle~q\ & (\ac|txd_data\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|txd_data\(9),
	datab => \ac|i2c|state.idle~q\,
	datad => \ac|i2c|data_to_write\(10),
	combout => \ac|i2c|data_to_write~15_combout\);

-- Location: FF_X8_Y35_N15
\ac|i2c|data_to_write[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|data_to_write~15_combout\,
	ena => \ac|i2c|n_bits~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|data_to_write\(11));

-- Location: LCCOMB_X8_Y35_N8
\ac|i2c|data_to_write~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~14_combout\ = (\ac|i2c|state.idle~q\ & ((\ac|i2c|data_to_write\(11)))) # (!\ac|i2c|state.idle~q\ & (\ac|txd_data\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|txd_data\(10),
	datac => \ac|i2c|data_to_write\(11),
	datad => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|data_to_write~14_combout\);

-- Location: FF_X8_Y35_N9
\ac|i2c|data_to_write[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|data_to_write~14_combout\,
	ena => \ac|i2c|n_bits~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|data_to_write\(12));

-- Location: LCCOMB_X8_Y35_N22
\ac|i2c|data_to_write~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~13_combout\ = (\ac|i2c|state.idle~q\ & ((\ac|i2c|data_to_write\(12)))) # (!\ac|i2c|state.idle~q\ & (\ac|txd_data\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|txd_data\(11),
	datac => \ac|i2c|data_to_write\(12),
	datad => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|data_to_write~13_combout\);

-- Location: FF_X8_Y35_N23
\ac|i2c|data_to_write[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|data_to_write~13_combout\,
	ena => \ac|i2c|n_bits~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|data_to_write\(13));

-- Location: LCCOMB_X8_Y35_N4
\ac|i2c|data_to_write~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~12_combout\ = (\ac|i2c|state.idle~q\ & ((\ac|i2c|data_to_write\(13)))) # (!\ac|i2c|state.idle~q\ & (\ac|txd_data\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|txd_data\(12),
	datac => \ac|i2c|data_to_write\(13),
	datad => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|data_to_write~12_combout\);

-- Location: FF_X8_Y35_N5
\ac|i2c|data_to_write[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|data_to_write~12_combout\,
	ena => \ac|i2c|n_bits~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|data_to_write\(14));

-- Location: LCCOMB_X8_Y35_N18
\ac|i2c|data_to_write~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~11_combout\ = (\ac|i2c|data_to_write\(14) & \ac|i2c|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ac|i2c|data_to_write\(14),
	datad => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|data_to_write~11_combout\);

-- Location: FF_X8_Y35_N19
\ac|i2c|data_to_write[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|data_to_write~11_combout\,
	ena => \ac|i2c|n_bits~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|data_to_write\(15));

-- Location: LCCOMB_X11_Y36_N12
\ac|i2c|data_to_write~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~10_combout\ = (\ac|i2c|state.idle~q\ & \ac|i2c|data_to_write\(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|state.idle~q\,
	datac => \ac|i2c|data_to_write\(15),
	combout => \ac|i2c|data_to_write~10_combout\);

-- Location: FF_X11_Y36_N13
\ac|i2c|data_to_write[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|data_to_write~10_combout\,
	ena => \ac|i2c|n_bits~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|data_to_write\(16));

-- Location: LCCOMB_X11_Y36_N26
\ac|i2c|data_to_write~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~9_combout\ = (\ac|i2c|data_to_write\(16) & \ac|i2c|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|data_to_write\(16),
	datab => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|data_to_write~9_combout\);

-- Location: FF_X11_Y36_N27
\ac|i2c|data_to_write[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|data_to_write~9_combout\,
	ena => \ac|i2c|n_bits~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|data_to_write\(17));

-- Location: LCCOMB_X11_Y36_N24
\ac|i2c|data_to_write~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~8_combout\ = (\ac|i2c|data_to_write\(17)) # (!\ac|i2c|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ac|i2c|data_to_write\(17),
	datad => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|data_to_write~8_combout\);

-- Location: FF_X11_Y36_N25
\ac|i2c|data_to_write[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|data_to_write~8_combout\,
	ena => \ac|i2c|n_bits~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|data_to_write\(18));

-- Location: LCCOMB_X11_Y36_N14
\ac|i2c|data_to_write~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~7_combout\ = (\ac|i2c|state.idle~q\ & \ac|i2c|data_to_write\(18))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|state.idle~q\,
	datac => \ac|i2c|data_to_write\(18),
	combout => \ac|i2c|data_to_write~7_combout\);

-- Location: FF_X11_Y36_N15
\ac|i2c|data_to_write[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|data_to_write~7_combout\,
	ena => \ac|i2c|n_bits~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|data_to_write\(19));

-- Location: LCCOMB_X11_Y36_N4
\ac|i2c|data_to_write~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~6_combout\ = (\ac|i2c|state.idle~q\ & \ac|i2c|data_to_write\(19))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|state.idle~q\,
	datac => \ac|i2c|data_to_write\(19),
	combout => \ac|i2c|data_to_write~6_combout\);

-- Location: FF_X11_Y36_N5
\ac|i2c|data_to_write[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|data_to_write~6_combout\,
	ena => \ac|i2c|n_bits~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|data_to_write\(20));

-- Location: LCCOMB_X11_Y36_N6
\ac|i2c|data_to_write~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~5_combout\ = (\ac|i2c|data_to_write\(20)) # (!\ac|i2c|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ac|i2c|data_to_write\(20),
	datad => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|data_to_write~5_combout\);

-- Location: FF_X11_Y36_N7
\ac|i2c|data_to_write[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|data_to_write~5_combout\,
	ena => \ac|i2c|n_bits~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|data_to_write\(21));

-- Location: LCCOMB_X11_Y36_N8
\ac|i2c|data_to_write~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~4_combout\ = (\ac|i2c|data_to_write\(21) & \ac|i2c|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|data_to_write\(21),
	datab => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|data_to_write~4_combout\);

-- Location: FF_X11_Y36_N9
\ac|i2c|data_to_write[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|data_to_write~4_combout\,
	ena => \ac|i2c|n_bits~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|data_to_write\(22));

-- Location: LCCOMB_X11_Y36_N30
\ac|i2c|data_to_write~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~3_combout\ = (\ac|i2c|data_to_write\(22)) # (!\ac|i2c|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ac|i2c|data_to_write\(22),
	datad => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|data_to_write~3_combout\);

-- Location: FF_X11_Y36_N31
\ac|i2c|data_to_write[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|data_to_write~3_combout\,
	ena => \ac|i2c|n_bits~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|data_to_write\(23));

-- Location: LCCOMB_X11_Y36_N28
\ac|i2c|data_to_write~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~2_combout\ = (\ac|i2c|data_to_write\(23)) # (!\ac|i2c|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ac|i2c|data_to_write\(23),
	datad => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|data_to_write~2_combout\);

-- Location: FF_X11_Y36_N29
\ac|i2c|data_to_write[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|data_to_write~2_combout\,
	ena => \ac|i2c|n_bits~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|data_to_write\(24));

-- Location: LCCOMB_X11_Y36_N22
\ac|i2c|data_to_write~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~1_combout\ = (\ac|i2c|state.idle~q\ & \ac|i2c|data_to_write\(24))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|state.idle~q\,
	datad => \ac|i2c|data_to_write\(24),
	combout => \ac|i2c|data_to_write~1_combout\);

-- Location: FF_X11_Y36_N23
\ac|i2c|data_to_write[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|data_to_write~1_combout\,
	ena => \ac|i2c|n_bits~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|data_to_write\(25));

-- Location: LCCOMB_X11_Y36_N0
\ac|i2c|data_to_write~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~0_combout\ = (\ac|i2c|state.idle~q\ & \ac|i2c|data_to_write\(25))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|state.idle~q\,
	datac => \ac|i2c|data_to_write\(25),
	combout => \ac|i2c|data_to_write~0_combout\);

-- Location: FF_X11_Y36_N1
\ac|i2c|data_to_write[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|data_to_write~0_combout\,
	ena => \ac|i2c|n_bits~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|data_to_write\(26));

-- Location: LCCOMB_X12_Y36_N4
\ac|i2c|i2c_sdat~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|i2c_sdat~1_combout\ = (\ac|i2c|state.stop_condition~q\ & (((!\ac|i2c|i2c_sclk~3_combout\)))) # (!\ac|i2c|state.stop_condition~q\ & (\ac|i2c|state.in_progress~q\ & (!\ac|i2c|data_to_write\(26))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|state.stop_condition~q\,
	datab => \ac|i2c|state.in_progress~q\,
	datac => \ac|i2c|data_to_write\(26),
	datad => \ac|i2c|i2c_sclk~3_combout\,
	combout => \ac|i2c|i2c_sdat~1_combout\);

-- Location: LCCOMB_X12_Y36_N2
\ac|i2c|i2c_sdat~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|i2c_sdat~2_combout\ = (\ac|i2c|state.start_condition~q\ & (!\ac|i2c|phase\(1) & ((!\ac|i2c|phase\(0))))) # (!\ac|i2c|state.start_condition~q\ & (((!\ac|i2c|i2c_sdat~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001101000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|phase\(1),
	datab => \ac|i2c|state.start_condition~q\,
	datac => \ac|i2c|i2c_sdat~1_combout\,
	datad => \ac|i2c|phase\(0),
	combout => \ac|i2c|i2c_sdat~2_combout\);

-- Location: FF_X5_Y51_N1
\ps2|ll|ps2_clk~en\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \ps2|ll|state.interrupting~q\,
	sload => VCC,
	ena => \ps2|ll|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|ps2_clk~en_q\);

-- Location: LCCOMB_X5_Y47_N22
\ps2|ll|Selector31~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector31~0_combout\ = (!\ps2|ll|state.idle~q\ & (((\ps2|ll|ps2_dat_0~q\ & !\ps2|ll|ps2_clk_0~q\)) # (!\ps2|ll|process_0~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010101000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state.idle~q\,
	datab => \ps2|ll|ps2_dat_0~q\,
	datac => \ps2|ll|process_0~7_combout\,
	datad => \ps2|ll|ps2_clk_0~q\,
	combout => \ps2|ll|Selector31~0_combout\);

-- Location: LCCOMB_X5_Y48_N22
\ps2|ll|Selector31~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector31~1_combout\ = (\ps2|ll|state.finishing~q\) # ((\ps2|ll|state.waiting_for_acknowledge~q\) # ((\ps2|ll|data[7]~1_combout\) # (\ps2|ll|Selector31~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state.finishing~q\,
	datab => \ps2|ll|state.waiting_for_acknowledge~q\,
	datac => \ps2|ll|data[7]~1_combout\,
	datad => \ps2|ll|Selector31~0_combout\,
	combout => \ps2|ll|Selector31~1_combout\);

-- Location: LCCOMB_X4_Y48_N10
\ps2|ll|Selector31~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector31~2_combout\ = (\ps2|ll|data\(0) & ((\ps2|ll|Selector31~1_combout\) # (!\ps2|ll|Selector21~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Selector21~2_combout\,
	datab => \ps2|ll|data\(0),
	datad => \ps2|ll|Selector31~1_combout\,
	combout => \ps2|ll|Selector31~2_combout\);

-- Location: LCCOMB_X4_Y48_N18
\ps2|ll|Selector31~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector31~3_combout\ = (\ps2|ll|Selector31~2_combout\) # ((\ps2|ll|data\(1) & ((\ps2|ll|Selector21~0_combout\) # (\ps2|ll|rxd_valid~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Selector31~2_combout\,
	datab => \ps2|ll|Selector21~0_combout\,
	datac => \ps2|ll|data\(1),
	datad => \ps2|ll|rxd_valid~0_combout\,
	combout => \ps2|ll|Selector31~3_combout\);

-- Location: FF_X4_Y48_N19
\ps2|ll|data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|Selector31~3_combout\,
	ena => \ps2|ll|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|data\(0));

-- Location: LCCOMB_X4_Y48_N26
\ps2|ll|ps2_dat~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|ps2_dat~reg0feeder_combout\ = \ps2|ll|data\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ps2|ll|data\(0),
	combout => \ps2|ll|ps2_dat~reg0feeder_combout\);

-- Location: FF_X4_Y48_N27
\ps2|ll|ps2_dat~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|ps2_dat~reg0feeder_combout\,
	ena => \ps2|ll|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|ps2_dat~reg0_q\);

-- Location: LCCOMB_X5_Y51_N18
\ps2|ll|Selector34~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector34~0_combout\ = (!\ps2|ll|time_out_counter\(3) & (((!\ps2|ll|time_out_counter\(0) & !\ps2|ll|time_out_counter\(1))) # (!\ps2|ll|time_out_counter\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter\(0),
	datab => \ps2|ll|time_out_counter\(2),
	datac => \ps2|ll|time_out_counter\(3),
	datad => \ps2|ll|time_out_counter\(1),
	combout => \ps2|ll|Selector34~0_combout\);

-- Location: LCCOMB_X5_Y51_N16
\ps2|ll|Selector34~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector34~1_combout\ = (!\ps2|ll|time_out_counter\(10) & (\ps2|ll|Equal3~0_combout\ & ((\ps2|ll|Selector34~0_combout\) # (!\ps2|ll|time_out_counter\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter\(10),
	datab => \ps2|ll|Equal3~0_combout\,
	datac => \ps2|ll|time_out_counter\(4),
	datad => \ps2|ll|Selector34~0_combout\,
	combout => \ps2|ll|Selector34~1_combout\);

-- Location: LCCOMB_X5_Y51_N30
\ps2|ll|Selector34~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector34~2_combout\ = (\ps2|ll|state.sending~q\) # ((\ps2|ll|Selector34~1_combout\ & (\ps2|ll|state.interrupting~q\ & !\ps2|ll|time_out_counter\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state.sending~q\,
	datab => \ps2|ll|Selector34~1_combout\,
	datac => \ps2|ll|state.interrupting~q\,
	datad => \ps2|ll|time_out_counter\(6),
	combout => \ps2|ll|Selector34~2_combout\);

-- Location: FF_X5_Y51_N31
\ps2|ll|ps2_dat~en\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|Selector34~2_combout\,
	ena => \ps2|ll|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|ps2_dat~en_q\);

-- Location: LCCOMB_X12_Y38_N0
\s_dados_do_ps2~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~68_combout\ = (\ps2|key_code\(0) & (\ps2|key_code\(3) & (\ps2|key_code\(1) & !\ps2|key_code\(2)))) # (!\ps2|key_code\(0) & (!\ps2|key_code\(3) & (\ps2|key_code\(1) $ (\ps2|key_code\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000110010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(0),
	datab => \ps2|key_code\(3),
	datac => \ps2|key_code\(1),
	datad => \ps2|key_code\(2),
	combout => \s_dados_do_ps2~68_combout\);

-- Location: LCCOMB_X12_Y38_N6
\s_dados_do_ps2~69\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~69_combout\ = (s_dados_do_ps2(0) & ((!\s_dados_do_ps2~68_combout\) # (!\ps2|key_code\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => s_dados_do_ps2(0),
	datac => \ps2|key_code\(6),
	datad => \s_dados_do_ps2~68_combout\,
	combout => \s_dados_do_ps2~69_combout\);

-- Location: LCCOMB_X12_Y39_N30
\s_dados_do_ps2~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~29_combout\ = (\ps2|key_code\(6) & ((\Equal7~1_combout\) # (\Equal7~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal7~1_combout\,
	datab => \ps2|key_code\(6),
	datad => \Equal7~0_combout\,
	combout => \s_dados_do_ps2~29_combout\);

-- Location: LCCOMB_X12_Y38_N24
\s_dados_do_ps2~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~70_combout\ = (\s_dados_do_ps2~69_combout\) # ((!\ps2|key_code\(2) & (\s_dados_do_ps2~29_combout\ & \s_dados_do_ps2~68_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_dados_do_ps2~69_combout\,
	datab => \ps2|key_code\(2),
	datac => \s_dados_do_ps2~29_combout\,
	datad => \s_dados_do_ps2~68_combout\,
	combout => \s_dados_do_ps2~70_combout\);

-- Location: LCCOMB_X12_Y39_N14
\s_dados_do_ps2~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~63_combout\ = (\ps2|key_code\(6) & (s_dados_do_ps2(0))) # (!\ps2|key_code\(6) & (((\Equal7~0_combout\) # (\Equal7~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_do_ps2(0),
	datab => \Equal7~0_combout\,
	datac => \ps2|key_code\(6),
	datad => \Equal7~1_combout\,
	combout => \s_dados_do_ps2~63_combout\);

-- Location: LCCOMB_X13_Y39_N24
\s_dados_do_ps2~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~47_combout\ = (\ps2|key_code\(3) & ((\ps2|key_code\(2) & ((!\ps2|key_code\(1)))) # (!\ps2|key_code\(2) & (\ps2|key_code\(0) & \ps2|key_code\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(2),
	datab => \ps2|key_code\(0),
	datac => \ps2|key_code\(1),
	datad => \ps2|key_code\(3),
	combout => \s_dados_do_ps2~47_combout\);

-- Location: LCCOMB_X13_Y39_N2
\s_dados_do_ps2~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~66_combout\ = ((\ps2|key_code\(2) & (\ps2|key_code\(6) & \ps2|key_code\(0)))) # (!\s_dados_do_ps2~47_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(2),
	datab => \ps2|key_code\(6),
	datac => \ps2|key_code\(0),
	datad => \s_dados_do_ps2~47_combout\,
	combout => \s_dados_do_ps2~66_combout\);

-- Location: LCCOMB_X13_Y39_N0
\s_dados_do_ps2~65\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~65_combout\ = (\ps2|key_code\(3) & ((\ps2|key_code\(2) & (!\ps2|key_code\(0) & !\ps2|key_code\(1))) # (!\ps2|key_code\(2) & (\ps2|key_code\(0) & \ps2|key_code\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(2),
	datab => \ps2|key_code\(0),
	datac => \ps2|key_code\(1),
	datad => \ps2|key_code\(3),
	combout => \s_dados_do_ps2~65_combout\);

-- Location: LCCOMB_X13_Y39_N20
\s_dados_do_ps2~67\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~67_combout\ = (\s_dados_do_ps2~63_combout\ & ((\s_dados_do_ps2~65_combout\) # ((\s_dados_do_ps2~66_combout\ & s_dados_do_ps2(0))))) # (!\s_dados_do_ps2~63_combout\ & (\s_dados_do_ps2~66_combout\ & (s_dados_do_ps2(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_dados_do_ps2~63_combout\,
	datab => \s_dados_do_ps2~66_combout\,
	datac => s_dados_do_ps2(0),
	datad => \s_dados_do_ps2~65_combout\,
	combout => \s_dados_do_ps2~67_combout\);

-- Location: LCCOMB_X12_Y38_N2
\s_dados_do_ps2~71\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~71_combout\ = (\ps2|key_code\(5) & (((\ps2|key_code\(4))))) # (!\ps2|key_code\(5) & ((\ps2|key_code\(4) & ((\s_dados_do_ps2~67_combout\))) # (!\ps2|key_code\(4) & (\s_dados_do_ps2~70_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(5),
	datab => \s_dados_do_ps2~70_combout\,
	datac => \s_dados_do_ps2~67_combout\,
	datad => \ps2|key_code\(4),
	combout => \s_dados_do_ps2~71_combout\);

-- Location: LCCOMB_X13_Y39_N18
\s_dados_do_ps2~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~59_combout\ = (s_dados_do_ps2(0) & ((\ps2|key_code\(1)) # ((\ps2|key_code\(0)) # (\ps2|key_code\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(1),
	datab => \ps2|key_code\(0),
	datac => s_dados_do_ps2(0),
	datad => \ps2|key_code\(6),
	combout => \s_dados_do_ps2~59_combout\);

-- Location: LCCOMB_X13_Y39_N10
\s_dados_do_ps2~83\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~83_combout\ = (\ps2|key_code\(1) & (((s_dados_do_ps2(0))))) # (!\ps2|key_code\(1) & ((\ps2|key_code\(0) & (s_dados_do_ps2(0))) # (!\ps2|key_code\(0) & ((\s_dados_do_ps2~63_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(1),
	datab => \ps2|key_code\(0),
	datac => s_dados_do_ps2(0),
	datad => \s_dados_do_ps2~63_combout\,
	combout => \s_dados_do_ps2~83_combout\);

-- Location: LCCOMB_X11_Y38_N0
\s_dados_do_ps2~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~26_combout\ = (!\ps2|key_code\(6) & ((\Equal7~1_combout\) # (\Equal7~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal7~1_combout\,
	datac => \ps2|key_code\(6),
	datad => \Equal7~0_combout\,
	combout => \s_dados_do_ps2~26_combout\);

-- Location: LCCOMB_X13_Y39_N4
\s_dados_do_ps2~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~34_combout\ = (!\ps2|key_code\(0)) # (!\ps2|key_code\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(1),
	datad => \ps2|key_code\(0),
	combout => \s_dados_do_ps2~34_combout\);

-- Location: LCCOMB_X13_Y39_N14
\s_dados_do_ps2~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~61_combout\ = (\s_dados_do_ps2~34_combout\ & (((s_dados_do_ps2(0))))) # (!\s_dados_do_ps2~34_combout\ & ((\s_dados_do_ps2~26_combout\) # ((s_dados_do_ps2(0) & \ps2|key_code\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_dados_do_ps2~26_combout\,
	datab => s_dados_do_ps2(0),
	datac => \s_dados_do_ps2~34_combout\,
	datad => \ps2|key_code\(6),
	combout => \s_dados_do_ps2~61_combout\);

-- Location: LCCOMB_X13_Y39_N12
\s_dados_do_ps2~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~60_combout\ = (s_dados_do_ps2(0) & (((\ps2|key_code\(6)) # (!\ps2|key_code\(0))) # (!\ps2|key_code\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(1),
	datab => \ps2|key_code\(0),
	datac => s_dados_do_ps2(0),
	datad => \ps2|key_code\(6),
	combout => \s_dados_do_ps2~60_combout\);

-- Location: LCCOMB_X13_Y39_N16
\s_dados_do_ps2~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~62_combout\ = (\ps2|key_code\(2) & (((\ps2|key_code\(3))))) # (!\ps2|key_code\(2) & ((\ps2|key_code\(3) & ((\s_dados_do_ps2~60_combout\))) # (!\ps2|key_code\(3) & (\s_dados_do_ps2~61_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(2),
	datab => \s_dados_do_ps2~61_combout\,
	datac => \s_dados_do_ps2~60_combout\,
	datad => \ps2|key_code\(3),
	combout => \s_dados_do_ps2~62_combout\);

-- Location: LCCOMB_X13_Y39_N26
\s_dados_do_ps2~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~64_combout\ = (\ps2|key_code\(2) & ((\s_dados_do_ps2~62_combout\ & ((\s_dados_do_ps2~83_combout\))) # (!\s_dados_do_ps2~62_combout\ & (\s_dados_do_ps2~59_combout\)))) # (!\ps2|key_code\(2) & (((\s_dados_do_ps2~62_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(2),
	datab => \s_dados_do_ps2~59_combout\,
	datac => \s_dados_do_ps2~83_combout\,
	datad => \s_dados_do_ps2~62_combout\,
	combout => \s_dados_do_ps2~64_combout\);

-- Location: LCCOMB_X13_Y39_N22
\s_dados_do_ps2~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~74_combout\ = (\ps2|key_code\(2) & (!\ps2|key_code\(1) & (\ps2|key_code\(0) $ (\ps2|key_code\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(2),
	datab => \ps2|key_code\(0),
	datac => \ps2|key_code\(1),
	datad => \ps2|key_code\(3),
	combout => \s_dados_do_ps2~74_combout\);

-- Location: LCCOMB_X13_Y39_N6
\s_dados_do_ps2~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~72_combout\ = (\ps2|key_code\(0) & ((\ps2|key_code\(2) & (\ps2|key_code\(3))) # (!\ps2|key_code\(2) & ((\ps2|key_code\(6)))))) # (!\ps2|key_code\(0) & (((!\ps2|key_code\(3) & \ps2|key_code\(6))) # (!\ps2|key_code\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010011001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(3),
	datab => \ps2|key_code\(6),
	datac => \ps2|key_code\(0),
	datad => \ps2|key_code\(2),
	combout => \s_dados_do_ps2~72_combout\);

-- Location: LCCOMB_X13_Y39_N28
\s_dados_do_ps2~73\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~73_combout\ = (s_dados_do_ps2(0) & ((\s_dados_do_ps2~72_combout\) # (\ps2|key_code\(1) $ (!\ps2|key_code\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_dados_do_ps2~72_combout\,
	datab => s_dados_do_ps2(0),
	datac => \ps2|key_code\(1),
	datad => \ps2|key_code\(2),
	combout => \s_dados_do_ps2~73_combout\);

-- Location: LCCOMB_X13_Y39_N8
\s_dados_do_ps2~75\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~75_combout\ = (\s_dados_do_ps2~73_combout\) # ((\s_dados_do_ps2~63_combout\ & \s_dados_do_ps2~74_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_dados_do_ps2~63_combout\,
	datac => \s_dados_do_ps2~74_combout\,
	datad => \s_dados_do_ps2~73_combout\,
	combout => \s_dados_do_ps2~75_combout\);

-- Location: LCCOMB_X12_Y38_N16
\s_dados_do_ps2~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~76_combout\ = (\ps2|key_code\(5) & ((\s_dados_do_ps2~71_combout\ & ((\s_dados_do_ps2~75_combout\))) # (!\s_dados_do_ps2~71_combout\ & (\s_dados_do_ps2~64_combout\)))) # (!\ps2|key_code\(5) & (\s_dados_do_ps2~71_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(5),
	datab => \s_dados_do_ps2~71_combout\,
	datac => \s_dados_do_ps2~64_combout\,
	datad => \s_dados_do_ps2~75_combout\,
	combout => \s_dados_do_ps2~76_combout\);

-- Location: LCCOMB_X11_Y38_N26
\s_dados_do_ps2[0]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2[0]~40_combout\ = (!\ps2|key_code\(7) & \ps2|valid_key_code~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|key_code\(7),
	datad => \ps2|valid_key_code~q\,
	combout => \s_dados_do_ps2[0]~40_combout\);

-- Location: FF_X12_Y38_N17
\s_dados_do_ps2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \s_dados_do_ps2~76_combout\,
	ena => \s_dados_do_ps2[0]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_dados_do_ps2(0));

-- Location: LCCOMB_X11_Y39_N20
\s_dados_do_ps2~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~22_combout\ = (\s_dados_do_ps2~18_combout\ & (\s_dados_do_ps2~21_combout\ & \s_dados_do_ps2~17_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_dados_do_ps2~18_combout\,
	datac => \s_dados_do_ps2~21_combout\,
	datad => \s_dados_do_ps2~17_combout\,
	combout => \s_dados_do_ps2~22_combout\);

-- Location: LCCOMB_X11_Y38_N4
\s_dados_do_ps2~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~23_combout\ = (\s_dados_do_ps2~22_combout\ & (((s_dados_do_ps2(3) & \s_dados_do_ps2~16_combout\)))) # (!\s_dados_do_ps2~22_combout\ & (\Equal7~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal7~2_combout\,
	datab => \s_dados_do_ps2~22_combout\,
	datac => s_dados_do_ps2(3),
	datad => \s_dados_do_ps2~16_combout\,
	combout => \s_dados_do_ps2~23_combout\);

-- Location: FF_X11_Y38_N5
\s_dados_do_ps2[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \s_dados_do_ps2~23_combout\,
	ena => \ps2|valid_key_code~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_dados_do_ps2(3));

-- Location: LCCOMB_X13_Y38_N30
\s_dados_do_ps2~82\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~82_combout\ = (\ps2|key_code\(1) & (\ps2|key_code\(3) & ((\ps2|key_code\(2)) # (\ps2|key_code\(0))))) # (!\ps2|key_code\(1) & (\ps2|key_code\(2) & ((\ps2|key_code\(0)) # (!\ps2|key_code\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101010000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(2),
	datab => \ps2|key_code\(3),
	datac => \ps2|key_code\(1),
	datad => \ps2|key_code\(0),
	combout => \s_dados_do_ps2~82_combout\);

-- Location: LCCOMB_X13_Y38_N26
\s_dados_do_ps2~80\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~80_combout\ = (\ps2|key_code\(2) & ((\ps2|key_code\(1)) # ((\ps2|key_code\(3) & \ps2|key_code\(0))))) # (!\ps2|key_code\(2) & (((!\ps2|key_code\(0)) # (!\ps2|key_code\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(2),
	datab => \ps2|key_code\(3),
	datac => \ps2|key_code\(1),
	datad => \ps2|key_code\(0),
	combout => \s_dados_do_ps2~80_combout\);

-- Location: LCCOMB_X13_Y38_N28
\s_dados_do_ps2~81\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~81_combout\ = (\s_dados_do_ps2~26_combout\ & (((!\ps2|key_code\(0) & !\ps2|key_code\(1))) # (!\ps2|key_code\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(0),
	datab => \ps2|key_code\(1),
	datac => \s_dados_do_ps2~26_combout\,
	datad => \ps2|key_code\(3),
	combout => \s_dados_do_ps2~81_combout\);

-- Location: LCCOMB_X13_Y38_N10
\s_dados_do_ps2~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~56_combout\ = (\s_dados_do_ps2~81_combout\ & (\s_dados_do_ps2~82_combout\ $ (!\s_dados_do_ps2~80_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_dados_do_ps2~82_combout\,
	datac => \s_dados_do_ps2~80_combout\,
	datad => \s_dados_do_ps2~81_combout\,
	combout => \s_dados_do_ps2~56_combout\);

-- Location: LCCOMB_X13_Y38_N8
\s_dados_do_ps2~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~57_combout\ = (\s_dados_do_ps2~56_combout\) # ((s_dados_do_ps2(1) & ((\ps2|key_code\(6)) # (\s_dados_do_ps2~80_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_dados_do_ps2~56_combout\,
	datab => \ps2|key_code\(6),
	datac => \s_dados_do_ps2~80_combout\,
	datad => s_dados_do_ps2(1),
	combout => \s_dados_do_ps2~57_combout\);

-- Location: LCCOMB_X13_Y38_N6
\s_dados_do_ps2~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~42_combout\ = (\ps2|key_code\(2) & ((\ps2|key_code\(1)) # ((\ps2|key_code\(6)) # (\ps2|key_code\(0))))) # (!\ps2|key_code\(2) & (\ps2|key_code\(1) & (!\ps2|key_code\(6) & \ps2|key_code\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(2),
	datab => \ps2|key_code\(1),
	datac => \ps2|key_code\(6),
	datad => \ps2|key_code\(0),
	combout => \s_dados_do_ps2~42_combout\);

-- Location: LCCOMB_X13_Y38_N12
\s_dados_do_ps2~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~43_combout\ = (\ps2|key_code\(3) & (((\ps2|key_code\(2))))) # (!\ps2|key_code\(3) & (s_dados_do_ps2(1) & (\s_dados_do_ps2~42_combout\ $ (!\ps2|key_code\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_dados_do_ps2~42_combout\,
	datab => s_dados_do_ps2(1),
	datac => \ps2|key_code\(2),
	datad => \ps2|key_code\(3),
	combout => \s_dados_do_ps2~43_combout\);

-- Location: LCCOMB_X13_Y38_N18
\s_dados_do_ps2~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~44_combout\ = (s_dados_do_ps2(1) & ((\ps2|key_code\(0)) # ((\ps2|key_code\(1)) # (\ps2|key_code\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(0),
	datab => \ps2|key_code\(1),
	datac => \ps2|key_code\(6),
	datad => s_dados_do_ps2(1),
	combout => \s_dados_do_ps2~44_combout\);

-- Location: LCCOMB_X13_Y38_N0
\s_dados_do_ps2~79\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~79_combout\ = (\s_dados_do_ps2~44_combout\) # ((!\ps2|key_code\(0) & (!\ps2|key_code\(1) & \s_dados_do_ps2~26_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(0),
	datab => \ps2|key_code\(1),
	datac => \s_dados_do_ps2~26_combout\,
	datad => \s_dados_do_ps2~44_combout\,
	combout => \s_dados_do_ps2~79_combout\);

-- Location: LCCOMB_X13_Y39_N30
\s_dados_do_ps2~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~41_combout\ = (\s_dados_do_ps2~34_combout\ & (((s_dados_do_ps2(1))))) # (!\s_dados_do_ps2~34_combout\ & ((\s_dados_do_ps2~26_combout\) # ((\ps2|key_code\(6) & s_dados_do_ps2(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_dados_do_ps2~26_combout\,
	datab => \ps2|key_code\(6),
	datac => \s_dados_do_ps2~34_combout\,
	datad => s_dados_do_ps2(1),
	combout => \s_dados_do_ps2~41_combout\);

-- Location: LCCOMB_X13_Y38_N20
\s_dados_do_ps2~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~46_combout\ = (\s_dados_do_ps2~43_combout\ & ((\s_dados_do_ps2~79_combout\) # ((!\ps2|key_code\(3))))) # (!\s_dados_do_ps2~43_combout\ & (((\s_dados_do_ps2~41_combout\ & \ps2|key_code\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_dados_do_ps2~43_combout\,
	datab => \s_dados_do_ps2~79_combout\,
	datac => \s_dados_do_ps2~41_combout\,
	datad => \ps2|key_code\(3),
	combout => \s_dados_do_ps2~46_combout\);

-- Location: LCCOMB_X12_Y39_N26
\s_dados_do_ps2~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~50_combout\ = (\s_dados_do_ps2~34_combout\ & (s_dados_do_ps2(1))) # (!\s_dados_do_ps2~34_combout\ & ((\s_dados_do_ps2~29_combout\) # ((s_dados_do_ps2(1) & !\ps2|key_code\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_do_ps2(1),
	datab => \ps2|key_code\(6),
	datac => \s_dados_do_ps2~29_combout\,
	datad => \s_dados_do_ps2~34_combout\,
	combout => \s_dados_do_ps2~50_combout\);

-- Location: LCCOMB_X12_Y39_N10
\s_dados_do_ps2~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~52_combout\ = (s_dados_do_ps2(1) & (((\ps2|key_code\(0)) # (!\ps2|key_code\(1))) # (!\ps2|key_code\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_do_ps2(1),
	datab => \ps2|key_code\(6),
	datac => \ps2|key_code\(0),
	datad => \ps2|key_code\(1),
	combout => \s_dados_do_ps2~52_combout\);

-- Location: LCCOMB_X12_Y39_N20
\s_dados_do_ps2~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~45_combout\ = (\ps2|key_code\(0)) # (\ps2|key_code\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ps2|key_code\(0),
	datad => \ps2|key_code\(1),
	combout => \s_dados_do_ps2~45_combout\);

-- Location: LCCOMB_X12_Y39_N12
\s_dados_do_ps2~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~51_combout\ = (\s_dados_do_ps2~45_combout\ & (s_dados_do_ps2(1))) # (!\s_dados_do_ps2~45_combout\ & ((\s_dados_do_ps2~29_combout\) # ((s_dados_do_ps2(1) & !\ps2|key_code\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_do_ps2(1),
	datab => \ps2|key_code\(6),
	datac => \s_dados_do_ps2~29_combout\,
	datad => \s_dados_do_ps2~45_combout\,
	combout => \s_dados_do_ps2~51_combout\);

-- Location: LCCOMB_X12_Y39_N8
\s_dados_do_ps2~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~53_combout\ = (\ps2|key_code\(2) & (((\ps2|key_code\(3)) # (\s_dados_do_ps2~51_combout\)))) # (!\ps2|key_code\(2) & (\s_dados_do_ps2~52_combout\ & (!\ps2|key_code\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_dados_do_ps2~52_combout\,
	datab => \ps2|key_code\(2),
	datac => \ps2|key_code\(3),
	datad => \s_dados_do_ps2~51_combout\,
	combout => \s_dados_do_ps2~53_combout\);

-- Location: LCCOMB_X12_Y39_N2
\s_dados_do_ps2~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~54_combout\ = (\ps2|key_code\(3) & ((\s_dados_do_ps2~53_combout\ & ((s_dados_do_ps2(1)))) # (!\s_dados_do_ps2~53_combout\ & (\s_dados_do_ps2~50_combout\)))) # (!\ps2|key_code\(3) & (((\s_dados_do_ps2~53_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_dados_do_ps2~50_combout\,
	datab => \ps2|key_code\(3),
	datac => \s_dados_do_ps2~53_combout\,
	datad => s_dados_do_ps2(1),
	combout => \s_dados_do_ps2~54_combout\);

-- Location: LCCOMB_X12_Y39_N22
\s_dados_do_ps2~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~48_combout\ = (s_dados_do_ps2(1) & ((\ps2|key_code\(6)) # (!\s_dados_do_ps2~47_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_do_ps2(1),
	datab => \ps2|key_code\(6),
	datad => \s_dados_do_ps2~47_combout\,
	combout => \s_dados_do_ps2~48_combout\);

-- Location: LCCOMB_X12_Y39_N0
\s_dados_do_ps2~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~49_combout\ = (\s_dados_do_ps2~48_combout\) # ((\s_dados_do_ps2~26_combout\ & (\ps2|key_code\(0) & \s_dados_do_ps2~47_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_dados_do_ps2~48_combout\,
	datab => \s_dados_do_ps2~26_combout\,
	datac => \ps2|key_code\(0),
	datad => \s_dados_do_ps2~47_combout\,
	combout => \s_dados_do_ps2~49_combout\);

-- Location: LCCOMB_X12_Y39_N4
\s_dados_do_ps2~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~55_combout\ = (\ps2|key_code\(5) & (((\ps2|key_code\(4))))) # (!\ps2|key_code\(5) & ((\ps2|key_code\(4) & ((\s_dados_do_ps2~49_combout\))) # (!\ps2|key_code\(4) & (\s_dados_do_ps2~54_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(5),
	datab => \s_dados_do_ps2~54_combout\,
	datac => \ps2|key_code\(4),
	datad => \s_dados_do_ps2~49_combout\,
	combout => \s_dados_do_ps2~55_combout\);

-- Location: LCCOMB_X12_Y38_N30
\s_dados_do_ps2~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~58_combout\ = (\ps2|key_code\(5) & ((\s_dados_do_ps2~55_combout\ & (\s_dados_do_ps2~57_combout\)) # (!\s_dados_do_ps2~55_combout\ & ((\s_dados_do_ps2~46_combout\))))) # (!\ps2|key_code\(5) & (((\s_dados_do_ps2~55_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(5),
	datab => \s_dados_do_ps2~57_combout\,
	datac => \s_dados_do_ps2~46_combout\,
	datad => \s_dados_do_ps2~55_combout\,
	combout => \s_dados_do_ps2~58_combout\);

-- Location: FF_X12_Y38_N31
\s_dados_do_ps2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \s_dados_do_ps2~58_combout\,
	ena => \s_dados_do_ps2[0]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_dados_do_ps2(1));

-- Location: LCCOMB_X13_Y38_N22
\s_dados_do_ps2~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~37_combout\ = (s_dados_do_ps2(2) & ((\ps2|key_code\(0)) # ((\ps2|key_code\(6)) # (\ps2|key_code\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(0),
	datab => \ps2|key_code\(6),
	datac => \ps2|key_code\(1),
	datad => s_dados_do_ps2(2),
	combout => \s_dados_do_ps2~37_combout\);

-- Location: LCCOMB_X13_Y38_N2
\s_dados_do_ps2~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~35_combout\ = (\ps2|key_code\(2) & ((\ps2|key_code\(3)) # ((!\ps2|key_code\(1))))) # (!\ps2|key_code\(2) & (!\ps2|key_code\(3) & (\ps2|key_code\(1) & \ps2|key_code\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(2),
	datab => \ps2|key_code\(3),
	datac => \ps2|key_code\(1),
	datad => \ps2|key_code\(0),
	combout => \s_dados_do_ps2~35_combout\);

-- Location: LCCOMB_X13_Y38_N24
\s_dados_do_ps2~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~36_combout\ = (\ps2|key_code\(3) & (((\s_dados_do_ps2~35_combout\)))) # (!\ps2|key_code\(3) & (s_dados_do_ps2(2) & ((\ps2|key_code\(6)) # (!\s_dados_do_ps2~35_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(3),
	datab => s_dados_do_ps2(2),
	datac => \ps2|key_code\(6),
	datad => \s_dados_do_ps2~35_combout\,
	combout => \s_dados_do_ps2~36_combout\);

-- Location: LCCOMB_X13_Y38_N16
\s_dados_do_ps2~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~33_combout\ = (s_dados_do_ps2(2) & (((\ps2|key_code\(6)) # (!\ps2|key_code\(1))) # (!\ps2|key_code\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(0),
	datab => \ps2|key_code\(6),
	datac => \ps2|key_code\(1),
	datad => s_dados_do_ps2(2),
	combout => \s_dados_do_ps2~33_combout\);

-- Location: LCCOMB_X13_Y38_N14
\s_dados_do_ps2~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~78_combout\ = (\s_dados_do_ps2~33_combout\) # ((\ps2|key_code\(0) & (\ps2|key_code\(1) & \s_dados_do_ps2~26_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(0),
	datab => \ps2|key_code\(1),
	datac => \s_dados_do_ps2~26_combout\,
	datad => \s_dados_do_ps2~33_combout\,
	combout => \s_dados_do_ps2~78_combout\);

-- Location: LCCOMB_X13_Y38_N4
\s_dados_do_ps2~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~38_combout\ = (\s_dados_do_ps2~36_combout\ & ((\s_dados_do_ps2~37_combout\) # ((!\ps2|key_code\(3))))) # (!\s_dados_do_ps2~36_combout\ & (((\s_dados_do_ps2~78_combout\ & \ps2|key_code\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_dados_do_ps2~37_combout\,
	datab => \s_dados_do_ps2~36_combout\,
	datac => \s_dados_do_ps2~78_combout\,
	datad => \ps2|key_code\(3),
	combout => \s_dados_do_ps2~38_combout\);

-- Location: LCCOMB_X12_Y38_N22
\s_dados_do_ps2~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~24_combout\ = (\ps2|key_code\(3) & ((\ps2|key_code\(1) & (\ps2|key_code\(0) & !\ps2|key_code\(2))) # (!\ps2|key_code\(1) & ((\ps2|key_code\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(0),
	datab => \ps2|key_code\(3),
	datac => \ps2|key_code\(1),
	datad => \ps2|key_code\(2),
	combout => \s_dados_do_ps2~24_combout\);

-- Location: LCCOMB_X12_Y38_N20
\s_dados_do_ps2~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~25_combout\ = (s_dados_do_ps2(2) & ((\ps2|key_code\(6)) # (!\s_dados_do_ps2~24_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_dados_do_ps2~24_combout\,
	datac => \ps2|key_code\(6),
	datad => s_dados_do_ps2(2),
	combout => \s_dados_do_ps2~25_combout\);

-- Location: LCCOMB_X12_Y38_N10
\s_dados_do_ps2~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~27_combout\ = (\ps2|key_code\(0) & ((\ps2|key_code\(2)) # (!\ps2|key_code\(1)))) # (!\ps2|key_code\(0) & ((\ps2|key_code\(1)) # (!\ps2|key_code\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(0),
	datab => \ps2|key_code\(1),
	datad => \ps2|key_code\(2),
	combout => \s_dados_do_ps2~27_combout\);

-- Location: LCCOMB_X12_Y38_N12
\s_dados_do_ps2~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~28_combout\ = (\s_dados_do_ps2~27_combout\ & (((s_dados_do_ps2(2))))) # (!\s_dados_do_ps2~27_combout\ & ((\s_dados_do_ps2~26_combout\) # ((\ps2|key_code\(6) & s_dados_do_ps2(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_dados_do_ps2~27_combout\,
	datab => \s_dados_do_ps2~26_combout\,
	datac => \ps2|key_code\(6),
	datad => s_dados_do_ps2(2),
	combout => \s_dados_do_ps2~28_combout\);

-- Location: LCCOMB_X12_Y38_N26
\s_dados_do_ps2~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~30_combout\ = (\ps2|key_code\(0) & (\ps2|key_code\(3) & (\ps2|key_code\(1) & !\ps2|key_code\(2)))) # (!\ps2|key_code\(0) & (!\ps2|key_code\(3) & (\ps2|key_code\(1) $ (\ps2|key_code\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000110010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(0),
	datab => \ps2|key_code\(3),
	datac => \ps2|key_code\(1),
	datad => \ps2|key_code\(2),
	combout => \s_dados_do_ps2~30_combout\);

-- Location: LCCOMB_X12_Y38_N8
\s_dados_do_ps2~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~31_combout\ = (\s_dados_do_ps2~30_combout\ & ((\s_dados_do_ps2~29_combout\) # ((!\ps2|key_code\(6) & s_dados_do_ps2(2))))) # (!\s_dados_do_ps2~30_combout\ & (((s_dados_do_ps2(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_dados_do_ps2~30_combout\,
	datab => \ps2|key_code\(6),
	datac => \s_dados_do_ps2~29_combout\,
	datad => s_dados_do_ps2(2),
	combout => \s_dados_do_ps2~31_combout\);

-- Location: LCCOMB_X12_Y38_N14
\s_dados_do_ps2~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~32_combout\ = (\ps2|key_code\(4) & (((\ps2|key_code\(5))))) # (!\ps2|key_code\(4) & ((\ps2|key_code\(5) & (\s_dados_do_ps2~28_combout\)) # (!\ps2|key_code\(5) & ((\s_dados_do_ps2~31_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_dados_do_ps2~28_combout\,
	datab => \s_dados_do_ps2~31_combout\,
	datac => \ps2|key_code\(4),
	datad => \ps2|key_code\(5),
	combout => \s_dados_do_ps2~32_combout\);

-- Location: LCCOMB_X12_Y38_N28
\s_dados_do_ps2~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_do_ps2~39_combout\ = (\s_dados_do_ps2~32_combout\ & ((\s_dados_do_ps2~38_combout\) # ((!\ps2|key_code\(4))))) # (!\s_dados_do_ps2~32_combout\ & (((\s_dados_do_ps2~25_combout\ & \ps2|key_code\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_dados_do_ps2~38_combout\,
	datab => \s_dados_do_ps2~25_combout\,
	datac => \s_dados_do_ps2~32_combout\,
	datad => \ps2|key_code\(4),
	combout => \s_dados_do_ps2~39_combout\);

-- Location: FF_X12_Y38_N29
\s_dados_do_ps2[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \s_dados_do_ps2~39_combout\,
	ena => \s_dados_do_ps2[0]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_dados_do_ps2(2));

-- Location: LCCOMB_X21_Y35_N8
\bemol~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bemol~0_combout\ = (s_dados_do_ps2(1) & (s_dados_do_ps2(0) $ (s_dados_do_ps2(3) $ (!s_dados_do_ps2(2))))) # (!s_dados_do_ps2(1) & ((s_dados_do_ps2(0) & (s_dados_do_ps2(3) & !s_dados_do_ps2(2))) # (!s_dados_do_ps2(0) & (!s_dados_do_ps2(3) & 
-- s_dados_do_ps2(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000110011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_do_ps2(0),
	datab => s_dados_do_ps2(3),
	datac => s_dados_do_ps2(1),
	datad => s_dados_do_ps2(2),
	combout => \bemol~0_combout\);

-- Location: LCCOMB_X19_Y35_N24
\Display1|decOut_n[0]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \Display1|decOut_n[0]~36_combout\ = (s_dados_do_ps2(0) & (s_dados_do_ps2(1) & ((s_dados_do_ps2(3)) # (!s_dados_do_ps2(2))))) # (!s_dados_do_ps2(0) & (s_dados_do_ps2(3) $ (((!s_dados_do_ps2(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_do_ps2(0),
	datab => s_dados_do_ps2(3),
	datac => s_dados_do_ps2(1),
	datad => s_dados_do_ps2(2),
	combout => \Display1|decOut_n[0]~36_combout\);

-- Location: LCCOMB_X19_Y35_N18
\Display1|decOut_n[1]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \Display1|decOut_n[1]~37_combout\ = (s_dados_do_ps2(3) & (s_dados_do_ps2(1) $ (((s_dados_do_ps2(2)) # (!s_dados_do_ps2(0)))))) # (!s_dados_do_ps2(3) & (((s_dados_do_ps2(2)) # (!s_dados_do_ps2(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111110000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_do_ps2(0),
	datab => s_dados_do_ps2(3),
	datac => s_dados_do_ps2(1),
	datad => s_dados_do_ps2(2),
	combout => \Display1|decOut_n[1]~37_combout\);

-- Location: LCCOMB_X19_Y35_N8
\Display1|decOut_n[2]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \Display1|decOut_n[2]~32_combout\ = (s_dados_do_ps2(2) & ((s_dados_do_ps2(0) & ((!s_dados_do_ps2(1)))) # (!s_dados_do_ps2(0) & (!s_dados_do_ps2(3))))) # (!s_dados_do_ps2(2) & (((!s_dados_do_ps2(3) & !s_dados_do_ps2(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001101100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_do_ps2(0),
	datab => s_dados_do_ps2(3),
	datac => s_dados_do_ps2(1),
	datad => s_dados_do_ps2(2),
	combout => \Display1|decOut_n[2]~32_combout\);

-- Location: LCCOMB_X19_Y35_N30
\Display1|decOut_n[3]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \Display1|decOut_n[3]~31_combout\ = (s_dados_do_ps2(3) & (!s_dados_do_ps2(2) & (s_dados_do_ps2(0) $ (s_dados_do_ps2(1))))) # (!s_dados_do_ps2(3) & (!s_dados_do_ps2(0) & (s_dados_do_ps2(1) $ (!s_dados_do_ps2(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000001001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_do_ps2(0),
	datab => s_dados_do_ps2(3),
	datac => s_dados_do_ps2(1),
	datad => s_dados_do_ps2(2),
	combout => \Display1|decOut_n[3]~31_combout\);

-- Location: LCCOMB_X19_Y35_N22
\Display1|decOut_n[4]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \Display1|decOut_n[4]~33_combout\ = (s_dados_do_ps2(0)) # ((s_dados_do_ps2(3)) # ((s_dados_do_ps2(1)) # (s_dados_do_ps2(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_do_ps2(0),
	datab => s_dados_do_ps2(3),
	datac => s_dados_do_ps2(1),
	datad => s_dados_do_ps2(2),
	combout => \Display1|decOut_n[4]~33_combout\);

-- Location: LCCOMB_X19_Y35_N16
\Display1|decOut_n[5]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \Display1|decOut_n[5]~34_combout\ = (s_dados_do_ps2(3) & (((s_dados_do_ps2(1) & s_dados_do_ps2(2))))) # (!s_dados_do_ps2(3) & (!s_dados_do_ps2(2) & ((s_dados_do_ps2(1)) # (!s_dados_do_ps2(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_do_ps2(0),
	datab => s_dados_do_ps2(3),
	datac => s_dados_do_ps2(1),
	datad => s_dados_do_ps2(2),
	combout => \Display1|decOut_n[5]~34_combout\);

-- Location: LCCOMB_X19_Y35_N26
\Display1|decOut_n[6]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \Display1|decOut_n[6]~35_combout\ = (!s_dados_do_ps2(1) & ((s_dados_do_ps2(3) & (s_dados_do_ps2(0) & s_dados_do_ps2(2))) # (!s_dados_do_ps2(3) & ((!s_dados_do_ps2(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_do_ps2(0),
	datab => s_dados_do_ps2(3),
	datac => s_dados_do_ps2(1),
	datad => s_dados_do_ps2(2),
	combout => \Display1|decOut_n[6]~35_combout\);

-- Location: PLL_1
\aio|c|PLL|auto_generated|pll1\ : cycloneive_pll
-- pragma translate_off
GENERIC MAP (
	auto_settings => "false",
	bandwidth_type => "medium",
	c0_high => 17,
	c0_initial => 1,
	c0_low => 16,
	c0_mode => "odd",
	c0_ph => 0,
	c1_high => 0,
	c1_initial => 0,
	c1_low => 0,
	c1_mode => "bypass",
	c1_ph => 0,
	c1_use_casc_in => "off",
	c2_high => 0,
	c2_initial => 0,
	c2_low => 0,
	c2_mode => "bypass",
	c2_ph => 0,
	c2_use_casc_in => "off",
	c3_high => 0,
	c3_initial => 0,
	c3_low => 0,
	c3_mode => "bypass",
	c3_ph => 0,
	c3_use_casc_in => "off",
	c4_high => 0,
	c4_initial => 0,
	c4_low => 0,
	c4_mode => "bypass",
	c4_ph => 0,
	c4_use_casc_in => "off",
	charge_pump_current_bits => 1,
	clk0_counter => "c0",
	clk0_divide_by => 297,
	clk0_duty_cycle => 50,
	clk0_multiply_by => 73,
	clk0_phase_shift => "0",
	clk1_counter => "unused",
	clk1_divide_by => 0,
	clk1_duty_cycle => 50,
	clk1_multiply_by => 0,
	clk1_phase_shift => "0",
	clk2_counter => "unused",
	clk2_divide_by => 0,
	clk2_duty_cycle => 50,
	clk2_multiply_by => 0,
	clk2_phase_shift => "0",
	clk3_counter => "unused",
	clk3_divide_by => 0,
	clk3_duty_cycle => 50,
	clk3_multiply_by => 0,
	clk3_phase_shift => "0",
	clk4_counter => "unused",
	clk4_divide_by => 0,
	clk4_duty_cycle => 50,
	clk4_multiply_by => 0,
	clk4_phase_shift => "0",
	compensate_clock => "clock0",
	inclk0_input_frequency => 20000,
	inclk1_input_frequency => 0,
	loop_filter_c_bits => 0,
	loop_filter_r_bits => 16,
	m => 73,
	m_initial => 1,
	m_ph => 0,
	n => 9,
	operation_mode => "normal",
	pfd_max => 200000,
	pfd_min => 3076,
	self_reset_on_loss_lock => "off",
	simulation_type => "timing",
	switch_over_type => "auto",
	vco_center => 1538,
	vco_divide_by => 0,
	vco_frequency_control => "auto",
	vco_max => 3333,
	vco_min => 1538,
	vco_multiply_by => 0,
	vco_phase_shift_step => 308,
	vco_post_scale => 2)
-- pragma translate_on
PORT MAP (
	fbin => \aio|c|PLL|auto_generated|wire_pll1_fbout\,
	inclk => \aio|c|PLL|auto_generated|pll1_INCLK_bus\,
	fbout => \aio|c|PLL|auto_generated|wire_pll1_fbout\,
	clk => \aio|c|PLL|auto_generated|pll1_CLK_bus\);

-- Location: CLKCTRL_G3
\aio|c|PLL|auto_generated|wire_pll1_clk[0]~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \aio|c|PLL|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \aio|c|PLL|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\);

-- Location: IOIBUF_X0_Y69_N8
\aud_adclrck~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_aud_adclrck,
	o => \aud_adclrck~input_o\);

-- Location: LCCOMB_X24_Y37_N28
\aio|left_right_0~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|left_right_0~feeder_combout\ = \aud_adclrck~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \aud_adclrck~input_o\,
	combout => \aio|left_right_0~feeder_combout\);

-- Location: FF_X24_Y37_N29
\aio|left_right_0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|left_right_0~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|left_right_0~q\);

-- Location: FF_X24_Y36_N25
\aio|left_right_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \aio|left_right_0~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|left_right_1~q\);

-- Location: LCCOMB_X16_Y35_N24
\MuxOitava|dataOut[8]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \MuxOitava|dataOut[8]~45_combout\ = (s_dados_do_ps2(0) & ((s_dados_do_ps2(1) & (!s_dados_do_ps2(3))) # (!s_dados_do_ps2(1) & (s_dados_do_ps2(3) & !s_dados_do_ps2(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_do_ps2(1),
	datab => s_dados_do_ps2(0),
	datac => s_dados_do_ps2(3),
	datad => s_dados_do_ps2(2),
	combout => \MuxOitava|dataOut[8]~45_combout\);

-- Location: LCCOMB_X14_Y35_N4
\Sin|addr_q_1[0]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|addr_q_1[0]~24_combout\ = !\MuxOitava|dataOut[8]~45_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MuxOitava|dataOut[8]~45_combout\,
	combout => \Sin|addr_q_1[0]~24_combout\);

-- Location: FF_X14_Y35_N5
\Sin|addr_q_1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|addr_q_1[0]~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|addr_q_1\(0));

-- Location: LCCOMB_X14_Y35_N26
\Sin|addr_q_1[0]~_wirecell\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|addr_q_1[0]~_wirecell_combout\ = !\Sin|addr_q_1\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Sin|addr_q_1\(0),
	combout => \Sin|addr_q_1[0]~_wirecell_combout\);

-- Location: LCCOMB_X16_Y35_N20
\MuxOitava|dataOut[9]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \MuxOitava|dataOut[9]~46_combout\ = (s_dados_do_ps2(0) & (!s_dados_do_ps2(1) & (s_dados_do_ps2(3)))) # (!s_dados_do_ps2(0) & (((!s_dados_do_ps2(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_do_ps2(1),
	datab => s_dados_do_ps2(0),
	datac => s_dados_do_ps2(3),
	datad => s_dados_do_ps2(2),
	combout => \MuxOitava|dataOut[9]~46_combout\);

-- Location: FF_X16_Y35_N21
\Sin|addr_p_1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \MuxOitava|dataOut[9]~46_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|addr_p_1\(1));

-- Location: LCCOMB_X19_Y35_N28
\MuxOitava|dataOut[10]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \MuxOitava|dataOut[10]~54_combout\ = (s_dados_do_ps2(2)) # ((s_dados_do_ps2(3) & ((s_dados_do_ps2(0)) # (!s_dados_do_ps2(1)))) # (!s_dados_do_ps2(3) & ((s_dados_do_ps2(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_do_ps2(0),
	datab => s_dados_do_ps2(3),
	datac => s_dados_do_ps2(1),
	datad => s_dados_do_ps2(2),
	combout => \MuxOitava|dataOut[10]~54_combout\);

-- Location: LCCOMB_X14_Y35_N22
\Sin|addr_p_1[2]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|addr_p_1[2]~0_combout\ = !\MuxOitava|dataOut[10]~54_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MuxOitava|dataOut[10]~54_combout\,
	combout => \Sin|addr_p_1[2]~0_combout\);

-- Location: FF_X14_Y35_N23
\Sin|addr_p_1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|addr_p_1[2]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|addr_p_1\(2));

-- Location: LCCOMB_X19_Y35_N6
\MuxOitava|dataOut[11]~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \MuxOitava|dataOut[11]~55_combout\ = ((s_dados_do_ps2(3) & ((s_dados_do_ps2(1)) # (s_dados_do_ps2(2))))) # (!s_dados_do_ps2(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110111010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_do_ps2(0),
	datab => s_dados_do_ps2(3),
	datac => s_dados_do_ps2(1),
	datad => s_dados_do_ps2(2),
	combout => \MuxOitava|dataOut[11]~55_combout\);

-- Location: LCCOMB_X16_Y35_N26
\Sin|addr_p_1[3]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|addr_p_1[3]~1_combout\ = !\MuxOitava|dataOut[11]~55_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MuxOitava|dataOut[11]~55_combout\,
	combout => \Sin|addr_p_1[3]~1_combout\);

-- Location: FF_X16_Y35_N27
\Sin|addr_p_1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|addr_p_1[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|addr_p_1\(3));

-- Location: LCCOMB_X16_Y35_N22
\MuxOitava|dataOut[12]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \MuxOitava|dataOut[12]~47_combout\ = (s_dados_do_ps2(1) & (s_dados_do_ps2(3) & ((s_dados_do_ps2(0)) # (s_dados_do_ps2(2))))) # (!s_dados_do_ps2(1) & (((!s_dados_do_ps2(2)) # (!s_dados_do_ps2(3))) # (!s_dados_do_ps2(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010111010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_do_ps2(1),
	datab => s_dados_do_ps2(0),
	datac => s_dados_do_ps2(3),
	datad => s_dados_do_ps2(2),
	combout => \MuxOitava|dataOut[12]~47_combout\);

-- Location: LCCOMB_X17_Y35_N0
\Sin|addr_p_1[4]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|addr_p_1[4]~2_combout\ = !\MuxOitava|dataOut[12]~47_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MuxOitava|dataOut[12]~47_combout\,
	combout => \Sin|addr_p_1[4]~2_combout\);

-- Location: FF_X16_Y35_N1
\Sin|addr_p_1[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \Sin|addr_p_1[4]~2_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|addr_p_1\(4));

-- Location: LCCOMB_X19_Y35_N12
\MuxOitava|dataOut[13]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \MuxOitava|dataOut[13]~56_combout\ = (s_dados_do_ps2(3) & ((s_dados_do_ps2(1) & (s_dados_do_ps2(0))) # (!s_dados_do_ps2(1) & ((s_dados_do_ps2(2)))))) # (!s_dados_do_ps2(3) & (((s_dados_do_ps2(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_do_ps2(0),
	datab => s_dados_do_ps2(3),
	datac => s_dados_do_ps2(1),
	datad => s_dados_do_ps2(2),
	combout => \MuxOitava|dataOut[13]~56_combout\);

-- Location: LCCOMB_X14_Y35_N28
\Sin|addr_p_1[5]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|addr_p_1[5]~3_combout\ = !\MuxOitava|dataOut[13]~56_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MuxOitava|dataOut[13]~56_combout\,
	combout => \Sin|addr_p_1[5]~3_combout\);

-- Location: FF_X14_Y35_N29
\Sin|addr_p_1[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|addr_p_1[5]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|addr_p_1\(5));

-- Location: LCCOMB_X19_Y35_N14
\MuxOitava|dataOut[14]~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \MuxOitava|dataOut[14]~57_combout\ = (s_dados_do_ps2(2)) # ((s_dados_do_ps2(3) & ((!s_dados_do_ps2(1)) # (!s_dados_do_ps2(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_do_ps2(0),
	datab => s_dados_do_ps2(3),
	datac => s_dados_do_ps2(1),
	datad => s_dados_do_ps2(2),
	combout => \MuxOitava|dataOut[14]~57_combout\);

-- Location: LCCOMB_X16_Y35_N30
\Sin|addr_p_1[6]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|addr_p_1[6]~4_combout\ = !\MuxOitava|dataOut[14]~57_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MuxOitava|dataOut[14]~57_combout\,
	combout => \Sin|addr_p_1[6]~4_combout\);

-- Location: FF_X16_Y35_N31
\Sin|addr_p_1[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|addr_p_1[6]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|addr_p_1\(6));

-- Location: LCCOMB_X16_Y35_N28
\MuxOitava|dataOut[15]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \MuxOitava|dataOut[15]~58_combout\ = (s_dados_do_ps2(3) & (((!s_dados_do_ps2(1) & !s_dados_do_ps2(0))) # (!s_dados_do_ps2(2)))) # (!s_dados_do_ps2(3) & (((s_dados_do_ps2(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_do_ps2(1),
	datab => s_dados_do_ps2(0),
	datac => s_dados_do_ps2(3),
	datad => s_dados_do_ps2(2),
	combout => \MuxOitava|dataOut[15]~58_combout\);

-- Location: FF_X16_Y35_N29
\Sin|addr_p_1[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \MuxOitava|dataOut[15]~58_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|addr_p_1\(7));

-- Location: LCCOMB_X16_Y35_N2
\TestaOitava|isOctave~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \TestaOitava|isOctave~0_combout\ = (s_dados_do_ps2(3) & (s_dados_do_ps2(2) & ((s_dados_do_ps2(1)) # (s_dados_do_ps2(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_do_ps2(1),
	datab => s_dados_do_ps2(0),
	datac => s_dados_do_ps2(3),
	datad => s_dados_do_ps2(2),
	combout => \TestaOitava|isOctave~0_combout\);

-- Location: FF_X16_Y35_N3
\Sin|addr_p_1[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \TestaOitava|isOctave~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|addr_p_1\(8));

-- Location: LCCOMB_X16_Y35_N4
\Sin|addr_q_1[1]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|addr_q_1[1]~8_combout\ = (\MuxOitava|dataOut[8]~45_combout\ & (\MuxOitava|dataOut[9]~46_combout\ $ (VCC))) # (!\MuxOitava|dataOut[8]~45_combout\ & (\MuxOitava|dataOut[9]~46_combout\ & VCC))
-- \Sin|addr_q_1[1]~9\ = CARRY((\MuxOitava|dataOut[8]~45_combout\ & \MuxOitava|dataOut[9]~46_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MuxOitava|dataOut[8]~45_combout\,
	datab => \MuxOitava|dataOut[9]~46_combout\,
	datad => VCC,
	combout => \Sin|addr_q_1[1]~8_combout\,
	cout => \Sin|addr_q_1[1]~9\);

-- Location: FF_X16_Y35_N5
\Sin|addr_q_1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|addr_q_1[1]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|addr_q_1\(1));

-- Location: LCCOMB_X16_Y35_N6
\Sin|addr_q_1[2]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|addr_q_1[2]~10_combout\ = (\MuxOitava|dataOut[10]~54_combout\ & ((\Sin|addr_q_1[1]~9\) # (GND))) # (!\MuxOitava|dataOut[10]~54_combout\ & (!\Sin|addr_q_1[1]~9\))
-- \Sin|addr_q_1[2]~11\ = CARRY((\MuxOitava|dataOut[10]~54_combout\) # (!\Sin|addr_q_1[1]~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \MuxOitava|dataOut[10]~54_combout\,
	datad => VCC,
	cin => \Sin|addr_q_1[1]~9\,
	combout => \Sin|addr_q_1[2]~10_combout\,
	cout => \Sin|addr_q_1[2]~11\);

-- Location: FF_X16_Y35_N7
\Sin|addr_q_1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|addr_q_1[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|addr_q_1\(2));

-- Location: LCCOMB_X16_Y35_N8
\Sin|addr_q_1[3]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|addr_q_1[3]~12_combout\ = (\MuxOitava|dataOut[11]~55_combout\ & (!\Sin|addr_q_1[2]~11\ & VCC)) # (!\MuxOitava|dataOut[11]~55_combout\ & (\Sin|addr_q_1[2]~11\ $ (GND)))
-- \Sin|addr_q_1[3]~13\ = CARRY((!\MuxOitava|dataOut[11]~55_combout\ & !\Sin|addr_q_1[2]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \MuxOitava|dataOut[11]~55_combout\,
	datad => VCC,
	cin => \Sin|addr_q_1[2]~11\,
	combout => \Sin|addr_q_1[3]~12_combout\,
	cout => \Sin|addr_q_1[3]~13\);

-- Location: FF_X16_Y35_N9
\Sin|addr_q_1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|addr_q_1[3]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|addr_q_1\(3));

-- Location: LCCOMB_X16_Y35_N10
\Sin|addr_q_1[4]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|addr_q_1[4]~14_combout\ = (\MuxOitava|dataOut[12]~47_combout\ & ((\Sin|addr_q_1[3]~13\) # (GND))) # (!\MuxOitava|dataOut[12]~47_combout\ & (!\Sin|addr_q_1[3]~13\))
-- \Sin|addr_q_1[4]~15\ = CARRY((\MuxOitava|dataOut[12]~47_combout\) # (!\Sin|addr_q_1[3]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MuxOitava|dataOut[12]~47_combout\,
	datad => VCC,
	cin => \Sin|addr_q_1[3]~13\,
	combout => \Sin|addr_q_1[4]~14_combout\,
	cout => \Sin|addr_q_1[4]~15\);

-- Location: FF_X16_Y35_N11
\Sin|addr_q_1[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|addr_q_1[4]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|addr_q_1\(4));

-- Location: LCCOMB_X16_Y35_N12
\Sin|addr_q_1[5]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|addr_q_1[5]~16_combout\ = (\MuxOitava|dataOut[13]~56_combout\ & (!\Sin|addr_q_1[4]~15\ & VCC)) # (!\MuxOitava|dataOut[13]~56_combout\ & (\Sin|addr_q_1[4]~15\ $ (GND)))
-- \Sin|addr_q_1[5]~17\ = CARRY((!\MuxOitava|dataOut[13]~56_combout\ & !\Sin|addr_q_1[4]~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MuxOitava|dataOut[13]~56_combout\,
	datad => VCC,
	cin => \Sin|addr_q_1[4]~15\,
	combout => \Sin|addr_q_1[5]~16_combout\,
	cout => \Sin|addr_q_1[5]~17\);

-- Location: FF_X16_Y35_N13
\Sin|addr_q_1[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|addr_q_1[5]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|addr_q_1\(5));

-- Location: LCCOMB_X16_Y35_N14
\Sin|addr_q_1[6]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|addr_q_1[6]~18_combout\ = (\MuxOitava|dataOut[14]~57_combout\ & ((\Sin|addr_q_1[5]~17\) # (GND))) # (!\MuxOitava|dataOut[14]~57_combout\ & (!\Sin|addr_q_1[5]~17\))
-- \Sin|addr_q_1[6]~19\ = CARRY((\MuxOitava|dataOut[14]~57_combout\) # (!\Sin|addr_q_1[5]~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MuxOitava|dataOut[14]~57_combout\,
	datad => VCC,
	cin => \Sin|addr_q_1[5]~17\,
	combout => \Sin|addr_q_1[6]~18_combout\,
	cout => \Sin|addr_q_1[6]~19\);

-- Location: FF_X16_Y35_N15
\Sin|addr_q_1[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|addr_q_1[6]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|addr_q_1\(6));

-- Location: LCCOMB_X16_Y35_N16
\Sin|addr_q_1[7]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|addr_q_1[7]~20_combout\ = (\MuxOitava|dataOut[15]~58_combout\ & (\Sin|addr_q_1[6]~19\ $ (GND))) # (!\MuxOitava|dataOut[15]~58_combout\ & (!\Sin|addr_q_1[6]~19\ & VCC))
-- \Sin|addr_q_1[7]~21\ = CARRY((\MuxOitava|dataOut[15]~58_combout\ & !\Sin|addr_q_1[6]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \MuxOitava|dataOut[15]~58_combout\,
	datad => VCC,
	cin => \Sin|addr_q_1[6]~19\,
	combout => \Sin|addr_q_1[7]~20_combout\,
	cout => \Sin|addr_q_1[7]~21\);

-- Location: FF_X16_Y35_N17
\Sin|addr_q_1[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|addr_q_1[7]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|addr_q_1\(7));

-- Location: LCCOMB_X16_Y35_N0
\ROM|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ROM|Mux0~0_combout\ = (s_dados_do_ps2(3)) # (s_dados_do_ps2(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => s_dados_do_ps2(3),
	datad => s_dados_do_ps2(2),
	combout => \ROM|Mux0~0_combout\);

-- Location: LCCOMB_X16_Y35_N18
\Sin|addr_q_1[8]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|addr_q_1[8]~22_combout\ = \Sin|addr_q_1[7]~21\ $ (((\TestaOitava|isOctave~0_combout\ & \ROM|Mux0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \TestaOitava|isOctave~0_combout\,
	datad => \ROM|Mux0~0_combout\,
	cin => \Sin|addr_q_1[7]~21\,
	combout => \Sin|addr_q_1[8]~22_combout\);

-- Location: FF_X16_Y35_N19
\Sin|addr_q_1[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|addr_q_1[8]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|addr_q_1\(8));

-- Location: M9K_X15_Y35_N0
\Sin|rom_rtl_0|auto_generated|ram_block1a0\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init4 => X"0032401920096C032400FB404B6015FC064801C4407D902288096B028CC0AFB02F100C8C035500E1C03B8C0FAB041CC113A0480412C804E3C14550547015E205AA0176E060CC18F9066F81A8306D1C1C0B0733C1D930795C1F1A07F74209F08588222408B9423A60919C2528097A026A809D9C28270A39429A40A9882B1F0AF7",
	mem_init3 => X"02C990B5542E110BB302F870C10830FC0C6D4326E0CC9C33DF0D258354D0D81036BA0DDBC38240E364398D0E9003AF30EE943C560F4203DB80F9A03F170FF1840741048441CE109E8432510F40447B1149045CD119D4471D11F0C486A1243C49B4129604AFB12E784C40133844D81138844EC013D784FFB1426051331473C526914C08539B150CC54CA1558055F515A28571E15EC05843163505964167D05A8216C405B9D170A45CB4174F85DC7179405ED717D785FE3181A060EC185BC61F1189C862F218DC463EF191B064E81958C65DE1995C66CF19D1867BD1A0C868A61A464698C1A7F46A6D1AB706B4B1AEE06C241B23C6CF91B5886DCA1B8C06E961BB",
	mem_init2 => X"EC6F5F1BF0470231C20C70E21C504719E1C7E872551CABC73071CD7C73B51D02C745F1D2C875041D55475A51D7D076411DA3876D91DC8C776C1DED077FA1E10078841E31C79091E528798A1E7207A051E9087A7D1EAD87AEF1EC987B5D1EE487BC51EFE07C291F1687C891F2DC7CE31F43C7D391F5887D8A1F6C47DD61F7E87E1D1F8FC7E5F1F9FC7E9D1FAE87ED51FBC07F091FC847F381FD347F621FDD47F871FE5C7FA71FED47FC21FF387FD81FF847FE91FFC07FF61FFE87FFD1FFFC7FFF1FFFC7FFD1FFE87FF61FFC07FE91FF847FD81FF387FC21FED47FA71FE5C7F871FDD47F621FD347F381FC847F091FBC07ED51FAE87E9D1F9FC7E5F1F8FC7E1D1F",
	mem_init1 => X"7E87DD61F6C47D8A1F5887D391F43C7CE31F2DC7C891F1687C291EFE07BC51EE487B5D1EC987AEF1EAD87A7D1E9087A051E720798A1E52879091E31C78841E10077FA1DED0776C1DC8C76D91DA3876411D7D075A51D55475041D2C8745F1D02C73B51CD7C73071CABC72551C7E8719E1C50470E21C20C70231BF046F5F1BBEC6E961B8C06DCA1B5886CF91B23C6C241AEE06B4B1AB706A6D1A7F4698C1A46468A61A0C867BD19D1866CF1995C65DE1958C64E8191B063EF18DC462F2189C861F1185BC60EC181A05FE317D785ED7179405DC7174F85CB4170A45B9D16C405A82167D0596416350584315EC0571E15A2855F51558054CA150CC539B14C0852691",
	mem_init0 => X"473C5133142604FFB13D784EC0138844D81133844C4012E784AFB1296049B41243C486A11F0C471D119D445CD11490447B10F404325109E841CE1048440740FF183F170F9A03DB80F4203C560EE943AF30E900398D0E36438240DDBC36BA0D810354D0D25833DF0CC9C326E0C6D430FC0C1082F870BB302E110B5542C990AF702B1F0A98829A40A394282709D9C26A8097A025280919C23A608B94222408588209F07F741F1A0795C1D930733C1C0B06D1C1A83066F818F9060CC176E05AA015E205470145504E3C12C804804113A041CC0FAB03B8C0E1C035500C8C02F100AFB028CC096B0228807D901C440648015FC04B600FB403240096C0192003240000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/AudioSynth.ram0_sin_function_a757bb03.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sin_function:Sin|altsyncram:rom_rtl_0|altsyncram_3lp1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 9,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 18,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 511,
	port_a_logical_ram_depth => 512,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 9,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 18,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 511,
	port_b_logical_ram_depth => 512,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_with_nbe_read",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	portadatain => \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portbdatain => \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTBDATAIN_bus\,
	portaaddr => \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\,
	portbdataout => \Sin|rom_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X19_Y35_N0
\MuxOitava|dataOut[0]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \MuxOitava|dataOut[0]~43_combout\ = (s_dados_do_ps2(3)) # ((s_dados_do_ps2(1) & ((s_dados_do_ps2(2)))) # (!s_dados_do_ps2(1) & (s_dados_do_ps2(0) & !s_dados_do_ps2(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_do_ps2(0),
	datab => s_dados_do_ps2(3),
	datac => s_dados_do_ps2(1),
	datad => s_dados_do_ps2(2),
	combout => \MuxOitava|dataOut[0]~43_combout\);

-- Location: LCCOMB_X19_Y35_N10
\Sin|factor_q_1[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|factor_q_1[0]~0_combout\ = !\MuxOitava|dataOut[0]~43_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \MuxOitava|dataOut[0]~43_combout\,
	combout => \Sin|factor_q_1[0]~0_combout\);

-- Location: FF_X19_Y35_N11
\Sin|factor_q_1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|factor_q_1[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|factor_q_1\(0));

-- Location: LCCOMB_X19_Y35_N20
\Sin|factor_q_2[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|factor_q_2[0]~feeder_combout\ = \Sin|factor_q_1\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Sin|factor_q_1\(0),
	combout => \Sin|factor_q_2[0]~feeder_combout\);

-- Location: FF_X19_Y35_N21
\Sin|factor_q_2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|factor_q_2[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|factor_q_2\(0));

-- Location: LCCOMB_X21_Y35_N28
\MuxOitava|dataOut[1]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \MuxOitava|dataOut[1]~44_combout\ = (!s_dados_do_ps2(2) & ((s_dados_do_ps2(0) & ((s_dados_do_ps2(1)))) # (!s_dados_do_ps2(0) & (s_dados_do_ps2(3) & !s_dados_do_ps2(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_do_ps2(0),
	datab => s_dados_do_ps2(3),
	datac => s_dados_do_ps2(1),
	datad => s_dados_do_ps2(2),
	combout => \MuxOitava|dataOut[1]~44_combout\);

-- Location: FF_X21_Y35_N29
\Sin|factor_q_1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \MuxOitava|dataOut[1]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|factor_q_1\(1));

-- Location: LCCOMB_X21_Y35_N14
\Sin|factor_q_2[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|factor_q_2[1]~feeder_combout\ = \Sin|factor_q_1\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Sin|factor_q_1\(1),
	combout => \Sin|factor_q_2[1]~feeder_combout\);

-- Location: FF_X21_Y35_N15
\Sin|factor_q_2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|factor_q_2[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|factor_q_2\(1));

-- Location: LCCOMB_X21_Y35_N2
\MuxOitava|dataOut[2]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \MuxOitava|dataOut[2]~48_combout\ = (s_dados_do_ps2(3) & (((s_dados_do_ps2(1) & !s_dados_do_ps2(2))))) # (!s_dados_do_ps2(3) & ((s_dados_do_ps2(2) & ((!s_dados_do_ps2(1)))) # (!s_dados_do_ps2(2) & (!s_dados_do_ps2(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001111010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_do_ps2(0),
	datab => s_dados_do_ps2(3),
	datac => s_dados_do_ps2(1),
	datad => s_dados_do_ps2(2),
	combout => \MuxOitava|dataOut[2]~48_combout\);

-- Location: FF_X21_Y35_N3
\Sin|factor_q_1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \MuxOitava|dataOut[2]~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|factor_q_1\(2));

-- Location: LCCOMB_X21_Y35_N4
\Sin|factor_q_2[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|factor_q_2[2]~feeder_combout\ = \Sin|factor_q_1\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Sin|factor_q_1\(2),
	combout => \Sin|factor_q_2[2]~feeder_combout\);

-- Location: FF_X21_Y35_N5
\Sin|factor_q_2[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|factor_q_2[2]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|factor_q_2\(2));

-- Location: LCCOMB_X21_Y35_N0
\MuxOitava|dataOut[3]~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \MuxOitava|dataOut[3]~49_combout\ = (s_dados_do_ps2(3) & (!s_dados_do_ps2(2) & ((s_dados_do_ps2(1)) # (!s_dados_do_ps2(0))))) # (!s_dados_do_ps2(3) & (s_dados_do_ps2(0) $ (((s_dados_do_ps2(1) & s_dados_do_ps2(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001011100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_do_ps2(0),
	datab => s_dados_do_ps2(3),
	datac => s_dados_do_ps2(1),
	datad => s_dados_do_ps2(2),
	combout => \MuxOitava|dataOut[3]~49_combout\);

-- Location: FF_X21_Y35_N1
\Sin|factor_q_1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \MuxOitava|dataOut[3]~49_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|factor_q_1\(3));

-- Location: LCCOMB_X21_Y35_N6
\Sin|factor_q_2[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|factor_q_2[3]~feeder_combout\ = \Sin|factor_q_1\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Sin|factor_q_1\(3),
	combout => \Sin|factor_q_2[3]~feeder_combout\);

-- Location: FF_X21_Y35_N7
\Sin|factor_q_2[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|factor_q_2[3]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|factor_q_2\(3));

-- Location: LCCOMB_X21_Y35_N18
\MuxOitava|dataOut[4]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \MuxOitava|dataOut[4]~50_combout\ = (!s_dados_do_ps2(0) & !s_dados_do_ps2(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_do_ps2(0),
	datad => s_dados_do_ps2(2),
	combout => \MuxOitava|dataOut[4]~50_combout\);

-- Location: FF_X21_Y35_N19
\Sin|factor_q_1[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \MuxOitava|dataOut[4]~50_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|factor_q_1\(4));

-- Location: LCCOMB_X21_Y35_N12
\Sin|factor_q_2[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|factor_q_2[4]~feeder_combout\ = \Sin|factor_q_1\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Sin|factor_q_1\(4),
	combout => \Sin|factor_q_2[4]~feeder_combout\);

-- Location: FF_X21_Y35_N13
\Sin|factor_q_2[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|factor_q_2[4]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|factor_q_2\(4));

-- Location: LCCOMB_X21_Y35_N26
\MuxOitava|dataOut[5]~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \MuxOitava|dataOut[5]~53_combout\ = (s_dados_do_ps2(0) & (s_dados_do_ps2(3) $ (((!s_dados_do_ps2(2)))))) # (!s_dados_do_ps2(0) & ((s_dados_do_ps2(2)) # ((s_dados_do_ps2(3) & s_dados_do_ps2(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110101100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_do_ps2(0),
	datab => s_dados_do_ps2(3),
	datac => s_dados_do_ps2(1),
	datad => s_dados_do_ps2(2),
	combout => \MuxOitava|dataOut[5]~53_combout\);

-- Location: LCCOMB_X21_Y35_N16
\Sin|factor_q_1[5]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|factor_q_1[5]~1_combout\ = !\MuxOitava|dataOut[5]~53_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MuxOitava|dataOut[5]~53_combout\,
	combout => \Sin|factor_q_1[5]~1_combout\);

-- Location: FF_X21_Y35_N17
\Sin|factor_q_1[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|factor_q_1[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|factor_q_1\(5));

-- Location: LCCOMB_X21_Y35_N30
\Sin|factor_q_2[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|factor_q_2[5]~feeder_combout\ = \Sin|factor_q_1\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Sin|factor_q_1\(5),
	combout => \Sin|factor_q_2[5]~feeder_combout\);

-- Location: FF_X21_Y35_N31
\Sin|factor_q_2[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|factor_q_2[5]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|factor_q_2\(5));

-- Location: LCCOMB_X21_Y35_N22
\MuxOitava|dataOut[6]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \MuxOitava|dataOut[6]~52_combout\ = (s_dados_do_ps2(3) & (s_dados_do_ps2(0) & ((!s_dados_do_ps2(2))))) # (!s_dados_do_ps2(3) & (!s_dados_do_ps2(1) & ((s_dados_do_ps2(0)) # (s_dados_do_ps2(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001110001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_do_ps2(0),
	datab => s_dados_do_ps2(3),
	datac => s_dados_do_ps2(1),
	datad => s_dados_do_ps2(2),
	combout => \MuxOitava|dataOut[6]~52_combout\);

-- Location: FF_X21_Y35_N23
\Sin|factor_q_1[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \MuxOitava|dataOut[6]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|factor_q_1\(6));

-- Location: FF_X21_Y35_N25
\Sin|factor_q_2[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \Sin|factor_q_1\(6),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|factor_q_2\(6));

-- Location: LCCOMB_X21_Y35_N20
\MuxOitava|dataOut[7]~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \MuxOitava|dataOut[7]~51_combout\ = (s_dados_do_ps2(3) & (s_dados_do_ps2(0) & ((!s_dados_do_ps2(2))))) # (!s_dados_do_ps2(3) & ((s_dados_do_ps2(2) & (!s_dados_do_ps2(0))) # (!s_dados_do_ps2(2) & ((s_dados_do_ps2(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_do_ps2(0),
	datab => s_dados_do_ps2(3),
	datac => s_dados_do_ps2(1),
	datad => s_dados_do_ps2(2),
	combout => \MuxOitava|dataOut[7]~51_combout\);

-- Location: FF_X21_Y35_N21
\Sin|factor_q_1[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \MuxOitava|dataOut[7]~51_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|factor_q_1\(7));

-- Location: LCCOMB_X21_Y35_N10
\Sin|factor_q_2[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|factor_q_2[7]~feeder_combout\ = \Sin|factor_q_1\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Sin|factor_q_1\(7),
	combout => \Sin|factor_q_2[7]~feeder_combout\);

-- Location: FF_X21_Y35_N11
\Sin|factor_q_2[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|factor_q_2[7]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|factor_q_2\(7));

-- Location: DSPMULT_X22_Y35_N0
\Sin|Mult1|auto_generated|mac_mult1\ : cycloneive_mac_mult
-- pragma translate_off
GENERIC MAP (
	dataa_clock => "0",
	dataa_width => 18,
	datab_clock => "0",
	datab_width => 18,
	signa_clock => "none",
	signb_clock => "none")
-- pragma translate_on
PORT MAP (
	signa => VCC,
	signb => VCC,
	clk => \CLOCK_50~inputclkctrl_outclk\,
	aclr => GND,
	ena => VCC,
	dataa => \Sin|Mult1|auto_generated|mac_mult1_DATAA_bus\,
	datab => \Sin|Mult1|auto_generated|mac_mult1_DATAB_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	dataout => \Sin|Mult1|auto_generated|mac_mult1_DATAOUT_bus\);

-- Location: DSPOUT_X22_Y35_N2
\Sin|Mult1|auto_generated|mac_out2\ : cycloneive_mac_out
-- pragma translate_off
GENERIC MAP (
	dataa_width => 36,
	output_clock => "0")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	aclr => GND,
	ena => VCC,
	dataa => \Sin|Mult1|auto_generated|mac_out2_DATAA_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	dataout => \Sin|Mult1|auto_generated|mac_out2_DATAOUT_bus\);

-- Location: LCCOMB_X21_Y36_N16
\Sin|factor_p_1[1]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|factor_p_1[1]~8_combout\ = (\MuxOitava|dataOut[1]~44_combout\ & (\MuxOitava|dataOut[0]~43_combout\ & VCC)) # (!\MuxOitava|dataOut[1]~44_combout\ & (\MuxOitava|dataOut[0]~43_combout\ $ (VCC)))
-- \Sin|factor_p_1[1]~9\ = CARRY((!\MuxOitava|dataOut[1]~44_combout\ & \MuxOitava|dataOut[0]~43_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MuxOitava|dataOut[1]~44_combout\,
	datab => \MuxOitava|dataOut[0]~43_combout\,
	datad => VCC,
	combout => \Sin|factor_p_1[1]~8_combout\,
	cout => \Sin|factor_p_1[1]~9\);

-- Location: FF_X21_Y36_N17
\Sin|factor_p_1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|factor_p_1[1]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|factor_p_1\(1));

-- Location: LCCOMB_X21_Y36_N8
\Sin|factor_p_2[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|factor_p_2[1]~feeder_combout\ = \Sin|factor_p_1\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Sin|factor_p_1\(1),
	combout => \Sin|factor_p_2[1]~feeder_combout\);

-- Location: FF_X21_Y36_N9
\Sin|factor_p_2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|factor_p_2[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|factor_p_2\(1));

-- Location: LCCOMB_X21_Y36_N18
\Sin|factor_p_1[2]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|factor_p_1[2]~10_combout\ = (\MuxOitava|dataOut[2]~48_combout\ & ((\Sin|factor_p_1[1]~9\) # (GND))) # (!\MuxOitava|dataOut[2]~48_combout\ & (!\Sin|factor_p_1[1]~9\))
-- \Sin|factor_p_1[2]~11\ = CARRY((\MuxOitava|dataOut[2]~48_combout\) # (!\Sin|factor_p_1[1]~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \MuxOitava|dataOut[2]~48_combout\,
	datad => VCC,
	cin => \Sin|factor_p_1[1]~9\,
	combout => \Sin|factor_p_1[2]~10_combout\,
	cout => \Sin|factor_p_1[2]~11\);

-- Location: FF_X21_Y36_N19
\Sin|factor_p_1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|factor_p_1[2]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|factor_p_1\(2));

-- Location: LCCOMB_X21_Y36_N14
\Sin|factor_p_2[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|factor_p_2[2]~feeder_combout\ = \Sin|factor_p_1\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Sin|factor_p_1\(2),
	combout => \Sin|factor_p_2[2]~feeder_combout\);

-- Location: FF_X21_Y36_N15
\Sin|factor_p_2[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|factor_p_2[2]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|factor_p_2\(2));

-- Location: LCCOMB_X21_Y36_N20
\Sin|factor_p_1[3]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|factor_p_1[3]~12_combout\ = (\MuxOitava|dataOut[3]~49_combout\ & (!\Sin|factor_p_1[2]~11\ & VCC)) # (!\MuxOitava|dataOut[3]~49_combout\ & (\Sin|factor_p_1[2]~11\ $ (GND)))
-- \Sin|factor_p_1[3]~13\ = CARRY((!\MuxOitava|dataOut[3]~49_combout\ & !\Sin|factor_p_1[2]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \MuxOitava|dataOut[3]~49_combout\,
	datad => VCC,
	cin => \Sin|factor_p_1[2]~11\,
	combout => \Sin|factor_p_1[3]~12_combout\,
	cout => \Sin|factor_p_1[3]~13\);

-- Location: FF_X21_Y36_N21
\Sin|factor_p_1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|factor_p_1[3]~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|factor_p_1\(3));

-- Location: LCCOMB_X21_Y36_N4
\Sin|factor_p_2[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|factor_p_2[3]~feeder_combout\ = \Sin|factor_p_1\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Sin|factor_p_1\(3),
	combout => \Sin|factor_p_2[3]~feeder_combout\);

-- Location: FF_X21_Y36_N5
\Sin|factor_p_2[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|factor_p_2[3]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|factor_p_2\(3));

-- Location: LCCOMB_X21_Y36_N22
\Sin|factor_p_1[4]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|factor_p_1[4]~14_combout\ = (\MuxOitava|dataOut[4]~50_combout\ & ((\Sin|factor_p_1[3]~13\) # (GND))) # (!\MuxOitava|dataOut[4]~50_combout\ & (!\Sin|factor_p_1[3]~13\))
-- \Sin|factor_p_1[4]~15\ = CARRY((\MuxOitava|dataOut[4]~50_combout\) # (!\Sin|factor_p_1[3]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MuxOitava|dataOut[4]~50_combout\,
	datad => VCC,
	cin => \Sin|factor_p_1[3]~13\,
	combout => \Sin|factor_p_1[4]~14_combout\,
	cout => \Sin|factor_p_1[4]~15\);

-- Location: FF_X21_Y36_N23
\Sin|factor_p_1[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|factor_p_1[4]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|factor_p_1\(4));

-- Location: FF_X21_Y36_N7
\Sin|factor_p_2[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \Sin|factor_p_1\(4),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|factor_p_2\(4));

-- Location: LCCOMB_X21_Y36_N24
\Sin|factor_p_1[5]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|factor_p_1[5]~16_combout\ = (\MuxOitava|dataOut[5]~53_combout\ & (\Sin|factor_p_1[4]~15\ $ (GND))) # (!\MuxOitava|dataOut[5]~53_combout\ & (!\Sin|factor_p_1[4]~15\ & VCC))
-- \Sin|factor_p_1[5]~17\ = CARRY((\MuxOitava|dataOut[5]~53_combout\ & !\Sin|factor_p_1[4]~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MuxOitava|dataOut[5]~53_combout\,
	datad => VCC,
	cin => \Sin|factor_p_1[4]~15\,
	combout => \Sin|factor_p_1[5]~16_combout\,
	cout => \Sin|factor_p_1[5]~17\);

-- Location: FF_X21_Y36_N25
\Sin|factor_p_1[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|factor_p_1[5]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|factor_p_1\(5));

-- Location: LCCOMB_X21_Y36_N12
\Sin|factor_p_2[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|factor_p_2[5]~feeder_combout\ = \Sin|factor_p_1\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Sin|factor_p_1\(5),
	combout => \Sin|factor_p_2[5]~feeder_combout\);

-- Location: FF_X21_Y36_N13
\Sin|factor_p_2[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|factor_p_2[5]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|factor_p_2\(5));

-- Location: LCCOMB_X21_Y36_N26
\Sin|factor_p_1[6]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|factor_p_1[6]~18_combout\ = (\MuxOitava|dataOut[6]~52_combout\ & ((\Sin|factor_p_1[5]~17\) # (GND))) # (!\MuxOitava|dataOut[6]~52_combout\ & (!\Sin|factor_p_1[5]~17\))
-- \Sin|factor_p_1[6]~19\ = CARRY((\MuxOitava|dataOut[6]~52_combout\) # (!\Sin|factor_p_1[5]~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MuxOitava|dataOut[6]~52_combout\,
	datad => VCC,
	cin => \Sin|factor_p_1[5]~17\,
	combout => \Sin|factor_p_1[6]~18_combout\,
	cout => \Sin|factor_p_1[6]~19\);

-- Location: FF_X21_Y36_N27
\Sin|factor_p_1[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|factor_p_1[6]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|factor_p_1\(6));

-- Location: FF_X21_Y36_N11
\Sin|factor_p_2[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \Sin|factor_p_1\(6),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|factor_p_2\(6));

-- Location: LCCOMB_X21_Y36_N28
\Sin|factor_p_1[7]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|factor_p_1[7]~20_combout\ = (\MuxOitava|dataOut[7]~51_combout\ & (!\Sin|factor_p_1[6]~19\ & VCC)) # (!\MuxOitava|dataOut[7]~51_combout\ & (\Sin|factor_p_1[6]~19\ $ (GND)))
-- \Sin|factor_p_1[7]~21\ = CARRY((!\MuxOitava|dataOut[7]~51_combout\ & !\Sin|factor_p_1[6]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \MuxOitava|dataOut[7]~51_combout\,
	datad => VCC,
	cin => \Sin|factor_p_1[6]~19\,
	combout => \Sin|factor_p_1[7]~20_combout\,
	cout => \Sin|factor_p_1[7]~21\);

-- Location: FF_X21_Y36_N29
\Sin|factor_p_1[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|factor_p_1[7]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|factor_p_1\(7));

-- Location: LCCOMB_X21_Y36_N0
\Sin|factor_p_2[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|factor_p_2[7]~feeder_combout\ = \Sin|factor_p_1\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Sin|factor_p_1\(7),
	combout => \Sin|factor_p_2[7]~feeder_combout\);

-- Location: FF_X21_Y36_N1
\Sin|factor_p_2[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|factor_p_2[7]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|factor_p_2\(7));

-- Location: LCCOMB_X21_Y36_N30
\Sin|factor_p_1[8]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|factor_p_1[8]~22_combout\ = \Sin|factor_p_1[7]~21\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Sin|factor_p_1[7]~21\,
	combout => \Sin|factor_p_1[8]~22_combout\);

-- Location: FF_X21_Y36_N31
\Sin|factor_p_1[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|factor_p_1[8]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|factor_p_1\(8));

-- Location: FF_X21_Y36_N3
\Sin|factor_p_2[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \Sin|factor_p_1\(8),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|factor_p_2\(8));

-- Location: DSPMULT_X22_Y36_N0
\Sin|Mult0|auto_generated|mac_mult1\ : cycloneive_mac_mult
-- pragma translate_off
GENERIC MAP (
	dataa_clock => "0",
	dataa_width => 18,
	datab_clock => "0",
	datab_width => 18,
	signa_clock => "none",
	signb_clock => "none")
-- pragma translate_on
PORT MAP (
	signa => VCC,
	signb => VCC,
	clk => \CLOCK_50~inputclkctrl_outclk\,
	aclr => GND,
	ena => VCC,
	dataa => \Sin|Mult0|auto_generated|mac_mult1_DATAA_bus\,
	datab => \Sin|Mult0|auto_generated|mac_mult1_DATAB_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	dataout => \Sin|Mult0|auto_generated|mac_mult1_DATAOUT_bus\);

-- Location: DSPOUT_X22_Y36_N2
\Sin|Mult0|auto_generated|mac_out2\ : cycloneive_mac_out
-- pragma translate_off
GENERIC MAP (
	dataa_width => 36,
	output_clock => "0")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	aclr => GND,
	ena => VCC,
	dataa => \Sin|Mult0|auto_generated|mac_out2_DATAA_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	dataout => \Sin|Mult0|auto_generated|mac_out2_DATAOUT_bus\);

-- Location: LCCOMB_X23_Y36_N8
\Sin|sin_5[0]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|sin_5[0]~17_cout\ = CARRY((\Sin|prod_q_4\(0) & \Sin|prod_p_4\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|prod_q_4\(0),
	datab => \Sin|prod_p_4\(0),
	datad => VCC,
	cout => \Sin|sin_5[0]~17_cout\);

-- Location: LCCOMB_X23_Y36_N10
\Sin|sin_5[0]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|sin_5[0]~19_cout\ = CARRY((\Sin|prod_p_4\(1) & (!\Sin|prod_q_4\(1) & !\Sin|sin_5[0]~17_cout\)) # (!\Sin|prod_p_4\(1) & ((!\Sin|sin_5[0]~17_cout\) # (!\Sin|prod_q_4\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|prod_p_4\(1),
	datab => \Sin|prod_q_4\(1),
	datad => VCC,
	cin => \Sin|sin_5[0]~17_cout\,
	cout => \Sin|sin_5[0]~19_cout\);

-- Location: LCCOMB_X23_Y36_N12
\Sin|sin_5[0]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|sin_5[0]~21_cout\ = CARRY((\Sin|prod_p_4\(2) & ((\Sin|prod_q_4\(2)) # (!\Sin|sin_5[0]~19_cout\))) # (!\Sin|prod_p_4\(2) & (\Sin|prod_q_4\(2) & !\Sin|sin_5[0]~19_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|prod_p_4\(2),
	datab => \Sin|prod_q_4\(2),
	datad => VCC,
	cin => \Sin|sin_5[0]~19_cout\,
	cout => \Sin|sin_5[0]~21_cout\);

-- Location: LCCOMB_X23_Y36_N14
\Sin|sin_5[0]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|sin_5[0]~23_cout\ = CARRY((\Sin|prod_q_4\(3) & (!\Sin|prod_p_4\(3) & !\Sin|sin_5[0]~21_cout\)) # (!\Sin|prod_q_4\(3) & ((!\Sin|sin_5[0]~21_cout\) # (!\Sin|prod_p_4\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|prod_q_4\(3),
	datab => \Sin|prod_p_4\(3),
	datad => VCC,
	cin => \Sin|sin_5[0]~21_cout\,
	cout => \Sin|sin_5[0]~23_cout\);

-- Location: LCCOMB_X23_Y36_N16
\Sin|sin_5[0]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|sin_5[0]~25_cout\ = CARRY((\Sin|prod_q_4\(4) & ((\Sin|prod_p_4\(4)) # (!\Sin|sin_5[0]~23_cout\))) # (!\Sin|prod_q_4\(4) & (\Sin|prod_p_4\(4) & !\Sin|sin_5[0]~23_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|prod_q_4\(4),
	datab => \Sin|prod_p_4\(4),
	datad => VCC,
	cin => \Sin|sin_5[0]~23_cout\,
	cout => \Sin|sin_5[0]~25_cout\);

-- Location: LCCOMB_X23_Y36_N18
\Sin|sin_5[0]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|sin_5[0]~27_cout\ = CARRY((\Sin|prod_q_4\(5) & (!\Sin|prod_p_4\(5) & !\Sin|sin_5[0]~25_cout\)) # (!\Sin|prod_q_4\(5) & ((!\Sin|sin_5[0]~25_cout\) # (!\Sin|prod_p_4\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|prod_q_4\(5),
	datab => \Sin|prod_p_4\(5),
	datad => VCC,
	cin => \Sin|sin_5[0]~25_cout\,
	cout => \Sin|sin_5[0]~27_cout\);

-- Location: LCCOMB_X23_Y36_N20
\Sin|sin_5[0]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|sin_5[0]~29_cout\ = CARRY((\Sin|prod_p_4\(6) & ((\Sin|prod_q_4\(6)) # (!\Sin|sin_5[0]~27_cout\))) # (!\Sin|prod_p_4\(6) & (\Sin|prod_q_4\(6) & !\Sin|sin_5[0]~27_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|prod_p_4\(6),
	datab => \Sin|prod_q_4\(6),
	datad => VCC,
	cin => \Sin|sin_5[0]~27_cout\,
	cout => \Sin|sin_5[0]~29_cout\);

-- Location: LCCOMB_X23_Y36_N22
\Sin|sin_5[0]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|sin_5[0]~31_cout\ = CARRY((\Sin|prod_q_4\(7) & (!\Sin|prod_p_4\(7) & !\Sin|sin_5[0]~29_cout\)) # (!\Sin|prod_q_4\(7) & ((!\Sin|sin_5[0]~29_cout\) # (!\Sin|prod_p_4\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|prod_q_4\(7),
	datab => \Sin|prod_p_4\(7),
	datad => VCC,
	cin => \Sin|sin_5[0]~29_cout\,
	cout => \Sin|sin_5[0]~31_cout\);

-- Location: LCCOMB_X23_Y36_N24
\Sin|sin_5[0]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|sin_5[0]~32_combout\ = ((\Sin|prod_q_4\(8) $ (\Sin|prod_p_4\(8) $ (!\Sin|sin_5[0]~31_cout\)))) # (GND)
-- \Sin|sin_5[0]~33\ = CARRY((\Sin|prod_q_4\(8) & ((\Sin|prod_p_4\(8)) # (!\Sin|sin_5[0]~31_cout\))) # (!\Sin|prod_q_4\(8) & (\Sin|prod_p_4\(8) & !\Sin|sin_5[0]~31_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|prod_q_4\(8),
	datab => \Sin|prod_p_4\(8),
	datad => VCC,
	cin => \Sin|sin_5[0]~31_cout\,
	combout => \Sin|sin_5[0]~32_combout\,
	cout => \Sin|sin_5[0]~33\);

-- Location: LCCOMB_X23_Y36_N26
\Sin|sin_5[1]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|sin_5[1]~34_combout\ = (\Sin|prod_p_4\(9) & ((\Sin|prod_q_4\(9) & (\Sin|sin_5[0]~33\ & VCC)) # (!\Sin|prod_q_4\(9) & (!\Sin|sin_5[0]~33\)))) # (!\Sin|prod_p_4\(9) & ((\Sin|prod_q_4\(9) & (!\Sin|sin_5[0]~33\)) # (!\Sin|prod_q_4\(9) & 
-- ((\Sin|sin_5[0]~33\) # (GND)))))
-- \Sin|sin_5[1]~35\ = CARRY((\Sin|prod_p_4\(9) & (!\Sin|prod_q_4\(9) & !\Sin|sin_5[0]~33\)) # (!\Sin|prod_p_4\(9) & ((!\Sin|sin_5[0]~33\) # (!\Sin|prod_q_4\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|prod_p_4\(9),
	datab => \Sin|prod_q_4\(9),
	datad => VCC,
	cin => \Sin|sin_5[0]~33\,
	combout => \Sin|sin_5[1]~34_combout\,
	cout => \Sin|sin_5[1]~35\);

-- Location: LCCOMB_X23_Y36_N28
\Sin|sin_5[2]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|sin_5[2]~36_combout\ = ((\Sin|prod_q_4\(10) $ (\Sin|prod_p_4\(10) $ (!\Sin|sin_5[1]~35\)))) # (GND)
-- \Sin|sin_5[2]~37\ = CARRY((\Sin|prod_q_4\(10) & ((\Sin|prod_p_4\(10)) # (!\Sin|sin_5[1]~35\))) # (!\Sin|prod_q_4\(10) & (\Sin|prod_p_4\(10) & !\Sin|sin_5[1]~35\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|prod_q_4\(10),
	datab => \Sin|prod_p_4\(10),
	datad => VCC,
	cin => \Sin|sin_5[1]~35\,
	combout => \Sin|sin_5[2]~36_combout\,
	cout => \Sin|sin_5[2]~37\);

-- Location: LCCOMB_X23_Y36_N30
\Sin|sin_5[3]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|sin_5[3]~38_combout\ = (\Sin|prod_p_4\(11) & ((\Sin|prod_q_4\(11) & (\Sin|sin_5[2]~37\ & VCC)) # (!\Sin|prod_q_4\(11) & (!\Sin|sin_5[2]~37\)))) # (!\Sin|prod_p_4\(11) & ((\Sin|prod_q_4\(11) & (!\Sin|sin_5[2]~37\)) # (!\Sin|prod_q_4\(11) & 
-- ((\Sin|sin_5[2]~37\) # (GND)))))
-- \Sin|sin_5[3]~39\ = CARRY((\Sin|prod_p_4\(11) & (!\Sin|prod_q_4\(11) & !\Sin|sin_5[2]~37\)) # (!\Sin|prod_p_4\(11) & ((!\Sin|sin_5[2]~37\) # (!\Sin|prod_q_4\(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|prod_p_4\(11),
	datab => \Sin|prod_q_4\(11),
	datad => VCC,
	cin => \Sin|sin_5[2]~37\,
	combout => \Sin|sin_5[3]~38_combout\,
	cout => \Sin|sin_5[3]~39\);

-- Location: LCCOMB_X23_Y35_N0
\Sin|sin_5[4]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|sin_5[4]~40_combout\ = ((\Sin|prod_q_4\(12) $ (\Sin|prod_p_4\(12) $ (!\Sin|sin_5[3]~39\)))) # (GND)
-- \Sin|sin_5[4]~41\ = CARRY((\Sin|prod_q_4\(12) & ((\Sin|prod_p_4\(12)) # (!\Sin|sin_5[3]~39\))) # (!\Sin|prod_q_4\(12) & (\Sin|prod_p_4\(12) & !\Sin|sin_5[3]~39\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|prod_q_4\(12),
	datab => \Sin|prod_p_4\(12),
	datad => VCC,
	cin => \Sin|sin_5[3]~39\,
	combout => \Sin|sin_5[4]~40_combout\,
	cout => \Sin|sin_5[4]~41\);

-- Location: LCCOMB_X23_Y35_N2
\Sin|sin_5[5]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|sin_5[5]~42_combout\ = (\Sin|prod_p_4\(13) & ((\Sin|prod_q_4\(13) & (\Sin|sin_5[4]~41\ & VCC)) # (!\Sin|prod_q_4\(13) & (!\Sin|sin_5[4]~41\)))) # (!\Sin|prod_p_4\(13) & ((\Sin|prod_q_4\(13) & (!\Sin|sin_5[4]~41\)) # (!\Sin|prod_q_4\(13) & 
-- ((\Sin|sin_5[4]~41\) # (GND)))))
-- \Sin|sin_5[5]~43\ = CARRY((\Sin|prod_p_4\(13) & (!\Sin|prod_q_4\(13) & !\Sin|sin_5[4]~41\)) # (!\Sin|prod_p_4\(13) & ((!\Sin|sin_5[4]~41\) # (!\Sin|prod_q_4\(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|prod_p_4\(13),
	datab => \Sin|prod_q_4\(13),
	datad => VCC,
	cin => \Sin|sin_5[4]~41\,
	combout => \Sin|sin_5[5]~42_combout\,
	cout => \Sin|sin_5[5]~43\);

-- Location: LCCOMB_X23_Y35_N4
\Sin|sin_5[6]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|sin_5[6]~44_combout\ = ((\Sin|prod_q_4\(14) $ (\Sin|prod_p_4\(14) $ (!\Sin|sin_5[5]~43\)))) # (GND)
-- \Sin|sin_5[6]~45\ = CARRY((\Sin|prod_q_4\(14) & ((\Sin|prod_p_4\(14)) # (!\Sin|sin_5[5]~43\))) # (!\Sin|prod_q_4\(14) & (\Sin|prod_p_4\(14) & !\Sin|sin_5[5]~43\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|prod_q_4\(14),
	datab => \Sin|prod_p_4\(14),
	datad => VCC,
	cin => \Sin|sin_5[5]~43\,
	combout => \Sin|sin_5[6]~44_combout\,
	cout => \Sin|sin_5[6]~45\);

-- Location: LCCOMB_X23_Y35_N6
\Sin|sin_5[7]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|sin_5[7]~46_combout\ = (\Sin|prod_q_4\(15) & ((\Sin|prod_p_4\(15) & (\Sin|sin_5[6]~45\ & VCC)) # (!\Sin|prod_p_4\(15) & (!\Sin|sin_5[6]~45\)))) # (!\Sin|prod_q_4\(15) & ((\Sin|prod_p_4\(15) & (!\Sin|sin_5[6]~45\)) # (!\Sin|prod_p_4\(15) & 
-- ((\Sin|sin_5[6]~45\) # (GND)))))
-- \Sin|sin_5[7]~47\ = CARRY((\Sin|prod_q_4\(15) & (!\Sin|prod_p_4\(15) & !\Sin|sin_5[6]~45\)) # (!\Sin|prod_q_4\(15) & ((!\Sin|sin_5[6]~45\) # (!\Sin|prod_p_4\(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|prod_q_4\(15),
	datab => \Sin|prod_p_4\(15),
	datad => VCC,
	cin => \Sin|sin_5[6]~45\,
	combout => \Sin|sin_5[7]~46_combout\,
	cout => \Sin|sin_5[7]~47\);

-- Location: LCCOMB_X23_Y35_N8
\Sin|sin_5[8]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|sin_5[8]~48_combout\ = ((\Sin|prod_p_4\(16) $ (\Sin|prod_q_4\(16) $ (!\Sin|sin_5[7]~47\)))) # (GND)
-- \Sin|sin_5[8]~49\ = CARRY((\Sin|prod_p_4\(16) & ((\Sin|prod_q_4\(16)) # (!\Sin|sin_5[7]~47\))) # (!\Sin|prod_p_4\(16) & (\Sin|prod_q_4\(16) & !\Sin|sin_5[7]~47\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|prod_p_4\(16),
	datab => \Sin|prod_q_4\(16),
	datad => VCC,
	cin => \Sin|sin_5[7]~47\,
	combout => \Sin|sin_5[8]~48_combout\,
	cout => \Sin|sin_5[8]~49\);

-- Location: LCCOMB_X23_Y35_N10
\Sin|sin_5[9]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|sin_5[9]~50_combout\ = (\Sin|prod_q_4\(17) & ((\Sin|prod_p_4\(17) & (\Sin|sin_5[8]~49\ & VCC)) # (!\Sin|prod_p_4\(17) & (!\Sin|sin_5[8]~49\)))) # (!\Sin|prod_q_4\(17) & ((\Sin|prod_p_4\(17) & (!\Sin|sin_5[8]~49\)) # (!\Sin|prod_p_4\(17) & 
-- ((\Sin|sin_5[8]~49\) # (GND)))))
-- \Sin|sin_5[9]~51\ = CARRY((\Sin|prod_q_4\(17) & (!\Sin|prod_p_4\(17) & !\Sin|sin_5[8]~49\)) # (!\Sin|prod_q_4\(17) & ((!\Sin|sin_5[8]~49\) # (!\Sin|prod_p_4\(17)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|prod_q_4\(17),
	datab => \Sin|prod_p_4\(17),
	datad => VCC,
	cin => \Sin|sin_5[8]~49\,
	combout => \Sin|sin_5[9]~50_combout\,
	cout => \Sin|sin_5[9]~51\);

-- Location: LCCOMB_X23_Y35_N12
\Sin|sin_5[10]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|sin_5[10]~52_combout\ = ((\Sin|prod_q_4\(18) $ (\Sin|prod_p_4\(18) $ (!\Sin|sin_5[9]~51\)))) # (GND)
-- \Sin|sin_5[10]~53\ = CARRY((\Sin|prod_q_4\(18) & ((\Sin|prod_p_4\(18)) # (!\Sin|sin_5[9]~51\))) # (!\Sin|prod_q_4\(18) & (\Sin|prod_p_4\(18) & !\Sin|sin_5[9]~51\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|prod_q_4\(18),
	datab => \Sin|prod_p_4\(18),
	datad => VCC,
	cin => \Sin|sin_5[9]~51\,
	combout => \Sin|sin_5[10]~52_combout\,
	cout => \Sin|sin_5[10]~53\);

-- Location: LCCOMB_X23_Y35_N14
\Sin|sin_5[11]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|sin_5[11]~54_combout\ = (\Sin|prod_q_4\(19) & ((\Sin|prod_p_4\(19) & (\Sin|sin_5[10]~53\ & VCC)) # (!\Sin|prod_p_4\(19) & (!\Sin|sin_5[10]~53\)))) # (!\Sin|prod_q_4\(19) & ((\Sin|prod_p_4\(19) & (!\Sin|sin_5[10]~53\)) # (!\Sin|prod_p_4\(19) & 
-- ((\Sin|sin_5[10]~53\) # (GND)))))
-- \Sin|sin_5[11]~55\ = CARRY((\Sin|prod_q_4\(19) & (!\Sin|prod_p_4\(19) & !\Sin|sin_5[10]~53\)) # (!\Sin|prod_q_4\(19) & ((!\Sin|sin_5[10]~53\) # (!\Sin|prod_p_4\(19)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|prod_q_4\(19),
	datab => \Sin|prod_p_4\(19),
	datad => VCC,
	cin => \Sin|sin_5[10]~53\,
	combout => \Sin|sin_5[11]~54_combout\,
	cout => \Sin|sin_5[11]~55\);

-- Location: LCCOMB_X23_Y35_N16
\Sin|sin_5[12]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|sin_5[12]~56_combout\ = ((\Sin|prod_p_4\(20) $ (\Sin|prod_q_4\(20) $ (!\Sin|sin_5[11]~55\)))) # (GND)
-- \Sin|sin_5[12]~57\ = CARRY((\Sin|prod_p_4\(20) & ((\Sin|prod_q_4\(20)) # (!\Sin|sin_5[11]~55\))) # (!\Sin|prod_p_4\(20) & (\Sin|prod_q_4\(20) & !\Sin|sin_5[11]~55\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|prod_p_4\(20),
	datab => \Sin|prod_q_4\(20),
	datad => VCC,
	cin => \Sin|sin_5[11]~55\,
	combout => \Sin|sin_5[12]~56_combout\,
	cout => \Sin|sin_5[12]~57\);

-- Location: LCCOMB_X23_Y35_N18
\Sin|sin_5[13]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|sin_5[13]~58_combout\ = (\Sin|prod_q_4\(21) & ((\Sin|prod_p_4\(21) & (\Sin|sin_5[12]~57\ & VCC)) # (!\Sin|prod_p_4\(21) & (!\Sin|sin_5[12]~57\)))) # (!\Sin|prod_q_4\(21) & ((\Sin|prod_p_4\(21) & (!\Sin|sin_5[12]~57\)) # (!\Sin|prod_p_4\(21) & 
-- ((\Sin|sin_5[12]~57\) # (GND)))))
-- \Sin|sin_5[13]~59\ = CARRY((\Sin|prod_q_4\(21) & (!\Sin|prod_p_4\(21) & !\Sin|sin_5[12]~57\)) # (!\Sin|prod_q_4\(21) & ((!\Sin|sin_5[12]~57\) # (!\Sin|prod_p_4\(21)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|prod_q_4\(21),
	datab => \Sin|prod_p_4\(21),
	datad => VCC,
	cin => \Sin|sin_5[12]~57\,
	combout => \Sin|sin_5[13]~58_combout\,
	cout => \Sin|sin_5[13]~59\);

-- Location: FF_X23_Y35_N19
\Sin|sin_5[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|sin_5[13]~58_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|sin_5\(13));

-- Location: FF_X23_Y35_N17
\Sin|sin_5[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|sin_5[12]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|sin_5\(12));

-- Location: FF_X23_Y35_N15
\Sin|sin_5[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|sin_5[11]~54_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|sin_5\(11));

-- Location: FF_X23_Y35_N13
\Sin|sin_5[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|sin_5[10]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|sin_5\(10));

-- Location: FF_X23_Y35_N11
\Sin|sin_5[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|sin_5[9]~50_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|sin_5\(9));

-- Location: FF_X23_Y35_N9
\Sin|sin_5[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|sin_5[8]~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|sin_5\(8));

-- Location: FF_X23_Y35_N7
\Sin|sin_5[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|sin_5[7]~46_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|sin_5\(7));

-- Location: FF_X23_Y35_N5
\Sin|sin_5[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|sin_5[6]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|sin_5\(6));

-- Location: FF_X23_Y35_N3
\Sin|sin_5[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|sin_5[5]~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|sin_5\(5));

-- Location: FF_X23_Y35_N1
\Sin|sin_5[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|sin_5[4]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|sin_5\(4));

-- Location: FF_X23_Y36_N29
\Sin|sin_5[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|sin_5[2]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|sin_5\(2));

-- Location: FF_X23_Y36_N27
\Sin|sin_5[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|sin_5[1]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|sin_5\(1));

-- Location: FF_X23_Y36_N25
\Sin|sin_5[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|sin_5[0]~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|sin_5\(0));

-- Location: LCCOMB_X23_Y35_N20
\Sin|sin_5[14]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|sin_5[14]~60_combout\ = ((\Sin|prod_p_4\(22) $ (\Sin|prod_q_4\(22) $ (!\Sin|sin_5[13]~59\)))) # (GND)
-- \Sin|sin_5[14]~61\ = CARRY((\Sin|prod_p_4\(22) & ((\Sin|prod_q_4\(22)) # (!\Sin|sin_5[13]~59\))) # (!\Sin|prod_p_4\(22) & (\Sin|prod_q_4\(22) & !\Sin|sin_5[13]~59\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|prod_p_4\(22),
	datab => \Sin|prod_q_4\(22),
	datad => VCC,
	cin => \Sin|sin_5[13]~59\,
	combout => \Sin|sin_5[14]~60_combout\,
	cout => \Sin|sin_5[14]~61\);

-- Location: LCCOMB_X23_Y35_N22
\Sin|sin_5[15]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sin|sin_5[15]~62_combout\ = \Sin|prod_q_4\(23) $ (\Sin|sin_5[14]~61\ $ (\Sin|prod_p_4\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|prod_q_4\(23),
	datad => \Sin|prod_p_4\(23),
	cin => \Sin|sin_5[14]~61\,
	combout => \Sin|sin_5[15]~62_combout\);

-- Location: FF_X23_Y35_N23
\Sin|sin_5[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|sin_5[15]~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|sin_5\(15));

-- Location: IOIBUF_X0_Y60_N15
\aud_bclk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_aud_bclk,
	o => \aud_bclk~input_o\);

-- Location: LCCOMB_X23_Y36_N4
\aio|bit_clock_0~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|bit_clock_0~feeder_combout\ = \aud_bclk~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \aud_bclk~input_o\,
	combout => \aio|bit_clock_0~feeder_combout\);

-- Location: FF_X23_Y36_N5
\aio|bit_clock_0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|bit_clock_0~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|bit_clock_0~q\);

-- Location: FF_X23_Y36_N7
\aio|bit_clock_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \aio|bit_clock_0~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|bit_clock_1~q\);

-- Location: LCCOMB_X24_Y36_N24
\aio|process_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|process_0~0_combout\ = (\aio|left_right_0~q\ & !\aio|left_right_1~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \aio|left_right_0~q\,
	datac => \aio|left_right_1~q\,
	combout => \aio|process_0~0_combout\);

-- Location: LCCOMB_X23_Y36_N0
\aio|dac_shift_control~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_shift_control~0_combout\ = (!\aio|process_0~0_combout\ & ((\aio|dac_shift_control~q\) # ((\aio|bit_clock_0~q\ & !\aio|bit_clock_1~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|bit_clock_0~q\,
	datab => \aio|bit_clock_1~q\,
	datac => \aio|dac_shift_control~q\,
	datad => \aio|process_0~0_combout\,
	combout => \aio|dac_shift_control~0_combout\);

-- Location: FF_X23_Y36_N1
\aio|dac_shift_control\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_shift_control~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_shift_control~q\);

-- Location: LCCOMB_X23_Y36_N6
\aio|dac_data[24]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data[24]~1_combout\ = (\aio|process_0~0_combout\) # ((\aio|dac_shift_control~q\ & (!\aio|bit_clock_0~q\ & \aio|bit_clock_1~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|dac_shift_control~q\,
	datab => \aio|bit_clock_0~q\,
	datac => \aio|bit_clock_1~q\,
	datad => \aio|process_0~0_combout\,
	combout => \aio|dac_data[24]~1_combout\);

-- Location: LCCOMB_X23_Y36_N2
\aio|dac_data~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~32_combout\ = (\aio|dac_data[24]~1_combout\ & (\Sin|sin_5\(0) & ((\aio|process_0~0_combout\)))) # (!\aio|dac_data[24]~1_combout\ & ((\aio|dac_data\(0)) # ((\Sin|sin_5\(0) & \aio|process_0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|dac_data[24]~1_combout\,
	datab => \Sin|sin_5\(0),
	datac => \aio|dac_data\(0),
	datad => \aio|process_0~0_combout\,
	combout => \aio|dac_data~32_combout\);

-- Location: FF_X23_Y36_N3
\aio|dac_data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(0));

-- Location: LCCOMB_X24_Y36_N10
\aio|dac_data~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~31_combout\ = (\aio|left_right_0~q\ & ((\aio|left_right_1~q\ & (\aio|dac_data\(0))) # (!\aio|left_right_1~q\ & ((\Sin|sin_5\(1)))))) # (!\aio|left_right_0~q\ & (\aio|dac_data\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|dac_data\(0),
	datab => \aio|left_right_0~q\,
	datac => \Sin|sin_5\(1),
	datad => \aio|left_right_1~q\,
	combout => \aio|dac_data~31_combout\);

-- Location: FF_X24_Y36_N11
\aio|dac_data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~31_combout\,
	ena => \aio|dac_data[24]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(1));

-- Location: LCCOMB_X24_Y36_N28
\aio|dac_data~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~30_combout\ = (\aio|left_right_0~q\ & ((\aio|left_right_1~q\ & (\aio|dac_data\(1))) # (!\aio|left_right_1~q\ & ((\Sin|sin_5\(2)))))) # (!\aio|left_right_0~q\ & (\aio|dac_data\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|dac_data\(1),
	datab => \aio|left_right_0~q\,
	datac => \Sin|sin_5\(2),
	datad => \aio|left_right_1~q\,
	combout => \aio|dac_data~30_combout\);

-- Location: FF_X24_Y36_N29
\aio|dac_data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~30_combout\,
	ena => \aio|dac_data[24]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(2));

-- Location: FF_X23_Y36_N31
\Sin|sin_5[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|sin_5[3]~38_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|sin_5\(3));

-- Location: LCCOMB_X24_Y36_N30
\aio|dac_data~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~29_combout\ = (\aio|left_right_1~q\ & (\aio|dac_data\(2))) # (!\aio|left_right_1~q\ & ((\aio|left_right_0~q\ & ((\Sin|sin_5\(3)))) # (!\aio|left_right_0~q\ & (\aio|dac_data\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|left_right_1~q\,
	datab => \aio|dac_data\(2),
	datac => \aio|left_right_0~q\,
	datad => \Sin|sin_5\(3),
	combout => \aio|dac_data~29_combout\);

-- Location: FF_X24_Y36_N31
\aio|dac_data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~29_combout\,
	ena => \aio|dac_data[24]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(3));

-- Location: LCCOMB_X24_Y36_N0
\aio|dac_data~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~28_combout\ = (\aio|left_right_0~q\ & ((\aio|left_right_1~q\ & ((\aio|dac_data\(3)))) # (!\aio|left_right_1~q\ & (\Sin|sin_5\(4))))) # (!\aio|left_right_0~q\ & (((\aio|dac_data\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|sin_5\(4),
	datab => \aio|left_right_0~q\,
	datac => \aio|dac_data\(3),
	datad => \aio|left_right_1~q\,
	combout => \aio|dac_data~28_combout\);

-- Location: FF_X24_Y36_N1
\aio|dac_data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~28_combout\,
	ena => \aio|dac_data[24]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(4));

-- Location: LCCOMB_X24_Y36_N2
\aio|dac_data~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~27_combout\ = (\aio|left_right_0~q\ & ((\aio|left_right_1~q\ & ((\aio|dac_data\(4)))) # (!\aio|left_right_1~q\ & (\Sin|sin_5\(5))))) # (!\aio|left_right_0~q\ & (((\aio|dac_data\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|sin_5\(5),
	datab => \aio|dac_data\(4),
	datac => \aio|left_right_0~q\,
	datad => \aio|left_right_1~q\,
	combout => \aio|dac_data~27_combout\);

-- Location: FF_X24_Y36_N3
\aio|dac_data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~27_combout\,
	ena => \aio|dac_data[24]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(5));

-- Location: LCCOMB_X24_Y36_N16
\aio|dac_data~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~26_combout\ = (\aio|left_right_0~q\ & ((\aio|left_right_1~q\ & ((\aio|dac_data\(5)))) # (!\aio|left_right_1~q\ & (\Sin|sin_5\(6))))) # (!\aio|left_right_0~q\ & (((\aio|dac_data\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|sin_5\(6),
	datab => \aio|dac_data\(5),
	datac => \aio|left_right_0~q\,
	datad => \aio|left_right_1~q\,
	combout => \aio|dac_data~26_combout\);

-- Location: FF_X24_Y36_N17
\aio|dac_data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~26_combout\,
	ena => \aio|dac_data[24]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(6));

-- Location: LCCOMB_X24_Y36_N18
\aio|dac_data~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~25_combout\ = (\aio|left_right_0~q\ & ((\aio|left_right_1~q\ & ((\aio|dac_data\(6)))) # (!\aio|left_right_1~q\ & (\Sin|sin_5\(7))))) # (!\aio|left_right_0~q\ & (((\aio|dac_data\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|sin_5\(7),
	datab => \aio|dac_data\(6),
	datac => \aio|left_right_0~q\,
	datad => \aio|left_right_1~q\,
	combout => \aio|dac_data~25_combout\);

-- Location: FF_X24_Y36_N19
\aio|dac_data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~25_combout\,
	ena => \aio|dac_data[24]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(7));

-- Location: LCCOMB_X24_Y35_N18
\aio|dac_data~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~24_combout\ = (\aio|left_right_1~q\ & (((\aio|dac_data\(7))))) # (!\aio|left_right_1~q\ & ((\aio|left_right_0~q\ & (\Sin|sin_5\(8))) # (!\aio|left_right_0~q\ & ((\aio|dac_data\(7))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|sin_5\(8),
	datab => \aio|left_right_1~q\,
	datac => \aio|dac_data\(7),
	datad => \aio|left_right_0~q\,
	combout => \aio|dac_data~24_combout\);

-- Location: FF_X24_Y35_N19
\aio|dac_data[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~24_combout\,
	ena => \aio|dac_data[24]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(8));

-- Location: LCCOMB_X24_Y35_N8
\aio|dac_data~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~23_combout\ = (\aio|left_right_1~q\ & (((\aio|dac_data\(8))))) # (!\aio|left_right_1~q\ & ((\aio|left_right_0~q\ & (\Sin|sin_5\(9))) # (!\aio|left_right_0~q\ & ((\aio|dac_data\(8))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|sin_5\(9),
	datab => \aio|dac_data\(8),
	datac => \aio|left_right_1~q\,
	datad => \aio|left_right_0~q\,
	combout => \aio|dac_data~23_combout\);

-- Location: FF_X24_Y35_N9
\aio|dac_data[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~23_combout\,
	ena => \aio|dac_data[24]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(9));

-- Location: LCCOMB_X24_Y35_N2
\aio|dac_data~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~22_combout\ = (\aio|left_right_1~q\ & (((\aio|dac_data\(9))))) # (!\aio|left_right_1~q\ & ((\aio|left_right_0~q\ & (\Sin|sin_5\(10))) # (!\aio|left_right_0~q\ & ((\aio|dac_data\(9))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|sin_5\(10),
	datab => \aio|left_right_1~q\,
	datac => \aio|dac_data\(9),
	datad => \aio|left_right_0~q\,
	combout => \aio|dac_data~22_combout\);

-- Location: FF_X24_Y35_N3
\aio|dac_data[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~22_combout\,
	ena => \aio|dac_data[24]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(10));

-- Location: LCCOMB_X24_Y35_N4
\aio|dac_data~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~21_combout\ = (\aio|left_right_1~q\ & (((\aio|dac_data\(10))))) # (!\aio|left_right_1~q\ & ((\aio|left_right_0~q\ & (\Sin|sin_5\(11))) # (!\aio|left_right_0~q\ & ((\aio|dac_data\(10))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|sin_5\(11),
	datab => \aio|left_right_1~q\,
	datac => \aio|dac_data\(10),
	datad => \aio|left_right_0~q\,
	combout => \aio|dac_data~21_combout\);

-- Location: FF_X24_Y35_N5
\aio|dac_data[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~21_combout\,
	ena => \aio|dac_data[24]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(11));

-- Location: LCCOMB_X24_Y35_N6
\aio|dac_data~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~20_combout\ = (\aio|left_right_1~q\ & (((\aio|dac_data\(11))))) # (!\aio|left_right_1~q\ & ((\aio|left_right_0~q\ & (\Sin|sin_5\(12))) # (!\aio|left_right_0~q\ & ((\aio|dac_data\(11))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|sin_5\(12),
	datab => \aio|left_right_1~q\,
	datac => \aio|dac_data\(11),
	datad => \aio|left_right_0~q\,
	combout => \aio|dac_data~20_combout\);

-- Location: FF_X24_Y35_N7
\aio|dac_data[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~20_combout\,
	ena => \aio|dac_data[24]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(12));

-- Location: LCCOMB_X24_Y35_N12
\aio|dac_data~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~19_combout\ = (\aio|left_right_1~q\ & (\aio|dac_data\(12))) # (!\aio|left_right_1~q\ & ((\aio|left_right_0~q\ & ((\Sin|sin_5\(13)))) # (!\aio|left_right_0~q\ & (\aio|dac_data\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|dac_data\(12),
	datab => \aio|left_right_1~q\,
	datac => \Sin|sin_5\(13),
	datad => \aio|left_right_0~q\,
	combout => \aio|dac_data~19_combout\);

-- Location: FF_X24_Y35_N13
\aio|dac_data[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~19_combout\,
	ena => \aio|dac_data[24]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(13));

-- Location: FF_X23_Y35_N21
\Sin|sin_5[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Sin|sin_5[14]~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sin|sin_5\(14));

-- Location: LCCOMB_X24_Y35_N14
\aio|dac_data~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~18_combout\ = (\aio|left_right_1~q\ & (\aio|dac_data\(13))) # (!\aio|left_right_1~q\ & ((\aio|left_right_0~q\ & ((\Sin|sin_5\(14)))) # (!\aio|left_right_0~q\ & (\aio|dac_data\(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|dac_data\(13),
	datab => \aio|left_right_1~q\,
	datac => \Sin|sin_5\(14),
	datad => \aio|left_right_0~q\,
	combout => \aio|dac_data~18_combout\);

-- Location: FF_X24_Y35_N15
\aio|dac_data[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~18_combout\,
	ena => \aio|dac_data[24]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(14));

-- Location: LCCOMB_X24_Y35_N20
\aio|dac_data~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~17_combout\ = (\aio|left_right_1~q\ & (((\aio|dac_data\(14))))) # (!\aio|left_right_1~q\ & ((\aio|left_right_0~q\ & (\Sin|sin_5\(15))) # (!\aio|left_right_0~q\ & ((\aio|dac_data\(14))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|sin_5\(15),
	datab => \aio|left_right_1~q\,
	datac => \aio|dac_data\(14),
	datad => \aio|left_right_0~q\,
	combout => \aio|dac_data~17_combout\);

-- Location: FF_X24_Y35_N21
\aio|dac_data[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~17_combout\,
	ena => \aio|dac_data[24]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(15));

-- Location: LCCOMB_X24_Y36_N20
\aio|dac_data~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~16_combout\ = (\aio|left_right_0~q\ & ((\aio|left_right_1~q\ & ((\aio|dac_data\(15)))) # (!\aio|left_right_1~q\ & (\Sin|sin_5\(0))))) # (!\aio|left_right_0~q\ & (((\aio|dac_data\(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|sin_5\(0),
	datab => \aio|dac_data\(15),
	datac => \aio|left_right_0~q\,
	datad => \aio|left_right_1~q\,
	combout => \aio|dac_data~16_combout\);

-- Location: FF_X24_Y36_N21
\aio|dac_data[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~16_combout\,
	ena => \aio|dac_data[24]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(16));

-- Location: LCCOMB_X24_Y36_N14
\aio|dac_data~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~15_combout\ = (\aio|left_right_0~q\ & ((\aio|left_right_1~q\ & ((\aio|dac_data\(16)))) # (!\aio|left_right_1~q\ & (\Sin|sin_5\(1))))) # (!\aio|left_right_0~q\ & (((\aio|dac_data\(16)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|sin_5\(1),
	datab => \aio|dac_data\(16),
	datac => \aio|left_right_0~q\,
	datad => \aio|left_right_1~q\,
	combout => \aio|dac_data~15_combout\);

-- Location: FF_X24_Y36_N15
\aio|dac_data[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~15_combout\,
	ena => \aio|dac_data[24]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(17));

-- Location: LCCOMB_X24_Y36_N12
\aio|dac_data~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~14_combout\ = (\aio|left_right_0~q\ & ((\aio|left_right_1~q\ & ((\aio|dac_data\(17)))) # (!\aio|left_right_1~q\ & (\Sin|sin_5\(2))))) # (!\aio|left_right_0~q\ & (((\aio|dac_data\(17)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|sin_5\(2),
	datab => \aio|left_right_0~q\,
	datac => \aio|dac_data\(17),
	datad => \aio|left_right_1~q\,
	combout => \aio|dac_data~14_combout\);

-- Location: FF_X24_Y36_N13
\aio|dac_data[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~14_combout\,
	ena => \aio|dac_data[24]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(18));

-- Location: LCCOMB_X24_Y36_N22
\aio|dac_data~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~13_combout\ = (\aio|left_right_0~q\ & ((\aio|left_right_1~q\ & (\aio|dac_data\(18))) # (!\aio|left_right_1~q\ & ((\Sin|sin_5\(3)))))) # (!\aio|left_right_0~q\ & (\aio|dac_data\(18)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|dac_data\(18),
	datab => \Sin|sin_5\(3),
	datac => \aio|left_right_0~q\,
	datad => \aio|left_right_1~q\,
	combout => \aio|dac_data~13_combout\);

-- Location: FF_X24_Y36_N23
\aio|dac_data[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~13_combout\,
	ena => \aio|dac_data[24]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(19));

-- Location: LCCOMB_X24_Y36_N8
\aio|dac_data~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~12_combout\ = (\aio|left_right_0~q\ & ((\aio|left_right_1~q\ & ((\aio|dac_data\(19)))) # (!\aio|left_right_1~q\ & (\Sin|sin_5\(4))))) # (!\aio|left_right_0~q\ & (((\aio|dac_data\(19)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|sin_5\(4),
	datab => \aio|left_right_0~q\,
	datac => \aio|dac_data\(19),
	datad => \aio|left_right_1~q\,
	combout => \aio|dac_data~12_combout\);

-- Location: FF_X24_Y36_N9
\aio|dac_data[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~12_combout\,
	ena => \aio|dac_data[24]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(20));

-- Location: LCCOMB_X24_Y36_N26
\aio|dac_data~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~11_combout\ = (\aio|left_right_0~q\ & ((\aio|left_right_1~q\ & ((\aio|dac_data\(20)))) # (!\aio|left_right_1~q\ & (\Sin|sin_5\(5))))) # (!\aio|left_right_0~q\ & (((\aio|dac_data\(20)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|sin_5\(5),
	datab => \aio|left_right_0~q\,
	datac => \aio|dac_data\(20),
	datad => \aio|left_right_1~q\,
	combout => \aio|dac_data~11_combout\);

-- Location: FF_X24_Y36_N27
\aio|dac_data[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~11_combout\,
	ena => \aio|dac_data[24]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(21));

-- Location: LCCOMB_X24_Y36_N4
\aio|dac_data~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~10_combout\ = (\aio|left_right_0~q\ & ((\aio|left_right_1~q\ & ((\aio|dac_data\(21)))) # (!\aio|left_right_1~q\ & (\Sin|sin_5\(6))))) # (!\aio|left_right_0~q\ & (((\aio|dac_data\(21)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|sin_5\(6),
	datab => \aio|left_right_0~q\,
	datac => \aio|dac_data\(21),
	datad => \aio|left_right_1~q\,
	combout => \aio|dac_data~10_combout\);

-- Location: FF_X24_Y36_N5
\aio|dac_data[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~10_combout\,
	ena => \aio|dac_data[24]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(22));

-- Location: LCCOMB_X24_Y36_N6
\aio|dac_data~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~9_combout\ = (\aio|left_right_0~q\ & ((\aio|left_right_1~q\ & ((\aio|dac_data\(22)))) # (!\aio|left_right_1~q\ & (\Sin|sin_5\(7))))) # (!\aio|left_right_0~q\ & (((\aio|dac_data\(22)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|sin_5\(7),
	datab => \aio|left_right_0~q\,
	datac => \aio|dac_data\(22),
	datad => \aio|left_right_1~q\,
	combout => \aio|dac_data~9_combout\);

-- Location: FF_X24_Y36_N7
\aio|dac_data[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~9_combout\,
	ena => \aio|dac_data[24]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(23));

-- Location: LCCOMB_X24_Y35_N22
\aio|dac_data~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~8_combout\ = (\aio|left_right_1~q\ & (((\aio|dac_data\(23))))) # (!\aio|left_right_1~q\ & ((\aio|left_right_0~q\ & (\Sin|sin_5\(8))) # (!\aio|left_right_0~q\ & ((\aio|dac_data\(23))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|sin_5\(8),
	datab => \aio|left_right_1~q\,
	datac => \aio|dac_data\(23),
	datad => \aio|left_right_0~q\,
	combout => \aio|dac_data~8_combout\);

-- Location: FF_X24_Y35_N23
\aio|dac_data[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~8_combout\,
	ena => \aio|dac_data[24]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(24));

-- Location: LCCOMB_X24_Y35_N28
\aio|dac_data~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~7_combout\ = (\aio|left_right_1~q\ & (((\aio|dac_data\(24))))) # (!\aio|left_right_1~q\ & ((\aio|left_right_0~q\ & (\Sin|sin_5\(9))) # (!\aio|left_right_0~q\ & ((\aio|dac_data\(24))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|sin_5\(9),
	datab => \aio|left_right_1~q\,
	datac => \aio|dac_data\(24),
	datad => \aio|left_right_0~q\,
	combout => \aio|dac_data~7_combout\);

-- Location: FF_X24_Y35_N29
\aio|dac_data[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~7_combout\,
	ena => \aio|dac_data[24]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(25));

-- Location: LCCOMB_X24_Y35_N30
\aio|dac_data~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~6_combout\ = (\aio|left_right_0~q\ & ((\aio|left_right_1~q\ & ((\aio|dac_data\(25)))) # (!\aio|left_right_1~q\ & (\Sin|sin_5\(10))))) # (!\aio|left_right_0~q\ & (((\aio|dac_data\(25)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|sin_5\(10),
	datab => \aio|left_right_0~q\,
	datac => \aio|left_right_1~q\,
	datad => \aio|dac_data\(25),
	combout => \aio|dac_data~6_combout\);

-- Location: FF_X24_Y35_N31
\aio|dac_data[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~6_combout\,
	ena => \aio|dac_data[24]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(26));

-- Location: LCCOMB_X24_Y35_N24
\aio|dac_data~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~5_combout\ = (\aio|left_right_1~q\ & (((\aio|dac_data\(26))))) # (!\aio|left_right_1~q\ & ((\aio|left_right_0~q\ & (\Sin|sin_5\(11))) # (!\aio|left_right_0~q\ & ((\aio|dac_data\(26))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|sin_5\(11),
	datab => \aio|left_right_1~q\,
	datac => \aio|dac_data\(26),
	datad => \aio|left_right_0~q\,
	combout => \aio|dac_data~5_combout\);

-- Location: FF_X24_Y35_N25
\aio|dac_data[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~5_combout\,
	ena => \aio|dac_data[24]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(27));

-- Location: LCCOMB_X24_Y35_N26
\aio|dac_data~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~4_combout\ = (\aio|left_right_1~q\ & (((\aio|dac_data\(27))))) # (!\aio|left_right_1~q\ & ((\aio|left_right_0~q\ & (\Sin|sin_5\(12))) # (!\aio|left_right_0~q\ & ((\aio|dac_data\(27))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|sin_5\(12),
	datab => \aio|dac_data\(27),
	datac => \aio|left_right_1~q\,
	datad => \aio|left_right_0~q\,
	combout => \aio|dac_data~4_combout\);

-- Location: FF_X24_Y35_N27
\aio|dac_data[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~4_combout\,
	ena => \aio|dac_data[24]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(28));

-- Location: LCCOMB_X24_Y35_N16
\aio|dac_data~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~3_combout\ = (\aio|left_right_1~q\ & (((\aio|dac_data\(28))))) # (!\aio|left_right_1~q\ & ((\aio|left_right_0~q\ & (\Sin|sin_5\(13))) # (!\aio|left_right_0~q\ & ((\aio|dac_data\(28))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sin|sin_5\(13),
	datab => \aio|left_right_1~q\,
	datac => \aio|dac_data\(28),
	datad => \aio|left_right_0~q\,
	combout => \aio|dac_data~3_combout\);

-- Location: FF_X24_Y35_N17
\aio|dac_data[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~3_combout\,
	ena => \aio|dac_data[24]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(29));

-- Location: LCCOMB_X24_Y35_N10
\aio|dac_data~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~2_combout\ = (\aio|left_right_1~q\ & (\aio|dac_data\(29))) # (!\aio|left_right_1~q\ & ((\aio|left_right_0~q\ & ((\Sin|sin_5\(14)))) # (!\aio|left_right_0~q\ & (\aio|dac_data\(29)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|left_right_1~q\,
	datab => \aio|dac_data\(29),
	datac => \Sin|sin_5\(14),
	datad => \aio|left_right_0~q\,
	combout => \aio|dac_data~2_combout\);

-- Location: FF_X24_Y35_N11
\aio|dac_data[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~2_combout\,
	ena => \aio|dac_data[24]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(30));

-- Location: LCCOMB_X24_Y35_N0
\aio|dac_data~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~0_combout\ = (\aio|left_right_1~q\ & (\aio|dac_data\(30))) # (!\aio|left_right_1~q\ & ((\aio|left_right_0~q\ & ((\Sin|sin_5\(15)))) # (!\aio|left_right_0~q\ & (\aio|dac_data\(30)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|dac_data\(30),
	datab => \aio|left_right_1~q\,
	datac => \Sin|sin_5\(15),
	datad => \aio|left_right_0~q\,
	combout => \aio|dac_data~0_combout\);

-- Location: FF_X24_Y35_N1
\aio|dac_data[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~0_combout\,
	ena => \aio|dac_data[24]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(31));

-- Location: IOIBUF_X0_Y68_N1
\aud_adcdat~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_aud_adcdat,
	o => \aud_adcdat~input_o\);

-- Location: IOIBUF_X29_Y73_N8
\i2c_sclk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => i2c_sclk,
	o => \i2c_sclk~input_o\);
END structure;


