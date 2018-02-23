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

-- DATE "06/05/2017 13:27:38"

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
-- aud_xck	=>  Location: PIN_E1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- aud_adcdat	=>  Location: PIN_D2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- aud_dacdat	=>  Location: PIN_D1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- i2c_sclk	=>  Location: PIN_B7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- i2c_sdat	=>  Location: PIN_A8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- ps2_clk	=>  Location: PIN_G6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- ps2_dat	=>  Location: PIN_H5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- CLOCK_50	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- aud_adclrck	=>  Location: PIN_C2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- aud_bclk	=>  Location: PIN_F2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


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
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a31_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a31_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a15_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a15_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a30_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a30_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a14_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a14_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a29_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a29_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a13_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a13_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a28_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a28_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a12_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a12_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a27_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a27_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a11_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a11_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a26_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a26_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a10_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a10_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a25_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a25_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a9_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a9_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a24_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a24_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a8_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a8_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a23_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a23_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a7_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a7_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a22_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a22_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a6_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a6_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a21_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a21_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a5_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a5_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a20_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a20_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a4_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a19_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a19_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a3_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a3_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a18_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a18_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a2_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a2_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a17_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a17_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a1_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a1_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a16_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a16_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \aio|c|PLL|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \aud_adcdat~input_o\ : std_logic;
SIGNAL \i2c_sclk~input_o\ : std_logic;
SIGNAL \CLOCK2_50~ibuf_o\ : std_logic;
SIGNAL \CLOCK3_50~ibuf_o\ : std_logic;
SIGNAL \ENET0_INT_N~ibuf_o\ : std_logic;
SIGNAL \ENET0_LINK100~ibuf_o\ : std_logic;
SIGNAL \ENET0_MDIO~ibuf_o\ : std_logic;
SIGNAL \ENET0_RX_CLK~ibuf_o\ : std_logic;
SIGNAL \ENET0_RX_COL~ibuf_o\ : std_logic;
SIGNAL \ENET0_RX_CRS~ibuf_o\ : std_logic;
SIGNAL \ENET0_RX_DATA[0]~ibuf_o\ : std_logic;
SIGNAL \ENET0_RX_DATA[1]~ibuf_o\ : std_logic;
SIGNAL \ENET0_RX_DATA[2]~ibuf_o\ : std_logic;
SIGNAL \ENET0_RX_DATA[3]~ibuf_o\ : std_logic;
SIGNAL \ENET0_RX_DV~ibuf_o\ : std_logic;
SIGNAL \ENET0_RX_ER~ibuf_o\ : std_logic;
SIGNAL \ENET0_TX_CLK~ibuf_o\ : std_logic;
SIGNAL \ENET1_INT_N~ibuf_o\ : std_logic;
SIGNAL \ENET1_LINK100~ibuf_o\ : std_logic;
SIGNAL \ENET1_MDIO~ibuf_o\ : std_logic;
SIGNAL \ENET1_RX_CLK~ibuf_o\ : std_logic;
SIGNAL \ENET1_RX_COL~ibuf_o\ : std_logic;
SIGNAL \ENET1_RX_CRS~ibuf_o\ : std_logic;
SIGNAL \ENET1_RX_DATA[0]~ibuf_o\ : std_logic;
SIGNAL \ENET1_RX_DATA[1]~ibuf_o\ : std_logic;
SIGNAL \ENET1_RX_DATA[2]~ibuf_o\ : std_logic;
SIGNAL \ENET1_RX_DATA[3]~ibuf_o\ : std_logic;
SIGNAL \ENET1_RX_DV~ibuf_o\ : std_logic;
SIGNAL \ENET1_RX_ER~ibuf_o\ : std_logic;
SIGNAL \ENET1_TX_CLK~ibuf_o\ : std_logic;
SIGNAL \ENETCLK_25~ibuf_o\ : std_logic;
SIGNAL \FL_RY~ibuf_o\ : std_logic;
SIGNAL \HSMC_CLKIN0~ibuf_o\ : std_logic;
SIGNAL \IRDA_RXD~ibuf_o\ : std_logic;
SIGNAL \KEY[0]~ibuf_o\ : std_logic;
SIGNAL \KEY[1]~ibuf_o\ : std_logic;
SIGNAL \KEY[2]~ibuf_o\ : std_logic;
SIGNAL \KEY[3]~ibuf_o\ : std_logic;
SIGNAL \OTG_INT~ibuf_o\ : std_logic;
SIGNAL \SD_WP_N~ibuf_o\ : std_logic;
SIGNAL \SMA_CLKIN~ibuf_o\ : std_logic;
SIGNAL \SW[0]~ibuf_o\ : std_logic;
SIGNAL \SW[10]~ibuf_o\ : std_logic;
SIGNAL \SW[11]~ibuf_o\ : std_logic;
SIGNAL \SW[12]~ibuf_o\ : std_logic;
SIGNAL \SW[13]~ibuf_o\ : std_logic;
SIGNAL \SW[14]~ibuf_o\ : std_logic;
SIGNAL \SW[15]~ibuf_o\ : std_logic;
SIGNAL \SW[16]~ibuf_o\ : std_logic;
SIGNAL \SW[17]~ibuf_o\ : std_logic;
SIGNAL \SW[1]~ibuf_o\ : std_logic;
SIGNAL \SW[2]~ibuf_o\ : std_logic;
SIGNAL \SW[3]~ibuf_o\ : std_logic;
SIGNAL \SW[4]~ibuf_o\ : std_logic;
SIGNAL \SW[5]~ibuf_o\ : std_logic;
SIGNAL \SW[6]~ibuf_o\ : std_logic;
SIGNAL \SW[7]~ibuf_o\ : std_logic;
SIGNAL \SW[8]~ibuf_o\ : std_logic;
SIGNAL \SW[9]~ibuf_o\ : std_logic;
SIGNAL \TD_CLK27~ibuf_o\ : std_logic;
SIGNAL \TD_DATA[0]~ibuf_o\ : std_logic;
SIGNAL \TD_DATA[1]~ibuf_o\ : std_logic;
SIGNAL \TD_DATA[2]~ibuf_o\ : std_logic;
SIGNAL \TD_DATA[3]~ibuf_o\ : std_logic;
SIGNAL \TD_DATA[4]~ibuf_o\ : std_logic;
SIGNAL \TD_DATA[5]~ibuf_o\ : std_logic;
SIGNAL \TD_DATA[6]~ibuf_o\ : std_logic;
SIGNAL \TD_DATA[7]~ibuf_o\ : std_logic;
SIGNAL \TD_HS~ibuf_o\ : std_logic;
SIGNAL \TD_VS~ibuf_o\ : std_logic;
SIGNAL \UART_RTS~ibuf_o\ : std_logic;
SIGNAL \UART_RXD~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \ac|i2c|n_bits[0]~7_combout\ : std_logic;
SIGNAL \ac|i2c|state~19_combout\ : std_logic;
SIGNAL \ac|i2c|state~13_combout\ : std_logic;
SIGNAL \ac|i2c|state~14_combout\ : std_logic;
SIGNAL \ac|i2c|state.in_progress~q\ : std_logic;
SIGNAL \ac|i2c|state.idle~0_combout\ : std_logic;
SIGNAL \ac|i2c|state~20_combout\ : std_logic;
SIGNAL \ac|i2c|state.idle~q\ : std_logic;
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
SIGNAL \ac|Equal0~2_combout\ : std_logic;
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
SIGNAL \ac|Equal0~0_combout\ : std_logic;
SIGNAL \ac|Equal0~4_combout\ : std_logic;
SIGNAL \ac|current_config.line_in_gain[0]~0_combout\ : std_logic;
SIGNAL \ac|state[0]~4_combout\ : std_logic;
SIGNAL \ac|state[0]~5_combout\ : std_logic;
SIGNAL \ac|state~7_combout\ : std_logic;
SIGNAL \ac|Add1~1_combout\ : std_logic;
SIGNAL \ac|state~9_combout\ : std_logic;
SIGNAL \ac|Add1~0_combout\ : std_logic;
SIGNAL \ac|state[3]~8_combout\ : std_logic;
SIGNAL \ac|state[3]~6_combout\ : std_logic;
SIGNAL \ac|txd_request~1_combout\ : std_logic;
SIGNAL \ac|txd_request~0_combout\ : std_logic;
SIGNAL \ac|txd_request~q\ : std_logic;
SIGNAL \ac|i2c|txd_accepted~0_combout\ : std_logic;
SIGNAL \ac|i2c|phase~2_combout\ : std_logic;
SIGNAL \ac|i2c|counter[0]~6_combout\ : std_logic;
SIGNAL \ac|i2c|counter[2]~8_combout\ : std_logic;
SIGNAL \ac|i2c|counter[2]~9_combout\ : std_logic;
SIGNAL \ac|i2c|counter[0]~7\ : std_logic;
SIGNAL \ac|i2c|counter[1]~10_combout\ : std_logic;
SIGNAL \ac|i2c|counter[1]~11\ : std_logic;
SIGNAL \ac|i2c|counter[2]~12_combout\ : std_logic;
SIGNAL \ac|i2c|counter[2]~13\ : std_logic;
SIGNAL \ac|i2c|counter[3]~14_combout\ : std_logic;
SIGNAL \ac|i2c|process_1~3_combout\ : std_logic;
SIGNAL \ac|i2c|counter[3]~15\ : std_logic;
SIGNAL \ac|i2c|counter[4]~16_combout\ : std_logic;
SIGNAL \ac|i2c|counter[4]~17\ : std_logic;
SIGNAL \ac|i2c|counter[5]~18_combout\ : std_logic;
SIGNAL \ac|i2c|Equal2~0_combout\ : std_logic;
SIGNAL \ac|i2c|phase~4_combout\ : std_logic;
SIGNAL \ac|i2c|phase~3_combout\ : std_logic;
SIGNAL \ac|i2c|i2c_sclk~3_combout\ : std_logic;
SIGNAL \ac|i2c|n_bits~6_combout\ : std_logic;
SIGNAL \ac|i2c|n_bits[0]~8\ : std_logic;
SIGNAL \ac|i2c|n_bits[1]~9_combout\ : std_logic;
SIGNAL \ac|i2c|n_bits[1]~10\ : std_logic;
SIGNAL \ac|i2c|n_bits[2]~11_combout\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \ac|i2c|n_bits[2]~12\ : std_logic;
SIGNAL \ac|i2c|n_bits[3]~13_combout\ : std_logic;
SIGNAL \ac|i2c|n_bits[3]~14\ : std_logic;
SIGNAL \ac|i2c|n_bits[4]~15_combout\ : std_logic;
SIGNAL \ac|i2c|process_1~2_combout\ : std_logic;
SIGNAL \ac|i2c|process_1~7_combout\ : std_logic;
SIGNAL \i2c_sdat~input_o\ : std_logic;
SIGNAL \ac|i2c|sampled_sdat~q\ : std_logic;
SIGNAL \ac|i2c|process_1~4_combout\ : std_logic;
SIGNAL \ac|i2c|process_1~5_combout\ : std_logic;
SIGNAL \ac|i2c|process_1~6_combout\ : std_logic;
SIGNAL \ac|i2c|state~15_combout\ : std_logic;
SIGNAL \ac|i2c|state~16_combout\ : std_logic;
SIGNAL \ac|i2c|state.stop_condition~q\ : std_logic;
SIGNAL \ac|i2c|n_bits~5_combout\ : std_logic;
SIGNAL \ac|i2c|Equal3~0_combout\ : std_logic;
SIGNAL \ac|i2c|state~12_combout\ : std_logic;
SIGNAL \ac|i2c|state~21_combout\ : std_logic;
SIGNAL \ac|i2c|state~17_combout\ : std_logic;
SIGNAL \ac|i2c|state~18_combout\ : std_logic;
SIGNAL \ac|i2c|state.start_condition~q\ : std_logic;
SIGNAL \ac|i2c|i2c_sclk~4_combout\ : std_logic;
SIGNAL \ac|i2c|i2c_sclk~5_combout\ : std_logic;
SIGNAL \ac|Mux12~0_combout\ : std_logic;
SIGNAL \ac|Mux6~1_combout\ : std_logic;
SIGNAL \ac|Mux12~1_combout\ : std_logic;
SIGNAL \ac|current_config.volume[4]~2_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~25_combout\ : std_logic;
SIGNAL \ac|Mux11~0_combout\ : std_logic;
SIGNAL \ac|Mux11~1_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~24_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~23_combout\ : std_logic;
SIGNAL \ac|Mux8~0_combout\ : std_logic;
SIGNAL \ac|Mux9~0_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~22_combout\ : std_logic;
SIGNAL \ac|Mux8~1_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~21_combout\ : std_logic;
SIGNAL \ac|Mux7~0_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~20_combout\ : std_logic;
SIGNAL \ac|Mux6~0_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~19_combout\ : std_logic;
SIGNAL \ac|Mux5~0_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~18_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~17_combout\ : std_logic;
SIGNAL \ac|Mux4~0_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~16_combout\ : std_logic;
SIGNAL \ac|Mux3~0_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~15_combout\ : std_logic;
SIGNAL \ac|Mux2~0_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~14_combout\ : std_logic;
SIGNAL \ac|Mux1~0_combout\ : std_logic;
SIGNAL \ac|i2c|data_to_write~13_combout\ : std_logic;
SIGNAL \ac|Mux0~0_combout\ : std_logic;
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
SIGNAL \ps2_clk~input_o\ : std_logic;
SIGNAL \ps2|ll|ps2_clk_0~0_combout\ : std_logic;
SIGNAL \ps2|ll|Add0~0_combout\ : std_logic;
SIGNAL \ps2|ll|Add0~11\ : std_logic;
SIGNAL \ps2|ll|Add0~12_combout\ : std_logic;
SIGNAL \ps2|ll|Equal0~0_combout\ : std_logic;
SIGNAL \ps2|ll|Equal1~0_combout\ : std_logic;
SIGNAL \ps2|ll|sampling_counter~1_combout\ : std_logic;
SIGNAL \ps2|ll|Add0~1\ : std_logic;
SIGNAL \ps2|ll|Add0~2_combout\ : std_logic;
SIGNAL \ps2|ll|sampling_counter~0_combout\ : std_logic;
SIGNAL \ps2|ll|Add0~3\ : std_logic;
SIGNAL \ps2|ll|Add0~4_combout\ : std_logic;
SIGNAL \ps2|ll|Add0~5\ : std_logic;
SIGNAL \ps2|ll|Add0~6_combout\ : std_logic;
SIGNAL \ps2|ll|Add0~7\ : std_logic;
SIGNAL \ps2|ll|Add0~8_combout\ : std_logic;
SIGNAL \ps2|ll|Add0~9\ : std_logic;
SIGNAL \ps2|ll|Add0~10_combout\ : std_logic;
SIGNAL \ps2|ll|Equal0~1_combout\ : std_logic;
SIGNAL \ps2|ll|ps2_clk_0~q\ : std_logic;
SIGNAL \ps2_dat~input_o\ : std_logic;
SIGNAL \ps2|ll|ps2_dat_0~0_combout\ : std_logic;
SIGNAL \ps2|ll|ps2_dat_0~q\ : std_logic;
SIGNAL \ps2|ll|ps2_dat_1~q\ : std_logic;
SIGNAL \ps2|ll|Add2~0_combout\ : std_logic;
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
SIGNAL \ps2|ll|txd_accepted~0_combout\ : std_logic;
SIGNAL \ps2|ll|txd_accepted~q\ : std_logic;
SIGNAL \ps2|Selector6~15_combout\ : std_logic;
SIGNAL \ps2|ll|ps2_clk_1~q\ : std_logic;
SIGNAL \ps2|ll|process_0~5_combout\ : std_logic;
SIGNAL \ps2|ll|state~21_combout\ : std_logic;
SIGNAL \ps2|ll|state.sending~q\ : std_logic;
SIGNAL \ps2|ll|state.idle~1_combout\ : std_logic;
SIGNAL \ps2|ll|state.idle~0_combout\ : std_logic;
SIGNAL \ps2|ll|state.idle~2_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[8]~15_combout\ : std_logic;
SIGNAL \ps2|ll|Add2~5\ : std_logic;
SIGNAL \ps2|ll|Add2~6_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[8]~3_combout\ : std_logic;
SIGNAL \ps2|ll|Selector17~0_combout\ : std_logic;
SIGNAL \ps2|ll|Add2~7\ : std_logic;
SIGNAL \ps2|ll|Add2~8_combout\ : std_logic;
SIGNAL \ps2|ll|Selector16~0_combout\ : std_logic;
SIGNAL \ps2|ll|Add2~9\ : std_logic;
SIGNAL \ps2|ll|Add2~11\ : std_logic;
SIGNAL \ps2|ll|Add2~12_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[6]~16_combout\ : std_logic;
SIGNAL \ps2|ll|Add2~13\ : std_logic;
SIGNAL \ps2|ll|Add2~14_combout\ : std_logic;
SIGNAL \ps2|ll|Selector13~0_combout\ : std_logic;
SIGNAL \ps2|ll|Add2~15\ : std_logic;
SIGNAL \ps2|ll|Add2~16_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[8]~0_combout\ : std_logic;
SIGNAL \ps2|ll|Add2~17\ : std_logic;
SIGNAL \ps2|ll|Add2~18_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[9]~1_combout\ : std_logic;
SIGNAL \ps2|ll|Add2~19\ : std_logic;
SIGNAL \ps2|ll|Add2~20_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[10]~2_combout\ : std_logic;
SIGNAL \ps2|ll|Equal3~4_combout\ : std_logic;
SIGNAL \ps2|ll|state~30_combout\ : std_logic;
SIGNAL \ps2|ll|state~31_combout\ : std_logic;
SIGNAL \ps2|ll|state.waiting_for_acknowledge~q\ : std_logic;
SIGNAL \ps2|ll|state~14_combout\ : std_logic;
SIGNAL \ps2|ll|state~15_combout\ : std_logic;
SIGNAL \ps2|ll|Selector9~0_combout\ : std_logic;
SIGNAL \ps2|ll|data[6]~0_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[8]~19_combout\ : std_logic;
SIGNAL \ps2|ll|start_bit~0_combout\ : std_logic;
SIGNAL \ps2|ll|start_bit~1_combout\ : std_logic;
SIGNAL \ps2|ll|start_bit~q\ : std_logic;
SIGNAL \ps2|ll|process_0~8_combout\ : std_logic;
SIGNAL \ps2|ll|data[6]~1_combout\ : std_logic;
SIGNAL \ps2|ll|data[6]~2_combout\ : std_logic;
SIGNAL \ps2|ll|Selector21~0_combout\ : std_logic;
SIGNAL \ps2|ll|n_bits[0]~3_combout\ : std_logic;
SIGNAL \ps2|ll|n_bits[0]~2_combout\ : std_logic;
SIGNAL \ps2|ll|Add3~0_combout\ : std_logic;
SIGNAL \ps2|ll|Add3~2_combout\ : std_logic;
SIGNAL \ps2|ll|Add3~1_combout\ : std_logic;
SIGNAL \ps2|ll|Equal6~0_combout\ : std_logic;
SIGNAL \ps2|ll|state~16_combout\ : std_logic;
SIGNAL \ps2|ll|rxd_data[1]~0_combout\ : std_logic;
SIGNAL \ps2|ll|state~17_combout\ : std_logic;
SIGNAL \ps2|ll|state~18_combout\ : std_logic;
SIGNAL \ps2|ll|state~19_combout\ : std_logic;
SIGNAL \ps2|ll|state.receiving~q\ : std_logic;
SIGNAL \ps2|ll|Selector21~2_combout\ : std_logic;
SIGNAL \ps2|ll|Selector21~3_combout\ : std_logic;
SIGNAL \ps2|ll|process_0~6_combout\ : std_logic;
SIGNAL \ps2|ll|Selector21~1_combout\ : std_logic;
SIGNAL \ps2|ll|rxd_valid~0_combout\ : std_logic;
SIGNAL \ps2|ll|Selector21~4_combout\ : std_logic;
SIGNAL \ps2|ll|Selector25~0_combout\ : std_logic;
SIGNAL \ps2|ll|data[2]~3_combout\ : std_logic;
SIGNAL \ps2|ll|process_0~1_combout\ : std_logic;
SIGNAL \ps2|Selector56~0_combout\ : std_logic;
SIGNAL \ps2|ll|Selector26~0_combout\ : std_logic;
SIGNAL \ps2|ll|rxd_data[1]~1_combout\ : std_logic;
SIGNAL \ps2|Selector6~14_combout\ : std_logic;
SIGNAL \ps2|state~49_combout\ : std_logic;
SIGNAL \ps2|state~50_combout\ : std_logic;
SIGNAL \ps2|state~51_combout\ : std_logic;
SIGNAL \ps2|state.enable_mouse~q\ : std_logic;
SIGNAL \ps2|Selector53~0_combout\ : std_logic;
SIGNAL \ps2|state~38_combout\ : std_logic;
SIGNAL \ps2|Selector53~1_combout\ : std_logic;
SIGNAL \ps2|ll|Selector27~0_combout\ : std_logic;
SIGNAL \ps2|ll|Selector28~0_combout\ : std_logic;
SIGNAL \ps2|ll|Selector29~0_combout\ : std_logic;
SIGNAL \ps2|ll|process_0~0_combout\ : std_logic;
SIGNAL \ps2|ll|process_0~2_combout\ : std_logic;
SIGNAL \ps2|ll|process_0~3_combout\ : std_logic;
SIGNAL \ps2|txd_data[0]~feeder_combout\ : std_logic;
SIGNAL \ps2|ll|Selector30~0_combout\ : std_logic;
SIGNAL \ps2|ll|process_0~4_combout\ : std_logic;
SIGNAL \ps2|ll|rxd_valid~1_combout\ : std_logic;
SIGNAL \ps2|ll|rxd_valid~q\ : std_logic;
SIGNAL \ps2|ll|rxd_data[6]~feeder_combout\ : std_logic;
SIGNAL \ps2|ll|rxd_data[4]~feeder_combout\ : std_logic;
SIGNAL \ps2|process_0~3_combout\ : std_logic;
SIGNAL \ps2|ll|rxd_data[7]~feeder_combout\ : std_logic;
SIGNAL \ps2|process_0~4_combout\ : std_logic;
SIGNAL \ps2|process_0~5_combout\ : std_logic;
SIGNAL \ps2|process_0~0_combout\ : std_logic;
SIGNAL \ps2|process_0~6_combout\ : std_logic;
SIGNAL \ps2|Selector6~12_combout\ : std_logic;
SIGNAL \ps2|state~56_combout\ : std_logic;
SIGNAL \ps2|state.wait_for_mouse_bat~q\ : std_logic;
SIGNAL \ps2|time_out_counter[3]~2_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[3]~3_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[3]~1_combout\ : std_logic;
SIGNAL \ps2|Selector6~4_combout\ : std_logic;
SIGNAL \ps2|Selector6~5_combout\ : std_logic;
SIGNAL \ps2|state~39_combout\ : std_logic;
SIGNAL \ps2|state~40_combout\ : std_logic;
SIGNAL \ps2|state~41_combout\ : std_logic;
SIGNAL \ps2|state.restart~q\ : std_logic;
SIGNAL \ps2|time_out_counter[3]~0_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[3]~5_combout\ : std_logic;
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
SIGNAL \ps2|Add0~10_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[5]~15_combout\ : std_logic;
SIGNAL \ps2|Add0~11\ : std_logic;
SIGNAL \ps2|Add0~12_combout\ : std_logic;
SIGNAL \ps2|Selector42~0_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[6]~16_combout\ : std_logic;
SIGNAL \ps2|Add0~13\ : std_logic;
SIGNAL \ps2|Add0~14_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[7]~13_combout\ : std_logic;
SIGNAL \ps2|Equal2~1_combout\ : std_logic;
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
SIGNAL \ps2|Equal2~2_combout\ : std_logic;
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
SIGNAL \ps2|Equal2~3_combout\ : std_logic;
SIGNAL \ps2|Equal2~0_combout\ : std_logic;
SIGNAL \ps2|Equal2~4_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[3]~4_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[3]~33_combout\ : std_logic;
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
SIGNAL \ps2|Add0~47\ : std_logic;
SIGNAL \ps2|Add0~48_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[24]~35_combout\ : std_logic;
SIGNAL \ps2|Add0~49\ : std_logic;
SIGNAL \ps2|Add0~50_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[25]~34_combout\ : std_logic;
SIGNAL \ps2|Add0~51\ : std_logic;
SIGNAL \ps2|Add0~52_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[26]~36_combout\ : std_logic;
SIGNAL \ps2|Add0~53\ : std_logic;
SIGNAL \ps2|Add0~54_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[27]~37_combout\ : std_logic;
SIGNAL \ps2|Equal2~7_combout\ : std_logic;
SIGNAL \ps2|Equal2~5_combout\ : std_logic;
SIGNAL \ps2|Equal2~9_combout\ : std_logic;
SIGNAL \ps2|Selector6~11_combout\ : std_logic;
SIGNAL \ps2|state~52_combout\ : std_logic;
SIGNAL \ps2|state~53_combout\ : std_logic;
SIGNAL \ps2|state.wait_for_enable_mouse_acknowledge~q\ : std_logic;
SIGNAL \ps2|Selector6~7_combout\ : std_logic;
SIGNAL \ps2|state~47_combout\ : std_logic;
SIGNAL \ps2|state~48_combout\ : std_logic;
SIGNAL \ps2|state.wait_for_second_mouse_byte~q\ : std_logic;
SIGNAL \ps2|state~43_combout\ : std_logic;
SIGNAL \ps2|state.wait_for_third_mouse_byte~q\ : std_logic;
SIGNAL \ps2|Selector6~8_combout\ : std_logic;
SIGNAL \ps2|Selector6~9_combout\ : std_logic;
SIGNAL \ps2|Selector6~10_combout\ : std_logic;
SIGNAL \ps2|Selector6~6_combout\ : std_logic;
SIGNAL \ps2|Selector6~13_combout\ : std_logic;
SIGNAL \ps2|Selector10~0_combout\ : std_logic;
SIGNAL \ps2|state~57_combout\ : std_logic;
SIGNAL \ps2|state.enable_keyboard~q\ : std_logic;
SIGNAL \ps2|state~54_combout\ : std_logic;
SIGNAL \ps2|state~55_combout\ : std_logic;
SIGNAL \ps2|state.wait_for_enable_keyboard_acknowledge~q\ : std_logic;
SIGNAL \ps2|state~36_combout\ : std_logic;
SIGNAL \ps2|state~37_combout\ : std_logic;
SIGNAL \ps2|state.keyboard_wait_for_change~q\ : std_logic;
SIGNAL \ps2|txd_data[4]~1_combout\ : std_logic;
SIGNAL \ps2|ll|txd_parity~0_combout\ : std_logic;
SIGNAL \ps2|ll|data[9]~feeder_combout\ : std_logic;
SIGNAL \ps2|ll|Selector23~0_combout\ : std_logic;
SIGNAL \ps2|ll|Selector24~0_combout\ : std_logic;
SIGNAL \ps2|ll|rxd_data[5]~feeder_combout\ : std_logic;
SIGNAL \ps2|process_0~1_combout\ : std_logic;
SIGNAL \ps2|process_0~2_combout\ : std_logic;
SIGNAL \ps2|state~59_combout\ : std_logic;
SIGNAL \ps2|state~60_combout\ : std_logic;
SIGNAL \ps2|state.wait_for_reset_acknowledge~q\ : std_logic;
SIGNAL \ps2|time_out_counter[3]~6_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[3]~7_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[3]~8_combout\ : std_logic;
SIGNAL \ps2|Add0~46_combout\ : std_logic;
SIGNAL \ps2|time_out_counter[23]~32_combout\ : std_logic;
SIGNAL \ps2|Equal2~6_combout\ : std_logic;
SIGNAL \ps2|Equal2~8_combout\ : std_logic;
SIGNAL \ps2|state~42_combout\ : std_logic;
SIGNAL \ps2|state~61_combout\ : std_logic;
SIGNAL \ps2|state.wait_for_bat~q\ : std_logic;
SIGNAL \ps2|state.restart~7_combout\ : std_logic;
SIGNAL \ps2|state.restart~5_combout\ : std_logic;
SIGNAL \ps2|state.restart~8_combout\ : std_logic;
SIGNAL \ps2|state.restart~1_combout\ : std_logic;
SIGNAL \ps2|state.restart~2_combout\ : std_logic;
SIGNAL \ps2|state.restart~3_combout\ : std_logic;
SIGNAL \ps2|state.restart~0_combout\ : std_logic;
SIGNAL \ps2|state.restart~4_combout\ : std_logic;
SIGNAL \ps2|state.restart~6_combout\ : std_logic;
SIGNAL \ps2|state.restart~9_combout\ : std_logic;
SIGNAL \ps2|state~45_combout\ : std_logic;
SIGNAL \ps2|state~44_combout\ : std_logic;
SIGNAL \ps2|state~46_combout\ : std_logic;
SIGNAL \ps2|state.wait_for_first_mouse_byte~q\ : std_logic;
SIGNAL \ps2|state~62_combout\ : std_logic;
SIGNAL \ps2|state~58_combout\ : std_logic;
SIGNAL \ps2|state.periodic_reset~q\ : std_logic;
SIGNAL \ps2|txd_data[1]~0_combout\ : std_logic;
SIGNAL \ps2|txd_request~q\ : std_logic;
SIGNAL \ps2|ll|process_0~7_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[8]~6_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[8]~7_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[8]~5_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[8]~8_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[8]~9_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[0]~18_combout\ : std_logic;
SIGNAL \ps2|ll|Add2~1\ : std_logic;
SIGNAL \ps2|ll|Add2~2_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[1]~13_combout\ : std_logic;
SIGNAL \ps2|ll|Add2~3\ : std_logic;
SIGNAL \ps2|ll|Add2~4_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[2]~14_combout\ : std_logic;
SIGNAL \ps2|ll|Equal3~0_combout\ : std_logic;
SIGNAL \ps2|ll|state.finishing~0_combout\ : std_logic;
SIGNAL \ps2|ll|state.finishing~1_combout\ : std_logic;
SIGNAL \ps2|ll|state.finishing~q\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[0]~10_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[0]~11_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[0]~12_combout\ : std_logic;
SIGNAL \ps2|ll|Add2~10_combout\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[5]~17_combout\ : std_logic;
SIGNAL \ps2|ll|Equal3~1_combout\ : std_logic;
SIGNAL \ps2|ll|Equal3~2_combout\ : std_logic;
SIGNAL \ps2|ll|Equal3~3_combout\ : std_logic;
SIGNAL \ps2|ll|state~23_combout\ : std_logic;
SIGNAL \ps2|ll|state~27_combout\ : std_logic;
SIGNAL \ps2|ll|state~28_combout\ : std_logic;
SIGNAL \ps2|ll|state~24_combout\ : std_logic;
SIGNAL \ps2|ll|state~25_combout\ : std_logic;
SIGNAL \ps2|ll|state~26_combout\ : std_logic;
SIGNAL \ps2|ll|state~29_combout\ : std_logic;
SIGNAL \ps2|ll|state~22_combout\ : std_logic;
SIGNAL \ps2|ll|state.idle~3_combout\ : std_logic;
SIGNAL \ps2|ll|state.idle~4_combout\ : std_logic;
SIGNAL \ps2|ll|state.idle~q\ : std_logic;
SIGNAL \ps2|ll|time_out_counter[8]~4_combout\ : std_logic;
SIGNAL \ps2|ll|state~20_combout\ : std_logic;
SIGNAL \ps2|ll|state.interrupting~q\ : std_logic;
SIGNAL \ps2|ll|ps2_clk~en_q\ : std_logic;
SIGNAL \ps2|ll|Selector31~1_combout\ : std_logic;
SIGNAL \ps2|ll|Selector31~2_combout\ : std_logic;
SIGNAL \ps2|ll|Selector31~0_combout\ : std_logic;
SIGNAL \ps2|ll|Selector31~3_combout\ : std_logic;
SIGNAL \ps2|ll|ps2_dat~reg0feeder_combout\ : std_logic;
SIGNAL \ps2|ll|ps2_dat~reg0_q\ : std_logic;
SIGNAL \ps2|ll|Selector34~0_combout\ : std_logic;
SIGNAL \ps2|ll|Selector34~1_combout\ : std_logic;
SIGNAL \ps2|ll|Selector34~2_combout\ : std_logic;
SIGNAL \ps2|ll|ps2_dat~en_q\ : std_logic;
SIGNAL \ps2|key_code[0]~0_combout\ : std_logic;
SIGNAL \s_dados_ps2~10_combout\ : std_logic;
SIGNAL \last_key_code[6]~feeder_combout\ : std_logic;
SIGNAL \ps2|valid_key_code~q\ : std_logic;
SIGNAL \last_key_code[5]~feeder_combout\ : std_logic;
SIGNAL \Equal1~1_combout\ : std_logic;
SIGNAL \last_key_code[0]~feeder_combout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \s_dados_ps2~12_combout\ : std_logic;
SIGNAL \s_dados_ps2~11_combout\ : std_logic;
SIGNAL \s_dados_ps2~13_combout\ : std_logic;
SIGNAL \s_dados_ps2~14_combout\ : std_logic;
SIGNAL \s_dados_ps2~15_combout\ : std_logic;
SIGNAL \Equal1~2_combout\ : std_logic;
SIGNAL \s_dados_ps2~16_combout\ : std_logic;
SIGNAL \s_dados_ps2~17_combout\ : std_logic;
SIGNAL \s_dados_ps2~18_combout\ : std_logic;
SIGNAL \s_dados_ps2~19_combout\ : std_logic;
SIGNAL \s_dados_ps2~21_combout\ : std_logic;
SIGNAL \s_dados_ps2~20_combout\ : std_logic;
SIGNAL \s_dados_ps2~22_combout\ : std_logic;
SIGNAL \s_dados_ps2~23_combout\ : std_logic;
SIGNAL \s_dados_ps2[0]~24_combout\ : std_logic;
SIGNAL \Equal15~0_combout\ : std_logic;
SIGNAL \Equal3~0_combout\ : std_logic;
SIGNAL \Equal5~0_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Equal4~0_combout\ : std_logic;
SIGNAL \s_isOctave~4_combout\ : std_logic;
SIGNAL \s_isOctave~5_combout\ : std_logic;
SIGNAL \s_isOctave~6_combout\ : std_logic;
SIGNAL \s_isOctave~8_combout\ : std_logic;
SIGNAL \s_isOctave~9_combout\ : std_logic;
SIGNAL \s_isOctave~11_combout\ : std_logic;
SIGNAL \Equal13~0_combout\ : std_logic;
SIGNAL \s_dados_ps2~4_combout\ : std_logic;
SIGNAL \s_dados_ps2~5_combout\ : std_logic;
SIGNAL \s_dados_ps2~8_combout\ : std_logic;
SIGNAL \s_dados_ps2~9_combout\ : std_logic;
SIGNAL \s_dados_ps2~40_combout\ : std_logic;
SIGNAL \s_dados_ps2~39_combout\ : std_logic;
SIGNAL \s_dados_ps2~41_combout\ : std_logic;
SIGNAL \s_dados_ps2~32_combout\ : std_logic;
SIGNAL \s_dados_ps2~42_combout\ : std_logic;
SIGNAL \s_dados_ps2~33_combout\ : std_logic;
SIGNAL \s_dados_ps2~30_combout\ : std_logic;
SIGNAL \s_dados_ps2~31_combout\ : std_logic;
SIGNAL \s_dados_ps2~34_combout\ : std_logic;
SIGNAL \s_dados_ps2~35_combout\ : std_logic;
SIGNAL \s_dados_ps2~36_combout\ : std_logic;
SIGNAL \s_dados_ps2~37_combout\ : std_logic;
SIGNAL \s_dados_ps2~38_combout\ : std_logic;
SIGNAL \s_dados_ps2~25_combout\ : std_logic;
SIGNAL \s_dados_ps2~26_combout\ : std_logic;
SIGNAL \s_dados_ps2~27_combout\ : std_logic;
SIGNAL \s_dados_ps2~44_combout\ : std_logic;
SIGNAL \s_dados_ps2~28_combout\ : std_logic;
SIGNAL \s_dados_ps2~29_combout\ : std_logic;
SIGNAL \s_dados_ps2~43_combout\ : std_logic;
SIGNAL \s_isOctave~7_combout\ : std_logic;
SIGNAL \s_dados_ps2~6_combout\ : std_logic;
SIGNAL \s_dados_ps2~7_combout\ : std_logic;
SIGNAL \bemol~0_combout\ : std_logic;
SIGNAL \Display1|decOut_n[0]~14_combout\ : std_logic;
SIGNAL \Display1|decOut_n[1]~15_combout\ : std_logic;
SIGNAL \Display1|decOut_n[2]~17_combout\ : std_logic;
SIGNAL \Display1|decOut_n[3]~16_combout\ : std_logic;
SIGNAL \Display1|decOut_n[4]~18_combout\ : std_logic;
SIGNAL \Display1|decOut_n[5]~19_combout\ : std_logic;
SIGNAL \Display1|decOut_n[6]~20_combout\ : std_logic;
SIGNAL \aio|c|PLL|auto_generated|wire_pll1_fbout\ : std_logic;
SIGNAL \aio|c|PLL|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\ : std_logic;
SIGNAL \aud_adclrck~input_o\ : std_logic;
SIGNAL \aio|left_right_0~feeder_combout\ : std_logic;
SIGNAL \aio|left_right_0~q\ : std_logic;
SIGNAL \aio|left_right_1~q\ : std_logic;
SIGNAL \aio|process_0~0_combout\ : std_logic;
SIGNAL \s_isOctave~10_combout\ : std_logic;
SIGNAL \s_isOctave~12_combout\ : std_logic;
SIGNAL \s_isOctave~q\ : std_logic;
SIGNAL \aio|n_bits[0]~6_combout\ : std_logic;
SIGNAL \aio|n_bits[1]~12\ : std_logic;
SIGNAL \aio|n_bits[2]~13_combout\ : std_logic;
SIGNAL \aio|n_bits[2]~14\ : std_logic;
SIGNAL \aio|n_bits[3]~15_combout\ : std_logic;
SIGNAL \aio|n_bits[3]~16\ : std_logic;
SIGNAL \aio|n_bits[4]~17_combout\ : std_logic;
SIGNAL \aio|n_bits[4]~18\ : std_logic;
SIGNAL \aio|n_bits[5]~19_combout\ : std_logic;
SIGNAL \aio|n_bits[5]~9_combout\ : std_logic;
SIGNAL \aio|n_bits[5]~8_combout\ : std_logic;
SIGNAL \aud_bclk~input_o\ : std_logic;
SIGNAL \aio|bit_clock_0~q\ : std_logic;
SIGNAL \aio|bit_clock_1~q\ : std_logic;
SIGNAL \aio|valid~0_combout\ : std_logic;
SIGNAL \aio|n_bits[5]~10_combout\ : std_logic;
SIGNAL \aio|n_bits[0]~7\ : std_logic;
SIGNAL \aio|n_bits[1]~11_combout\ : std_logic;
SIGNAL \aio|valid~1_combout\ : std_logic;
SIGNAL \aio|valid~2_combout\ : std_logic;
SIGNAL \aio|valid~q\ : std_logic;
SIGNAL \s_count[0]~9_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \s_count[1]~11_cout\ : std_logic;
SIGNAL \s_count[1]~12_combout\ : std_logic;
SIGNAL \s_count[1]~13\ : std_logic;
SIGNAL \s_count[2]~14_combout\ : std_logic;
SIGNAL \s_count[2]~15\ : std_logic;
SIGNAL \s_count[3]~16_combout\ : std_logic;
SIGNAL \s_count[3]~17\ : std_logic;
SIGNAL \s_count[4]~18_combout\ : std_logic;
SIGNAL \s_count[4]~19\ : std_logic;
SIGNAL \s_count[5]~20_combout\ : std_logic;
SIGNAL \s_count[5]~21\ : std_logic;
SIGNAL \s_count[6]~22_combout\ : std_logic;
SIGNAL \s_count[6]~23\ : std_logic;
SIGNAL \s_count[7]~24_combout\ : std_logic;
SIGNAL \s_count[7]~25\ : std_logic;
SIGNAL \s_count[8]~26_combout\ : std_logic;
SIGNAL \s_count[8]~27\ : std_logic;
SIGNAL \s_count[9]~28_combout\ : std_logic;
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a31~portadataout\ : std_logic;
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a15~portadataout\ : std_logic;
SIGNAL \aio|dac_data~62_combout\ : std_logic;
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a30~portadataout\ : std_logic;
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a14~portadataout\ : std_logic;
SIGNAL \aio|dac_data~64_combout\ : std_logic;
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a13~portadataout\ : std_logic;
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a29~portadataout\ : std_logic;
SIGNAL \aio|dac_data~65_combout\ : std_logic;
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a28~portadataout\ : std_logic;
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a12~portadataout\ : std_logic;
SIGNAL \aio|dac_data~66_combout\ : std_logic;
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a11~portadataout\ : std_logic;
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a27~portadataout\ : std_logic;
SIGNAL \aio|dac_data~67_combout\ : std_logic;
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a9~portadataout\ : std_logic;
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a25~portadataout\ : std_logic;
SIGNAL \aio|dac_data~69_combout\ : std_logic;
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a8~portadataout\ : std_logic;
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a24~portadataout\ : std_logic;
SIGNAL \aio|dac_data~70_combout\ : std_logic;
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a22~portadataout\ : std_logic;
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a6~portadataout\ : std_logic;
SIGNAL \aio|dac_data~72_combout\ : std_logic;
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a3~portadataout\ : std_logic;
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a19~portadataout\ : std_logic;
SIGNAL \aio|dac_data~75_combout\ : std_logic;
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a18~portadataout\ : std_logic;
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a2~portadataout\ : std_logic;
SIGNAL \aio|dac_data~76_combout\ : std_logic;
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a17~portadataout\ : std_logic;
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a1~portadataout\ : std_logic;
SIGNAL \aio|dac_data~77_combout\ : std_logic;
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a0~portadataout\ : std_logic;
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a16~portadataout\ : std_logic;
SIGNAL \aio|dac_data~78_combout\ : std_logic;
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a26~portadataout\ : std_logic;
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a10~portadataout\ : std_logic;
SIGNAL \aio|dac_data~68_combout\ : std_logic;
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a23~portadataout\ : std_logic;
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a7~portadataout\ : std_logic;
SIGNAL \aio|dac_data~71_combout\ : std_logic;
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a21~portadataout\ : std_logic;
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a5~portadataout\ : std_logic;
SIGNAL \aio|dac_data~73_combout\ : std_logic;
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a20~portadataout\ : std_logic;
SIGNAL \rom|Mux15_rtl_0|auto_generated|ram_block1a4~portadataout\ : std_logic;
SIGNAL \aio|dac_data~74_combout\ : std_logic;
SIGNAL \aio|dac_shift_control~4_combout\ : std_logic;
SIGNAL \aio|dac_shift_control~q\ : std_logic;
SIGNAL \aio|dac_data[16]~63_combout\ : std_logic;
SIGNAL \aio|dac_data~79_combout\ : std_logic;
SIGNAL \aio|dac_data~110_combout\ : std_logic;
SIGNAL \aio|dac_data~109_combout\ : std_logic;
SIGNAL \aio|dac_data~108_combout\ : std_logic;
SIGNAL \aio|dac_data~107_combout\ : std_logic;
SIGNAL \aio|dac_data~106_combout\ : std_logic;
SIGNAL \aio|dac_data~105_combout\ : std_logic;
SIGNAL \aio|dac_data~104_combout\ : std_logic;
SIGNAL \aio|dac_data~103_combout\ : std_logic;
SIGNAL \aio|dac_data~102_combout\ : std_logic;
SIGNAL \aio|dac_data~101_combout\ : std_logic;
SIGNAL \aio|dac_data~100_combout\ : std_logic;
SIGNAL \aio|dac_data~99_combout\ : std_logic;
SIGNAL \aio|dac_data~98_combout\ : std_logic;
SIGNAL \aio|dac_data~97_combout\ : std_logic;
SIGNAL \aio|dac_data~96_combout\ : std_logic;
SIGNAL \aio|dac_data~95_combout\ : std_logic;
SIGNAL \aio|dac_data~94_combout\ : std_logic;
SIGNAL \aio|dac_data~93_combout\ : std_logic;
SIGNAL \aio|dac_data~92_combout\ : std_logic;
SIGNAL \aio|dac_data~91_combout\ : std_logic;
SIGNAL \aio|dac_data~90_combout\ : std_logic;
SIGNAL \aio|dac_data~89_combout\ : std_logic;
SIGNAL \aio|dac_data~88_combout\ : std_logic;
SIGNAL \aio|dac_data~87_combout\ : std_logic;
SIGNAL \aio|dac_data~86_combout\ : std_logic;
SIGNAL \aio|dac_data~85_combout\ : std_logic;
SIGNAL \aio|dac_data~84_combout\ : std_logic;
SIGNAL \aio|dac_data~83_combout\ : std_logic;
SIGNAL \aio|dac_data~82_combout\ : std_logic;
SIGNAL \aio|dac_data~81_combout\ : std_logic;
SIGNAL \aio|dac_data~80_combout\ : std_logic;
SIGNAL \ac|i2c|counter\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \ps2|ll|data\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \aio|c|PLL|auto_generated|wire_pll1_clk\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \ps2|ll|time_out_counter\ : std_logic_vector(10 DOWNTO 0);
SIGNAL s_count : std_logic_vector(9 DOWNTO 0);
SIGNAL \ac|i2c|n_bits\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \ps2|ll|n_bits\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ps2|txd_data\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \aio|n_bits\ : std_logic_vector(5 DOWNTO 0);
SIGNAL s_dados_ps2 : std_logic_vector(3 DOWNTO 0);
SIGNAL \aio|dac_data\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \rom|Mux15_rtl_0|auto_generated|address_reg_a\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ps2|key_code\ : std_logic_vector(7 DOWNTO 0);
SIGNAL last_key_code : std_logic_vector(7 DOWNTO 0);
SIGNAL \ps2|ll|rxd_data\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ac|i2c|phase\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \ac|i2c|data_to_write\ : std_logic_vector(26 DOWNTO 0);
SIGNAL \ps2|ll|sampling_counter\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \ps2|time_out_counter\ : std_logic_vector(27 DOWNTO 0);
SIGNAL \ps2|ll|idle_counter\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \ac|state\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ac|delay\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \ac|current_config.line_in_gain\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \ac|txd_data\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \ALT_INV_bemol~0_combout\ : std_logic;
SIGNAL ALT_INV_s_dados_ps2 : std_logic_vector(3 DOWNTO 3);
SIGNAL \ps2|ll|ALT_INV_time_out_counter[0]~12_combout\ : std_logic;
SIGNAL \ps2|ll|ALT_INV_state.idle~q\ : std_logic;
SIGNAL \ac|i2c|ALT_INV_state.idle~q\ : std_logic;
SIGNAL \ps2|ll|ALT_INV_ps2_clk~en_q\ : std_logic;

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

\rom|Mux15_rtl_0|auto_generated|ram_block1a31_PORTAADDR_bus\ <= (s_dados_ps2(2) & s_dados_ps2(1) & s_dados_ps2(0) & s_count(9) & s_count(8) & s_count(7) & s_count(6) & s_count(5) & s_count(4) & s_count(3) & s_count(2) & s_count(1)
& s_count(0));

\rom|Mux15_rtl_0|auto_generated|ram_block1a31~portadataout\ <= \rom|Mux15_rtl_0|auto_generated|ram_block1a31_PORTADATAOUT_bus\(0);

\rom|Mux15_rtl_0|auto_generated|ram_block1a15_PORTAADDR_bus\ <= (s_dados_ps2(2) & s_dados_ps2(1) & s_dados_ps2(0) & s_count(9) & s_count(8) & s_count(7) & s_count(6) & s_count(5) & s_count(4) & s_count(3) & s_count(2) & s_count(1)
& s_count(0));

\rom|Mux15_rtl_0|auto_generated|ram_block1a15~portadataout\ <= \rom|Mux15_rtl_0|auto_generated|ram_block1a15_PORTADATAOUT_bus\(0);

\rom|Mux15_rtl_0|auto_generated|ram_block1a30_PORTAADDR_bus\ <= (s_dados_ps2(2) & s_dados_ps2(1) & s_dados_ps2(0) & s_count(9) & s_count(8) & s_count(7) & s_count(6) & s_count(5) & s_count(4) & s_count(3) & s_count(2) & s_count(1)
& s_count(0));

\rom|Mux15_rtl_0|auto_generated|ram_block1a30~portadataout\ <= \rom|Mux15_rtl_0|auto_generated|ram_block1a30_PORTADATAOUT_bus\(0);

\rom|Mux15_rtl_0|auto_generated|ram_block1a14_PORTAADDR_bus\ <= (s_dados_ps2(2) & s_dados_ps2(1) & s_dados_ps2(0) & s_count(9) & s_count(8) & s_count(7) & s_count(6) & s_count(5) & s_count(4) & s_count(3) & s_count(2) & s_count(1)
& s_count(0));

\rom|Mux15_rtl_0|auto_generated|ram_block1a14~portadataout\ <= \rom|Mux15_rtl_0|auto_generated|ram_block1a14_PORTADATAOUT_bus\(0);

\rom|Mux15_rtl_0|auto_generated|ram_block1a29_PORTAADDR_bus\ <= (s_dados_ps2(2) & s_dados_ps2(1) & s_dados_ps2(0) & s_count(9) & s_count(8) & s_count(7) & s_count(6) & s_count(5) & s_count(4) & s_count(3) & s_count(2) & s_count(1)
& s_count(0));

\rom|Mux15_rtl_0|auto_generated|ram_block1a29~portadataout\ <= \rom|Mux15_rtl_0|auto_generated|ram_block1a29_PORTADATAOUT_bus\(0);

\rom|Mux15_rtl_0|auto_generated|ram_block1a13_PORTAADDR_bus\ <= (s_dados_ps2(2) & s_dados_ps2(1) & s_dados_ps2(0) & s_count(9) & s_count(8) & s_count(7) & s_count(6) & s_count(5) & s_count(4) & s_count(3) & s_count(2) & s_count(1)
& s_count(0));

\rom|Mux15_rtl_0|auto_generated|ram_block1a13~portadataout\ <= \rom|Mux15_rtl_0|auto_generated|ram_block1a13_PORTADATAOUT_bus\(0);

\rom|Mux15_rtl_0|auto_generated|ram_block1a28_PORTAADDR_bus\ <= (s_dados_ps2(2) & s_dados_ps2(1) & s_dados_ps2(0) & s_count(9) & s_count(8) & s_count(7) & s_count(6) & s_count(5) & s_count(4) & s_count(3) & s_count(2) & s_count(1)
& s_count(0));

\rom|Mux15_rtl_0|auto_generated|ram_block1a28~portadataout\ <= \rom|Mux15_rtl_0|auto_generated|ram_block1a28_PORTADATAOUT_bus\(0);

\rom|Mux15_rtl_0|auto_generated|ram_block1a12_PORTAADDR_bus\ <= (s_dados_ps2(2) & s_dados_ps2(1) & s_dados_ps2(0) & s_count(9) & s_count(8) & s_count(7) & s_count(6) & s_count(5) & s_count(4) & s_count(3) & s_count(2) & s_count(1)
& s_count(0));

\rom|Mux15_rtl_0|auto_generated|ram_block1a12~portadataout\ <= \rom|Mux15_rtl_0|auto_generated|ram_block1a12_PORTADATAOUT_bus\(0);

\rom|Mux15_rtl_0|auto_generated|ram_block1a27_PORTAADDR_bus\ <= (s_dados_ps2(2) & s_dados_ps2(1) & s_dados_ps2(0) & s_count(9) & s_count(8) & s_count(7) & s_count(6) & s_count(5) & s_count(4) & s_count(3) & s_count(2) & s_count(1)
& s_count(0));

\rom|Mux15_rtl_0|auto_generated|ram_block1a27~portadataout\ <= \rom|Mux15_rtl_0|auto_generated|ram_block1a27_PORTADATAOUT_bus\(0);

\rom|Mux15_rtl_0|auto_generated|ram_block1a11_PORTAADDR_bus\ <= (s_dados_ps2(2) & s_dados_ps2(1) & s_dados_ps2(0) & s_count(9) & s_count(8) & s_count(7) & s_count(6) & s_count(5) & s_count(4) & s_count(3) & s_count(2) & s_count(1)
& s_count(0));

\rom|Mux15_rtl_0|auto_generated|ram_block1a11~portadataout\ <= \rom|Mux15_rtl_0|auto_generated|ram_block1a11_PORTADATAOUT_bus\(0);

\rom|Mux15_rtl_0|auto_generated|ram_block1a26_PORTAADDR_bus\ <= (s_dados_ps2(2) & s_dados_ps2(1) & s_dados_ps2(0) & s_count(9) & s_count(8) & s_count(7) & s_count(6) & s_count(5) & s_count(4) & s_count(3) & s_count(2) & s_count(1)
& s_count(0));

\rom|Mux15_rtl_0|auto_generated|ram_block1a26~portadataout\ <= \rom|Mux15_rtl_0|auto_generated|ram_block1a26_PORTADATAOUT_bus\(0);

\rom|Mux15_rtl_0|auto_generated|ram_block1a10_PORTAADDR_bus\ <= (s_dados_ps2(2) & s_dados_ps2(1) & s_dados_ps2(0) & s_count(9) & s_count(8) & s_count(7) & s_count(6) & s_count(5) & s_count(4) & s_count(3) & s_count(2) & s_count(1)
& s_count(0));

\rom|Mux15_rtl_0|auto_generated|ram_block1a10~portadataout\ <= \rom|Mux15_rtl_0|auto_generated|ram_block1a10_PORTADATAOUT_bus\(0);

\rom|Mux15_rtl_0|auto_generated|ram_block1a25_PORTAADDR_bus\ <= (s_dados_ps2(2) & s_dados_ps2(1) & s_dados_ps2(0) & s_count(9) & s_count(8) & s_count(7) & s_count(6) & s_count(5) & s_count(4) & s_count(3) & s_count(2) & s_count(1)
& s_count(0));

\rom|Mux15_rtl_0|auto_generated|ram_block1a25~portadataout\ <= \rom|Mux15_rtl_0|auto_generated|ram_block1a25_PORTADATAOUT_bus\(0);

\rom|Mux15_rtl_0|auto_generated|ram_block1a9_PORTAADDR_bus\ <= (s_dados_ps2(2) & s_dados_ps2(1) & s_dados_ps2(0) & s_count(9) & s_count(8) & s_count(7) & s_count(6) & s_count(5) & s_count(4) & s_count(3) & s_count(2) & s_count(1)
& s_count(0));

\rom|Mux15_rtl_0|auto_generated|ram_block1a9~portadataout\ <= \rom|Mux15_rtl_0|auto_generated|ram_block1a9_PORTADATAOUT_bus\(0);

\rom|Mux15_rtl_0|auto_generated|ram_block1a24_PORTAADDR_bus\ <= (s_dados_ps2(2) & s_dados_ps2(1) & s_dados_ps2(0) & s_count(9) & s_count(8) & s_count(7) & s_count(6) & s_count(5) & s_count(4) & s_count(3) & s_count(2) & s_count(1)
& s_count(0));

\rom|Mux15_rtl_0|auto_generated|ram_block1a24~portadataout\ <= \rom|Mux15_rtl_0|auto_generated|ram_block1a24_PORTADATAOUT_bus\(0);

\rom|Mux15_rtl_0|auto_generated|ram_block1a8_PORTAADDR_bus\ <= (s_dados_ps2(2) & s_dados_ps2(1) & s_dados_ps2(0) & s_count(9) & s_count(8) & s_count(7) & s_count(6) & s_count(5) & s_count(4) & s_count(3) & s_count(2) & s_count(1)
& s_count(0));

\rom|Mux15_rtl_0|auto_generated|ram_block1a8~portadataout\ <= \rom|Mux15_rtl_0|auto_generated|ram_block1a8_PORTADATAOUT_bus\(0);

\rom|Mux15_rtl_0|auto_generated|ram_block1a23_PORTAADDR_bus\ <= (s_dados_ps2(2) & s_dados_ps2(1) & s_dados_ps2(0) & s_count(9) & s_count(8) & s_count(7) & s_count(6) & s_count(5) & s_count(4) & s_count(3) & s_count(2) & s_count(1)
& s_count(0));

\rom|Mux15_rtl_0|auto_generated|ram_block1a23~portadataout\ <= \rom|Mux15_rtl_0|auto_generated|ram_block1a23_PORTADATAOUT_bus\(0);

\rom|Mux15_rtl_0|auto_generated|ram_block1a7_PORTAADDR_bus\ <= (s_dados_ps2(2) & s_dados_ps2(1) & s_dados_ps2(0) & s_count(9) & s_count(8) & s_count(7) & s_count(6) & s_count(5) & s_count(4) & s_count(3) & s_count(2) & s_count(1)
& s_count(0));

\rom|Mux15_rtl_0|auto_generated|ram_block1a7~portadataout\ <= \rom|Mux15_rtl_0|auto_generated|ram_block1a7_PORTADATAOUT_bus\(0);

\rom|Mux15_rtl_0|auto_generated|ram_block1a22_PORTAADDR_bus\ <= (s_dados_ps2(2) & s_dados_ps2(1) & s_dados_ps2(0) & s_count(9) & s_count(8) & s_count(7) & s_count(6) & s_count(5) & s_count(4) & s_count(3) & s_count(2) & s_count(1)
& s_count(0));

\rom|Mux15_rtl_0|auto_generated|ram_block1a22~portadataout\ <= \rom|Mux15_rtl_0|auto_generated|ram_block1a22_PORTADATAOUT_bus\(0);

\rom|Mux15_rtl_0|auto_generated|ram_block1a6_PORTAADDR_bus\ <= (s_dados_ps2(2) & s_dados_ps2(1) & s_dados_ps2(0) & s_count(9) & s_count(8) & s_count(7) & s_count(6) & s_count(5) & s_count(4) & s_count(3) & s_count(2) & s_count(1)
& s_count(0));

\rom|Mux15_rtl_0|auto_generated|ram_block1a6~portadataout\ <= \rom|Mux15_rtl_0|auto_generated|ram_block1a6_PORTADATAOUT_bus\(0);

\rom|Mux15_rtl_0|auto_generated|ram_block1a21_PORTAADDR_bus\ <= (s_dados_ps2(2) & s_dados_ps2(1) & s_dados_ps2(0) & s_count(9) & s_count(8) & s_count(7) & s_count(6) & s_count(5) & s_count(4) & s_count(3) & s_count(2) & s_count(1)
& s_count(0));

\rom|Mux15_rtl_0|auto_generated|ram_block1a21~portadataout\ <= \rom|Mux15_rtl_0|auto_generated|ram_block1a21_PORTADATAOUT_bus\(0);

\rom|Mux15_rtl_0|auto_generated|ram_block1a5_PORTAADDR_bus\ <= (s_dados_ps2(2) & s_dados_ps2(1) & s_dados_ps2(0) & s_count(9) & s_count(8) & s_count(7) & s_count(6) & s_count(5) & s_count(4) & s_count(3) & s_count(2) & s_count(1)
& s_count(0));

\rom|Mux15_rtl_0|auto_generated|ram_block1a5~portadataout\ <= \rom|Mux15_rtl_0|auto_generated|ram_block1a5_PORTADATAOUT_bus\(0);

\rom|Mux15_rtl_0|auto_generated|ram_block1a20_PORTAADDR_bus\ <= (s_dados_ps2(2) & s_dados_ps2(1) & s_dados_ps2(0) & s_count(9) & s_count(8) & s_count(7) & s_count(6) & s_count(5) & s_count(4) & s_count(3) & s_count(2) & s_count(1)
& s_count(0));

\rom|Mux15_rtl_0|auto_generated|ram_block1a20~portadataout\ <= \rom|Mux15_rtl_0|auto_generated|ram_block1a20_PORTADATAOUT_bus\(0);

\rom|Mux15_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\ <= (s_dados_ps2(2) & s_dados_ps2(1) & s_dados_ps2(0) & s_count(9) & s_count(8) & s_count(7) & s_count(6) & s_count(5) & s_count(4) & s_count(3) & s_count(2) & s_count(1)
& s_count(0));

\rom|Mux15_rtl_0|auto_generated|ram_block1a4~portadataout\ <= \rom|Mux15_rtl_0|auto_generated|ram_block1a4_PORTADATAOUT_bus\(0);

\rom|Mux15_rtl_0|auto_generated|ram_block1a19_PORTAADDR_bus\ <= (s_dados_ps2(2) & s_dados_ps2(1) & s_dados_ps2(0) & s_count(9) & s_count(8) & s_count(7) & s_count(6) & s_count(5) & s_count(4) & s_count(3) & s_count(2) & s_count(1)
& s_count(0));

\rom|Mux15_rtl_0|auto_generated|ram_block1a19~portadataout\ <= \rom|Mux15_rtl_0|auto_generated|ram_block1a19_PORTADATAOUT_bus\(0);

\rom|Mux15_rtl_0|auto_generated|ram_block1a3_PORTAADDR_bus\ <= (s_dados_ps2(2) & s_dados_ps2(1) & s_dados_ps2(0) & s_count(9) & s_count(8) & s_count(7) & s_count(6) & s_count(5) & s_count(4) & s_count(3) & s_count(2) & s_count(1)
& s_count(0));

\rom|Mux15_rtl_0|auto_generated|ram_block1a3~portadataout\ <= \rom|Mux15_rtl_0|auto_generated|ram_block1a3_PORTADATAOUT_bus\(0);

\rom|Mux15_rtl_0|auto_generated|ram_block1a18_PORTAADDR_bus\ <= (s_dados_ps2(2) & s_dados_ps2(1) & s_dados_ps2(0) & s_count(9) & s_count(8) & s_count(7) & s_count(6) & s_count(5) & s_count(4) & s_count(3) & s_count(2) & s_count(1)
& s_count(0));

\rom|Mux15_rtl_0|auto_generated|ram_block1a18~portadataout\ <= \rom|Mux15_rtl_0|auto_generated|ram_block1a18_PORTADATAOUT_bus\(0);

\rom|Mux15_rtl_0|auto_generated|ram_block1a2_PORTAADDR_bus\ <= (s_dados_ps2(2) & s_dados_ps2(1) & s_dados_ps2(0) & s_count(9) & s_count(8) & s_count(7) & s_count(6) & s_count(5) & s_count(4) & s_count(3) & s_count(2) & s_count(1)
& s_count(0));

\rom|Mux15_rtl_0|auto_generated|ram_block1a2~portadataout\ <= \rom|Mux15_rtl_0|auto_generated|ram_block1a2_PORTADATAOUT_bus\(0);

\rom|Mux15_rtl_0|auto_generated|ram_block1a17_PORTAADDR_bus\ <= (s_dados_ps2(2) & s_dados_ps2(1) & s_dados_ps2(0) & s_count(9) & s_count(8) & s_count(7) & s_count(6) & s_count(5) & s_count(4) & s_count(3) & s_count(2) & s_count(1)
& s_count(0));

\rom|Mux15_rtl_0|auto_generated|ram_block1a17~portadataout\ <= \rom|Mux15_rtl_0|auto_generated|ram_block1a17_PORTADATAOUT_bus\(0);

\rom|Mux15_rtl_0|auto_generated|ram_block1a1_PORTAADDR_bus\ <= (s_dados_ps2(2) & s_dados_ps2(1) & s_dados_ps2(0) & s_count(9) & s_count(8) & s_count(7) & s_count(6) & s_count(5) & s_count(4) & s_count(3) & s_count(2) & s_count(1)
& s_count(0));

\rom|Mux15_rtl_0|auto_generated|ram_block1a1~portadataout\ <= \rom|Mux15_rtl_0|auto_generated|ram_block1a1_PORTADATAOUT_bus\(0);

\rom|Mux15_rtl_0|auto_generated|ram_block1a16_PORTAADDR_bus\ <= (s_dados_ps2(2) & s_dados_ps2(1) & s_dados_ps2(0) & s_count(9) & s_count(8) & s_count(7) & s_count(6) & s_count(5) & s_count(4) & s_count(3) & s_count(2) & s_count(1)
& s_count(0));

\rom|Mux15_rtl_0|auto_generated|ram_block1a16~portadataout\ <= \rom|Mux15_rtl_0|auto_generated|ram_block1a16_PORTADATAOUT_bus\(0);

\rom|Mux15_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (s_dados_ps2(2) & s_dados_ps2(1) & s_dados_ps2(0) & s_count(9) & s_count(8) & s_count(7) & s_count(6) & s_count(5) & s_count(4) & s_count(3) & s_count(2) & s_count(1)
& s_count(0));

\rom|Mux15_rtl_0|auto_generated|ram_block1a0~portadataout\ <= \rom|Mux15_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);

\aio|c|PLL|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \aio|c|PLL|auto_generated|wire_pll1_clk\(0));
\ALT_INV_bemol~0_combout\ <= NOT \bemol~0_combout\;
ALT_INV_s_dados_ps2(3) <= NOT s_dados_ps2(3);
\ps2|ll|ALT_INV_time_out_counter[0]~12_combout\ <= NOT \ps2|ll|time_out_counter[0]~12_combout\;
\ps2|ll|ALT_INV_state.idle~q\ <= NOT \ps2|ll|state.idle~q\;
\ac|i2c|ALT_INV_state.idle~q\ <= NOT \ac|i2c|state.idle~q\;
\ps2|ll|ALT_INV_ps2_clk~en_q\ <= NOT \ps2|ll|ps2_clk~en_q\;

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
	i => \Display1|decOut_n[0]~14_combout\,
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
	i => \Display1|decOut_n[1]~15_combout\,
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
	i => \Display1|decOut_n[2]~17_combout\,
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
	i => \Display1|decOut_n[3]~16_combout\,
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
	i => \Display1|decOut_n[4]~18_combout\,
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
	i => \Display1|decOut_n[5]~19_combout\,
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
	i => \Display1|decOut_n[6]~20_combout\,
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

-- Location: LCCOMB_X53_Y46_N10
\ac|i2c|n_bits[0]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|n_bits[0]~7_combout\ = \ac|i2c|n_bits\(0) $ (VCC)
-- \ac|i2c|n_bits[0]~8\ = CARRY(\ac|i2c|n_bits\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|n_bits\(0),
	datad => VCC,
	combout => \ac|i2c|n_bits[0]~7_combout\,
	cout => \ac|i2c|n_bits[0]~8\);

-- Location: LCCOMB_X53_Y46_N0
\ac|i2c|state~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|state~19_combout\ = (\ac|i2c|process_1~6_combout\) # ((\ac|i2c|state~21_combout\ & (\ac|i2c|state.stop_condition~q\)) # (!\ac|i2c|state~21_combout\ & ((!\ac|i2c|state.idle~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|process_1~6_combout\,
	datab => \ac|i2c|state.stop_condition~q\,
	datac => \ac|i2c|state.idle~q\,
	datad => \ac|i2c|state~21_combout\,
	combout => \ac|i2c|state~19_combout\);

-- Location: LCCOMB_X53_Y48_N10
\ac|i2c|state~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|state~13_combout\ = (!\ac|i2c|process_1~6_combout\ & ((\ac|i2c|state~21_combout\ & ((\ac|i2c|state.start_condition~q\))) # (!\ac|i2c|state~21_combout\ & (\ac|i2c|state.in_progress~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|state.in_progress~q\,
	datab => \ac|i2c|state~21_combout\,
	datac => \ac|i2c|state.start_condition~q\,
	datad => \ac|i2c|process_1~6_combout\,
	combout => \ac|i2c|state~13_combout\);

-- Location: LCCOMB_X53_Y48_N8
\ac|i2c|state~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|state~14_combout\ = (\ac|i2c|state~13_combout\ & \ac|i2c|state.idle~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|state~13_combout\,
	datad => \ac|i2c|state.idle~0_combout\,
	combout => \ac|i2c|state~14_combout\);

-- Location: FF_X53_Y48_N9
\ac|i2c|state.in_progress\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|state~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|state.in_progress~q\);

-- Location: LCCOMB_X53_Y48_N6
\ac|i2c|state.idle~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|state.idle~0_combout\ = (\ac|i2c|state.idle~q\ & ((\ac|i2c|state.start_condition~q\ & (!\ac|i2c|state.stop_condition~q\ & !\ac|i2c|state.in_progress~q\)) # (!\ac|i2c|state.start_condition~q\ & (\ac|i2c|state.stop_condition~q\ $ 
-- (\ac|i2c|state.in_progress~q\))))) # (!\ac|i2c|state.idle~q\ & (!\ac|i2c|state.start_condition~q\ & (!\ac|i2c|state.stop_condition~q\ & !\ac|i2c|state.in_progress~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000101001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|state.idle~q\,
	datab => \ac|i2c|state.start_condition~q\,
	datac => \ac|i2c|state.stop_condition~q\,
	datad => \ac|i2c|state.in_progress~q\,
	combout => \ac|i2c|state.idle~0_combout\);

-- Location: LCCOMB_X53_Y46_N4
\ac|i2c|state~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|state~20_combout\ = (!\ac|i2c|state~19_combout\ & \ac|i2c|state.idle~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|state~19_combout\,
	datad => \ac|i2c|state.idle~0_combout\,
	combout => \ac|i2c|state~20_combout\);

-- Location: FF_X53_Y46_N5
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

-- Location: FF_X54_Y48_N29
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

-- Location: LCCOMB_X54_Y47_N24
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

-- Location: LCCOMB_X56_Y48_N0
\ac|delay[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|delay[0]~0_combout\ = (\ac|Equal0~4_combout\ & !\ac|delay\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|Equal0~4_combout\,
	datac => \ac|delay\(0),
	combout => \ac|delay[0]~0_combout\);

-- Location: FF_X56_Y48_N1
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

-- Location: LCCOMB_X55_Y48_N0
\ac|Add0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Add0~1_cout\ = CARRY(\ac|delay\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|delay\(0),
	datad => VCC,
	cout => \ac|Add0~1_cout\);

-- Location: LCCOMB_X55_Y48_N2
\ac|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Add0~2_combout\ = (\ac|delay\(1) & (\ac|Add0~1_cout\ & VCC)) # (!\ac|delay\(1) & (!\ac|Add0~1_cout\))
-- \ac|Add0~3\ = CARRY((!\ac|delay\(1) & !\ac|Add0~1_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ac|delay\(1),
	datad => VCC,
	cin => \ac|Add0~1_cout\,
	combout => \ac|Add0~2_combout\,
	cout => \ac|Add0~3\);

-- Location: LCCOMB_X56_Y48_N2
\ac|delay[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|delay[1]~1_combout\ = (\ac|Add0~2_combout\ & \ac|Equal0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|Add0~2_combout\,
	datac => \ac|Equal0~4_combout\,
	combout => \ac|delay[1]~1_combout\);

-- Location: FF_X56_Y48_N3
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

-- Location: LCCOMB_X55_Y48_N4
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

-- Location: LCCOMB_X56_Y48_N4
\ac|delay[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|delay[2]~2_combout\ = (\ac|Equal0~4_combout\ & \ac|Add0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|Equal0~4_combout\,
	datac => \ac|Add0~4_combout\,
	combout => \ac|delay[2]~2_combout\);

-- Location: FF_X56_Y48_N5
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

-- Location: LCCOMB_X55_Y48_N6
\ac|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Add0~6_combout\ = (\ac|delay\(3) & (\ac|Add0~5\ & VCC)) # (!\ac|delay\(3) & (!\ac|Add0~5\))
-- \ac|Add0~7\ = CARRY((!\ac|delay\(3) & !\ac|Add0~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ac|delay\(3),
	datad => VCC,
	cin => \ac|Add0~5\,
	combout => \ac|Add0~6_combout\,
	cout => \ac|Add0~7\);

-- Location: LCCOMB_X56_Y48_N6
\ac|delay[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|delay[3]~3_combout\ = (\ac|Equal0~4_combout\ & \ac|Add0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|Equal0~4_combout\,
	datac => \ac|Add0~6_combout\,
	combout => \ac|delay[3]~3_combout\);

-- Location: FF_X56_Y48_N7
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

-- Location: LCCOMB_X55_Y48_N8
\ac|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Add0~8_combout\ = (\ac|delay\(4) & (\ac|Add0~7\ $ (GND))) # (!\ac|delay\(4) & ((GND) # (!\ac|Add0~7\)))
-- \ac|Add0~9\ = CARRY((!\ac|Add0~7\) # (!\ac|delay\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ac|delay\(4),
	datad => VCC,
	cin => \ac|Add0~7\,
	combout => \ac|Add0~8_combout\,
	cout => \ac|Add0~9\);

-- Location: LCCOMB_X54_Y48_N2
\ac|delay[4]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|delay[4]~4_combout\ = (!\ac|Add0~8_combout\) # (!\ac|Equal0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|Equal0~4_combout\,
	datac => \ac|Add0~8_combout\,
	combout => \ac|delay[4]~4_combout\);

-- Location: FF_X54_Y48_N3
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

-- Location: LCCOMB_X55_Y48_N10
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

-- Location: LCCOMB_X54_Y48_N6
\ac|delay[5]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|delay[5]~6_combout\ = (\ac|Equal0~4_combout\ & \ac|Add0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|Equal0~4_combout\,
	datac => \ac|Add0~10_combout\,
	combout => \ac|delay[5]~6_combout\);

-- Location: FF_X54_Y48_N7
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

-- Location: LCCOMB_X55_Y48_N12
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

-- Location: LCCOMB_X54_Y48_N20
\ac|delay[6]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|delay[6]~5_combout\ = (!\ac|Add0~12_combout\) # (!\ac|Equal0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|Equal0~4_combout\,
	datac => \ac|Add0~12_combout\,
	combout => \ac|delay[6]~5_combout\);

-- Location: FF_X54_Y48_N21
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

-- Location: LCCOMB_X55_Y48_N14
\ac|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Add0~14_combout\ = (\ac|delay\(7) & (\ac|Add0~13\ & VCC)) # (!\ac|delay\(7) & (!\ac|Add0~13\))
-- \ac|Add0~15\ = CARRY((!\ac|delay\(7) & !\ac|Add0~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ac|delay\(7),
	datad => VCC,
	cin => \ac|Add0~13\,
	combout => \ac|Add0~14_combout\,
	cout => \ac|Add0~15\);

-- Location: LCCOMB_X54_Y48_N16
\ac|delay[7]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|delay[7]~7_combout\ = (\ac|Equal0~4_combout\ & \ac|Add0~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|Equal0~4_combout\,
	datac => \ac|Add0~14_combout\,
	combout => \ac|delay[7]~7_combout\);

-- Location: FF_X54_Y48_N17
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

-- Location: LCCOMB_X55_Y48_N16
\ac|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Add0~16_combout\ = (\ac|delay\(8) & (\ac|Add0~15\ $ (GND))) # (!\ac|delay\(8) & ((GND) # (!\ac|Add0~15\)))
-- \ac|Add0~17\ = CARRY((!\ac|Add0~15\) # (!\ac|delay\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ac|delay\(8),
	datad => VCC,
	cin => \ac|Add0~15\,
	combout => \ac|Add0~16_combout\,
	cout => \ac|Add0~17\);

-- Location: LCCOMB_X56_Y48_N18
\ac|delay[8]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|delay[8]~8_combout\ = (!\ac|Add0~16_combout\) # (!\ac|Equal0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|Equal0~4_combout\,
	datac => \ac|Add0~16_combout\,
	combout => \ac|delay[8]~8_combout\);

-- Location: FF_X56_Y48_N19
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

-- Location: LCCOMB_X55_Y48_N18
\ac|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Add0~18_combout\ = (\ac|delay\(9) & (!\ac|Add0~17\)) # (!\ac|delay\(9) & (\ac|Add0~17\ & VCC))
-- \ac|Add0~19\ = CARRY((\ac|delay\(9) & !\ac|Add0~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ac|delay\(9),
	datad => VCC,
	cin => \ac|Add0~17\,
	combout => \ac|Add0~18_combout\,
	cout => \ac|Add0~19\);

-- Location: LCCOMB_X56_Y48_N20
\ac|delay[9]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|delay[9]~9_combout\ = (!\ac|Equal0~4_combout\) # (!\ac|Add0~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|Add0~18_combout\,
	datac => \ac|Equal0~4_combout\,
	combout => \ac|delay[9]~9_combout\);

-- Location: FF_X56_Y48_N21
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

-- Location: LCCOMB_X55_Y48_N20
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

-- Location: LCCOMB_X56_Y48_N14
\ac|delay[10]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|delay[10]~10_combout\ = (\ac|Add0~20_combout\ & \ac|Equal0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|Add0~20_combout\,
	datac => \ac|Equal0~4_combout\,
	combout => \ac|delay[10]~10_combout\);

-- Location: FF_X56_Y48_N15
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

-- Location: LCCOMB_X55_Y48_N22
\ac|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Add0~22_combout\ = (\ac|delay\(11) & (\ac|Add0~21\ & VCC)) # (!\ac|delay\(11) & (!\ac|Add0~21\))
-- \ac|Add0~23\ = CARRY((!\ac|delay\(11) & !\ac|Add0~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ac|delay\(11),
	datad => VCC,
	cin => \ac|Add0~21\,
	combout => \ac|Add0~22_combout\,
	cout => \ac|Add0~23\);

-- Location: LCCOMB_X56_Y48_N8
\ac|delay[11]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|delay[11]~11_combout\ = (\ac|Add0~22_combout\ & \ac|Equal0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|Add0~22_combout\,
	datac => \ac|Equal0~4_combout\,
	combout => \ac|delay[11]~11_combout\);

-- Location: FF_X56_Y48_N9
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

-- Location: LCCOMB_X56_Y48_N10
\ac|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Equal0~2_combout\ = (!\ac|delay\(11) & (\ac|delay\(8) & (!\ac|delay\(10) & \ac|delay\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|delay\(11),
	datab => \ac|delay\(8),
	datac => \ac|delay\(10),
	datad => \ac|delay\(9),
	combout => \ac|Equal0~2_combout\);

-- Location: LCCOMB_X55_Y48_N24
\ac|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Add0~24_combout\ = (\ac|delay\(12) & ((GND) # (!\ac|Add0~23\))) # (!\ac|delay\(12) & (\ac|Add0~23\ $ (GND)))
-- \ac|Add0~25\ = CARRY((\ac|delay\(12)) # (!\ac|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ac|delay\(12),
	datad => VCC,
	cin => \ac|Add0~23\,
	combout => \ac|Add0~24_combout\,
	cout => \ac|Add0~25\);

-- Location: LCCOMB_X56_Y48_N16
\ac|delay[12]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|delay[12]~14_combout\ = (\ac|Add0~24_combout\ & \ac|Equal0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|Add0~24_combout\,
	datac => \ac|Equal0~4_combout\,
	combout => \ac|delay[12]~14_combout\);

-- Location: FF_X56_Y48_N17
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

-- Location: LCCOMB_X55_Y48_N26
\ac|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Add0~26_combout\ = (\ac|delay\(13) & (\ac|Add0~25\ & VCC)) # (!\ac|delay\(13) & (!\ac|Add0~25\))
-- \ac|Add0~27\ = CARRY((!\ac|delay\(13) & !\ac|Add0~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ac|delay\(13),
	datad => VCC,
	cin => \ac|Add0~25\,
	combout => \ac|Add0~26_combout\,
	cout => \ac|Add0~27\);

-- Location: LCCOMB_X56_Y48_N26
\ac|delay[13]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|delay[13]~15_combout\ = (\ac|Equal0~4_combout\ & \ac|Add0~26_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|Equal0~4_combout\,
	datac => \ac|Add0~26_combout\,
	combout => \ac|delay[13]~15_combout\);

-- Location: FF_X56_Y48_N27
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

-- Location: LCCOMB_X55_Y48_N28
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

-- Location: LCCOMB_X56_Y48_N12
\ac|delay[14]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|delay[14]~12_combout\ = (!\ac|Equal0~4_combout\) # (!\ac|Add0~28_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|Add0~28_combout\,
	datac => \ac|Equal0~4_combout\,
	combout => \ac|delay[14]~12_combout\);

-- Location: FF_X56_Y48_N13
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

-- Location: LCCOMB_X55_Y48_N30
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

-- Location: LCCOMB_X56_Y48_N22
\ac|delay[15]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|delay[15]~13_combout\ = (!\ac|Equal0~4_combout\) # (!\ac|Add0~30_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|Add0~30_combout\,
	datac => \ac|Equal0~4_combout\,
	combout => \ac|delay[15]~13_combout\);

-- Location: FF_X56_Y48_N23
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

-- Location: LCCOMB_X56_Y48_N28
\ac|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Equal0~3_combout\ = (!\ac|delay\(13) & (!\ac|delay\(12) & (\ac|delay\(15) & \ac|delay\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|delay\(13),
	datab => \ac|delay\(12),
	datac => \ac|delay\(15),
	datad => \ac|delay\(14),
	combout => \ac|Equal0~3_combout\);

-- Location: LCCOMB_X54_Y48_N10
\ac|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Equal0~1_combout\ = (!\ac|delay\(5) & (!\ac|delay\(7) & (\ac|delay\(4) & \ac|delay\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|delay\(5),
	datab => \ac|delay\(7),
	datac => \ac|delay\(4),
	datad => \ac|delay\(6),
	combout => \ac|Equal0~1_combout\);

-- Location: LCCOMB_X56_Y48_N24
\ac|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Equal0~0_combout\ = (!\ac|delay\(3) & (!\ac|delay\(1) & (!\ac|delay\(2) & !\ac|delay\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|delay\(3),
	datab => \ac|delay\(1),
	datac => \ac|delay\(2),
	datad => \ac|delay\(0),
	combout => \ac|Equal0~0_combout\);

-- Location: LCCOMB_X56_Y48_N30
\ac|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Equal0~4_combout\ = (((!\ac|Equal0~0_combout\) # (!\ac|Equal0~1_combout\)) # (!\ac|Equal0~3_combout\)) # (!\ac|Equal0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|Equal0~2_combout\,
	datab => \ac|Equal0~3_combout\,
	datac => \ac|Equal0~1_combout\,
	datad => \ac|Equal0~0_combout\,
	combout => \ac|Equal0~4_combout\);

-- Location: LCCOMB_X54_Y47_N2
\ac|current_config.line_in_gain[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|current_config.line_in_gain[0]~0_combout\ = (\ac|current_config.line_in_gain\(0)) # ((!\ac|txd_request~1_combout\ & (!\ac|Equal0~4_combout\ & !\ac|process_1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|txd_request~1_combout\,
	datab => \ac|Equal0~4_combout\,
	datac => \ac|current_config.line_in_gain\(0),
	datad => \ac|process_1~0_combout\,
	combout => \ac|current_config.line_in_gain[0]~0_combout\);

-- Location: FF_X54_Y47_N3
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

-- Location: LCCOMB_X54_Y47_N4
\ac|state[0]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|state[0]~4_combout\ = (!\ac|Equal0~4_combout\ & ((\ac|process_1~0_combout\) # ((!\ac|txd_request~1_combout\ & !\ac|current_config.line_in_gain\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|txd_request~1_combout\,
	datab => \ac|process_1~0_combout\,
	datac => \ac|Equal0~4_combout\,
	datad => \ac|current_config.line_in_gain\(0),
	combout => \ac|state[0]~4_combout\);

-- Location: LCCOMB_X54_Y47_N18
\ac|state[0]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|state[0]~5_combout\ = (\ac|state[0]~4_combout\ & ((\ac|process_1~0_combout\ & ((!\ac|state\(0)))) # (!\ac|process_1~0_combout\ & (!\ac|current_config.line_in_gain\(0))))) # (!\ac|state[0]~4_combout\ & (((\ac|state\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110001110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|current_config.line_in_gain\(0),
	datab => \ac|state[0]~4_combout\,
	datac => \ac|state\(0),
	datad => \ac|process_1~0_combout\,
	combout => \ac|state[0]~5_combout\);

-- Location: FF_X54_Y47_N19
\ac|state[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|state[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|state\(0));

-- Location: LCCOMB_X54_Y47_N16
\ac|state~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|state~7_combout\ = (\ac|process_1~0_combout\ & (\ac|state\(0) $ (((\ac|state\(1)))))) # (!\ac|process_1~0_combout\ & (((!\ac|current_config.line_in_gain\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|state\(0),
	datab => \ac|current_config.line_in_gain\(0),
	datac => \ac|state\(1),
	datad => \ac|process_1~0_combout\,
	combout => \ac|state~7_combout\);

-- Location: FF_X54_Y47_N17
\ac|state[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|state~7_combout\,
	ena => \ac|state[0]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|state\(1));

-- Location: LCCOMB_X54_Y47_N28
\ac|Add1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Add1~1_combout\ = \ac|state\(2) $ (((\ac|state\(1) & \ac|state\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|state\(2),
	datac => \ac|state\(1),
	datad => \ac|state\(0),
	combout => \ac|Add1~1_combout\);

-- Location: LCCOMB_X54_Y47_N6
\ac|state~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|state~9_combout\ = (\ac|txd_request~q\ & ((\ac|i2c|txd_accepted~q\ & (\ac|Add1~1_combout\)) # (!\ac|i2c|txd_accepted~q\ & ((!\ac|current_config.line_in_gain\(0)))))) # (!\ac|txd_request~q\ & (((!\ac|current_config.line_in_gain\(0)))))

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
	combout => \ac|state~9_combout\);

-- Location: FF_X54_Y47_N7
\ac|state[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|state~9_combout\,
	ena => \ac|state[0]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|state\(2));

-- Location: LCCOMB_X54_Y47_N26
\ac|Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Add1~0_combout\ = \ac|state\(3) $ (((\ac|state\(2) & (\ac|state\(0) & \ac|state\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|state\(2),
	datab => \ac|state\(0),
	datac => \ac|state\(1),
	datad => \ac|state\(3),
	combout => \ac|Add1~0_combout\);

-- Location: LCCOMB_X54_Y47_N20
\ac|state[3]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|state[3]~8_combout\ = (\ac|txd_request~q\ & ((\ac|i2c|txd_accepted~q\ & (\ac|Add1~0_combout\)) # (!\ac|i2c|txd_accepted~q\ & ((\ac|current_config.line_in_gain\(0)))))) # (!\ac|txd_request~q\ & (((\ac|current_config.line_in_gain\(0)))))

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
	combout => \ac|state[3]~8_combout\);

-- Location: LCCOMB_X54_Y47_N12
\ac|state[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|state[3]~6_combout\ = (\ac|state[0]~4_combout\ & ((\ac|state[3]~8_combout\))) # (!\ac|state[0]~4_combout\ & (\ac|state\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|state[0]~4_combout\,
	datac => \ac|state\(3),
	datad => \ac|state[3]~8_combout\,
	combout => \ac|state[3]~6_combout\);

-- Location: FF_X54_Y47_N13
\ac|state[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|state[3]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|state\(3));

-- Location: LCCOMB_X54_Y47_N30
\ac|txd_request~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|txd_request~1_combout\ = (!\ac|state\(0)) # (!\ac|state\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|state\(3),
	datad => \ac|state\(0),
	combout => \ac|txd_request~1_combout\);

-- Location: LCCOMB_X54_Y47_N8
\ac|txd_request~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|txd_request~0_combout\ = (\ac|txd_request~q\ & ((!\ac|i2c|txd_accepted~q\))) # (!\ac|txd_request~q\ & (\ac|txd_request~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|txd_request~1_combout\,
	datac => \ac|txd_request~q\,
	datad => \ac|i2c|txd_accepted~q\,
	combout => \ac|txd_request~0_combout\);

-- Location: FF_X54_Y47_N9
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

-- Location: LCCOMB_X54_Y48_N28
\ac|i2c|txd_accepted~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|txd_accepted~0_combout\ = (!\ac|i2c|state.idle~q\ & \ac|txd_request~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|state.idle~q\,
	datac => \ac|txd_request~q\,
	combout => \ac|i2c|txd_accepted~0_combout\);

-- Location: LCCOMB_X54_Y48_N24
\ac|i2c|phase~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|phase~2_combout\ = (\ac|i2c|state.idle~q\ & !\ac|i2c|phase\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|state.idle~q\,
	datac => \ac|i2c|phase\(0),
	combout => \ac|i2c|phase~2_combout\);

-- Location: LCCOMB_X53_Y48_N12
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

-- Location: LCCOMB_X53_Y48_N28
\ac|i2c|counter[2]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|counter[2]~8_combout\ = (!\ac|i2c|Equal2~0_combout\) # (!\ac|i2c|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|state.idle~q\,
	datac => \ac|i2c|Equal2~0_combout\,
	combout => \ac|i2c|counter[2]~8_combout\);

-- Location: LCCOMB_X53_Y48_N30
\ac|i2c|counter[2]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|counter[2]~9_combout\ = (\ac|i2c|state.idle~q\) # (\ac|txd_request~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|state.idle~q\,
	datac => \ac|txd_request~q\,
	combout => \ac|i2c|counter[2]~9_combout\);

-- Location: FF_X53_Y48_N13
\ac|i2c|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|counter[0]~6_combout\,
	sclr => \ac|i2c|counter[2]~8_combout\,
	ena => \ac|i2c|counter[2]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|counter\(0));

-- Location: LCCOMB_X53_Y48_N14
\ac|i2c|counter[1]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|counter[1]~10_combout\ = (\ac|i2c|counter\(1) & (!\ac|i2c|counter[0]~7\)) # (!\ac|i2c|counter\(1) & ((\ac|i2c|counter[0]~7\) # (GND)))
-- \ac|i2c|counter[1]~11\ = CARRY((!\ac|i2c|counter[0]~7\) # (!\ac|i2c|counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|counter\(1),
	datad => VCC,
	cin => \ac|i2c|counter[0]~7\,
	combout => \ac|i2c|counter[1]~10_combout\,
	cout => \ac|i2c|counter[1]~11\);

-- Location: FF_X53_Y48_N15
\ac|i2c|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|counter[1]~10_combout\,
	sclr => \ac|i2c|counter[2]~8_combout\,
	ena => \ac|i2c|counter[2]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|counter\(1));

-- Location: LCCOMB_X53_Y48_N16
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

-- Location: FF_X53_Y48_N17
\ac|i2c|counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|counter[2]~12_combout\,
	sclr => \ac|i2c|counter[2]~8_combout\,
	ena => \ac|i2c|counter[2]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|counter\(2));

-- Location: LCCOMB_X53_Y48_N18
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

-- Location: FF_X53_Y48_N19
\ac|i2c|counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|counter[3]~14_combout\,
	sclr => \ac|i2c|counter[2]~8_combout\,
	ena => \ac|i2c|counter[2]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|counter\(3));

-- Location: LCCOMB_X53_Y48_N26
\ac|i2c|process_1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|process_1~3_combout\ = (!\ac|i2c|counter\(3) & (!\ac|i2c|counter\(1) & !\ac|i2c|counter\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|counter\(3),
	datac => \ac|i2c|counter\(1),
	datad => \ac|i2c|counter\(2),
	combout => \ac|i2c|process_1~3_combout\);

-- Location: LCCOMB_X53_Y48_N20
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

-- Location: FF_X53_Y48_N21
\ac|i2c|counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|counter[4]~16_combout\,
	sclr => \ac|i2c|counter[2]~8_combout\,
	ena => \ac|i2c|counter[2]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|counter\(4));

-- Location: LCCOMB_X53_Y48_N22
\ac|i2c|counter[5]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|counter[5]~18_combout\ = \ac|i2c|counter\(5) $ (\ac|i2c|counter[4]~17\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|counter\(5),
	cin => \ac|i2c|counter[4]~17\,
	combout => \ac|i2c|counter[5]~18_combout\);

-- Location: FF_X53_Y48_N23
\ac|i2c|counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|i2c|counter[5]~18_combout\,
	sclr => \ac|i2c|counter[2]~8_combout\,
	ena => \ac|i2c|counter[2]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|i2c|counter\(5));

-- Location: LCCOMB_X53_Y48_N4
\ac|i2c|Equal2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|Equal2~0_combout\ = (((!\ac|i2c|counter\(0)) # (!\ac|i2c|counter\(5))) # (!\ac|i2c|counter\(4))) # (!\ac|i2c|process_1~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|process_1~3_combout\,
	datab => \ac|i2c|counter\(4),
	datac => \ac|i2c|counter\(5),
	datad => \ac|i2c|counter\(0),
	combout => \ac|i2c|Equal2~0_combout\);

-- Location: LCCOMB_X54_Y48_N14
\ac|i2c|phase~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|phase~4_combout\ = (\ac|i2c|state.idle~q\ & ((!\ac|i2c|Equal2~0_combout\))) # (!\ac|i2c|state.idle~q\ & (\ac|txd_request~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|state.idle~q\,
	datac => \ac|txd_request~q\,
	datad => \ac|i2c|Equal2~0_combout\,
	combout => \ac|i2c|phase~4_combout\);

-- Location: FF_X54_Y48_N25
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

-- Location: LCCOMB_X54_Y48_N18
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

-- Location: FF_X54_Y48_N19
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

-- Location: LCCOMB_X54_Y48_N4
\ac|i2c|i2c_sclk~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|i2c_sclk~3_combout\ = (\ac|i2c|phase\(1) & \ac|i2c|phase\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|phase\(1),
	datad => \ac|i2c|phase\(0),
	combout => \ac|i2c|i2c_sclk~3_combout\);

-- Location: LCCOMB_X54_Y48_N0
\ac|i2c|n_bits~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|n_bits~6_combout\ = (\ac|i2c|txd_accepted~0_combout\) # ((\ac|i2c|n_bits~5_combout\ & (\ac|i2c|i2c_sclk~3_combout\ & !\ac|i2c|Equal2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|n_bits~5_combout\,
	datab => \ac|i2c|txd_accepted~0_combout\,
	datac => \ac|i2c|i2c_sclk~3_combout\,
	datad => \ac|i2c|Equal2~0_combout\,
	combout => \ac|i2c|n_bits~6_combout\);

-- Location: FF_X53_Y46_N11
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

-- Location: LCCOMB_X53_Y46_N12
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

-- Location: FF_X53_Y46_N13
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

-- Location: LCCOMB_X53_Y46_N14
\ac|i2c|n_bits[2]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|n_bits[2]~11_combout\ = (\ac|i2c|n_bits\(2) & ((GND) # (!\ac|i2c|n_bits[1]~10\))) # (!\ac|i2c|n_bits\(2) & (\ac|i2c|n_bits[1]~10\ $ (GND)))
-- \ac|i2c|n_bits[2]~12\ = CARRY((\ac|i2c|n_bits\(2)) # (!\ac|i2c|n_bits[1]~10\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|n_bits\(2),
	datad => VCC,
	cin => \ac|i2c|n_bits[1]~10\,
	combout => \ac|i2c|n_bits[2]~11_combout\,
	cout => \ac|i2c|n_bits[2]~12\);

-- Location: LCCOMB_X53_Y49_N0
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

-- Location: FF_X53_Y46_N15
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

-- Location: LCCOMB_X53_Y46_N16
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

-- Location: FF_X53_Y46_N17
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

-- Location: LCCOMB_X53_Y46_N18
\ac|i2c|n_bits[4]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|n_bits[4]~15_combout\ = \ac|i2c|n_bits[3]~14\ $ (\ac|i2c|n_bits\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \ac|i2c|n_bits\(4),
	cin => \ac|i2c|n_bits[3]~14\,
	combout => \ac|i2c|n_bits[4]~15_combout\);

-- Location: FF_X53_Y46_N19
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

-- Location: LCCOMB_X53_Y46_N20
\ac|i2c|process_1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|process_1~2_combout\ = (\ac|i2c|n_bits\(0) & (!\ac|i2c|n_bits\(3) & (\ac|i2c|n_bits\(1) $ (!\ac|i2c|n_bits\(4))))) # (!\ac|i2c|n_bits\(0) & (\ac|i2c|n_bits\(3) & (\ac|i2c|n_bits\(1) & !\ac|i2c|n_bits\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000001000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|n_bits\(0),
	datab => \ac|i2c|n_bits\(3),
	datac => \ac|i2c|n_bits\(1),
	datad => \ac|i2c|n_bits\(4),
	combout => \ac|i2c|process_1~2_combout\);

-- Location: LCCOMB_X53_Y46_N6
\ac|i2c|process_1~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|process_1~7_combout\ = (!\ac|i2c|n_bits\(2) & \ac|i2c|process_1~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ac|i2c|n_bits\(2),
	datad => \ac|i2c|process_1~2_combout\,
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

-- Location: FF_X54_Y48_N23
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

-- Location: LCCOMB_X54_Y48_N22
\ac|i2c|process_1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|process_1~4_combout\ = (!\ac|i2c|counter\(0) & (\ac|i2c|phase\(1) & (\ac|i2c|sampled_sdat~q\ & \ac|i2c|state.in_progress~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|counter\(0),
	datab => \ac|i2c|phase\(1),
	datac => \ac|i2c|sampled_sdat~q\,
	datad => \ac|i2c|state.in_progress~q\,
	combout => \ac|i2c|process_1~4_combout\);

-- Location: LCCOMB_X53_Y48_N2
\ac|i2c|process_1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|process_1~5_combout\ = (!\ac|i2c|counter\(4) & (!\ac|i2c|counter\(5) & \ac|i2c|process_1~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|counter\(4),
	datac => \ac|i2c|counter\(5),
	datad => \ac|i2c|process_1~4_combout\,
	combout => \ac|i2c|process_1~5_combout\);

-- Location: LCCOMB_X53_Y48_N24
\ac|i2c|process_1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|process_1~6_combout\ = (\ac|i2c|process_1~7_combout\ & (\ac|i2c|process_1~5_combout\ & (\ac|i2c|process_1~3_combout\ & !\ac|i2c|phase\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|process_1~7_combout\,
	datab => \ac|i2c|process_1~5_combout\,
	datac => \ac|i2c|process_1~3_combout\,
	datad => \ac|i2c|phase\(0),
	combout => \ac|i2c|process_1~6_combout\);

-- Location: LCCOMB_X53_Y46_N28
\ac|i2c|state~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|state~15_combout\ = (!\ac|i2c|process_1~6_combout\ & ((\ac|i2c|state~21_combout\ & ((\ac|i2c|n_bits~5_combout\))) # (!\ac|i2c|state~21_combout\ & (\ac|i2c|state.stop_condition~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|process_1~6_combout\,
	datab => \ac|i2c|state.stop_condition~q\,
	datac => \ac|i2c|n_bits~5_combout\,
	datad => \ac|i2c|state~21_combout\,
	combout => \ac|i2c|state~15_combout\);

-- Location: LCCOMB_X53_Y46_N24
\ac|i2c|state~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|state~16_combout\ = (\ac|i2c|state~15_combout\ & \ac|i2c|state.idle~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|state~15_combout\,
	datad => \ac|i2c|state.idle~0_combout\,
	combout => \ac|i2c|state~16_combout\);

-- Location: FF_X53_Y46_N25
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

-- Location: LCCOMB_X53_Y46_N22
\ac|i2c|n_bits~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|n_bits~5_combout\ = (!\ac|i2c|state.start_condition~q\ & (!\ac|i2c|state.stop_condition~q\ & \ac|i2c|state.idle~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|state.start_condition~q\,
	datab => \ac|i2c|state.stop_condition~q\,
	datac => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|n_bits~5_combout\);

-- Location: LCCOMB_X53_Y46_N8
\ac|i2c|Equal3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|Equal3~0_combout\ = ((\ac|i2c|n_bits\(2)) # ((\ac|i2c|n_bits\(1)) # (\ac|i2c|n_bits\(3)))) # (!\ac|i2c|n_bits\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|n_bits\(0),
	datab => \ac|i2c|n_bits\(2),
	datac => \ac|i2c|n_bits\(1),
	datad => \ac|i2c|n_bits\(3),
	combout => \ac|i2c|Equal3~0_combout\);

-- Location: LCCOMB_X53_Y48_N0
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

-- Location: LCCOMB_X53_Y46_N2
\ac|i2c|state~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|state~21_combout\ = (\ac|i2c|state~12_combout\ & (((!\ac|i2c|n_bits\(4) & !\ac|i2c|Equal3~0_combout\)) # (!\ac|i2c|n_bits~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|n_bits~5_combout\,
	datab => \ac|i2c|n_bits\(4),
	datac => \ac|i2c|Equal3~0_combout\,
	datad => \ac|i2c|state~12_combout\,
	combout => \ac|i2c|state~21_combout\);

-- Location: LCCOMB_X53_Y46_N30
\ac|i2c|state~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|state~17_combout\ = (!\ac|i2c|process_1~6_combout\ & ((\ac|i2c|state~21_combout\ & ((!\ac|i2c|state.idle~q\))) # (!\ac|i2c|state~21_combout\ & (\ac|i2c|state.start_condition~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|state.start_condition~q\,
	datab => \ac|i2c|state~21_combout\,
	datac => \ac|i2c|state.idle~q\,
	datad => \ac|i2c|process_1~6_combout\,
	combout => \ac|i2c|state~17_combout\);

-- Location: LCCOMB_X53_Y46_N26
\ac|i2c|state~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|state~18_combout\ = (\ac|i2c|state~17_combout\ & \ac|i2c|state.idle~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ac|i2c|state~17_combout\,
	datad => \ac|i2c|state.idle~0_combout\,
	combout => \ac|i2c|state~18_combout\);

-- Location: FF_X53_Y46_N27
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

-- Location: LCCOMB_X54_Y48_N30
\ac|i2c|i2c_sclk~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|i2c_sclk~4_combout\ = (\ac|i2c|state.stop_condition~q\ & (((!\ac|i2c|phase\(1) & !\ac|i2c|phase\(0))))) # (!\ac|i2c|state.stop_condition~q\ & (\ac|i2c|state.in_progress~q\ & (\ac|i2c|phase\(1) $ (!\ac|i2c|phase\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001110000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|state.in_progress~q\,
	datab => \ac|i2c|phase\(1),
	datac => \ac|i2c|phase\(0),
	datad => \ac|i2c|state.stop_condition~q\,
	combout => \ac|i2c|i2c_sclk~4_combout\);

-- Location: LCCOMB_X54_Y48_N12
\ac|i2c|i2c_sclk~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|i2c_sclk~5_combout\ = (\ac|i2c|state.start_condition~q\ & (((!\ac|i2c|phase\(0))) # (!\ac|i2c|phase\(1)))) # (!\ac|i2c|state.start_condition~q\ & (((!\ac|i2c|i2c_sclk~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010011110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|state.start_condition~q\,
	datab => \ac|i2c|phase\(1),
	datac => \ac|i2c|i2c_sclk~4_combout\,
	datad => \ac|i2c|phase\(0),
	combout => \ac|i2c|i2c_sclk~5_combout\);

-- Location: LCCOMB_X54_Y47_N10
\ac|Mux12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux12~0_combout\ = (\ac|state\(2) & (\ac|state\(0) & ((!\ac|state\(1)) # (!\ac|current_config.line_in_gain\(0))))) # (!\ac|state\(2) & (((\ac|state\(1) & !\ac|state\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|state\(2),
	datab => \ac|current_config.line_in_gain\(0),
	datac => \ac|state\(1),
	datad => \ac|state\(0),
	combout => \ac|Mux12~0_combout\);

-- Location: LCCOMB_X53_Y47_N10
\ac|Mux6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux6~1_combout\ = (!\ac|state\(2) & (!\ac|state\(1) & (\ac|state\(3) & !\ac|state\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|state\(2),
	datab => \ac|state\(1),
	datac => \ac|state\(3),
	datad => \ac|state\(0),
	combout => \ac|Mux6~1_combout\);

-- Location: LCCOMB_X53_Y47_N22
\ac|Mux12~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux12~1_combout\ = (\ac|Mux6~1_combout\) # ((\ac|Mux12~0_combout\ & !\ac|state\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|Mux12~0_combout\,
	datac => \ac|state\(3),
	datad => \ac|Mux6~1_combout\,
	combout => \ac|Mux12~1_combout\);

-- Location: LCCOMB_X54_Y47_N14
\ac|current_config.volume[4]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|current_config.volume[4]~2_combout\ = (!\ac|Equal0~4_combout\ & ((!\ac|i2c|txd_accepted~q\) # (!\ac|txd_request~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|txd_request~q\,
	datac => \ac|Equal0~4_combout\,
	datad => \ac|i2c|txd_accepted~q\,
	combout => \ac|current_config.volume[4]~2_combout\);

-- Location: FF_X53_Y47_N23
\ac|txd_data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|Mux12~1_combout\,
	ena => \ac|current_config.volume[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|txd_data\(0));

-- Location: LCCOMB_X52_Y47_N6
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

-- Location: FF_X52_Y47_N7
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

-- Location: LCCOMB_X54_Y47_N0
\ac|Mux11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux11~0_combout\ = (\ac|state\(1) & (((\ac|state\(2) & !\ac|current_config.line_in_gain\(0))) # (!\ac|state\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|state\(2),
	datab => \ac|current_config.line_in_gain\(0),
	datac => \ac|state\(1),
	datad => \ac|state\(0),
	combout => \ac|Mux11~0_combout\);

-- Location: LCCOMB_X53_Y47_N4
\ac|Mux11~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux11~1_combout\ = (\ac|Mux11~0_combout\ & !\ac|state\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|Mux11~0_combout\,
	datac => \ac|state\(3),
	combout => \ac|Mux11~1_combout\);

-- Location: FF_X53_Y47_N5
\ac|txd_data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|Mux11~1_combout\,
	ena => \ac|current_config.volume[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|txd_data\(1));

-- Location: LCCOMB_X52_Y47_N28
\ac|i2c|data_to_write~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~24_combout\ = (\ac|i2c|state.idle~q\ & (\ac|i2c|data_to_write\(1))) # (!\ac|i2c|state.idle~q\ & ((\ac|txd_data\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|data_to_write\(1),
	datab => \ac|i2c|state.idle~q\,
	datad => \ac|txd_data\(1),
	combout => \ac|i2c|data_to_write~24_combout\);

-- Location: FF_X52_Y47_N29
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

-- Location: FF_X53_Y47_N11
\ac|txd_data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|Mux6~1_combout\,
	ena => \ac|current_config.volume[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|txd_data\(2));

-- Location: LCCOMB_X52_Y47_N26
\ac|i2c|data_to_write~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~23_combout\ = (\ac|i2c|state.idle~q\ & (\ac|i2c|data_to_write\(2))) # (!\ac|i2c|state.idle~q\ & ((\ac|txd_data\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|data_to_write\(2),
	datac => \ac|txd_data\(2),
	datad => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|data_to_write~23_combout\);

-- Location: FF_X52_Y47_N27
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

-- Location: LCCOMB_X54_Y47_N22
\ac|Mux8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux8~0_combout\ = (\ac|state\(2) & (\ac|state\(1) & !\ac|state\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|state\(2),
	datac => \ac|state\(1),
	datad => \ac|state\(3),
	combout => \ac|Mux8~0_combout\);

-- Location: LCCOMB_X53_Y47_N8
\ac|Mux9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux9~0_combout\ = (!\ac|current_config.line_in_gain\(0) & (\ac|Mux8~0_combout\ & \ac|state\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|current_config.line_in_gain\(0),
	datab => \ac|Mux8~0_combout\,
	datad => \ac|state\(0),
	combout => \ac|Mux9~0_combout\);

-- Location: FF_X53_Y47_N9
\ac|txd_data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|Mux9~0_combout\,
	ena => \ac|current_config.volume[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|txd_data\(3));

-- Location: LCCOMB_X52_Y47_N24
\ac|i2c|data_to_write~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~22_combout\ = (\ac|i2c|state.idle~q\ & (\ac|i2c|data_to_write\(3))) # (!\ac|i2c|state.idle~q\ & ((\ac|txd_data\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|data_to_write\(3),
	datab => \ac|i2c|state.idle~q\,
	datac => \ac|txd_data\(3),
	combout => \ac|i2c|data_to_write~22_combout\);

-- Location: FF_X52_Y47_N25
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

-- Location: LCCOMB_X53_Y47_N30
\ac|Mux8~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux8~1_combout\ = (\ac|Mux8~0_combout\) # ((\ac|current_config.line_in_gain\(0) & \ac|Mux6~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|current_config.line_in_gain\(0),
	datab => \ac|Mux8~0_combout\,
	datad => \ac|Mux6~1_combout\,
	combout => \ac|Mux8~1_combout\);

-- Location: FF_X53_Y47_N31
\ac|txd_data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|Mux8~1_combout\,
	ena => \ac|current_config.volume[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|txd_data\(4));

-- Location: LCCOMB_X52_Y47_N14
\ac|i2c|data_to_write~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~21_combout\ = (\ac|i2c|state.idle~q\ & (\ac|i2c|data_to_write\(4))) # (!\ac|i2c|state.idle~q\ & ((\ac|txd_data\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|data_to_write\(4),
	datac => \ac|txd_data\(4),
	datad => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|data_to_write~21_combout\);

-- Location: FF_X52_Y47_N15
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

-- Location: LCCOMB_X53_Y47_N28
\ac|Mux7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux7~0_combout\ = (!\ac|state\(1) & (!\ac|state\(0) & (\ac|state\(2) $ (\ac|state\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|state\(2),
	datab => \ac|state\(1),
	datac => \ac|state\(3),
	datad => \ac|state\(0),
	combout => \ac|Mux7~0_combout\);

-- Location: FF_X53_Y47_N29
\ac|txd_data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|Mux7~0_combout\,
	ena => \ac|current_config.volume[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|txd_data\(5));

-- Location: LCCOMB_X53_Y47_N16
\ac|i2c|data_to_write~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~20_combout\ = (\ac|i2c|state.idle~q\ & (\ac|i2c|data_to_write\(5))) # (!\ac|i2c|state.idle~q\ & ((\ac|txd_data\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|data_to_write\(5),
	datac => \ac|i2c|state.idle~q\,
	datad => \ac|txd_data\(5),
	combout => \ac|i2c|data_to_write~20_combout\);

-- Location: FF_X53_Y47_N17
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

-- Location: LCCOMB_X53_Y47_N26
\ac|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux6~0_combout\ = (\ac|state\(1) & (!\ac|state\(2) & (!\ac|state\(3)))) # (!\ac|state\(1) & (!\ac|state\(0) & (\ac|state\(2) $ (\ac|state\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|state\(2),
	datab => \ac|state\(1),
	datac => \ac|state\(3),
	datad => \ac|state\(0),
	combout => \ac|Mux6~0_combout\);

-- Location: FF_X53_Y47_N27
\ac|txd_data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|Mux6~0_combout\,
	ena => \ac|current_config.volume[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|txd_data\(6));

-- Location: LCCOMB_X53_Y47_N12
\ac|i2c|data_to_write~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~19_combout\ = (\ac|i2c|state.idle~q\ & (\ac|i2c|data_to_write\(6))) # (!\ac|i2c|state.idle~q\ & ((\ac|txd_data\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|data_to_write\(6),
	datac => \ac|i2c|state.idle~q\,
	datad => \ac|txd_data\(6),
	combout => \ac|i2c|data_to_write~19_combout\);

-- Location: FF_X53_Y47_N13
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

-- Location: LCCOMB_X53_Y47_N6
\ac|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux5~0_combout\ = (\ac|state\(3) & !\ac|state\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ac|state\(3),
	datad => \ac|state\(0),
	combout => \ac|Mux5~0_combout\);

-- Location: FF_X53_Y47_N7
\ac|txd_data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|Mux5~0_combout\,
	ena => \ac|current_config.volume[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|txd_data\(7));

-- Location: LCCOMB_X53_Y47_N18
\ac|i2c|data_to_write~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~18_combout\ = (\ac|i2c|state.idle~q\ & (\ac|i2c|data_to_write\(7))) # (!\ac|i2c|state.idle~q\ & ((\ac|txd_data\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|data_to_write\(7),
	datac => \ac|i2c|state.idle~q\,
	datad => \ac|txd_data\(7),
	combout => \ac|i2c|data_to_write~18_combout\);

-- Location: FF_X53_Y47_N19
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

-- Location: LCCOMB_X52_Y47_N12
\ac|i2c|data_to_write~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~17_combout\ = (\ac|i2c|data_to_write\(8)) # (!\ac|i2c|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|state.idle~q\,
	datad => \ac|i2c|data_to_write\(8),
	combout => \ac|i2c|data_to_write~17_combout\);

-- Location: FF_X52_Y47_N13
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

-- Location: LCCOMB_X53_Y47_N24
\ac|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux4~0_combout\ = (\ac|state\(2) & (\ac|state\(1) & (!\ac|state\(3) & \ac|state\(0)))) # (!\ac|state\(2) & (!\ac|state\(1) & (\ac|state\(3) & !\ac|state\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|state\(2),
	datab => \ac|state\(1),
	datac => \ac|state\(3),
	datad => \ac|state\(0),
	combout => \ac|Mux4~0_combout\);

-- Location: FF_X53_Y47_N25
\ac|txd_data[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|Mux4~0_combout\,
	ena => \ac|current_config.volume[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|txd_data\(8));

-- Location: LCCOMB_X52_Y47_N10
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

-- Location: FF_X52_Y47_N11
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

-- Location: LCCOMB_X53_Y47_N14
\ac|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux3~0_combout\ = (!\ac|state\(3) & ((\ac|state\(0) & ((!\ac|state\(1)))) # (!\ac|state\(0) & (!\ac|state\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|state\(2),
	datab => \ac|state\(1),
	datac => \ac|state\(3),
	datad => \ac|state\(0),
	combout => \ac|Mux3~0_combout\);

-- Location: FF_X53_Y47_N15
\ac|txd_data[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|Mux3~0_combout\,
	ena => \ac|current_config.volume[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|txd_data\(9));

-- Location: LCCOMB_X52_Y47_N0
\ac|i2c|data_to_write~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~15_combout\ = (\ac|i2c|state.idle~q\ & (\ac|i2c|data_to_write\(10))) # (!\ac|i2c|state.idle~q\ & ((\ac|txd_data\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|data_to_write\(10),
	datab => \ac|i2c|state.idle~q\,
	datac => \ac|txd_data\(9),
	combout => \ac|i2c|data_to_write~15_combout\);

-- Location: FF_X52_Y47_N1
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

-- Location: LCCOMB_X53_Y47_N20
\ac|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux2~0_combout\ = (!\ac|state\(0) & ((!\ac|state\(1)) # (!\ac|state\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|state\(2),
	datab => \ac|state\(1),
	datad => \ac|state\(0),
	combout => \ac|Mux2~0_combout\);

-- Location: FF_X53_Y47_N21
\ac|txd_data[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|Mux2~0_combout\,
	ena => \ac|current_config.volume[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|txd_data\(10));

-- Location: LCCOMB_X52_Y48_N20
\ac|i2c|data_to_write~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~14_combout\ = (\ac|i2c|state.idle~q\ & (\ac|i2c|data_to_write\(11))) # (!\ac|i2c|state.idle~q\ & ((\ac|txd_data\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|data_to_write\(11),
	datac => \ac|txd_data\(10),
	datad => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|data_to_write~14_combout\);

-- Location: FF_X52_Y48_N21
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

-- Location: LCCOMB_X53_Y47_N2
\ac|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux1~0_combout\ = (!\ac|state\(3) & (((!\ac|state\(2) & !\ac|state\(1))) # (!\ac|state\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|state\(2),
	datab => \ac|state\(1),
	datac => \ac|state\(3),
	datad => \ac|state\(0),
	combout => \ac|Mux1~0_combout\);

-- Location: FF_X53_Y47_N3
\ac|txd_data[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|Mux1~0_combout\,
	ena => \ac|current_config.volume[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|txd_data\(11));

-- Location: LCCOMB_X52_Y48_N26
\ac|i2c|data_to_write~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~13_combout\ = (\ac|i2c|state.idle~q\ & (\ac|i2c|data_to_write\(12))) # (!\ac|i2c|state.idle~q\ & ((\ac|txd_data\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|state.idle~q\,
	datab => \ac|i2c|data_to_write\(12),
	datad => \ac|txd_data\(11),
	combout => \ac|i2c|data_to_write~13_combout\);

-- Location: FF_X52_Y48_N27
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

-- Location: LCCOMB_X53_Y47_N0
\ac|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|Mux0~0_combout\ = (!\ac|state\(3) & ((\ac|state\(2) & (!\ac|state\(1) & \ac|state\(0))) # (!\ac|state\(2) & (\ac|state\(1) $ (!\ac|state\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|state\(2),
	datab => \ac|state\(1),
	datac => \ac|state\(3),
	datad => \ac|state\(0),
	combout => \ac|Mux0~0_combout\);

-- Location: FF_X53_Y47_N1
\ac|txd_data[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ac|Mux0~0_combout\,
	ena => \ac|current_config.volume[4]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ac|txd_data\(12));

-- Location: LCCOMB_X52_Y48_N16
\ac|i2c|data_to_write~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~12_combout\ = (\ac|i2c|state.idle~q\ & (\ac|i2c|data_to_write\(13))) # (!\ac|i2c|state.idle~q\ & ((\ac|txd_data\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|state.idle~q\,
	datac => \ac|i2c|data_to_write\(13),
	datad => \ac|txd_data\(12),
	combout => \ac|i2c|data_to_write~12_combout\);

-- Location: FF_X52_Y48_N17
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

-- Location: LCCOMB_X52_Y48_N6
\ac|i2c|data_to_write~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~11_combout\ = (\ac|i2c|data_to_write\(14) & \ac|i2c|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|data_to_write\(14),
	datad => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|data_to_write~11_combout\);

-- Location: FF_X52_Y48_N7
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

-- Location: LCCOMB_X52_Y48_N4
\ac|i2c|data_to_write~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~10_combout\ = (\ac|i2c|data_to_write\(15) & \ac|i2c|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|data_to_write\(15),
	datad => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|data_to_write~10_combout\);

-- Location: FF_X52_Y48_N5
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

-- Location: LCCOMB_X52_Y48_N2
\ac|i2c|data_to_write~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~9_combout\ = (\ac|i2c|data_to_write\(16) & \ac|i2c|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ac|i2c|data_to_write\(16),
	datad => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|data_to_write~9_combout\);

-- Location: FF_X52_Y48_N3
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

-- Location: LCCOMB_X52_Y48_N0
\ac|i2c|data_to_write~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~8_combout\ = (\ac|i2c|data_to_write\(17)) # (!\ac|i2c|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|data_to_write\(17),
	datad => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|data_to_write~8_combout\);

-- Location: FF_X52_Y48_N1
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

-- Location: LCCOMB_X52_Y48_N22
\ac|i2c|data_to_write~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~7_combout\ = (\ac|i2c|data_to_write\(18) & \ac|i2c|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|data_to_write\(18),
	datad => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|data_to_write~7_combout\);

-- Location: FF_X52_Y48_N23
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

-- Location: LCCOMB_X52_Y48_N12
\ac|i2c|data_to_write~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~6_combout\ = (\ac|i2c|data_to_write\(19) & \ac|i2c|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ac|i2c|data_to_write\(19),
	datad => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|data_to_write~6_combout\);

-- Location: FF_X52_Y48_N13
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

-- Location: LCCOMB_X52_Y48_N10
\ac|i2c|data_to_write~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~5_combout\ = (\ac|i2c|data_to_write\(20)) # (!\ac|i2c|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|data_to_write\(20),
	datad => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|data_to_write~5_combout\);

-- Location: FF_X52_Y48_N11
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

-- Location: LCCOMB_X52_Y48_N8
\ac|i2c|data_to_write~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~4_combout\ = (\ac|i2c|data_to_write\(21) & \ac|i2c|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|data_to_write\(21),
	datad => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|data_to_write~4_combout\);

-- Location: FF_X52_Y48_N9
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

-- Location: LCCOMB_X52_Y48_N30
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

-- Location: FF_X52_Y48_N31
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

-- Location: LCCOMB_X52_Y48_N28
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

-- Location: FF_X52_Y48_N29
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

-- Location: LCCOMB_X52_Y48_N18
\ac|i2c|data_to_write~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~1_combout\ = (\ac|i2c|data_to_write\(24) & \ac|i2c|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|data_to_write\(24),
	datad => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|data_to_write~1_combout\);

-- Location: FF_X52_Y48_N19
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

-- Location: LCCOMB_X52_Y48_N24
\ac|i2c|data_to_write~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|data_to_write~0_combout\ = (\ac|i2c|data_to_write\(25) & \ac|i2c|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ac|i2c|data_to_write\(25),
	datad => \ac|i2c|state.idle~q\,
	combout => \ac|i2c|data_to_write~0_combout\);

-- Location: FF_X52_Y48_N25
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

-- Location: LCCOMB_X54_Y48_N8
\ac|i2c|i2c_sdat~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|i2c_sdat~1_combout\ = (\ac|i2c|state.stop_condition~q\ & (((!\ac|i2c|i2c_sclk~3_combout\)))) # (!\ac|i2c|state.stop_condition~q\ & (\ac|i2c|state.in_progress~q\ & ((!\ac|i2c|data_to_write\(26)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|state.in_progress~q\,
	datab => \ac|i2c|state.stop_condition~q\,
	datac => \ac|i2c|i2c_sclk~3_combout\,
	datad => \ac|i2c|data_to_write\(26),
	combout => \ac|i2c|i2c_sdat~1_combout\);

-- Location: LCCOMB_X54_Y48_N26
\ac|i2c|i2c_sdat~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ac|i2c|i2c_sdat~2_combout\ = (\ac|i2c|state.start_condition~q\ & (!\ac|i2c|phase\(1) & ((!\ac|i2c|phase\(0))))) # (!\ac|i2c|state.start_condition~q\ & (((!\ac|i2c|i2c_sdat~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100100111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ac|i2c|state.start_condition~q\,
	datab => \ac|i2c|phase\(1),
	datac => \ac|i2c|i2c_sdat~1_combout\,
	datad => \ac|i2c|phase\(0),
	combout => \ac|i2c|i2c_sdat~2_combout\);

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

-- Location: LCCOMB_X60_Y40_N20
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

-- Location: LCCOMB_X62_Y40_N8
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

-- Location: LCCOMB_X62_Y40_N18
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

-- Location: LCCOMB_X62_Y40_N20
\ps2|ll|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add0~12_combout\ = \ps2|ll|Add0~11\ $ (\ps2|ll|sampling_counter\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \ps2|ll|sampling_counter\(6),
	cin => \ps2|ll|Add0~11\,
	combout => \ps2|ll|Add0~12_combout\);

-- Location: FF_X62_Y40_N21
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

-- Location: LCCOMB_X62_Y40_N26
\ps2|ll|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Equal0~0_combout\ = (!\ps2|ll|sampling_counter\(2) & (!\ps2|ll|sampling_counter\(4) & (!\ps2|ll|sampling_counter\(3) & !\ps2|ll|sampling_counter\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|sampling_counter\(2),
	datab => \ps2|ll|sampling_counter\(4),
	datac => \ps2|ll|sampling_counter\(3),
	datad => \ps2|ll|sampling_counter\(1),
	combout => \ps2|ll|Equal0~0_combout\);

-- Location: LCCOMB_X62_Y40_N6
\ps2|ll|Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Equal1~0_combout\ = (!\ps2|ll|sampling_counter\(5) & (!\ps2|ll|sampling_counter\(6) & (\ps2|ll|Equal0~0_combout\ & !\ps2|ll|sampling_counter\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|sampling_counter\(5),
	datab => \ps2|ll|sampling_counter\(6),
	datac => \ps2|ll|Equal0~0_combout\,
	datad => \ps2|ll|sampling_counter\(0),
	combout => \ps2|ll|Equal1~0_combout\);

-- Location: LCCOMB_X62_Y40_N28
\ps2|ll|sampling_counter~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|sampling_counter~1_combout\ = (\ps2|ll|Add0~0_combout\ & !\ps2|ll|Equal1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ps2|ll|Add0~0_combout\,
	datad => \ps2|ll|Equal1~0_combout\,
	combout => \ps2|ll|sampling_counter~1_combout\);

-- Location: FF_X62_Y40_N29
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

-- Location: LCCOMB_X62_Y40_N10
\ps2|ll|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add0~2_combout\ = (\ps2|ll|sampling_counter\(1) & (\ps2|ll|Add0~1\ & VCC)) # (!\ps2|ll|sampling_counter\(1) & (!\ps2|ll|Add0~1\))
-- \ps2|ll|Add0~3\ = CARRY((!\ps2|ll|sampling_counter\(1) & !\ps2|ll|Add0~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|sampling_counter\(1),
	datad => VCC,
	cin => \ps2|ll|Add0~1\,
	combout => \ps2|ll|Add0~2_combout\,
	cout => \ps2|ll|Add0~3\);

-- Location: LCCOMB_X62_Y40_N0
\ps2|ll|sampling_counter~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|sampling_counter~0_combout\ = (\ps2|ll|Add0~2_combout\ & !\ps2|ll|Equal1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Add0~2_combout\,
	datad => \ps2|ll|Equal1~0_combout\,
	combout => \ps2|ll|sampling_counter~0_combout\);

-- Location: FF_X62_Y40_N1
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

-- Location: LCCOMB_X62_Y40_N12
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

-- Location: FF_X62_Y40_N13
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

-- Location: LCCOMB_X62_Y40_N14
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

-- Location: FF_X62_Y40_N15
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

-- Location: LCCOMB_X62_Y40_N16
\ps2|ll|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add0~8_combout\ = (\ps2|ll|sampling_counter\(4) & ((GND) # (!\ps2|ll|Add0~7\))) # (!\ps2|ll|sampling_counter\(4) & (\ps2|ll|Add0~7\ $ (GND)))
-- \ps2|ll|Add0~9\ = CARRY((\ps2|ll|sampling_counter\(4)) # (!\ps2|ll|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|sampling_counter\(4),
	datad => VCC,
	cin => \ps2|ll|Add0~7\,
	combout => \ps2|ll|Add0~8_combout\,
	cout => \ps2|ll|Add0~9\);

-- Location: FF_X62_Y40_N17
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

-- Location: FF_X62_Y40_N19
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

-- Location: LCCOMB_X62_Y40_N22
\ps2|ll|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Equal0~1_combout\ = (!\ps2|ll|sampling_counter\(5) & (!\ps2|ll|sampling_counter\(6) & (\ps2|ll|Equal0~0_combout\ & \ps2|ll|sampling_counter\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|sampling_counter\(5),
	datab => \ps2|ll|sampling_counter\(6),
	datac => \ps2|ll|Equal0~0_combout\,
	datad => \ps2|ll|sampling_counter\(0),
	combout => \ps2|ll|Equal0~1_combout\);

-- Location: FF_X60_Y40_N21
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

-- Location: LCCOMB_X60_Y40_N14
\ps2|ll|ps2_dat_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|ps2_dat_0~0_combout\ = !\ps2_dat~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ps2_dat~input_o\,
	combout => \ps2|ll|ps2_dat_0~0_combout\);

-- Location: FF_X60_Y40_N15
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

-- Location: FF_X60_Y40_N11
\ps2|ll|ps2_dat_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \ps2|ll|ps2_dat_0~q\,
	sload => VCC,
	ena => \ps2|ll|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|ps2_dat_1~q\);

-- Location: LCCOMB_X59_Y36_N10
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

-- Location: LCCOMB_X61_Y40_N0
\ps2|ll|Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add1~0_combout\ = \ps2|ll|idle_counter\(0) $ (VCC)
-- \ps2|ll|Add1~1\ = CARRY(\ps2|ll|idle_counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|idle_counter\(0),
	datad => VCC,
	combout => \ps2|ll|Add1~0_combout\,
	cout => \ps2|ll|Add1~1\);

-- Location: LCCOMB_X61_Y40_N26
\ps2|ll|Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add1~2_combout\ = (!\ps2|ll|ps2_dat_0~q\ & (!\ps2|ll|ps2_clk_0~q\ & \ps2|ll|Add1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|ps2_dat_0~q\,
	datab => \ps2|ll|ps2_clk_0~q\,
	datad => \ps2|ll|Add1~0_combout\,
	combout => \ps2|ll|Add1~2_combout\);

-- Location: LCCOMB_X61_Y40_N18
\ps2|ll|Equal2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Equal2~0_combout\ = (!\ps2|ll|idle_counter\(0) & (!\ps2|ll|idle_counter\(3) & (!\ps2|ll|idle_counter\(2) & !\ps2|ll|idle_counter\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|idle_counter\(0),
	datab => \ps2|ll|idle_counter\(3),
	datac => \ps2|ll|idle_counter\(2),
	datad => \ps2|ll|idle_counter\(1),
	combout => \ps2|ll|Equal2~0_combout\);

-- Location: LCCOMB_X60_Y40_N30
\ps2|ll|Equal2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Equal2~1_combout\ = (!\ps2|ll|idle_counter\(5) & (\ps2|ll|idle_counter\(4) & (\ps2|ll|idle_counter\(7) & !\ps2|ll|idle_counter\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|idle_counter\(5),
	datab => \ps2|ll|idle_counter\(4),
	datac => \ps2|ll|idle_counter\(7),
	datad => \ps2|ll|idle_counter\(6),
	combout => \ps2|ll|Equal2~1_combout\);

-- Location: LCCOMB_X60_Y40_N8
\ps2|ll|Equal2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Equal2~2_combout\ = (\ps2|ll|idle_counter\(8) & (\ps2|ll|Equal2~0_combout\ & \ps2|ll|Equal2~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|idle_counter\(8),
	datab => \ps2|ll|Equal2~0_combout\,
	datac => \ps2|ll|Equal2~1_combout\,
	combout => \ps2|ll|Equal2~2_combout\);

-- Location: LCCOMB_X60_Y40_N2
\ps2|ll|idle_counter[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|idle_counter[0]~0_combout\ = (\ps2|ll|Equal1~0_combout\ & ((\ps2|ll|ps2_clk_0~q\) # ((\ps2|ll|ps2_dat_0~q\) # (!\ps2|ll|Equal2~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|ps2_clk_0~q\,
	datab => \ps2|ll|Equal1~0_combout\,
	datac => \ps2|ll|ps2_dat_0~q\,
	datad => \ps2|ll|Equal2~2_combout\,
	combout => \ps2|ll|idle_counter[0]~0_combout\);

-- Location: FF_X61_Y40_N27
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

-- Location: LCCOMB_X61_Y40_N2
\ps2|ll|Add1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add1~3_combout\ = (\ps2|ll|idle_counter\(1) & (\ps2|ll|Add1~1\ & VCC)) # (!\ps2|ll|idle_counter\(1) & (!\ps2|ll|Add1~1\))
-- \ps2|ll|Add1~4\ = CARRY((!\ps2|ll|idle_counter\(1) & !\ps2|ll|Add1~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|idle_counter\(1),
	datad => VCC,
	cin => \ps2|ll|Add1~1\,
	combout => \ps2|ll|Add1~3_combout\,
	cout => \ps2|ll|Add1~4\);

-- Location: LCCOMB_X61_Y40_N28
\ps2|ll|Add1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add1~5_combout\ = (!\ps2|ll|ps2_dat_0~q\ & (!\ps2|ll|ps2_clk_0~q\ & \ps2|ll|Add1~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|ps2_dat_0~q\,
	datab => \ps2|ll|ps2_clk_0~q\,
	datad => \ps2|ll|Add1~3_combout\,
	combout => \ps2|ll|Add1~5_combout\);

-- Location: FF_X61_Y40_N29
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

-- Location: LCCOMB_X61_Y40_N4
\ps2|ll|Add1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add1~6_combout\ = (\ps2|ll|idle_counter\(2) & ((GND) # (!\ps2|ll|Add1~4\))) # (!\ps2|ll|idle_counter\(2) & (\ps2|ll|Add1~4\ $ (GND)))
-- \ps2|ll|Add1~7\ = CARRY((\ps2|ll|idle_counter\(2)) # (!\ps2|ll|Add1~4\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|idle_counter\(2),
	datad => VCC,
	cin => \ps2|ll|Add1~4\,
	combout => \ps2|ll|Add1~6_combout\,
	cout => \ps2|ll|Add1~7\);

-- Location: LCCOMB_X61_Y40_N30
\ps2|ll|Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add1~8_combout\ = (!\ps2|ll|ps2_clk_0~q\ & (\ps2|ll|Add1~6_combout\ & !\ps2|ll|ps2_dat_0~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|ps2_clk_0~q\,
	datac => \ps2|ll|Add1~6_combout\,
	datad => \ps2|ll|ps2_dat_0~q\,
	combout => \ps2|ll|Add1~8_combout\);

-- Location: FF_X61_Y40_N31
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

-- Location: LCCOMB_X61_Y40_N6
\ps2|ll|Add1~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add1~9_combout\ = (\ps2|ll|idle_counter\(3) & (\ps2|ll|Add1~7\ & VCC)) # (!\ps2|ll|idle_counter\(3) & (!\ps2|ll|Add1~7\))
-- \ps2|ll|Add1~10\ = CARRY((!\ps2|ll|idle_counter\(3) & !\ps2|ll|Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|idle_counter\(3),
	datad => VCC,
	cin => \ps2|ll|Add1~7\,
	combout => \ps2|ll|Add1~9_combout\,
	cout => \ps2|ll|Add1~10\);

-- Location: LCCOMB_X61_Y40_N24
\ps2|ll|Add1~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add1~11_combout\ = (!\ps2|ll|ps2_dat_0~q\ & (!\ps2|ll|ps2_clk_0~q\ & \ps2|ll|Add1~9_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|ps2_dat_0~q\,
	datab => \ps2|ll|ps2_clk_0~q\,
	datad => \ps2|ll|Add1~9_combout\,
	combout => \ps2|ll|Add1~11_combout\);

-- Location: FF_X61_Y40_N25
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

-- Location: LCCOMB_X61_Y40_N8
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

-- Location: LCCOMB_X60_Y40_N16
\ps2|ll|Add1~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add1~23_combout\ = (!\ps2|ll|ps2_dat_0~q\ & (!\ps2|ll|Add1~12_combout\ & !\ps2|ll|ps2_clk_0~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|ps2_dat_0~q\,
	datac => \ps2|ll|Add1~12_combout\,
	datad => \ps2|ll|ps2_clk_0~q\,
	combout => \ps2|ll|Add1~23_combout\);

-- Location: FF_X60_Y40_N17
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

-- Location: LCCOMB_X61_Y40_N10
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

-- Location: LCCOMB_X60_Y40_N12
\ps2|ll|Add1~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add1~25_combout\ = (!\ps2|ll|ps2_dat_0~q\ & (\ps2|ll|Add1~14_combout\ & !\ps2|ll|ps2_clk_0~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|ps2_dat_0~q\,
	datac => \ps2|ll|Add1~14_combout\,
	datad => \ps2|ll|ps2_clk_0~q\,
	combout => \ps2|ll|Add1~25_combout\);

-- Location: FF_X60_Y40_N13
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

-- Location: LCCOMB_X61_Y40_N12
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

-- Location: LCCOMB_X61_Y40_N22
\ps2|ll|Add1~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add1~26_combout\ = (!\ps2|ll|ps2_dat_0~q\ & (!\ps2|ll|ps2_clk_0~q\ & \ps2|ll|Add1~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|ps2_dat_0~q\,
	datab => \ps2|ll|ps2_clk_0~q\,
	datac => \ps2|ll|Add1~16_combout\,
	combout => \ps2|ll|Add1~26_combout\);

-- Location: FF_X61_Y40_N23
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

-- Location: LCCOMB_X61_Y40_N14
\ps2|ll|Add1~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add1~18_combout\ = (\ps2|ll|idle_counter\(7) & (!\ps2|ll|Add1~17\)) # (!\ps2|ll|idle_counter\(7) & (\ps2|ll|Add1~17\ & VCC))
-- \ps2|ll|Add1~19\ = CARRY((\ps2|ll|idle_counter\(7) & !\ps2|ll|Add1~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|idle_counter\(7),
	datad => VCC,
	cin => \ps2|ll|Add1~17\,
	combout => \ps2|ll|Add1~18_combout\,
	cout => \ps2|ll|Add1~19\);

-- Location: LCCOMB_X60_Y40_N26
\ps2|ll|Add1~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add1~24_combout\ = (!\ps2|ll|ps2_dat_0~q\ & (!\ps2|ll|Add1~18_combout\ & !\ps2|ll|ps2_clk_0~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|ps2_dat_0~q\,
	datac => \ps2|ll|Add1~18_combout\,
	datad => \ps2|ll|ps2_clk_0~q\,
	combout => \ps2|ll|Add1~24_combout\);

-- Location: FF_X60_Y40_N27
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

-- Location: LCCOMB_X61_Y40_N16
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

-- Location: LCCOMB_X61_Y40_N20
\ps2|ll|Add1~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add1~22_combout\ = (!\ps2|ll|ps2_dat_0~q\ & (!\ps2|ll|ps2_clk_0~q\ & !\ps2|ll|Add1~20_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|ps2_dat_0~q\,
	datab => \ps2|ll|ps2_clk_0~q\,
	datad => \ps2|ll|Add1~20_combout\,
	combout => \ps2|ll|Add1~22_combout\);

-- Location: FF_X61_Y40_N21
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

-- Location: LCCOMB_X60_Y38_N18
\ps2|ll|txd_accepted~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|txd_accepted~0_combout\ = (\ps2|ll|process_0~7_combout\ & (\ps2|ll|Equal1~0_combout\ & \ps2|ll|time_out_counter[8]~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|process_0~7_combout\,
	datac => \ps2|ll|Equal1~0_combout\,
	datad => \ps2|ll|time_out_counter[8]~4_combout\,
	combout => \ps2|ll|txd_accepted~0_combout\);

-- Location: FF_X60_Y38_N19
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

-- Location: LCCOMB_X65_Y38_N28
\ps2|Selector6~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector6~15_combout\ = (\ps2|state.wait_for_reset_acknowledge~q\ & \ps2|process_0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|state.wait_for_reset_acknowledge~q\,
	datac => \ps2|process_0~2_combout\,
	combout => \ps2|Selector6~15_combout\);

-- Location: FF_X60_Y40_N25
\ps2|ll|ps2_clk_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \ps2|ll|ps2_clk_0~q\,
	sload => VCC,
	ena => \ps2|ll|Equal0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|ps2_clk_1~q\);

-- Location: LCCOMB_X60_Y38_N26
\ps2|ll|process_0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|process_0~5_combout\ = (!\ps2|ll|ps2_clk_0~q\ & \ps2|ll|ps2_clk_1~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|ps2_clk_0~q\,
	datab => \ps2|ll|ps2_clk_1~q\,
	combout => \ps2|ll|process_0~5_combout\);

-- Location: LCCOMB_X61_Y37_N28
\ps2|ll|state~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~21_combout\ = (\ps2|ll|state.idle~2_combout\ & ((\ps2|ll|state~18_combout\ & (\ps2|ll|state.sending~q\)) # (!\ps2|ll|state~18_combout\ & ((\ps2|ll|state.interrupting~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state~18_combout\,
	datab => \ps2|ll|state.idle~2_combout\,
	datac => \ps2|ll|state.sending~q\,
	datad => \ps2|ll|state.interrupting~q\,
	combout => \ps2|ll|state~21_combout\);

-- Location: FF_X61_Y37_N29
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

-- Location: LCCOMB_X61_Y37_N22
\ps2|ll|state.idle~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state.idle~1_combout\ = (\ps2|ll|state.idle~q\ & ((\ps2|ll|state.finishing~q\ & (!\ps2|ll|state.sending~q\ & !\ps2|ll|state.waiting_for_acknowledge~q\)) # (!\ps2|ll|state.finishing~q\ & (\ps2|ll|state.sending~q\ $ 
-- (\ps2|ll|state.waiting_for_acknowledge~q\))))) # (!\ps2|ll|state.idle~q\ & (!\ps2|ll|state.finishing~q\ & (!\ps2|ll|state.sending~q\ & !\ps2|ll|state.waiting_for_acknowledge~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000101001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state.idle~q\,
	datab => \ps2|ll|state.finishing~q\,
	datac => \ps2|ll|state.sending~q\,
	datad => \ps2|ll|state.waiting_for_acknowledge~q\,
	combout => \ps2|ll|state.idle~1_combout\);

-- Location: LCCOMB_X61_Y37_N12
\ps2|ll|state.idle~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state.idle~0_combout\ = (\ps2|ll|state.idle~q\ & (!\ps2|ll|state.finishing~q\ & (!\ps2|ll|state.sending~q\ & !\ps2|ll|state.waiting_for_acknowledge~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state.idle~q\,
	datab => \ps2|ll|state.finishing~q\,
	datac => \ps2|ll|state.sending~q\,
	datad => \ps2|ll|state.waiting_for_acknowledge~q\,
	combout => \ps2|ll|state.idle~0_combout\);

-- Location: LCCOMB_X61_Y37_N8
\ps2|ll|state.idle~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state.idle~2_combout\ = (\ps2|ll|state.interrupting~q\ & (!\ps2|ll|state.receiving~q\ & ((\ps2|ll|state.idle~0_combout\)))) # (!\ps2|ll|state.interrupting~q\ & ((\ps2|ll|state.receiving~q\ & ((\ps2|ll|state.idle~0_combout\))) # 
-- (!\ps2|ll|state.receiving~q\ & (\ps2|ll|state.idle~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state.interrupting~q\,
	datab => \ps2|ll|state.receiving~q\,
	datac => \ps2|ll|state.idle~1_combout\,
	datad => \ps2|ll|state.idle~0_combout\,
	combout => \ps2|ll|state.idle~2_combout\);

-- Location: LCCOMB_X60_Y38_N8
\ps2|ll|time_out_counter[8]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[8]~15_combout\ = (\ps2|ll|Equal3~4_combout\ & (\ps2|ll|Equal3~0_combout\ & \ps2|ll|state.interrupting~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Equal3~4_combout\,
	datac => \ps2|ll|Equal3~0_combout\,
	datad => \ps2|ll|state.interrupting~q\,
	combout => \ps2|ll|time_out_counter[8]~15_combout\);

-- Location: LCCOMB_X59_Y36_N14
\ps2|ll|Add2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add2~4_combout\ = (\ps2|ll|time_out_counter\(2) & ((GND) # (!\ps2|ll|Add2~3\))) # (!\ps2|ll|time_out_counter\(2) & (\ps2|ll|Add2~3\ $ (GND)))
-- \ps2|ll|Add2~5\ = CARRY((\ps2|ll|time_out_counter\(2)) # (!\ps2|ll|Add2~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|time_out_counter\(2),
	datad => VCC,
	cin => \ps2|ll|Add2~3\,
	combout => \ps2|ll|Add2~4_combout\,
	cout => \ps2|ll|Add2~5\);

-- Location: LCCOMB_X59_Y36_N16
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

-- Location: LCCOMB_X60_Y40_N18
\ps2|ll|time_out_counter[8]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[8]~3_combout\ = (!\ps2|ll|ps2_clk_0~q\ & (\ps2|ll|ps2_dat_0~q\ & !\ps2|ll|state.idle~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|ps2_clk_0~q\,
	datac => \ps2|ll|ps2_dat_0~q\,
	datad => \ps2|ll|state.idle~q\,
	combout => \ps2|ll|time_out_counter[8]~3_combout\);

-- Location: LCCOMB_X60_Y36_N28
\ps2|ll|Selector17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector17~0_combout\ = (!\ps2|ll|time_out_counter[8]~15_combout\ & ((\ps2|ll|time_out_counter[8]~8_combout\ & (\ps2|ll|Add2~6_combout\)) # (!\ps2|ll|time_out_counter[8]~8_combout\ & ((\ps2|ll|time_out_counter[8]~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter[8]~8_combout\,
	datab => \ps2|ll|Add2~6_combout\,
	datac => \ps2|ll|time_out_counter[8]~15_combout\,
	datad => \ps2|ll|time_out_counter[8]~3_combout\,
	combout => \ps2|ll|Selector17~0_combout\);

-- Location: FF_X60_Y36_N29
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

-- Location: LCCOMB_X59_Y36_N18
\ps2|ll|Add2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add2~8_combout\ = (\ps2|ll|time_out_counter\(4) & ((GND) # (!\ps2|ll|Add2~7\))) # (!\ps2|ll|time_out_counter\(4) & (\ps2|ll|Add2~7\ $ (GND)))
-- \ps2|ll|Add2~9\ = CARRY((\ps2|ll|time_out_counter\(4)) # (!\ps2|ll|Add2~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter\(4),
	datad => VCC,
	cin => \ps2|ll|Add2~7\,
	combout => \ps2|ll|Add2~8_combout\,
	cout => \ps2|ll|Add2~9\);

-- Location: LCCOMB_X60_Y36_N6
\ps2|ll|Selector16~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector16~0_combout\ = (\ps2|ll|time_out_counter[8]~15_combout\) # ((\ps2|ll|time_out_counter[8]~8_combout\ & (\ps2|ll|Add2~8_combout\)) # (!\ps2|ll|time_out_counter[8]~8_combout\ & ((!\ps2|ll|time_out_counter[8]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter[8]~15_combout\,
	datab => \ps2|ll|Add2~8_combout\,
	datac => \ps2|ll|time_out_counter[8]~8_combout\,
	datad => \ps2|ll|time_out_counter[8]~3_combout\,
	combout => \ps2|ll|Selector16~0_combout\);

-- Location: FF_X60_Y36_N7
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

-- Location: LCCOMB_X59_Y36_N20
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

-- Location: LCCOMB_X59_Y36_N22
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

-- Location: LCCOMB_X60_Y36_N14
\ps2|ll|time_out_counter[6]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[6]~16_combout\ = (\ps2|ll|time_out_counter[0]~12_combout\ & ((\ps2|ll|Add2~12_combout\) # ((!\ps2|ll|time_out_counter[8]~9_combout\)))) # (!\ps2|ll|time_out_counter[0]~12_combout\ & (((\ps2|ll|time_out_counter\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Add2~12_combout\,
	datab => \ps2|ll|time_out_counter[8]~9_combout\,
	datac => \ps2|ll|time_out_counter\(6),
	datad => \ps2|ll|time_out_counter[0]~12_combout\,
	combout => \ps2|ll|time_out_counter[6]~16_combout\);

-- Location: FF_X60_Y36_N15
\ps2|ll|time_out_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|time_out_counter[6]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|time_out_counter\(6));

-- Location: LCCOMB_X59_Y36_N24
\ps2|ll|Add2~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add2~14_combout\ = (\ps2|ll|time_out_counter\(7) & (\ps2|ll|Add2~13\ & VCC)) # (!\ps2|ll|time_out_counter\(7) & (!\ps2|ll|Add2~13\))
-- \ps2|ll|Add2~15\ = CARRY((!\ps2|ll|time_out_counter\(7) & !\ps2|ll|Add2~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter\(7),
	datad => VCC,
	cin => \ps2|ll|Add2~13\,
	combout => \ps2|ll|Add2~14_combout\,
	cout => \ps2|ll|Add2~15\);

-- Location: LCCOMB_X60_Y36_N2
\ps2|ll|Selector13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector13~0_combout\ = (\ps2|ll|time_out_counter[8]~15_combout\) # ((\ps2|ll|time_out_counter[8]~8_combout\ & (\ps2|ll|Add2~14_combout\)) # (!\ps2|ll|time_out_counter[8]~8_combout\ & ((\ps2|ll|time_out_counter[8]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter[8]~15_combout\,
	datab => \ps2|ll|Add2~14_combout\,
	datac => \ps2|ll|time_out_counter[8]~8_combout\,
	datad => \ps2|ll|time_out_counter[8]~3_combout\,
	combout => \ps2|ll|Selector13~0_combout\);

-- Location: FF_X60_Y36_N3
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

-- Location: LCCOMB_X59_Y36_N26
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

-- Location: LCCOMB_X59_Y36_N0
\ps2|ll|time_out_counter[8]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[8]~0_combout\ = (\ps2|ll|time_out_counter[8]~9_combout\ & (\ps2|ll|Add2~16_combout\)) # (!\ps2|ll|time_out_counter[8]~9_combout\ & ((\ps2|ll|time_out_counter[8]~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Add2~16_combout\,
	datab => \ps2|ll|time_out_counter[8]~15_combout\,
	datad => \ps2|ll|time_out_counter[8]~9_combout\,
	combout => \ps2|ll|time_out_counter[8]~0_combout\);

-- Location: FF_X59_Y36_N1
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

-- Location: LCCOMB_X59_Y36_N28
\ps2|ll|Add2~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add2~18_combout\ = (\ps2|ll|time_out_counter\(9) & (\ps2|ll|Add2~17\ & VCC)) # (!\ps2|ll|time_out_counter\(9) & (!\ps2|ll|Add2~17\))
-- \ps2|ll|Add2~19\ = CARRY((!\ps2|ll|time_out_counter\(9) & !\ps2|ll|Add2~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|time_out_counter\(9),
	datad => VCC,
	cin => \ps2|ll|Add2~17\,
	combout => \ps2|ll|Add2~18_combout\,
	cout => \ps2|ll|Add2~19\);

-- Location: LCCOMB_X59_Y36_N2
\ps2|ll|time_out_counter[9]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[9]~1_combout\ = (\ps2|ll|time_out_counter[8]~9_combout\ & (\ps2|ll|Add2~18_combout\)) # (!\ps2|ll|time_out_counter[8]~9_combout\ & ((\ps2|ll|time_out_counter[8]~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter[8]~9_combout\,
	datab => \ps2|ll|Add2~18_combout\,
	datad => \ps2|ll|time_out_counter[8]~15_combout\,
	combout => \ps2|ll|time_out_counter[9]~1_combout\);

-- Location: FF_X59_Y36_N3
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

-- Location: LCCOMB_X59_Y36_N30
\ps2|ll|Add2~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add2~20_combout\ = \ps2|ll|time_out_counter\(10) $ (\ps2|ll|Add2~19\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|time_out_counter\(10),
	cin => \ps2|ll|Add2~19\,
	combout => \ps2|ll|Add2~20_combout\);

-- Location: LCCOMB_X59_Y36_N4
\ps2|ll|time_out_counter[10]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[10]~2_combout\ = (\ps2|ll|time_out_counter[8]~9_combout\ & (\ps2|ll|Add2~20_combout\)) # (!\ps2|ll|time_out_counter[8]~9_combout\ & ((\ps2|ll|time_out_counter[8]~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Add2~20_combout\,
	datab => \ps2|ll|time_out_counter[8]~15_combout\,
	datad => \ps2|ll|time_out_counter[8]~9_combout\,
	combout => \ps2|ll|time_out_counter[10]~2_combout\);

-- Location: FF_X59_Y36_N5
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

-- Location: LCCOMB_X60_Y36_N4
\ps2|ll|Equal3~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Equal3~4_combout\ = (!\ps2|ll|time_out_counter\(4) & (!\ps2|ll|time_out_counter\(0) & (!\ps2|ll|time_out_counter\(10) & \ps2|ll|Equal3~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter\(4),
	datab => \ps2|ll|time_out_counter\(0),
	datac => \ps2|ll|time_out_counter\(10),
	datad => \ps2|ll|Equal3~1_combout\,
	combout => \ps2|ll|Equal3~4_combout\);

-- Location: LCCOMB_X61_Y37_N4
\ps2|ll|state~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~30_combout\ = (\ps2|ll|state.sending~q\ & ((!\ps2|ll|Equal3~0_combout\) # (!\ps2|ll|Equal3~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state.sending~q\,
	datac => \ps2|ll|Equal3~4_combout\,
	datad => \ps2|ll|Equal3~0_combout\,
	combout => \ps2|ll|state~30_combout\);

-- Location: LCCOMB_X61_Y37_N0
\ps2|ll|state~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~31_combout\ = (\ps2|ll|state.idle~2_combout\ & ((\ps2|ll|state~18_combout\ & (\ps2|ll|state.waiting_for_acknowledge~q\)) # (!\ps2|ll|state~18_combout\ & ((\ps2|ll|state~30_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state~18_combout\,
	datab => \ps2|ll|state.idle~2_combout\,
	datac => \ps2|ll|state.waiting_for_acknowledge~q\,
	datad => \ps2|ll|state~30_combout\,
	combout => \ps2|ll|state~31_combout\);

-- Location: FF_X61_Y37_N1
\ps2|ll|state.waiting_for_acknowledge\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|state~31_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|state.waiting_for_acknowledge~q\);

-- Location: LCCOMB_X60_Y40_N24
\ps2|ll|state~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~14_combout\ = (\ps2|ll|state.waiting_for_acknowledge~q\ & ((\ps2|ll|ps2_clk_0~q\) # (!\ps2|ll|ps2_clk_1~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|ps2_clk_0~q\,
	datac => \ps2|ll|ps2_clk_1~q\,
	datad => \ps2|ll|state.waiting_for_acknowledge~q\,
	combout => \ps2|ll|state~14_combout\);

-- Location: LCCOMB_X60_Y37_N26
\ps2|ll|state~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~15_combout\ = (\ps2|ll|state.finishing~q\ & (\ps2|ll|ps2_dat_0~q\ & ((\ps2|ll|state~14_combout\) # (!\ps2|ll|state.receiving~q\)))) # (!\ps2|ll|state.finishing~q\ & (((\ps2|ll|state~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state.finishing~q\,
	datab => \ps2|ll|ps2_dat_0~q\,
	datac => \ps2|ll|state~14_combout\,
	datad => \ps2|ll|state.receiving~q\,
	combout => \ps2|ll|state~15_combout\);

-- Location: LCCOMB_X61_Y38_N12
\ps2|ll|Selector9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector9~0_combout\ = (\ps2|ll|state.idle~q\ & !\ps2|ll|n_bits\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state.idle~q\,
	datac => \ps2|ll|n_bits\(0),
	combout => \ps2|ll|Selector9~0_combout\);

-- Location: LCCOMB_X60_Y38_N22
\ps2|ll|data[6]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|data[6]~0_combout\ = (!\ps2|ll|state.sending~q\ & (((\ps2|ll|Equal3~4_combout\ & \ps2|ll|Equal3~0_combout\)) # (!\ps2|ll|process_0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Equal3~4_combout\,
	datab => \ps2|ll|state.sending~q\,
	datac => \ps2|ll|process_0~5_combout\,
	datad => \ps2|ll|Equal3~0_combout\,
	combout => \ps2|ll|data[6]~0_combout\);

-- Location: LCCOMB_X60_Y38_N4
\ps2|ll|time_out_counter[8]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[8]~19_combout\ = (\ps2|ll|ps2_clk_0~q\ & (\ps2|ll|state.sending~q\ & (!\ps2|ll|ps2_clk_1~q\ & \ps2|ll|Equal6~0_combout\)))

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
	combout => \ps2|ll|time_out_counter[8]~19_combout\);

-- Location: LCCOMB_X60_Y38_N14
\ps2|ll|start_bit~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|start_bit~0_combout\ = (\ps2|ll|start_bit~q\ & (((\ps2|ll|Equal3~3_combout\) # (!\ps2|ll|time_out_counter[8]~19_combout\)) # (!\ps2|ll|Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Equal1~0_combout\,
	datab => \ps2|ll|time_out_counter[8]~19_combout\,
	datac => \ps2|ll|Equal3~3_combout\,
	datad => \ps2|ll|start_bit~q\,
	combout => \ps2|ll|start_bit~0_combout\);

-- Location: LCCOMB_X60_Y38_N20
\ps2|ll|start_bit~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|start_bit~1_combout\ = (\ps2|ll|start_bit~0_combout\) # ((\ps2|ll|Equal1~0_combout\ & (\ps2|ll|time_out_counter[8]~15_combout\ & !\ps2|ll|state.sending~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Equal1~0_combout\,
	datab => \ps2|ll|time_out_counter[8]~15_combout\,
	datac => \ps2|ll|state.sending~q\,
	datad => \ps2|ll|start_bit~0_combout\,
	combout => \ps2|ll|start_bit~1_combout\);

-- Location: FF_X60_Y38_N21
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

-- Location: LCCOMB_X60_Y36_N26
\ps2|ll|process_0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|process_0~8_combout\ = (\ps2|ll|time_out_counter\(2) & (\ps2|ll|time_out_counter\(1) & (!\ps2|ll|start_bit~q\ & \ps2|ll|time_out_counter\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter\(2),
	datab => \ps2|ll|time_out_counter\(1),
	datac => \ps2|ll|start_bit~q\,
	datad => \ps2|ll|time_out_counter\(3),
	combout => \ps2|ll|process_0~8_combout\);

-- Location: LCCOMB_X60_Y36_N30
\ps2|ll|data[6]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|data[6]~1_combout\ = (\ps2|ll|state.sending~q\ & (((!\ps2|ll|Equal3~4_combout\) # (!\ps2|ll|time_out_counter\(6))) # (!\ps2|ll|process_0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|process_0~8_combout\,
	datab => \ps2|ll|time_out_counter\(6),
	datac => \ps2|ll|Equal3~4_combout\,
	datad => \ps2|ll|state.sending~q\,
	combout => \ps2|ll|data[6]~1_combout\);

-- Location: LCCOMB_X60_Y38_N16
\ps2|ll|data[6]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|data[6]~2_combout\ = (\ps2|ll|data[6]~0_combout\) # ((\ps2|ll|data[6]~1_combout\) # (!\ps2|ll|state.receiving~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|data[6]~0_combout\,
	datac => \ps2|ll|data[6]~1_combout\,
	datad => \ps2|ll|state.receiving~q\,
	combout => \ps2|ll|data[6]~2_combout\);

-- Location: LCCOMB_X60_Y36_N20
\ps2|ll|Selector21~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector21~0_combout\ = (\ps2|ll|process_0~8_combout\ & (\ps2|ll|time_out_counter\(6) & (\ps2|ll|Equal3~4_combout\ & \ps2|ll|state.sending~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|process_0~8_combout\,
	datab => \ps2|ll|time_out_counter\(6),
	datac => \ps2|ll|Equal3~4_combout\,
	datad => \ps2|ll|state.sending~q\,
	combout => \ps2|ll|Selector21~0_combout\);

-- Location: LCCOMB_X61_Y38_N30
\ps2|ll|n_bits[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|n_bits[0]~3_combout\ = (!\ps2|ll|state.idle~q\ & ((\ps2|ll|process_0~7_combout\) # ((!\ps2|ll|ps2_clk_0~q\ & \ps2|ll|ps2_dat_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|ps2_clk_0~q\,
	datab => \ps2|ll|ps2_dat_0~q\,
	datac => \ps2|ll|state.idle~q\,
	datad => \ps2|ll|process_0~7_combout\,
	combout => \ps2|ll|n_bits[0]~3_combout\);

-- Location: LCCOMB_X61_Y38_N10
\ps2|ll|n_bits[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|n_bits[0]~2_combout\ = (\ps2|ll|Equal1~0_combout\ & (((\ps2|ll|Selector21~0_combout\) # (\ps2|ll|n_bits[0]~3_combout\)) # (!\ps2|ll|data[6]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|data[6]~2_combout\,
	datab => \ps2|ll|Selector21~0_combout\,
	datac => \ps2|ll|n_bits[0]~3_combout\,
	datad => \ps2|ll|Equal1~0_combout\,
	combout => \ps2|ll|n_bits[0]~2_combout\);

-- Location: FF_X61_Y38_N13
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

-- Location: LCCOMB_X61_Y38_N0
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

-- Location: FF_X61_Y38_N1
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

-- Location: LCCOMB_X61_Y38_N28
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

-- Location: FF_X61_Y38_N29
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

-- Location: LCCOMB_X61_Y38_N2
\ps2|ll|Add3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add3~1_combout\ = \ps2|ll|n_bits\(3) $ (((\ps2|ll|n_bits\(0) & (\ps2|ll|n_bits\(2) & \ps2|ll|n_bits\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|n_bits\(0),
	datab => \ps2|ll|n_bits\(2),
	datac => \ps2|ll|n_bits\(3),
	datad => \ps2|ll|n_bits\(1),
	combout => \ps2|ll|Add3~1_combout\);

-- Location: FF_X61_Y38_N3
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

-- Location: LCCOMB_X61_Y38_N6
\ps2|ll|Equal6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Equal6~0_combout\ = ((\ps2|ll|n_bits\(2)) # ((!\ps2|ll|n_bits\(1)) # (!\ps2|ll|n_bits\(3)))) # (!\ps2|ll|n_bits\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|n_bits\(0),
	datab => \ps2|ll|n_bits\(2),
	datac => \ps2|ll|n_bits\(3),
	datad => \ps2|ll|n_bits\(1),
	combout => \ps2|ll|Equal6~0_combout\);

-- Location: LCCOMB_X60_Y37_N12
\ps2|ll|state~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~16_combout\ = (\ps2|ll|state~15_combout\) # ((\ps2|ll|state.interrupting~q\) # ((\ps2|ll|Equal6~0_combout\ & \ps2|ll|state.sending~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state~15_combout\,
	datab => \ps2|ll|state.interrupting~q\,
	datac => \ps2|ll|Equal6~0_combout\,
	datad => \ps2|ll|state.sending~q\,
	combout => \ps2|ll|state~16_combout\);

-- Location: LCCOMB_X60_Y38_N24
\ps2|ll|rxd_data[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|rxd_data[1]~0_combout\ = (\ps2|ll|ps2_clk_1~q\ & (!\ps2|ll|ps2_clk_0~q\ & \ps2|ll|process_0~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|ps2_clk_1~q\,
	datac => \ps2|ll|ps2_clk_0~q\,
	datad => \ps2|ll|process_0~4_combout\,
	combout => \ps2|ll|rxd_data[1]~0_combout\);

-- Location: LCCOMB_X60_Y37_N30
\ps2|ll|state~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~17_combout\ = (!\ps2|ll|Equal3~3_combout\ & ((\ps2|ll|state~16_combout\) # ((!\ps2|ll|rxd_data[1]~0_combout\ & \ps2|ll|state.receiving~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state~16_combout\,
	datab => \ps2|ll|rxd_data[1]~0_combout\,
	datac => \ps2|ll|Equal3~3_combout\,
	datad => \ps2|ll|state.receiving~q\,
	combout => \ps2|ll|state~17_combout\);

-- Location: LCCOMB_X60_Y37_N8
\ps2|ll|state~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~18_combout\ = (\ps2|ll|state~17_combout\) # (((\ps2|ll|time_out_counter[8]~4_combout\ & !\ps2|ll|process_0~7_combout\)) # (!\ps2|ll|Equal1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state~17_combout\,
	datab => \ps2|ll|time_out_counter[8]~4_combout\,
	datac => \ps2|ll|process_0~7_combout\,
	datad => \ps2|ll|Equal1~0_combout\,
	combout => \ps2|ll|state~18_combout\);

-- Location: LCCOMB_X61_Y37_N24
\ps2|ll|state~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~19_combout\ = (\ps2|ll|state.idle~2_combout\ & ((\ps2|ll|state~18_combout\ & ((\ps2|ll|state.receiving~q\))) # (!\ps2|ll|state~18_combout\ & (\ps2|ll|time_out_counter[8]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state~18_combout\,
	datab => \ps2|ll|time_out_counter[8]~3_combout\,
	datac => \ps2|ll|state.receiving~q\,
	datad => \ps2|ll|state.idle~2_combout\,
	combout => \ps2|ll|state~19_combout\);

-- Location: FF_X61_Y37_N25
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

-- Location: LCCOMB_X60_Y38_N12
\ps2|ll|Selector21~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector21~2_combout\ = (!\ps2|ll|state.interrupting~q\ & (((\ps2|ll|process_0~5_combout\ & !\ps2|ll|Equal3~3_combout\)) # (!\ps2|ll|state.receiving~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|process_0~5_combout\,
	datab => \ps2|ll|state.receiving~q\,
	datac => \ps2|ll|Equal3~3_combout\,
	datad => \ps2|ll|state.interrupting~q\,
	combout => \ps2|ll|Selector21~2_combout\);

-- Location: LCCOMB_X61_Y38_N24
\ps2|ll|Selector21~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector21~3_combout\ = (\ps2|ll|data\(10) & ((!\ps2|ll|state.idle~0_combout\) # (!\ps2|ll|Selector21~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Selector21~2_combout\,
	datab => \ps2|ll|data\(10),
	datac => \ps2|ll|state.idle~0_combout\,
	combout => \ps2|ll|Selector21~3_combout\);

-- Location: LCCOMB_X61_Y38_N16
\ps2|ll|process_0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|process_0~6_combout\ = (!\ps2|ll|ps2_clk_0~q\ & \ps2|ll|ps2_dat_0~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ps2|ll|ps2_clk_0~q\,
	datad => \ps2|ll|ps2_dat_0~q\,
	combout => \ps2|ll|process_0~6_combout\);

-- Location: LCCOMB_X61_Y38_N26
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

-- Location: LCCOMB_X60_Y38_N2
\ps2|ll|rxd_valid~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|rxd_valid~0_combout\ = (\ps2|ll|process_0~5_combout\ & (\ps2|ll|state.receiving~q\ & ((!\ps2|ll|Equal3~0_combout\) # (!\ps2|ll|Equal3~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Equal3~4_combout\,
	datab => \ps2|ll|Equal3~0_combout\,
	datac => \ps2|ll|process_0~5_combout\,
	datad => \ps2|ll|state.receiving~q\,
	combout => \ps2|ll|rxd_valid~0_combout\);

-- Location: LCCOMB_X61_Y38_N8
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

-- Location: FF_X61_Y38_N9
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

-- Location: LCCOMB_X62_Y38_N24
\ps2|ll|Selector25~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector25~0_combout\ = (\ps2|ll|data\(7)) # (!\ps2|ll|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|state.idle~q\,
	datac => \ps2|ll|data\(7),
	combout => \ps2|ll|Selector25~0_combout\);

-- Location: LCCOMB_X61_Y38_N4
\ps2|ll|data[2]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|data[2]~3_combout\ = (\ps2|ll|Equal1~0_combout\ & ((!\ps2|ll|Selector21~1_combout\) # (!\ps2|ll|data[6]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|data[6]~2_combout\,
	datac => \ps2|ll|Selector21~1_combout\,
	datad => \ps2|ll|Equal1~0_combout\,
	combout => \ps2|ll|data[2]~3_combout\);

-- Location: FF_X62_Y38_N25
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

-- Location: LCCOMB_X62_Y38_N10
\ps2|ll|process_0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|process_0~1_combout\ = \ps2|ll|data\(10) $ (\ps2|ll|data\(8) $ (\ps2|ll|data\(7) $ (\ps2|ll|data\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|data\(10),
	datab => \ps2|ll|data\(8),
	datac => \ps2|ll|data\(7),
	datad => \ps2|ll|data\(6),
	combout => \ps2|ll|process_0~1_combout\);

-- Location: LCCOMB_X66_Y38_N28
\ps2|Selector56~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector56~0_combout\ = (\ps2|state.keyboard_wait_for_change~q\) # (\ps2|state.periodic_reset~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ps2|state.keyboard_wait_for_change~q\,
	datad => \ps2|state.periodic_reset~q\,
	combout => \ps2|Selector56~0_combout\);

-- Location: LCCOMB_X62_Y38_N26
\ps2|ll|Selector26~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector26~0_combout\ = (\ps2|ll|state.idle~q\ & ((\ps2|ll|data\(6)))) # (!\ps2|ll|state.idle~q\ & (\ps2|txd_data\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|txd_data\(4),
	datab => \ps2|ll|state.idle~q\,
	datad => \ps2|ll|data\(6),
	combout => \ps2|ll|Selector26~0_combout\);

-- Location: FF_X62_Y38_N27
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

-- Location: LCCOMB_X60_Y37_N0
\ps2|ll|rxd_data[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|rxd_data[1]~1_combout\ = (\ps2|ll|Equal1~0_combout\ & (\ps2|ll|rxd_data[1]~0_combout\ & (!\ps2|ll|Equal3~3_combout\ & \ps2|ll|state.receiving~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Equal1~0_combout\,
	datab => \ps2|ll|rxd_data[1]~0_combout\,
	datac => \ps2|ll|Equal3~3_combout\,
	datad => \ps2|ll|state.receiving~q\,
	combout => \ps2|ll|rxd_data[1]~1_combout\);

-- Location: FF_X63_Y38_N25
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

-- Location: LCCOMB_X67_Y38_N2
\ps2|Selector6~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector6~14_combout\ = (\ps2|ll|rxd_data\(3) & (\ps2|ll|rxd_valid~q\ & \ps2|state.wait_for_first_mouse_byte~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|rxd_data\(3),
	datac => \ps2|ll|rxd_valid~q\,
	datad => \ps2|state.wait_for_first_mouse_byte~q\,
	combout => \ps2|Selector6~14_combout\);

-- Location: LCCOMB_X68_Y38_N16
\ps2|state~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~49_combout\ = (!\ps2|Selector6~14_combout\ & (\ps2|state.restart~9_combout\ & !\ps2|Equal2~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Selector6~14_combout\,
	datac => \ps2|state.restart~9_combout\,
	datad => \ps2|Equal2~8_combout\,
	combout => \ps2|state~49_combout\);

-- Location: LCCOMB_X68_Y38_N10
\ps2|state~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~50_combout\ = (!\ps2|Selector6~14_combout\ & (\ps2|state.restart~9_combout\ & !\ps2|Selector6~13_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Selector6~14_combout\,
	datac => \ps2|state.restart~9_combout\,
	datad => \ps2|Selector6~13_combout\,
	combout => \ps2|state~50_combout\);

-- Location: LCCOMB_X68_Y38_N26
\ps2|state~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~51_combout\ = (\ps2|Selector6~11_combout\ & ((\ps2|state~49_combout\) # ((\ps2|state.enable_mouse~q\ & \ps2|state~50_combout\)))) # (!\ps2|Selector6~11_combout\ & (((\ps2|state.enable_mouse~q\ & \ps2|state~50_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Selector6~11_combout\,
	datab => \ps2|state~49_combout\,
	datac => \ps2|state.enable_mouse~q\,
	datad => \ps2|state~50_combout\,
	combout => \ps2|state~51_combout\);

-- Location: FF_X68_Y38_N27
\ps2|state.enable_mouse\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|state~51_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|state.enable_mouse~q\);

-- Location: LCCOMB_X66_Y38_N30
\ps2|Selector53~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector53~0_combout\ = (\ps2|Selector56~0_combout\) # ((\ps2|Equal2~8_combout\) # ((!\ps2|state.enable_keyboard~q\ & !\ps2|state.enable_mouse~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Selector56~0_combout\,
	datab => \ps2|state.enable_keyboard~q\,
	datac => \ps2|state.enable_mouse~q\,
	datad => \ps2|Equal2~8_combout\,
	combout => \ps2|Selector53~0_combout\);

-- Location: LCCOMB_X68_Y38_N2
\ps2|state~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~38_combout\ = (\ps2|Equal2~9_combout\ & (\ps2|state.periodic_reset~q\ & \ps2|Equal2~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Equal2~9_combout\,
	datac => \ps2|state.periodic_reset~q\,
	datad => \ps2|Equal2~4_combout\,
	combout => \ps2|state~38_combout\);

-- Location: LCCOMB_X66_Y38_N0
\ps2|Selector53~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector53~1_combout\ = (\ps2|state~38_combout\) # ((\ps2|Selector53~0_combout\ & \ps2|txd_data\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Selector53~0_combout\,
	datac => \ps2|txd_data\(3),
	datad => \ps2|state~38_combout\,
	combout => \ps2|Selector53~1_combout\);

-- Location: FF_X66_Y38_N1
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

-- Location: LCCOMB_X62_Y38_N16
\ps2|ll|Selector27~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector27~0_combout\ = (\ps2|ll|state.idle~q\ & ((\ps2|ll|data\(5)))) # (!\ps2|ll|state.idle~q\ & (\ps2|txd_data\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|txd_data\(3),
	datab => \ps2|ll|state.idle~q\,
	datac => \ps2|ll|data\(5),
	combout => \ps2|ll|Selector27~0_combout\);

-- Location: FF_X62_Y38_N17
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

-- Location: LCCOMB_X62_Y38_N14
\ps2|ll|Selector28~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector28~0_combout\ = (\ps2|ll|data\(4)) # (!\ps2|ll|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|state.idle~q\,
	datad => \ps2|ll|data\(4),
	combout => \ps2|ll|Selector28~0_combout\);

-- Location: FF_X62_Y38_N15
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

-- Location: FF_X66_Y38_N17
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
	ena => \ps2|txd_data[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|txd_data\(1));

-- Location: LCCOMB_X62_Y38_N12
\ps2|ll|Selector29~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector29~0_combout\ = (\ps2|ll|state.idle~q\ & (\ps2|ll|data\(3))) # (!\ps2|ll|state.idle~q\ & ((\ps2|txd_data\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|data\(3),
	datac => \ps2|txd_data\(1),
	datad => \ps2|ll|state.idle~q\,
	combout => \ps2|ll|Selector29~0_combout\);

-- Location: FF_X62_Y38_N13
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

-- Location: LCCOMB_X62_Y38_N28
\ps2|ll|process_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|process_0~0_combout\ = \ps2|ll|data\(2) $ (\ps2|ll|data\(4) $ (\ps2|ll|data\(3) $ (\ps2|ll|data\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|data\(2),
	datab => \ps2|ll|data\(4),
	datac => \ps2|ll|data\(3),
	datad => \ps2|ll|data\(5),
	combout => \ps2|ll|process_0~0_combout\);

-- Location: LCCOMB_X62_Y38_N4
\ps2|ll|process_0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|process_0~2_combout\ = \ps2|ll|process_0~1_combout\ $ (\ps2|ll|process_0~0_combout\ $ (\ps2|ll|data\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|process_0~1_combout\,
	datab => \ps2|ll|process_0~0_combout\,
	datad => \ps2|ll|data\(9),
	combout => \ps2|ll|process_0~2_combout\);

-- Location: LCCOMB_X61_Y38_N18
\ps2|ll|process_0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|process_0~3_combout\ = (\ps2|ll|n_bits\(3) & (!\ps2|ll|n_bits\(2) & (!\ps2|ll|ps2_dat_1~q\ & \ps2|ll|n_bits\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|n_bits\(3),
	datab => \ps2|ll|n_bits\(2),
	datac => \ps2|ll|ps2_dat_1~q\,
	datad => \ps2|ll|n_bits\(1),
	combout => \ps2|ll|process_0~3_combout\);

-- Location: LCCOMB_X66_Y38_N18
\ps2|txd_data[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|txd_data[0]~feeder_combout\ = \ps2|Selector56~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ps2|Selector56~0_combout\,
	combout => \ps2|txd_data[0]~feeder_combout\);

-- Location: FF_X66_Y38_N19
\ps2|txd_data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|txd_data[0]~feeder_combout\,
	ena => \ps2|txd_data[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|txd_data\(0));

-- Location: LCCOMB_X62_Y38_N6
\ps2|ll|Selector30~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector30~0_combout\ = (\ps2|ll|state.idle~q\ & (\ps2|ll|data\(2))) # (!\ps2|ll|state.idle~q\ & ((\ps2|txd_data\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|data\(2),
	datab => \ps2|ll|state.idle~q\,
	datad => \ps2|txd_data\(0),
	combout => \ps2|ll|Selector30~0_combout\);

-- Location: FF_X62_Y38_N7
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

-- Location: LCCOMB_X60_Y38_N6
\ps2|ll|process_0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|process_0~4_combout\ = (\ps2|ll|process_0~2_combout\ & (\ps2|ll|process_0~3_combout\ & (!\ps2|ll|n_bits\(0) & !\ps2|ll|data\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|process_0~2_combout\,
	datab => \ps2|ll|process_0~3_combout\,
	datac => \ps2|ll|n_bits\(0),
	datad => \ps2|ll|data\(1),
	combout => \ps2|ll|process_0~4_combout\);

-- Location: LCCOMB_X60_Y38_N0
\ps2|ll|rxd_valid~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|rxd_valid~1_combout\ = (\ps2|ll|process_0~4_combout\ & (\ps2|ll|rxd_valid~0_combout\ & \ps2|ll|Equal1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|process_0~4_combout\,
	datab => \ps2|ll|rxd_valid~0_combout\,
	datac => \ps2|ll|Equal1~0_combout\,
	combout => \ps2|ll|rxd_valid~1_combout\);

-- Location: FF_X60_Y38_N1
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

-- Location: FF_X63_Y38_N29
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

-- Location: FF_X63_Y38_N11
\ps2|ll|rxd_data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \ps2|ll|data\(4),
	sload => VCC,
	ena => \ps2|ll|rxd_data[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|rxd_data\(2));

-- Location: LCCOMB_X63_Y38_N4
\ps2|ll|rxd_data[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|rxd_data[6]~feeder_combout\ = \ps2|ll|data\(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ps2|ll|data\(8),
	combout => \ps2|ll|rxd_data[6]~feeder_combout\);

-- Location: FF_X63_Y38_N5
\ps2|ll|rxd_data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|rxd_data[6]~feeder_combout\,
	ena => \ps2|ll|rxd_data[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|rxd_data\(6));

-- Location: LCCOMB_X63_Y38_N18
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

-- Location: FF_X63_Y38_N19
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

-- Location: LCCOMB_X63_Y38_N8
\ps2|process_0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|process_0~3_combout\ = (!\ps2|ll|rxd_data\(0) & (!\ps2|ll|rxd_data\(2) & (!\ps2|ll|rxd_data\(6) & !\ps2|ll|rxd_data\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|rxd_data\(0),
	datab => \ps2|ll|rxd_data\(2),
	datac => \ps2|ll|rxd_data\(6),
	datad => \ps2|ll|rxd_data\(4),
	combout => \ps2|process_0~3_combout\);

-- Location: LCCOMB_X63_Y38_N16
\ps2|ll|rxd_data[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|rxd_data[7]~feeder_combout\ = \ps2|ll|data\(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ps2|ll|data\(9),
	combout => \ps2|ll|rxd_data[7]~feeder_combout\);

-- Location: FF_X63_Y38_N17
\ps2|ll|rxd_data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|rxd_data[7]~feeder_combout\,
	ena => \ps2|ll|rxd_data[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|rxd_data\(7));

-- Location: FF_X63_Y38_N23
\ps2|ll|rxd_data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \ps2|ll|data\(3),
	sload => VCC,
	ena => \ps2|ll|rxd_data[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|rxd_data\(1));

-- Location: LCCOMB_X63_Y38_N26
\ps2|process_0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|process_0~4_combout\ = (!\ps2|ll|rxd_data\(5) & (!\ps2|ll|rxd_data\(3) & (!\ps2|ll|rxd_data\(7) & !\ps2|ll|rxd_data\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|rxd_data\(5),
	datab => \ps2|ll|rxd_data\(3),
	datac => \ps2|ll|rxd_data\(7),
	datad => \ps2|ll|rxd_data\(1),
	combout => \ps2|process_0~4_combout\);

-- Location: LCCOMB_X63_Y38_N14
\ps2|process_0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|process_0~5_combout\ = (\ps2|ll|rxd_valid~q\ & (\ps2|process_0~3_combout\ & \ps2|process_0~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|rxd_valid~q\,
	datab => \ps2|process_0~3_combout\,
	datac => \ps2|process_0~4_combout\,
	combout => \ps2|process_0~5_combout\);

-- Location: LCCOMB_X63_Y38_N28
\ps2|process_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|process_0~0_combout\ = (\ps2|ll|rxd_valid~q\ & (\ps2|ll|rxd_data\(3) & (!\ps2|ll|rxd_data\(0) & !\ps2|ll|rxd_data\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|rxd_valid~q\,
	datab => \ps2|ll|rxd_data\(3),
	datac => \ps2|ll|rxd_data\(0),
	datad => \ps2|ll|rxd_data\(2),
	combout => \ps2|process_0~0_combout\);

-- Location: LCCOMB_X63_Y38_N0
\ps2|process_0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|process_0~6_combout\ = (\ps2|process_0~1_combout\ & (\ps2|process_0~0_combout\ & (!\ps2|ll|rxd_data\(6) & !\ps2|ll|rxd_data\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|process_0~1_combout\,
	datab => \ps2|process_0~0_combout\,
	datac => \ps2|ll|rxd_data\(6),
	datad => \ps2|ll|rxd_data\(4),
	combout => \ps2|process_0~6_combout\);

-- Location: LCCOMB_X68_Y38_N0
\ps2|Selector6~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector6~12_combout\ = (\ps2|state.wait_for_bat~q\ & ((\ps2|process_0~6_combout\) # ((\ps2|Equal2~9_combout\ & \ps2|Equal2~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Equal2~9_combout\,
	datab => \ps2|state.wait_for_bat~q\,
	datac => \ps2|process_0~6_combout\,
	datad => \ps2|Equal2~4_combout\,
	combout => \ps2|Selector6~12_combout\);

-- Location: LCCOMB_X68_Y38_N28
\ps2|state~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~56_combout\ = (\ps2|state~50_combout\ & ((\ps2|state.wait_for_mouse_bat~q\) # ((\ps2|state~49_combout\ & \ps2|Selector6~12_combout\)))) # (!\ps2|state~50_combout\ & (\ps2|state~49_combout\ & ((\ps2|Selector6~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state~50_combout\,
	datab => \ps2|state~49_combout\,
	datac => \ps2|state.wait_for_mouse_bat~q\,
	datad => \ps2|Selector6~12_combout\,
	combout => \ps2|state~56_combout\);

-- Location: FF_X68_Y38_N29
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

-- Location: LCCOMB_X66_Y38_N6
\ps2|time_out_counter[3]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[3]~2_combout\ = (!\ps2|state.wait_for_reset_acknowledge~q\ & ((\ps2|state.wait_for_mouse_bat~q\ & (\ps2|process_0~5_combout\)) # (!\ps2|state.wait_for_mouse_bat~q\ & ((\ps2|ll|txd_accepted~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.wait_for_reset_acknowledge~q\,
	datab => \ps2|process_0~5_combout\,
	datac => \ps2|ll|txd_accepted~q\,
	datad => \ps2|state.wait_for_mouse_bat~q\,
	combout => \ps2|time_out_counter[3]~2_combout\);

-- Location: LCCOMB_X66_Y38_N8
\ps2|time_out_counter[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[3]~3_combout\ = (\ps2|time_out_counter[3]~2_combout\) # ((\ps2|state.wait_for_reset_acknowledge~q\ & \ps2|process_0~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[3]~2_combout\,
	datab => \ps2|state.wait_for_reset_acknowledge~q\,
	datac => \ps2|process_0~2_combout\,
	combout => \ps2|time_out_counter[3]~3_combout\);

-- Location: LCCOMB_X65_Y38_N30
\ps2|time_out_counter[3]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[3]~1_combout\ = (!\ps2|Selector6~14_combout\ & ((\ps2|state.wait_for_first_mouse_byte~q\) # ((!\ps2|state.wait_for_bat~q\) # (!\ps2|process_0~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.wait_for_first_mouse_byte~q\,
	datab => \ps2|process_0~6_combout\,
	datac => \ps2|Selector6~14_combout\,
	datad => \ps2|state.wait_for_bat~q\,
	combout => \ps2|time_out_counter[3]~1_combout\);

-- Location: LCCOMB_X67_Y38_N22
\ps2|Selector6~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector6~4_combout\ = (!\ps2|state.wait_for_first_mouse_byte~q\ & (!\ps2|state.periodic_reset~q\ & (!\ps2|state.wait_for_mouse_bat~q\ & \ps2|state.restart~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.wait_for_first_mouse_byte~q\,
	datab => \ps2|state.periodic_reset~q\,
	datac => \ps2|state.wait_for_mouse_bat~q\,
	datad => \ps2|state.restart~q\,
	combout => \ps2|Selector6~4_combout\);

-- Location: LCCOMB_X67_Y38_N8
\ps2|Selector6~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector6~5_combout\ = (!\ps2|state.wait_for_bat~q\ & (\ps2|Selector6~4_combout\ & !\ps2|state.keyboard_wait_for_change~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.wait_for_bat~q\,
	datac => \ps2|Selector6~4_combout\,
	datad => \ps2|state.keyboard_wait_for_change~q\,
	combout => \ps2|Selector6~5_combout\);

-- Location: LCCOMB_X68_Y38_N12
\ps2|state~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~39_combout\ = (\ps2|Selector6~12_combout\) # ((\ps2|Selector6~5_combout\ & \ps2|state.restart~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Selector6~5_combout\,
	datab => \ps2|Selector6~12_combout\,
	datad => \ps2|state.restart~q\,
	combout => \ps2|state~39_combout\);

-- Location: LCCOMB_X68_Y38_N14
\ps2|state~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~40_combout\ = (!\ps2|Selector6~14_combout\ & (!\ps2|state.wait_for_mouse_bat~q\ & (\ps2|Equal2~9_combout\ & \ps2|Equal2~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Selector6~14_combout\,
	datab => \ps2|state.wait_for_mouse_bat~q\,
	datac => \ps2|Equal2~9_combout\,
	datad => \ps2|Equal2~4_combout\,
	combout => \ps2|state~40_combout\);

-- Location: LCCOMB_X68_Y38_N24
\ps2|state~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~41_combout\ = (\ps2|state.restart~9_combout\ & (((!\ps2|Selector6~13_combout\) # (!\ps2|state~40_combout\)) # (!\ps2|state~39_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state~39_combout\,
	datab => \ps2|state~40_combout\,
	datac => \ps2|state.restart~9_combout\,
	datad => \ps2|Selector6~13_combout\,
	combout => \ps2|state~41_combout\);

-- Location: FF_X68_Y38_N25
\ps2|state.restart\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|state~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|state.restart~q\);

-- Location: LCCOMB_X68_Y38_N30
\ps2|time_out_counter[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[3]~0_combout\ = (\ps2|state.restart~q\ & (!\ps2|Selector6~15_combout\ & ((!\ps2|Equal2~8_combout\) # (!\ps2|state.wait_for_mouse_bat~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.restart~q\,
	datab => \ps2|state.wait_for_mouse_bat~q\,
	datac => \ps2|Selector6~15_combout\,
	datad => \ps2|Equal2~8_combout\,
	combout => \ps2|time_out_counter[3]~0_combout\);

-- Location: LCCOMB_X70_Y37_N24
\ps2|time_out_counter[3]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[3]~5_combout\ = (\ps2|time_out_counter[3]~1_combout\ & (\ps2|time_out_counter[3]~0_combout\ & ((!\ps2|time_out_counter[3]~4_combout\) # (!\ps2|time_out_counter[3]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[3]~3_combout\,
	datab => \ps2|time_out_counter[3]~4_combout\,
	datac => \ps2|time_out_counter[3]~1_combout\,
	datad => \ps2|time_out_counter[3]~0_combout\,
	combout => \ps2|time_out_counter[3]~5_combout\);

-- Location: LCCOMB_X69_Y38_N4
\ps2|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~0_combout\ = \ps2|time_out_counter\(0) $ (VCC)
-- \ps2|Add0~1\ = CARRY(\ps2|time_out_counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|time_out_counter\(0),
	datad => VCC,
	combout => \ps2|Add0~0_combout\,
	cout => \ps2|Add0~1\);

-- Location: LCCOMB_X70_Y38_N0
\ps2|time_out_counter[0]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[0]~9_combout\ = (!\ps2|time_out_counter[3]~8_combout\ & (\ps2|Add0~0_combout\ & \ps2|time_out_counter[3]~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[3]~8_combout\,
	datab => \ps2|Add0~0_combout\,
	datac => \ps2|time_out_counter[3]~5_combout\,
	combout => \ps2|time_out_counter[0]~9_combout\);

-- Location: FF_X70_Y38_N1
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

-- Location: LCCOMB_X69_Y38_N6
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

-- Location: LCCOMB_X70_Y38_N2
\ps2|time_out_counter[1]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[1]~10_combout\ = (!\ps2|time_out_counter[3]~8_combout\ & (\ps2|Add0~2_combout\ & \ps2|time_out_counter[3]~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[3]~8_combout\,
	datab => \ps2|Add0~2_combout\,
	datac => \ps2|time_out_counter[3]~5_combout\,
	combout => \ps2|time_out_counter[1]~10_combout\);

-- Location: FF_X70_Y38_N3
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

-- Location: LCCOMB_X69_Y38_N8
\ps2|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~4_combout\ = (\ps2|time_out_counter\(2) & ((GND) # (!\ps2|Add0~3\))) # (!\ps2|time_out_counter\(2) & (\ps2|Add0~3\ $ (GND)))
-- \ps2|Add0~5\ = CARRY((\ps2|time_out_counter\(2)) # (!\ps2|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter\(2),
	datad => VCC,
	cin => \ps2|Add0~3\,
	combout => \ps2|Add0~4_combout\,
	cout => \ps2|Add0~5\);

-- Location: LCCOMB_X70_Y38_N20
\ps2|time_out_counter[2]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[2]~11_combout\ = (!\ps2|time_out_counter[3]~8_combout\ & (\ps2|time_out_counter[3]~5_combout\ & \ps2|Add0~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[3]~8_combout\,
	datac => \ps2|time_out_counter[3]~5_combout\,
	datad => \ps2|Add0~4_combout\,
	combout => \ps2|time_out_counter[2]~11_combout\);

-- Location: FF_X70_Y38_N21
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

-- Location: LCCOMB_X69_Y38_N10
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

-- Location: LCCOMB_X70_Y38_N22
\ps2|time_out_counter[3]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[3]~12_combout\ = (!\ps2|time_out_counter[3]~8_combout\ & (\ps2|time_out_counter[3]~5_combout\ & \ps2|Add0~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[3]~8_combout\,
	datac => \ps2|time_out_counter[3]~5_combout\,
	datad => \ps2|Add0~6_combout\,
	combout => \ps2|time_out_counter[3]~12_combout\);

-- Location: FF_X70_Y38_N23
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

-- Location: LCCOMB_X69_Y38_N12
\ps2|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~8_combout\ = (\ps2|time_out_counter\(4) & ((GND) # (!\ps2|Add0~7\))) # (!\ps2|time_out_counter\(4) & (\ps2|Add0~7\ $ (GND)))
-- \ps2|Add0~9\ = CARRY((\ps2|time_out_counter\(4)) # (!\ps2|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter\(4),
	datad => VCC,
	cin => \ps2|Add0~7\,
	combout => \ps2|Add0~8_combout\,
	cout => \ps2|Add0~9\);

-- Location: LCCOMB_X70_Y37_N10
\ps2|time_out_counter[4]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[4]~14_combout\ = (!\ps2|time_out_counter[3]~8_combout\ & (\ps2|Add0~8_combout\ & \ps2|time_out_counter[3]~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[3]~8_combout\,
	datac => \ps2|Add0~8_combout\,
	datad => \ps2|time_out_counter[3]~5_combout\,
	combout => \ps2|time_out_counter[4]~14_combout\);

-- Location: FF_X70_Y37_N11
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

-- Location: LCCOMB_X69_Y38_N14
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

-- Location: LCCOMB_X69_Y38_N0
\ps2|time_out_counter[5]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[5]~15_combout\ = (\ps2|Add0~10_combout\ & (\ps2|time_out_counter[3]~5_combout\ & !\ps2|time_out_counter[3]~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|Add0~10_combout\,
	datac => \ps2|time_out_counter[3]~5_combout\,
	datad => \ps2|time_out_counter[3]~8_combout\,
	combout => \ps2|time_out_counter[5]~15_combout\);

-- Location: FF_X69_Y38_N1
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

-- Location: LCCOMB_X69_Y38_N16
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

-- Location: LCCOMB_X70_Y37_N2
\ps2|Selector42~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector42~0_combout\ = (\ps2|time_out_counter[3]~1_combout\) # (((\ps2|time_out_counter[3]~3_combout\ & \ps2|time_out_counter[3]~4_combout\)) # (!\ps2|time_out_counter[3]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[3]~3_combout\,
	datab => \ps2|time_out_counter[3]~4_combout\,
	datac => \ps2|time_out_counter[3]~1_combout\,
	datad => \ps2|time_out_counter[3]~0_combout\,
	combout => \ps2|Selector42~0_combout\);

-- Location: LCCOMB_X70_Y38_N18
\ps2|time_out_counter[6]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[6]~16_combout\ = (!\ps2|time_out_counter[3]~8_combout\ & (((\ps2|Add0~12_combout\ & \ps2|time_out_counter[3]~5_combout\)) # (!\ps2|Selector42~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[3]~8_combout\,
	datab => \ps2|Add0~12_combout\,
	datac => \ps2|time_out_counter[3]~5_combout\,
	datad => \ps2|Selector42~0_combout\,
	combout => \ps2|time_out_counter[6]~16_combout\);

-- Location: FF_X70_Y38_N19
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

-- Location: LCCOMB_X69_Y38_N18
\ps2|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~14_combout\ = (\ps2|time_out_counter\(7) & (!\ps2|Add0~13\)) # (!\ps2|time_out_counter\(7) & (\ps2|Add0~13\ & VCC))
-- \ps2|Add0~15\ = CARRY((\ps2|time_out_counter\(7) & !\ps2|Add0~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter\(7),
	datad => VCC,
	cin => \ps2|Add0~13\,
	combout => \ps2|Add0~14_combout\,
	cout => \ps2|Add0~15\);

-- Location: LCCOMB_X70_Y37_N0
\ps2|time_out_counter[7]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[7]~13_combout\ = (\ps2|time_out_counter[3]~8_combout\) # (((!\ps2|Add0~14_combout\ & \ps2|time_out_counter[3]~5_combout\)) # (!\ps2|Selector42~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Add0~14_combout\,
	datab => \ps2|time_out_counter[3]~5_combout\,
	datac => \ps2|time_out_counter[3]~8_combout\,
	datad => \ps2|Selector42~0_combout\,
	combout => \ps2|time_out_counter[7]~13_combout\);

-- Location: FF_X70_Y37_N1
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

-- Location: LCCOMB_X69_Y38_N2
\ps2|Equal2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Equal2~1_combout\ = (!\ps2|time_out_counter\(4) & (!\ps2|time_out_counter\(5) & (\ps2|time_out_counter\(7) & !\ps2|time_out_counter\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter\(4),
	datab => \ps2|time_out_counter\(5),
	datac => \ps2|time_out_counter\(7),
	datad => \ps2|time_out_counter\(6),
	combout => \ps2|Equal2~1_combout\);

-- Location: LCCOMB_X69_Y38_N20
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

-- Location: LCCOMB_X70_Y38_N12
\ps2|time_out_counter[8]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[8]~17_combout\ = (!\ps2|time_out_counter[3]~8_combout\ & (((\ps2|time_out_counter[3]~5_combout\ & \ps2|Add0~16_combout\)) # (!\ps2|Selector42~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[3]~5_combout\,
	datab => \ps2|Add0~16_combout\,
	datac => \ps2|time_out_counter[3]~8_combout\,
	datad => \ps2|Selector42~0_combout\,
	combout => \ps2|time_out_counter[8]~17_combout\);

-- Location: FF_X70_Y38_N13
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

-- Location: LCCOMB_X69_Y38_N22
\ps2|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~18_combout\ = (\ps2|time_out_counter\(9) & (\ps2|Add0~17\ & VCC)) # (!\ps2|time_out_counter\(9) & (!\ps2|Add0~17\))
-- \ps2|Add0~19\ = CARRY((!\ps2|time_out_counter\(9) & !\ps2|Add0~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|time_out_counter\(9),
	datad => VCC,
	cin => \ps2|Add0~17\,
	combout => \ps2|Add0~18_combout\,
	cout => \ps2|Add0~19\);

-- Location: LCCOMB_X70_Y38_N14
\ps2|time_out_counter[9]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[9]~18_combout\ = (!\ps2|time_out_counter[3]~8_combout\ & (((\ps2|time_out_counter[3]~5_combout\ & \ps2|Add0~18_combout\)) # (!\ps2|Selector42~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[3]~5_combout\,
	datab => \ps2|Add0~18_combout\,
	datac => \ps2|time_out_counter[3]~8_combout\,
	datad => \ps2|Selector42~0_combout\,
	combout => \ps2|time_out_counter[9]~18_combout\);

-- Location: FF_X70_Y38_N15
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

-- Location: LCCOMB_X69_Y38_N24
\ps2|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~20_combout\ = (\ps2|time_out_counter\(10) & ((GND) # (!\ps2|Add0~19\))) # (!\ps2|time_out_counter\(10) & (\ps2|Add0~19\ $ (GND)))
-- \ps2|Add0~21\ = CARRY((\ps2|time_out_counter\(10)) # (!\ps2|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|time_out_counter\(10),
	datad => VCC,
	cin => \ps2|Add0~19\,
	combout => \ps2|Add0~20_combout\,
	cout => \ps2|Add0~21\);

-- Location: LCCOMB_X70_Y38_N8
\ps2|time_out_counter[10]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[10]~19_combout\ = (\ps2|time_out_counter[3]~5_combout\ & (\ps2|Add0~20_combout\ & !\ps2|time_out_counter[3]~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[3]~5_combout\,
	datab => \ps2|Add0~20_combout\,
	datac => \ps2|time_out_counter[3]~8_combout\,
	combout => \ps2|time_out_counter[10]~19_combout\);

-- Location: FF_X70_Y38_N9
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

-- Location: LCCOMB_X69_Y38_N26
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

-- Location: LCCOMB_X70_Y38_N10
\ps2|time_out_counter[11]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[11]~20_combout\ = (!\ps2|time_out_counter[3]~8_combout\ & (((\ps2|Add0~22_combout\ & \ps2|time_out_counter[3]~5_combout\)) # (!\ps2|Selector42~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[3]~8_combout\,
	datab => \ps2|Add0~22_combout\,
	datac => \ps2|time_out_counter[3]~5_combout\,
	datad => \ps2|Selector42~0_combout\,
	combout => \ps2|time_out_counter[11]~20_combout\);

-- Location: FF_X70_Y38_N11
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

-- Location: LCCOMB_X70_Y38_N28
\ps2|Equal2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Equal2~2_combout\ = (!\ps2|time_out_counter\(11) & (!\ps2|time_out_counter\(9) & (!\ps2|time_out_counter\(10) & !\ps2|time_out_counter\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter\(11),
	datab => \ps2|time_out_counter\(9),
	datac => \ps2|time_out_counter\(10),
	datad => \ps2|time_out_counter\(8),
	combout => \ps2|Equal2~2_combout\);

-- Location: LCCOMB_X69_Y38_N28
\ps2|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~24_combout\ = (\ps2|time_out_counter\(12) & (\ps2|Add0~23\ $ (GND))) # (!\ps2|time_out_counter\(12) & ((GND) # (!\ps2|Add0~23\)))
-- \ps2|Add0~25\ = CARRY((!\ps2|Add0~23\) # (!\ps2|time_out_counter\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter\(12),
	datad => VCC,
	cin => \ps2|Add0~23\,
	combout => \ps2|Add0~24_combout\,
	cout => \ps2|Add0~25\);

-- Location: LCCOMB_X70_Y38_N30
\ps2|time_out_counter[12]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[12]~21_combout\ = (\ps2|time_out_counter[3]~8_combout\) # (((\ps2|time_out_counter[3]~5_combout\ & !\ps2|Add0~24_combout\)) # (!\ps2|Selector42~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[3]~5_combout\,
	datab => \ps2|Add0~24_combout\,
	datac => \ps2|time_out_counter[3]~8_combout\,
	datad => \ps2|Selector42~0_combout\,
	combout => \ps2|time_out_counter[12]~21_combout\);

-- Location: FF_X70_Y38_N31
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

-- Location: LCCOMB_X69_Y38_N30
\ps2|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~26_combout\ = (\ps2|time_out_counter\(13) & (!\ps2|Add0~25\)) # (!\ps2|time_out_counter\(13) & (\ps2|Add0~25\ & VCC))
-- \ps2|Add0~27\ = CARRY((\ps2|time_out_counter\(13) & !\ps2|Add0~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|time_out_counter\(13),
	datad => VCC,
	cin => \ps2|Add0~25\,
	combout => \ps2|Add0~26_combout\,
	cout => \ps2|Add0~27\);

-- Location: LCCOMB_X70_Y38_N16
\ps2|time_out_counter[13]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[13]~22_combout\ = (\ps2|time_out_counter[3]~8_combout\) # (((\ps2|time_out_counter[3]~5_combout\ & !\ps2|Add0~26_combout\)) # (!\ps2|Selector42~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[3]~5_combout\,
	datab => \ps2|Add0~26_combout\,
	datac => \ps2|time_out_counter[3]~8_combout\,
	datad => \ps2|Selector42~0_combout\,
	combout => \ps2|time_out_counter[13]~22_combout\);

-- Location: FF_X70_Y38_N17
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

-- Location: LCCOMB_X69_Y37_N0
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

-- Location: LCCOMB_X70_Y37_N4
\ps2|time_out_counter[14]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[14]~23_combout\ = (\ps2|time_out_counter[3]~8_combout\) # ((!\ps2|Add0~28_combout\ & \ps2|time_out_counter[3]~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[3]~8_combout\,
	datac => \ps2|Add0~28_combout\,
	datad => \ps2|time_out_counter[3]~5_combout\,
	combout => \ps2|time_out_counter[14]~23_combout\);

-- Location: FF_X70_Y37_N5
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

-- Location: LCCOMB_X69_Y37_N2
\ps2|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~30_combout\ = (\ps2|time_out_counter\(15) & (!\ps2|Add0~29\)) # (!\ps2|time_out_counter\(15) & (\ps2|Add0~29\ & VCC))
-- \ps2|Add0~31\ = CARRY((\ps2|time_out_counter\(15) & !\ps2|Add0~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|time_out_counter\(15),
	datad => VCC,
	cin => \ps2|Add0~29\,
	combout => \ps2|Add0~30_combout\,
	cout => \ps2|Add0~31\);

-- Location: LCCOMB_X70_Y37_N14
\ps2|time_out_counter[15]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[15]~24_combout\ = (\ps2|time_out_counter[3]~8_combout\) # (((!\ps2|Add0~30_combout\ & \ps2|time_out_counter[3]~5_combout\)) # (!\ps2|Selector42~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Add0~30_combout\,
	datab => \ps2|time_out_counter[3]~5_combout\,
	datac => \ps2|time_out_counter[3]~8_combout\,
	datad => \ps2|Selector42~0_combout\,
	combout => \ps2|time_out_counter[15]~24_combout\);

-- Location: FF_X70_Y37_N15
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

-- Location: LCCOMB_X70_Y38_N26
\ps2|Equal2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Equal2~3_combout\ = (\ps2|time_out_counter\(14) & (\ps2|time_out_counter\(13) & (\ps2|time_out_counter\(12) & \ps2|time_out_counter\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter\(14),
	datab => \ps2|time_out_counter\(13),
	datac => \ps2|time_out_counter\(12),
	datad => \ps2|time_out_counter\(15),
	combout => \ps2|Equal2~3_combout\);

-- Location: LCCOMB_X70_Y38_N24
\ps2|Equal2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Equal2~0_combout\ = (!\ps2|time_out_counter\(1) & (!\ps2|time_out_counter\(2) & (!\ps2|time_out_counter\(3) & !\ps2|time_out_counter\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter\(1),
	datab => \ps2|time_out_counter\(2),
	datac => \ps2|time_out_counter\(3),
	datad => \ps2|time_out_counter\(0),
	combout => \ps2|Equal2~0_combout\);

-- Location: LCCOMB_X70_Y38_N4
\ps2|Equal2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Equal2~4_combout\ = (\ps2|Equal2~1_combout\ & (\ps2|Equal2~2_combout\ & (\ps2|Equal2~3_combout\ & \ps2|Equal2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Equal2~1_combout\,
	datab => \ps2|Equal2~2_combout\,
	datac => \ps2|Equal2~3_combout\,
	datad => \ps2|Equal2~0_combout\,
	combout => \ps2|Equal2~4_combout\);

-- Location: LCCOMB_X66_Y38_N26
\ps2|time_out_counter[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[3]~4_combout\ = (\ps2|Equal2~4_combout\ & ((\ps2|Equal2~9_combout\ & ((\ps2|state.periodic_reset~q\))) # (!\ps2|Equal2~9_combout\ & (\ps2|state.wait_for_mouse_bat~q\)))) # (!\ps2|Equal2~4_combout\ & 
-- (\ps2|state.wait_for_mouse_bat~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Equal2~4_combout\,
	datab => \ps2|state.wait_for_mouse_bat~q\,
	datac => \ps2|Equal2~9_combout\,
	datad => \ps2|state.periodic_reset~q\,
	combout => \ps2|time_out_counter[3]~4_combout\);

-- Location: LCCOMB_X68_Y37_N14
\ps2|time_out_counter[3]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[3]~33_combout\ = (\ps2|time_out_counter[3]~0_combout\ & (((!\ps2|Selector6~15_combout\ & !\ps2|time_out_counter[3]~2_combout\)) # (!\ps2|time_out_counter[3]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Selector6~15_combout\,
	datab => \ps2|time_out_counter[3]~4_combout\,
	datac => \ps2|time_out_counter[3]~2_combout\,
	datad => \ps2|time_out_counter[3]~0_combout\,
	combout => \ps2|time_out_counter[3]~33_combout\);

-- Location: LCCOMB_X69_Y37_N4
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

-- Location: LCCOMB_X70_Y37_N18
\ps2|time_out_counter[16]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[16]~27_combout\ = (!\ps2|time_out_counter[3]~8_combout\ & (\ps2|Add0~32_combout\ & \ps2|time_out_counter[3]~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[3]~8_combout\,
	datac => \ps2|Add0~32_combout\,
	datad => \ps2|time_out_counter[3]~5_combout\,
	combout => \ps2|time_out_counter[16]~27_combout\);

-- Location: FF_X70_Y37_N19
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

-- Location: LCCOMB_X69_Y37_N6
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

-- Location: LCCOMB_X70_Y37_N8
\ps2|time_out_counter[17]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[17]~25_combout\ = (\ps2|time_out_counter[3]~8_combout\) # (((\ps2|time_out_counter[3]~5_combout\ & !\ps2|Add0~34_combout\)) # (!\ps2|Selector42~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[3]~8_combout\,
	datab => \ps2|time_out_counter[3]~5_combout\,
	datac => \ps2|Add0~34_combout\,
	datad => \ps2|Selector42~0_combout\,
	combout => \ps2|time_out_counter[17]~25_combout\);

-- Location: FF_X70_Y37_N9
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

-- Location: LCCOMB_X69_Y37_N8
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

-- Location: LCCOMB_X70_Y37_N20
\ps2|time_out_counter[18]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[18]~28_combout\ = (!\ps2|time_out_counter[3]~8_combout\ & (((\ps2|Add0~36_combout\ & \ps2|time_out_counter[3]~5_combout\)) # (!\ps2|Selector42~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Add0~36_combout\,
	datab => \ps2|time_out_counter[3]~5_combout\,
	datac => \ps2|time_out_counter[3]~8_combout\,
	datad => \ps2|Selector42~0_combout\,
	combout => \ps2|time_out_counter[18]~28_combout\);

-- Location: FF_X70_Y37_N21
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

-- Location: LCCOMB_X69_Y37_N10
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

-- Location: LCCOMB_X69_Y37_N28
\ps2|time_out_counter[19]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[19]~26_combout\ = (\ps2|time_out_counter[3]~8_combout\) # ((!\ps2|Add0~38_combout\ & \ps2|time_out_counter[3]~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Add0~38_combout\,
	datab => \ps2|time_out_counter[3]~8_combout\,
	datad => \ps2|time_out_counter[3]~5_combout\,
	combout => \ps2|time_out_counter[19]~26_combout\);

-- Location: FF_X69_Y37_N29
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

-- Location: LCCOMB_X69_Y37_N12
\ps2|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~40_combout\ = (\ps2|time_out_counter\(20) & (\ps2|Add0~39\ $ (GND))) # (!\ps2|time_out_counter\(20) & ((GND) # (!\ps2|Add0~39\)))
-- \ps2|Add0~41\ = CARRY((!\ps2|Add0~39\) # (!\ps2|time_out_counter\(20)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter\(20),
	datad => VCC,
	cin => \ps2|Add0~39\,
	combout => \ps2|Add0~40_combout\,
	cout => \ps2|Add0~41\);

-- Location: LCCOMB_X70_Y37_N6
\ps2|time_out_counter[20]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[20]~29_combout\ = (\ps2|time_out_counter[3]~8_combout\) # (((!\ps2|Add0~40_combout\ & \ps2|time_out_counter[3]~5_combout\)) # (!\ps2|Selector42~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Add0~40_combout\,
	datab => \ps2|time_out_counter[3]~5_combout\,
	datac => \ps2|time_out_counter[3]~8_combout\,
	datad => \ps2|Selector42~0_combout\,
	combout => \ps2|time_out_counter[20]~29_combout\);

-- Location: FF_X70_Y37_N7
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

-- Location: LCCOMB_X69_Y37_N14
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

-- Location: LCCOMB_X70_Y37_N16
\ps2|time_out_counter[21]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[21]~30_combout\ = (\ps2|time_out_counter[3]~8_combout\) # (((!\ps2|Add0~42_combout\ & \ps2|time_out_counter[3]~5_combout\)) # (!\ps2|Selector42~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Add0~42_combout\,
	datab => \ps2|time_out_counter[3]~5_combout\,
	datac => \ps2|time_out_counter[3]~8_combout\,
	datad => \ps2|Selector42~0_combout\,
	combout => \ps2|time_out_counter[21]~30_combout\);

-- Location: FF_X70_Y37_N17
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

-- Location: LCCOMB_X69_Y37_N16
\ps2|Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~44_combout\ = (\ps2|time_out_counter\(22) & (\ps2|Add0~43\ $ (GND))) # (!\ps2|time_out_counter\(22) & ((GND) # (!\ps2|Add0~43\)))
-- \ps2|Add0~45\ = CARRY((!\ps2|Add0~43\) # (!\ps2|time_out_counter\(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter\(22),
	datad => VCC,
	cin => \ps2|Add0~43\,
	combout => \ps2|Add0~44_combout\,
	cout => \ps2|Add0~45\);

-- Location: LCCOMB_X70_Y37_N26
\ps2|time_out_counter[22]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[22]~31_combout\ = (\ps2|time_out_counter[3]~8_combout\) # ((!\ps2|Add0~44_combout\ & \ps2|time_out_counter[3]~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[3]~8_combout\,
	datac => \ps2|Add0~44_combout\,
	datad => \ps2|time_out_counter[3]~5_combout\,
	combout => \ps2|time_out_counter[22]~31_combout\);

-- Location: FF_X70_Y37_N27
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

-- Location: LCCOMB_X69_Y37_N18
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

-- Location: LCCOMB_X69_Y37_N20
\ps2|Add0~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~48_combout\ = (\ps2|time_out_counter\(24) & ((GND) # (!\ps2|Add0~47\))) # (!\ps2|time_out_counter\(24) & (\ps2|Add0~47\ $ (GND)))
-- \ps2|Add0~49\ = CARRY((\ps2|time_out_counter\(24)) # (!\ps2|Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter\(24),
	datad => VCC,
	cin => \ps2|Add0~47\,
	combout => \ps2|Add0~48_combout\,
	cout => \ps2|Add0~49\);

-- Location: LCCOMB_X68_Y37_N26
\ps2|time_out_counter[24]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[24]~35_combout\ = (!\ps2|time_out_counter[3]~8_combout\ & (\ps2|Add0~48_combout\ & \ps2|time_out_counter[3]~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[3]~8_combout\,
	datac => \ps2|Add0~48_combout\,
	datad => \ps2|time_out_counter[3]~5_combout\,
	combout => \ps2|time_out_counter[24]~35_combout\);

-- Location: FF_X68_Y37_N27
\ps2|time_out_counter[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|time_out_counter[24]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|time_out_counter\(24));

-- Location: LCCOMB_X69_Y37_N22
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

-- Location: LCCOMB_X68_Y37_N16
\ps2|time_out_counter[25]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[25]~34_combout\ = (\ps2|time_out_counter[3]~8_combout\) # ((\ps2|time_out_counter[3]~33_combout\ & ((!\ps2|Add0~50_combout\) # (!\ps2|time_out_counter[3]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[3]~1_combout\,
	datab => \ps2|time_out_counter[3]~33_combout\,
	datac => \ps2|time_out_counter[3]~8_combout\,
	datad => \ps2|Add0~50_combout\,
	combout => \ps2|time_out_counter[25]~34_combout\);

-- Location: FF_X68_Y37_N17
\ps2|time_out_counter[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|time_out_counter[25]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|time_out_counter\(25));

-- Location: LCCOMB_X69_Y37_N24
\ps2|Add0~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Add0~52_combout\ = (\ps2|time_out_counter\(26) & ((GND) # (!\ps2|Add0~51\))) # (!\ps2|time_out_counter\(26) & (\ps2|Add0~51\ $ (GND)))
-- \ps2|Add0~53\ = CARRY((\ps2|time_out_counter\(26)) # (!\ps2|Add0~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|time_out_counter\(26),
	datad => VCC,
	cin => \ps2|Add0~51\,
	combout => \ps2|Add0~52_combout\,
	cout => \ps2|Add0~53\);

-- Location: LCCOMB_X68_Y37_N4
\ps2|time_out_counter[26]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[26]~36_combout\ = (\ps2|time_out_counter[3]~1_combout\ & (\ps2|time_out_counter[3]~33_combout\ & (!\ps2|time_out_counter[3]~8_combout\ & \ps2|Add0~52_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[3]~1_combout\,
	datab => \ps2|time_out_counter[3]~33_combout\,
	datac => \ps2|time_out_counter[3]~8_combout\,
	datad => \ps2|Add0~52_combout\,
	combout => \ps2|time_out_counter[26]~36_combout\);

-- Location: FF_X68_Y37_N5
\ps2|time_out_counter[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|time_out_counter[26]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|time_out_counter\(26));

-- Location: LCCOMB_X69_Y37_N26
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

-- Location: LCCOMB_X68_Y37_N6
\ps2|time_out_counter[27]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[27]~37_combout\ = (!\ps2|time_out_counter[3]~8_combout\ & (\ps2|time_out_counter[3]~33_combout\ & (\ps2|Add0~54_combout\ & \ps2|time_out_counter[3]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[3]~8_combout\,
	datab => \ps2|time_out_counter[3]~33_combout\,
	datac => \ps2|Add0~54_combout\,
	datad => \ps2|time_out_counter[3]~1_combout\,
	combout => \ps2|time_out_counter[27]~37_combout\);

-- Location: FF_X68_Y37_N7
\ps2|time_out_counter[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|time_out_counter[27]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|time_out_counter\(27));

-- Location: LCCOMB_X68_Y37_N24
\ps2|Equal2~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Equal2~7_combout\ = (!\ps2|time_out_counter\(27) & (!\ps2|time_out_counter\(26) & (!\ps2|time_out_counter\(24) & \ps2|time_out_counter\(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter\(27),
	datab => \ps2|time_out_counter\(26),
	datac => \ps2|time_out_counter\(24),
	datad => \ps2|time_out_counter\(25),
	combout => \ps2|Equal2~7_combout\);

-- Location: LCCOMB_X69_Y37_N30
\ps2|Equal2~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Equal2~5_combout\ = (!\ps2|time_out_counter\(18) & (\ps2|time_out_counter\(19) & (\ps2|time_out_counter\(17) & !\ps2|time_out_counter\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter\(18),
	datab => \ps2|time_out_counter\(19),
	datac => \ps2|time_out_counter\(17),
	datad => \ps2|time_out_counter\(16),
	combout => \ps2|Equal2~5_combout\);

-- Location: LCCOMB_X68_Y37_N12
\ps2|Equal2~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Equal2~9_combout\ = (\ps2|Equal2~7_combout\ & (\ps2|Equal2~5_combout\ & \ps2|Equal2~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|Equal2~7_combout\,
	datac => \ps2|Equal2~5_combout\,
	datad => \ps2|Equal2~6_combout\,
	combout => \ps2|Equal2~9_combout\);

-- Location: LCCOMB_X68_Y38_N6
\ps2|Selector6~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector6~11_combout\ = (\ps2|state.wait_for_mouse_bat~q\ & ((\ps2|process_0~5_combout\) # ((\ps2|Equal2~9_combout\ & \ps2|Equal2~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Equal2~9_combout\,
	datab => \ps2|state.wait_for_mouse_bat~q\,
	datac => \ps2|process_0~5_combout\,
	datad => \ps2|Equal2~4_combout\,
	combout => \ps2|Selector6~11_combout\);

-- Location: LCCOMB_X66_Y38_N24
\ps2|state~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~52_combout\ = (\ps2|state.enable_mouse~q\ & \ps2|ll|txd_accepted~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.enable_mouse~q\,
	datac => \ps2|ll|txd_accepted~q\,
	combout => \ps2|state~52_combout\);

-- Location: LCCOMB_X65_Y38_N10
\ps2|state~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~53_combout\ = (\ps2|state~42_combout\ & ((\ps2|state~52_combout\) # ((!\ps2|process_0~2_combout\ & \ps2|state.wait_for_enable_mouse_acknowledge~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state~42_combout\,
	datab => \ps2|process_0~2_combout\,
	datac => \ps2|state.wait_for_enable_mouse_acknowledge~q\,
	datad => \ps2|state~52_combout\,
	combout => \ps2|state~53_combout\);

-- Location: FF_X65_Y38_N11
\ps2|state.wait_for_enable_mouse_acknowledge\ : dffeas
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
	q => \ps2|state.wait_for_enable_mouse_acknowledge~q\);

-- Location: LCCOMB_X65_Y38_N2
\ps2|Selector6~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector6~7_combout\ = (\ps2|process_0~2_combout\ & ((\ps2|state.wait_for_enable_mouse_acknowledge~q\) # ((\ps2|state.wait_for_enable_keyboard_acknowledge~q\) # (\ps2|state.wait_for_reset_acknowledge~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.wait_for_enable_mouse_acknowledge~q\,
	datab => \ps2|state.wait_for_enable_keyboard_acknowledge~q\,
	datac => \ps2|state.wait_for_reset_acknowledge~q\,
	datad => \ps2|process_0~2_combout\,
	combout => \ps2|Selector6~7_combout\);

-- Location: LCCOMB_X65_Y38_N18
\ps2|state~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~47_combout\ = (!\ps2|ll|rxd_valid~q\ & \ps2|state.wait_for_second_mouse_byte~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|rxd_valid~q\,
	datad => \ps2|state.wait_for_second_mouse_byte~q\,
	combout => \ps2|state~47_combout\);

-- Location: LCCOMB_X65_Y38_N0
\ps2|state~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~48_combout\ = (\ps2|state.restart~9_combout\ & ((\ps2|Selector6~14_combout\) # ((\ps2|state~47_combout\ & !\ps2|Equal2~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.restart~9_combout\,
	datab => \ps2|state~47_combout\,
	datac => \ps2|Selector6~14_combout\,
	datad => \ps2|Equal2~8_combout\,
	combout => \ps2|state~48_combout\);

-- Location: FF_X65_Y38_N1
\ps2|state.wait_for_second_mouse_byte\ : dffeas
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
	q => \ps2|state.wait_for_second_mouse_byte~q\);

-- Location: LCCOMB_X65_Y38_N12
\ps2|state~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~43_combout\ = (\ps2|state~42_combout\ & ((\ps2|ll|rxd_valid~q\ & (\ps2|state.wait_for_second_mouse_byte~q\)) # (!\ps2|ll|rxd_valid~q\ & ((\ps2|state.wait_for_third_mouse_byte~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state~42_combout\,
	datab => \ps2|state.wait_for_second_mouse_byte~q\,
	datac => \ps2|state.wait_for_third_mouse_byte~q\,
	datad => \ps2|ll|rxd_valid~q\,
	combout => \ps2|state~43_combout\);

-- Location: FF_X65_Y38_N13
\ps2|state.wait_for_third_mouse_byte\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|state~43_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|state.wait_for_third_mouse_byte~q\);

-- Location: LCCOMB_X66_Y38_N22
\ps2|Selector6~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector6~8_combout\ = (\ps2|ll|txd_accepted~q\ & ((\ps2|state.enable_mouse~q\) # ((\ps2|Selector56~0_combout\) # (\ps2|state.enable_keyboard~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.enable_mouse~q\,
	datab => \ps2|Selector56~0_combout\,
	datac => \ps2|ll|txd_accepted~q\,
	datad => \ps2|state.enable_keyboard~q\,
	combout => \ps2|Selector6~8_combout\);

-- Location: LCCOMB_X65_Y38_N20
\ps2|Selector6~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector6~9_combout\ = (\ps2|Selector6~8_combout\) # ((\ps2|ll|rxd_valid~q\ & ((\ps2|state.wait_for_second_mouse_byte~q\) # (\ps2|state.wait_for_third_mouse_byte~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|rxd_valid~q\,
	datab => \ps2|state.wait_for_second_mouse_byte~q\,
	datac => \ps2|state.wait_for_third_mouse_byte~q\,
	datad => \ps2|Selector6~8_combout\,
	combout => \ps2|Selector6~9_combout\);

-- Location: LCCOMB_X68_Y38_N20
\ps2|Selector6~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector6~10_combout\ = (\ps2|Selector6~5_combout\ & ((\ps2|Selector6~7_combout\) # ((\ps2|Selector6~9_combout\)))) # (!\ps2|Selector6~5_combout\ & (\ps2|state~38_combout\ & ((\ps2|Selector6~7_combout\) # (\ps2|Selector6~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Selector6~5_combout\,
	datab => \ps2|Selector6~7_combout\,
	datac => \ps2|Selector6~9_combout\,
	datad => \ps2|state~38_combout\,
	combout => \ps2|Selector6~10_combout\);

-- Location: LCCOMB_X68_Y38_N8
\ps2|Selector6~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector6~6_combout\ = ((\ps2|Selector6~5_combout\ & (\ps2|Equal2~9_combout\ & \ps2|Equal2~4_combout\))) # (!\ps2|state.restart~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Selector6~5_combout\,
	datab => \ps2|state.restart~q\,
	datac => \ps2|Equal2~9_combout\,
	datad => \ps2|Equal2~4_combout\,
	combout => \ps2|Selector6~6_combout\);

-- Location: LCCOMB_X68_Y38_N18
\ps2|Selector6~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector6~13_combout\ = (\ps2|Selector6~11_combout\) # ((\ps2|Selector6~10_combout\) # ((\ps2|Selector6~6_combout\) # (\ps2|Selector6~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Selector6~11_combout\,
	datab => \ps2|Selector6~10_combout\,
	datac => \ps2|Selector6~6_combout\,
	datad => \ps2|Selector6~12_combout\,
	combout => \ps2|Selector6~13_combout\);

-- Location: LCCOMB_X68_Y38_N4
\ps2|Selector10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Selector10~0_combout\ = (\ps2|Equal2~9_combout\ & (\ps2|state.wait_for_mouse_bat~q\ & \ps2|Equal2~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Equal2~9_combout\,
	datab => \ps2|state.wait_for_mouse_bat~q\,
	datad => \ps2|Equal2~4_combout\,
	combout => \ps2|Selector10~0_combout\);

-- Location: LCCOMB_X67_Y38_N18
\ps2|state~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~57_combout\ = (\ps2|state~62_combout\ & ((\ps2|Selector6~13_combout\ & ((\ps2|Selector10~0_combout\))) # (!\ps2|Selector6~13_combout\ & (\ps2|state.enable_keyboard~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state~62_combout\,
	datab => \ps2|Selector6~13_combout\,
	datac => \ps2|state.enable_keyboard~q\,
	datad => \ps2|Selector10~0_combout\,
	combout => \ps2|state~57_combout\);

-- Location: FF_X67_Y38_N19
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

-- Location: LCCOMB_X66_Y38_N2
\ps2|state~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~54_combout\ = (\ps2|ll|txd_accepted~q\ & \ps2|state.enable_keyboard~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ps2|ll|txd_accepted~q\,
	datad => \ps2|state.enable_keyboard~q\,
	combout => \ps2|state~54_combout\);

-- Location: LCCOMB_X65_Y38_N4
\ps2|state~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~55_combout\ = (\ps2|state~42_combout\ & ((\ps2|state~54_combout\) # ((!\ps2|process_0~2_combout\ & \ps2|state.wait_for_enable_keyboard_acknowledge~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state~42_combout\,
	datab => \ps2|process_0~2_combout\,
	datac => \ps2|state.wait_for_enable_keyboard_acknowledge~q\,
	datad => \ps2|state~54_combout\,
	combout => \ps2|state~55_combout\);

-- Location: FF_X65_Y38_N5
\ps2|state.wait_for_enable_keyboard_acknowledge\ : dffeas
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
	q => \ps2|state.wait_for_enable_keyboard_acknowledge~q\);

-- Location: LCCOMB_X65_Y38_N24
\ps2|state~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~36_combout\ = (\ps2|state.wait_for_enable_keyboard_acknowledge~q\ & \ps2|process_0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|state.wait_for_enable_keyboard_acknowledge~q\,
	datac => \ps2|process_0~2_combout\,
	combout => \ps2|state~36_combout\);

-- Location: LCCOMB_X65_Y38_N16
\ps2|state~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~37_combout\ = (\ps2|state.restart~9_combout\ & ((\ps2|state.keyboard_wait_for_change~q\) # ((\ps2|state~36_combout\ & !\ps2|Equal2~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.restart~9_combout\,
	datab => \ps2|state~36_combout\,
	datac => \ps2|state.keyboard_wait_for_change~q\,
	datad => \ps2|Equal2~8_combout\,
	combout => \ps2|state~37_combout\);

-- Location: FF_X65_Y38_N17
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

-- Location: LCCOMB_X66_Y38_N10
\ps2|txd_data[4]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|txd_data[4]~1_combout\ = (\ps2|txd_data[1]~0_combout\ & (!\ps2|state.keyboard_wait_for_change~q\)) # (!\ps2|txd_data[1]~0_combout\ & ((\ps2|txd_data\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010001110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.keyboard_wait_for_change~q\,
	datab => \ps2|txd_data[1]~0_combout\,
	datac => \ps2|txd_data\(4),
	combout => \ps2|txd_data[4]~1_combout\);

-- Location: FF_X66_Y38_N11
\ps2|txd_data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|txd_data[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|txd_data\(4));

-- Location: LCCOMB_X66_Y38_N16
\ps2|ll|txd_parity~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|txd_parity~0_combout\ = \ps2|txd_data\(4) $ (\ps2|txd_data\(3) $ (\ps2|txd_data\(1) $ (!\ps2|txd_data\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001101001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|txd_data\(4),
	datab => \ps2|txd_data\(3),
	datac => \ps2|txd_data\(1),
	datad => \ps2|txd_data\(0),
	combout => \ps2|ll|txd_parity~0_combout\);

-- Location: LCCOMB_X62_Y38_N0
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

-- Location: FF_X62_Y38_N1
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

-- Location: LCCOMB_X62_Y38_N18
\ps2|ll|Selector23~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector23~0_combout\ = (\ps2|ll|data\(9)) # (!\ps2|ll|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|state.idle~q\,
	datad => \ps2|ll|data\(9),
	combout => \ps2|ll|Selector23~0_combout\);

-- Location: FF_X62_Y38_N19
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

-- Location: LCCOMB_X62_Y38_N22
\ps2|ll|Selector24~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector24~0_combout\ = (\ps2|ll|data\(8)) # (!\ps2|ll|state.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|state.idle~q\,
	datad => \ps2|ll|data\(8),
	combout => \ps2|ll|Selector24~0_combout\);

-- Location: FF_X62_Y38_N23
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

-- Location: LCCOMB_X63_Y38_N30
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

-- Location: FF_X63_Y38_N31
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

-- Location: LCCOMB_X63_Y38_N22
\ps2|process_0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|process_0~1_combout\ = (\ps2|ll|rxd_data\(5) & (\ps2|ll|rxd_data\(1) & \ps2|ll|rxd_data\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|rxd_data\(5),
	datac => \ps2|ll|rxd_data\(1),
	datad => \ps2|ll|rxd_data\(7),
	combout => \ps2|process_0~1_combout\);

-- Location: LCCOMB_X63_Y38_N20
\ps2|process_0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|process_0~2_combout\ = (\ps2|process_0~1_combout\ & (\ps2|process_0~0_combout\ & (\ps2|ll|rxd_data\(6) & \ps2|ll|rxd_data\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|process_0~1_combout\,
	datab => \ps2|process_0~0_combout\,
	datac => \ps2|ll|rxd_data\(6),
	datad => \ps2|ll|rxd_data\(4),
	combout => \ps2|process_0~2_combout\);

-- Location: LCCOMB_X66_Y38_N12
\ps2|state~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~59_combout\ = (!\ps2|process_0~2_combout\ & (\ps2|state.wait_for_reset_acknowledge~q\ & ((!\ps2|Equal2~4_combout\) # (!\ps2|Equal2~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|process_0~2_combout\,
	datab => \ps2|state.wait_for_reset_acknowledge~q\,
	datac => \ps2|Equal2~9_combout\,
	datad => \ps2|Equal2~4_combout\,
	combout => \ps2|state~59_combout\);

-- Location: LCCOMB_X66_Y38_N4
\ps2|state~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~60_combout\ = (\ps2|state.restart~9_combout\ & ((\ps2|state~59_combout\) # ((\ps2|ll|txd_accepted~q\ & \ps2|state~38_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state~59_combout\,
	datab => \ps2|ll|txd_accepted~q\,
	datac => \ps2|state.restart~9_combout\,
	datad => \ps2|state~38_combout\,
	combout => \ps2|state~60_combout\);

-- Location: FF_X66_Y38_N5
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

-- Location: LCCOMB_X63_Y38_N24
\ps2|time_out_counter[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[3]~6_combout\ = (\ps2|state.keyboard_wait_for_change~q\) # ((\ps2|state.wait_for_first_mouse_byte~q\ & ((!\ps2|ll|rxd_data\(3)) # (!\ps2|ll|rxd_valid~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|rxd_valid~q\,
	datab => \ps2|state.wait_for_first_mouse_byte~q\,
	datac => \ps2|ll|rxd_data\(3),
	datad => \ps2|state.keyboard_wait_for_change~q\,
	combout => \ps2|time_out_counter[3]~6_combout\);

-- Location: LCCOMB_X67_Y38_N20
\ps2|time_out_counter[3]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[3]~7_combout\ = (\ps2|state.wait_for_bat~q\) # ((\ps2|state.wait_for_reset_acknowledge~q\) # ((\ps2|Selector6~4_combout\) # (\ps2|time_out_counter[3]~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.wait_for_bat~q\,
	datab => \ps2|state.wait_for_reset_acknowledge~q\,
	datac => \ps2|Selector6~4_combout\,
	datad => \ps2|time_out_counter[3]~6_combout\,
	combout => \ps2|time_out_counter[3]~7_combout\);

-- Location: LCCOMB_X66_Y38_N20
\ps2|time_out_counter[3]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[3]~8_combout\ = (\ps2|Equal2~8_combout\ & ((\ps2|time_out_counter[3]~7_combout\) # ((!\ps2|time_out_counter[3]~3_combout\ & \ps2|state.periodic_reset~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[3]~7_combout\,
	datab => \ps2|Equal2~8_combout\,
	datac => \ps2|time_out_counter[3]~3_combout\,
	datad => \ps2|state.periodic_reset~q\,
	combout => \ps2|time_out_counter[3]~8_combout\);

-- Location: LCCOMB_X70_Y37_N12
\ps2|time_out_counter[23]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|time_out_counter[23]~32_combout\ = (\ps2|time_out_counter[3]~8_combout\) # (((\ps2|time_out_counter[3]~5_combout\ & !\ps2|Add0~46_combout\)) # (!\ps2|Selector42~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter[3]~8_combout\,
	datab => \ps2|time_out_counter[3]~5_combout\,
	datac => \ps2|Add0~46_combout\,
	datad => \ps2|Selector42~0_combout\,
	combout => \ps2|time_out_counter[23]~32_combout\);

-- Location: FF_X70_Y37_N13
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

-- Location: LCCOMB_X70_Y37_N22
\ps2|Equal2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Equal2~6_combout\ = (\ps2|time_out_counter\(23) & (\ps2|time_out_counter\(21) & (\ps2|time_out_counter\(22) & \ps2|time_out_counter\(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|time_out_counter\(23),
	datab => \ps2|time_out_counter\(21),
	datac => \ps2|time_out_counter\(22),
	datad => \ps2|time_out_counter\(20),
	combout => \ps2|Equal2~6_combout\);

-- Location: LCCOMB_X68_Y37_N2
\ps2|Equal2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|Equal2~8_combout\ = (\ps2|Equal2~6_combout\ & (\ps2|Equal2~7_combout\ & (\ps2|Equal2~5_combout\ & \ps2|Equal2~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|Equal2~6_combout\,
	datab => \ps2|Equal2~7_combout\,
	datac => \ps2|Equal2~5_combout\,
	datad => \ps2|Equal2~4_combout\,
	combout => \ps2|Equal2~8_combout\);

-- Location: LCCOMB_X65_Y38_N22
\ps2|state~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~42_combout\ = (\ps2|state.restart~9_combout\ & !\ps2|Equal2~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.restart~9_combout\,
	datad => \ps2|Equal2~8_combout\,
	combout => \ps2|state~42_combout\);

-- Location: LCCOMB_X65_Y38_N14
\ps2|state~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~61_combout\ = (\ps2|state~42_combout\ & ((\ps2|Selector6~15_combout\) # ((!\ps2|process_0~6_combout\ & \ps2|state.wait_for_bat~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state~42_combout\,
	datab => \ps2|process_0~6_combout\,
	datac => \ps2|state.wait_for_bat~q\,
	datad => \ps2|Selector6~15_combout\,
	combout => \ps2|state~61_combout\);

-- Location: FF_X65_Y38_N15
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

-- Location: LCCOMB_X67_Y38_N16
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

-- Location: LCCOMB_X67_Y38_N12
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

-- Location: LCCOMB_X67_Y38_N26
\ps2|state.restart~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state.restart~8_combout\ = (\ps2|state.wait_for_bat~q\ & (((!\ps2|state.wait_for_reset_acknowledge~q\ & \ps2|state.restart~5_combout\)))) # (!\ps2|state.wait_for_bat~q\ & ((\ps2|state.wait_for_reset_acknowledge~q\ & ((\ps2|state.restart~5_combout\))) 
-- # (!\ps2|state.wait_for_reset_acknowledge~q\ & (\ps2|state.restart~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.wait_for_bat~q\,
	datab => \ps2|state.restart~7_combout\,
	datac => \ps2|state.wait_for_reset_acknowledge~q\,
	datad => \ps2|state.restart~5_combout\,
	combout => \ps2|state.restart~8_combout\);

-- Location: LCCOMB_X67_Y38_N10
\ps2|state.restart~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state.restart~1_combout\ = (\ps2|state.wait_for_enable_mouse_acknowledge~q\ & (!\ps2|state.enable_mouse~q\ & !\ps2|state.keyboard_wait_for_change~q\)) # (!\ps2|state.wait_for_enable_mouse_acknowledge~q\ & (\ps2|state.enable_mouse~q\ $ 
-- (\ps2|state.keyboard_wait_for_change~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.wait_for_enable_mouse_acknowledge~q\,
	datac => \ps2|state.enable_mouse~q\,
	datad => \ps2|state.keyboard_wait_for_change~q\,
	combout => \ps2|state.restart~1_combout\);

-- Location: LCCOMB_X67_Y38_N28
\ps2|state.restart~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state.restart~2_combout\ = (!\ps2|state.wait_for_first_mouse_byte~q\ & (\ps2|state.restart~q\ & (!\ps2|state.wait_for_third_mouse_byte~q\ & !\ps2|state.wait_for_second_mouse_byte~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.wait_for_first_mouse_byte~q\,
	datab => \ps2|state.restart~q\,
	datac => \ps2|state.wait_for_third_mouse_byte~q\,
	datad => \ps2|state.wait_for_second_mouse_byte~q\,
	combout => \ps2|state.restart~2_combout\);

-- Location: LCCOMB_X67_Y38_N30
\ps2|state.restart~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state.restart~3_combout\ = (!\ps2|state.wait_for_enable_mouse_acknowledge~q\ & (!\ps2|state.enable_mouse~q\ & !\ps2|state.keyboard_wait_for_change~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.wait_for_enable_mouse_acknowledge~q\,
	datac => \ps2|state.enable_mouse~q\,
	datad => \ps2|state.keyboard_wait_for_change~q\,
	combout => \ps2|state.restart~3_combout\);

-- Location: LCCOMB_X67_Y38_N24
\ps2|state.restart~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state.restart~0_combout\ = (\ps2|state.wait_for_first_mouse_byte~q\ & (\ps2|state.restart~q\ & (!\ps2|state.wait_for_third_mouse_byte~q\ & !\ps2|state.wait_for_second_mouse_byte~q\))) # (!\ps2|state.wait_for_first_mouse_byte~q\ & 
-- ((\ps2|state.restart~q\ & (\ps2|state.wait_for_third_mouse_byte~q\ $ (\ps2|state.wait_for_second_mouse_byte~q\))) # (!\ps2|state.restart~q\ & (!\ps2|state.wait_for_third_mouse_byte~q\ & !\ps2|state.wait_for_second_mouse_byte~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010001001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.wait_for_first_mouse_byte~q\,
	datab => \ps2|state.restart~q\,
	datac => \ps2|state.wait_for_third_mouse_byte~q\,
	datad => \ps2|state.wait_for_second_mouse_byte~q\,
	combout => \ps2|state.restart~0_combout\);

-- Location: LCCOMB_X67_Y38_N0
\ps2|state.restart~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state.restart~4_combout\ = (\ps2|state.restart~1_combout\ & ((\ps2|state.restart~2_combout\) # ((\ps2|state.restart~3_combout\ & \ps2|state.restart~0_combout\)))) # (!\ps2|state.restart~1_combout\ & (((\ps2|state.restart~3_combout\ & 
-- \ps2|state.restart~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.restart~1_combout\,
	datab => \ps2|state.restart~2_combout\,
	datac => \ps2|state.restart~3_combout\,
	datad => \ps2|state.restart~0_combout\,
	combout => \ps2|state.restart~4_combout\);

-- Location: LCCOMB_X67_Y38_N14
\ps2|state.restart~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state.restart~6_combout\ = (!\ps2|state.wait_for_bat~q\ & (\ps2|state.restart~4_combout\ & (!\ps2|state.wait_for_reset_acknowledge~q\ & \ps2|state.restart~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.wait_for_bat~q\,
	datab => \ps2|state.restart~4_combout\,
	datac => \ps2|state.wait_for_reset_acknowledge~q\,
	datad => \ps2|state.restart~5_combout\,
	combout => \ps2|state.restart~6_combout\);

-- Location: LCCOMB_X67_Y38_N4
\ps2|state.restart~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state.restart~9_combout\ = (\ps2|state.restart~6_combout\) # ((\ps2|state.restart~8_combout\ & (\ps2|state.restart~3_combout\ & \ps2|state.restart~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.restart~8_combout\,
	datab => \ps2|state.restart~6_combout\,
	datac => \ps2|state.restart~3_combout\,
	datad => \ps2|state.restart~2_combout\,
	combout => \ps2|state.restart~9_combout\);

-- Location: LCCOMB_X65_Y38_N8
\ps2|state~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~45_combout\ = (\ps2|ll|rxd_valid~q\ & ((\ps2|state.wait_for_third_mouse_byte~q\) # ((\ps2|process_0~2_combout\ & \ps2|state.wait_for_enable_mouse_acknowledge~q\)))) # (!\ps2|ll|rxd_valid~q\ & (((\ps2|process_0~2_combout\ & 
-- \ps2|state.wait_for_enable_mouse_acknowledge~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|rxd_valid~q\,
	datab => \ps2|state.wait_for_third_mouse_byte~q\,
	datac => \ps2|process_0~2_combout\,
	datad => \ps2|state.wait_for_enable_mouse_acknowledge~q\,
	combout => \ps2|state~45_combout\);

-- Location: LCCOMB_X63_Y38_N2
\ps2|state~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~44_combout\ = (\ps2|state.wait_for_first_mouse_byte~q\ & ((!\ps2|ll|rxd_valid~q\) # (!\ps2|ll|rxd_data\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|rxd_data\(3),
	datac => \ps2|state.wait_for_first_mouse_byte~q\,
	datad => \ps2|ll|rxd_valid~q\,
	combout => \ps2|state~44_combout\);

-- Location: LCCOMB_X65_Y38_N6
\ps2|state~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~46_combout\ = (\ps2|state.restart~9_combout\ & ((\ps2|state~44_combout\) # ((\ps2|state~45_combout\ & !\ps2|Equal2~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.restart~9_combout\,
	datab => \ps2|state~45_combout\,
	datac => \ps2|state~44_combout\,
	datad => \ps2|Equal2~8_combout\,
	combout => \ps2|state~46_combout\);

-- Location: FF_X65_Y38_N7
\ps2|state.wait_for_first_mouse_byte\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|state~46_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|state.wait_for_first_mouse_byte~q\);

-- Location: LCCOMB_X67_Y38_N6
\ps2|state~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~62_combout\ = (\ps2|state.restart~9_combout\ & (((!\ps2|ll|rxd_data\(3)) # (!\ps2|ll|rxd_valid~q\)) # (!\ps2|state.wait_for_first_mouse_byte~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.wait_for_first_mouse_byte~q\,
	datab => \ps2|state.restart~9_combout\,
	datac => \ps2|ll|rxd_valid~q\,
	datad => \ps2|ll|rxd_data\(3),
	combout => \ps2|state~62_combout\);

-- Location: LCCOMB_X68_Y38_N22
\ps2|state~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|state~58_combout\ = (\ps2|state~62_combout\ & (((!\ps2|Selector6~13_combout\ & \ps2|state.periodic_reset~q\)) # (!\ps2|state.restart~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state~62_combout\,
	datab => \ps2|Selector6~13_combout\,
	datac => \ps2|state.periodic_reset~q\,
	datad => \ps2|state.restart~q\,
	combout => \ps2|state~58_combout\);

-- Location: FF_X68_Y38_N23
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

-- Location: LCCOMB_X66_Y38_N14
\ps2|txd_data[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|txd_data[1]~0_combout\ = (\ps2|Equal2~8_combout\ & (\ps2|state.periodic_reset~q\)) # (!\ps2|Equal2~8_combout\ & (((\ps2|state.enable_mouse~q\) # (\ps2|state.enable_keyboard~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|state.periodic_reset~q\,
	datab => \ps2|Equal2~8_combout\,
	datac => \ps2|state.enable_mouse~q\,
	datad => \ps2|state.enable_keyboard~q\,
	combout => \ps2|txd_data[1]~0_combout\);

-- Location: FF_X66_Y38_N15
\ps2|txd_request\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|txd_data[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|txd_request~q\);

-- Location: LCCOMB_X60_Y40_N0
\ps2|ll|process_0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|process_0~7_combout\ = (\ps2|ll|idle_counter\(8) & (\ps2|ll|Equal2~0_combout\ & (\ps2|ll|Equal2~1_combout\ & \ps2|txd_request~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|idle_counter\(8),
	datab => \ps2|ll|Equal2~0_combout\,
	datac => \ps2|ll|Equal2~1_combout\,
	datad => \ps2|txd_request~q\,
	combout => \ps2|ll|process_0~7_combout\);

-- Location: LCCOMB_X60_Y38_N30
\ps2|ll|time_out_counter[8]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[8]~6_combout\ = (\ps2|ll|ps2_clk_0~q\ & (\ps2|ll|state.sending~q\ & (!\ps2|ll|ps2_clk_1~q\ & \ps2|ll|Equal6~0_combout\))) # (!\ps2|ll|ps2_clk_0~q\ & (!\ps2|ll|state.sending~q\ & (\ps2|ll|ps2_clk_1~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001100000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|ps2_clk_0~q\,
	datab => \ps2|ll|state.sending~q\,
	datac => \ps2|ll|ps2_clk_1~q\,
	datad => \ps2|ll|Equal6~0_combout\,
	combout => \ps2|ll|time_out_counter[8]~6_combout\);

-- Location: LCCOMB_X60_Y37_N28
\ps2|ll|time_out_counter[8]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[8]~7_combout\ = (\ps2|ll|state.idle~q\ & ((\ps2|ll|time_out_counter[8]~6_combout\))) # (!\ps2|ll|state.idle~q\ & (\ps2|ll|process_0~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|process_0~7_combout\,
	datac => \ps2|ll|time_out_counter[8]~6_combout\,
	datad => \ps2|ll|state.idle~q\,
	combout => \ps2|ll|time_out_counter[8]~7_combout\);

-- Location: LCCOMB_X60_Y37_N18
\ps2|ll|time_out_counter[8]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[8]~5_combout\ = (\ps2|ll|state.receiving~q\) # (\ps2|ll|state.sending~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|state.receiving~q\,
	datad => \ps2|ll|state.sending~q\,
	combout => \ps2|ll|time_out_counter[8]~5_combout\);

-- Location: LCCOMB_X60_Y37_N22
\ps2|ll|time_out_counter[8]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[8]~8_combout\ = (\ps2|ll|state.idle~q\ & (((!\ps2|ll|time_out_counter[8]~5_combout\)) # (!\ps2|ll|time_out_counter[8]~7_combout\))) # (!\ps2|ll|state.idle~q\ & (!\ps2|ll|time_out_counter[8]~7_combout\ & 
-- ((!\ps2|ll|process_0~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101000111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state.idle~q\,
	datab => \ps2|ll|time_out_counter[8]~7_combout\,
	datac => \ps2|ll|time_out_counter[8]~5_combout\,
	datad => \ps2|ll|process_0~6_combout\,
	combout => \ps2|ll|time_out_counter[8]~8_combout\);

-- Location: LCCOMB_X60_Y37_N16
\ps2|ll|time_out_counter[8]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[8]~9_combout\ = (\ps2|ll|time_out_counter[8]~8_combout\ & ((!\ps2|ll|Equal3~3_combout\) # (!\ps2|ll|state.interrupting~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter[8]~8_combout\,
	datab => \ps2|ll|state.interrupting~q\,
	datac => \ps2|ll|Equal3~3_combout\,
	combout => \ps2|ll|time_out_counter[8]~9_combout\);

-- Location: LCCOMB_X60_Y36_N12
\ps2|ll|time_out_counter[0]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[0]~18_combout\ = (\ps2|ll|time_out_counter[0]~12_combout\ & (\ps2|ll|Add2~0_combout\ & (\ps2|ll|time_out_counter[8]~9_combout\))) # (!\ps2|ll|time_out_counter[0]~12_combout\ & (((\ps2|ll|time_out_counter\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Add2~0_combout\,
	datab => \ps2|ll|time_out_counter[8]~9_combout\,
	datac => \ps2|ll|time_out_counter\(0),
	datad => \ps2|ll|time_out_counter[0]~12_combout\,
	combout => \ps2|ll|time_out_counter[0]~18_combout\);

-- Location: FF_X60_Y36_N13
\ps2|ll|time_out_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|time_out_counter[0]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|time_out_counter\(0));

-- Location: LCCOMB_X59_Y36_N12
\ps2|ll|Add2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Add2~2_combout\ = (\ps2|ll|time_out_counter\(1) & (\ps2|ll|Add2~1\ & VCC)) # (!\ps2|ll|time_out_counter\(1) & (!\ps2|ll|Add2~1\))
-- \ps2|ll|Add2~3\ = CARRY((!\ps2|ll|time_out_counter\(1) & !\ps2|ll|Add2~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|time_out_counter\(1),
	datad => VCC,
	cin => \ps2|ll|Add2~1\,
	combout => \ps2|ll|Add2~2_combout\,
	cout => \ps2|ll|Add2~3\);

-- Location: LCCOMB_X60_Y36_N0
\ps2|ll|time_out_counter[1]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[1]~13_combout\ = (\ps2|ll|time_out_counter[0]~12_combout\ & (\ps2|ll|Add2~2_combout\ & (\ps2|ll|time_out_counter[8]~9_combout\))) # (!\ps2|ll|time_out_counter[0]~12_combout\ & (((\ps2|ll|time_out_counter\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Add2~2_combout\,
	datab => \ps2|ll|time_out_counter[8]~9_combout\,
	datac => \ps2|ll|time_out_counter\(1),
	datad => \ps2|ll|time_out_counter[0]~12_combout\,
	combout => \ps2|ll|time_out_counter[1]~13_combout\);

-- Location: FF_X60_Y36_N1
\ps2|ll|time_out_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|time_out_counter[1]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|time_out_counter\(1));

-- Location: LCCOMB_X60_Y36_N10
\ps2|ll|time_out_counter[2]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[2]~14_combout\ = (\ps2|ll|time_out_counter[0]~12_combout\ & (\ps2|ll|Add2~4_combout\ & (\ps2|ll|time_out_counter[8]~9_combout\))) # (!\ps2|ll|time_out_counter[0]~12_combout\ & (((\ps2|ll|time_out_counter\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Add2~4_combout\,
	datab => \ps2|ll|time_out_counter[8]~9_combout\,
	datac => \ps2|ll|time_out_counter\(2),
	datad => \ps2|ll|time_out_counter[0]~12_combout\,
	combout => \ps2|ll|time_out_counter[2]~14_combout\);

-- Location: FF_X60_Y36_N11
\ps2|ll|time_out_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|time_out_counter[2]~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|time_out_counter\(2));

-- Location: LCCOMB_X60_Y36_N8
\ps2|ll|Equal3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Equal3~0_combout\ = (!\ps2|ll|time_out_counter\(2) & (!\ps2|ll|time_out_counter\(1) & (!\ps2|ll|time_out_counter\(6) & !\ps2|ll|time_out_counter\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter\(2),
	datab => \ps2|ll|time_out_counter\(1),
	datac => \ps2|ll|time_out_counter\(6),
	datad => \ps2|ll|time_out_counter\(3),
	combout => \ps2|ll|Equal3~0_combout\);

-- Location: LCCOMB_X61_Y37_N30
\ps2|ll|state.finishing~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state.finishing~0_combout\ = (\ps2|ll|ps2_dat_1~q\ & (\ps2|ll|state.waiting_for_acknowledge~q\ & ((!\ps2|ll|Equal3~4_combout\) # (!\ps2|ll|Equal3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|ps2_dat_1~q\,
	datab => \ps2|ll|Equal3~0_combout\,
	datac => \ps2|ll|Equal3~4_combout\,
	datad => \ps2|ll|state.waiting_for_acknowledge~q\,
	combout => \ps2|ll|state.finishing~0_combout\);

-- Location: LCCOMB_X61_Y37_N2
\ps2|ll|state.finishing~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state.finishing~1_combout\ = (\ps2|ll|state~29_combout\ & (\ps2|ll|state.finishing~0_combout\ & (\ps2|ll|state.idle~2_combout\))) # (!\ps2|ll|state~29_combout\ & (((\ps2|ll|state.finishing~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state.finishing~0_combout\,
	datab => \ps2|ll|state.idle~2_combout\,
	datac => \ps2|ll|state.finishing~q\,
	datad => \ps2|ll|state~29_combout\,
	combout => \ps2|ll|state.finishing~1_combout\);

-- Location: FF_X61_Y37_N3
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

-- Location: LCCOMB_X61_Y37_N18
\ps2|ll|time_out_counter[0]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[0]~10_combout\ = (!\ps2|ll|state.receiving~q\ & (!\ps2|ll|state.sending~q\ & !\ps2|ll|state.waiting_for_acknowledge~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|state.receiving~q\,
	datac => \ps2|ll|state.sending~q\,
	datad => \ps2|ll|state.waiting_for_acknowledge~q\,
	combout => \ps2|ll|time_out_counter[0]~10_combout\);

-- Location: LCCOMB_X60_Y37_N10
\ps2|ll|time_out_counter[0]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[0]~11_combout\ = (\ps2|ll|Equal1~0_combout\ & (((!\ps2|ll|state.finishing~q\ & \ps2|ll|time_out_counter[0]~10_combout\)) # (!\ps2|ll|Equal3~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state.finishing~q\,
	datab => \ps2|ll|time_out_counter[0]~10_combout\,
	datac => \ps2|ll|Equal3~3_combout\,
	datad => \ps2|ll|Equal1~0_combout\,
	combout => \ps2|ll|time_out_counter[0]~11_combout\);

-- Location: LCCOMB_X60_Y37_N4
\ps2|ll|time_out_counter[0]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[0]~12_combout\ = (\ps2|ll|time_out_counter[0]~11_combout\ & ((\ps2|ll|time_out_counter[8]~7_combout\) # ((!\ps2|ll|time_out_counter[8]~4_combout\) # (!\ps2|ll|Equal3~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter[0]~11_combout\,
	datab => \ps2|ll|time_out_counter[8]~7_combout\,
	datac => \ps2|ll|Equal3~3_combout\,
	datad => \ps2|ll|time_out_counter[8]~4_combout\,
	combout => \ps2|ll|time_out_counter[0]~12_combout\);

-- Location: LCCOMB_X59_Y36_N6
\ps2|ll|time_out_counter[5]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[5]~17_combout\ = (\ps2|ll|time_out_counter[0]~12_combout\ & (\ps2|ll|Add2~10_combout\ & ((\ps2|ll|time_out_counter[8]~9_combout\)))) # (!\ps2|ll|time_out_counter[0]~12_combout\ & (((\ps2|ll|time_out_counter\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter[0]~12_combout\,
	datab => \ps2|ll|Add2~10_combout\,
	datac => \ps2|ll|time_out_counter\(5),
	datad => \ps2|ll|time_out_counter[8]~9_combout\,
	combout => \ps2|ll|time_out_counter[5]~17_combout\);

-- Location: FF_X59_Y36_N7
\ps2|ll|time_out_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \ps2|ll|time_out_counter[5]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|ll|time_out_counter\(5));

-- Location: LCCOMB_X59_Y36_N8
\ps2|ll|Equal3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Equal3~1_combout\ = (!\ps2|ll|time_out_counter\(5) & (!\ps2|ll|time_out_counter\(8) & (!\ps2|ll|time_out_counter\(9) & !\ps2|ll|time_out_counter\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter\(5),
	datab => \ps2|ll|time_out_counter\(8),
	datac => \ps2|ll|time_out_counter\(9),
	datad => \ps2|ll|time_out_counter\(7),
	combout => \ps2|ll|Equal3~1_combout\);

-- Location: LCCOMB_X60_Y36_N24
\ps2|ll|Equal3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Equal3~2_combout\ = (!\ps2|ll|time_out_counter\(4) & !\ps2|ll|time_out_counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter\(4),
	datad => \ps2|ll|time_out_counter\(0),
	combout => \ps2|ll|Equal3~2_combout\);

-- Location: LCCOMB_X60_Y36_N18
\ps2|ll|Equal3~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Equal3~3_combout\ = (\ps2|ll|Equal3~1_combout\ & (!\ps2|ll|time_out_counter\(10) & (\ps2|ll|Equal3~0_combout\ & \ps2|ll|Equal3~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Equal3~1_combout\,
	datab => \ps2|ll|time_out_counter\(10),
	datac => \ps2|ll|Equal3~0_combout\,
	datad => \ps2|ll|Equal3~2_combout\,
	combout => \ps2|ll|Equal3~3_combout\);

-- Location: LCCOMB_X60_Y37_N6
\ps2|ll|state~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~23_combout\ = (\ps2|ll|time_out_counter[8]~4_combout\) # ((\ps2|ll|state.interrupting~q\) # ((!\ps2|ll|Equal3~3_combout\ & \ps2|ll|state.sending~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Equal3~3_combout\,
	datab => \ps2|ll|time_out_counter[8]~4_combout\,
	datac => \ps2|ll|state.interrupting~q\,
	datad => \ps2|ll|state.sending~q\,
	combout => \ps2|ll|state~23_combout\);

-- Location: LCCOMB_X60_Y37_N20
\ps2|ll|state~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~27_combout\ = (\ps2|ll|state.sending~q\ & ((!\ps2|ll|Equal6~0_combout\))) # (!\ps2|ll|state.sending~q\ & (\ps2|ll|Equal3~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Equal3~3_combout\,
	datac => \ps2|ll|Equal6~0_combout\,
	datad => \ps2|ll|state.sending~q\,
	combout => \ps2|ll|state~27_combout\);

-- Location: LCCOMB_X60_Y37_N14
\ps2|ll|state~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~28_combout\ = (\ps2|ll|state~23_combout\ & ((\ps2|ll|state.idle~q\ & (!\ps2|ll|state~27_combout\)) # (!\ps2|ll|state.idle~q\ & ((!\ps2|ll|process_0~7_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state~23_combout\,
	datab => \ps2|ll|state~27_combout\,
	datac => \ps2|ll|process_0~7_combout\,
	datad => \ps2|ll|state.idle~q\,
	combout => \ps2|ll|state~28_combout\);

-- Location: LCCOMB_X61_Y37_N16
\ps2|ll|state~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~24_combout\ = ((\ps2|ll|state~14_combout\ & ((!\ps2|ll|Equal3~0_combout\) # (!\ps2|ll|Equal3~4_combout\)))) # (!\ps2|ll|Equal1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Equal3~4_combout\,
	datab => \ps2|ll|Equal3~0_combout\,
	datac => \ps2|ll|Equal1~0_combout\,
	datad => \ps2|ll|state~14_combout\,
	combout => \ps2|ll|state~24_combout\);

-- Location: LCCOMB_X60_Y37_N24
\ps2|ll|state~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~25_combout\ = (\ps2|ll|state.finishing~q\ & ((\ps2|ll|ps2_dat_0~q\))) # (!\ps2|ll|state.finishing~q\ & (\ps2|ll|state.receiving~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|state.receiving~q\,
	datac => \ps2|ll|ps2_dat_0~q\,
	datad => \ps2|ll|state.finishing~q\,
	combout => \ps2|ll|state~25_combout\);

-- Location: LCCOMB_X60_Y37_N2
\ps2|ll|state~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~26_combout\ = (!\ps2|ll|Equal3~3_combout\ & (\ps2|ll|state~25_combout\ & ((\ps2|ll|state.finishing~q\) # (!\ps2|ll|rxd_data[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Equal3~3_combout\,
	datab => \ps2|ll|state~25_combout\,
	datac => \ps2|ll|rxd_data[1]~0_combout\,
	datad => \ps2|ll|state.finishing~q\,
	combout => \ps2|ll|state~26_combout\);

-- Location: LCCOMB_X61_Y37_N26
\ps2|ll|state~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~29_combout\ = ((!\ps2|ll|state~28_combout\ & (!\ps2|ll|state~24_combout\ & !\ps2|ll|state~26_combout\))) # (!\ps2|ll|state.idle~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state~28_combout\,
	datab => \ps2|ll|state~24_combout\,
	datac => \ps2|ll|state.idle~2_combout\,
	datad => \ps2|ll|state~26_combout\,
	combout => \ps2|ll|state~29_combout\);

-- Location: LCCOMB_X61_Y37_N20
\ps2|ll|state~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~22_combout\ = ((\ps2|ll|Equal3~0_combout\ & \ps2|ll|Equal3~4_combout\)) # (!\ps2|ll|state.waiting_for_acknowledge~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ps2|ll|Equal3~0_combout\,
	datac => \ps2|ll|Equal3~4_combout\,
	datad => \ps2|ll|state.waiting_for_acknowledge~q\,
	combout => \ps2|ll|state~22_combout\);

-- Location: LCCOMB_X61_Y37_N14
\ps2|ll|state.idle~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state.idle~3_combout\ = (\ps2|ll|state~22_combout\ & (((\ps2|ll|time_out_counter[8]~3_combout\) # (\ps2|ll|state~23_combout\)))) # (!\ps2|ll|state~22_combout\ & (\ps2|ll|ps2_dat_1~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|ps2_dat_1~q\,
	datab => \ps2|ll|time_out_counter[8]~3_combout\,
	datac => \ps2|ll|state~23_combout\,
	datad => \ps2|ll|state~22_combout\,
	combout => \ps2|ll|state.idle~3_combout\);

-- Location: LCCOMB_X61_Y37_N6
\ps2|ll|state.idle~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state.idle~4_combout\ = (\ps2|ll|state~29_combout\ & (\ps2|ll|state.idle~3_combout\ & ((\ps2|ll|state.idle~2_combout\)))) # (!\ps2|ll|state~29_combout\ & (((\ps2|ll|state.idle~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state~29_combout\,
	datab => \ps2|ll|state.idle~3_combout\,
	datac => \ps2|ll|state.idle~q\,
	datad => \ps2|ll|state.idle~2_combout\,
	combout => \ps2|ll|state.idle~4_combout\);

-- Location: FF_X61_Y37_N7
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

-- Location: LCCOMB_X60_Y38_N10
\ps2|ll|time_out_counter[8]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|time_out_counter[8]~4_combout\ = (!\ps2|ll|state.idle~q\ & ((\ps2|ll|ps2_clk_0~q\) # (!\ps2|ll|ps2_dat_0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101100001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|ps2_clk_0~q\,
	datab => \ps2|ll|ps2_dat_0~q\,
	datac => \ps2|ll|state.idle~q\,
	combout => \ps2|ll|time_out_counter[8]~4_combout\);

-- Location: LCCOMB_X61_Y37_N10
\ps2|ll|state~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|state~20_combout\ = (\ps2|ll|state.idle~2_combout\ & ((\ps2|ll|state~18_combout\ & ((\ps2|ll|state.interrupting~q\))) # (!\ps2|ll|state~18_combout\ & (\ps2|ll|time_out_counter[8]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter[8]~4_combout\,
	datab => \ps2|ll|state.idle~2_combout\,
	datac => \ps2|ll|state.interrupting~q\,
	datad => \ps2|ll|state~18_combout\,
	combout => \ps2|ll|state~20_combout\);

-- Location: FF_X61_Y37_N11
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

-- Location: FF_X60_Y38_N27
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

-- Location: LCCOMB_X60_Y40_N28
\ps2|ll|Selector31~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector31~1_combout\ = (!\ps2|ll|state.idle~q\ & (((!\ps2|ll|ps2_clk_0~q\ & \ps2|ll|ps2_dat_0~q\)) # (!\ps2|ll|process_0~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|process_0~7_combout\,
	datab => \ps2|ll|ps2_clk_0~q\,
	datac => \ps2|ll|ps2_dat_0~q\,
	datad => \ps2|ll|state.idle~q\,
	combout => \ps2|ll|Selector31~1_combout\);

-- Location: LCCOMB_X60_Y40_N22
\ps2|ll|Selector31~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector31~2_combout\ = (\ps2|ll|state.finishing~q\) # ((\ps2|ll|Selector31~1_combout\) # ((\ps2|ll|data[6]~1_combout\) # (\ps2|ll|state.waiting_for_acknowledge~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|state.finishing~q\,
	datab => \ps2|ll|Selector31~1_combout\,
	datac => \ps2|ll|data[6]~1_combout\,
	datad => \ps2|ll|state.waiting_for_acknowledge~q\,
	combout => \ps2|ll|Selector31~2_combout\);

-- Location: LCCOMB_X61_Y38_N20
\ps2|ll|Selector31~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector31~0_combout\ = (\ps2|ll|data\(1) & ((\ps2|ll|rxd_valid~0_combout\) # (\ps2|ll|Selector21~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|rxd_valid~0_combout\,
	datac => \ps2|ll|Selector21~0_combout\,
	datad => \ps2|ll|data\(1),
	combout => \ps2|ll|Selector31~0_combout\);

-- Location: LCCOMB_X61_Y38_N22
\ps2|ll|Selector31~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector31~3_combout\ = (\ps2|ll|Selector31~0_combout\) # ((\ps2|ll|data\(0) & ((\ps2|ll|Selector31~2_combout\) # (!\ps2|ll|Selector21~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Selector21~2_combout\,
	datab => \ps2|ll|Selector31~2_combout\,
	datac => \ps2|ll|data\(0),
	datad => \ps2|ll|Selector31~0_combout\,
	combout => \ps2|ll|Selector31~3_combout\);

-- Location: FF_X61_Y38_N23
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

-- Location: LCCOMB_X61_Y38_N14
\ps2|ll|ps2_dat~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|ps2_dat~reg0feeder_combout\ = \ps2|ll|data\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ps2|ll|data\(0),
	combout => \ps2|ll|ps2_dat~reg0feeder_combout\);

-- Location: FF_X61_Y38_N15
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

-- Location: LCCOMB_X60_Y36_N22
\ps2|ll|Selector34~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector34~0_combout\ = (!\ps2|ll|time_out_counter\(3) & (((!\ps2|ll|time_out_counter\(1) & !\ps2|ll|time_out_counter\(0))) # (!\ps2|ll|time_out_counter\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter\(2),
	datab => \ps2|ll|time_out_counter\(1),
	datac => \ps2|ll|time_out_counter\(3),
	datad => \ps2|ll|time_out_counter\(0),
	combout => \ps2|ll|Selector34~0_combout\);

-- Location: LCCOMB_X60_Y36_N16
\ps2|ll|Selector34~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector34~1_combout\ = (\ps2|ll|Equal3~1_combout\ & (!\ps2|ll|time_out_counter\(10) & ((\ps2|ll|Selector34~0_combout\) # (!\ps2|ll|time_out_counter\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|Equal3~1_combout\,
	datab => \ps2|ll|time_out_counter\(10),
	datac => \ps2|ll|Selector34~0_combout\,
	datad => \ps2|ll|time_out_counter\(4),
	combout => \ps2|ll|Selector34~1_combout\);

-- Location: LCCOMB_X60_Y38_N28
\ps2|ll|Selector34~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|ll|Selector34~2_combout\ = (\ps2|ll|state.sending~q\) # ((!\ps2|ll|time_out_counter\(6) & (\ps2|ll|state.interrupting~q\ & \ps2|ll|Selector34~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|time_out_counter\(6),
	datab => \ps2|ll|state.sending~q\,
	datac => \ps2|ll|state.interrupting~q\,
	datad => \ps2|ll|Selector34~1_combout\,
	combout => \ps2|ll|Selector34~2_combout\);

-- Location: FF_X60_Y38_N29
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

-- Location: LCCOMB_X65_Y38_N26
\ps2|key_code[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ps2|key_code[0]~0_combout\ = (\ps2|ll|rxd_valid~q\ & \ps2|state.keyboard_wait_for_change~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|ll|rxd_valid~q\,
	datad => \ps2|state.keyboard_wait_for_change~q\,
	combout => \ps2|key_code[0]~0_combout\);

-- Location: FF_X65_Y37_N25
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

-- Location: FF_X62_Y37_N31
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

-- Location: FF_X62_Y37_N5
\ps2|key_code[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \ps2|ll|rxd_data\(1),
	sload => VCC,
	ena => \ps2|key_code[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ps2|key_code\(1));

-- Location: FF_X63_Y38_N9
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

-- Location: LCCOMB_X62_Y37_N4
\s_dados_ps2~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~10_combout\ = (s_dados_ps2(1)) # ((\ps2|key_code\(2) & (!\ps2|key_code\(1) & !\ps2|key_code\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(2),
	datab => s_dados_ps2(1),
	datac => \ps2|key_code\(1),
	datad => \ps2|key_code\(6),
	combout => \s_dados_ps2~10_combout\);

-- Location: LCCOMB_X66_Y37_N22
\last_key_code[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \last_key_code[6]~feeder_combout\ = \ps2|key_code\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ps2|key_code\(6),
	combout => \last_key_code[6]~feeder_combout\);

-- Location: FF_X63_Y37_N7
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

-- Location: FF_X66_Y37_N23
\last_key_code[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \last_key_code[6]~feeder_combout\,
	ena => \ps2|valid_key_code~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => last_key_code(6));

-- Location: LCCOMB_X66_Y37_N28
\last_key_code[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \last_key_code[5]~feeder_combout\ = \ps2|key_code\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ps2|key_code\(5),
	combout => \last_key_code[5]~feeder_combout\);

-- Location: FF_X66_Y37_N29
\last_key_code[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \last_key_code[5]~feeder_combout\,
	ena => \ps2|valid_key_code~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => last_key_code(5));

-- Location: FF_X63_Y38_N27
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

-- Location: FF_X66_Y37_N25
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

-- Location: FF_X65_Y37_N27
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

-- Location: FF_X66_Y37_N3
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

-- Location: LCCOMB_X66_Y37_N24
\Equal1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal1~1_combout\ = (last_key_code(6) & (last_key_code(5) & (last_key_code(7) & last_key_code(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => last_key_code(6),
	datab => last_key_code(5),
	datac => last_key_code(7),
	datad => last_key_code(4),
	combout => \Equal1~1_combout\);

-- Location: FF_X63_Y37_N25
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

-- Location: LCCOMB_X66_Y37_N10
\last_key_code[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \last_key_code[0]~feeder_combout\ = \ps2|key_code\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ps2|key_code\(0),
	combout => \last_key_code[0]~feeder_combout\);

-- Location: FF_X66_Y37_N11
\last_key_code[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \last_key_code[0]~feeder_combout\,
	ena => \ps2|valid_key_code~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => last_key_code(0));

-- Location: FF_X66_Y37_N15
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

-- Location: FF_X63_Y37_N11
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

-- Location: FF_X66_Y37_N9
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

-- Location: FF_X66_Y37_N21
\last_key_code[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \ps2|key_code\(1),
	sload => VCC,
	ena => \ps2|valid_key_code~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => last_key_code(1));

-- Location: LCCOMB_X66_Y37_N8
\Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = (!last_key_code(0) & (!last_key_code(2) & (!last_key_code(3) & !last_key_code(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => last_key_code(0),
	datab => last_key_code(2),
	datac => last_key_code(3),
	datad => last_key_code(1),
	combout => \Equal1~0_combout\);

-- Location: LCCOMB_X63_Y37_N6
\s_dados_ps2~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~12_combout\ = (\ps2|key_code\(1)) # ((\Equal1~1_combout\ & \Equal1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~1_combout\,
	datab => \ps2|key_code\(1),
	datad => \Equal1~0_combout\,
	combout => \s_dados_ps2~12_combout\);

-- Location: LCCOMB_X62_Y37_N24
\s_dados_ps2~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~11_combout\ = (\ps2|key_code\(1) & (!\ps2|key_code\(2) & (\ps2|key_code\(4) $ (\ps2|key_code\(6))))) # (!\ps2|key_code\(1) & (\ps2|key_code\(4) & (\ps2|key_code\(2) & !\ps2|key_code\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(1),
	datab => \ps2|key_code\(4),
	datac => \ps2|key_code\(2),
	datad => \ps2|key_code\(6),
	combout => \s_dados_ps2~11_combout\);

-- Location: LCCOMB_X62_Y37_N10
\s_dados_ps2~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~13_combout\ = (\ps2|key_code\(3) & ((\s_dados_ps2~11_combout\ & (\s_dados_ps2~12_combout\)) # (!\s_dados_ps2~11_combout\ & ((s_dados_ps2(1)))))) # (!\ps2|key_code\(3) & (((s_dados_ps2(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_dados_ps2~12_combout\,
	datab => s_dados_ps2(1),
	datac => \ps2|key_code\(3),
	datad => \s_dados_ps2~11_combout\,
	combout => \s_dados_ps2~13_combout\);

-- Location: LCCOMB_X62_Y37_N12
\s_dados_ps2~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~14_combout\ = (\ps2|key_code\(1) & (!\ps2|key_code\(2) & \ps2|key_code\(6))) # (!\ps2|key_code\(1) & (\ps2|key_code\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(1),
	datac => \ps2|key_code\(2),
	datad => \ps2|key_code\(6),
	combout => \s_dados_ps2~14_combout\);

-- Location: LCCOMB_X62_Y37_N22
\s_dados_ps2~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~15_combout\ = (\ps2|key_code\(6) & (!\ps2|key_code\(3) & !\ps2|key_code\(4))) # (!\ps2|key_code\(6) & (\ps2|key_code\(3) & \ps2|key_code\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(6),
	datac => \ps2|key_code\(3),
	datad => \ps2|key_code\(4),
	combout => \s_dados_ps2~15_combout\);

-- Location: LCCOMB_X63_Y37_N28
\Equal1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal1~2_combout\ = (\Equal1~1_combout\ & \Equal1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Equal1~1_combout\,
	datad => \Equal1~0_combout\,
	combout => \Equal1~2_combout\);

-- Location: LCCOMB_X62_Y37_N16
\s_dados_ps2~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~16_combout\ = (\s_dados_ps2~14_combout\ & ((\s_dados_ps2~15_combout\ & ((\Equal1~2_combout\))) # (!\s_dados_ps2~15_combout\ & (s_dados_ps2(1))))) # (!\s_dados_ps2~14_combout\ & (s_dados_ps2(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_dados_ps2~14_combout\,
	datab => s_dados_ps2(1),
	datac => \s_dados_ps2~15_combout\,
	datad => \Equal1~2_combout\,
	combout => \s_dados_ps2~16_combout\);

-- Location: LCCOMB_X62_Y37_N26
\s_dados_ps2~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~17_combout\ = (\ps2|key_code\(5) & (((\ps2|key_code\(0))))) # (!\ps2|key_code\(5) & ((\ps2|key_code\(0) & (\s_dados_ps2~13_combout\)) # (!\ps2|key_code\(0) & ((\s_dados_ps2~16_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_dados_ps2~13_combout\,
	datab => \s_dados_ps2~16_combout\,
	datac => \ps2|key_code\(5),
	datad => \ps2|key_code\(0),
	combout => \s_dados_ps2~17_combout\);

-- Location: LCCOMB_X62_Y37_N20
\s_dados_ps2~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~18_combout\ = (\ps2|key_code\(4) & (\ps2|key_code\(3) & (\ps2|key_code\(1) $ (\ps2|key_code\(2))))) # (!\ps2|key_code\(4) & (!\ps2|key_code\(1) & ((\ps2|key_code\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(1),
	datab => \ps2|key_code\(3),
	datac => \ps2|key_code\(2),
	datad => \ps2|key_code\(4),
	combout => \s_dados_ps2~18_combout\);

-- Location: LCCOMB_X62_Y37_N6
\s_dados_ps2~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~19_combout\ = (\s_dados_ps2~18_combout\ & (!\ps2|key_code\(2) & !\ps2|key_code\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \s_dados_ps2~18_combout\,
	datac => \ps2|key_code\(2),
	datad => \ps2|key_code\(6),
	combout => \s_dados_ps2~19_combout\);

-- Location: LCCOMB_X62_Y37_N8
\s_dados_ps2~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~21_combout\ = (\ps2|key_code\(4) & (!\ps2|key_code\(3) & (\ps2|key_code\(1) $ (\ps2|key_code\(2))))) # (!\ps2|key_code\(4) & (\ps2|key_code\(1) & ((!\ps2|key_code\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(1),
	datab => \ps2|key_code\(3),
	datac => \ps2|key_code\(2),
	datad => \ps2|key_code\(4),
	combout => \s_dados_ps2~21_combout\);

-- Location: LCCOMB_X63_Y37_N0
\s_dados_ps2~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~20_combout\ = (\ps2|key_code\(6) & (s_dados_ps2(1))) # (!\ps2|key_code\(6) & (((\Equal1~1_combout\ & \Equal1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(6),
	datab => s_dados_ps2(1),
	datac => \Equal1~1_combout\,
	datad => \Equal1~0_combout\,
	combout => \s_dados_ps2~20_combout\);

-- Location: LCCOMB_X62_Y37_N18
\s_dados_ps2~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~22_combout\ = (\s_dados_ps2~19_combout\) # ((\s_dados_ps2~21_combout\ & (\s_dados_ps2~20_combout\)) # (!\s_dados_ps2~21_combout\ & ((s_dados_ps2(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_dados_ps2~19_combout\,
	datab => \s_dados_ps2~21_combout\,
	datac => \s_dados_ps2~20_combout\,
	datad => s_dados_ps2(1),
	combout => \s_dados_ps2~22_combout\);

-- Location: LCCOMB_X62_Y37_N0
\s_dados_ps2~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~23_combout\ = (\ps2|key_code\(5) & ((\s_dados_ps2~17_combout\ & ((\s_dados_ps2~22_combout\))) # (!\s_dados_ps2~17_combout\ & (\s_dados_ps2~10_combout\)))) # (!\ps2|key_code\(5) & (((\s_dados_ps2~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(5),
	datab => \s_dados_ps2~10_combout\,
	datac => \s_dados_ps2~17_combout\,
	datad => \s_dados_ps2~22_combout\,
	combout => \s_dados_ps2~23_combout\);

-- Location: LCCOMB_X58_Y37_N0
\s_dados_ps2[0]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2[0]~24_combout\ = (\ps2|valid_key_code~q\ & !\ps2|key_code\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|valid_key_code~q\,
	datac => \ps2|key_code\(7),
	combout => \s_dados_ps2[0]~24_combout\);

-- Location: FF_X62_Y37_N1
\s_dados_ps2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \s_dados_ps2~23_combout\,
	ena => \s_dados_ps2[0]~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_dados_ps2(1));

-- Location: LCCOMB_X65_Y37_N12
\Equal15~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal15~0_combout\ = (\ps2|key_code\(1) & \ps2|key_code\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(1),
	datad => \ps2|key_code\(0),
	combout => \Equal15~0_combout\);

-- Location: LCCOMB_X65_Y37_N8
\Equal3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal3~0_combout\ = (\Equal15~0_combout\ & (!\ps2|key_code\(2) & (!\ps2|key_code\(6) & !\ps2|key_code\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal15~0_combout\,
	datab => \ps2|key_code\(2),
	datac => \ps2|key_code\(6),
	datad => \ps2|key_code\(7),
	combout => \Equal3~0_combout\);

-- Location: LCCOMB_X65_Y37_N18
\Equal5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal5~0_combout\ = (\ps2|key_code\(5) & \Equal3~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(5),
	datac => \Equal3~0_combout\,
	combout => \Equal5~0_combout\);

-- Location: LCCOMB_X65_Y37_N4
\Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!\ps2|key_code\(1) & (\ps2|key_code\(2) & (!\ps2|key_code\(6) & !\ps2|key_code\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(1),
	datab => \ps2|key_code\(2),
	datac => \ps2|key_code\(6),
	datad => \ps2|key_code\(7),
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X65_Y37_N24
\Equal4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal4~0_combout\ = (\Equal0~0_combout\ & (\ps2|key_code\(5) & !\ps2|key_code\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal0~0_combout\,
	datac => \ps2|key_code\(5),
	datad => \ps2|key_code\(0),
	combout => \Equal4~0_combout\);

-- Location: LCCOMB_X65_Y37_N14
\s_isOctave~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_isOctave~4_combout\ = (\ps2|key_code\(4) & (((\ps2|key_code\(3)) # (!\Equal4~0_combout\)))) # (!\ps2|key_code\(4) & (!\Equal5~0_combout\ & ((!\Equal4~0_combout\) # (!\ps2|key_code\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(4),
	datab => \Equal5~0_combout\,
	datac => \ps2|key_code\(3),
	datad => \Equal4~0_combout\,
	combout => \s_isOctave~4_combout\);

-- Location: LCCOMB_X65_Y37_N0
\s_isOctave~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_isOctave~5_combout\ = (!\ps2|key_code\(5) & ((\Equal0~0_combout\) # (\Equal3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(5),
	datab => \Equal0~0_combout\,
	datac => \Equal3~0_combout\,
	combout => \s_isOctave~5_combout\);

-- Location: LCCOMB_X65_Y37_N10
\s_isOctave~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_isOctave~6_combout\ = (\ps2|key_code\(4) & (((!\ps2|key_code\(3))) # (!\s_isOctave~5_combout\))) # (!\ps2|key_code\(4) & (((\ps2|key_code\(3)) # (!\Equal4~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111101001111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(4),
	datab => \s_isOctave~5_combout\,
	datac => \ps2|key_code\(3),
	datad => \Equal4~0_combout\,
	combout => \s_isOctave~6_combout\);

-- Location: LCCOMB_X65_Y37_N20
\s_isOctave~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_isOctave~8_combout\ = (\ps2|key_code\(5) & (\ps2|key_code\(0) & \Equal0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(5),
	datab => \ps2|key_code\(0),
	datac => \Equal0~0_combout\,
	combout => \s_isOctave~8_combout\);

-- Location: LCCOMB_X65_Y37_N30
\s_isOctave~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_isOctave~9_combout\ = (\ps2|key_code\(3) & ((\Equal4~0_combout\))) # (!\ps2|key_code\(3) & (\s_isOctave~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \s_isOctave~8_combout\,
	datac => \ps2|key_code\(3),
	datad => \Equal4~0_combout\,
	combout => \s_isOctave~9_combout\);

-- Location: LCCOMB_X65_Y37_N22
\s_isOctave~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_isOctave~11_combout\ = ((!\s_isOctave~9_combout\ & ((!\ps2|key_code\(5)) # (!\Equal3~0_combout\)))) # (!\ps2|key_code\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(4),
	datab => \Equal3~0_combout\,
	datac => \ps2|key_code\(5),
	datad => \s_isOctave~9_combout\,
	combout => \s_isOctave~11_combout\);

-- Location: LCCOMB_X65_Y37_N26
\Equal13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal13~0_combout\ = (!\ps2|key_code\(5) & (!\ps2|key_code\(7) & (!\ps2|key_code\(4) & \ps2|key_code\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(5),
	datab => \ps2|key_code\(7),
	datac => \ps2|key_code\(4),
	datad => \ps2|key_code\(6),
	combout => \Equal13~0_combout\);

-- Location: LCCOMB_X66_Y37_N4
\s_dados_ps2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~4_combout\ = (\ps2|key_code\(3) & (\ps2|key_code\(2))) # (!\ps2|key_code\(3) & (!\ps2|key_code\(0) & (\ps2|key_code\(2) $ (\ps2|key_code\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(2),
	datab => \ps2|key_code\(1),
	datac => \ps2|key_code\(3),
	datad => \ps2|key_code\(0),
	combout => \s_dados_ps2~4_combout\);

-- Location: LCCOMB_X65_Y37_N6
\s_dados_ps2~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~5_combout\ = ((\ps2|key_code\(3) & ((\s_dados_ps2~4_combout\) # (!\Equal15~0_combout\))) # (!\ps2|key_code\(3) & ((!\s_dados_ps2~4_combout\)))) # (!\Equal13~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(3),
	datab => \Equal13~0_combout\,
	datac => \Equal15~0_combout\,
	datad => \s_dados_ps2~4_combout\,
	combout => \s_dados_ps2~5_combout\);

-- Location: LCCOMB_X66_Y37_N18
\s_dados_ps2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~8_combout\ = (\s_isOctave~11_combout\ & (\s_dados_ps2~5_combout\ & ((\s_isOctave~6_combout\) # (!\s_isOctave~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_isOctave~6_combout\,
	datab => \s_isOctave~11_combout\,
	datac => \s_dados_ps2~5_combout\,
	datad => \s_isOctave~4_combout\,
	combout => \s_dados_ps2~8_combout\);

-- Location: LCCOMB_X66_Y37_N26
\s_dados_ps2~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~9_combout\ = (\s_dados_ps2~8_combout\ & (((s_dados_ps2(2))) # (!\s_isOctave~4_combout\))) # (!\s_dados_ps2~8_combout\ & (((\Equal1~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_isOctave~4_combout\,
	datab => \Equal1~2_combout\,
	datac => s_dados_ps2(2),
	datad => \s_dados_ps2~8_combout\,
	combout => \s_dados_ps2~9_combout\);

-- Location: FF_X66_Y37_N27
\s_dados_ps2[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \s_dados_ps2~9_combout\,
	ena => \ps2|valid_key_code~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_dados_ps2(2));

-- Location: LCCOMB_X63_Y37_N8
\s_dados_ps2~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~40_combout\ = (!\ps2|key_code\(1) & (\ps2|key_code\(2) & (\ps2|key_code\(3) $ (\ps2|key_code\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(3),
	datab => \ps2|key_code\(1),
	datac => \ps2|key_code\(0),
	datad => \ps2|key_code\(2),
	combout => \s_dados_ps2~40_combout\);

-- Location: LCCOMB_X63_Y37_N24
\s_dados_ps2~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~39_combout\ = (\ps2|key_code\(1) & (((\ps2|key_code\(0) & !\ps2|key_code\(2))))) # (!\ps2|key_code\(1) & (!\ps2|key_code\(3) & (!\ps2|key_code\(0) & \ps2|key_code\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(3),
	datab => \ps2|key_code\(1),
	datac => \ps2|key_code\(0),
	datad => \ps2|key_code\(2),
	combout => \s_dados_ps2~39_combout\);

-- Location: LCCOMB_X63_Y37_N18
\s_dados_ps2~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~41_combout\ = (\s_dados_ps2~40_combout\) # ((\ps2|key_code\(6) & \s_dados_ps2~39_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(6),
	datac => \s_dados_ps2~40_combout\,
	datad => \s_dados_ps2~39_combout\,
	combout => \s_dados_ps2~41_combout\);

-- Location: LCCOMB_X63_Y37_N12
\s_dados_ps2~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~32_combout\ = (\ps2|key_code\(6) & (s_dados_ps2(0))) # (!\ps2|key_code\(6) & (((\Equal1~1_combout\ & \Equal1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(6),
	datab => s_dados_ps2(0),
	datac => \Equal1~1_combout\,
	datad => \Equal1~0_combout\,
	combout => \s_dados_ps2~32_combout\);

-- Location: LCCOMB_X63_Y37_N4
\s_dados_ps2~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~42_combout\ = (\s_dados_ps2~41_combout\ & ((\s_dados_ps2~39_combout\ & (s_dados_ps2(0))) # (!\s_dados_ps2~39_combout\ & ((\s_dados_ps2~32_combout\))))) # (!\s_dados_ps2~41_combout\ & ((s_dados_ps2(0)) # ((\s_dados_ps2~39_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_ps2(0),
	datab => \s_dados_ps2~41_combout\,
	datac => \s_dados_ps2~32_combout\,
	datad => \s_dados_ps2~39_combout\,
	combout => \s_dados_ps2~42_combout\);

-- Location: LCCOMB_X63_Y37_N10
\s_dados_ps2~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~33_combout\ = (\ps2|key_code\(3) & ((\ps2|key_code\(0) & (\ps2|key_code\(1) & !\ps2|key_code\(2))) # (!\ps2|key_code\(0) & (!\ps2|key_code\(1) & \ps2|key_code\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(0),
	datab => \ps2|key_code\(1),
	datac => \ps2|key_code\(3),
	datad => \ps2|key_code\(2),
	combout => \s_dados_ps2~33_combout\);

-- Location: LCCOMB_X62_Y37_N28
\s_dados_ps2~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~30_combout\ = (\ps2|key_code\(1) & (s_dados_ps2(0) & (!\ps2|key_code\(2) & \ps2|key_code\(0)))) # (!\ps2|key_code\(1) & (\ps2|key_code\(2) & (s_dados_ps2(0) $ (\ps2|key_code\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(1),
	datab => s_dados_ps2(0),
	datac => \ps2|key_code\(2),
	datad => \ps2|key_code\(0),
	combout => \s_dados_ps2~30_combout\);

-- Location: LCCOMB_X63_Y37_N2
\s_dados_ps2~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~31_combout\ = (s_dados_ps2(0) & (((!\ps2|key_code\(3))) # (!\s_dados_ps2~30_combout\))) # (!s_dados_ps2(0) & (\s_dados_ps2~30_combout\ & (!\ps2|key_code\(6) & \ps2|key_code\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010011010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_ps2(0),
	datab => \s_dados_ps2~30_combout\,
	datac => \ps2|key_code\(6),
	datad => \ps2|key_code\(3),
	combout => \s_dados_ps2~31_combout\);

-- Location: LCCOMB_X63_Y37_N14
\s_dados_ps2~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~34_combout\ = (\s_dados_ps2~31_combout\) # ((\s_dados_ps2~32_combout\ & ((\s_dados_ps2~33_combout\) # (s_dados_ps2(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_dados_ps2~33_combout\,
	datab => s_dados_ps2(0),
	datac => \s_dados_ps2~32_combout\,
	datad => \s_dados_ps2~31_combout\,
	combout => \s_dados_ps2~34_combout\);

-- Location: LCCOMB_X65_Y37_N2
\s_dados_ps2~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~35_combout\ = (\ps2|key_code\(1) & (!\ps2|key_code\(2) & (\ps2|key_code\(3) $ (!\ps2|key_code\(0))))) # (!\ps2|key_code\(1) & (\ps2|key_code\(2) & (!\ps2|key_code\(3) & !\ps2|key_code\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(1),
	datab => \ps2|key_code\(2),
	datac => \ps2|key_code\(3),
	datad => \ps2|key_code\(0),
	combout => \s_dados_ps2~35_combout\);

-- Location: LCCOMB_X65_Y37_N28
\s_dados_ps2~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~36_combout\ = (\ps2|key_code\(6) & \s_dados_ps2~35_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ps2|key_code\(6),
	datad => \s_dados_ps2~35_combout\,
	combout => \s_dados_ps2~36_combout\);

-- Location: LCCOMB_X62_Y37_N30
\s_dados_ps2~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~37_combout\ = (\s_dados_ps2~36_combout\ & (((\ps2|key_code\(2)) # (\Equal1~2_combout\)))) # (!\s_dados_ps2~36_combout\ & (s_dados_ps2(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_dados_ps2~36_combout\,
	datab => s_dados_ps2(0),
	datac => \ps2|key_code\(2),
	datad => \Equal1~2_combout\,
	combout => \s_dados_ps2~37_combout\);

-- Location: LCCOMB_X62_Y37_N14
\s_dados_ps2~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~38_combout\ = (\ps2|key_code\(5) & (((\ps2|key_code\(4))))) # (!\ps2|key_code\(5) & ((\ps2|key_code\(4) & (\s_dados_ps2~34_combout\)) # (!\ps2|key_code\(4) & ((\s_dados_ps2~37_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(5),
	datab => \s_dados_ps2~34_combout\,
	datac => \s_dados_ps2~37_combout\,
	datad => \ps2|key_code\(4),
	combout => \s_dados_ps2~38_combout\);

-- Location: LCCOMB_X65_Y37_N16
\s_dados_ps2~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~25_combout\ = (\ps2|key_code\(1) & ((\ps2|key_code\(2)) # (\ps2|key_code\(0)))) # (!\ps2|key_code\(1) & (\ps2|key_code\(2) & \ps2|key_code\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(1),
	datab => \ps2|key_code\(2),
	datad => \ps2|key_code\(0),
	combout => \s_dados_ps2~25_combout\);

-- Location: LCCOMB_X63_Y37_N26
\s_dados_ps2~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~26_combout\ = (!\ps2|key_code\(6) & ((\ps2|key_code\(2) & ((!\s_dados_ps2~25_combout\))) # (!\ps2|key_code\(2) & (\ps2|key_code\(3) & \s_dados_ps2~25_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(3),
	datab => \ps2|key_code\(2),
	datac => \ps2|key_code\(6),
	datad => \s_dados_ps2~25_combout\,
	combout => \s_dados_ps2~26_combout\);

-- Location: LCCOMB_X63_Y37_N20
\s_dados_ps2~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~27_combout\ = (\ps2|key_code\(6)) # ((\s_dados_ps2~25_combout\ & ((\ps2|key_code\(2)))) # (!\s_dados_ps2~25_combout\ & (\ps2|key_code\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(3),
	datab => \ps2|key_code\(2),
	datac => \ps2|key_code\(6),
	datad => \s_dados_ps2~25_combout\,
	combout => \s_dados_ps2~27_combout\);

-- Location: LCCOMB_X63_Y37_N22
\s_dados_ps2~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~44_combout\ = (\ps2|key_code\(3) & (((\Equal1~0_combout\)))) # (!\ps2|key_code\(3) & (\ps2|key_code\(1) & (\ps2|key_code\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ps2|key_code\(3),
	datab => \ps2|key_code\(1),
	datac => \ps2|key_code\(0),
	datad => \Equal1~0_combout\,
	combout => \s_dados_ps2~44_combout\);

-- Location: LCCOMB_X63_Y37_N30
\s_dados_ps2~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~28_combout\ = (\s_dados_ps2~26_combout\ & (\s_dados_ps2~27_combout\ & ((!\s_dados_ps2~44_combout\) # (!\Equal1~1_combout\)))) # (!\s_dados_ps2~26_combout\ & (!\s_dados_ps2~27_combout\ & ((\s_dados_ps2~44_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001100110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_dados_ps2~26_combout\,
	datab => \s_dados_ps2~27_combout\,
	datac => \Equal1~1_combout\,
	datad => \s_dados_ps2~44_combout\,
	combout => \s_dados_ps2~28_combout\);

-- Location: LCCOMB_X63_Y37_N16
\s_dados_ps2~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~29_combout\ = (\s_dados_ps2~28_combout\ & (((!\s_dados_ps2~26_combout\ & \Equal1~2_combout\)))) # (!\s_dados_ps2~28_combout\ & ((s_dados_ps2(0)) # ((\s_dados_ps2~26_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_dados_ps2~28_combout\,
	datab => s_dados_ps2(0),
	datac => \s_dados_ps2~26_combout\,
	datad => \Equal1~2_combout\,
	combout => \s_dados_ps2~29_combout\);

-- Location: LCCOMB_X62_Y37_N2
\s_dados_ps2~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~43_combout\ = (\s_dados_ps2~38_combout\ & ((\s_dados_ps2~42_combout\) # ((!\ps2|key_code\(5))))) # (!\s_dados_ps2~38_combout\ & (((\ps2|key_code\(5) & \s_dados_ps2~29_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_dados_ps2~42_combout\,
	datab => \s_dados_ps2~38_combout\,
	datac => \ps2|key_code\(5),
	datad => \s_dados_ps2~29_combout\,
	combout => \s_dados_ps2~43_combout\);

-- Location: FF_X62_Y37_N3
\s_dados_ps2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \s_dados_ps2~43_combout\,
	ena => \s_dados_ps2[0]~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_dados_ps2(0));

-- Location: LCCOMB_X66_Y37_N6
\s_isOctave~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_isOctave~7_combout\ = (\s_isOctave~6_combout\ & \s_isOctave~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_isOctave~6_combout\,
	datad => \s_isOctave~4_combout\,
	combout => \s_isOctave~7_combout\);

-- Location: LCCOMB_X66_Y37_N0
\s_dados_ps2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~6_combout\ = (\s_dados_ps2~5_combout\ & (((\s_isOctave~7_combout\ & s_dados_ps2(3))) # (!\s_isOctave~11_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_isOctave~7_combout\,
	datab => \s_isOctave~11_combout\,
	datac => \s_dados_ps2~5_combout\,
	datad => s_dados_ps2(3),
	combout => \s_dados_ps2~6_combout\);

-- Location: LCCOMB_X66_Y37_N16
\s_dados_ps2~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_dados_ps2~7_combout\ = (\s_dados_ps2~6_combout\) # ((\Equal1~2_combout\ & ((!\s_dados_ps2~5_combout\) # (!\s_isOctave~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_isOctave~7_combout\,
	datab => \Equal1~2_combout\,
	datac => \s_dados_ps2~5_combout\,
	datad => \s_dados_ps2~6_combout\,
	combout => \s_dados_ps2~7_combout\);

-- Location: FF_X66_Y37_N17
\s_dados_ps2[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \s_dados_ps2~7_combout\,
	ena => \ps2|valid_key_code~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_dados_ps2(3));

-- Location: LCCOMB_X76_Y40_N0
\bemol~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bemol~0_combout\ = (s_dados_ps2(2) & ((s_dados_ps2(1) & (!s_dados_ps2(0) & !s_dados_ps2(3))) # (!s_dados_ps2(1) & (s_dados_ps2(0) & s_dados_ps2(3))))) # (!s_dados_ps2(2) & ((s_dados_ps2(0) $ (s_dados_ps2(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100001100111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_ps2(1),
	datab => s_dados_ps2(2),
	datac => s_dados_ps2(0),
	datad => s_dados_ps2(3),
	combout => \bemol~0_combout\);

-- Location: LCCOMB_X76_Y40_N10
\Display1|decOut_n[0]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Display1|decOut_n[0]~14_combout\ = (s_dados_ps2(1) & ((s_dados_ps2(3)) # ((!s_dados_ps2(2) & !s_dados_ps2(0))))) # (!s_dados_ps2(1) & (s_dados_ps2(0) & (s_dados_ps2(2) $ (!s_dados_ps2(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_ps2(1),
	datab => s_dados_ps2(2),
	datac => s_dados_ps2(0),
	datad => s_dados_ps2(3),
	combout => \Display1|decOut_n[0]~14_combout\);

-- Location: LCCOMB_X76_Y40_N4
\Display1|decOut_n[1]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \Display1|decOut_n[1]~15_combout\ = (s_dados_ps2(2) & ((s_dados_ps2(1) $ (!s_dados_ps2(0))) # (!s_dados_ps2(3)))) # (!s_dados_ps2(2) & (s_dados_ps2(1) $ (((!s_dados_ps2(0) & !s_dados_ps2(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010011011101101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_ps2(1),
	datab => s_dados_ps2(2),
	datac => s_dados_ps2(0),
	datad => s_dados_ps2(3),
	combout => \Display1|decOut_n[1]~15_combout\);

-- Location: LCCOMB_X76_Y40_N24
\Display1|decOut_n[2]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \Display1|decOut_n[2]~17_combout\ = (s_dados_ps2(2) & (s_dados_ps2(1) $ (((!s_dados_ps2(3)) # (!s_dados_ps2(0)))))) # (!s_dados_ps2(2) & (!s_dados_ps2(3) & (s_dados_ps2(1) $ (!s_dados_ps2(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010001100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_ps2(1),
	datab => s_dados_ps2(2),
	datac => s_dados_ps2(0),
	datad => s_dados_ps2(3),
	combout => \Display1|decOut_n[2]~17_combout\);

-- Location: LCCOMB_X76_Y40_N22
\Display1|decOut_n[3]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Display1|decOut_n[3]~16_combout\ = (s_dados_ps2(2) & (s_dados_ps2(0) & (s_dados_ps2(1) $ (!s_dados_ps2(3))))) # (!s_dados_ps2(2) & (!s_dados_ps2(1) & ((s_dados_ps2(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_ps2(1),
	datab => s_dados_ps2(2),
	datac => s_dados_ps2(0),
	datad => s_dados_ps2(3),
	combout => \Display1|decOut_n[3]~16_combout\);

-- Location: LCCOMB_X76_Y40_N26
\Display1|decOut_n[4]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Display1|decOut_n[4]~18_combout\ = (s_dados_ps2(1) & (s_dados_ps2(2) & (s_dados_ps2(0) & s_dados_ps2(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_ps2(1),
	datab => s_dados_ps2(2),
	datac => s_dados_ps2(0),
	datad => s_dados_ps2(3),
	combout => \Display1|decOut_n[4]~18_combout\);

-- Location: LCCOMB_X76_Y40_N28
\Display1|decOut_n[5]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \Display1|decOut_n[5]~19_combout\ = (s_dados_ps2(2) & (s_dados_ps2(3) & ((s_dados_ps2(1)) # (s_dados_ps2(0))))) # (!s_dados_ps2(2) & (!s_dados_ps2(3) & (s_dados_ps2(1) $ (s_dados_ps2(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_ps2(1),
	datab => s_dados_ps2(2),
	datac => s_dados_ps2(0),
	datad => s_dados_ps2(3),
	combout => \Display1|decOut_n[5]~19_combout\);

-- Location: LCCOMB_X76_Y40_N14
\Display1|decOut_n[6]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Display1|decOut_n[6]~20_combout\ = (s_dados_ps2(1) & (s_dados_ps2(2) & (s_dados_ps2(0) & s_dados_ps2(3)))) # (!s_dados_ps2(1) & (!s_dados_ps2(0) & (s_dados_ps2(2) $ (!s_dados_ps2(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_dados_ps2(1),
	datab => s_dados_ps2(2),
	datac => s_dados_ps2(0),
	datad => s_dados_ps2(3),
	combout => \Display1|decOut_n[6]~20_combout\);

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

-- Location: LCCOMB_X53_Y38_N8
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

-- Location: FF_X53_Y38_N9
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

-- Location: FF_X53_Y38_N19
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

-- Location: LCCOMB_X53_Y38_N18
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

-- Location: LCCOMB_X66_Y37_N30
\s_isOctave~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_isOctave~10_combout\ = (\s_isOctave~q\ & ((\Equal1~2_combout\) # ((\s_isOctave~7_combout\ & \s_isOctave~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_isOctave~7_combout\,
	datab => \s_isOctave~11_combout\,
	datac => \s_isOctave~q\,
	datad => \Equal1~2_combout\,
	combout => \s_isOctave~10_combout\);

-- Location: LCCOMB_X66_Y37_N12
\s_isOctave~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_isOctave~12_combout\ = (\s_isOctave~10_combout\) # ((!\s_dados_ps2~5_combout\ & ((!\Equal1~1_combout\) # (!\Equal1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_isOctave~10_combout\,
	datab => \s_dados_ps2~5_combout\,
	datac => \Equal1~0_combout\,
	datad => \Equal1~1_combout\,
	combout => \s_isOctave~12_combout\);

-- Location: FF_X66_Y37_N13
s_isOctave : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \s_isOctave~12_combout\,
	ena => \ps2|valid_key_code~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s_isOctave~q\);

-- Location: LCCOMB_X52_Y36_N20
\aio|n_bits[0]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|n_bits[0]~6_combout\ = \aio|n_bits\(0) $ (VCC)
-- \aio|n_bits[0]~7\ = CARRY(\aio|n_bits\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \aio|n_bits\(0),
	datad => VCC,
	combout => \aio|n_bits[0]~6_combout\,
	cout => \aio|n_bits[0]~7\);

-- Location: LCCOMB_X52_Y36_N22
\aio|n_bits[1]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|n_bits[1]~11_combout\ = (\aio|n_bits\(1) & (!\aio|n_bits[0]~7\)) # (!\aio|n_bits\(1) & ((\aio|n_bits[0]~7\) # (GND)))
-- \aio|n_bits[1]~12\ = CARRY((!\aio|n_bits[0]~7\) # (!\aio|n_bits\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \aio|n_bits\(1),
	datad => VCC,
	cin => \aio|n_bits[0]~7\,
	combout => \aio|n_bits[1]~11_combout\,
	cout => \aio|n_bits[1]~12\);

-- Location: LCCOMB_X52_Y36_N24
\aio|n_bits[2]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|n_bits[2]~13_combout\ = (\aio|n_bits\(2) & (\aio|n_bits[1]~12\ $ (GND))) # (!\aio|n_bits\(2) & (!\aio|n_bits[1]~12\ & VCC))
-- \aio|n_bits[2]~14\ = CARRY((\aio|n_bits\(2) & !\aio|n_bits[1]~12\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \aio|n_bits\(2),
	datad => VCC,
	cin => \aio|n_bits[1]~12\,
	combout => \aio|n_bits[2]~13_combout\,
	cout => \aio|n_bits[2]~14\);

-- Location: FF_X52_Y36_N25
\aio|n_bits[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|n_bits[2]~13_combout\,
	sclr => \aio|process_0~0_combout\,
	ena => \aio|n_bits[5]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|n_bits\(2));

-- Location: LCCOMB_X52_Y36_N26
\aio|n_bits[3]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|n_bits[3]~15_combout\ = (\aio|n_bits\(3) & (!\aio|n_bits[2]~14\)) # (!\aio|n_bits\(3) & ((\aio|n_bits[2]~14\) # (GND)))
-- \aio|n_bits[3]~16\ = CARRY((!\aio|n_bits[2]~14\) # (!\aio|n_bits\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \aio|n_bits\(3),
	datad => VCC,
	cin => \aio|n_bits[2]~14\,
	combout => \aio|n_bits[3]~15_combout\,
	cout => \aio|n_bits[3]~16\);

-- Location: FF_X52_Y36_N27
\aio|n_bits[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|n_bits[3]~15_combout\,
	sclr => \aio|process_0~0_combout\,
	ena => \aio|n_bits[5]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|n_bits\(3));

-- Location: LCCOMB_X52_Y36_N28
\aio|n_bits[4]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|n_bits[4]~17_combout\ = (\aio|n_bits\(4) & (\aio|n_bits[3]~16\ $ (GND))) # (!\aio|n_bits\(4) & (!\aio|n_bits[3]~16\ & VCC))
-- \aio|n_bits[4]~18\ = CARRY((\aio|n_bits\(4) & !\aio|n_bits[3]~16\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \aio|n_bits\(4),
	datad => VCC,
	cin => \aio|n_bits[3]~16\,
	combout => \aio|n_bits[4]~17_combout\,
	cout => \aio|n_bits[4]~18\);

-- Location: FF_X52_Y36_N29
\aio|n_bits[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|n_bits[4]~17_combout\,
	sclr => \aio|process_0~0_combout\,
	ena => \aio|n_bits[5]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|n_bits\(4));

-- Location: LCCOMB_X52_Y36_N30
\aio|n_bits[5]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|n_bits[5]~19_combout\ = \aio|n_bits\(5) $ (\aio|n_bits[4]~18\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \aio|n_bits\(5),
	cin => \aio|n_bits[4]~18\,
	combout => \aio|n_bits[5]~19_combout\);

-- Location: FF_X52_Y36_N31
\aio|n_bits[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|n_bits[5]~19_combout\,
	sclr => \aio|process_0~0_combout\,
	ena => \aio|n_bits[5]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|n_bits\(5));

-- Location: LCCOMB_X52_Y36_N10
\aio|n_bits[5]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|n_bits[5]~9_combout\ = (\aio|n_bits\(5) & !\aio|n_bits\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \aio|n_bits\(5),
	datad => \aio|n_bits\(4),
	combout => \aio|n_bits[5]~9_combout\);

-- Location: LCCOMB_X52_Y36_N16
\aio|n_bits[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|n_bits[5]~8_combout\ = (!\aio|n_bits\(3) & (!\aio|n_bits\(2) & (!\aio|n_bits\(1) & !\aio|n_bits\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|n_bits\(3),
	datab => \aio|n_bits\(2),
	datac => \aio|n_bits\(1),
	datad => \aio|n_bits\(0),
	combout => \aio|n_bits[5]~8_combout\);

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

-- Location: FF_X53_Y37_N1
\aio|bit_clock_0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \aud_bclk~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|bit_clock_0~q\);

-- Location: FF_X53_Y37_N13
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

-- Location: LCCOMB_X53_Y37_N12
\aio|valid~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|valid~0_combout\ = (!\aio|bit_clock_1~q\ & \aio|bit_clock_0~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \aio|bit_clock_1~q\,
	datad => \aio|bit_clock_0~q\,
	combout => \aio|valid~0_combout\);

-- Location: LCCOMB_X52_Y36_N12
\aio|n_bits[5]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|n_bits[5]~10_combout\ = (\aio|process_0~0_combout\) # ((\aio|valid~0_combout\ & ((!\aio|n_bits[5]~8_combout\) # (!\aio|n_bits[5]~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|n_bits[5]~9_combout\,
	datab => \aio|n_bits[5]~8_combout\,
	datac => \aio|valid~0_combout\,
	datad => \aio|process_0~0_combout\,
	combout => \aio|n_bits[5]~10_combout\);

-- Location: FF_X52_Y36_N21
\aio|n_bits[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|n_bits[0]~6_combout\,
	sclr => \aio|process_0~0_combout\,
	ena => \aio|n_bits[5]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|n_bits\(0));

-- Location: FF_X52_Y36_N23
\aio|n_bits[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|n_bits[1]~11_combout\,
	sclr => \aio|process_0~0_combout\,
	ena => \aio|n_bits[5]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|n_bits\(1));

-- Location: LCCOMB_X52_Y36_N6
\aio|valid~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|valid~1_combout\ = (\aio|n_bits\(3) & (\aio|n_bits\(2) & (!\aio|n_bits\(5) & \aio|n_bits\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|n_bits\(3),
	datab => \aio|n_bits\(2),
	datac => \aio|n_bits\(5),
	datad => \aio|n_bits\(4),
	combout => \aio|valid~1_combout\);

-- Location: LCCOMB_X52_Y36_N18
\aio|valid~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|valid~2_combout\ = (\aio|n_bits\(1) & (\aio|n_bits\(0) & (\aio|valid~0_combout\ & \aio|valid~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|n_bits\(1),
	datab => \aio|n_bits\(0),
	datac => \aio|valid~0_combout\,
	datad => \aio|valid~1_combout\,
	combout => \aio|valid~2_combout\);

-- Location: FF_X52_Y36_N19
\aio|valid\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|valid~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|valid~q\);

-- Location: LCCOMB_X58_Y37_N26
\s_count[0]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[0]~9_combout\ = s_count(0) $ (((!\s_isOctave~q\ & \aio|valid~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \s_isOctave~q\,
	datac => s_count(0),
	datad => \aio|valid~q\,
	combout => \s_count[0]~9_combout\);

-- Location: FF_X58_Y37_N27
\s_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \s_count[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(0));

-- Location: LCCOMB_X58_Y37_N28
\Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = (!\s_isOctave~q\ & s_count(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \s_isOctave~q\,
	datac => s_count(0),
	combout => \Add0~0_combout\);

-- Location: LCCOMB_X58_Y37_N6
\s_count[1]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[1]~11_cout\ = CARRY((\Add0~0_combout\ & !\s_isOctave~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~0_combout\,
	datab => \s_isOctave~q\,
	datad => VCC,
	cout => \s_count[1]~11_cout\);

-- Location: LCCOMB_X58_Y37_N8
\s_count[1]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[1]~12_combout\ = (s_count(1) & ((\s_isOctave~q\ & (\s_count[1]~11_cout\ & VCC)) # (!\s_isOctave~q\ & (!\s_count[1]~11_cout\)))) # (!s_count(1) & ((\s_isOctave~q\ & (!\s_count[1]~11_cout\)) # (!\s_isOctave~q\ & ((\s_count[1]~11_cout\) # (GND)))))
-- \s_count[1]~13\ = CARRY((s_count(1) & (!\s_isOctave~q\ & !\s_count[1]~11_cout\)) # (!s_count(1) & ((!\s_count[1]~11_cout\) # (!\s_isOctave~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(1),
	datab => \s_isOctave~q\,
	datad => VCC,
	cin => \s_count[1]~11_cout\,
	combout => \s_count[1]~12_combout\,
	cout => \s_count[1]~13\);

-- Location: FF_X58_Y37_N9
\s_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \s_count[1]~12_combout\,
	ena => \aio|valid~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(1));

-- Location: LCCOMB_X58_Y37_N10
\s_count[2]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[2]~14_combout\ = (s_count(2) & (\s_count[1]~13\ $ (GND))) # (!s_count(2) & (!\s_count[1]~13\ & VCC))
-- \s_count[2]~15\ = CARRY((s_count(2) & !\s_count[1]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(2),
	datad => VCC,
	cin => \s_count[1]~13\,
	combout => \s_count[2]~14_combout\,
	cout => \s_count[2]~15\);

-- Location: FF_X58_Y37_N11
\s_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \s_count[2]~14_combout\,
	ena => \aio|valid~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(2));

-- Location: LCCOMB_X58_Y37_N12
\s_count[3]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[3]~16_combout\ = (s_count(3) & (!\s_count[2]~15\)) # (!s_count(3) & ((\s_count[2]~15\) # (GND)))
-- \s_count[3]~17\ = CARRY((!\s_count[2]~15\) # (!s_count(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(3),
	datad => VCC,
	cin => \s_count[2]~15\,
	combout => \s_count[3]~16_combout\,
	cout => \s_count[3]~17\);

-- Location: FF_X58_Y37_N13
\s_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \s_count[3]~16_combout\,
	ena => \aio|valid~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(3));

-- Location: LCCOMB_X58_Y37_N14
\s_count[4]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[4]~18_combout\ = (s_count(4) & (\s_count[3]~17\ $ (GND))) # (!s_count(4) & (!\s_count[3]~17\ & VCC))
-- \s_count[4]~19\ = CARRY((s_count(4) & !\s_count[3]~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_count(4),
	datad => VCC,
	cin => \s_count[3]~17\,
	combout => \s_count[4]~18_combout\,
	cout => \s_count[4]~19\);

-- Location: FF_X58_Y37_N15
\s_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \s_count[4]~18_combout\,
	ena => \aio|valid~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(4));

-- Location: LCCOMB_X58_Y37_N16
\s_count[5]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[5]~20_combout\ = (s_count(5) & (!\s_count[4]~19\)) # (!s_count(5) & ((\s_count[4]~19\) # (GND)))
-- \s_count[5]~21\ = CARRY((!\s_count[4]~19\) # (!s_count(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_count(5),
	datad => VCC,
	cin => \s_count[4]~19\,
	combout => \s_count[5]~20_combout\,
	cout => \s_count[5]~21\);

-- Location: FF_X58_Y37_N17
\s_count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \s_count[5]~20_combout\,
	ena => \aio|valid~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(5));

-- Location: LCCOMB_X58_Y37_N18
\s_count[6]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[6]~22_combout\ = (s_count(6) & (\s_count[5]~21\ $ (GND))) # (!s_count(6) & (!\s_count[5]~21\ & VCC))
-- \s_count[6]~23\ = CARRY((s_count(6) & !\s_count[5]~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_count(6),
	datad => VCC,
	cin => \s_count[5]~21\,
	combout => \s_count[6]~22_combout\,
	cout => \s_count[6]~23\);

-- Location: FF_X58_Y37_N19
\s_count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \s_count[6]~22_combout\,
	ena => \aio|valid~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(6));

-- Location: LCCOMB_X58_Y37_N20
\s_count[7]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[7]~24_combout\ = (s_count(7) & (!\s_count[6]~23\)) # (!s_count(7) & ((\s_count[6]~23\) # (GND)))
-- \s_count[7]~25\ = CARRY((!\s_count[6]~23\) # (!s_count(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_count(7),
	datad => VCC,
	cin => \s_count[6]~23\,
	combout => \s_count[7]~24_combout\,
	cout => \s_count[7]~25\);

-- Location: FF_X58_Y37_N21
\s_count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \s_count[7]~24_combout\,
	ena => \aio|valid~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(7));

-- Location: LCCOMB_X58_Y37_N22
\s_count[8]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[8]~26_combout\ = (s_count(8) & (\s_count[7]~25\ $ (GND))) # (!s_count(8) & (!\s_count[7]~25\ & VCC))
-- \s_count[8]~27\ = CARRY((s_count(8) & !\s_count[7]~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_count(8),
	datad => VCC,
	cin => \s_count[7]~25\,
	combout => \s_count[8]~26_combout\,
	cout => \s_count[8]~27\);

-- Location: FF_X58_Y37_N23
\s_count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \s_count[8]~26_combout\,
	ena => \aio|valid~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(8));

-- Location: LCCOMB_X58_Y37_N24
\s_count[9]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[9]~28_combout\ = \s_count[8]~27\ $ (s_count(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => s_count(9),
	cin => \s_count[8]~27\,
	combout => \s_count[9]~28_combout\);

-- Location: FF_X58_Y37_N25
\s_count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \s_count[9]~28_combout\,
	ena => \aio|valid~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(9));

-- Location: M9K_X51_Y38_N0
\rom|Mux15_rtl_0|auto_generated|ram_block1a31\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"1FFFFFE000000FFFFFF000000FFFFFF0000007FFFFF8000007FFFFFC000003FFFFFC000001FFFFFE000001FFFFFE000000FFFFFF000000FFFFFF8000007FFFFF8000003FFFFFC000003FFFFFC000001FFFFFE000001FFFFFF000000FFFFFF0000007FFFFF8000007FFFFF8000003FFFFFC000003FFFFFE000001FFFFFE000000FFFFF0000007FFFFFE0000007FFFFFE000000FFFFFFC000000FFFFFF8000001FFFFFF8000001FFFFFF0000003FFFFFF0000003FFFFFE0000007FFFFFE0000007FFFFFC000000FFFFFFC000000FFFFFF8000001FFFFFF8000001FFFFFF0000003FFFFFF0000003FFFFFE0000007FFFFFE0000007FFFFFC000000FFFFFFC000000",
	mem_init0 => X"FFFC0000003FFFFFF8000000FFFFFFE0000001FFFFFFC0000007FFFFFF8000000FFFFFFE0000003FFFFFFC0000007FFFFFF0000000FFFFFFE0000003FFFFFF80000007FFFFFF0000001FFFFFFC0000003FFFFFF8000000FFFFFFE0000001FFFFFFC0000007FFFFFF8000000FFFFFFE0000003FFFFFFC0000007FFFFFF0000000FFF00000007FFFFFFC0000001FFFFFFF00000007FFFFFFC0000003FFFFFFE0000000FFFFFFF80000003FFFFFFE0000000FFFFFFF80000003FFFFFFC0000001FFFFFFF00000007FFFFFFC0000001FFFFFFF00000007FFFFFFC0000001FFFFFFE0000000FFFFFFF80000003FFFFFFE0000000FFFFFFF80000003FFFFFFE0000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "AudioSynth.AudioSynth0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sound_rom:rom|altsyncram:Mux15_rtl_0|altsyncram_cf01:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 15,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	ena0 => s_dados_ps2(3),
	portaaddr => \rom|Mux15_rtl_0|auto_generated|ram_block1a31_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|Mux15_rtl_0|auto_generated|ram_block1a31_PORTADATAOUT_bus\);

-- Location: FF_X53_Y36_N19
\rom|Mux15_rtl_0|auto_generated|address_reg_a[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => s_dados_ps2(3),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rom|Mux15_rtl_0|auto_generated|address_reg_a\(0));

-- Location: M9K_X37_Y39_N0
\rom|Mux15_rtl_0|auto_generated|ram_block1a15\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"FFF80000000FFFFFFFE00000007FFFFFFF00000003FFFFFFF80000000FFFFFFFC00000007FFFFFFE00000003FFFFFFF80000001FFFFFFFC0000000FFFFFFFE00000003FFFFFFF00000001FFFFFFFC0000000FFFFFFFE00000007FFFFFFF00000001FFFFFFF80000000FFFFFFFC00000007FFFFFFF00000003FFFFFFF80000000FFFFC00000001FFFFFFFE00000001FFFFFFFF00000000FFFFFFFF800000007FFFFFFFC00000003FFFFFFFC00000001FFFFFFFE00000000FFFFFFFF000000007FFFFFFF800000007FFFFFFFC00000003FFFFFFFE00000001FFFFFFFF00000000FFFFFFFF000000007FFFFFFF800000003FFFFFFFC00000001FFFFFFFE00000000",
	mem_init2 => X"FFFFFFE000000007FFFFFFFF000000003FFFFFFFF000000001FFFFFFFF800000000FFFFFFFFC00000000FFFFFFFFE000000007FFFFFFFE000000003FFFFFFFF000000003FFFFFFFF800000001FFFFFFFFC00000000FFFFFFFFC000000007FFFFFFFE000000007FFFFFFFF000000003FFFFFFFF000000001FFFFFFFF8000000000FFFFFFFFF8000000007FFFFFFFF8000000003FFFFFFFFC000000001FFFFFFFFE000000001FFFFFFFFF000000000FFFFFFFFF8000000007FFFFFFFF8000000003FFFFFFFFC000000001FFFFFFFFE000000001FFFFFFFFF000000000FFFFFFFFF8000000007FFFFFFFF8000000003FFFFFFFFC000000001FFFFFFFFE000000000",
	mem_init1 => X"000007FFFFFFFFE0000000003FFFFFFFFF0000000001FFFFFFFFFC000000000FFFFFFFFFE0000000007FFFFFFFFF0000000003FFFFFFFFF8000000000FFFFFFFFFC0000000007FFFFFFFFE0000000003FFFFFFFFF0000000001FFFFFFFFFC000000000FFFFFFFFFE0000000007FFFFFFFFF0000000003FFFFFFFFF8000000000C0000000001FFFFFFFFFF00000000007FFFFFFFFF80000000003FFFFFFFFFE0000000000FFFFFFFFFF80000000003FFFFFFFFFE0000000001FFFFFFFFFF00000000007FFFFFFFFFC0000000001FFFFFFFFFF00000000007FFFFFFFFF80000000003FFFFFFFFFE0000000000FFFFFFFFFF80000000003FFFFFFFFFE0000000000",
	mem_init0 => X"FFFFFFF00000000001FFFFFFFFFFC00000000003FFFFFFFFFF80000000000FFFFFFFFFFF00000000001FFFFFFFFFFC00000000007FFFFFFFFFF80000000000FFFFFFFFFFE00000000001FFFFFFFFFFC00000000007FFFFFFFFFF00000000000FFFFFFFFFFE00000000003FFFFFFFFFFC00000000007FFFFFFFFFF000000000000003FFFFFFFFFFF000000000003FFFFFFFFFFF000000000003FFFFFFFFFFF000000000003FFFFFFFFFFF000000000007FFFFFFFFFFE000000000007FFFFFFFFFFE000000000007FFFFFFFFFFE000000000007FFFFFFFFFFC00000000000FFFFFFFFFFFC00000000000FFFFFFFFFFFC00000000000FFFFFFFFFFFC00000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "AudioSynth.AudioSynth0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sound_rom:rom|altsyncram:Mux15_rtl_0|altsyncram_cf01:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 15,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	ena0 => ALT_INV_s_dados_ps2(3),
	portaaddr => \rom|Mux15_rtl_0|auto_generated|ram_block1a15_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|Mux15_rtl_0|auto_generated|ram_block1a15_PORTADATAOUT_bus\);

-- Location: LCCOMB_X52_Y38_N8
\aio|dac_data~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~62_combout\ = (\aio|process_0~0_combout\ & ((\rom|Mux15_rtl_0|auto_generated|address_reg_a\(0) & (\rom|Mux15_rtl_0|auto_generated|ram_block1a31~portadataout\)) # (!\rom|Mux15_rtl_0|auto_generated|address_reg_a\(0) & 
-- ((\rom|Mux15_rtl_0|auto_generated|ram_block1a15~portadataout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|process_0~0_combout\,
	datab => \rom|Mux15_rtl_0|auto_generated|ram_block1a31~portadataout\,
	datac => \rom|Mux15_rtl_0|auto_generated|address_reg_a\(0),
	datad => \rom|Mux15_rtl_0|auto_generated|ram_block1a15~portadataout\,
	combout => \aio|dac_data~62_combout\);

-- Location: M9K_X78_Y40_N0
\rom|Mux15_rtl_0|auto_generated|ram_block1a30\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"1E0001E1FFFF0F0000F0FFFF0F0000F07FFF878000787FFF8780003C3FFFC3C0003C3FFFE1E0001E1FFFE1E0001E0FFFF0F0000F0FFFF0F0000787FFF878000787FFFC3C0003C3FFFC3C0003C3FFFE1E0001E1FFFE1E0000F0FFFF0F0000F0FFFF078000787FFF878000787FFFC3C0003C3FFFC3C0001E1FFFE1E0001E1FFFE00001F0FFFF87C0001E1FFFF0780003E1FFFF0F80003C3FFFE0F0000783FFFE1F0000787FFFC1E0000F07FFFC3C0000F0FFFF83C0001E0FFFF8780001E1FFFF0780003C1FFFF0F00003C3FFFE0F0000783FFFE1E0000787FFFC1E0000F07FFFC3C0000F0FFFF83C0001E0FFFF8780003E1FFFF0780003C1FFFF0F00007C3FFFE0",
	mem_init0 => X"003C1FFFF83C0000F83FFFF0F80001E0FFFFC1E00007C1FFFF87C0000F87FFFE0F00001E0FFFFC3E00007C3FFFF07C0000F07FFFE0F00003E1FFFFC3E0000783FFFF0780001F0FFFFE1F00003C1FFFF83C0000F87FFFF0F80001E0FFFFC1E00007C1FFFF87C0000F87FFFE0F00001E0FFFFC3E00007C3FFFF07C0000F07FFFE001F07FFFF07C00007C1FFFFC1F00001F07FFFF07800007C3FFFFC3E00001E0FFFFE0F80000F83FFFF83E00003E0FFFFE0F80000F83FFFF83C00003C1FFFFE1F00001F07FFFF07C00007C1FFFFC1F00001F07FFFF07C00007C3FFFFC1E00001E0FFFFF0F80000F83FFFF83E00003E0FFFFE0F80000F83FFFF83E00003E1FFFFE0",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "AudioSynth.AudioSynth0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sound_rom:rom|altsyncram:Mux15_rtl_0|altsyncram_cf01:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 14,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	ena0 => s_dados_ps2(3),
	portaaddr => \rom|Mux15_rtl_0|auto_generated|ram_block1a30_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|Mux15_rtl_0|auto_generated|ram_block1a30_PORTADATAOUT_bus\);

-- Location: M9K_X64_Y36_N0
\rom|Mux15_rtl_0|auto_generated|ram_block1a14\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00F83FFFFE0F800007E0FFFFF07C00001F07FFFF83E00000F83FFFFC0F800007C1FFFFF07C00003E07FFFF83E00000F83FFFFC1F000007C1FFFFE0FC00003E0FFFFF83E00001F07FFFFC1F00000FC1FFFFE0F800003E0FFFFF07C00001F07FFFF81F00000F83FFFFE0F800007C0FFFFF07C00001F07FFFF83E00000F83FFFFC00007C1FFFFF81F000003E0FFFFFC1F800003F07FFFFE0FC00001F83FFFFF07E00000FC1FFFFF83E000007C0FFFFF81F000003E07FFFFC0F800001F03FFFFE07C00000F83FFFFF07E00000FC1FFFFF83F000007E0FFFFFC1F800003F07FFFFE0F800001F03FFFFE07C00000F81FFFFF03E000007C0FFFFF81F000003E0FFFFFC0",
	mem_init2 => X"000007E07FFFFF07E000003F07FFFFF03F000001F03FFFFF81F800001F81FFFFFC0F800000FC0FFFFFE0FC000007E0FFFFFE07E000003E07FFFFF03E000003F03FFFFF83F000001F81FFFFF81F800000FC1FFFFFC0FC000007C0FFFFFE07C000007E07FFFFF07E000003F07FFFFF03F000001F03FFFFF81F800001F81FFFFFC00FC000001F81FFFFFE07E000001F81FFFFFF03F000000FC0FFFFFF81F8000007E07FFFFF81F8000003F03FFFFFC0FC000001F81FFFFFE07E000001F80FFFFFF03F000000FC0FFFFFF81F8000007E07FFFFF81FC000003F03FFFFFC0FC000001F81FFFFFE07E000001F80FFFFFF03F000000FC0FFFFFF81F8000007E07FFFFF80",
	mem_init1 => X"FFFC07E0000007E03FFFFFE03F0000003F01FFFFFF81F8000001FC0FFFFFFC0FE000000FE07FFFFFE07F0000007F03FFFFFF03F8000001F81FFFFFF80FC000000FC07FFFFFC07E0000007E03FFFFFE03F0000003F01FFFFFF81F8000001FC0FFFFFFC0FE000000FE07FFFFFE07F0000007F03FFFFFF03F8000001F81FFFFFF80C07FFFFFF01FC0000007F03FFFFFFC07E0000001F80FFFFFFE03F8000000FE03FFFFFF80FE0000003F80FFFFFFE03F0000000FE07FFFFFF81FC0000007F01FFFFFFC07F0000001FC07FFFFFF01FC0000007F01FFFFFFC07E0000001F80FFFFFFF03F8000000FE03FFFFFF80FE0000003F80FFFFFFE03F8000000FE07FFFFFF80",
	mem_init0 => X"000007F01FFFFFFF01FC0000001FC03FFFFFFC03F80000003F80FFFFFFF80FE0000000FF01FFFFFFF01FC0000001FC07FFFFFFC07F80000007F80FFFFFFF80FE0000000FE03FFFFFFE01FC0000001FC07FFFFFFC07F00000007F00FFFFFFF80FE0000000FE03FFFFFFE03FC0000003FC07FFFFFFC07F00000007F01FFFFFFF00FE03FC00000007F00FFFFFFFE03FC0000000FF00FFFFFFFC03FC0000000FF01FFFFFFFC03F80000000FF01FFFFFFFC07F80000000FE01FFFFFFF807F80000001FE01FFFFFFF807F00000001FE03FFFFFFF807F00000001FC03FFFFFFF80FF00000001FC03FFFFFFF00FF00000003FC03FFFFFFF00FE00000003FC07FFFFFFF00",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "AudioSynth.AudioSynth0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sound_rom:rom|altsyncram:Mux15_rtl_0|altsyncram_cf01:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 14,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	ena0 => ALT_INV_s_dados_ps2(3),
	portaaddr => \rom|Mux15_rtl_0|auto_generated|ram_block1a14_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|Mux15_rtl_0|auto_generated|ram_block1a14_PORTADATAOUT_bus\);

-- Location: LCCOMB_X52_Y36_N8
\aio|dac_data~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~64_combout\ = (\aio|process_0~0_combout\ & ((\rom|Mux15_rtl_0|auto_generated|address_reg_a\(0) & (\rom|Mux15_rtl_0|auto_generated|ram_block1a30~portadataout\)) # (!\rom|Mux15_rtl_0|auto_generated|address_reg_a\(0) & 
-- ((\rom|Mux15_rtl_0|auto_generated|ram_block1a14~portadataout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rom|Mux15_rtl_0|auto_generated|ram_block1a30~portadataout\,
	datab => \aio|process_0~0_combout\,
	datac => \rom|Mux15_rtl_0|auto_generated|ram_block1a14~portadataout\,
	datad => \rom|Mux15_rtl_0|auto_generated|address_reg_a\(0),
	combout => \aio|dac_data~64_combout\);

-- Location: M9K_X37_Y36_N0
\rom|Mux15_rtl_0|auto_generated|ram_block1a13\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"0718C3FFF18C700038E71FFF8E738001E738FFFC739E000719C7FFE38C700038C63FFF8C638001C638FFFC731C000F39C7FFE39CF00039CE3FFF1CE38001C631FFF8631C000E3187FFE318E00071CE3FFF1CE70001CE71FFF8E73C000E338FFFC718E000718C7FFF18C700038C71FFF8E738001E738FFFC739E000739C7FFE380079C61FFFC718E0003CE30FFFE39C70001C7387FFE1CE38000E39C7FFF0C71C00071CE3FFF8639E00038C71FFFC718F0001C638FFFE38C70001E31C7FFF1C638000F38C3FFF8E71C00071CE1FFFC738E00038E71FFFC39C70001C738FFFE18E78000E31C7FFF1C73C000718E3FFF8E31E00078C71FFFC718E0003CE30FFFE38",
	mem_init2 => X"C00038E38FFFF0E71E0003C7187FFF8E38E0001E31C3FFFC71C70000E38E3FFFC38C7800071C71FFFE1CE3C00078E70FFFF1C71C0003C6387FFF0E31E0001C71C7FFF8738F0000E38E3FFFC71C70000F1CE1FFFE38E3800079C70FFFE1C63C00038E38FFFF0E71E0003C7387FFF8E38E0001E31C3FFFC71C70000E38E3FFFC388E3C0001E38E3FFFE1C71E0000E38E1FFFF0E38F0000F1C70FFFF871C7000078E387FFFC71C780003C71C3FFFC38E3C0001E38E3FFFE1C71E0000E18F1FFFF0E38F0000F1C70FFFF871C7000078E387FFFC79C380003C71C3FFFC38E3C0001E38E3FFFE1C71E0000E18F1FFFF0E38F0000F1C70FFFF871C7800078E387FFFC78",
	mem_init1 => X"FFC3C71E000078E3C3FFFE1E38F00003C70E1FFFF871C780001E3C70FFFFC38E1E0000F0E387FFFE1C70F00007871C3FFFF0E38780001E38E1FFFF870E3C0000F1C787FFFC3C71E000078E3C3FFFE1E38F00003C71E1FFFF871C780001E3C70FFFFC38E1C0000F0E387FFFE1C70F00007871C3FFFF0E38780001E38E1FFFF870C787FFFF0E1C3C000078F1C1FFFF83871F00003E3870FFFFE1E3C780000F0E3C3FFFF878E1E00003C38F0FFFFE1C38F80000F1E383FFFF071E3C00007870E1FFFFC3C70F00001E1C787FFFF0F1C3C000078F1E1FFFFC3871F00003E3870FFFFE0E3C780000F0E3C3FFFF878E1E00003C38F0FFFFE1C38780000F1E383FFFF070",
	mem_init0 => X"0000F8F1E1FFFFE0F1E3E00001E1C3C3FFFFC3C387800007C78F07FFFF878F1F00000F0F1E1FFFFE0E1C3C00003E1C383FFFFC3C787800007878F0FFFFF078E1F00000F0E1C1FFFFE1E1C3C00003E3C783FFFF83C78F800007870F0FFFFF070E1E00001F0E1C1FFFFE1E3C3C00003C3C787FFFF83870F800007870E0FFFFF0F0C1E3C3E00000F870F07FFFFC1C3C3E00000F0F0F0FFFFFC3C3C3C00001F0F1E0FFFFF83C387C00001F0F1E0FFFFF83C787C00001F0E1E0FFFFF878787800001E1E1E1FFFFF07878F800003E1E3C1FFFFF07870F800003E1C3C1FFFFF078F0F800003E3C3C1FFFFF0F0F0F000003C3C3C3FFFFE0F0E1F000007C3C783FFFFE0F0",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "AudioSynth.AudioSynth0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sound_rom:rom|altsyncram:Mux15_rtl_0|altsyncram_cf01:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 13,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	ena0 => ALT_INV_s_dados_ps2(3),
	portaaddr => \rom|Mux15_rtl_0|auto_generated|ram_block1a13_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|Mux15_rtl_0|auto_generated|ram_block1a13_PORTADATAOUT_bus\);

-- Location: M9K_X51_Y36_N0
\rom|Mux15_rtl_0|auto_generated|ram_block1a29\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"99C006663FF8CCC007333FFCCCE003139FFC666001998FFE667001CCCFFE333800CCC7FF199800E667FF999C006273FF8CCC003331FFCCCE003999FFC667001998FFE333001CCCFFF333800CCC7FF199800E663FF999C007333FF8CCC003331FFCE46003999FFE667001998FFE333001CCC7FF333800E667FF1998006663FF9C8006731FFC663000E663FFCE67000CE67FF8CC6001CCC7FF9CCE00198CFFF198C003998FFF399C003319FFE3338007331FFE733800E673FFC667000E663FFCE67001CCE7FF8CCE001CCC7FF9CCE00399CFFF199C003998FFF399C007339FFE3338007331FFE633800E673FFC667000C663FFCC66001CCE7FF8CCE0018CC7FF98",
	mem_init0 => X"01CC63FFC633800319CFFF8CC7000E631FFE399C0018CE7FFC6738007398FFF9CCE000E673FFE339C0039CC7FFCE630007338FFF18CE001C663FFE331800398C7FF8C670006331FFF198C001CC63FFC6338003198FFF8CC7000E631FFE399C0018CE7FFC6738007398FFF9CCE000E673FFE339C0039CC7FFCE630007338FFF180E318FFF8E6380038CE3FFE398E000E738FFF8C6700039CC7FFE339C000E631FFF1CE7000719C7FFC731C001C671FFF18C7000739C7FFC6338001CC63FFF19CE000E318FFF8E7380038CE3FFE398E000E338FFF8C6380039CC7FFE319C000E631FFF8CE7000718C7FFC731C001C671FFF1CC7000739C7FFC631C001CE63FFF18",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "AudioSynth.AudioSynth0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sound_rom:rom|altsyncram:Mux15_rtl_0|altsyncram_cf01:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 13,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	ena0 => s_dados_ps2(3),
	portaaddr => \rom|Mux15_rtl_0|auto_generated|ram_block1a29_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|Mux15_rtl_0|auto_generated|ram_block1a29_PORTADATAOUT_bus\);

-- Location: LCCOMB_X52_Y36_N4
\aio|dac_data~65\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~65_combout\ = (\aio|process_0~0_combout\ & ((\rom|Mux15_rtl_0|auto_generated|address_reg_a\(0) & ((\rom|Mux15_rtl_0|auto_generated|ram_block1a29~portadataout\))) # (!\rom|Mux15_rtl_0|auto_generated|address_reg_a\(0) & 
-- (\rom|Mux15_rtl_0|auto_generated|ram_block1a13~portadataout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rom|Mux15_rtl_0|auto_generated|ram_block1a13~portadataout\,
	datab => \rom|Mux15_rtl_0|auto_generated|address_reg_a\(0),
	datac => \rom|Mux15_rtl_0|auto_generated|ram_block1a29~portadataout\,
	datad => \aio|process_0~0_combout\,
	combout => \aio|dac_data~65_combout\);

-- Location: M9K_X51_Y37_N0
\rom|Mux15_rtl_0|auto_generated|ram_block1a28\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"55201AAA4FE4AAB009554FF2AA900D25A7FB555806AAB7F9556C06D553FDAAA4035549FC9556012AA9FE555201ACB4FF6AAB00D556FF2AAD80DAAA7FB554806AAB7F92AAC025553FCAAA4035549FED556012AADFE555B01B554FF6AAB00D556FF2D25804AAA7F9554806AA93F92AAC02555BFCAAB6036AA9FED55601AAADFE5A601A956FFB552C032AA4FF2D54C0356A9FF6AA5806D549FE5AA9006A953FED54B00DAA93FCB55200D56A7F9AAB601B5567F96AA4012A94FF3556C036AACFF2D548025529FE6AAD806D559FE52A9004AA53FCD55B00DAAB3FCA55200955A7F9AAB601B5567F95AA4012AB4FF3556C034AACFF2B558025569FE4AAD806955BFE54",
	mem_init0 => X"0655ACFF35AB600D2AD3FE4AB48032A567FDA55B0069569FF254A60194AB3FE5AAD8036AB4FF9AA5300CA549FF2D52C01B54B7FCD4A98025AA4FF92A9600DAB59FE6B54C01A5527FC954B00655ACFF35AB600D2A93FE4AB48032A567FDA55B0069569FF254A60194AB3FE5AAD8036AB4FF9AA5300CA549FF2D52C01B54B7FCD43256B3FE6D5A600CB52CFF9A549803295B3FE4B56C00DAD49FF92B5B0036AD27FCDA94C0192A59FF34AD30065AB67FCD6A4C01B4AD9FF252B6006D4A4FFC95AD803256B3FE6D4A600C952CFF9A5698032D5B3FE6B52600DA549FF9295B0036A527FE4A96C0192B59FF36AD30065A967FCD2A4C0194AD9FF35A93006D6A4FFC94",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "AudioSynth.AudioSynth0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sound_rom:rom|altsyncram:Mux15_rtl_0|altsyncram_cf01:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 12,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	ena0 => s_dados_ps2(3),
	portaaddr => \rom|Mux15_rtl_0|auto_generated|ram_block1a28_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|Mux15_rtl_0|auto_generated|ram_block1a28_PORTADATAOUT_bus\);

-- Location: M9K_X37_Y37_N0
\rom|Mux15_rtl_0|auto_generated|ram_block1a12\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"19294CFFC96B4C00C96B67FE694B7006695B3FF36B59801B6A49FF9B4A4C00CB5A47FC4B5A60064A5B3FF24ADB00335AD9FF9B52CC01DA52CFFCDAD260065AD27FE6529300325299FF92D6D80192D6CFFCD296E00ED2967FE6D6B30036D493FF3694980196B48FF896B4C00C94B67FE494B60066B5B3FF36A59801B4A59FF9B4019A5A67FF36949C00CD2D33FF125A4C00649499FF992D2600325A48FFCCB49300192D247FE65A59801DB4B67FF36D6CC00EDA5B3FF9B4B6E0066D6D9FFCDA5B700334B4CFFC49693001925267FE24B49800C96923FF32524C0064B491FF9969660076D2D9FFCDB4B3003B696CFFE6D2D98019B5B67FF3696DC00CD2D33FF9B4",
	mem_init2 => X"3001C92DB1FFCC96D9800CCB699FFC6DA49C0066D24CFFE26924C003249647FF324B66003925B63FF992D330019B6933FF8DB493800CDA499FFCCD2D9800E496D8FFE64B6CC00765B6CFFF36DA6E00336D267FF1B69270019A4B33FF9925B3001C92DB1FFCC96D9800CDB499FFC6DA49C0066D24CFFE26924C007249647FF3246DB3800E6DB6C7FF99B4998007249263FF8C924CC003324931FFC64924E001992D99FFE36DB67001CDB6CCFFF336DB3800E6DB6C7FF99B4998007269363FF8C924CC003324931FFC64924E001992499FFE365B27000CDB6CCFFF336DB3800E6DB6C7FF99B6D98007269363FFCC924CC003324931FFC649266001992499FFE364",
	mem_init1 => X"FF332499C0039924CCFFF9D926CE001CC93667FFC649B67000E64DB31FFE326D918003336D98FFF19B6CCC00189B64C7FF8CDB666000E6D9263FFC66C93380073649B9FFF332499C0039924CCFFF9D926CE001CC92667FFC649367000E64DB31FFE326D938003336D98FFF19B6CCC00189B64C7FF8CDB666000E6DB263FFC66CC998FFF8CD9333800399364E7FFE7364D8C000C6C9B31FFF199B26700073364CC7FFC664D99C001CCDB331FFF19B26C70007326C9CFFFCE4D93380039993663FFE3336CCE000E66C998FFF8CC933380039936663FFE3364D8C000C6C9B31FFF1C9B26700073324CC7FFC664D99C001CCD9331FFF19B26670007326C9CFFFCE6C",
	mem_init0 => X"00073B36663FFF1CC9931C000E664CCC7FFE333266700038C99338FFFC664CDCE00073336663FFF1CD9B338001C66CD9C7FFE33366670003999B331FFF8E64D98E00073326463FFF19993338001C64C99C7FFC73264C700039993331FFF8C4C999C000E3366CE3FFF199B3338001CCCD998FFFC7366CC7000399B3231FFF8CCC399B331C000739B3338FFFE31B3331C000F3333330FFFC33333338000E3332631FFFC73326638000E3336671FFFC73366638000E7366671FFFC66666678001E6666661FFF8E6664E70001C6664C63FFF8E664CC70001C664CCE3FFF8C64CCC70001CE4CCCE3FFF0CCCCCCF0003CCCCCCC7FFF1CCCD9CE00038CCD99C7FFF1CCC",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "AudioSynth.AudioSynth0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sound_rom:rom|altsyncram:Mux15_rtl_0|altsyncram_cf01:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 12,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	ena0 => ALT_INV_s_dados_ps2(3),
	portaaddr => \rom|Mux15_rtl_0|auto_generated|ram_block1a12_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|Mux15_rtl_0|auto_generated|ram_block1a12_PORTADATAOUT_bus\);

-- Location: LCCOMB_X53_Y37_N26
\aio|dac_data~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~66_combout\ = (\aio|process_0~0_combout\ & ((\rom|Mux15_rtl_0|auto_generated|address_reg_a\(0) & (\rom|Mux15_rtl_0|auto_generated|ram_block1a28~portadataout\)) # (!\rom|Mux15_rtl_0|auto_generated|address_reg_a\(0) & 
-- ((\rom|Mux15_rtl_0|auto_generated|ram_block1a12~portadataout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rom|Mux15_rtl_0|auto_generated|ram_block1a28~portadataout\,
	datab => \rom|Mux15_rtl_0|auto_generated|address_reg_a\(0),
	datac => \rom|Mux15_rtl_0|auto_generated|ram_block1a12~portadataout\,
	datad => \aio|process_0~0_combout\,
	combout => \aio|dac_data~66_combout\);

-- Location: M9K_X51_Y39_N0
\rom|Mux15_rtl_0|auto_generated|ram_block1a11\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"6B73957F2CCE6B015339ABF94CE6C808B3894FEACE35406938DA7F56632A03598C9BFB2633580A98CD5FCB6392C0558E6AFE5239A2026CE653FAB399501ACE669FD539DAC0D6E72AFE5B9C9602A67357F299CD901367329FD59C6A80D271B4FEADC65406B31937F64C66B015319ABF96C62580AB18D4FCA473540699CCA7F56602ACCCA9FCA4C6D203566655FEDB336B01A939AAFF55999580D6CCDB7FAA664AC06B676DBF953335602499929FCAD8DAA0174CCD4FE56665900AB736A7F29332480D599953FB6CCDAC06A4C4ABFD96665603533345FEA9392B01AD99B6FE54CCD58092464A7F2B666A804933253F959995402A98DA9FCA4CC9201566654FE526",
	mem_init2 => X"AC025A6696FF2A4C95603559B2A7FB5B36D201AA64D53FD34D92B00D4932CBFCAB26D5804B6CDADFE5499AAC06A93254FF69665A40356CDAA7F2A99B560129324B7F9526CAB00B2CDB53FCAD934D00D5366A9FED24C94806AC9954FE55B36AC025B6696FF2A4C9560354992A7FB5B36D201AB66D53F914C92B00949B2CBFCAB2492A4032B6DA49FE5526D5601B6924ADFF6ADB2AB00D54DB56FFB52496D806AB64AA7F925B6D48025493553FCAAC92A4012B6DA49FE5526D5601B4B25ACFF6ADB6AB00D549B56FFB52496D806AB6DAA7F92D3694C035492553FCAAD96A4012B6DA49FE552495601B4B25ACFF2ADB6AB00D149A56FFB52C945806AB6DAA7F9AD2",
	mem_init1 => X"FCAA92D5300CAB49553FE5B5B4A98065525AA9FF252D2D6C012A96D56FF92B4949600D55B4AB3FCD525AAB0069A92D59FE6A96D558036B4B4A4FFB55A4AA401B52DADA7FCAA92D5300CAB69553FE594B4A980655A4AA9FF252DAD6C012A96D56FF92B494B600D55B4AB3FCD525AAB006BAD2D59FE6A96D558036B496A4FFB55A5AAB3FE4AB5AAA600DAA5A969FF96A5294B0034B52D527FCD552956C0195529559FF35569553006D5695567FC95695B4801B56B5AD3FF2D6B5AB600CA2B5AA4FF9AAA5AA98032AA5AAB3FE6AA5AAA600DAA52BACFF92A5294B0034A529527FED256956C0195569549FF35569553006556B5567FC956B554C01B54B52D3FF2D4A",
	mem_init0 => X"80194952AA47FCDAA54A930036AAD5559FF9AAA9556C00CB52A55B3FE2556A929801B555AAA4FFCD2952AB70064AA56A59FF92AAD554C00CAAA95527FE6D52B549801B556A8ACFFC9554AAB60065AD5AAD9FF36AB56B4C00DAAA55527FE6B6AD55B003255AB56CFFC9552AAA60065556AA93FF34AD5AA4C01DAA956D67FE4AAAA556AAD3001B4A9555B3FF1296AAA93003355555533FF32AAAAAB700325554AD23FF36AAB55A60032D55AA967FF34AA55526007695AAAB67FE2555555660066AAAAAA67FE6D5552D6E0064AAAD5A4FFE6D552AB4C0065AA9552CFFE4B56AAA4C00ED695556CFFCCAAAAAACC00CD5555548FFCDAAAB52DC00C9554AA59FFCD2AA",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "AudioSynth.AudioSynth0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sound_rom:rom|altsyncram:Mux15_rtl_0|altsyncram_cf01:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 11,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	ena0 => ALT_INV_s_dados_ps2(3),
	portaaddr => \rom|Mux15_rtl_0|auto_generated|ram_block1a11_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|Mux15_rtl_0|auto_generated|ram_block1a11_PORTADATAOUT_bus\);

-- Location: M9K_X64_Y38_N0
\rom|Mux15_rtl_0|auto_generated|ram_block1a27\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"E3902C00D7D6002813FF17E9FFDC1470EBE200340B801BF5FFCA0A7FE5FB183205801AFAC005067FF2FD3FFB82861D7C40068170037E9FF9414FFCBF600640B0011F5800A0CFFE5FA7FF305001AF8800D0260C6FD3FF2829FFD7EC00E8160023EB87141DFFCBF4FFE60A0035F5801A04C38DFA7FE5053FFAFD801D02C0047D70502C3FB3E67F9A057C0D7EB806A0583F2FC4FF140A7C1AFD700DC0B03E5F89FE2814FC35FAE01983603CBF51FE5029FC2BF4C0330640397EA3FCA053F857E980660C8072FD47F940A7F8AFD380CC1980E5FA8FF2814FF15FA700983300CBF50FE5029FE2BF4F0130660197EA1FCA051FE57E9E0340CC03AFD61F940A3FC8FD3E",
	mem_init0 => X"0AE0E57EA70650367C64FD63E260560F2BF3707281B38327EB3E3502B1F15F930794053C193F51F1A8158F9AFC9839B029C1D9FA9E0D40C8F8D7E487CD814C1CAFD4E0EA06CF86BFAC3E6C0AE0E57EA70650367C24FD63E260560F2BF3707281B38327EB3E3502B1F15F930794053C193F51F1A8158F9AFC9839B029C1D9FA9E54E395FD58F350159C757F530E540563CDDF9661DB034C7927E49E32C0DB8669FBB3C6A02A70CAFEAE39A80ACF1ABFA9C72A0291E6EFCB38ED81A61CD3F247196044C395FD58E3501538657F531C5405678D5FD4E191034CF127E59C36C0DB0E69F923CCB02261CAFEAC79A80A8E32BFA9872A02B1C6AFEA70C881A63893F2CE",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "AudioSynth.AudioSynth0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sound_rom:rom|altsyncram:Mux15_rtl_0|altsyncram_cf01:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 11,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	ena0 => s_dados_ps2(3),
	portaaddr => \rom|Mux15_rtl_0|auto_generated|ram_block1a27_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|Mux15_rtl_0|auto_generated|ram_block1a27_PORTADATAOUT_bus\);

-- Location: LCCOMB_X52_Y38_N2
\aio|dac_data~67\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~67_combout\ = (\aio|process_0~0_combout\ & ((\rom|Mux15_rtl_0|auto_generated|address_reg_a\(0) & ((\rom|Mux15_rtl_0|auto_generated|ram_block1a27~portadataout\))) # (!\rom|Mux15_rtl_0|auto_generated|address_reg_a\(0) & 
-- (\rom|Mux15_rtl_0|auto_generated|ram_block1a11~portadataout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|process_0~0_combout\,
	datab => \rom|Mux15_rtl_0|auto_generated|ram_block1a11~portadataout\,
	datac => \rom|Mux15_rtl_0|auto_generated|address_reg_a\(0),
	datad => \rom|Mux15_rtl_0|auto_generated|ram_block1a27~portadataout\,
	combout => \aio|dac_data~67_combout\);

-- Location: M9K_X51_Y34_N0
\rom|Mux15_rtl_0|auto_generated|ram_block1a9\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"18E60F1D07E67206B06704FDCE616A3A6E657FD10674713DE416DC76EEDD81104F48E25E4110376EEDC76D04F791C5CC117FD4CECB8AD0CE77E41CC1AC09CCFC171E0CE30039CC3E3A0CCFA48D20CE89FBBCC2D476CCFBFF220CE8E27BCC2DB8ECCFBB0020CE91D4BCC2206E8CFB0EDA0CCF238BCC23FFB9DF8717C08CEFCA3C05380087F00C1E7B80F7FF1AF88BF1A244B4E05F3C7A0025224507911F59FFCF01F67E688FE1381480EE800B976941E458723FFBDBB79F8CDC344E073DD1A002EE03D07D0FE22FFE9D10C7E374F1338184890800EC79761F5A458BFFA23FB5F8DE03BA60641FC3001941DD87D76ED6FFE870C17E34B76E9C0BB829C0043F8060",
	mem_init2 => X"E90EF5C1423DA28F2888885833E1E2E9F17904BD83A4EFB95E147C3C28FA95F725C11D20DE9F934786D83A11111DF145BC4287AF70975C11DDDDE8F927874DC1A13ED1DF16C415A83AF0F075E11882368790B7D84C1A2E1E0CF97BFBBAC1AE90EF4F1523DA2C79088884E1B61E2CCF97B84BAC1ACEFEB4F943C3A2C399DF604EB34C70866CDB177843265F7845C99276BE5F6CD064261B36CA3D664993A21EFA66821EE8DBB6650E32CC9C6F67D324160A4699B17784166CF7845EB3367BC734C98E4220A647A7D2F59BBA21EDA4D421EE8532B610F32CD5C4F77D66A1603429951778594CAF7845EB3507BC3159A8AC224A657A7F2F5329221A8ACD421EF052",
	mem_init1 => X"F8BCAD44842106B57D0F8312550E210BD954C8BC905527D10B3354B0A5EEB9529CF81D0D6ACDEF7BE5AA0BC1E336ABC77BD0AAC8DD0DBEAB60BBD302A53D68451A958C1F8BCA54C842106957D0F8533550E210BD56DC8FC9055A6D10B3F56B0E5EEB95A9ED81D0D6ACDEF7BE4AA0BC1E92ABBEF7BD1AA585C0DBEA94CBBD382AD4F5EF92DDAB06081EC356C28BD1C0A53E3A175E4A9E43F7DF95225B04286A58667DE812A6684195CD5BE3DF05F2B4E4D0B99DAB0517A28254C6F42489A97E83EF5E4A9E66085F95605EF9986AD85083E816A6EDBD09CD5BEBA175F2A4662F4D8D2B05F0438254C567DE99AB7E84199E5A9EBDF25BB560C103D86AD8517A3814",
	mem_init0 => X"D0629CC9CCCDF7D3CD9FD0417A7C9BFA4BD04F9B3E5E8219F933CBEFB337B239460BD63363285F3A83260764105076C0CE7D0A064C1BE853406CC362FBE8C49C6820B93CD9DD33E867C9BFAF418EF993F5B7DB5F9B3EA305EBF923DC2F996336313A082C32622FBE8D876C05942FB064C0A17DE606CC14104DC04DC6B9F4298C53E3808DA0BC9FC7069D7D8AC38FF50E0816031F93EFCF33C700A641429F8E0446FAE4C71EF5F417D4073F282FA0A30E39B14139BF1C0D7AFB35FF3C6618102C0E7F2FDF1EA01C795C828D3E380D85F499FE706BE82FAC1CFF725F436038F96282753C700AF1F7E9FCE0681030CC38FF59BEBD6071FB39051B38E18A0BE82BF8",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "AudioSynth.AudioSynth0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sound_rom:rom|altsyncram:Mux15_rtl_0|altsyncram_cf01:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 9,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	ena0 => ALT_INV_s_dados_ps2(3),
	portaaddr => \rom|Mux15_rtl_0|auto_generated|ram_block1a9_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|Mux15_rtl_0|auto_generated|ram_block1a9_PORTADATAOUT_bus\);

-- Location: M9K_X37_Y41_N0
\rom|Mux15_rtl_0|auto_generated|ram_block1a25\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"1C3C31FFFFF6E1587906999AFF6A1F708BD48253334FB0F2BC48004039E1E7C5963E777EC01B0BE1C3331FED43E6117A90EA666FF61E77080008273C37FAB30B84AF5003E17E7C6663E7E87C00AF523D0CD5F2C3CE4100010EA786FF66657095E8877C2B7F8CCC384D0D8137EEE7C61A3C7879C0200123D4F0DF2CCCA012BD1080C93D25F3B08185539C794B1D019E3A03EF716B0A23BAF2971283FA3067D472D6144375E72F2305F432CFEAF3BC38C2BBCFCF460B6C2D9FC4E77972C7379F8E8D16DC5B3F88EFD2F5C47F368E5A2D1CB67B10D3A7FBC8FE6D0DB458BCFCF670A74F73D1FCDB1B683139F9EAA18E1AC78BF98617F0627A73D7611435A7B5F106",
	mem_init0 => X"3EC4BB5EFD686C1C52D772B5AEC15F4A0AF914A562296B8F93D2810A45B907C249E318F2487C13B44A1029793E3AD288D4A513EA0A5F506EB5A9DD294706C2D7EF5BA46F83DB61CE70DB783EC4BB5EFD686C1C529772B5AEC15F4A0AF914A562296B8F93D2810A45B907C249E318F2487C13B44A1029793E3AD288D4A513EA0A44D61271A250EC7E1ACB1C9657C51B7A9D577ACA4E0123508FF10AC48072535EEAB95ED8A3EA6938D3507E370A458E486B228C195FBBEDEA7700BB4917F88D4241102B1E75D94F6C72ED789C0FA9A71B4D41D7242B154429AD8FF6E57B8077A9DBFC6D6508AA35093AE0ACB639657C0E47ADD38DBCA6EB9E35022090AC47FA24",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "AudioSynth.AudioSynth0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sound_rom:rom|altsyncram:Mux15_rtl_0|altsyncram_cf01:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 9,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	ena0 => s_dados_ps2(3),
	portaaddr => \rom|Mux15_rtl_0|auto_generated|ram_block1a25_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|Mux15_rtl_0|auto_generated|ram_block1a25_PORTADATAOUT_bus\);

-- Location: LCCOMB_X53_Y37_N2
\aio|dac_data~69\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~69_combout\ = (\aio|process_0~0_combout\ & ((\rom|Mux15_rtl_0|auto_generated|address_reg_a\(0) & ((\rom|Mux15_rtl_0|auto_generated|ram_block1a25~portadataout\))) # (!\rom|Mux15_rtl_0|auto_generated|address_reg_a\(0) & 
-- (\rom|Mux15_rtl_0|auto_generated|ram_block1a9~portadataout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|process_0~0_combout\,
	datab => \rom|Mux15_rtl_0|auto_generated|ram_block1a9~portadataout\,
	datac => \rom|Mux15_rtl_0|auto_generated|ram_block1a25~portadataout\,
	datad => \rom|Mux15_rtl_0|auto_generated|address_reg_a\(0),
	combout => \aio|dac_data~69_combout\);

-- Location: M9K_X37_Y42_N0
\rom|Mux15_rtl_0|auto_generated|ram_block1a8\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"3AEAE67EB3D5AD4E58A8BC6E91526402D2A75B406572D0E7E8D8390AD915C82990CFFE61328275136A138362FCE169D4C05B5CA96804C9512EC7A2A34E56B579AFCCEAEB927DD5ACBD64A81B1CF151F8DF02A4C807B57FB62AEAE5A1CBD5B07A1CA8AB9211509FECC2A704E075708727EAD9C2C2D501B6A9B8CC0A6132158D5294D43E337EE41EC0099C1EA6B288CE178332E26D183EF054C1E0F8404D64FC59902B4E7FEECD476309AA43EC2FF9C1EA1CFA80F1E7CB2C76F673EE352FEA0F0482260F83E6EFB7C3EA02D4E20C642472CB061C3FA831EA1F1802F20F6A9BCE47532200634AFD997036537F783E1F357C20F9D26E2CCF85E33FACA6A1F19BF720",
	mem_init2 => X"E61E8138D81E63B107C0009739CCCB0273FD4307632A1EA9EE62A66644E79D7856C640C2F3DC44D33289CF2003E98DC6785F98817867339A0FFEC31BACCD37310C2F356725685186376666AC625AA1EBE647CF501C6FCB3318C5BFBD074E8E61F928DEE1E2158BD4014E9D14CCB251A4FC328B1725EFBD3A06661CA349579716D5ED780DBAB15AF35E6AF14C29DD5882FA7E357CDA5B2EAC4E1F491ABB94328F543ACF5A8DDDB41EB7AA2A8693854E0682FBD511AF35C2A694C297EA993F85215355E5F1F56FE5F000A9394302F2BD8CFFB2540B01BB4A9E2A783B2A1268B2E54F08F3E59509CC0022AF73F990CA87161F5157B65D36E5455C3478ABC0CFE776",
	mem_init1 => X"EADA47E5C81383E73B673918E1F55003CC7D20F9477E744F836D0E16E7C1C5C7DD8C5497C64ADFB1D0E112630B1CFCAABFF0FC677C1AE20E2EC1F27BCFA460F8EDC089CEACA0E2D48538BCFBB673F29C0955013E0C620B9463CF14F83619C16A7C1C40C57AC5DF7CF4AFEB1D1C102630140ED86BFB178F7FD1AF71C13C1F2F80790EC72F5B0E831443BDC3410FF57C70A2B807BE9E211EEB8F4792858E47B0EB4938038835A4E361D70CD7AE74EBE2EEC02B64F9771FE3931EBB9055CA831DB9D6E160DEDB1FF0BC2F0072484F9789462473EAC55F622873638071160D92BFC88B868D18A14CF147938DA53EE3FE36D28F21D8E5EB61D0628877B86821FE2B8E",
	mem_init0 => X"40DE5D52CE4AE3B42B507DE27F7D2CE0BFFF1756B2BE47AD0A542DC75277693A3B0241D5ACBB7E4782950A6A388C9A4E953B4CF56B2E000D60A5422371C322D3BC717BBD4ADB49FBC82D30890374CAB4EEA38BEF52B61D81221B4C37BF25A2A533BD1C4BD6AD871D88865B0F6000E9A94C41B852F5ABF238ACA1D6C5C4FDBA6A741241229175D04B0423F88F436C10941C3D0D2047C79694348196E03E519606C47F1146D93F9224431B46BBB76C0CE93AEE03BB3B2CEB07F12EFCB3AD2C387BF69E878FADEFD27A1DC077BE49E8A2ED72F96FA224488BED3EDD6E8A2F34FBDC0770BC93EF6BE3C2F2DFBC38696BDB7E691FC1AE69F9BB80EEB926606DDBB8C4",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "AudioSynth.AudioSynth0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sound_rom:rom|altsyncram:Mux15_rtl_0|altsyncram_cf01:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 8,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	ena0 => ALT_INV_s_dados_ps2(3),
	portaaddr => \rom|Mux15_rtl_0|auto_generated|ram_block1a8_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|Mux15_rtl_0|auto_generated|ram_block1a8_PORTADATAOUT_bus\);

-- Location: M9K_X64_Y42_N0
\rom|Mux15_rtl_0|auto_generated|ram_block1a24\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"1D08FB1ED7481A4E6F9987FD790A4470E6D6B2200F3344C6C3F68A039077A7E30F6652691E38C93E28FFCE014CB65CDA90E403E8E89878F55544D30CDFCE603380ADAB869965993FC89A699E1D5B503CC06733B304B22AAAF1A191717C027295B3A7D328073FF147F939C68964A66F8C7C5EE09C0516FCB6322CCF0050D6B67014F7B33DB153C81A434B9F4F2A29F337B348327834531D3E9B3CD3213B069AB4D06AF2FA7E23572453240D7736B0EFB3A4FD932E486B121AFD2C60DC350DFB321D90F364752B2961A9312B9DB3522552FCEE034EC14E2A56137784DC226FD8571D831B3FAC212B093AB4DF96E2D182D75758322532FF763F2FA38B05970CB26A",
	mem_init0 => X"08D204B9DFBCE086885932CECAE8E926D1D1591966CBDD3DF18408C5BF69DED513371D99156F72DFB4620431F7977A6CD31351716C92E2EA6E6993022C20E7BF73A4096212AECC8E266EA908D204B9DFBCE086881932CECAE8E926D1D1591966CBDD3DF18408C5BF69DED513371D99156F72DFB4620431F7977A6CD31351716C8B43F27C6B0984130F4C7CB93C6A3FC82B6E5EE15FC8FDE7E5A7E7BF13FA877A76D413FC563C9D3E32F8C82190D63E4FC2D11E5B8EA77ADF75A4541EAED2882508D4710C3BA5E06C1CA7B3DF67059C1A361CAE01BEA48D08F501B810C0D2C0C207602BC42C495F601D4E1B160E6839BEF3794E0D81E9770C238AC4290452DD5E",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "AudioSynth.AudioSynth0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sound_rom:rom|altsyncram:Mux15_rtl_0|altsyncram_cf01:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 8,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	ena0 => s_dados_ps2(3),
	portaaddr => \rom|Mux15_rtl_0|auto_generated|ram_block1a24_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|Mux15_rtl_0|auto_generated|ram_block1a24_PORTADATAOUT_bus\);

-- Location: LCCOMB_X53_Y38_N6
\aio|dac_data~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~70_combout\ = (\aio|process_0~0_combout\ & ((\rom|Mux15_rtl_0|auto_generated|address_reg_a\(0) & ((\rom|Mux15_rtl_0|auto_generated|ram_block1a24~portadataout\))) # (!\rom|Mux15_rtl_0|auto_generated|address_reg_a\(0) & 
-- (\rom|Mux15_rtl_0|auto_generated|ram_block1a8~portadataout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rom|Mux15_rtl_0|auto_generated|address_reg_a\(0),
	datab => \aio|process_0~0_combout\,
	datac => \rom|Mux15_rtl_0|auto_generated|ram_block1a8~portadataout\,
	datad => \rom|Mux15_rtl_0|auto_generated|ram_block1a24~portadataout\,
	combout => \aio|dac_data~70_combout\);

-- Location: M9K_X78_Y37_N0
\rom|Mux15_rtl_0|auto_generated|ram_block1a22\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"FD4EEA464D9744B4687D72D8E2F177A380B9FEF659B435E911A12EBF164E9E6FCEF877392F798A3F21160C018823AF108F8988D6193ABC13A119DC6F2F0A18360705C8EDE1BEA3D0BD01D87175BA0C74C185034F6BB9C85D3BB5D98239185C30875D01180154884AF511EE49CEC0F7BEE1D72697174C50497AC0D9A4E3E9D018640EC966EA3D0846D87511FDFDB97500F1FBFD0CB2B0C52C7BFCA30A0A1707FBE77C61B7DE17FA8DE415FC77F77E85C363AA1F8B10502EBB07EC2C36833B0B3F292E60EAB5A3D3A98D02036A5EEF6BC9CB75E584C8E307D732BB6A4B92E86C4B161AC2046E9566246024CAE4867AB816031EEECB3830486DB60EAF7FEC49722C",
	mem_init0 => X"52F217AB0FB1840369E9FCBAF763A6633472214580D0D27FBCA41E542F616A20D1B5B5B1608AD0DE854F04A7BFC96160345089C598CCB8DDEBA7F2B2D80431BE1ABD09E95DF2E4A4A4E9F752F217AB0FB1840369A9FCBAF763A6633472214580D0D27FBCA41E542F616A20D1B5B5B1608AD0DE854F04A7BFC96160345089C598360ED23FF32E0A58A67E19514EC70357851A7684106D86DCFFFE3B61B608256E58A0EAC0E9728A987E6C1A5074CFFC4B586CCE986AA553ADD9E14D926BC32240AAD5EF14664F096E00668FAD3E4C0F357589C7E547D72C4BDF7C93C91C000E24F24FBED48D3AF8A9F8B46BAB3C0C9F2D7C59801DA53C998A3DAAD5429130F592",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "AudioSynth.AudioSynth0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sound_rom:rom|altsyncram:Mux15_rtl_0|altsyncram_cf01:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 6,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	ena0 => s_dados_ps2(3),
	portaaddr => \rom|Mux15_rtl_0|auto_generated|ram_block1a22_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|Mux15_rtl_0|auto_generated|ram_block1a22_PORTADATAOUT_bus\);

-- Location: M9K_X78_Y42_N0
\rom|Mux15_rtl_0|auto_generated|ram_block1a6\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"3362858DA3F3A4E08D1A39C151800C7EF5C76757B0450BF1FDED6C368D42D858C137FD90634368562D86D6F7F1FA1441BD5CDC75EFC6003150738B1620E4B9F8B63428D982793AE8DBF808364865CBEB915CFB985E94732E00A77255440423D146E547824E793FE8DF3956CF53A4AD98101EE4D77C8FB9C7142393FF9D78E46826396F7F26DA4D20D9084F1CDB351AF90058B5B51B52A425A0286CC31F46380F1B7B72DCD480168BD406A4CB2A9B04E68C8AB3E0A39563544C2C5A41628E76CB3D705F817C50CB2463AE5F6932F3754E558EBE1CABB1A637C9AACB36A7F50BA5FFB5312C4849C3F8E741CF327AFE96762D49D494B97FD839D0C931C37BD936D2",
	mem_init2 => X"FF9B1125E3286EFB6D591DE6ED87D40E27C82BBD08494C07F23324371BB1A836DD6F55946C5207ABE268994C8A3B22B815A03B7A95FB9EFAEBB3793B6C0A8389F2358F421034F3BFACC4F4CEEC67F35E53D4CAFB1091E50E9A64519ACEDAAA3ACA0ECEAD84A73EB9021E0ADFFD20667C3A8555846AC7AFCF318683B339F3B7B4FF9F141CAC19873613DFF23C90662D4AF73EE8F98C3183FE4EAF4AB072A13D7F7D814CE9D8B63C28BB82F7DF590FFB2EC63AC14B9B0FFDF61C6C6B6298DF5CCE0BE682E43FA804E3EF051DD3AB97D96E65EDCA2C82D3382F83E418BEA52CDD5C1456B30E5F4F82799722B33431E0BE9061F2F8BFC89170592505117D3936245C",
	mem_init1 => X"4CCEA26752401BBA9B42F8CF949CA3980CDBC071FDD47AFAC50F87C364FCE832A4124F7099C8B6AB3BC2ECF46A5C412C719E377C763895F3B585EF7DBB02680AD28F2EB6D310D78F217E66474CAE7313360E387D7842AB15378A51680F36CDD97F314E7DB7E428D763D1724C1151CD56581ACD07163CC91813FEAA61667FC81E6D02B3089F96B92858A7AF62A1A04AD394ED3D580D0572F5A10A8377995F8480795001D343CB34E30AA1841E03456C9A6851639637F33169AB15C0068CD3A5D9E57D6DDDE0B480AAAFED2F86449C118645A34CE9FFC572A69733013963975E9A6C91D3787DE7EAF38D32C3D347FF561FEDA0566113F2D7250B14F5FE54348D4A",
	mem_init0 => X"B8E4762B4B3D4E860575F8D0994FA9B33FB79E762C510340F44AB9F2BA442B80F71C24655C530E8C13A946E76D1BB51E03FFB660ACF6240FBB33E5A1E8831548C3AAB5A5A8DCE9D46D156657625C38AFD98922669548048DEA2EE634471F0188024AA93D457D022F6A74AE79E0484E753EAEFEBFAEA0630DC4D2956E08E3D6E2A00A6A2A63ACBE95879336E31751EE7D0C059D6E5C17BF098AE73F42441A2B62E5305B96A15B2F42AFFD48C93A16C095FC6BE6A37457099B7A0D34A2DF042FFB3A8C3F9E8313AB4EF3242434D7C5147353015B95B29A5FB501D59C5341EA784C491EE4AE9182F3FA62B9A7E840F66718C0BDBBE5D41D9ACFAC795A06D0BD7426",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "AudioSynth.AudioSynth0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sound_rom:rom|altsyncram:Mux15_rtl_0|altsyncram_cf01:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 6,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	ena0 => ALT_INV_s_dados_ps2(3),
	portaaddr => \rom|Mux15_rtl_0|auto_generated|ram_block1a6_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|Mux15_rtl_0|auto_generated|ram_block1a6_PORTADATAOUT_bus\);

-- Location: LCCOMB_X53_Y38_N30
\aio|dac_data~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~72_combout\ = (\aio|process_0~0_combout\ & ((\rom|Mux15_rtl_0|auto_generated|address_reg_a\(0) & (\rom|Mux15_rtl_0|auto_generated|ram_block1a22~portadataout\)) # (!\rom|Mux15_rtl_0|auto_generated|address_reg_a\(0) & 
-- ((\rom|Mux15_rtl_0|auto_generated|ram_block1a6~portadataout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rom|Mux15_rtl_0|auto_generated|address_reg_a\(0),
	datab => \rom|Mux15_rtl_0|auto_generated|ram_block1a22~portadataout\,
	datac => \rom|Mux15_rtl_0|auto_generated|ram_block1a6~portadataout\,
	datad => \aio|process_0~0_combout\,
	combout => \aio|dac_data~72_combout\);

-- Location: M9K_X64_Y33_N0
\rom|Mux15_rtl_0|auto_generated|ram_block1a3\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"F61C3D3854BE20785E756B5327E4F523D9D263443C5E8A5921AF07CCA389606097F75DFD20C0D238A67C1EB0934A2F478458C9737895E4FC995AD5CF43C08FA54397870DFF7A38DCD9E5048A6124836ABF2E64B8D334A96381C28E8204033B14D61CA864730881F9BB87550DF35753E55F2C416A9F6DF9C36FE390F8CD19E7CA8461632F3AF709C33938A51EF970BD5CC1A82C382DCB95BE35ACDB9B7BDAC48F3BF0A171DB9DF4CF955927DEC66175BDA00FEA65A31E2BCB352AC888A0A8442BFF90D6857D020CFB7A9EBBBF6AD5535BC10E567A03CC1E10BE272306D944B3587A8B1C5EBC1C92B32F2C4CEB3295C04F6322F8F2FA9F3E40E95C214338D9D7B8",
	mem_init2 => X"933469C82BD7B4703FF502842CEB2B0095D90E7D21173FB5FA561E35C9A24927AAFBA76A5716434B5C7FD0899C58FA6F8F484C19A27A57CD2B85BDA86E4DEE8944829E88C87EA75D341A6324884B4734B1701743101F90F62F1CEAB3A0AAF554DAC208FAB7ACF0F8CE439E773C72A6C80FFCE1F1FCE70B7997D93A2D8F8A5968CA60FD5718BD360D84FF6CDF4F974115FBAE54B8892D0355E53C687017FCE70BE0E0508C42E77683014CF2142D82AE595F2D74662DF5E07B48D177149BD16066CD3E898117B100ABC42CA292ED8E6EB1D76DED56E35A5C754A6FADE150B8E6B74B077978467E3AFD5654965F0D0E57450CC6AD04B829BAAD7B74936D9FE65876",
	mem_init1 => X"5DBCB1A201E9CB14D3D308520664EAD3AEBFA59E1E387E0B0EFA74EC9D564A80FD1667422281F0D5CE33FC40EE4130F498C9A9F50CBA42EAFF34B181CB880668CADDC4BF2CA0CBD6D3913ECE367A371FC0CA25D7B4D32337FBFB1E36B4C6AE5085D06BF4B4CD3F958CD5E879FEA6C170BC6E1C1333B2633C6012E9440986945A3296C7CCFE1472755379C89890C3DE363C8B3BBFABBA9AAE890417920E6A3A3539B2D59B3B75B498F3A8588E4688DE78EB08C9222D2EC76E59DFC3F70A6FCCCAB104865B5B1E1DB300786229D146E36ACCE49AF103410B3971E8B49E9786F2A94A435C5CEEDEE2086D273E3F1B6726253A5298FBA1E7866EAA6F33001218FFD4",
	mem_init0 => X"72D44E126A1AC3635EE16A569F04D1B4ADD2AACB9EC58666FF7D254E3EDC8DC81847ABB15CB0A90244A42F0A7F4B74F9B4790A315A4C8ECF861D5B21B93E077C102922976A4F30247BA5F5CB7C541539CB91F247C4C035B99F42BBF3B0CA6052D62A24ECDE60894887F6D44CEADD944AD14BBA050B74EEC942228D9506266862C29F105F799043D03D7E90FEB64445C2D02CC09A26EFAF02630021995C1CBCEFBBFD91C6D7D1632EA5A44036FF8AF7D3C5EE6530947A4FB3CEB405F41E2C05BCB0079C6984A8019D986BE26E37939ACC8919D788528BD274E6DD266843523D73EDDC9B3AD5C72E8CB6F12490770FDDE3A567A41AF6AFA40D91BF096175D0A5AC",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "AudioSynth.AudioSynth0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sound_rom:rom|altsyncram:Mux15_rtl_0|altsyncram_cf01:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 3,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	ena0 => ALT_INV_s_dados_ps2(3),
	portaaddr => \rom|Mux15_rtl_0|auto_generated|ram_block1a3_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|Mux15_rtl_0|auto_generated|ram_block1a3_PORTADATAOUT_bus\);

-- Location: M9K_X78_Y39_N0
\rom|Mux15_rtl_0|auto_generated|ram_block1a19\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"AF1C8E6B354E167ABC313F9092C072132F8F1B9D0CF982E9CB773854DE9B4577C19DB5A6BE5969CE588E8E20FF6FAEFE5D198C01542D6DD8345AAE144313C44A87449CF1ECAAD38EECB4A790F0E74232524E8DDA9F543ABDBB737A285F6C8B2F8C9F73ECC7211F273636A7B8C4DB8698CA2380B29E59ED3E33D9D78C1DA872BC9203B3AFA9476B6B0BA7288D9AA0CBBA6F4B70F1164CB62D7E5DC65425E6CC6E354A22370D516D8C133725EC3475312EC7620CFC160921E393DDD4FAF5EF36BAC02353822FF15C97EA5112FB0A0A0B98737544CD10FD16A3359D2C5A128568DA339D7EA7C5B3C0B8C7DA14178F5FCC139994B0A7C1EA2DF66AF21C611C946F34",
	mem_init0 => X"0B75EDF366CBA506AF57FADEE2B69E270D357129012A153D8C193A6692B25F31D2E4A4E9719F49A92CCB930637950A901291D5961C8F2DA8EF6BFD1EAC14BA6CD9F6F5DA0CE249B5B248E60B75EDF366CBA506AF17FADEE2B69E270D357129012A153D8C193A6692B25F31D2E4A4E9719F49A92CCB930637950A901291D5961CA78B3F79EDB48E814DA1FEB025F55CDB7BBF863DECB9DE707FE991D45DE04339F91127DAB09BFF79EE4FE160D248DC432E05B60652E75553A998DD4047B30E3BAC5E570E92F1752E30821F8BF05A710A7ED15621A8A203CEDC9B2F06F240B3795D364CF4B03375C15AF32484309E82EC79506B1DEEAFD24C0C4E8D757AB37814",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "AudioSynth.AudioSynth0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sound_rom:rom|altsyncram:Mux15_rtl_0|altsyncram_cf01:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 3,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	ena0 => s_dados_ps2(3),
	portaaddr => \rom|Mux15_rtl_0|auto_generated|ram_block1a19_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|Mux15_rtl_0|auto_generated|ram_block1a19_PORTADATAOUT_bus\);

-- Location: LCCOMB_X53_Y36_N10
\aio|dac_data~75\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~75_combout\ = (\aio|process_0~0_combout\ & ((\rom|Mux15_rtl_0|auto_generated|address_reg_a\(0) & ((\rom|Mux15_rtl_0|auto_generated|ram_block1a19~portadataout\))) # (!\rom|Mux15_rtl_0|auto_generated|address_reg_a\(0) & 
-- (\rom|Mux15_rtl_0|auto_generated|ram_block1a3~portadataout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|process_0~0_combout\,
	datab => \rom|Mux15_rtl_0|auto_generated|address_reg_a\(0),
	datac => \rom|Mux15_rtl_0|auto_generated|ram_block1a3~portadataout\,
	datad => \rom|Mux15_rtl_0|auto_generated|ram_block1a19~portadataout\,
	combout => \aio|dac_data~75_combout\);

-- Location: M9K_X64_Y40_N0
\rom|Mux15_rtl_0|auto_generated|ram_block1a18\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"A63EF56B7FE16F963D7F6B00389DF8F0FC69BB62EA44FB63CD7EA2DC8920FFBA69A0073381B3F53C16ED3BAE8D97FD01EDA52EA250B1FF5CE69C10EC065B0F6F3B36D247F5F910C11F88776A277B51E8A1832187168270172C1E3626B5015ACF7C3FE824DCF10723DB27586D5FC06AC83FC9D09384CF0B14A4324E790DF58D008DA15347DE4EB4E70A6EB7E68D4C69D043A944843D1309ACBE990F894BD836F2909EFA58B20A7FC87E4DA83896E157A88AEDE174899724281261B37D2416125F9D0A10926B652E33D4B84353062C4F8F702DC1F420ABA181897082CB432E9A8DCD83ACA09F490F9DD3398EC9B570683A4020FECDCB7694C45BD0F3D09A0B1886",
	mem_init0 => X"7F0E7C1547EB844759D6E257686DB9C8DEA3F20B30E8CB78841832E9892E4726F4480245EC9C4E9232E9830423DA62E19A09F8AF6273B6C2DD48ED335C443AFC5507CE1FCD95637FD8D5367F0E7C1547EB84475996E257686DB9C8DEA3F20B30E8CB78841832E9892E4726F4480245EC9C4E9232E9830423DA62E19A09F8AF62F92492BAE21F8A3B46E98E46ECF900EE0DD7DABBC3102EAE17D7152FC929DDA7E4C67460E4D72DF66361604FF8449EB9A5C12985DB24564FD1D5CFD58E62DF91AB4504ED7B8D2CC5281F47AF3837368D881934C5733BC128ECA661E561B3431E81984EED60DD831C8873FB744CF7F6E55FC22D2A0AF1F7BC3ED8B56C987198B6",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "AudioSynth.AudioSynth0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sound_rom:rom|altsyncram:Mux15_rtl_0|altsyncram_cf01:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	ena0 => s_dados_ps2(3),
	portaaddr => \rom|Mux15_rtl_0|auto_generated|ram_block1a18_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|Mux15_rtl_0|auto_generated|ram_block1a18_PORTADATAOUT_bus\);

-- Location: M9K_X64_Y39_N0
\rom|Mux15_rtl_0|auto_generated|ram_block1a2\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"1DEFCA1C9CB4AC1A37C2B75A2CD8E218947491801DEB95CD9FE95F1EAE00C1E8E3B555B8E2F0600EAF1F52FF36753AF7003125C52308E3668B5DA87D8B06A5A7270A7EF70A1FC14F33150480F1466FD7470E5E5CC2677C2F5385BEEC0B43DA4DBEA7E1F26A2124B69605DE1D4248BF6E48118AC786AA1CC271C80FC53A51A7F642DFB47F9CFB8EB851616ED5F1156DC3A485D386F4E2293E131539A8462377D064642E8BECC2727C58E3021FB72E15A1287C0232F51ED9698FA4DB63E4DEF3A76FA99FA1DA0979F275D6060576A666ACC11CE8D5B04D705B0784834D8E2CCE9284700980F6622E7AE9C36FEAD5CEC2251704678C173EE0C7A8DA35B5CA5CE55C",
	mem_init2 => X"7FA86DFBCE42FBD2C6BC6F4AD1C6B509688876D6825BC65181E4252DC39C0D6921C051C3BBBE575638554DA6B8B4D4A60925BF75C27AC42ADC9580A9686867534996A700FD1A1ECCD00F5335E141C8789855689DA5B3A28403148596C7568A1E53CEE8C9E5C735DF5DF51FEEFAA6E4ABDCDF8C3277659CBF8734539200F0C77417E7DCFE1BE2EDE661874D79710A0EEA32C985A8D54FA46DE01A54ED12BEFC900DBD6698C3DBE4087D1B737C0A36052B1CEE8080E828F3C52F48349F1E9D80AF80E194C61D04B8E9577EA717F7898DE604EE40B51DBF055ED688DE4A72707FC77C373E7389029122D4E028ECA9A2E1FCF98D0A8AA8DD9A7975CC6A75A1D2CA98",
	mem_init1 => X"4D2F4693F0BA92D9DD1FE1CDB541EA9C94F5F2E776BD3C853F25D652E55DBFC86FC0E2337B858C569E715D3553F6D756FFC4BB24A34E6F7484CC4D749ED2BFD122314C94B55A52DB67DCB1F9BE6029BB3E299A34EC645F04CA5513E8996E7C7C5A4BB2BC2CCFB98952E0B7AA05806F69C9EE1C612A90B043F1025953219C3280E172BBC00E56BEC06A38D59FD8A95C64836A32CCDC8AC4F8AF1A6D4A90616392C594B814FCB3D1462AABB2F1A124FB509EADED6B442DB78794D72B058017E6A81D702EE2172D06487CF4A5047754E83E892406C5FB74B29E1346B5B7A1CCA8C80DF24A230AA0432F5765D2F2818165DA627F9F7A3F258B680DCF95E8FB148C12",
	mem_init0 => X"A38925BF4D7579B51EC018D907BDE2D9801D429F4645305BBB37990B05073842D15829AC507DA66D207954685731095D35CE954D00F47C159A4B2361A9E53671F1D9CBB9FA4C8A0E65F88E2534E3F377F3DF26FF5AEE1C0367BDB33F19D48B1FF4C3A3C3A08103BD90CDFA3ACB330EC1C869AA2E4AF64CB99C3AC5DE2859B2686716097E59C2AD932EF2ED35D2B16CF5E1507F7BB192DA52433C44E30686DA43217086862D4714291E09D48CEA086AF23EFACD5A815B8DD97C5882839F0F576ED122E4923DBEBA2F18F67DE94DE986F281578B024E9ECF5C29024E27508A917399E8D7C56B04114E76EB4C8DD9F26D5C3DFDC3EE4A59E2A13F87614816D1E128",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "AudioSynth.AudioSynth0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sound_rom:rom|altsyncram:Mux15_rtl_0|altsyncram_cf01:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	ena0 => ALT_INV_s_dados_ps2(3),
	portaaddr => \rom|Mux15_rtl_0|auto_generated|ram_block1a2_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|Mux15_rtl_0|auto_generated|ram_block1a2_PORTADATAOUT_bus\);

-- Location: LCCOMB_X53_Y36_N22
\aio|dac_data~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~76_combout\ = (\aio|process_0~0_combout\ & ((\rom|Mux15_rtl_0|auto_generated|address_reg_a\(0) & (\rom|Mux15_rtl_0|auto_generated|ram_block1a18~portadataout\)) # (!\rom|Mux15_rtl_0|auto_generated|address_reg_a\(0) & 
-- ((\rom|Mux15_rtl_0|auto_generated|ram_block1a2~portadataout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rom|Mux15_rtl_0|auto_generated|ram_block1a18~portadataout\,
	datab => \rom|Mux15_rtl_0|auto_generated|address_reg_a\(0),
	datac => \rom|Mux15_rtl_0|auto_generated|ram_block1a2~portadataout\,
	datad => \aio|process_0~0_combout\,
	combout => \aio|dac_data~76_combout\);

-- Location: M9K_X51_Y42_N0
\rom|Mux15_rtl_0|auto_generated|ram_block1a17\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"18B61650911507D3EF29FE0E43C3B312C640B5A8EB791519A6B3B3D28535251867CCA4741B3EA98B5605B320702DB89DA6F9CC16B1E6F36FA38CA7730069E1872A43B8BEB8210D8FA80E95CCD39977685332E66605523EF8EFD6DD5586055D8AC53AD5558D13E44DF3BD8DE848337015EA43D7F4D189E66C8FA99A94FAE00CEC002308B585EA221218AD5E1EE734E21A186A1041A168A90DF5AF74F833E788E6B7D30200F67D16302B2B6A955B9C0560E981E17C35E65891D91CE90D0EEDD1809F9E2711F93648E4B0053342224551E68179C0AA6FBF3FBFC94F1CC169A54418A43B343EEC97B9D3AFD7401283EA9D3C3B6BF67A6ED23A7A7CE1102749E7B3CC",
	mem_init0 => X"28E74E1B9AD18258F3581975B6E44F6EE5CD15D7AE0A6C9CC6A564B9F40193F9200FBE0093F93005F3A4D4AC6726CA0EBD751674EEDE44EDB5D30319E348316B3B0E5CE28E7A276EDC8BCE28E74E1B9AD18258F3181975B6E44F6EE5CD15D7AE0A6C9CC6A564B9F40193F9200FBE0093F93005F3A4D4AC6726CA0EBD751674EE8AA98A00BE1BA05DC62F59CD187618D7EEAE30D9ACDC1A96E1B499044A2B9AFBC589F881EBE84B7EDAEC7C241079334F1EB00E032072F5E3B0E6DD753301514D006C261DDC6E38D0FAF246FEF244FA71C1B54CEB03556E3ACFCC61BB11005D4A9D8103285DD5FF4B8F757A1B88330E07273C28C53C2A7EF5F6F18271195836C8",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "AudioSynth.AudioSynth0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sound_rom:rom|altsyncram:Mux15_rtl_0|altsyncram_cf01:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	ena0 => s_dados_ps2(3),
	portaaddr => \rom|Mux15_rtl_0|auto_generated|ram_block1a17_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|Mux15_rtl_0|auto_generated|ram_block1a17_PORTADATAOUT_bus\);

-- Location: M9K_X64_Y37_N0
\rom|Mux15_rtl_0|auto_generated|ram_block1a1\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"9B3E4C92732E625E1CE944068E828AEF246F3A53BD56CE355FA3D830F4C636961B4BFA5B0D2D8C65E18378BF558E6D57B94B9EC49EEA282E2C0452E70F48CE99C9264F9B3E471E33A9B8C84FCA7DCEE18ED98A201568BFEFCA5BC8D8EDFDA6A256EF30C53E2201D14B31AAECDB40E0A655D0A7A3397C506086D7F6EA1A74B88C3DE90D378C2FEF19916EFAD227D375025BF2FABA7CDAA1AEC46893BB4256E04D55C61319094B26A891B499D6055E77A684D4BF3CF33E563654119D854E356040CB01C5245F66CAABBA130ACCDDDA436F3F06F4FA770851B53A97A7B2C48A630396B9DA2687092CDB5CDB557B2A7CDF0EA6CBA8A1048793EE4EF9CCB7965C4280",
	mem_init2 => X"8A806FD8B0BACA7D065A432F1970D7E4D660BD1CFB7B69A0DD3570A347AA28468C80AD84C7B30D5A310AD2DDAAA4236C6D0BAAEF7266C1103D83F128F5BCB633B59534FDA0C9D9CD5ECBE1F2D0EC737A77682897A52B9065543EA4D976542E428586E48AFD2F8DC6965B095F23A5EBA40327D5C057ECCA672016D765698EE17CCF20BF5667DF17C695A7DC8E8989E5B37CDC339545287C302A4E383D5452244113A3D8F67404A855E30C2F8FE5C96B50BCC9B40E72FCDBA9FEF4A570B93A3DE0D9C6A9A4D5740FD794A3F19181B6DBF6A4D0FB8531D72344E290D0E865252D86923FF57F94A0435AC1E4431122CA5443BC6624066FD13DEDF17AF3DCE1C60B54",
	mem_init1 => X"C0CEE269D9028CBAB4E7DE42800F03F935D14C95B4A8F9FEB9160A20BDE390E20F376016110785EA96EE6810F045E178730197302A2E1BDE4D930F7311297802ED64AAED8B080157E26F0F7243A0D458A7A6CB4837AD8891C46A722CC307B6EC57A2ED889831116FDFDBD5F2EDA6332AA71ED312EA72FFA5A5C227D6FC9876A6D28E4C6E2AA73A7CBC4468999412830C61F8A0CA79EB1179C655AA8F6729780CC0FCA0DB6989091F997438D1F792A8F1A7BFAACA6F989F6160A7C6E14DEA5D51DC4AE4DF7D046E56E51DEB900D9EC3A760A57973823BA7979D8C68ED7548235BAEAB627B4F8AE9B6F7D967924C525F9141FE31873CE55CB99F3779A4F781E79C",
	mem_init0 => X"F35029A34B9B6C9ECDF4D2404CCF9A4F1D56B52179BAE35189CA2A161F04323694B51627092F009CEC3C9E6A4AABE80AD71CDB1203D957221A0B8A9656A975750C3FFFD5F6670E563FA7F91E663E8E3E5473B6078768485FBC5075B5603B61A05ED2423083B987F206785D2DC063CCBB4F1F5413E7D6CC9C2A5E065B172763B4B9A5C27BB61DF2820706D779D209E70B2A1DE46DBDCB4CA781904EDD05156D466CD2498E92CBFA74D2D8F58C6E3A311A7A103763B58162283C3F6B04F93F3249609E0E05CC6CA026701C9AE0DCBDB26E0FD5110DA24D2C915C67D50502664098B425288B14A5DD5BF20F41273720508E769B347703E4D41C717CA12CE686E9DE",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "AudioSynth.AudioSynth0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sound_rom:rom|altsyncram:Mux15_rtl_0|altsyncram_cf01:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	ena0 => ALT_INV_s_dados_ps2(3),
	portaaddr => \rom|Mux15_rtl_0|auto_generated|ram_block1a1_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|Mux15_rtl_0|auto_generated|ram_block1a1_PORTADATAOUT_bus\);

-- Location: LCCOMB_X52_Y37_N16
\aio|dac_data~77\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~77_combout\ = (\aio|process_0~0_combout\ & ((\rom|Mux15_rtl_0|auto_generated|address_reg_a\(0) & (\rom|Mux15_rtl_0|auto_generated|ram_block1a17~portadataout\)) # (!\rom|Mux15_rtl_0|auto_generated|address_reg_a\(0) & 
-- ((\rom|Mux15_rtl_0|auto_generated|ram_block1a1~portadataout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rom|Mux15_rtl_0|auto_generated|address_reg_a\(0),
	datab => \aio|process_0~0_combout\,
	datac => \rom|Mux15_rtl_0|auto_generated|ram_block1a17~portadataout\,
	datad => \rom|Mux15_rtl_0|auto_generated|ram_block1a1~portadataout\,
	combout => \aio|dac_data~77_combout\);

-- Location: M9K_X51_Y33_N0
\rom|Mux15_rtl_0|auto_generated|ram_block1a0\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"273BD34B072F4970EF7AA178657CA3759B9F9694DC2E512F24387744D46F66B4FC3DF787E5ACDEC5645DC3849E914E87652D3F3B35D8A7D4C3D0ABDEE1D25E9C1A597B9C832D4456C7CF6FF1B179C986693855154EEC82F7EC99E58A6708E48A543277B8D16B3FB76686E0DFB82D7703E7BC8936D3CC61E273C8878B7CCEDA62847324DDCBAB5097512B7C60C072570A22752400080C826F88E218EFB5A7AD7B710B21F34E06A966A563B5149724A3BB20E8D70CE11EB4F936FCAC2EB021EBEAE6BEB3E3635435D5EF0C5D597254079A1034E42AD81EE7B91AF7C2A3726A89F55DFD43EB63E7EFA5F8CA9FF69A34059F07EC3C0108E1783B2274DF9DA4DE6142",
	mem_init2 => X"E9D76EF213BF164C8FE998B7958F11591A8FD28B46DA78ABD819A96232F7EBE7E9DFABF133D31D5251EE22476CDE6723DE4459AFEABFB675FDBFBA86416DB84DA8F7F832703B71EC45525315E246D38C279F1B8559443DCC2B8608E579678C1D134D04A53E65C09C65C7419995A0A79817431FB3DD2F60BD67C83471106E4A68A1AB47F94B6CDA625338791596CD5F5A44252DB56366E3F07B85A27DD8822DAD14ABD5146EC6686D9E0CE533032A4475D32A2A1D0C4354BADD8C2415EA89241D52025F0DA6757EE8BFDED21761FDA49D1E27E465902F46BA031BB84704D74BE78DA297ADF0D5556919FF46FB9E3C60274DCC7B53CBC6C956E238FF73037B1B1C",
	mem_init1 => X"9F2103966BCB50615D821801084E010BDD6EB09800C71E38F9F6AF03DADEDF7A0DB81B8696AB76FC923BA17E0C13DB9DA81CAA158416A09D3E96616F7BFF4C0CF5822851E9FD4D472921ACBEA465683FF905C6E82BC7D0D040991776E7D81F12B8B020648A3477DFDA28395DD1BB21B3279B0006C15937BA2423981630532DA02AC5CBAACD8DC94BD4005A402AE24EE84062BBC7DD7A6021AA58769B7531621AAA5A5C4FB809F5B69F6C58342C1995535BCD7A4E6193F2069D55F6E65B9DF2EE8382D22017791BD5158671007B5D0ED8B48461A5B42318690D1DEC709E6CFF54B5660133BFB4B156AED78320DADB8A593B88A5FA574E4D277745B4863A5BA08A",
	mem_init0 => X"BD716AFF7105B952D5BAFEF7D8A719B7B0E5F2C7BDCAD9DFDC674FC5004CC9CAD8E6C2DCD51FBFDE09E74B50F189F34DCE05FF9B2F2BE96F38F8C308E5C7C28E68592EA55D6A691E47C00BCC544A385CFC3B4B67340099F5F86848DC67A1A4F42EE09CE98181E994A76C3FF1D883DBADEC3C8397018DCCEBA7FF4A70C8B9DF0C2F3489C61099E4E47C03AD2E32804B49C681D6431F601CCAD311AC77AD066EEE8A564802331EFBC37C36072E9EECA80885AA372BF4887FB0BF4C88257817C3AB4C1AB7013EC9B4A0F735329813E455081DB65B1495F78234D59B5B0609E44BA623050A8A83DCECA530662D31F919D10DF624195A26BCC180797233C7D689B486",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "AudioSynth.AudioSynth0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sound_rom:rom|altsyncram:Mux15_rtl_0|altsyncram_cf01:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	ena0 => ALT_INV_s_dados_ps2(3),
	portaaddr => \rom|Mux15_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|Mux15_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

-- Location: M9K_X64_Y41_N0
\rom|Mux15_rtl_0|auto_generated|ram_block1a16\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"CDCFB0F416F137D427E48A7D553E80D7EFE3B68FBB7A26A0F757F7E61804B9780CEB61C1D1EC3C1142D3A29E8A3C79FDF12760BE7F4D009C7AD1E999D124386A0520D284381F2E15E04A40AF112A4BA01F5ACFC04BFEB9EC92B123E56D9722BCA882A4F045834898BBA3CC083F5DD6DEE9364946A6FE76A327FC86B086EAF71646363F9D70DF40492B12854661165AE7A6225BBFEFF6A7CECEF561E55E3979AB12D59DF5268F7290C9F5799ED13FA9B92CEB2526CFDF74DBED117C13F0135C1A9A5D711E608C0D6FC06367FD9B80FC98CF9338CB1E3ACACF3478E141153D8491579183B33405910C49E408BD81E50FD6D0F8CA066F961A7C0580CBD4353DE026",
	mem_init0 => X"BBE71121D79B442A9FF8F2A2E78301830183CE8A9E3BF2A845B3D70911CFBB1E827953C82F1BBE71121D79B442A9FF8F2A2E78301830183CE8A9E3BF2A845B3D70911CFBB1E827953C82F1BBE71121D79B442A9FB8F2A2E78301830183CE8A9E3BF2A845B3D70911CFBB1E827953C82F1BBE71121D79B442A9FF8F2A2E78301818D160163FACB98C794A178AD02FA8497B4B0C63AB135A2F372F86288A46C5867EC1EF8012FAF58B205078C50CC22ADF2000D04B973E042B6503EBE1D52789D29A7C310DC7C5DF7CC4A5663FC3AE3F98560B889243DFBFC2E572C49CD8CC865C4BDDA1404B0E4B7383D5E7B0651B1227D8504FD8BB20BCF8330C15F0BB7701FC",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "AudioSynth.AudioSynth0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sound_rom:rom|altsyncram:Mux15_rtl_0|altsyncram_cf01:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	ena0 => s_dados_ps2(3),
	portaaddr => \rom|Mux15_rtl_0|auto_generated|ram_block1a16_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|Mux15_rtl_0|auto_generated|ram_block1a16_PORTADATAOUT_bus\);

-- Location: LCCOMB_X53_Y36_N18
\aio|dac_data~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~78_combout\ = (\aio|process_0~0_combout\ & ((\rom|Mux15_rtl_0|auto_generated|address_reg_a\(0) & ((\rom|Mux15_rtl_0|auto_generated|ram_block1a16~portadataout\))) # (!\rom|Mux15_rtl_0|auto_generated|address_reg_a\(0) & 
-- (\rom|Mux15_rtl_0|auto_generated|ram_block1a0~portadataout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rom|Mux15_rtl_0|auto_generated|ram_block1a0~portadataout\,
	datab => \rom|Mux15_rtl_0|auto_generated|ram_block1a16~portadataout\,
	datac => \rom|Mux15_rtl_0|auto_generated|address_reg_a\(0),
	datad => \aio|process_0~0_combout\,
	combout => \aio|dac_data~78_combout\);

-- Location: M9K_X78_Y36_N0
\rom|Mux15_rtl_0|auto_generated|ram_block1a26\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"1CB84A00BBBA00E43A00C3C200C82270DDF67DDE1E7FD1EC7FD1117FD6F167D709419FF7400C83400878401904461BBECF1BC3CFFA3DAFFA222FFADE2FF8E1EC79BEE8011068010F080160880177D9C37871F347B5FF4445FF1BC5FF3C3D8F37DD8722098021E1002C13002EFF98290EBC68F6BFE888BFE378BFE787BFE6FBB0087A3E67D28FAF08E3EBBC98FA10F43C87AD0F361143D77930F4A1EC3D0F5A0E6C2283AEF060EB41D83A1EF60EC845031DE140D68330343DEC1D908B067BC281AC0660687BD81A211606F78581180C60D0F7B034422C0DEF0B03301AC0A1EF306884DC1BDE170660B5C143DC60510D9817BC2E0DE16B8307BAE0A21B382D785E",
	mem_init0 => X"1198D7BDEB1A985D6371F92C64D0858CBDE9B396C0E2728BCD4E508429CCEF4538BE0FA3945EE67284214E567A29C8E06D39B2F7A6342164C693F198D7432B1AF7BD63310BAC741F05C6BA1198D7BDEB1A985D6331F92C64D0858CBDE9B396C0E2728BCD4E508429CCEF4538BE0FA3945EE67284214E567A29C8E06D39B2F7A6829B4CFBC93518215367BE6532820CD32B6FC3A6EE85EA658BD1A657A17765C3F6D4CB30414CA67DE6CA8418AC93DF32D94107CD95B7A1592742F59285E8DB2BD092B240FBEB259821B6573EF564C20CD66BEF9966A481E2C88BD0ACD3A172CD42F444D1E04959A67DF59ACC10C9ABDF3A9B61066935F7C0935242F536C5E852",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "AudioSynth.AudioSynth0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sound_rom:rom|altsyncram:Mux15_rtl_0|altsyncram_cf01:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 10,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	ena0 => s_dados_ps2(3),
	portaaddr => \rom|Mux15_rtl_0|auto_generated|ram_block1a26_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|Mux15_rtl_0|auto_generated|ram_block1a26_PORTADATAOUT_bus\);

-- Location: M9K_X37_Y40_N0
\rom|Mux15_rtl_0|auto_generated|ram_block1a10\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"A64B5FBE8552BE830AB579F4152A64122B4C978E52D820BCB6B0BEFBA56305F56ACDF66AD5F418D4BBEFA1ADA7A083694E3D265A8904CA9505F3D5AA182FA9542FBF5A4CA144969F7D09A53D06156A73E82A54C82656A82F9CA5B0417969617DF65AC60BEA959BECD5ABE831A957DF435A6F4106969D7A4CB5020BD52A0BE7AA0E0AAA7AFA094B79050D557C7D8D553E82CDB53E7EFCAABB417CAAB1BE3EAA90A0BED4D8DF5E5558504E55582FA66B4830226AA817D02AA8C81824ACCBE83554E4143554F5F63554FA0B32B6F9FB3AAAFD05FAAA6EFCFB4A6682F955637D79556141393520BEBDAAA0E09CAAB05F48AAB02060D4932FA0D55390705553D7D04A",
	mem_init2 => X"1A04F354C37E9CD5B0505035680BF60D5A7B82C3569F5F1994A7E817E5A998FAF96A63419E4AB06FD112AC0A0A04AB397EC32ACF2058CAB7EBEBF2ADDD027CAB619F4E6A5828399A9605FA06B599C141AD4F2F886953E40BFA54FD7D7C9531A04F254C37E9C9520505025488BF609527902C6549F5F5B9527E813E56B98FAF94DA732057E5B71AFD3C4B60D029C4B6047CC0496028140692337E206D23940B06D27CBF58ED27EE04CE5A7F5FAFE5B7F3077E4B71AFD3E4B70D029E697057ECC6920281406D2033E606D23940B06DB3CBF5865B3EA05CE5B3F5FAFE4B3F3067E4B31AFD3E6930D029E693057E8E6D30681446D3033E6065B1140B065B3CBF5064",
	mem_init1 => X"F27F367BA815FE6CFE5FD71C99FD40AC3B33F27EB06647CA0640CD8F33F5819B1C50360326315FA806CC0680B30D980AFD4F337036053E66E0D7E6FCC9C33029F9B38EBF27F3673A815FE4CFE5FD33D99FD40AC3323F27EB066C7CA0640CD8F33F581931E50360326315FA806CC0680B119980AFD4E336036053E64C0D7E67CC33F95FD621CC015034FF31C327E4C0C63E6C0D9E398069FABFE63DCA02B019C78AFEA7E3381A80A63CC7FABFAC0338E2606DFC67064FC98398FE5811086700D7F53F8CE1D40560731F95FD478CE035014FF19EF77E580E63E6C0D9F19C049F9B8E33FCA02A01CC39AFEA7E3381A80AE1C67F2BFAC439802A069FE63864FC9818",
	mem_init0 => X"602B1C38309BFAB00E1FCA80D38387FCA7E53FE3C1CB0151F8F00D5FD9083C38D406980F1FCD3FA983C7FEC80A9FF1C0EAFE59F87006B035801C3C49FD58071FE5406DC3C7DE57F2DFF1C06580A8F87006EFEEC01C3E6A034C071FE69FD4E3C7CF6C054FF1E0357F24787003581AC01C3F34FEAE070FF2A026FFC3C72BF967F03003FF9AC0691FC0F8D4FED9C3F00CA8055800FFE55FEA8FF8006C80D4E07E076DFCAC381FF3580D67FF00329FCA600FC79580923F03F1A9FD93FFC01D500AB001FFCABFD59FE078C901A9C1F80ED3F948007FE6B01ACFFC00653F96E03F072B01263C0FF357FAA7FF001AA0157007FF937F2B1F81F8920353C7E00CA7F29800",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "AudioSynth.AudioSynth0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sound_rom:rom|altsyncram:Mux15_rtl_0|altsyncram_cf01:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 10,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	ena0 => ALT_INV_s_dados_ps2(3),
	portaaddr => \rom|Mux15_rtl_0|auto_generated|ram_block1a10_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|Mux15_rtl_0|auto_generated|ram_block1a10_PORTADATAOUT_bus\);

-- Location: LCCOMB_X53_Y36_N6
\aio|dac_data~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~68_combout\ = (\aio|process_0~0_combout\ & ((\rom|Mux15_rtl_0|auto_generated|address_reg_a\(0) & (\rom|Mux15_rtl_0|auto_generated|ram_block1a26~portadataout\)) # (!\rom|Mux15_rtl_0|auto_generated|address_reg_a\(0) & 
-- ((\rom|Mux15_rtl_0|auto_generated|ram_block1a10~portadataout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rom|Mux15_rtl_0|auto_generated|ram_block1a26~portadataout\,
	datab => \rom|Mux15_rtl_0|auto_generated|address_reg_a\(0),
	datac => \rom|Mux15_rtl_0|auto_generated|ram_block1a10~portadataout\,
	datad => \aio|process_0~0_combout\,
	combout => \aio|dac_data~68_combout\);

-- Location: M9K_X37_Y38_N0
\rom|Mux15_rtl_0|auto_generated|ram_block1a23\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"D1E4F5ACFDDD1452B6E8C9E4F46F21D635854AE83674895AFA822025E86424428FFA57329DF35312E778712C62C6B6B066F405F177A9A28BC0F35E8AABB25020B4068943AA25A0CF315A4556291602A040A4D1551FACB03D94194EE8F203F560D6D734634AE3EE74BCA4FA94CEA5FF952442616A40441D75A912E6C3613A1AC6D97E28FCE0B503906AC55F3D4A02E3AE35EA97EB2D2A70B205688538A98BDAD0305DAB2963152F886EAD17C25F10C1A9AEC5F5D51B32A16C93432088AD9980144337DA1F98D571E16EA4C66BF76B7B43CB24573F41C3B58DEC15B6617800CCD1888278949B47C44C5D0FF1BE4CEB831CD5F470732875E0734A667D06061DEACE",
	mem_init0 => X"2F14DB7BDB664E3113DD6C45BDD8A8C9D5C884BB92886EE71B72484249AE17A50BCAAA7A14BD0EB2484249DB1CEEC2293BA422757262A377B446D739118E4CDB7BDB651E85AF4355585EB42F14DB7BDB664E31139D6C45BDD8A8C9D5C884BB92886EE71B72484249AE17A50BCAAA7A14BD0EB2484249DB1CEEC2293BA4227572E732CDA6F517EAF028C0CBDFC6369B3C366F44A24B425112B99D488A42D24522F66C3CD96E63FBD3031C0F57E8AF65B344E70C4264EFF5030A67D51AA0CD79FA8046CDCE78C6E992C85740A87E39F9A101CE4B261E4C85DAEDA5ED776A3315BBADE96DD6E84C9E19348CE02167E71F8540BA84D265D8C79CECD88057E7ACC156",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "AudioSynth.AudioSynth0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sound_rom:rom|altsyncram:Mux15_rtl_0|altsyncram_cf01:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 7,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	ena0 => s_dados_ps2(3),
	portaaddr => \rom|Mux15_rtl_0|auto_generated|ram_block1a23_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|Mux15_rtl_0|auto_generated|ram_block1a23_PORTADATAOUT_bus\);

-- Location: M9K_X78_Y38_N0
\rom|Mux15_rtl_0|auto_generated|ram_block1a7\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"1ABF43CA8181E2C45FFF96E33C0C076E17E25BDD1019E8413D31FE268D6B8E96C60A4A0C6D2E3AD62C8FF1979042F301177B48FD0EDC060798ED3FFF4468F0302A785FAB102C44675504F48C00DA34A5C4DB180EDE3BB5971558BBD0867E42F46400571F63F50487381CDC7AFFFDBFC6C0C195317EABF6A911C1ABF39269D96817D2DC80646592CACEF621A0BD652E8DE83CED19BD3548E617999B75BD3C739FF328365AB67EC4B7C855FDF1639C99059853A1079D66327ED870AECDE38B6080692078B87EDA7FBE4B8E1322BC79206CE65187CE8D7B97D9B18E5C10157B04B72064A964FACC018C70D094499985E6BBD4D099D230FA13A2D250BE9EE423232C",
	mem_init2 => X"BF8912B53E9819164134547CA8FFE7D8964D4C2FD25A76A8C6BD380FAED31D6E585B5C72DE7B1C67FE82589A2C8B4810193B29C8D9FDDB4BB2E9996EA00675AC616C7B49797259CD2383F8D2A75AA4684502F35375A906013AB2753653F751F9A4C4BC9B842E93AB54B85177FE42729BACF902DA336D23582E01871ACF56725A812D1941F817BDB9AA409880D71C0AAE5BEC204BDC3BCE05079A7D50284B0119801DBDB5A89D8698F4FC369F3037EF2092207E1453FB9BF66B890A3F11359D3DFB25835B1FEB7DB36EFD6EB03A07FE31D1C5362B29D8303CEBE2F48108C9BF581E133F4640977CA97C07E1581D204D30744F03485D0810213306F7809A0D43AC",
	mem_init1 => X"ED27B434266EC86884871108DA84E2966DBF3BDF7239703E127CF219C2F7962451CCCBE4490D6644F49F81E3AF5D396D75A67A6F10823F163F17B2302C98F425AA5EF9CCC16E9CC862ED3D31F871639A1E4A28E4144FB9F7142D53A177365FBA2F481CB8AA0C696D0CDC74031A291E3A5236A4175C5B6FC91822AEDC297A2B3C74651E2BD1734B88D60732DA85BB5EB100812F52518FCA7706D9BA15C3ACE8DCCFBED858D19F8373C4C935DC3A18E7E0F913EEE58A4B4829662AE2256862BA70EBCFA372DB049973166DF24B13A0C68F1A2B9E95BB8AB996BED2DAE58883760F818A7ABC45368DC313E0674E5E4820CC4E8CA3C57A2E69711AC0E65B50B7EFD6",
	mem_init0 => X"09DD9C184A4DF94DB988CAA1C8079956ADB678FBEC538D4C1B3DF29FB05633B96B9185C324FCEC73383092E4007B33119B1C220F32CB249CB1F7DAF8F419367BA6D0AAFE6750C0DF438669FEA705B06107BFFAD0662B31CAD50E6595F62663EFB7BA16F2FCF5305E3FBCCE987249A68CD2AC70B340C22C604E808C57946E7E5C0DD937AA00A949D971E9BB86CACA39E53660F6470583199C264366B2258EB2F29FF605C595117C1806E999F7CF82E4CCB8BF200F65651CB765307A6B8CCE7CCE1321F326B0C719793C44D0E29A1AD5FF5074CCFF5835F2665C55FF56B6A68E1644793D35C61AC99F0990FE7CE663C9BC994DDA714D0DE009FA3A6E4E83E7DD32",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "AudioSynth.AudioSynth0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sound_rom:rom|altsyncram:Mux15_rtl_0|altsyncram_cf01:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 7,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	ena0 => ALT_INV_s_dados_ps2(3),
	portaaddr => \rom|Mux15_rtl_0|auto_generated|ram_block1a7_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|Mux15_rtl_0|auto_generated|ram_block1a7_PORTADATAOUT_bus\);

-- Location: LCCOMB_X53_Y38_N26
\aio|dac_data~71\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~71_combout\ = (\aio|process_0~0_combout\ & ((\rom|Mux15_rtl_0|auto_generated|address_reg_a\(0) & (\rom|Mux15_rtl_0|auto_generated|ram_block1a23~portadataout\)) # (!\rom|Mux15_rtl_0|auto_generated|address_reg_a\(0) & 
-- ((\rom|Mux15_rtl_0|auto_generated|ram_block1a7~portadataout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rom|Mux15_rtl_0|auto_generated|address_reg_a\(0),
	datab => \rom|Mux15_rtl_0|auto_generated|ram_block1a23~portadataout\,
	datac => \rom|Mux15_rtl_0|auto_generated|ram_block1a7~portadataout\,
	datad => \aio|process_0~0_combout\,
	combout => \aio|dac_data~71_combout\);

-- Location: M9K_X51_Y35_N0
\rom|Mux15_rtl_0|auto_generated|ram_block1a21\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"3E0F9638C53A7F2E366BBB38A2E2774170D9E2B592EB28C07FABA78E3D4F3E386EB2B92B6817163087ADE488ABD7DEFF4FAA7461BF5E61D903CF7EDEE33B6CA9199E720D534147F6337E0CB5F8768A7B036DD277AF856C0A400FBB94AAE6BCDFFFBF6D537D295E153486C0ED49B193E451BF2B1DDE597730310F2098EB6BB0CC81AB94E7EFCBCDDFFDE90B9303928EB2032810ECCF336EDF7F1154016F0ADEA05EA926FE571EBEE472D1A617C371954C0E978D8A049C85BE178DC2ED1DD3489B4730F9B33253B1B4E22E2B03974D4D2B0FFDC55D95F95A67D928567C1779622BABA5060B7AAE6320372714A7E7AED09E0A333AD8F36043AD64CDBAB3FC44AE04",
	mem_init0 => X"40D000B73879F888D3416EA195B0048DBFE4ACF552FA69DDC083C625FFE9FA874B39139A5C2BF2FFF48C78207772CBE955E6A4FFB62401B530AED0196223F3C39DA00160578BCC6EC67A3D40D000B73879F888D3016EA195B0048DBFE4ACF552FA69DDC083C625FFE9FA874B39139A5C2BF2FFF48C78207772CBE955E6A4FFB6846BF131725920E145FE2B5859DB016201335AA8434AFDB110090CBF12D2115ACC814600D1BE1AD435AB87149ADE8C8EFE21514D55AFB4E456D9B19B9324A6D790520A5BABDC2076746D36F8F1508EA53D3127FCEBF6652ABDE5B8127B7FB7920769EF75299BF5CFF9720F295E42A3C7DB2D8B9B800EF57694528278DD493272",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "AudioSynth.AudioSynth0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sound_rom:rom|altsyncram:Mux15_rtl_0|altsyncram_cf01:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 5,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	ena0 => s_dados_ps2(3),
	portaaddr => \rom|Mux15_rtl_0|auto_generated|ram_block1a21_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|Mux15_rtl_0|auto_generated|ram_block1a21_PORTADATAOUT_bus\);

-- Location: M9K_X64_Y35_N0
\rom|Mux15_rtl_0|auto_generated|ram_block1a5\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"F4452E1DDF2D8FC3E7A0B0699259800F7AE18C56DE603AAE64432E906F41028E42D249684E28105EC12E9844CEAB80CF6D4630EBDE00334932C1A0BCF87E369F770E9445EF888A63FF7E6B900D5F4118E424B772A375C1E05884C736A6C89116D4DEBD32DC81548ED0D8281ABD82AD8AA98EC4D98ED18FA1D6911FE692DDBDC01D97D8CE62C1D3E1CD6704B23CA62CABA4E76D43C40F2B3744988995CBCCEA1EF8073B7B37F2EA95C8890216B693EFAFAF1EE76C0F989133EEBA9540BEE6EF7E351F7D5001D4E2462620BF51E8A20CDDB9C3F25621E082820DE4A5EFDBBB15AE2C04C848C7F821EA330B159BB9B7445A43F70F5246368AA2F2B0ECB6C653160E",
	mem_init2 => X"DFB201E9C6BB8C574EF12F276A09BE53BF60C3105A9065CDC11633DAD4CE48A3B88A16A27FB462BDDC22654A9E88ECCFDE9BF38C2184CB4DF1AB7685F313AB18212E9BE1599EF2CCDA7D0EC24C7016F8D7FBAF3816777092F7ADAE9FBDD2CAC8A3230C88858C8C9486E29B84F87D9D3758669AEDE3442CED7D6BB777C30E95EABE53588F365D2D66B2610D9A2AD3DFC4F2EDB73B24A7C106CD0F3B069CBC5AC679964628F083153F8D820E7B1F7BE69444CFEF2CEE9AC619384412FDB3F39F29F7F9B37BB0234EEB044377A46A979ACAC454496FF85F782B272F897F3534B90EF35E2DA1A1AE38B1CED0FEDE7F1F40974E4A11D489E7C43AE77E517950DDC284",
	mem_init1 => X"DE138C155E752A215F8AA25AA4D7B90C7EA22AFB58ACD79315AF16FC03905C956E900C4B5154B674A2D73FD7096673585B017BECD81727AA5E628CBC087415B97667BEFED12D0F7A2A928D4CCF21E5958D449E0DA5BB538A9D3268D5A2C8A1D0C9FDF2AAF2C7649EFDED5CCA73B3036F9556D52D8C2457ED71A8744823C90B3AC6037FCAD520D892DD099BB3B9CB1206198671159B3FA25B623C6A76009FEE28B15ADDF18833C735647B77666A2D3FA9EDA3C0D86DBF0FB7E3F96AAE68D9283785BC8521B49807A3A1FE6D35BDE521E13EB64E98AA964781A0F0249E4EC3A486A038BB1991125D9531C33EE7444A572EB8C06FF95A841B125BA133657739E650",
	mem_init0 => X"8DB4884CB69EC59B401AFAF56CC4F8352DEF512312FA2720A51527635696FEEEF5B64D78928487530346AA5C2C97BFE5F9B6A3660FEDF898C7D9BD0C2EBD97F245493164839D58EFCA2E7105F19C1DF5152FF8AE809F8B1C3EE3A75C7E0E885CB6E927BB600CF0AA1CC4E8353234D01732F7DAC0A405259C7E97BEEEFFC99D78F2AF6ABF6A8AD6BE20B49465F0FA71641A0600281C1B1CFF00BE432449C440F0D72773E9F3117807FEA7C9DC57D3648D2947361A2680D6AAB6F0FA01ECDE48F46FA0A34FFAFCBE8475AFCD9B7AE0CD527BAC3B1CEC6F2DB06BE0957528C1D36BEB9843F72EBBE5F9CBFEE764E369EDFDBEDAB233838AA8D8C42E0A4C87F82574",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "AudioSynth.AudioSynth0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sound_rom:rom|altsyncram:Mux15_rtl_0|altsyncram_cf01:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 5,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	ena0 => ALT_INV_s_dados_ps2(3),
	portaaddr => \rom|Mux15_rtl_0|auto_generated|ram_block1a5_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|Mux15_rtl_0|auto_generated|ram_block1a5_PORTADATAOUT_bus\);

-- Location: LCCOMB_X52_Y35_N24
\aio|dac_data~73\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~73_combout\ = (\aio|process_0~0_combout\ & ((\rom|Mux15_rtl_0|auto_generated|address_reg_a\(0) & (\rom|Mux15_rtl_0|auto_generated|ram_block1a21~portadataout\)) # (!\rom|Mux15_rtl_0|auto_generated|address_reg_a\(0) & 
-- ((\rom|Mux15_rtl_0|auto_generated|ram_block1a5~portadataout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rom|Mux15_rtl_0|auto_generated|address_reg_a\(0),
	datab => \aio|process_0~0_combout\,
	datac => \rom|Mux15_rtl_0|auto_generated|ram_block1a21~portadataout\,
	datad => \rom|Mux15_rtl_0|auto_generated|ram_block1a5~portadataout\,
	combout => \aio|dac_data~73_combout\);

-- Location: M9K_X51_Y40_N0
\rom|Mux15_rtl_0|auto_generated|ram_block1a20\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"4C8A4AD631AE3951BE129C110654112D93E48FC7F51BDC14B14A378A4988E69B8DD59E6918214B05EFA4EF772947FED7FC7C5ACCDD77E1FDD3429E67878423534127F3F7833954CFDD576861036F1BF67C7FE03E786A54F80796D4CCC9B81C0EBB41D95D90AC5005FB61BE5F62655DBA698D19DAC0C3D72BC042547DC0CD7C24A40F207A9CB397367BB2B44CAAE241DBBF8468BA07DFE06E206E97A7BACA49510B795D1A2DDC7D85804C1E256C56DA112111CA1559B9A0C96EF412FF85084755981A42E510435667591C49F15F156BDD54571C8E74D521BDB2B95036797F0758F02336F8AC434EB57429DF5A412A211F53F95980F03E5D22588D6171664EA66A",
	mem_init0 => X"CA8E79BD2BA1FA9601F563A1A67EE90ED10334F432A0FF2F70B45684C31D591093C6AC7921135718642D45A1DE9FE0A985E598116E12EFCCB0B8D5B00D2BF0BA97B3CE2A6EF65395394DEECA8E79BD2BA1FA9601B563A1A67EE90ED10334F432A0FF2F70B45684C31D591093C6AC7921135718642D45A1DE9FE0A985E598116EDFE04CAF190B1CC62AA57EC9F5573AA712F52D601BDD710A581BC10AFBCFBAF4AF49C19CE58B937ECF190329FD2FF53129FBC79DD60857CC91343343BE9BB871AFFD0AC0E1027F9A8737A319CB2A5409B0544732C36856943321047FA13F21FFA821332A5A85B0F338DBA364099535F6303B10567E9021C0D06FFD6183765F64",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "AudioSynth.AudioSynth0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sound_rom:rom|altsyncram:Mux15_rtl_0|altsyncram_cf01:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	ena0 => s_dados_ps2(3),
	portaaddr => \rom|Mux15_rtl_0|auto_generated|ram_block1a20_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|Mux15_rtl_0|auto_generated|ram_block1a20_PORTADATAOUT_bus\);

-- Location: M9K_X51_Y41_N0
\rom|Mux15_rtl_0|auto_generated|ram_block1a4\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"E0019FCE1FDA3BEB497BBFB85D31592AD23111E57CA4222D8D885C011EF4A7759676EDCD35DCA5EF10074236368884A7D4F111896A93519743BFBBD25AFB8B7F0E7F3000E25C0303DB0BCCC45BEAF798481BE46CB620653B054145B7D11B4874357D38F6A92B60E81A2C2125DC2F3E5A4C7363255FB5260393263E632F425EB6C9357097B6C60CE09197AE8B6691BDEE67D946357AF61CA940BDE601309F4AE4B3401F6B34AE01226A9E0FC47E17DD7F6670BE417965C7BD6FA0BE24EBF237C12B48D9597BCADD00EC2A36E4FE82D88736981F70BC54C0D545A07503E1BB6EFBE3B4CA41FF4CF72F41BCDB8410BF7A216C3854E75906630089A64BA3859DB630",
	mem_init2 => X"4CF64FD9F7FDA76A5E75727AD1D25E17DA9B6667F476A63BB239165142139B7A31D41F955EB257C0B0348100B16559043CF8778591700E99ACBA20E312BC5BF7DE3D3E0A219012509BA9E6E79323A66AC579864E56FA5166F23493179E9739C12BDFEE1004B9A9AD0DD732A77355A4CF6CD3E2BBFCD288A463D27EC4D40ACBE232C2A548C9AFC26EDB3862E6A87DDCE79A5EC798C770FBB6959998B957E97C8F1C24D6DC488BE69ABA408E159F91224807B3111E427E238C9D07383DB7CD76F2FC3748C65B3BC3F947BB3A5D0101DE24D7234958B3C7D484E6C29AD347CCCD091697CCF5F8BA70C29AD14CF3F5ADBAEAC56CE021AB4C43883EB6D49F6E1D32C4",
	mem_init1 => X"4F16A71EF3D702F5B4AB643CC3CB8430E059E35CF881881B896F9CE4FBBFA4731BAA55A89EF5C85BFA5A6E118FB31EC6A48CC56C0C8A58E6DFAAE44057E9E5B97BCD95B71B554E011240D1A6703A002C44DF72C5B167F1E8979F90A51AC771D888E63B3DE7E022D437A5B97C46C7060F7CDF0CBE08FBC963DB8FB73A34097CF85B897FD54C3EEB466E8D2BB92A500E3005EE953D9C2D44CEC4AA26CE009730C9C271CB5965B82689F4FC6D556654ACE7D97E4EC5F4F0F5E870469C00DD28A6E988C0527B6DAB4AE58AD2B4C013F6DAE6898AB44FFCE99B5E050F0D01C9D816479CA1F815541C4D06E9BE259636CF1BC6CF716FF889A2DD48CDD1AD64254A85D6",
	mem_init0 => X"E065B7319B88E2289749FE16ED083C03605BC2C3CE8CE39F9513D53729D433258A080E9F5547BC52ADB82F5D5FDD13547BB6A316847753819D989A7EA35C23A7C9401F091C77BD8D5221EB02603DBA0867192F8C19AB464F61AFB899D345D8DC258D023749A80A498AF313FFF78BBC08113D5E1861983900282ABEFA6A7025409F1F0101E97F25AC4C2DF729B30D1FD8B9F334299DC44294AC43DDC35CE93D859E2236C1F95CCD3C767FBCDD6EEE7D123EDAF237C7036E7B79747A1132ABBF7B985F9CC5B3E29EFB31A2680C7CC990D383EFDD82AC615D0B015E968099818EA08AD5210D5A1F46003D2D46BBBD96ED43F83DA7083C95C1DFA747F81DBAC32C2C",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "AudioSynth.AudioSynth0.rtl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "sound_rom:rom|altsyncram:Mux15_rtl_0|altsyncram_cf01:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \CLOCK_50~inputclkctrl_outclk\,
	ena0 => ALT_INV_s_dados_ps2(3),
	portaaddr => \rom|Mux15_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \rom|Mux15_rtl_0|auto_generated|ram_block1a4_PORTADATAOUT_bus\);

-- Location: LCCOMB_X52_Y38_N12
\aio|dac_data~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~74_combout\ = (\aio|process_0~0_combout\ & ((\rom|Mux15_rtl_0|auto_generated|address_reg_a\(0) & (\rom|Mux15_rtl_0|auto_generated|ram_block1a20~portadataout\)) # (!\rom|Mux15_rtl_0|auto_generated|address_reg_a\(0) & 
-- ((\rom|Mux15_rtl_0|auto_generated|ram_block1a4~portadataout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|process_0~0_combout\,
	datab => \rom|Mux15_rtl_0|auto_generated|ram_block1a20~portadataout\,
	datac => \rom|Mux15_rtl_0|auto_generated|address_reg_a\(0),
	datad => \rom|Mux15_rtl_0|auto_generated|ram_block1a4~portadataout\,
	combout => \aio|dac_data~74_combout\);

-- Location: LCCOMB_X53_Y37_N18
\aio|dac_shift_control~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_shift_control~4_combout\ = (!\aio|process_0~0_combout\ & ((\aio|dac_shift_control~q\) # ((!\aio|bit_clock_1~q\ & \aio|bit_clock_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|bit_clock_1~q\,
	datab => \aio|bit_clock_0~q\,
	datac => \aio|dac_shift_control~q\,
	datad => \aio|process_0~0_combout\,
	combout => \aio|dac_shift_control~4_combout\);

-- Location: FF_X53_Y37_N19
\aio|dac_shift_control\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_shift_control~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_shift_control~q\);

-- Location: LCCOMB_X53_Y37_N0
\aio|dac_data[16]~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data[16]~63_combout\ = (\aio|process_0~0_combout\) # ((\aio|bit_clock_1~q\ & (\aio|dac_shift_control~q\ & !\aio|bit_clock_0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|bit_clock_1~q\,
	datab => \aio|dac_shift_control~q\,
	datac => \aio|bit_clock_0~q\,
	datad => \aio|process_0~0_combout\,
	combout => \aio|dac_data[16]~63_combout\);

-- Location: LCCOMB_X53_Y36_N14
\aio|dac_data~79\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~79_combout\ = (\aio|dac_data~78_combout\) # ((!\aio|dac_data[16]~63_combout\ & \aio|dac_data\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \aio|dac_data[16]~63_combout\,
	datac => \aio|dac_data\(0),
	datad => \aio|dac_data~78_combout\,
	combout => \aio|dac_data~79_combout\);

-- Location: FF_X53_Y36_N15
\aio|dac_data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~79_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(0));

-- Location: LCCOMB_X53_Y36_N12
\aio|dac_data~110\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~110_combout\ = (\aio|dac_data~77_combout\) # ((\aio|dac_data\(0) & ((\aio|left_right_1~q\) # (!\aio|left_right_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|dac_data~77_combout\,
	datab => \aio|dac_data\(0),
	datac => \aio|left_right_1~q\,
	datad => \aio|left_right_0~q\,
	combout => \aio|dac_data~110_combout\);

-- Location: FF_X53_Y36_N13
\aio|dac_data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~110_combout\,
	ena => \aio|dac_data[16]~63_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(1));

-- Location: LCCOMB_X53_Y36_N26
\aio|dac_data~109\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~109_combout\ = (\aio|dac_data~76_combout\) # ((\aio|dac_data\(1) & ((\aio|left_right_1~q\) # (!\aio|left_right_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|dac_data\(1),
	datab => \aio|left_right_1~q\,
	datac => \aio|dac_data~76_combout\,
	datad => \aio|left_right_0~q\,
	combout => \aio|dac_data~109_combout\);

-- Location: FF_X53_Y36_N27
\aio|dac_data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~109_combout\,
	ena => \aio|dac_data[16]~63_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(2));

-- Location: LCCOMB_X53_Y36_N24
\aio|dac_data~108\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~108_combout\ = (\aio|dac_data~75_combout\) # ((\aio|dac_data\(2) & ((\aio|left_right_1~q\) # (!\aio|left_right_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|dac_data~75_combout\,
	datab => \aio|left_right_1~q\,
	datac => \aio|dac_data\(2),
	datad => \aio|left_right_0~q\,
	combout => \aio|dac_data~108_combout\);

-- Location: FF_X53_Y36_N25
\aio|dac_data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~108_combout\,
	ena => \aio|dac_data[16]~63_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(3));

-- Location: LCCOMB_X53_Y38_N20
\aio|dac_data~107\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~107_combout\ = (\aio|dac_data~74_combout\) # ((\aio|dac_data\(3) & ((\aio|left_right_1~q\) # (!\aio|left_right_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|dac_data~74_combout\,
	datab => \aio|dac_data\(3),
	datac => \aio|left_right_0~q\,
	datad => \aio|left_right_1~q\,
	combout => \aio|dac_data~107_combout\);

-- Location: FF_X53_Y38_N21
\aio|dac_data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~107_combout\,
	ena => \aio|dac_data[16]~63_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(4));

-- Location: LCCOMB_X53_Y38_N2
\aio|dac_data~106\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~106_combout\ = (\aio|dac_data~73_combout\) # ((\aio|dac_data\(4) & ((\aio|left_right_1~q\) # (!\aio|left_right_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|left_right_0~q\,
	datab => \aio|left_right_1~q\,
	datac => \aio|dac_data~73_combout\,
	datad => \aio|dac_data\(4),
	combout => \aio|dac_data~106_combout\);

-- Location: FF_X53_Y38_N3
\aio|dac_data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~106_combout\,
	ena => \aio|dac_data[16]~63_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(5));

-- Location: LCCOMB_X53_Y38_N24
\aio|dac_data~105\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~105_combout\ = (\aio|dac_data~72_combout\) # ((\aio|dac_data\(5) & ((\aio|left_right_1~q\) # (!\aio|left_right_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|left_right_0~q\,
	datab => \aio|left_right_1~q\,
	datac => \aio|dac_data~72_combout\,
	datad => \aio|dac_data\(5),
	combout => \aio|dac_data~105_combout\);

-- Location: FF_X53_Y38_N25
\aio|dac_data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~105_combout\,
	ena => \aio|dac_data[16]~63_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(6));

-- Location: LCCOMB_X53_Y38_N22
\aio|dac_data~104\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~104_combout\ = (\aio|dac_data~71_combout\) # ((\aio|dac_data\(6) & ((\aio|left_right_1~q\) # (!\aio|left_right_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|left_right_0~q\,
	datab => \aio|left_right_1~q\,
	datac => \aio|dac_data~71_combout\,
	datad => \aio|dac_data\(6),
	combout => \aio|dac_data~104_combout\);

-- Location: FF_X53_Y38_N23
\aio|dac_data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~104_combout\,
	ena => \aio|dac_data[16]~63_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(7));

-- Location: LCCOMB_X53_Y38_N28
\aio|dac_data~103\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~103_combout\ = (\aio|dac_data~70_combout\) # ((\aio|dac_data\(7) & ((\aio|left_right_1~q\) # (!\aio|left_right_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|dac_data~70_combout\,
	datab => \aio|left_right_1~q\,
	datac => \aio|dac_data\(7),
	datad => \aio|left_right_0~q\,
	combout => \aio|dac_data~103_combout\);

-- Location: FF_X53_Y38_N29
\aio|dac_data[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~103_combout\,
	ena => \aio|dac_data[16]~63_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(8));

-- Location: LCCOMB_X53_Y37_N28
\aio|dac_data~102\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~102_combout\ = (\aio|dac_data~69_combout\) # ((\aio|dac_data\(8) & ((\aio|left_right_1~q\) # (!\aio|left_right_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|dac_data\(8),
	datab => \aio|left_right_1~q\,
	datac => \aio|left_right_0~q\,
	datad => \aio|dac_data~69_combout\,
	combout => \aio|dac_data~102_combout\);

-- Location: FF_X53_Y37_N29
\aio|dac_data[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~102_combout\,
	ena => \aio|dac_data[16]~63_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(9));

-- Location: LCCOMB_X53_Y37_N10
\aio|dac_data~101\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~101_combout\ = (\aio|dac_data~68_combout\) # ((\aio|dac_data\(9) & ((\aio|left_right_1~q\) # (!\aio|left_right_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|left_right_0~q\,
	datab => \aio|dac_data~68_combout\,
	datac => \aio|left_right_1~q\,
	datad => \aio|dac_data\(9),
	combout => \aio|dac_data~101_combout\);

-- Location: FF_X53_Y37_N11
\aio|dac_data[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~101_combout\,
	ena => \aio|dac_data[16]~63_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(10));

-- Location: LCCOMB_X53_Y37_N24
\aio|dac_data~100\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~100_combout\ = (\aio|dac_data~67_combout\) # ((\aio|dac_data\(10) & ((\aio|left_right_1~q\) # (!\aio|left_right_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|dac_data\(10),
	datab => \aio|left_right_1~q\,
	datac => \aio|left_right_0~q\,
	datad => \aio|dac_data~67_combout\,
	combout => \aio|dac_data~100_combout\);

-- Location: FF_X53_Y37_N25
\aio|dac_data[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~100_combout\,
	ena => \aio|dac_data[16]~63_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(11));

-- Location: LCCOMB_X53_Y37_N6
\aio|dac_data~99\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~99_combout\ = (\aio|dac_data~66_combout\) # ((\aio|dac_data\(11) & ((\aio|left_right_1~q\) # (!\aio|left_right_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|left_right_0~q\,
	datab => \aio|left_right_1~q\,
	datac => \aio|dac_data~66_combout\,
	datad => \aio|dac_data\(11),
	combout => \aio|dac_data~99_combout\);

-- Location: FF_X53_Y37_N7
\aio|dac_data[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~99_combout\,
	ena => \aio|dac_data[16]~63_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(12));

-- Location: LCCOMB_X53_Y37_N4
\aio|dac_data~98\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~98_combout\ = (\aio|dac_data~65_combout\) # ((\aio|dac_data\(12) & ((\aio|left_right_1~q\) # (!\aio|left_right_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|left_right_0~q\,
	datab => \aio|left_right_1~q\,
	datac => \aio|dac_data~65_combout\,
	datad => \aio|dac_data\(12),
	combout => \aio|dac_data~98_combout\);

-- Location: FF_X53_Y37_N5
\aio|dac_data[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~98_combout\,
	ena => \aio|dac_data[16]~63_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(13));

-- Location: LCCOMB_X53_Y36_N30
\aio|dac_data~97\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~97_combout\ = (\aio|dac_data~64_combout\) # ((\aio|dac_data\(13) & ((\aio|left_right_1~q\) # (!\aio|left_right_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|dac_data~64_combout\,
	datab => \aio|left_right_1~q\,
	datac => \aio|dac_data\(13),
	datad => \aio|left_right_0~q\,
	combout => \aio|dac_data~97_combout\);

-- Location: FF_X53_Y36_N31
\aio|dac_data[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~97_combout\,
	ena => \aio|dac_data[16]~63_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(14));

-- Location: LCCOMB_X53_Y36_N28
\aio|dac_data~96\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~96_combout\ = (\aio|dac_data~62_combout\) # ((\aio|dac_data\(14) & ((\aio|left_right_1~q\) # (!\aio|left_right_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|dac_data\(14),
	datab => \aio|left_right_1~q\,
	datac => \aio|dac_data~62_combout\,
	datad => \aio|left_right_0~q\,
	combout => \aio|dac_data~96_combout\);

-- Location: FF_X53_Y36_N29
\aio|dac_data[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~96_combout\,
	ena => \aio|dac_data[16]~63_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(15));

-- Location: LCCOMB_X53_Y36_N2
\aio|dac_data~95\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~95_combout\ = (\aio|dac_data~78_combout\) # ((\aio|dac_data\(15) & ((\aio|left_right_1~q\) # (!\aio|left_right_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|dac_data~78_combout\,
	datab => \aio|dac_data\(15),
	datac => \aio|left_right_1~q\,
	datad => \aio|left_right_0~q\,
	combout => \aio|dac_data~95_combout\);

-- Location: FF_X53_Y36_N3
\aio|dac_data[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~95_combout\,
	ena => \aio|dac_data[16]~63_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(16));

-- Location: LCCOMB_X53_Y36_N0
\aio|dac_data~94\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~94_combout\ = (\aio|dac_data~77_combout\) # ((\aio|dac_data\(16) & ((\aio|left_right_1~q\) # (!\aio|left_right_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|dac_data~77_combout\,
	datab => \aio|dac_data\(16),
	datac => \aio|left_right_1~q\,
	datad => \aio|left_right_0~q\,
	combout => \aio|dac_data~94_combout\);

-- Location: FF_X53_Y36_N1
\aio|dac_data[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~94_combout\,
	ena => \aio|dac_data[16]~63_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(17));

-- Location: LCCOMB_X53_Y36_N4
\aio|dac_data~93\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~93_combout\ = (\aio|dac_data~76_combout\) # ((\aio|dac_data\(17) & ((\aio|left_right_1~q\) # (!\aio|left_right_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|dac_data~76_combout\,
	datab => \aio|dac_data\(17),
	datac => \aio|left_right_1~q\,
	datad => \aio|left_right_0~q\,
	combout => \aio|dac_data~93_combout\);

-- Location: FF_X53_Y36_N5
\aio|dac_data[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~93_combout\,
	ena => \aio|dac_data[16]~63_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(18));

-- Location: LCCOMB_X53_Y36_N8
\aio|dac_data~92\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~92_combout\ = (\aio|dac_data~75_combout\) # ((\aio|dac_data\(18) & ((\aio|left_right_1~q\) # (!\aio|left_right_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|dac_data~75_combout\,
	datab => \aio|left_right_1~q\,
	datac => \aio|dac_data\(18),
	datad => \aio|left_right_0~q\,
	combout => \aio|dac_data~92_combout\);

-- Location: FF_X53_Y36_N9
\aio|dac_data[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~92_combout\,
	ena => \aio|dac_data[16]~63_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(19));

-- Location: LCCOMB_X53_Y38_N10
\aio|dac_data~91\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~91_combout\ = (\aio|dac_data~74_combout\) # ((\aio|dac_data\(19) & ((\aio|left_right_1~q\) # (!\aio|left_right_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|dac_data\(19),
	datab => \aio|left_right_1~q\,
	datac => \aio|left_right_0~q\,
	datad => \aio|dac_data~74_combout\,
	combout => \aio|dac_data~91_combout\);

-- Location: FF_X53_Y38_N11
\aio|dac_data[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~91_combout\,
	ena => \aio|dac_data[16]~63_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(20));

-- Location: LCCOMB_X53_Y38_N0
\aio|dac_data~90\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~90_combout\ = (\aio|dac_data~73_combout\) # ((\aio|dac_data\(20) & ((\aio|left_right_1~q\) # (!\aio|left_right_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|dac_data\(20),
	datab => \aio|left_right_1~q\,
	datac => \aio|dac_data~73_combout\,
	datad => \aio|left_right_0~q\,
	combout => \aio|dac_data~90_combout\);

-- Location: FF_X53_Y38_N1
\aio|dac_data[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~90_combout\,
	ena => \aio|dac_data[16]~63_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(21));

-- Location: LCCOMB_X53_Y38_N12
\aio|dac_data~89\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~89_combout\ = (\aio|dac_data~72_combout\) # ((\aio|dac_data\(21) & ((\aio|left_right_1~q\) # (!\aio|left_right_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|left_right_0~q\,
	datab => \aio|left_right_1~q\,
	datac => \aio|dac_data~72_combout\,
	datad => \aio|dac_data\(21),
	combout => \aio|dac_data~89_combout\);

-- Location: FF_X53_Y38_N13
\aio|dac_data[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~89_combout\,
	ena => \aio|dac_data[16]~63_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(22));

-- Location: LCCOMB_X53_Y38_N16
\aio|dac_data~88\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~88_combout\ = (\aio|dac_data~71_combout\) # ((\aio|dac_data\(22) & ((\aio|left_right_1~q\) # (!\aio|left_right_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|dac_data\(22),
	datab => \aio|left_right_1~q\,
	datac => \aio|dac_data~71_combout\,
	datad => \aio|left_right_0~q\,
	combout => \aio|dac_data~88_combout\);

-- Location: FF_X53_Y38_N17
\aio|dac_data[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~88_combout\,
	ena => \aio|dac_data[16]~63_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(23));

-- Location: LCCOMB_X53_Y38_N4
\aio|dac_data~87\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~87_combout\ = (\aio|dac_data~70_combout\) # ((\aio|dac_data\(23) & ((\aio|left_right_1~q\) # (!\aio|left_right_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|dac_data~70_combout\,
	datab => \aio|dac_data\(23),
	datac => \aio|left_right_0~q\,
	datad => \aio|left_right_1~q\,
	combout => \aio|dac_data~87_combout\);

-- Location: FF_X53_Y38_N5
\aio|dac_data[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~87_combout\,
	ena => \aio|dac_data[16]~63_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(24));

-- Location: LCCOMB_X53_Y37_N8
\aio|dac_data~86\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~86_combout\ = (\aio|dac_data~69_combout\) # ((\aio|dac_data\(24) & ((\aio|left_right_1~q\) # (!\aio|left_right_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|left_right_0~q\,
	datab => \aio|dac_data~69_combout\,
	datac => \aio|left_right_1~q\,
	datad => \aio|dac_data\(24),
	combout => \aio|dac_data~86_combout\);

-- Location: FF_X53_Y37_N9
\aio|dac_data[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~86_combout\,
	ena => \aio|dac_data[16]~63_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(25));

-- Location: LCCOMB_X53_Y37_N30
\aio|dac_data~85\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~85_combout\ = (\aio|dac_data~68_combout\) # ((\aio|dac_data\(25) & ((\aio|left_right_1~q\) # (!\aio|left_right_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|left_right_0~q\,
	datab => \aio|dac_data\(25),
	datac => \aio|left_right_1~q\,
	datad => \aio|dac_data~68_combout\,
	combout => \aio|dac_data~85_combout\);

-- Location: FF_X53_Y37_N31
\aio|dac_data[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~85_combout\,
	ena => \aio|dac_data[16]~63_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(26));

-- Location: LCCOMB_X53_Y37_N20
\aio|dac_data~84\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~84_combout\ = (\aio|dac_data~67_combout\) # ((\aio|dac_data\(26) & ((\aio|left_right_1~q\) # (!\aio|left_right_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|left_right_0~q\,
	datab => \aio|dac_data~67_combout\,
	datac => \aio|left_right_1~q\,
	datad => \aio|dac_data\(26),
	combout => \aio|dac_data~84_combout\);

-- Location: FF_X53_Y37_N21
\aio|dac_data[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~84_combout\,
	ena => \aio|dac_data[16]~63_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(27));

-- Location: LCCOMB_X53_Y37_N16
\aio|dac_data~83\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~83_combout\ = (\aio|dac_data~66_combout\) # ((\aio|dac_data\(27) & ((\aio|left_right_1~q\) # (!\aio|left_right_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|left_right_0~q\,
	datab => \aio|left_right_1~q\,
	datac => \aio|dac_data~66_combout\,
	datad => \aio|dac_data\(27),
	combout => \aio|dac_data~83_combout\);

-- Location: FF_X53_Y37_N17
\aio|dac_data[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~83_combout\,
	ena => \aio|dac_data[16]~63_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(28));

-- Location: LCCOMB_X53_Y37_N14
\aio|dac_data~82\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~82_combout\ = (\aio|dac_data~65_combout\) # ((\aio|dac_data\(28) & ((\aio|left_right_1~q\) # (!\aio|left_right_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|left_right_0~q\,
	datab => \aio|dac_data~65_combout\,
	datac => \aio|left_right_1~q\,
	datad => \aio|dac_data\(28),
	combout => \aio|dac_data~82_combout\);

-- Location: FF_X53_Y37_N15
\aio|dac_data[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~82_combout\,
	ena => \aio|dac_data[16]~63_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(29));

-- Location: LCCOMB_X53_Y36_N20
\aio|dac_data~81\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~81_combout\ = (\aio|dac_data~64_combout\) # ((\aio|dac_data\(29) & ((\aio|left_right_1~q\) # (!\aio|left_right_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|dac_data~64_combout\,
	datab => \aio|left_right_1~q\,
	datac => \aio|dac_data\(29),
	datad => \aio|left_right_0~q\,
	combout => \aio|dac_data~81_combout\);

-- Location: FF_X53_Y36_N21
\aio|dac_data[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~81_combout\,
	ena => \aio|dac_data[16]~63_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aio|dac_data\(30));

-- Location: LCCOMB_X53_Y36_N16
\aio|dac_data~80\ : cycloneive_lcell_comb
-- Equation(s):
-- \aio|dac_data~80_combout\ = (\aio|dac_data~62_combout\) # ((\aio|dac_data\(30) & ((\aio|left_right_1~q\) # (!\aio|left_right_0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \aio|dac_data~62_combout\,
	datab => \aio|dac_data\(30),
	datac => \aio|left_right_1~q\,
	datad => \aio|left_right_0~q\,
	combout => \aio|dac_data~80_combout\);

-- Location: FF_X53_Y36_N17
\aio|dac_data[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \aio|dac_data~80_combout\,
	ena => \aio|dac_data[16]~63_combout\,
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


