-- Copyright (C) 2024  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 23.1std.1 Build 993 05/14/2024 SC Lite Edition"

-- DATE "08/22/2024 19:41:15"

-- 
-- Device: Altera 5CEBA4F23C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	part2 IS
    PORT (
	Clk : IN std_logic;
	D : IN std_logic;
	Q : OUT std_logic
	);
END part2;

-- Design Ports Information
-- Q	=>  Location: PIN_P17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Clk	=>  Location: PIN_P19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D	=>  Location: PIN_P16,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF part2 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Clk : std_logic;
SIGNAL ww_D : std_logic;
SIGNAL ww_Q : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \Clk~input_o\ : std_logic;
SIGNAL \D~input_o\ : std_logic;
SIGNAL \S_g~combout\ : std_logic;
SIGNAL \R_g~combout\ : std_logic;
SIGNAL \Qcon~combout\ : std_logic;
SIGNAL \Qnmrl~combout\ : std_logic;
SIGNAL \ALT_INV_D~input_o\ : std_logic;
SIGNAL \ALT_INV_Clk~input_o\ : std_logic;
SIGNAL \ALT_INV_R_g~combout\ : std_logic;
SIGNAL \ALT_INV_Qcon~combout\ : std_logic;
SIGNAL \ALT_INV_S_g~combout\ : std_logic;
SIGNAL \ALT_INV_Qnmrl~combout\ : std_logic;

BEGIN

ww_Clk <= Clk;
ww_D <= D;
Q <= ww_Q;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_D~input_o\ <= NOT \D~input_o\;
\ALT_INV_Clk~input_o\ <= NOT \Clk~input_o\;
\ALT_INV_R_g~combout\ <= NOT \R_g~combout\;
\ALT_INV_Qcon~combout\ <= NOT \Qcon~combout\;
\ALT_INV_S_g~combout\ <= NOT \S_g~combout\;
\ALT_INV_Qnmrl~combout\ <= NOT \Qnmrl~combout\;

-- Location: IOOBUF_X54_Y17_N22
\Q~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Qnmrl~combout\,
	devoe => ww_devoe,
	o => ww_Q);

-- Location: IOIBUF_X54_Y17_N38
\Clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Clk,
	o => \Clk~input_o\);

-- Location: IOIBUF_X54_Y17_N4
\D~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D,
	o => \D~input_o\);

-- Location: LABCELL_X53_Y17_N36
S_g : cyclonev_lcell_comb
-- Equation(s):
-- \S_g~combout\ = LCELL((!\Clk~input_o\) # (!\D~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110111011101110111011101110111011101110111011101110111011101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Clk~input_o\,
	datab => \ALT_INV_D~input_o\,
	combout => \S_g~combout\);

-- Location: LABCELL_X53_Y17_N39
R_g : cyclonev_lcell_comb
-- Equation(s):
-- \R_g~combout\ = LCELL((!\Clk~input_o\) # (\D~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011101110111011101110111011101110111011101110111011101110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Clk~input_o\,
	datab => \ALT_INV_D~input_o\,
	combout => \R_g~combout\);

-- Location: LABCELL_X53_Y17_N33
Qcon : cyclonev_lcell_comb
-- Equation(s):
-- \Qcon~combout\ = LCELL(( \Qnmrl~combout\ & ( !\R_g~combout\ ) ) # ( !\Qnmrl~combout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_R_g~combout\,
	dataf => \ALT_INV_Qnmrl~combout\,
	combout => \Qcon~combout\);

-- Location: LABCELL_X53_Y17_N30
Qnmrl : cyclonev_lcell_comb
-- Equation(s):
-- \Qnmrl~combout\ = LCELL(( \Qcon~combout\ & ( !\S_g~combout\ ) ) # ( !\Qcon~combout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_S_g~combout\,
	dataf => \ALT_INV_Qcon~combout\,
	combout => \Qnmrl~combout\);

-- Location: MLABCELL_X49_Y42_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


