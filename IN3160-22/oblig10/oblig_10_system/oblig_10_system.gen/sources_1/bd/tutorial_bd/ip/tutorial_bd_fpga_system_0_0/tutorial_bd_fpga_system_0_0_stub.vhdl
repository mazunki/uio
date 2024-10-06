-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
-- Date        : Fri May  6 19:42:10 2022
-- Host        : stamford.ifi.uio.no running 64-bit Red Hat Enterprise Linux release 8.5 (Ootpa)
-- Command     : write_vhdl -force -mode synth_stub
--               /uio/hume/student-u81/rolfvh/IN3160-22/oblig10/oblig_10_system/oblig_10_system.gen/sources_1/bd/tutorial_bd/ip/tutorial_bd_fpga_system_0_0/tutorial_bd_fpga_system_0_0_stub.vhdl
-- Design      : tutorial_bd_fpga_system_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tutorial_bd_fpga_system_0_0 is
  Port ( 
    SA : in STD_LOGIC;
    SB : in STD_LOGIC;
    c : out STD_LOGIC;
    abcdefg : out STD_LOGIC_VECTOR ( 6 downto 0 );
    DIR_synch : out STD_LOGIC;
    EN_synch : out STD_LOGIC;
    mclk : in STD_LOGIC;
    reset : in STD_LOGIC;
    gpio : in STD_LOGIC_VECTOR ( 7 downto 0 );
    gpio2 : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end tutorial_bd_fpga_system_0_0;

architecture stub of tutorial_bd_fpga_system_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "SA,SB,c,abcdefg[6:0],DIR_synch,EN_synch,mclk,reset,gpio[7:0],gpio2[7:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "fpga_system,Vivado 2020.2";
begin
end;
