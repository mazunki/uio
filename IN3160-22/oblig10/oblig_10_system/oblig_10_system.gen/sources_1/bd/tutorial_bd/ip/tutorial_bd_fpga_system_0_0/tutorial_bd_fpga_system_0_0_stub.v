// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Fri May  6 19:42:09 2022
// Host        : stamford.ifi.uio.no running 64-bit Red Hat Enterprise Linux release 8.5 (Ootpa)
// Command     : write_verilog -force -mode synth_stub
//               /uio/hume/student-u81/rolfvh/IN3160-22/oblig10/oblig_10_system/oblig_10_system.gen/sources_1/bd/tutorial_bd/ip/tutorial_bd_fpga_system_0_0/tutorial_bd_fpga_system_0_0_stub.v
// Design      : tutorial_bd_fpga_system_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fpga_system,Vivado 2020.2" *)
module tutorial_bd_fpga_system_0_0(SA, SB, c, abcdefg, DIR_synch, EN_synch, mclk, reset, 
  gpio, gpio2)
/* synthesis syn_black_box black_box_pad_pin="SA,SB,c,abcdefg[6:0],DIR_synch,EN_synch,mclk,reset,gpio[7:0],gpio2[7:0]" */;
  input SA;
  input SB;
  output c;
  output [6:0]abcdefg;
  output DIR_synch;
  output EN_synch;
  input mclk;
  input reset;
  input [7:0]gpio;
  output [7:0]gpio2;
endmodule
