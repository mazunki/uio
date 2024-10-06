// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Fri May  6 19:42:10 2022
// Host        : stamford.ifi.uio.no running 64-bit Red Hat Enterprise Linux release 8.5 (Ootpa)
// Command     : write_verilog -force -mode funcsim
//               /uio/hume/student-u81/rolfvh/IN3160-22/oblig10/oblig_10_system/oblig_10_system.gen/sources_1/bd/tutorial_bd/ip/tutorial_bd_fpga_system_0_0/tutorial_bd_fpga_system_0_0_sim_netlist.v
// Design      : tutorial_bd_fpga_system_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "tutorial_bd_fpga_system_0_0,fpga_system,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "package_project" *) 
(* x_core_info = "fpga_system,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module tutorial_bd_fpga_system_0_0
   (SA,
    SB,
    c,
    abcdefg,
    DIR_synch,
    EN_synch,
    mclk,
    reset,
    gpio,
    gpio2);
  input SA;
  input SB;
  output c;
  output [6:0]abcdefg;
  output DIR_synch;
  output EN_synch;
  input mclk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 reset RST" *) (* x_interface_parameter = "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input reset;
  input [7:0]gpio;
  output [7:0]gpio2;

  wire DIR_synch;
  wire EN_synch;
  wire SA;
  wire SB;
  wire [6:0]abcdefg;
  wire c;
  wire [7:0]gpio;
  wire [7:0]gpio2;
  wire mclk;
  wire reset;

  tutorial_bd_fpga_system_0_0_fpga_system U0
       (.DIR_synch(DIR_synch),
        .EN_synch(EN_synch),
        .SA(SA),
        .SB(SB),
        .abcdefg(abcdefg),
        .c_reg(c),
        .gpio(gpio),
        .mclk(mclk),
        .\moving_sum_reg[11] (gpio2[1]),
        .\moving_sum_reg[11]_0 (gpio2[3]),
        .\moving_sum_reg[11]_1 (gpio2[7]),
        .\moving_sum_reg[11]_2 (gpio2[0]),
        .\moving_sum_reg[5] (gpio2[2]),
        .\moving_sum_reg[7] (gpio2[4]),
        .\moving_sum_reg[8] (gpio2[5]),
        .\moving_sum_reg[9] (gpio2[6]),
        .reset(reset));
endmodule

(* ORIG_REF_NAME = "fpga_system" *) 
module tutorial_bd_fpga_system_0_0_fpga_system
   (c_reg,
    \moving_sum_reg[11] ,
    \moving_sum_reg[11]_0 ,
    DIR_synch,
    EN_synch,
    abcdefg,
    \moving_sum_reg[7] ,
    \moving_sum_reg[8] ,
    \moving_sum_reg[9] ,
    \moving_sum_reg[11]_1 ,
    \moving_sum_reg[11]_2 ,
    \moving_sum_reg[5] ,
    mclk,
    reset,
    SA,
    SB,
    gpio);
  output c_reg;
  output \moving_sum_reg[11] ;
  output \moving_sum_reg[11]_0 ;
  output DIR_synch;
  output EN_synch;
  output [6:0]abcdefg;
  output \moving_sum_reg[7] ;
  output \moving_sum_reg[8] ;
  output \moving_sum_reg[9] ;
  output \moving_sum_reg[11]_1 ;
  output \moving_sum_reg[11]_2 ;
  output \moving_sum_reg[5] ;
  input mclk;
  input reset;
  input SA;
  input SB;
  input [7:0]gpio;

  wire DIR_synch;
  wire EN_synch;
  wire SA;
  wire SA_synch;
  wire SB;
  wire SB_synch;
  wire __11;
  wire [6:0]abcdefg;
  wire c_reg;
  wire dir;
  wire en;
  wire [7:0]gpio;
  wire mclk;
  wire \moving_sum_reg[11] ;
  wire \moving_sum_reg[11]_0 ;
  wire \moving_sum_reg[11]_1 ;
  wire \moving_sum_reg[11]_2 ;
  wire \moving_sum_reg[5] ;
  wire \moving_sum_reg[7] ;
  wire \moving_sum_reg[8] ;
  wire \moving_sum_reg[9] ;
  wire pos_dec;
  wire reset;

  tutorial_bd_fpga_system_0_0_input_sync UUT_IN_SYNC
       (.SA(SA),
        .SA_synch(SA_synch),
        .SB(SB),
        .SB_synch(SB_synch),
        .mclk(mclk));
  tutorial_bd_fpga_system_0_0_output_sync UUT_OUT_SYNC
       (.DIR_synch(DIR_synch),
        .EN_synch(EN_synch),
        .dir(dir),
        .en(en),
        .mclk(mclk));
  tutorial_bd_fpga_system_0_0_pulse_width_modulator UUT_PWM
       (.dir(dir),
        .en(en),
        .gpio(gpio),
        .mclk(mclk),
        .reset(reset));
  tutorial_bd_fpga_system_0_0_quadrature_decoder UUT_QUAD_DEC
       (.SA_synch(SA_synch),
        .SB_synch(SB_synch),
        .__11(__11),
        .mclk(mclk),
        .pos_dec(pos_dec),
        .reset(reset));
  tutorial_bd_fpga_system_0_0_seg7ctrl UUT_S7C
       (.c_reg_0(c_reg),
        .mclk(mclk),
        .reset(reset));
  tutorial_bd_fpga_system_0_0_velocity_reader UUT_VEL_READ
       (.__11(__11),
        .abcdefg(abcdefg),
        .abcdefg_1_sp_1(c_reg),
        .mclk(mclk),
        .\moving_sum_reg[11]_0 (\moving_sum_reg[11] ),
        .\moving_sum_reg[11]_1 (\moving_sum_reg[11]_0 ),
        .\moving_sum_reg[11]_2 (\moving_sum_reg[11]_1 ),
        .\moving_sum_reg[11]_3 (\moving_sum_reg[11]_2 ),
        .\moving_sum_reg[5]_0 (\moving_sum_reg[5] ),
        .\moving_sum_reg[7]_0 (\moving_sum_reg[7] ),
        .\moving_sum_reg[8]_0 (\moving_sum_reg[8] ),
        .\moving_sum_reg[9]_0 (\moving_sum_reg[9] ),
        .pos_dec(pos_dec),
        .reset(reset));
endmodule

(* ORIG_REF_NAME = "input_sync" *) 
module tutorial_bd_fpga_system_0_0_input_sync
   (SA_synch,
    SB_synch,
    SA,
    mclk,
    SB);
  output SA_synch;
  output SB_synch;
  input SA;
  input mclk;
  input SB;

  wire SA;
  wire SA_synch;
  wire SB;
  wire SB_synch;
  wire mclk;
  wire temp_a;
  wire temp_b;

  FDRE SA_synch_reg
       (.C(mclk),
        .CE(1'b1),
        .D(temp_a),
        .Q(SA_synch),
        .R(1'b0));
  FDRE SB_synch_reg
       (.C(mclk),
        .CE(1'b1),
        .D(temp_b),
        .Q(SB_synch),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    temp_a_reg
       (.C(mclk),
        .CE(1'b1),
        .D(SA),
        .Q(temp_a),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    temp_b_reg
       (.C(mclk),
        .CE(1'b1),
        .D(SB),
        .Q(temp_b),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "output_sync" *) 
module tutorial_bd_fpga_system_0_0_output_sync
   (DIR_synch,
    EN_synch,
    dir,
    mclk,
    en);
  output DIR_synch;
  output EN_synch;
  input dir;
  input mclk;
  input en;

  wire DIR_synch;
  wire EN_synch;
  wire dir;
  wire en;
  wire mclk;

  FDRE DIR_synch_reg
       (.C(mclk),
        .CE(1'b1),
        .D(dir),
        .Q(DIR_synch),
        .R(1'b0));
  FDRE EN_synch_reg
       (.C(mclk),
        .CE(1'b1),
        .D(en),
        .Q(EN_synch),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "pulse_width_modulator" *) 
module tutorial_bd_fpga_system_0_0_pulse_width_modulator
   (en,
    dir,
    mclk,
    reset,
    gpio);
  output en;
  output dir;
  input mclk;
  input reset;
  input [7:0]gpio;

  wire \FSM_sequential_moore_state_curr[1]_i_2_n_0 ;
  wire dir;
  wire en;
  wire [7:0]gpio;
  wire mclk;
  wire [1:0]moore_state_curr;
  wire [1:0]moore_state_next;
  wire pwm;
  wire pwm0_carry_i_1_n_0;
  wire pwm0_carry_i_2_n_0;
  wire pwm0_carry_i_3_n_0;
  wire pwm0_carry_i_4_n_0;
  wire pwm0_carry_i_5_n_0;
  wire pwm0_carry_i_6_n_0;
  wire pwm0_carry_i_7_n_0;
  wire pwm0_carry_i_8_n_0;
  wire pwm0_carry_n_1;
  wire pwm0_carry_n_2;
  wire pwm0_carry_n_3;
  wire \pwm_counter[0]_i_2_n_0 ;
  wire [19:12]pwm_counter_reg;
  wire \pwm_counter_reg[0]_i_1_n_0 ;
  wire \pwm_counter_reg[0]_i_1_n_1 ;
  wire \pwm_counter_reg[0]_i_1_n_2 ;
  wire \pwm_counter_reg[0]_i_1_n_3 ;
  wire \pwm_counter_reg[0]_i_1_n_4 ;
  wire \pwm_counter_reg[0]_i_1_n_5 ;
  wire \pwm_counter_reg[0]_i_1_n_6 ;
  wire \pwm_counter_reg[0]_i_1_n_7 ;
  wire \pwm_counter_reg[12]_i_1_n_0 ;
  wire \pwm_counter_reg[12]_i_1_n_1 ;
  wire \pwm_counter_reg[12]_i_1_n_2 ;
  wire \pwm_counter_reg[12]_i_1_n_3 ;
  wire \pwm_counter_reg[12]_i_1_n_4 ;
  wire \pwm_counter_reg[12]_i_1_n_5 ;
  wire \pwm_counter_reg[12]_i_1_n_6 ;
  wire \pwm_counter_reg[12]_i_1_n_7 ;
  wire \pwm_counter_reg[16]_i_1_n_1 ;
  wire \pwm_counter_reg[16]_i_1_n_2 ;
  wire \pwm_counter_reg[16]_i_1_n_3 ;
  wire \pwm_counter_reg[16]_i_1_n_4 ;
  wire \pwm_counter_reg[16]_i_1_n_5 ;
  wire \pwm_counter_reg[16]_i_1_n_6 ;
  wire \pwm_counter_reg[16]_i_1_n_7 ;
  wire \pwm_counter_reg[4]_i_1_n_0 ;
  wire \pwm_counter_reg[4]_i_1_n_1 ;
  wire \pwm_counter_reg[4]_i_1_n_2 ;
  wire \pwm_counter_reg[4]_i_1_n_3 ;
  wire \pwm_counter_reg[4]_i_1_n_4 ;
  wire \pwm_counter_reg[4]_i_1_n_5 ;
  wire \pwm_counter_reg[4]_i_1_n_6 ;
  wire \pwm_counter_reg[4]_i_1_n_7 ;
  wire \pwm_counter_reg[8]_i_1_n_0 ;
  wire \pwm_counter_reg[8]_i_1_n_1 ;
  wire \pwm_counter_reg[8]_i_1_n_2 ;
  wire \pwm_counter_reg[8]_i_1_n_3 ;
  wire \pwm_counter_reg[8]_i_1_n_4 ;
  wire \pwm_counter_reg[8]_i_1_n_5 ;
  wire \pwm_counter_reg[8]_i_1_n_6 ;
  wire \pwm_counter_reg[8]_i_1_n_7 ;
  wire \pwm_counter_reg_n_0_[0] ;
  wire \pwm_counter_reg_n_0_[10] ;
  wire \pwm_counter_reg_n_0_[11] ;
  wire \pwm_counter_reg_n_0_[1] ;
  wire \pwm_counter_reg_n_0_[2] ;
  wire \pwm_counter_reg_n_0_[3] ;
  wire \pwm_counter_reg_n_0_[4] ;
  wire \pwm_counter_reg_n_0_[5] ;
  wire \pwm_counter_reg_n_0_[6] ;
  wire \pwm_counter_reg_n_0_[7] ;
  wire \pwm_counter_reg_n_0_[8] ;
  wire \pwm_counter_reg_n_0_[9] ;
  wire reset;
  wire [3:0]NLW_pwm0_carry_O_UNCONNECTED;
  wire [3:3]\NLW_pwm_counter_reg[16]_i_1_CO_UNCONNECTED ;

  LUT1 #(
    .INIT(2'h1)) 
    DIR_synch_i_1
       (.I0(moore_state_curr[1]),
        .O(dir));
  LUT2 #(
    .INIT(4'h8)) 
    EN_synch_i_1
       (.I0(moore_state_curr[0]),
        .I1(pwm),
        .O(en));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hAA54)) 
    \FSM_sequential_moore_state_curr[0]_i_1 
       (.I0(moore_state_curr[1]),
        .I1(gpio[6]),
        .I2(\FSM_sequential_moore_state_curr[1]_i_2_n_0 ),
        .I3(gpio[7]),
        .O(moore_state_next[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hB8B8B8B9)) 
    \FSM_sequential_moore_state_curr[1]_i_1 
       (.I0(moore_state_curr[1]),
        .I1(moore_state_curr[0]),
        .I2(gpio[7]),
        .I3(\FSM_sequential_moore_state_curr[1]_i_2_n_0 ),
        .I4(gpio[6]),
        .O(moore_state_next[1]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \FSM_sequential_moore_state_curr[1]_i_2 
       (.I0(gpio[0]),
        .I1(gpio[1]),
        .I2(gpio[2]),
        .I3(gpio[3]),
        .I4(gpio[4]),
        .I5(gpio[5]),
        .O(\FSM_sequential_moore_state_curr[1]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "forward:01,forward_idle:00,reverse_idle:10,reverse:11" *) 
  FDCE \FSM_sequential_moore_state_curr_reg[0] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(moore_state_next[0]),
        .Q(moore_state_curr[0]));
  (* FSM_ENCODED_STATES = "forward:01,forward_idle:00,reverse_idle:10,reverse:11" *) 
  FDCE \FSM_sequential_moore_state_curr_reg[1] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(moore_state_next[1]),
        .Q(moore_state_curr[1]));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 pwm0_carry
       (.CI(1'b0),
        .CO({pwm,pwm0_carry_n_1,pwm0_carry_n_2,pwm0_carry_n_3}),
        .CYINIT(1'b0),
        .DI({pwm0_carry_i_1_n_0,pwm0_carry_i_2_n_0,pwm0_carry_i_3_n_0,pwm0_carry_i_4_n_0}),
        .O(NLW_pwm0_carry_O_UNCONNECTED[3:0]),
        .S({pwm0_carry_i_5_n_0,pwm0_carry_i_6_n_0,pwm0_carry_i_7_n_0,pwm0_carry_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm0_carry_i_1
       (.I0(gpio[6]),
        .I1(pwm_counter_reg[18]),
        .I2(pwm_counter_reg[19]),
        .I3(gpio[7]),
        .O(pwm0_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm0_carry_i_2
       (.I0(gpio[4]),
        .I1(pwm_counter_reg[16]),
        .I2(pwm_counter_reg[17]),
        .I3(gpio[5]),
        .O(pwm0_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm0_carry_i_3
       (.I0(gpio[2]),
        .I1(pwm_counter_reg[14]),
        .I2(pwm_counter_reg[15]),
        .I3(gpio[3]),
        .O(pwm0_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm0_carry_i_4
       (.I0(gpio[0]),
        .I1(pwm_counter_reg[12]),
        .I2(pwm_counter_reg[13]),
        .I3(gpio[1]),
        .O(pwm0_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm0_carry_i_5
       (.I0(gpio[6]),
        .I1(pwm_counter_reg[18]),
        .I2(gpio[7]),
        .I3(pwm_counter_reg[19]),
        .O(pwm0_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm0_carry_i_6
       (.I0(gpio[4]),
        .I1(pwm_counter_reg[16]),
        .I2(gpio[5]),
        .I3(pwm_counter_reg[17]),
        .O(pwm0_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm0_carry_i_7
       (.I0(gpio[2]),
        .I1(pwm_counter_reg[14]),
        .I2(gpio[3]),
        .I3(pwm_counter_reg[15]),
        .O(pwm0_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm0_carry_i_8
       (.I0(gpio[0]),
        .I1(pwm_counter_reg[12]),
        .I2(gpio[1]),
        .I3(pwm_counter_reg[13]),
        .O(pwm0_carry_i_8_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \pwm_counter[0]_i_2 
       (.I0(\pwm_counter_reg_n_0_[0] ),
        .O(\pwm_counter[0]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[0] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\pwm_counter_reg[0]_i_1_n_7 ),
        .Q(\pwm_counter_reg_n_0_[0] ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \pwm_counter_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\pwm_counter_reg[0]_i_1_n_0 ,\pwm_counter_reg[0]_i_1_n_1 ,\pwm_counter_reg[0]_i_1_n_2 ,\pwm_counter_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\pwm_counter_reg[0]_i_1_n_4 ,\pwm_counter_reg[0]_i_1_n_5 ,\pwm_counter_reg[0]_i_1_n_6 ,\pwm_counter_reg[0]_i_1_n_7 }),
        .S({\pwm_counter_reg_n_0_[3] ,\pwm_counter_reg_n_0_[2] ,\pwm_counter_reg_n_0_[1] ,\pwm_counter[0]_i_2_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[10] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\pwm_counter_reg[8]_i_1_n_5 ),
        .Q(\pwm_counter_reg_n_0_[10] ));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[11] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\pwm_counter_reg[8]_i_1_n_4 ),
        .Q(\pwm_counter_reg_n_0_[11] ));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[12] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\pwm_counter_reg[12]_i_1_n_7 ),
        .Q(pwm_counter_reg[12]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \pwm_counter_reg[12]_i_1 
       (.CI(\pwm_counter_reg[8]_i_1_n_0 ),
        .CO({\pwm_counter_reg[12]_i_1_n_0 ,\pwm_counter_reg[12]_i_1_n_1 ,\pwm_counter_reg[12]_i_1_n_2 ,\pwm_counter_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pwm_counter_reg[12]_i_1_n_4 ,\pwm_counter_reg[12]_i_1_n_5 ,\pwm_counter_reg[12]_i_1_n_6 ,\pwm_counter_reg[12]_i_1_n_7 }),
        .S(pwm_counter_reg[15:12]));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[13] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\pwm_counter_reg[12]_i_1_n_6 ),
        .Q(pwm_counter_reg[13]));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[14] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\pwm_counter_reg[12]_i_1_n_5 ),
        .Q(pwm_counter_reg[14]));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[15] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\pwm_counter_reg[12]_i_1_n_4 ),
        .Q(pwm_counter_reg[15]));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[16] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\pwm_counter_reg[16]_i_1_n_7 ),
        .Q(pwm_counter_reg[16]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \pwm_counter_reg[16]_i_1 
       (.CI(\pwm_counter_reg[12]_i_1_n_0 ),
        .CO({\NLW_pwm_counter_reg[16]_i_1_CO_UNCONNECTED [3],\pwm_counter_reg[16]_i_1_n_1 ,\pwm_counter_reg[16]_i_1_n_2 ,\pwm_counter_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pwm_counter_reg[16]_i_1_n_4 ,\pwm_counter_reg[16]_i_1_n_5 ,\pwm_counter_reg[16]_i_1_n_6 ,\pwm_counter_reg[16]_i_1_n_7 }),
        .S(pwm_counter_reg[19:16]));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[17] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\pwm_counter_reg[16]_i_1_n_6 ),
        .Q(pwm_counter_reg[17]));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[18] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\pwm_counter_reg[16]_i_1_n_5 ),
        .Q(pwm_counter_reg[18]));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[19] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\pwm_counter_reg[16]_i_1_n_4 ),
        .Q(pwm_counter_reg[19]));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[1] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\pwm_counter_reg[0]_i_1_n_6 ),
        .Q(\pwm_counter_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[2] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\pwm_counter_reg[0]_i_1_n_5 ),
        .Q(\pwm_counter_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[3] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\pwm_counter_reg[0]_i_1_n_4 ),
        .Q(\pwm_counter_reg_n_0_[3] ));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[4] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\pwm_counter_reg[4]_i_1_n_7 ),
        .Q(\pwm_counter_reg_n_0_[4] ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \pwm_counter_reg[4]_i_1 
       (.CI(\pwm_counter_reg[0]_i_1_n_0 ),
        .CO({\pwm_counter_reg[4]_i_1_n_0 ,\pwm_counter_reg[4]_i_1_n_1 ,\pwm_counter_reg[4]_i_1_n_2 ,\pwm_counter_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pwm_counter_reg[4]_i_1_n_4 ,\pwm_counter_reg[4]_i_1_n_5 ,\pwm_counter_reg[4]_i_1_n_6 ,\pwm_counter_reg[4]_i_1_n_7 }),
        .S({\pwm_counter_reg_n_0_[7] ,\pwm_counter_reg_n_0_[6] ,\pwm_counter_reg_n_0_[5] ,\pwm_counter_reg_n_0_[4] }));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[5] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\pwm_counter_reg[4]_i_1_n_6 ),
        .Q(\pwm_counter_reg_n_0_[5] ));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[6] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\pwm_counter_reg[4]_i_1_n_5 ),
        .Q(\pwm_counter_reg_n_0_[6] ));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[7] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\pwm_counter_reg[4]_i_1_n_4 ),
        .Q(\pwm_counter_reg_n_0_[7] ));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[8] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\pwm_counter_reg[8]_i_1_n_7 ),
        .Q(\pwm_counter_reg_n_0_[8] ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \pwm_counter_reg[8]_i_1 
       (.CI(\pwm_counter_reg[4]_i_1_n_0 ),
        .CO({\pwm_counter_reg[8]_i_1_n_0 ,\pwm_counter_reg[8]_i_1_n_1 ,\pwm_counter_reg[8]_i_1_n_2 ,\pwm_counter_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pwm_counter_reg[8]_i_1_n_4 ,\pwm_counter_reg[8]_i_1_n_5 ,\pwm_counter_reg[8]_i_1_n_6 ,\pwm_counter_reg[8]_i_1_n_7 }),
        .S({\pwm_counter_reg_n_0_[11] ,\pwm_counter_reg_n_0_[10] ,\pwm_counter_reg_n_0_[9] ,\pwm_counter_reg_n_0_[8] }));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[9] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\pwm_counter_reg[8]_i_1_n_6 ),
        .Q(\pwm_counter_reg_n_0_[9] ));
endmodule

(* ORIG_REF_NAME = "quadrature_decoder" *) 
module tutorial_bd_fpga_system_0_0_quadrature_decoder
   (pos_dec,
    __11,
    SB_synch,
    SA_synch,
    mclk,
    reset);
  output pos_dec;
  output __11;
  input SB_synch;
  input SA_synch;
  input mclk;
  input reset;

  wire \FSM_sequential_mealy_state_curr[0]_i_1_n_0 ;
  wire \FSM_sequential_mealy_state_curr[1]_i_1_n_0 ;
  wire \FSM_sequential_mealy_state_curr[2]_i_1_n_0 ;
  wire SA_synch;
  wire SB_synch;
  wire __11;
  wire mclk;
  wire [2:0]mealy_state_curr;
  wire pos_dec;
  wire reset;

  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h01C3C1D7)) 
    \FSM_sequential_mealy_state_curr[0]_i_1 
       (.I0(mealy_state_curr[1]),
        .I1(SB_synch),
        .I2(SA_synch),
        .I3(mealy_state_curr[0]),
        .I4(mealy_state_curr[2]),
        .O(\FSM_sequential_mealy_state_curr[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h4CCC4C80)) 
    \FSM_sequential_mealy_state_curr[1]_i_1 
       (.I0(mealy_state_curr[2]),
        .I1(SA_synch),
        .I2(SB_synch),
        .I3(mealy_state_curr[0]),
        .I4(mealy_state_curr[1]),
        .O(\FSM_sequential_mealy_state_curr[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0F0F090A)) 
    \FSM_sequential_mealy_state_curr[2]_i_1 
       (.I0(mealy_state_curr[0]),
        .I1(SB_synch),
        .I2(SA_synch),
        .I3(mealy_state_curr[1]),
        .I4(mealy_state_curr[2]),
        .O(\FSM_sequential_mealy_state_curr[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "s_1:100,s_0:101,s_reset:000,s_2:011,s_init:001,s_3:010" *) 
  FDCE \FSM_sequential_mealy_state_curr_reg[0] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\FSM_sequential_mealy_state_curr[0]_i_1_n_0 ),
        .Q(mealy_state_curr[0]));
  (* FSM_ENCODED_STATES = "s_1:100,s_0:101,s_reset:000,s_2:011,s_init:001,s_3:010" *) 
  FDCE \FSM_sequential_mealy_state_curr_reg[1] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\FSM_sequential_mealy_state_curr[1]_i_1_n_0 ),
        .Q(mealy_state_curr[1]));
  (* FSM_ENCODED_STATES = "s_1:100,s_0:101,s_reset:000,s_2:011,s_init:001,s_3:010" *) 
  FDCE \FSM_sequential_mealy_state_curr_reg[2] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\FSM_sequential_mealy_state_curr[2]_i_1_n_0 ),
        .Q(mealy_state_curr[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h24208180)) 
    i__carry_i_10
       (.I0(mealy_state_curr[2]),
        .I1(SA_synch),
        .I2(SB_synch),
        .I3(mealy_state_curr[1]),
        .I4(mealy_state_curr[0]),
        .O(__11));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h24204202)) 
    i__carry_i_11
       (.I0(mealy_state_curr[2]),
        .I1(SB_synch),
        .I2(SA_synch),
        .I3(mealy_state_curr[1]),
        .I4(mealy_state_curr[0]),
        .O(pos_dec));
endmodule

(* ORIG_REF_NAME = "seg7ctrl" *) 
module tutorial_bd_fpga_system_0_0_seg7ctrl
   (c_reg_0,
    mclk,
    reset);
  output c_reg_0;
  input mclk;
  input reset;

  wire c_i_1_n_0;
  wire c_reg_0;
  wire [3:0]clock_timer_reg;
  wire mclk;
  wire [3:0]plusOp;
  wire reset;

  LUT6 #(
    .INIT(64'hFFFFFFFE00000001)) 
    c_i_1
       (.I0(reset),
        .I1(clock_timer_reg[3]),
        .I2(clock_timer_reg[2]),
        .I3(clock_timer_reg[0]),
        .I4(clock_timer_reg[1]),
        .I5(c_reg_0),
        .O(c_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    c_reg
       (.C(mclk),
        .CE(1'b1),
        .D(c_i_1_n_0),
        .Q(c_reg_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \clock_timer[0]_i_1 
       (.I0(clock_timer_reg[0]),
        .O(plusOp[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \clock_timer[1]_i_1 
       (.I0(clock_timer_reg[0]),
        .I1(clock_timer_reg[1]),
        .O(plusOp[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \clock_timer[2]_i_1 
       (.I0(clock_timer_reg[0]),
        .I1(clock_timer_reg[1]),
        .I2(clock_timer_reg[2]),
        .O(plusOp[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \clock_timer[3]_i_1 
       (.I0(clock_timer_reg[1]),
        .I1(clock_timer_reg[0]),
        .I2(clock_timer_reg[2]),
        .I3(clock_timer_reg[3]),
        .O(plusOp[3]));
  FDCE #(
    .INIT(1'b0)) 
    \clock_timer_reg[0] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(plusOp[0]),
        .Q(clock_timer_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \clock_timer_reg[1] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(plusOp[1]),
        .Q(clock_timer_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \clock_timer_reg[2] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(plusOp[2]),
        .Q(clock_timer_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \clock_timer_reg[3] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(plusOp[3]),
        .Q(clock_timer_reg[3]));
endmodule

(* ORIG_REF_NAME = "velocity_reader" *) 
module tutorial_bd_fpga_system_0_0_velocity_reader
   (\moving_sum_reg[11]_0 ,
    \moving_sum_reg[11]_1 ,
    abcdefg,
    \moving_sum_reg[7]_0 ,
    \moving_sum_reg[8]_0 ,
    \moving_sum_reg[9]_0 ,
    \moving_sum_reg[11]_2 ,
    \moving_sum_reg[11]_3 ,
    \moving_sum_reg[5]_0 ,
    mclk,
    reset,
    __11,
    pos_dec,
    abcdefg_1_sp_1);
  output \moving_sum_reg[11]_0 ;
  output \moving_sum_reg[11]_1 ;
  output [6:0]abcdefg;
  output \moving_sum_reg[7]_0 ;
  output \moving_sum_reg[8]_0 ;
  output \moving_sum_reg[9]_0 ;
  output \moving_sum_reg[11]_2 ;
  output \moving_sum_reg[11]_3 ;
  output \moving_sum_reg[5]_0 ;
  input mclk;
  input reset;
  input __11;
  input pos_dec;
  input abcdefg_1_sp_1;

  wire [9:5]ARG2;
  wire [11:3]ARG3;
  wire __11;
  wire \_inferred__0/i__carry__0_n_1 ;
  wire \_inferred__0/i__carry__0_n_2 ;
  wire \_inferred__0/i__carry__0_n_3 ;
  wire \_inferred__0/i__carry__0_n_4 ;
  wire \_inferred__0/i__carry__0_n_5 ;
  wire \_inferred__0/i__carry__0_n_6 ;
  wire \_inferred__0/i__carry__0_n_7 ;
  wire \_inferred__0/i__carry_n_0 ;
  wire \_inferred__0/i__carry_n_1 ;
  wire \_inferred__0/i__carry_n_2 ;
  wire \_inferred__0/i__carry_n_3 ;
  wire \_inferred__0/i__carry_n_4 ;
  wire \_inferred__0/i__carry_n_5 ;
  wire \_inferred__0/i__carry_n_6 ;
  wire \_inferred__0/i__carry_n_7 ;
  wire [6:0]abcdefg;
  wire \abcdefg[0]_INST_0_i_1_n_0 ;
  wire \abcdefg[0]_INST_0_i_2_n_0 ;
  wire \abcdefg[1]_INST_0_i_1_n_0 ;
  wire \abcdefg[1]_INST_0_i_2_n_0 ;
  wire \abcdefg[1]_INST_0_i_3_n_0 ;
  wire \abcdefg[1]_INST_0_i_4_n_0 ;
  wire \abcdefg[2]_INST_0_i_1_n_0 ;
  wire \abcdefg[2]_INST_0_i_2_n_0 ;
  wire \abcdefg[3]_INST_0_i_1_n_0 ;
  wire \abcdefg[3]_INST_0_i_2_n_0 ;
  wire \abcdefg[4]_INST_0_i_1_n_0 ;
  wire \abcdefg[4]_INST_0_i_2_n_0 ;
  wire \abcdefg[4]_INST_0_i_3_n_0 ;
  wire \abcdefg[4]_INST_0_i_4_n_0 ;
  wire \abcdefg[5]_INST_0_i_1_n_0 ;
  wire \abcdefg[5]_INST_0_i_2_n_0 ;
  wire \abcdefg[6]_INST_0_i_1_n_0 ;
  wire \abcdefg[6]_INST_0_i_2_n_0 ;
  wire abcdefg_1_sn_1;
  wire \gpio2[1]_INST_0_i_1_n_0 ;
  wire \gpio2[1]_INST_0_i_1_n_1 ;
  wire \gpio2[1]_INST_0_i_1_n_2 ;
  wire \gpio2[1]_INST_0_i_1_n_3 ;
  wire \gpio2[1]_INST_0_i_2_n_0 ;
  wire \gpio2[1]_INST_0_i_3_n_0 ;
  wire \gpio2[1]_INST_0_i_4_n_0 ;
  wire \gpio2[1]_INST_0_i_5_n_0 ;
  wire \gpio2[1]_INST_0_i_6_n_0 ;
  wire \gpio2[3]_INST_0_i_2_n_0 ;
  wire \gpio2[4]_INST_0_i_1_n_0 ;
  wire \gpio2[5]_INST_0_i_1_n_0 ;
  wire \gpio2[5]_INST_0_i_1_n_1 ;
  wire \gpio2[5]_INST_0_i_1_n_2 ;
  wire \gpio2[5]_INST_0_i_1_n_3 ;
  wire \gpio2[5]_INST_0_i_2_n_0 ;
  wire \gpio2[5]_INST_0_i_3_n_0 ;
  wire \gpio2[5]_INST_0_i_4_n_0 ;
  wire \gpio2[5]_INST_0_i_5_n_0 ;
  wire \gpio2[5]_INST_0_i_6_n_0 ;
  wire \gpio2[6]_INST_0_i_1_n_0 ;
  wire \gpio2[7]_INST_0_i_1_n_2 ;
  wire \gpio2[7]_INST_0_i_1_n_3 ;
  wire \gpio2[7]_INST_0_i_2_n_0 ;
  wire \gpio2[7]_INST_0_i_3_n_0 ;
  wire \gpio2[7]_INST_0_i_4_n_0 ;
  wire \gpio2[7]_INST_0_i_5_n_0 ;
  wire i__carry__0_i_1_n_0;
  wire i__carry__0_i_2_n_0;
  wire i__carry__0_i_3_n_0;
  wire i__carry__0_i_4_n_0;
  wire i__carry__0_i_5_n_0;
  wire i__carry__0_i_6_n_0;
  wire i__carry__0_i_7_n_0;
  wire i__carry_i_12_n_0;
  wire i__carry_i_13_n_0;
  wire i__carry_i_14_n_0;
  wire i__carry_i_1_n_0;
  wire i__carry_i_2_n_0;
  wire i__carry_i_3_n_0;
  wire i__carry_i_4_n_0;
  wire i__carry_i_5_n_0;
  wire i__carry_i_6_n_0;
  wire i__carry_i_7_n_0;
  wire i__carry_i_8_n_0;
  wire mclk;
  wire [11:0]moving_sum;
  wire \moving_sum[11]_i_1_n_0 ;
  wire \moving_sum[11]_i_2_n_0 ;
  wire \moving_sum[11]_i_3_n_0 ;
  wire \moving_sum[11]_i_4_n_0 ;
  wire \moving_sum[11]_i_5_n_0 ;
  wire moving_sum_next_carry__0_i_1_n_0;
  wire moving_sum_next_carry__0_i_2_n_0;
  wire moving_sum_next_carry__0_i_3_n_0;
  wire moving_sum_next_carry__0_i_4_n_0;
  wire moving_sum_next_carry__0_i_5_n_0;
  wire moving_sum_next_carry__0_i_6_n_0;
  wire moving_sum_next_carry__0_i_7_n_0;
  wire moving_sum_next_carry__0_i_8_n_0;
  wire moving_sum_next_carry__0_n_0;
  wire moving_sum_next_carry__0_n_1;
  wire moving_sum_next_carry__0_n_2;
  wire moving_sum_next_carry__0_n_3;
  wire moving_sum_next_carry__0_n_4;
  wire moving_sum_next_carry__0_n_5;
  wire moving_sum_next_carry__0_n_6;
  wire moving_sum_next_carry__0_n_7;
  wire moving_sum_next_carry__1_i_1_n_0;
  wire moving_sum_next_carry__1_i_2_n_0;
  wire moving_sum_next_carry__1_i_3_n_0;
  wire moving_sum_next_carry__1_i_4_n_0;
  wire moving_sum_next_carry__1_i_5_n_0;
  wire moving_sum_next_carry__1_n_1;
  wire moving_sum_next_carry__1_n_2;
  wire moving_sum_next_carry__1_n_3;
  wire moving_sum_next_carry__1_n_4;
  wire moving_sum_next_carry__1_n_5;
  wire moving_sum_next_carry__1_n_6;
  wire moving_sum_next_carry__1_n_7;
  wire moving_sum_next_carry_i_1_n_0;
  wire moving_sum_next_carry_i_2_n_0;
  wire moving_sum_next_carry_i_3_n_0;
  wire moving_sum_next_carry_i_4_n_0;
  wire moving_sum_next_carry_i_5_n_0;
  wire moving_sum_next_carry_i_6_n_0;
  wire moving_sum_next_carry_i_7_n_0;
  wire moving_sum_next_carry_i_8_n_0;
  wire moving_sum_next_carry_n_0;
  wire moving_sum_next_carry_n_1;
  wire moving_sum_next_carry_n_2;
  wire moving_sum_next_carry_n_3;
  wire moving_sum_next_carry_n_4;
  wire moving_sum_next_carry_n_5;
  wire moving_sum_next_carry_n_6;
  wire moving_sum_next_carry_n_7;
  wire \moving_sum_reg[11]_0 ;
  wire \moving_sum_reg[11]_1 ;
  wire \moving_sum_reg[11]_2 ;
  wire \moving_sum_reg[11]_3 ;
  wire \moving_sum_reg[5]_0 ;
  wire \moving_sum_reg[7]_0 ;
  wire \moving_sum_reg[8]_0 ;
  wire \moving_sum_reg[9]_0 ;
  wire [7:0]pos_count;
  wire pos_count_reset__1;
  wire pos_dec;
  wire \pos_shift_reg[7][0]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ;
  wire \pos_shift_reg[7][1]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ;
  wire \pos_shift_reg[7][2]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ;
  wire \pos_shift_reg[7][3]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ;
  wire \pos_shift_reg[7][4]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ;
  wire \pos_shift_reg[7][5]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ;
  wire \pos_shift_reg[7][6]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ;
  wire \pos_shift_reg[7][7]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ;
  wire \pos_shift_reg[8][0]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ;
  wire \pos_shift_reg[8][1]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ;
  wire \pos_shift_reg[8][2]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ;
  wire \pos_shift_reg[8][3]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ;
  wire \pos_shift_reg[8][4]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ;
  wire \pos_shift_reg[8][5]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ;
  wire \pos_shift_reg[8][6]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ;
  wire \pos_shift_reg[8][7]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ;
  wire [7:0]\pos_shift_reg[9] ;
  wire pos_shift_reg_c_0_n_0;
  wire pos_shift_reg_c_1_n_0;
  wire pos_shift_reg_c_2_n_0;
  wire pos_shift_reg_c_3_n_0;
  wire pos_shift_reg_c_4_n_0;
  wire pos_shift_reg_c_5_n_0;
  wire pos_shift_reg_c_6_n_0;
  wire pos_shift_reg_c_7_n_0;
  wire pos_shift_reg_c_n_0;
  wire pos_shift_reg_gate__0_n_0;
  wire pos_shift_reg_gate__1_n_0;
  wire pos_shift_reg_gate__2_n_0;
  wire pos_shift_reg_gate__3_n_0;
  wire pos_shift_reg_gate__4_n_0;
  wire pos_shift_reg_gate__5_n_0;
  wire pos_shift_reg_gate__6_n_0;
  wire pos_shift_reg_gate_n_0;
  wire \rcount[0]_i_2_n_0 ;
  wire \rcount[0]_i_3_n_0 ;
  wire \rcount[0]_i_4_n_0 ;
  wire \rcount[0]_i_5_n_0 ;
  wire \rcount[0]_i_6_n_0 ;
  wire \rcount[0]_i_7_n_0 ;
  wire \rcount[0]_i_8_n_0 ;
  wire \rcount[0]_i_9_n_0 ;
  wire \rcount[12]_i_2_n_0 ;
  wire \rcount[12]_i_3_n_0 ;
  wire \rcount[12]_i_4_n_0 ;
  wire \rcount[12]_i_5_n_0 ;
  wire \rcount[16]_i_2_n_0 ;
  wire \rcount[16]_i_3_n_0 ;
  wire \rcount[16]_i_4_n_0 ;
  wire \rcount[16]_i_5_n_0 ;
  wire \rcount[4]_i_2_n_0 ;
  wire \rcount[4]_i_3_n_0 ;
  wire \rcount[4]_i_4_n_0 ;
  wire \rcount[4]_i_5_n_0 ;
  wire \rcount[8]_i_2_n_0 ;
  wire \rcount[8]_i_3_n_0 ;
  wire \rcount[8]_i_4_n_0 ;
  wire \rcount[8]_i_5_n_0 ;
  wire [19:0]rcount_reg;
  wire \rcount_reg[0]_i_1_n_0 ;
  wire \rcount_reg[0]_i_1_n_1 ;
  wire \rcount_reg[0]_i_1_n_2 ;
  wire \rcount_reg[0]_i_1_n_3 ;
  wire \rcount_reg[0]_i_1_n_4 ;
  wire \rcount_reg[0]_i_1_n_5 ;
  wire \rcount_reg[0]_i_1_n_6 ;
  wire \rcount_reg[0]_i_1_n_7 ;
  wire \rcount_reg[12]_i_1_n_0 ;
  wire \rcount_reg[12]_i_1_n_1 ;
  wire \rcount_reg[12]_i_1_n_2 ;
  wire \rcount_reg[12]_i_1_n_3 ;
  wire \rcount_reg[12]_i_1_n_4 ;
  wire \rcount_reg[12]_i_1_n_5 ;
  wire \rcount_reg[12]_i_1_n_6 ;
  wire \rcount_reg[12]_i_1_n_7 ;
  wire \rcount_reg[16]_i_1_n_1 ;
  wire \rcount_reg[16]_i_1_n_2 ;
  wire \rcount_reg[16]_i_1_n_3 ;
  wire \rcount_reg[16]_i_1_n_4 ;
  wire \rcount_reg[16]_i_1_n_5 ;
  wire \rcount_reg[16]_i_1_n_6 ;
  wire \rcount_reg[16]_i_1_n_7 ;
  wire \rcount_reg[4]_i_1_n_0 ;
  wire \rcount_reg[4]_i_1_n_1 ;
  wire \rcount_reg[4]_i_1_n_2 ;
  wire \rcount_reg[4]_i_1_n_3 ;
  wire \rcount_reg[4]_i_1_n_4 ;
  wire \rcount_reg[4]_i_1_n_5 ;
  wire \rcount_reg[4]_i_1_n_6 ;
  wire \rcount_reg[4]_i_1_n_7 ;
  wire \rcount_reg[8]_i_1_n_0 ;
  wire \rcount_reg[8]_i_1_n_1 ;
  wire \rcount_reg[8]_i_1_n_2 ;
  wire \rcount_reg[8]_i_1_n_3 ;
  wire \rcount_reg[8]_i_1_n_4 ;
  wire \rcount_reg[8]_i_1_n_5 ;
  wire \rcount_reg[8]_i_1_n_6 ;
  wire \rcount_reg[8]_i_1_n_7 ;
  wire reset;
  wire velocity1;
  wire velocity1_carry_i_10_n_0;
  wire velocity1_carry_i_10_n_1;
  wire velocity1_carry_i_10_n_2;
  wire velocity1_carry_i_10_n_3;
  wire velocity1_carry_i_11_n_0;
  wire velocity1_carry_i_12_n_0;
  wire velocity1_carry_i_13_n_0;
  wire velocity1_carry_i_14_n_0;
  wire velocity1_carry_i_15_n_0;
  wire velocity1_carry_i_16_n_0;
  wire velocity1_carry_i_17_n_0;
  wire velocity1_carry_i_18_n_0;
  wire velocity1_carry_i_19_n_0;
  wire velocity1_carry_i_1_n_0;
  wire velocity1_carry_i_20_n_0;
  wire velocity1_carry_i_21_n_0;
  wire velocity1_carry_i_2_n_0;
  wire velocity1_carry_i_4_n_0;
  wire velocity1_carry_i_5_n_0;
  wire velocity1_carry_i_6_n_0;
  wire velocity1_carry_i_7_n_0;
  wire velocity1_carry_i_8_n_2;
  wire velocity1_carry_i_8_n_3;
  wire velocity1_carry_i_9_n_0;
  wire velocity1_carry_i_9_n_1;
  wire velocity1_carry_i_9_n_2;
  wire velocity1_carry_i_9_n_3;
  wire velocity1_carry_n_1;
  wire velocity1_carry_n_2;
  wire velocity1_carry_n_3;
  wire [5:5]velocity2;
  wire [11:4]velocity3;
  wire [3:3]\NLW__inferred__0/i__carry__0_CO_UNCONNECTED ;
  wire [1:0]\NLW_gpio2[1]_INST_0_i_1_O_UNCONNECTED ;
  wire [3:2]\NLW_gpio2[7]_INST_0_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_gpio2[7]_INST_0_i_1_O_UNCONNECTED ;
  wire [3:3]NLW_moving_sum_next_carry__1_CO_UNCONNECTED;
  wire [3:3]\NLW_rcount_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:0]NLW_velocity1_carry_O_UNCONNECTED;
  wire [2:0]NLW_velocity1_carry_i_10_O_UNCONNECTED;
  wire [3:2]NLW_velocity1_carry_i_8_CO_UNCONNECTED;
  wire [3:3]NLW_velocity1_carry_i_8_O_UNCONNECTED;

  assign abcdefg_1_sn_1 = abcdefg_1_sp_1;
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\_inferred__0/i__carry_n_0 ,\_inferred__0/i__carry_n_1 ,\_inferred__0/i__carry_n_2 ,\_inferred__0/i__carry_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry_i_1_n_0,i__carry_i_2_n_0,i__carry_i_3_n_0,i__carry_i_4_n_0}),
        .O({\_inferred__0/i__carry_n_4 ,\_inferred__0/i__carry_n_5 ,\_inferred__0/i__carry_n_6 ,\_inferred__0/i__carry_n_7 }),
        .S({i__carry_i_5_n_0,i__carry_i_6_n_0,i__carry_i_7_n_0,i__carry_i_8_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \_inferred__0/i__carry__0 
       (.CI(\_inferred__0/i__carry_n_0 ),
        .CO({\NLW__inferred__0/i__carry__0_CO_UNCONNECTED [3],\_inferred__0/i__carry__0_n_1 ,\_inferred__0/i__carry__0_n_2 ,\_inferred__0/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,i__carry__0_i_1_n_0,i__carry__0_i_2_n_0,i__carry__0_i_3_n_0}),
        .O({\_inferred__0/i__carry__0_n_4 ,\_inferred__0/i__carry__0_n_5 ,\_inferred__0/i__carry__0_n_6 ,\_inferred__0/i__carry__0_n_7 }),
        .S({i__carry__0_i_4_n_0,i__carry__0_i_5_n_0,i__carry__0_i_6_n_0,i__carry__0_i_7_n_0}));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \abcdefg[0]_INST_0 
       (.I0(reset),
        .I1(\abcdefg[0]_INST_0_i_1_n_0 ),
        .O(abcdefg[0]));
  LUT6 #(
    .INIT(64'h2043FFFF20430000)) 
    \abcdefg[0]_INST_0_i_1 
       (.I0(\moving_sum_reg[7]_0 ),
        .I1(\moving_sum_reg[11]_2 ),
        .I2(\moving_sum_reg[9]_0 ),
        .I3(\moving_sum_reg[8]_0 ),
        .I4(abcdefg_1_sn_1),
        .I5(\abcdefg[0]_INST_0_i_2_n_0 ),
        .O(\abcdefg[0]_INST_0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h2043)) 
    \abcdefg[0]_INST_0_i_2 
       (.I0(\moving_sum_reg[11]_3 ),
        .I1(\moving_sum_reg[11]_1 ),
        .I2(\moving_sum_reg[5]_0 ),
        .I3(\moving_sum_reg[11]_0 ),
        .O(\abcdefg[0]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8880888080888880)) 
    \abcdefg[1]_INST_0 
       (.I0(\abcdefg[1]_INST_0_i_1_n_0 ),
        .I1(\abcdefg[1]_INST_0_i_2_n_0 ),
        .I2(\abcdefg[1]_INST_0_i_3_n_0 ),
        .I3(\moving_sum_reg[11]_1 ),
        .I4(\moving_sum_reg[5]_0 ),
        .I5(\moving_sum_reg[11]_0 ),
        .O(abcdefg[1]));
  LUT6 #(
    .INIT(64'h5555551500000000)) 
    \abcdefg[1]_INST_0_i_1 
       (.I0(reset),
        .I1(abcdefg_1_sn_1),
        .I2(\moving_sum_reg[8]_0 ),
        .I3(\moving_sum_reg[9]_0 ),
        .I4(\moving_sum_reg[11]_2 ),
        .I5(\abcdefg[1]_INST_0_i_4_n_0 ),
        .O(\abcdefg[1]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hF7F77FF7)) 
    \abcdefg[1]_INST_0_i_2 
       (.I0(\moving_sum_reg[7]_0 ),
        .I1(abcdefg_1_sn_1),
        .I2(\moving_sum_reg[11]_2 ),
        .I3(\moving_sum_reg[9]_0 ),
        .I4(\moving_sum_reg[8]_0 ),
        .O(\abcdefg[1]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hAAAAAFBB)) 
    \abcdefg[1]_INST_0_i_3 
       (.I0(abcdefg_1_sn_1),
        .I1(moving_sum[3]),
        .I2(ARG3[3]),
        .I3(moving_sum[11]),
        .I4(velocity1),
        .O(\abcdefg[1]_INST_0_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hFFFD)) 
    \abcdefg[1]_INST_0_i_4 
       (.I0(\moving_sum_reg[11]_0 ),
        .I1(\moving_sum_reg[11]_1 ),
        .I2(abcdefg_1_sn_1),
        .I3(\moving_sum_reg[5]_0 ),
        .O(\abcdefg[1]_INST_0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \abcdefg[2]_INST_0 
       (.I0(reset),
        .I1(\abcdefg[2]_INST_0_i_1_n_0 ),
        .O(abcdefg[2]));
  LUT6 #(
    .INIT(64'h02BAFFFF02BA0000)) 
    \abcdefg[2]_INST_0_i_1 
       (.I0(\moving_sum_reg[7]_0 ),
        .I1(\moving_sum_reg[8]_0 ),
        .I2(\moving_sum_reg[9]_0 ),
        .I3(\moving_sum_reg[11]_2 ),
        .I4(abcdefg_1_sn_1),
        .I5(\abcdefg[2]_INST_0_i_2_n_0 ),
        .O(\abcdefg[2]_INST_0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h02BA)) 
    \abcdefg[2]_INST_0_i_2 
       (.I0(\moving_sum_reg[11]_3 ),
        .I1(\moving_sum_reg[11]_0 ),
        .I2(\moving_sum_reg[5]_0 ),
        .I3(\moving_sum_reg[11]_1 ),
        .O(\abcdefg[2]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \abcdefg[3]_INST_0 
       (.I0(reset),
        .I1(\abcdefg[3]_INST_0_i_1_n_0 ),
        .O(abcdefg[3]));
  LUT6 #(
    .INIT(64'hA41AFFFFA41A0000)) 
    \abcdefg[3]_INST_0_i_1 
       (.I0(\moving_sum_reg[7]_0 ),
        .I1(\moving_sum_reg[11]_2 ),
        .I2(\moving_sum_reg[9]_0 ),
        .I3(\moving_sum_reg[8]_0 ),
        .I4(abcdefg_1_sn_1),
        .I5(\abcdefg[3]_INST_0_i_2_n_0 ),
        .O(\abcdefg[3]_INST_0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hA41A)) 
    \abcdefg[3]_INST_0_i_2 
       (.I0(\moving_sum_reg[11]_3 ),
        .I1(\moving_sum_reg[11]_1 ),
        .I2(\moving_sum_reg[5]_0 ),
        .I3(\moving_sum_reg[11]_0 ),
        .O(\abcdefg[3]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \abcdefg[4]_INST_0 
       (.I0(reset),
        .I1(\abcdefg[4]_INST_0_i_1_n_0 ),
        .I2(\abcdefg[4]_INST_0_i_2_n_0 ),
        .O(abcdefg[4]));
  LUT6 #(
    .INIT(64'h5555F55D55555555)) 
    \abcdefg[4]_INST_0_i_1 
       (.I0(\abcdefg[4]_INST_0_i_3_n_0 ),
        .I1(\moving_sum_reg[8]_0 ),
        .I2(\moving_sum_reg[11]_2 ),
        .I3(\moving_sum_reg[9]_0 ),
        .I4(\moving_sum_reg[7]_0 ),
        .I5(abcdefg_1_sn_1),
        .O(\abcdefg[4]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hD5555555)) 
    \abcdefg[4]_INST_0_i_2 
       (.I0(\abcdefg[4]_INST_0_i_4_n_0 ),
        .I1(\moving_sum_reg[9]_0 ),
        .I2(\moving_sum_reg[8]_0 ),
        .I3(\moving_sum_reg[11]_2 ),
        .I4(abcdefg_1_sn_1),
        .O(\abcdefg[4]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'hEFFEEFFF)) 
    \abcdefg[4]_INST_0_i_3 
       (.I0(\moving_sum_reg[11]_3 ),
        .I1(abcdefg_1_sn_1),
        .I2(\moving_sum_reg[5]_0 ),
        .I3(\moving_sum_reg[11]_1 ),
        .I4(\moving_sum_reg[11]_0 ),
        .O(\abcdefg[4]_INST_0_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hFF7F)) 
    \abcdefg[4]_INST_0_i_4 
       (.I0(\moving_sum_reg[11]_0 ),
        .I1(\moving_sum_reg[11]_1 ),
        .I2(\moving_sum_reg[5]_0 ),
        .I3(abcdefg_1_sn_1),
        .O(\abcdefg[4]_INST_0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \abcdefg[5]_INST_0 
       (.I0(reset),
        .I1(\abcdefg[5]_INST_0_i_1_n_0 ),
        .O(abcdefg[5]));
  LUT6 #(
    .INIT(64'h98E0FFFF98E00000)) 
    \abcdefg[5]_INST_0_i_1 
       (.I0(\moving_sum_reg[8]_0 ),
        .I1(\moving_sum_reg[11]_2 ),
        .I2(\moving_sum_reg[9]_0 ),
        .I3(\moving_sum_reg[7]_0 ),
        .I4(abcdefg_1_sn_1),
        .I5(\abcdefg[5]_INST_0_i_2_n_0 ),
        .O(\abcdefg[5]_INST_0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h98E0)) 
    \abcdefg[5]_INST_0_i_2 
       (.I0(\moving_sum_reg[11]_0 ),
        .I1(\moving_sum_reg[11]_1 ),
        .I2(\moving_sum_reg[5]_0 ),
        .I3(\moving_sum_reg[11]_3 ),
        .O(\abcdefg[5]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \abcdefg[6]_INST_0 
       (.I0(reset),
        .I1(\abcdefg[6]_INST_0_i_1_n_0 ),
        .O(abcdefg[6]));
  LUT6 #(
    .INIT(64'h4910FFFF49100000)) 
    \abcdefg[6]_INST_0_i_1 
       (.I0(\moving_sum_reg[8]_0 ),
        .I1(\moving_sum_reg[11]_2 ),
        .I2(\moving_sum_reg[9]_0 ),
        .I3(\moving_sum_reg[7]_0 ),
        .I4(abcdefg_1_sn_1),
        .I5(\abcdefg[6]_INST_0_i_2_n_0 ),
        .O(\abcdefg[6]_INST_0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h4910)) 
    \abcdefg[6]_INST_0_i_2 
       (.I0(\moving_sum_reg[11]_0 ),
        .I1(\moving_sum_reg[11]_1 ),
        .I2(\moving_sum_reg[5]_0 ),
        .I3(\moving_sum_reg[11]_3 ),
        .O(\abcdefg[6]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hFBEA)) 
    \gpio2[0]_INST_0 
       (.I0(velocity1),
        .I1(moving_sum[11]),
        .I2(ARG3[3]),
        .I3(moving_sum[3]),
        .O(\moving_sum_reg[11]_3 ));
  LUT5 #(
    .INIT(32'h000072D8)) 
    \gpio2[1]_INST_0 
       (.I0(moving_sum[11]),
        .I1(ARG3[4]),
        .I2(moving_sum[4]),
        .I3(ARG3[3]),
        .I4(velocity1),
        .O(\moving_sum_reg[11]_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \gpio2[1]_INST_0_i_1 
       (.CI(1'b0),
        .CO({\gpio2[1]_INST_0_i_1_n_0 ,\gpio2[1]_INST_0_i_1_n_1 ,\gpio2[1]_INST_0_i_1_n_2 ,\gpio2[1]_INST_0_i_1_n_3 }),
        .CYINIT(\gpio2[1]_INST_0_i_2_n_0 ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({ARG3[4:3],\NLW_gpio2[1]_INST_0_i_1_O_UNCONNECTED [1:0]}),
        .S({\gpio2[1]_INST_0_i_3_n_0 ,\gpio2[1]_INST_0_i_4_n_0 ,\gpio2[1]_INST_0_i_5_n_0 ,\gpio2[1]_INST_0_i_6_n_0 }));
  LUT1 #(
    .INIT(2'h1)) 
    \gpio2[1]_INST_0_i_2 
       (.I0(moving_sum[0]),
        .O(\gpio2[1]_INST_0_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \gpio2[1]_INST_0_i_3 
       (.I0(moving_sum[4]),
        .O(\gpio2[1]_INST_0_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \gpio2[1]_INST_0_i_4 
       (.I0(moving_sum[3]),
        .O(\gpio2[1]_INST_0_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \gpio2[1]_INST_0_i_5 
       (.I0(moving_sum[2]),
        .O(\gpio2[1]_INST_0_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \gpio2[1]_INST_0_i_6 
       (.I0(moving_sum[1]),
        .O(\gpio2[1]_INST_0_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h0000AC5C)) 
    \gpio2[2]_INST_0 
       (.I0(ARG3[5]),
        .I1(moving_sum[5]),
        .I2(moving_sum[11]),
        .I3(\gpio2[3]_INST_0_i_2_n_0 ),
        .I4(velocity1),
        .O(\moving_sum_reg[5]_0 ));
  LUT5 #(
    .INIT(32'h000066C6)) 
    \gpio2[3]_INST_0 
       (.I0(moving_sum[11]),
        .I1(ARG2[6]),
        .I2(\gpio2[3]_INST_0_i_2_n_0 ),
        .I3(ARG3[5]),
        .I4(velocity1),
        .O(\moving_sum_reg[11]_1 ));
  LUT3 #(
    .INIT(8'hCA)) 
    \gpio2[3]_INST_0_i_1 
       (.I0(moving_sum[6]),
        .I1(ARG3[6]),
        .I2(moving_sum[11]),
        .O(ARG2[6]));
  LUT5 #(
    .INIT(32'h00500353)) 
    \gpio2[3]_INST_0_i_2 
       (.I0(ARG3[4]),
        .I1(moving_sum[4]),
        .I2(moving_sum[11]),
        .I3(ARG3[3]),
        .I4(moving_sum[3]),
        .O(\gpio2[3]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h0000AC5C)) 
    \gpio2[4]_INST_0 
       (.I0(ARG3[7]),
        .I1(moving_sum[7]),
        .I2(moving_sum[11]),
        .I3(\gpio2[4]_INST_0_i_1_n_0 ),
        .I4(velocity1),
        .O(\moving_sum_reg[7]_0 ));
  LUT6 #(
    .INIT(64'h00000A0011001B00)) 
    \gpio2[4]_INST_0_i_1 
       (.I0(moving_sum[11]),
        .I1(moving_sum[5]),
        .I2(ARG3[5]),
        .I3(\gpio2[3]_INST_0_i_2_n_0 ),
        .I4(ARG3[6]),
        .I5(moving_sum[6]),
        .O(\gpio2[4]_INST_0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h0000AC5C)) 
    \gpio2[5]_INST_0 
       (.I0(ARG3[8]),
        .I1(moving_sum[8]),
        .I2(moving_sum[11]),
        .I3(\gpio2[5]_INST_0_i_2_n_0 ),
        .I4(velocity1),
        .O(\moving_sum_reg[8]_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \gpio2[5]_INST_0_i_1 
       (.CI(\gpio2[1]_INST_0_i_1_n_0 ),
        .CO({\gpio2[5]_INST_0_i_1_n_0 ,\gpio2[5]_INST_0_i_1_n_1 ,\gpio2[5]_INST_0_i_1_n_2 ,\gpio2[5]_INST_0_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(ARG3[8:5]),
        .S({\gpio2[5]_INST_0_i_3_n_0 ,\gpio2[5]_INST_0_i_4_n_0 ,\gpio2[5]_INST_0_i_5_n_0 ,\gpio2[5]_INST_0_i_6_n_0 }));
  LUT6 #(
    .INIT(64'h0000000000201030)) 
    \gpio2[5]_INST_0_i_2 
       (.I0(moving_sum[11]),
        .I1(ARG2[6]),
        .I2(\gpio2[3]_INST_0_i_2_n_0 ),
        .I3(ARG3[5]),
        .I4(moving_sum[5]),
        .I5(ARG2[7]),
        .O(\gpio2[5]_INST_0_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \gpio2[5]_INST_0_i_3 
       (.I0(moving_sum[8]),
        .O(\gpio2[5]_INST_0_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \gpio2[5]_INST_0_i_4 
       (.I0(moving_sum[7]),
        .O(\gpio2[5]_INST_0_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \gpio2[5]_INST_0_i_5 
       (.I0(moving_sum[6]),
        .O(\gpio2[5]_INST_0_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \gpio2[5]_INST_0_i_6 
       (.I0(moving_sum[5]),
        .O(\gpio2[5]_INST_0_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h0000AC5C)) 
    \gpio2[6]_INST_0 
       (.I0(ARG3[9]),
        .I1(moving_sum[9]),
        .I2(moving_sum[11]),
        .I3(\gpio2[6]_INST_0_i_1_n_0 ),
        .I4(velocity1),
        .O(\moving_sum_reg[9]_0 ));
  LUT5 #(
    .INIT(32'h00000010)) 
    \gpio2[6]_INST_0_i_1 
       (.I0(ARG2[7]),
        .I1(ARG2[5]),
        .I2(\gpio2[3]_INST_0_i_2_n_0 ),
        .I3(ARG2[6]),
        .I4(ARG2[8]),
        .O(\gpio2[6]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFAAEFAA)) 
    \gpio2[7]_INST_0 
       (.I0(velocity1),
        .I1(ARG3[10]),
        .I2(\gpio2[7]_INST_0_i_2_n_0 ),
        .I3(moving_sum[11]),
        .I4(ARG3[11]),
        .O(\moving_sum_reg[11]_2 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \gpio2[7]_INST_0_i_1 
       (.CI(\gpio2[5]_INST_0_i_1_n_0 ),
        .CO({\NLW_gpio2[7]_INST_0_i_1_CO_UNCONNECTED [3:2],\gpio2[7]_INST_0_i_1_n_2 ,\gpio2[7]_INST_0_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_gpio2[7]_INST_0_i_1_O_UNCONNECTED [3],ARG3[11:9]}),
        .S({1'b0,\gpio2[7]_INST_0_i_3_n_0 ,\gpio2[7]_INST_0_i_4_n_0 ,\gpio2[7]_INST_0_i_5_n_0 }));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    \gpio2[7]_INST_0_i_2 
       (.I0(ARG2[8]),
        .I1(ARG2[6]),
        .I2(\gpio2[3]_INST_0_i_2_n_0 ),
        .I3(ARG2[5]),
        .I4(ARG2[7]),
        .I5(ARG2[9]),
        .O(\gpio2[7]_INST_0_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \gpio2[7]_INST_0_i_3 
       (.I0(moving_sum[11]),
        .O(\gpio2[7]_INST_0_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \gpio2[7]_INST_0_i_4 
       (.I0(moving_sum[10]),
        .O(\gpio2[7]_INST_0_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \gpio2[7]_INST_0_i_5 
       (.I0(moving_sum[9]),
        .O(\gpio2[7]_INST_0_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gpio2[7]_INST_0_i_6 
       (.I0(moving_sum[8]),
        .I1(ARG3[8]),
        .I2(moving_sum[11]),
        .O(ARG2[8]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gpio2[7]_INST_0_i_7 
       (.I0(moving_sum[5]),
        .I1(ARG3[5]),
        .I2(moving_sum[11]),
        .O(ARG2[5]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gpio2[7]_INST_0_i_8 
       (.I0(moving_sum[7]),
        .I1(ARG3[7]),
        .I2(moving_sum[11]),
        .O(ARG2[7]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \gpio2[7]_INST_0_i_9 
       (.I0(moving_sum[9]),
        .I1(ARG3[9]),
        .I2(moving_sum[11]),
        .O(ARG2[9]));
  LUT2 #(
    .INIT(4'h2)) 
    i__carry__0_i_1
       (.I0(pos_count[5]),
        .I1(pos_count_reset__1),
        .O(i__carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    i__carry__0_i_2
       (.I0(pos_count[4]),
        .I1(pos_count_reset__1),
        .O(i__carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    i__carry__0_i_3
       (.I0(pos_count[3]),
        .I1(pos_count_reset__1),
        .O(i__carry__0_i_3_n_0));
  LUT3 #(
    .INIT(8'hED)) 
    i__carry__0_i_4
       (.I0(pos_count[6]),
        .I1(pos_count_reset__1),
        .I2(pos_count[7]),
        .O(i__carry__0_i_4_n_0));
  LUT3 #(
    .INIT(8'hED)) 
    i__carry__0_i_5
       (.I0(pos_count[5]),
        .I1(pos_count_reset__1),
        .I2(pos_count[6]),
        .O(i__carry__0_i_5_n_0));
  LUT3 #(
    .INIT(8'hED)) 
    i__carry__0_i_6
       (.I0(pos_count[4]),
        .I1(pos_count_reset__1),
        .I2(pos_count[5]),
        .O(i__carry__0_i_6_n_0));
  LUT3 #(
    .INIT(8'hED)) 
    i__carry__0_i_7
       (.I0(pos_count[3]),
        .I1(pos_count_reset__1),
        .I2(pos_count[4]),
        .O(i__carry__0_i_7_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    i__carry_i_1
       (.I0(pos_count[2]),
        .I1(pos_count_reset__1),
        .O(i__carry_i_1_n_0));
  LUT4 #(
    .INIT(16'hDFFF)) 
    i__carry_i_12
       (.I0(pos_count[5]),
        .I1(pos_count[3]),
        .I2(pos_count[0]),
        .I3(pos_count[1]),
        .O(i__carry_i_12_n_0));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAABAAAA)) 
    i__carry_i_13
       (.I0(\moving_sum[11]_i_1_n_0 ),
        .I1(i__carry_i_14_n_0),
        .I2(pos_count[0]),
        .I3(pos_count[1]),
        .I4(pos_count[6]),
        .I5(pos_count[5]),
        .O(i__carry_i_13_n_0));
  LUT4 #(
    .INIT(16'h7FFF)) 
    i__carry_i_14
       (.I0(pos_count[2]),
        .I1(pos_count[3]),
        .I2(pos_count[7]),
        .I3(pos_count[4]),
        .O(i__carry_i_14_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    i__carry_i_2
       (.I0(pos_count[1]),
        .I1(pos_count_reset__1),
        .O(i__carry_i_2_n_0));
  LUT3 #(
    .INIT(8'hBA)) 
    i__carry_i_3
       (.I0(__11),
        .I1(pos_count_reset__1),
        .I2(pos_count[0]),
        .O(i__carry_i_3_n_0));
  LUT3 #(
    .INIT(8'h2D)) 
    i__carry_i_4
       (.I0(pos_count[0]),
        .I1(pos_count_reset__1),
        .I2(__11),
        .O(i__carry_i_4_n_0));
  LUT3 #(
    .INIT(8'hED)) 
    i__carry_i_5
       (.I0(pos_count[2]),
        .I1(pos_count_reset__1),
        .I2(pos_count[3]),
        .O(i__carry_i_5_n_0));
  LUT3 #(
    .INIT(8'hED)) 
    i__carry_i_6
       (.I0(pos_count[1]),
        .I1(pos_count_reset__1),
        .I2(pos_count[2]),
        .O(i__carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h3E31)) 
    i__carry_i_7
       (.I0(pos_count[0]),
        .I1(__11),
        .I2(pos_count_reset__1),
        .I3(pos_count[1]),
        .O(i__carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h2DD2)) 
    i__carry_i_8
       (.I0(pos_count[0]),
        .I1(pos_count_reset__1),
        .I2(__11),
        .I3(pos_dec),
        .O(i__carry_i_8_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFF00000001)) 
    i__carry_i_9
       (.I0(i__carry_i_12_n_0),
        .I1(pos_count[7]),
        .I2(pos_count[6]),
        .I3(pos_count[4]),
        .I4(pos_count[2]),
        .I5(i__carry_i_13_n_0),
        .O(pos_count_reset__1));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    \moving_sum[11]_i_1 
       (.I0(rcount_reg[18]),
        .I1(rcount_reg[15]),
        .I2(\moving_sum[11]_i_2_n_0 ),
        .I3(rcount_reg[17]),
        .I4(rcount_reg[16]),
        .I5(rcount_reg[19]),
        .O(\moving_sum[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000004)) 
    \moving_sum[11]_i_2 
       (.I0(rcount_reg[12]),
        .I1(\moving_sum[11]_i_3_n_0 ),
        .I2(rcount_reg[11]),
        .I3(rcount_reg[10]),
        .I4(rcount_reg[14]),
        .I5(rcount_reg[13]),
        .O(\moving_sum[11]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000010)) 
    \moving_sum[11]_i_3 
       (.I0(rcount_reg[7]),
        .I1(rcount_reg[8]),
        .I2(\moving_sum[11]_i_4_n_0 ),
        .I3(rcount_reg[6]),
        .I4(\moving_sum[11]_i_5_n_0 ),
        .O(\moving_sum[11]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \moving_sum[11]_i_4 
       (.I0(rcount_reg[3]),
        .I1(rcount_reg[0]),
        .I2(rcount_reg[1]),
        .I3(rcount_reg[2]),
        .I4(rcount_reg[5]),
        .I5(rcount_reg[4]),
        .O(\moving_sum[11]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hBA)) 
    \moving_sum[11]_i_5 
       (.I0(rcount_reg[11]),
        .I1(rcount_reg[10]),
        .I2(rcount_reg[9]),
        .O(\moving_sum[11]_i_5_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 moving_sum_next_carry
       (.CI(1'b0),
        .CO({moving_sum_next_carry_n_0,moving_sum_next_carry_n_1,moving_sum_next_carry_n_2,moving_sum_next_carry_n_3}),
        .CYINIT(1'b0),
        .DI({moving_sum_next_carry_i_1_n_0,moving_sum_next_carry_i_2_n_0,moving_sum_next_carry_i_3_n_0,moving_sum_next_carry_i_4_n_0}),
        .O({moving_sum_next_carry_n_4,moving_sum_next_carry_n_5,moving_sum_next_carry_n_6,moving_sum_next_carry_n_7}),
        .S({moving_sum_next_carry_i_5_n_0,moving_sum_next_carry_i_6_n_0,moving_sum_next_carry_i_7_n_0,moving_sum_next_carry_i_8_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 moving_sum_next_carry__0
       (.CI(moving_sum_next_carry_n_0),
        .CO({moving_sum_next_carry__0_n_0,moving_sum_next_carry__0_n_1,moving_sum_next_carry__0_n_2,moving_sum_next_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({moving_sum_next_carry__0_i_1_n_0,moving_sum_next_carry__0_i_2_n_0,moving_sum_next_carry__0_i_3_n_0,moving_sum_next_carry__0_i_4_n_0}),
        .O({moving_sum_next_carry__0_n_4,moving_sum_next_carry__0_n_5,moving_sum_next_carry__0_n_6,moving_sum_next_carry__0_n_7}),
        .S({moving_sum_next_carry__0_i_5_n_0,moving_sum_next_carry__0_i_6_n_0,moving_sum_next_carry__0_i_7_n_0,moving_sum_next_carry__0_i_8_n_0}));
  (* HLUTNM = "lutpair5" *) 
  LUT3 #(
    .INIT(8'h8E)) 
    moving_sum_next_carry__0_i_1
       (.I0(moving_sum[6]),
        .I1(pos_count[6]),
        .I2(\pos_shift_reg[9] [6]),
        .O(moving_sum_next_carry__0_i_1_n_0));
  (* HLUTNM = "lutpair4" *) 
  LUT3 #(
    .INIT(8'h8E)) 
    moving_sum_next_carry__0_i_2
       (.I0(moving_sum[5]),
        .I1(pos_count[5]),
        .I2(\pos_shift_reg[9] [5]),
        .O(moving_sum_next_carry__0_i_2_n_0));
  (* HLUTNM = "lutpair3" *) 
  LUT3 #(
    .INIT(8'h8E)) 
    moving_sum_next_carry__0_i_3
       (.I0(moving_sum[4]),
        .I1(pos_count[4]),
        .I2(\pos_shift_reg[9] [4]),
        .O(moving_sum_next_carry__0_i_3_n_0));
  (* HLUTNM = "lutpair2" *) 
  LUT3 #(
    .INIT(8'h8E)) 
    moving_sum_next_carry__0_i_4
       (.I0(moving_sum[3]),
        .I1(pos_count[3]),
        .I2(\pos_shift_reg[9] [3]),
        .O(moving_sum_next_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h9669)) 
    moving_sum_next_carry__0_i_5
       (.I0(moving_sum_next_carry__0_i_1_n_0),
        .I1(pos_count[7]),
        .I2(moving_sum[7]),
        .I3(\pos_shift_reg[9] [7]),
        .O(moving_sum_next_carry__0_i_5_n_0));
  (* HLUTNM = "lutpair5" *) 
  LUT4 #(
    .INIT(16'h9669)) 
    moving_sum_next_carry__0_i_6
       (.I0(moving_sum[6]),
        .I1(pos_count[6]),
        .I2(\pos_shift_reg[9] [6]),
        .I3(moving_sum_next_carry__0_i_2_n_0),
        .O(moving_sum_next_carry__0_i_6_n_0));
  (* HLUTNM = "lutpair4" *) 
  LUT4 #(
    .INIT(16'h9669)) 
    moving_sum_next_carry__0_i_7
       (.I0(moving_sum[5]),
        .I1(pos_count[5]),
        .I2(\pos_shift_reg[9] [5]),
        .I3(moving_sum_next_carry__0_i_3_n_0),
        .O(moving_sum_next_carry__0_i_7_n_0));
  (* HLUTNM = "lutpair3" *) 
  LUT4 #(
    .INIT(16'h9669)) 
    moving_sum_next_carry__0_i_8
       (.I0(moving_sum[4]),
        .I1(pos_count[4]),
        .I2(\pos_shift_reg[9] [4]),
        .I3(moving_sum_next_carry__0_i_4_n_0),
        .O(moving_sum_next_carry__0_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 moving_sum_next_carry__1
       (.CI(moving_sum_next_carry__0_n_0),
        .CO({NLW_moving_sum_next_carry__1_CO_UNCONNECTED[3],moving_sum_next_carry__1_n_1,moving_sum_next_carry__1_n_2,moving_sum_next_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,moving_sum[9:8],moving_sum_next_carry__1_i_1_n_0}),
        .O({moving_sum_next_carry__1_n_4,moving_sum_next_carry__1_n_5,moving_sum_next_carry__1_n_6,moving_sum_next_carry__1_n_7}),
        .S({moving_sum_next_carry__1_i_2_n_0,moving_sum_next_carry__1_i_3_n_0,moving_sum_next_carry__1_i_4_n_0,moving_sum_next_carry__1_i_5_n_0}));
  LUT3 #(
    .INIT(8'hD4)) 
    moving_sum_next_carry__1_i_1
       (.I0(pos_count[7]),
        .I1(moving_sum[7]),
        .I2(\pos_shift_reg[9] [7]),
        .O(moving_sum_next_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    moving_sum_next_carry__1_i_2
       (.I0(moving_sum[10]),
        .I1(moving_sum[11]),
        .O(moving_sum_next_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    moving_sum_next_carry__1_i_3
       (.I0(moving_sum[9]),
        .I1(moving_sum[10]),
        .O(moving_sum_next_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    moving_sum_next_carry__1_i_4
       (.I0(moving_sum[8]),
        .I1(moving_sum[9]),
        .O(moving_sum_next_carry__1_i_4_n_0));
  LUT4 #(
    .INIT(16'h8E71)) 
    moving_sum_next_carry__1_i_5
       (.I0(\pos_shift_reg[9] [7]),
        .I1(moving_sum[7]),
        .I2(pos_count[7]),
        .I3(moving_sum[8]),
        .O(moving_sum_next_carry__1_i_5_n_0));
  (* HLUTNM = "lutpair1" *) 
  LUT3 #(
    .INIT(8'h8E)) 
    moving_sum_next_carry_i_1
       (.I0(moving_sum[2]),
        .I1(pos_count[2]),
        .I2(\pos_shift_reg[9] [2]),
        .O(moving_sum_next_carry_i_1_n_0));
  (* HLUTNM = "lutpair0" *) 
  LUT3 #(
    .INIT(8'h8E)) 
    moving_sum_next_carry_i_2
       (.I0(moving_sum[1]),
        .I1(pos_count[1]),
        .I2(\pos_shift_reg[9] [1]),
        .O(moving_sum_next_carry_i_2_n_0));
  (* HLUTNM = "lutpair6" *) 
  LUT2 #(
    .INIT(4'hE)) 
    moving_sum_next_carry_i_3
       (.I0(pos_count[0]),
        .I1(moving_sum[0]),
        .O(moving_sum_next_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    moving_sum_next_carry_i_4
       (.I0(moving_sum[0]),
        .I1(pos_count[0]),
        .O(moving_sum_next_carry_i_4_n_0));
  (* HLUTNM = "lutpair2" *) 
  LUT4 #(
    .INIT(16'h9669)) 
    moving_sum_next_carry_i_5
       (.I0(moving_sum[3]),
        .I1(pos_count[3]),
        .I2(\pos_shift_reg[9] [3]),
        .I3(moving_sum_next_carry_i_1_n_0),
        .O(moving_sum_next_carry_i_5_n_0));
  (* HLUTNM = "lutpair1" *) 
  LUT4 #(
    .INIT(16'h9669)) 
    moving_sum_next_carry_i_6
       (.I0(moving_sum[2]),
        .I1(pos_count[2]),
        .I2(\pos_shift_reg[9] [2]),
        .I3(moving_sum_next_carry_i_2_n_0),
        .O(moving_sum_next_carry_i_6_n_0));
  (* HLUTNM = "lutpair0" *) 
  LUT4 #(
    .INIT(16'h9669)) 
    moving_sum_next_carry_i_7
       (.I0(moving_sum[1]),
        .I1(pos_count[1]),
        .I2(\pos_shift_reg[9] [1]),
        .I3(moving_sum_next_carry_i_3_n_0),
        .O(moving_sum_next_carry_i_7_n_0));
  (* HLUTNM = "lutpair6" *) 
  LUT3 #(
    .INIT(8'h96)) 
    moving_sum_next_carry_i_8
       (.I0(pos_count[0]),
        .I1(moving_sum[0]),
        .I2(\pos_shift_reg[9] [0]),
        .O(moving_sum_next_carry_i_8_n_0));
  FDCE \moving_sum_reg[0] 
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLR(reset),
        .D(moving_sum_next_carry_n_7),
        .Q(moving_sum[0]));
  FDCE \moving_sum_reg[10] 
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLR(reset),
        .D(moving_sum_next_carry__1_n_5),
        .Q(moving_sum[10]));
  FDCE \moving_sum_reg[11] 
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLR(reset),
        .D(moving_sum_next_carry__1_n_4),
        .Q(moving_sum[11]));
  FDCE \moving_sum_reg[1] 
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLR(reset),
        .D(moving_sum_next_carry_n_6),
        .Q(moving_sum[1]));
  FDCE \moving_sum_reg[2] 
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLR(reset),
        .D(moving_sum_next_carry_n_5),
        .Q(moving_sum[2]));
  FDCE \moving_sum_reg[3] 
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLR(reset),
        .D(moving_sum_next_carry_n_4),
        .Q(moving_sum[3]));
  FDCE \moving_sum_reg[4] 
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLR(reset),
        .D(moving_sum_next_carry__0_n_7),
        .Q(moving_sum[4]));
  FDCE \moving_sum_reg[5] 
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLR(reset),
        .D(moving_sum_next_carry__0_n_6),
        .Q(moving_sum[5]));
  FDCE \moving_sum_reg[6] 
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLR(reset),
        .D(moving_sum_next_carry__0_n_5),
        .Q(moving_sum[6]));
  FDCE \moving_sum_reg[7] 
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLR(reset),
        .D(moving_sum_next_carry__0_n_4),
        .Q(moving_sum[7]));
  FDCE \moving_sum_reg[8] 
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLR(reset),
        .D(moving_sum_next_carry__1_n_7),
        .Q(moving_sum[8]));
  FDCE \moving_sum_reg[9] 
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLR(reset),
        .D(moving_sum_next_carry__1_n_6),
        .Q(moving_sum[9]));
  FDCE \pos_count_reg[0] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\_inferred__0/i__carry_n_7 ),
        .Q(pos_count[0]));
  FDCE \pos_count_reg[1] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\_inferred__0/i__carry_n_6 ),
        .Q(pos_count[1]));
  FDCE \pos_count_reg[2] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\_inferred__0/i__carry_n_5 ),
        .Q(pos_count[2]));
  FDCE \pos_count_reg[3] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\_inferred__0/i__carry_n_4 ),
        .Q(pos_count[3]));
  FDCE \pos_count_reg[4] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\_inferred__0/i__carry__0_n_7 ),
        .Q(pos_count[4]));
  FDCE \pos_count_reg[5] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\_inferred__0/i__carry__0_n_6 ),
        .Q(pos_count[5]));
  FDCE \pos_count_reg[6] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\_inferred__0/i__carry__0_n_5 ),
        .Q(pos_count[6]));
  FDCE \pos_count_reg[7] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\_inferred__0/i__carry__0_n_4 ),
        .Q(pos_count[7]));
  (* srl_bus_name = "\U0/UUT_VEL_READ/pos_shift_reg[7] " *) 
  (* srl_name = "\U0/UUT_VEL_READ/pos_shift_reg[7][0]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6 " *) 
  SRL16E \pos_shift_reg[7][0]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLK(mclk),
        .D(pos_count[0]),
        .Q(\pos_shift_reg[7][0]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ));
  (* srl_bus_name = "\U0/UUT_VEL_READ/pos_shift_reg[7] " *) 
  (* srl_name = "\U0/UUT_VEL_READ/pos_shift_reg[7][1]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6 " *) 
  SRL16E \pos_shift_reg[7][1]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLK(mclk),
        .D(pos_count[1]),
        .Q(\pos_shift_reg[7][1]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ));
  (* srl_bus_name = "\U0/UUT_VEL_READ/pos_shift_reg[7] " *) 
  (* srl_name = "\U0/UUT_VEL_READ/pos_shift_reg[7][2]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6 " *) 
  SRL16E \pos_shift_reg[7][2]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLK(mclk),
        .D(pos_count[2]),
        .Q(\pos_shift_reg[7][2]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ));
  (* srl_bus_name = "\U0/UUT_VEL_READ/pos_shift_reg[7] " *) 
  (* srl_name = "\U0/UUT_VEL_READ/pos_shift_reg[7][3]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6 " *) 
  SRL16E \pos_shift_reg[7][3]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLK(mclk),
        .D(pos_count[3]),
        .Q(\pos_shift_reg[7][3]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ));
  (* srl_bus_name = "\U0/UUT_VEL_READ/pos_shift_reg[7] " *) 
  (* srl_name = "\U0/UUT_VEL_READ/pos_shift_reg[7][4]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6 " *) 
  SRL16E \pos_shift_reg[7][4]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLK(mclk),
        .D(pos_count[4]),
        .Q(\pos_shift_reg[7][4]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ));
  (* srl_bus_name = "\U0/UUT_VEL_READ/pos_shift_reg[7] " *) 
  (* srl_name = "\U0/UUT_VEL_READ/pos_shift_reg[7][5]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6 " *) 
  SRL16E \pos_shift_reg[7][5]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLK(mclk),
        .D(pos_count[5]),
        .Q(\pos_shift_reg[7][5]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ));
  (* srl_bus_name = "\U0/UUT_VEL_READ/pos_shift_reg[7] " *) 
  (* srl_name = "\U0/UUT_VEL_READ/pos_shift_reg[7][6]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6 " *) 
  SRL16E \pos_shift_reg[7][6]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLK(mclk),
        .D(pos_count[6]),
        .Q(\pos_shift_reg[7][6]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ));
  (* srl_bus_name = "\U0/UUT_VEL_READ/pos_shift_reg[7] " *) 
  (* srl_name = "\U0/UUT_VEL_READ/pos_shift_reg[7][7]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6 " *) 
  SRL16E \pos_shift_reg[7][7]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLK(mclk),
        .D(pos_count[7]),
        .Q(\pos_shift_reg[7][7]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ));
  FDRE \pos_shift_reg[8][0]_U0_UUT_VEL_READ_pos_shift_reg_c_7 
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .D(\pos_shift_reg[7][0]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ),
        .Q(\pos_shift_reg[8][0]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ),
        .R(1'b0));
  FDRE \pos_shift_reg[8][1]_U0_UUT_VEL_READ_pos_shift_reg_c_7 
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .D(\pos_shift_reg[7][1]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ),
        .Q(\pos_shift_reg[8][1]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ),
        .R(1'b0));
  FDRE \pos_shift_reg[8][2]_U0_UUT_VEL_READ_pos_shift_reg_c_7 
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .D(\pos_shift_reg[7][2]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ),
        .Q(\pos_shift_reg[8][2]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ),
        .R(1'b0));
  FDRE \pos_shift_reg[8][3]_U0_UUT_VEL_READ_pos_shift_reg_c_7 
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .D(\pos_shift_reg[7][3]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ),
        .Q(\pos_shift_reg[8][3]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ),
        .R(1'b0));
  FDRE \pos_shift_reg[8][4]_U0_UUT_VEL_READ_pos_shift_reg_c_7 
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .D(\pos_shift_reg[7][4]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ),
        .Q(\pos_shift_reg[8][4]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ),
        .R(1'b0));
  FDRE \pos_shift_reg[8][5]_U0_UUT_VEL_READ_pos_shift_reg_c_7 
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .D(\pos_shift_reg[7][5]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ),
        .Q(\pos_shift_reg[8][5]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ),
        .R(1'b0));
  FDRE \pos_shift_reg[8][6]_U0_UUT_VEL_READ_pos_shift_reg_c_7 
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .D(\pos_shift_reg[7][6]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ),
        .Q(\pos_shift_reg[8][6]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ),
        .R(1'b0));
  FDRE \pos_shift_reg[8][7]_U0_UUT_VEL_READ_pos_shift_reg_c_7 
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .D(\pos_shift_reg[7][7]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ),
        .Q(\pos_shift_reg[8][7]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ),
        .R(1'b0));
  FDCE \pos_shift_reg[9][0] 
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLR(reset),
        .D(pos_shift_reg_gate__6_n_0),
        .Q(\pos_shift_reg[9] [0]));
  FDCE \pos_shift_reg[9][1] 
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLR(reset),
        .D(pos_shift_reg_gate__5_n_0),
        .Q(\pos_shift_reg[9] [1]));
  FDCE \pos_shift_reg[9][2] 
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLR(reset),
        .D(pos_shift_reg_gate__4_n_0),
        .Q(\pos_shift_reg[9] [2]));
  FDCE \pos_shift_reg[9][3] 
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLR(reset),
        .D(pos_shift_reg_gate__3_n_0),
        .Q(\pos_shift_reg[9] [3]));
  FDCE \pos_shift_reg[9][4] 
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLR(reset),
        .D(pos_shift_reg_gate__2_n_0),
        .Q(\pos_shift_reg[9] [4]));
  FDCE \pos_shift_reg[9][5] 
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLR(reset),
        .D(pos_shift_reg_gate__1_n_0),
        .Q(\pos_shift_reg[9] [5]));
  FDCE \pos_shift_reg[9][6] 
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLR(reset),
        .D(pos_shift_reg_gate__0_n_0),
        .Q(\pos_shift_reg[9] [6]));
  FDCE \pos_shift_reg[9][7] 
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLR(reset),
        .D(pos_shift_reg_gate_n_0),
        .Q(\pos_shift_reg[9] [7]));
  FDCE pos_shift_reg_c
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLR(reset),
        .D(1'b1),
        .Q(pos_shift_reg_c_n_0));
  FDCE pos_shift_reg_c_0
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLR(reset),
        .D(pos_shift_reg_c_n_0),
        .Q(pos_shift_reg_c_0_n_0));
  FDCE pos_shift_reg_c_1
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLR(reset),
        .D(pos_shift_reg_c_0_n_0),
        .Q(pos_shift_reg_c_1_n_0));
  FDCE pos_shift_reg_c_2
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLR(reset),
        .D(pos_shift_reg_c_1_n_0),
        .Q(pos_shift_reg_c_2_n_0));
  FDCE pos_shift_reg_c_3
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLR(reset),
        .D(pos_shift_reg_c_2_n_0),
        .Q(pos_shift_reg_c_3_n_0));
  FDCE pos_shift_reg_c_4
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLR(reset),
        .D(pos_shift_reg_c_3_n_0),
        .Q(pos_shift_reg_c_4_n_0));
  FDCE pos_shift_reg_c_5
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLR(reset),
        .D(pos_shift_reg_c_4_n_0),
        .Q(pos_shift_reg_c_5_n_0));
  FDCE pos_shift_reg_c_6
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLR(reset),
        .D(pos_shift_reg_c_5_n_0),
        .Q(pos_shift_reg_c_6_n_0));
  FDCE pos_shift_reg_c_7
       (.C(mclk),
        .CE(\moving_sum[11]_i_1_n_0 ),
        .CLR(reset),
        .D(pos_shift_reg_c_6_n_0),
        .Q(pos_shift_reg_c_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    pos_shift_reg_gate
       (.I0(\pos_shift_reg[8][7]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ),
        .I1(pos_shift_reg_c_7_n_0),
        .O(pos_shift_reg_gate_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    pos_shift_reg_gate__0
       (.I0(\pos_shift_reg[8][6]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ),
        .I1(pos_shift_reg_c_7_n_0),
        .O(pos_shift_reg_gate__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    pos_shift_reg_gate__1
       (.I0(\pos_shift_reg[8][5]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ),
        .I1(pos_shift_reg_c_7_n_0),
        .O(pos_shift_reg_gate__1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    pos_shift_reg_gate__2
       (.I0(\pos_shift_reg[8][4]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ),
        .I1(pos_shift_reg_c_7_n_0),
        .O(pos_shift_reg_gate__2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    pos_shift_reg_gate__3
       (.I0(\pos_shift_reg[8][3]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ),
        .I1(pos_shift_reg_c_7_n_0),
        .O(pos_shift_reg_gate__3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    pos_shift_reg_gate__4
       (.I0(\pos_shift_reg[8][2]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ),
        .I1(pos_shift_reg_c_7_n_0),
        .O(pos_shift_reg_gate__4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h8)) 
    pos_shift_reg_gate__5
       (.I0(\pos_shift_reg[8][1]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ),
        .I1(pos_shift_reg_c_7_n_0),
        .O(pos_shift_reg_gate__5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h8)) 
    pos_shift_reg_gate__6
       (.I0(\pos_shift_reg[8][0]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ),
        .I1(pos_shift_reg_c_7_n_0),
        .O(pos_shift_reg_gate__6_n_0));
  LUT6 #(
    .INIT(64'h7FFFFFFF00000000)) 
    \rcount[0]_i_2 
       (.I0(rcount_reg[16]),
        .I1(rcount_reg[19]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(rcount_reg[17]),
        .I4(rcount_reg[18]),
        .I5(rcount_reg[0]),
        .O(\rcount[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF00000000)) 
    \rcount[0]_i_3 
       (.I0(rcount_reg[16]),
        .I1(rcount_reg[19]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(rcount_reg[17]),
        .I4(rcount_reg[18]),
        .I5(rcount_reg[3]),
        .O(\rcount[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF00000000)) 
    \rcount[0]_i_4 
       (.I0(rcount_reg[16]),
        .I1(rcount_reg[19]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(rcount_reg[17]),
        .I4(rcount_reg[18]),
        .I5(rcount_reg[2]),
        .O(\rcount[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF00000000)) 
    \rcount[0]_i_5 
       (.I0(rcount_reg[16]),
        .I1(rcount_reg[19]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(rcount_reg[17]),
        .I4(rcount_reg[18]),
        .I5(rcount_reg[1]),
        .O(\rcount[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h000000007FFFFFFF)) 
    \rcount[0]_i_6 
       (.I0(rcount_reg[16]),
        .I1(rcount_reg[19]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(rcount_reg[17]),
        .I4(rcount_reg[18]),
        .I5(rcount_reg[0]),
        .O(\rcount[0]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFEAAAAAAAA)) 
    \rcount[0]_i_7 
       (.I0(rcount_reg[15]),
        .I1(rcount_reg[10]),
        .I2(\rcount[0]_i_8_n_0 ),
        .I3(rcount_reg[11]),
        .I4(rcount_reg[12]),
        .I5(rcount_reg[14]),
        .O(\rcount[0]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFEAAAAAAAA)) 
    \rcount[0]_i_8 
       (.I0(rcount_reg[13]),
        .I1(rcount_reg[7]),
        .I2(rcount_reg[6]),
        .I3(\rcount[0]_i_9_n_0 ),
        .I4(rcount_reg[8]),
        .I5(rcount_reg[9]),
        .O(\rcount[0]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \rcount[0]_i_9 
       (.I0(rcount_reg[2]),
        .I1(rcount_reg[1]),
        .I2(rcount_reg[5]),
        .I3(rcount_reg[0]),
        .I4(rcount_reg[3]),
        .I5(rcount_reg[4]),
        .O(\rcount[0]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF00000000)) 
    \rcount[12]_i_2 
       (.I0(rcount_reg[16]),
        .I1(rcount_reg[19]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(rcount_reg[17]),
        .I4(rcount_reg[18]),
        .I5(rcount_reg[15]),
        .O(\rcount[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF00000000)) 
    \rcount[12]_i_3 
       (.I0(rcount_reg[16]),
        .I1(rcount_reg[19]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(rcount_reg[17]),
        .I4(rcount_reg[18]),
        .I5(rcount_reg[14]),
        .O(\rcount[12]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF00000000)) 
    \rcount[12]_i_4 
       (.I0(rcount_reg[16]),
        .I1(rcount_reg[19]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(rcount_reg[17]),
        .I4(rcount_reg[18]),
        .I5(rcount_reg[13]),
        .O(\rcount[12]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF00000000)) 
    \rcount[12]_i_5 
       (.I0(rcount_reg[16]),
        .I1(rcount_reg[19]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(rcount_reg[17]),
        .I4(rcount_reg[18]),
        .I5(rcount_reg[12]),
        .O(\rcount[12]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h4CCCCCCC)) 
    \rcount[16]_i_2 
       (.I0(rcount_reg[16]),
        .I1(rcount_reg[19]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(rcount_reg[17]),
        .I4(rcount_reg[18]),
        .O(\rcount[16]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h7FFF0000)) 
    \rcount[16]_i_3 
       (.I0(rcount_reg[16]),
        .I1(rcount_reg[19]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(rcount_reg[17]),
        .I4(rcount_reg[18]),
        .O(\rcount[16]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h7F00FF00)) 
    \rcount[16]_i_4 
       (.I0(rcount_reg[16]),
        .I1(rcount_reg[19]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(rcount_reg[17]),
        .I4(rcount_reg[18]),
        .O(\rcount[16]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h2AAAAAAA)) 
    \rcount[16]_i_5 
       (.I0(rcount_reg[16]),
        .I1(rcount_reg[19]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(rcount_reg[17]),
        .I4(rcount_reg[18]),
        .O(\rcount[16]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF00000000)) 
    \rcount[4]_i_2 
       (.I0(rcount_reg[16]),
        .I1(rcount_reg[19]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(rcount_reg[17]),
        .I4(rcount_reg[18]),
        .I5(rcount_reg[7]),
        .O(\rcount[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF00000000)) 
    \rcount[4]_i_3 
       (.I0(rcount_reg[16]),
        .I1(rcount_reg[19]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(rcount_reg[17]),
        .I4(rcount_reg[18]),
        .I5(rcount_reg[6]),
        .O(\rcount[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF00000000)) 
    \rcount[4]_i_4 
       (.I0(rcount_reg[16]),
        .I1(rcount_reg[19]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(rcount_reg[17]),
        .I4(rcount_reg[18]),
        .I5(rcount_reg[5]),
        .O(\rcount[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF00000000)) 
    \rcount[4]_i_5 
       (.I0(rcount_reg[16]),
        .I1(rcount_reg[19]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(rcount_reg[17]),
        .I4(rcount_reg[18]),
        .I5(rcount_reg[4]),
        .O(\rcount[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF00000000)) 
    \rcount[8]_i_2 
       (.I0(rcount_reg[16]),
        .I1(rcount_reg[19]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(rcount_reg[17]),
        .I4(rcount_reg[18]),
        .I5(rcount_reg[11]),
        .O(\rcount[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF00000000)) 
    \rcount[8]_i_3 
       (.I0(rcount_reg[16]),
        .I1(rcount_reg[19]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(rcount_reg[17]),
        .I4(rcount_reg[18]),
        .I5(rcount_reg[10]),
        .O(\rcount[8]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF00000000)) 
    \rcount[8]_i_4 
       (.I0(rcount_reg[16]),
        .I1(rcount_reg[19]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(rcount_reg[17]),
        .I4(rcount_reg[18]),
        .I5(rcount_reg[9]),
        .O(\rcount[8]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF00000000)) 
    \rcount[8]_i_5 
       (.I0(rcount_reg[16]),
        .I1(rcount_reg[19]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(rcount_reg[17]),
        .I4(rcount_reg[18]),
        .I5(rcount_reg[8]),
        .O(\rcount[8]_i_5_n_0 ));
  FDCE \rcount_reg[0] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[0]_i_1_n_7 ),
        .Q(rcount_reg[0]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \rcount_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\rcount_reg[0]_i_1_n_0 ,\rcount_reg[0]_i_1_n_1 ,\rcount_reg[0]_i_1_n_2 ,\rcount_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\rcount[0]_i_2_n_0 }),
        .O({\rcount_reg[0]_i_1_n_4 ,\rcount_reg[0]_i_1_n_5 ,\rcount_reg[0]_i_1_n_6 ,\rcount_reg[0]_i_1_n_7 }),
        .S({\rcount[0]_i_3_n_0 ,\rcount[0]_i_4_n_0 ,\rcount[0]_i_5_n_0 ,\rcount[0]_i_6_n_0 }));
  FDCE \rcount_reg[10] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[8]_i_1_n_5 ),
        .Q(rcount_reg[10]));
  FDCE \rcount_reg[11] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[8]_i_1_n_4 ),
        .Q(rcount_reg[11]));
  FDCE \rcount_reg[12] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[12]_i_1_n_7 ),
        .Q(rcount_reg[12]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \rcount_reg[12]_i_1 
       (.CI(\rcount_reg[8]_i_1_n_0 ),
        .CO({\rcount_reg[12]_i_1_n_0 ,\rcount_reg[12]_i_1_n_1 ,\rcount_reg[12]_i_1_n_2 ,\rcount_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\rcount_reg[12]_i_1_n_4 ,\rcount_reg[12]_i_1_n_5 ,\rcount_reg[12]_i_1_n_6 ,\rcount_reg[12]_i_1_n_7 }),
        .S({\rcount[12]_i_2_n_0 ,\rcount[12]_i_3_n_0 ,\rcount[12]_i_4_n_0 ,\rcount[12]_i_5_n_0 }));
  FDCE \rcount_reg[13] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[12]_i_1_n_6 ),
        .Q(rcount_reg[13]));
  FDCE \rcount_reg[14] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[12]_i_1_n_5 ),
        .Q(rcount_reg[14]));
  FDCE \rcount_reg[15] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[12]_i_1_n_4 ),
        .Q(rcount_reg[15]));
  FDCE \rcount_reg[16] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[16]_i_1_n_7 ),
        .Q(rcount_reg[16]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \rcount_reg[16]_i_1 
       (.CI(\rcount_reg[12]_i_1_n_0 ),
        .CO({\NLW_rcount_reg[16]_i_1_CO_UNCONNECTED [3],\rcount_reg[16]_i_1_n_1 ,\rcount_reg[16]_i_1_n_2 ,\rcount_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\rcount_reg[16]_i_1_n_4 ,\rcount_reg[16]_i_1_n_5 ,\rcount_reg[16]_i_1_n_6 ,\rcount_reg[16]_i_1_n_7 }),
        .S({\rcount[16]_i_2_n_0 ,\rcount[16]_i_3_n_0 ,\rcount[16]_i_4_n_0 ,\rcount[16]_i_5_n_0 }));
  FDCE \rcount_reg[17] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[16]_i_1_n_6 ),
        .Q(rcount_reg[17]));
  FDCE \rcount_reg[18] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[16]_i_1_n_5 ),
        .Q(rcount_reg[18]));
  FDCE \rcount_reg[19] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[16]_i_1_n_4 ),
        .Q(rcount_reg[19]));
  FDCE \rcount_reg[1] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[0]_i_1_n_6 ),
        .Q(rcount_reg[1]));
  FDCE \rcount_reg[2] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[0]_i_1_n_5 ),
        .Q(rcount_reg[2]));
  FDCE \rcount_reg[3] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[0]_i_1_n_4 ),
        .Q(rcount_reg[3]));
  FDCE \rcount_reg[4] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[4]_i_1_n_7 ),
        .Q(rcount_reg[4]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \rcount_reg[4]_i_1 
       (.CI(\rcount_reg[0]_i_1_n_0 ),
        .CO({\rcount_reg[4]_i_1_n_0 ,\rcount_reg[4]_i_1_n_1 ,\rcount_reg[4]_i_1_n_2 ,\rcount_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\rcount_reg[4]_i_1_n_4 ,\rcount_reg[4]_i_1_n_5 ,\rcount_reg[4]_i_1_n_6 ,\rcount_reg[4]_i_1_n_7 }),
        .S({\rcount[4]_i_2_n_0 ,\rcount[4]_i_3_n_0 ,\rcount[4]_i_4_n_0 ,\rcount[4]_i_5_n_0 }));
  FDCE \rcount_reg[5] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[4]_i_1_n_6 ),
        .Q(rcount_reg[5]));
  FDCE \rcount_reg[6] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[4]_i_1_n_5 ),
        .Q(rcount_reg[6]));
  FDCE \rcount_reg[7] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[4]_i_1_n_4 ),
        .Q(rcount_reg[7]));
  FDCE \rcount_reg[8] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[8]_i_1_n_7 ),
        .Q(rcount_reg[8]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \rcount_reg[8]_i_1 
       (.CI(\rcount_reg[4]_i_1_n_0 ),
        .CO({\rcount_reg[8]_i_1_n_0 ,\rcount_reg[8]_i_1_n_1 ,\rcount_reg[8]_i_1_n_2 ,\rcount_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\rcount_reg[8]_i_1_n_4 ,\rcount_reg[8]_i_1_n_5 ,\rcount_reg[8]_i_1_n_6 ,\rcount_reg[8]_i_1_n_7 }),
        .S({\rcount[8]_i_2_n_0 ,\rcount[8]_i_3_n_0 ,\rcount[8]_i_4_n_0 ,\rcount[8]_i_5_n_0 }));
  FDCE \rcount_reg[9] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[8]_i_1_n_6 ),
        .Q(rcount_reg[9]));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 velocity1_carry
       (.CI(1'b0),
        .CO({velocity1,velocity1_carry_n_1,velocity1_carry_n_2,velocity1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({velocity1_carry_i_1_n_0,1'b0,velocity1_carry_i_2_n_0,velocity2}),
        .O(NLW_velocity1_carry_O_UNCONNECTED[3:0]),
        .S({velocity1_carry_i_4_n_0,velocity1_carry_i_5_n_0,velocity1_carry_i_6_n_0,velocity1_carry_i_7_n_0}));
  LUT4 #(
    .INIT(16'h0CAC)) 
    velocity1_carry_i_1
       (.I0(velocity3[10]),
        .I1(moving_sum[10]),
        .I2(moving_sum[11]),
        .I3(velocity3[11]),
        .O(velocity1_carry_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 velocity1_carry_i_10
       (.CI(1'b0),
        .CO({velocity1_carry_i_10_n_0,velocity1_carry_i_10_n_1,velocity1_carry_i_10_n_2,velocity1_carry_i_10_n_3}),
        .CYINIT(\gpio2[1]_INST_0_i_2_n_0 ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({velocity3[4],NLW_velocity1_carry_i_10_O_UNCONNECTED[2:0]}),
        .S({velocity1_carry_i_18_n_0,velocity1_carry_i_19_n_0,velocity1_carry_i_20_n_0,velocity1_carry_i_21_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    velocity1_carry_i_11
       (.I0(moving_sum[11]),
        .O(velocity1_carry_i_11_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    velocity1_carry_i_12
       (.I0(moving_sum[10]),
        .O(velocity1_carry_i_12_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    velocity1_carry_i_13
       (.I0(moving_sum[9]),
        .O(velocity1_carry_i_13_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    velocity1_carry_i_14
       (.I0(moving_sum[8]),
        .O(velocity1_carry_i_14_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    velocity1_carry_i_15
       (.I0(moving_sum[7]),
        .O(velocity1_carry_i_15_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    velocity1_carry_i_16
       (.I0(moving_sum[6]),
        .O(velocity1_carry_i_16_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    velocity1_carry_i_17
       (.I0(moving_sum[5]),
        .O(velocity1_carry_i_17_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    velocity1_carry_i_18
       (.I0(moving_sum[4]),
        .O(velocity1_carry_i_18_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    velocity1_carry_i_19
       (.I0(moving_sum[3]),
        .O(velocity1_carry_i_19_n_0));
  LUT5 #(
    .INIT(32'hFFCFFACA)) 
    velocity1_carry_i_2
       (.I0(moving_sum[6]),
        .I1(velocity3[6]),
        .I2(moving_sum[11]),
        .I3(velocity3[7]),
        .I4(moving_sum[7]),
        .O(velocity1_carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    velocity1_carry_i_20
       (.I0(moving_sum[2]),
        .O(velocity1_carry_i_20_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    velocity1_carry_i_21
       (.I0(moving_sum[1]),
        .O(velocity1_carry_i_21_n_0));
  LUT3 #(
    .INIT(8'hCA)) 
    velocity1_carry_i_3
       (.I0(moving_sum[5]),
        .I1(velocity3[5]),
        .I2(moving_sum[11]),
        .O(velocity2));
  LUT4 #(
    .INIT(16'h0353)) 
    velocity1_carry_i_4
       (.I0(velocity3[10]),
        .I1(moving_sum[10]),
        .I2(moving_sum[11]),
        .I3(velocity3[11]),
        .O(velocity1_carry_i_4_n_0));
  LUT5 #(
    .INIT(32'hAC0CA000)) 
    velocity1_carry_i_5
       (.I0(velocity3[8]),
        .I1(moving_sum[8]),
        .I2(moving_sum[11]),
        .I3(velocity3[9]),
        .I4(moving_sum[9]),
        .O(velocity1_carry_i_5_n_0));
  LUT5 #(
    .INIT(32'h00500353)) 
    velocity1_carry_i_6
       (.I0(velocity3[6]),
        .I1(moving_sum[6]),
        .I2(moving_sum[11]),
        .I3(velocity3[7]),
        .I4(moving_sum[7]),
        .O(velocity1_carry_i_6_n_0));
  LUT5 #(
    .INIT(32'h00A00CAC)) 
    velocity1_carry_i_7
       (.I0(velocity3[4]),
        .I1(moving_sum[4]),
        .I2(moving_sum[11]),
        .I3(velocity3[5]),
        .I4(moving_sum[5]),
        .O(velocity1_carry_i_7_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 velocity1_carry_i_8
       (.CI(velocity1_carry_i_9_n_0),
        .CO({NLW_velocity1_carry_i_8_CO_UNCONNECTED[3:2],velocity1_carry_i_8_n_2,velocity1_carry_i_8_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_velocity1_carry_i_8_O_UNCONNECTED[3],velocity3[11:9]}),
        .S({1'b0,velocity1_carry_i_11_n_0,velocity1_carry_i_12_n_0,velocity1_carry_i_13_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 velocity1_carry_i_9
       (.CI(velocity1_carry_i_10_n_0),
        .CO({velocity1_carry_i_9_n_0,velocity1_carry_i_9_n_1,velocity1_carry_i_9_n_2,velocity1_carry_i_9_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(velocity3[8:5]),
        .S({velocity1_carry_i_14_n_0,velocity1_carry_i_15_n_0,velocity1_carry_i_16_n_0,velocity1_carry_i_17_n_0}));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
