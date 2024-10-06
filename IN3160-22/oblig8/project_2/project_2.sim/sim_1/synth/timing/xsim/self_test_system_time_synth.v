// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Fri Apr 29 14:10:41 2022
// Host        : kemble.ifi.uio.no running 64-bit Red Hat Enterprise Linux release 8.5 (Ootpa)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               /uio/hume/student-u81/rolfvh/IN3160-22/oblig8/project_2/project_2.sim/sim_1/synth/timing/xsim/self_test_system_time_synth.v
// Design      : self_test_system
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module ROM
   (DI,
    Q,
    D,
    pwm_counter_reg,
    \FSM_sequential_moore_state_curr_reg[0] ,
    mclk_IBUF_BUFG,
    \data_reg[0]_0 );
  output [3:0]DI;
  output [7:0]Q;
  output [1:0]D;
  input [7:0]pwm_counter_reg;
  input [1:0]\FSM_sequential_moore_state_curr_reg[0] ;
  input mclk_IBUF_BUFG;
  input [4:0]\data_reg[0]_0 ;

  wire [1:0]D;
  wire [3:0]DI;
  wire \FSM_sequential_moore_state_curr[0]_i_2_n_0 ;
  wire \FSM_sequential_moore_state_curr[1]_i_2_n_0 ;
  wire [1:0]\FSM_sequential_moore_state_curr_reg[0] ;
  wire [7:0]Q;
  wire [4:0]\data_reg[0]_0 ;
  wire g0_b0_n_0;
  wire g0_b1_n_0;
  wire g0_b2_n_0;
  wire g0_b3_n_0;
  wire g0_b4_n_0;
  wire g0_b5_n_0;
  wire g0_b6_n_0;
  wire g0_b7_n_0;
  wire mclk_IBUF_BUFG;
  wire [7:0]pwm_counter_reg;

  LUT6 #(
    .INIT(64'hAAAAAAAA55555554)) 
    \FSM_sequential_moore_state_curr[0]_i_1 
       (.I0(\FSM_sequential_moore_state_curr_reg[0] [1]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[6]),
        .I4(\FSM_sequential_moore_state_curr[0]_i_2_n_0 ),
        .I5(Q[7]),
        .O(D[0]));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_moore_state_curr[0]_i_2 
       (.I0(Q[4]),
        .I1(Q[5]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(\FSM_sequential_moore_state_curr[0]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFC05)) 
    \FSM_sequential_moore_state_curr[1]_i_1 
       (.I0(\FSM_sequential_moore_state_curr[1]_i_2_n_0 ),
        .I1(Q[7]),
        .I2(\FSM_sequential_moore_state_curr_reg[0] [0]),
        .I3(\FSM_sequential_moore_state_curr_reg[0] [1]),
        .O(D[1]));
  LUT5 #(
    .INIT(32'h0000FFFE)) 
    \FSM_sequential_moore_state_curr[1]_i_2 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[6]),
        .I3(\FSM_sequential_moore_state_curr[0]_i_2_n_0 ),
        .I4(Q[7]),
        .O(\FSM_sequential_moore_state_curr[1]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[0] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .D(g0_b0_n_0),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[1] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .D(g0_b1_n_0),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[2] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .D(g0_b2_n_0),
        .Q(Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[3] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .D(g0_b3_n_0),
        .Q(Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[4] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .D(g0_b4_n_0),
        .Q(Q[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[5] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .D(g0_b5_n_0),
        .Q(Q[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[6] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .D(g0_b6_n_0),
        .Q(Q[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[7] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .D(g0_b7_n_0),
        .Q(Q[7]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h000C5C6D)) 
    g0_b0
       (.I0(\data_reg[0]_0 [0]),
        .I1(\data_reg[0]_0 [1]),
        .I2(\data_reg[0]_0 [2]),
        .I3(\data_reg[0]_0 [3]),
        .I4(\data_reg[0]_0 [4]),
        .O(g0_b0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00096A6C)) 
    g0_b1
       (.I0(\data_reg[0]_0 [0]),
        .I1(\data_reg[0]_0 [1]),
        .I2(\data_reg[0]_0 [2]),
        .I3(\data_reg[0]_0 [3]),
        .I4(\data_reg[0]_0 [4]),
        .O(g0_b1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00078561)) 
    g0_b2
       (.I0(\data_reg[0]_0 [0]),
        .I1(\data_reg[0]_0 [1]),
        .I2(\data_reg[0]_0 [2]),
        .I3(\data_reg[0]_0 [3]),
        .I4(\data_reg[0]_0 [4]),
        .O(g0_b2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h0007AE1E)) 
    g0_b3
       (.I0(\data_reg[0]_0 [0]),
        .I1(\data_reg[0]_0 [1]),
        .I2(\data_reg[0]_0 [2]),
        .I3(\data_reg[0]_0 [3]),
        .I4(\data_reg[0]_0 [4]),
        .O(g0_b3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h000C5061)) 
    g0_b4
       (.I0(\data_reg[0]_0 [0]),
        .I1(\data_reg[0]_0 [1]),
        .I2(\data_reg[0]_0 [2]),
        .I3(\data_reg[0]_0 [3]),
        .I4(\data_reg[0]_0 [4]),
        .O(g0_b4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h0003623E)) 
    g0_b5
       (.I0(\data_reg[0]_0 [0]),
        .I1(\data_reg[0]_0 [1]),
        .I2(\data_reg[0]_0 [2]),
        .I3(\data_reg[0]_0 [3]),
        .I4(\data_reg[0]_0 [4]),
        .O(g0_b5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h000A9801)) 
    g0_b6
       (.I0(\data_reg[0]_0 [0]),
        .I1(\data_reg[0]_0 [1]),
        .I2(\data_reg[0]_0 [2]),
        .I3(\data_reg[0]_0 [3]),
        .I4(\data_reg[0]_0 [4]),
        .O(g0_b6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h0007B1DA)) 
    g0_b7
       (.I0(\data_reg[0]_0 [0]),
        .I1(\data_reg[0]_0 [1]),
        .I2(\data_reg[0]_0 [2]),
        .I3(\data_reg[0]_0 [3]),
        .I4(\data_reg[0]_0 [4]),
        .O(g0_b7_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm0_carry_i_1
       (.I0(Q[6]),
        .I1(pwm_counter_reg[6]),
        .I2(pwm_counter_reg[7]),
        .I3(Q[7]),
        .O(DI[3]));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm0_carry_i_2
       (.I0(Q[4]),
        .I1(pwm_counter_reg[4]),
        .I2(pwm_counter_reg[5]),
        .I3(Q[5]),
        .O(DI[2]));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm0_carry_i_3
       (.I0(Q[2]),
        .I1(pwm_counter_reg[2]),
        .I2(pwm_counter_reg[3]),
        .I3(Q[3]),
        .O(DI[1]));
  LUT4 #(
    .INIT(16'h2F02)) 
    pwm0_carry_i_4
       (.I0(Q[0]),
        .I1(pwm_counter_reg[0]),
        .I2(pwm_counter_reg[1]),
        .I3(Q[1]),
        .O(DI[0]));
endmodule

module input_sync
   (SA_synch,
    SB_synch,
    SA_IBUF,
    mclk_IBUF_BUFG,
    SB_IBUF);
  output SA_synch;
  output SB_synch;
  input SA_IBUF;
  input mclk_IBUF_BUFG;
  input SB_IBUF;

  wire SA_IBUF;
  wire SA_synch;
  wire SB_IBUF;
  wire SB_synch;
  wire mclk_IBUF_BUFG;
  wire temp_a;
  wire temp_b;

  FDRE #(
    .INIT(1'b0)) 
    SA_synch_reg
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .D(temp_a),
        .Q(SA_synch),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    SB_synch_reg
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .D(temp_b),
        .Q(SB_synch),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    temp_a_reg
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .D(SA_IBUF),
        .Q(temp_a),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    temp_b_reg
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .D(SB_IBUF),
        .Q(temp_b),
        .R(1'b0));
endmodule

module output_sync
   (DIR_synch_OBUF,
    EN_synch_OBUF,
    dir,
    mclk_IBUF_BUFG,
    en);
  output DIR_synch_OBUF;
  output EN_synch_OBUF;
  input dir;
  input mclk_IBUF_BUFG;
  input en;

  wire DIR_synch_OBUF;
  wire EN_synch_OBUF;
  wire dir;
  wire en;
  wire mclk_IBUF_BUFG;
  wire temp_dir;
  wire temp_en;

  FDRE #(
    .INIT(1'b0)) 
    DIR_synch_reg
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .D(temp_dir),
        .Q(DIR_synch_OBUF),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    EN_synch_reg
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .D(temp_en),
        .Q(EN_synch_OBUF),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    temp_dir_reg
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .D(dir),
        .Q(temp_dir),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    temp_en_reg
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .D(en),
        .Q(temp_en),
        .R(1'b0));
endmodule

module pulse_width_modulator
   (pwm_counter_reg,
    en,
    Q,
    dir,
    mclk_IBUF_BUFG,
    reset_IBUF,
    DI,
    pwm0_carry_0,
    D);
  output [7:0]pwm_counter_reg;
  output en;
  output [1:0]Q;
  output dir;
  input mclk_IBUF_BUFG;
  input reset_IBUF;
  input [3:0]DI;
  input [7:0]pwm0_carry_0;
  input [1:0]D;

  wire [1:0]D;
  wire [3:0]DI;
  wire [1:0]Q;
  wire dir;
  wire en;
  wire mclk_IBUF_BUFG;
  wire pwm;
  wire [7:0]pwm0_carry_0;
  wire pwm0_carry_i_5_n_0;
  wire pwm0_carry_i_6_n_0;
  wire pwm0_carry_i_7_n_0;
  wire pwm0_carry_i_8_n_0;
  wire pwm0_carry_n_1;
  wire pwm0_carry_n_2;
  wire pwm0_carry_n_3;
  wire \pwm_counter[0]_i_2_n_0 ;
  wire [7:0]pwm_counter_reg;
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
  wire reset_IBUF;
  wire [3:0]NLW_pwm0_carry_O_UNCONNECTED;
  wire [3:3]\NLW_pwm_counter_reg[16]_i_1_CO_UNCONNECTED ;

  (* FSM_ENCODED_STATES = "forward:01,forward_idle:00,reverse_idle:10,reverse:11" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_moore_state_curr_reg[0] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(D[0]),
        .Q(Q[0]));
  (* FSM_ENCODED_STATES = "forward:01,forward_idle:00,reverse_idle:10,reverse:11" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_moore_state_curr_reg[1] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(D[1]),
        .Q(Q[1]));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 pwm0_carry
       (.CI(1'b0),
        .CO({pwm,pwm0_carry_n_1,pwm0_carry_n_2,pwm0_carry_n_3}),
        .CYINIT(1'b0),
        .DI(DI),
        .O(NLW_pwm0_carry_O_UNCONNECTED[3:0]),
        .S({pwm0_carry_i_5_n_0,pwm0_carry_i_6_n_0,pwm0_carry_i_7_n_0,pwm0_carry_i_8_n_0}));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm0_carry_i_5
       (.I0(pwm_counter_reg[7]),
        .I1(pwm0_carry_0[7]),
        .I2(pwm_counter_reg[6]),
        .I3(pwm0_carry_0[6]),
        .O(pwm0_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm0_carry_i_6
       (.I0(pwm_counter_reg[5]),
        .I1(pwm0_carry_0[5]),
        .I2(pwm_counter_reg[4]),
        .I3(pwm0_carry_0[4]),
        .O(pwm0_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm0_carry_i_7
       (.I0(pwm_counter_reg[3]),
        .I1(pwm0_carry_0[3]),
        .I2(pwm_counter_reg[2]),
        .I3(pwm0_carry_0[2]),
        .O(pwm0_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    pwm0_carry_i_8
       (.I0(pwm_counter_reg[1]),
        .I1(pwm0_carry_0[1]),
        .I2(pwm_counter_reg[0]),
        .I3(pwm0_carry_0[0]),
        .O(pwm0_carry_i_8_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \pwm_counter[0]_i_2 
       (.I0(\pwm_counter_reg_n_0_[0] ),
        .O(\pwm_counter[0]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[0] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
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
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\pwm_counter_reg[8]_i_1_n_5 ),
        .Q(\pwm_counter_reg_n_0_[10] ));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[11] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\pwm_counter_reg[8]_i_1_n_4 ),
        .Q(\pwm_counter_reg_n_0_[11] ));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[12] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\pwm_counter_reg[12]_i_1_n_7 ),
        .Q(pwm_counter_reg[0]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \pwm_counter_reg[12]_i_1 
       (.CI(\pwm_counter_reg[8]_i_1_n_0 ),
        .CO({\pwm_counter_reg[12]_i_1_n_0 ,\pwm_counter_reg[12]_i_1_n_1 ,\pwm_counter_reg[12]_i_1_n_2 ,\pwm_counter_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pwm_counter_reg[12]_i_1_n_4 ,\pwm_counter_reg[12]_i_1_n_5 ,\pwm_counter_reg[12]_i_1_n_6 ,\pwm_counter_reg[12]_i_1_n_7 }),
        .S(pwm_counter_reg[3:0]));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[13] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\pwm_counter_reg[12]_i_1_n_6 ),
        .Q(pwm_counter_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[14] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\pwm_counter_reg[12]_i_1_n_5 ),
        .Q(pwm_counter_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[15] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\pwm_counter_reg[12]_i_1_n_4 ),
        .Q(pwm_counter_reg[3]));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[16] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\pwm_counter_reg[16]_i_1_n_7 ),
        .Q(pwm_counter_reg[4]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \pwm_counter_reg[16]_i_1 
       (.CI(\pwm_counter_reg[12]_i_1_n_0 ),
        .CO({\NLW_pwm_counter_reg[16]_i_1_CO_UNCONNECTED [3],\pwm_counter_reg[16]_i_1_n_1 ,\pwm_counter_reg[16]_i_1_n_2 ,\pwm_counter_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\pwm_counter_reg[16]_i_1_n_4 ,\pwm_counter_reg[16]_i_1_n_5 ,\pwm_counter_reg[16]_i_1_n_6 ,\pwm_counter_reg[16]_i_1_n_7 }),
        .S(pwm_counter_reg[7:4]));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[17] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\pwm_counter_reg[16]_i_1_n_6 ),
        .Q(pwm_counter_reg[5]));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[18] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\pwm_counter_reg[16]_i_1_n_5 ),
        .Q(pwm_counter_reg[6]));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[19] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\pwm_counter_reg[16]_i_1_n_4 ),
        .Q(pwm_counter_reg[7]));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[1] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\pwm_counter_reg[0]_i_1_n_6 ),
        .Q(\pwm_counter_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[2] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\pwm_counter_reg[0]_i_1_n_5 ),
        .Q(\pwm_counter_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[3] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\pwm_counter_reg[0]_i_1_n_4 ),
        .Q(\pwm_counter_reg_n_0_[3] ));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[4] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
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
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\pwm_counter_reg[4]_i_1_n_6 ),
        .Q(\pwm_counter_reg_n_0_[5] ));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[6] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\pwm_counter_reg[4]_i_1_n_5 ),
        .Q(\pwm_counter_reg_n_0_[6] ));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[7] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\pwm_counter_reg[4]_i_1_n_4 ),
        .Q(\pwm_counter_reg_n_0_[7] ));
  FDCE #(
    .INIT(1'b0)) 
    \pwm_counter_reg[8] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
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
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\pwm_counter_reg[8]_i_1_n_6 ),
        .Q(\pwm_counter_reg_n_0_[9] ));
  LUT1 #(
    .INIT(2'h1)) 
    temp_dir_i_1
       (.I0(Q[1]),
        .O(dir));
  LUT2 #(
    .INIT(4'h8)) 
    temp_en_i_1
       (.I0(Q[0]),
        .I1(pwm),
        .O(en));
endmodule

module quadrature_decoder
   (__11,
    p_1_in,
    SA_synch,
    SB_synch,
    mclk_IBUF_BUFG,
    reset_IBUF);
  output __11;
  output [0:0]p_1_in;
  input SA_synch;
  input SB_synch;
  input mclk_IBUF_BUFG;
  input reset_IBUF;

  wire \FSM_sequential_mealy_state_curr[0]_i_1_n_0 ;
  wire \FSM_sequential_mealy_state_curr[1]_i_1_n_0 ;
  wire \FSM_sequential_mealy_state_curr[2]_i_1_n_0 ;
  wire SA_synch;
  wire SB_synch;
  wire __11;
  wire mclk_IBUF_BUFG;
  wire [2:0]mealy_state_curr;
  wire [0:0]p_1_in;
  wire reset_IBUF;

  LUT5 #(
    .INIT(32'h7701013F)) 
    \FSM_sequential_mealy_state_curr[0]_i_1 
       (.I0(mealy_state_curr[2]),
        .I1(mealy_state_curr[0]),
        .I2(mealy_state_curr[1]),
        .I3(SB_synch),
        .I4(SA_synch),
        .O(\FSM_sequential_mealy_state_curr[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h7F006C00)) 
    \FSM_sequential_mealy_state_curr[1]_i_1 
       (.I0(mealy_state_curr[2]),
        .I1(mealy_state_curr[0]),
        .I2(SB_synch),
        .I3(SA_synch),
        .I4(mealy_state_curr[1]),
        .O(\FSM_sequential_mealy_state_curr[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h54555150)) 
    \FSM_sequential_mealy_state_curr[2]_i_1 
       (.I0(SA_synch),
        .I1(SB_synch),
        .I2(mealy_state_curr[2]),
        .I3(mealy_state_curr[1]),
        .I4(mealy_state_curr[0]),
        .O(\FSM_sequential_mealy_state_curr[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "s_1:100,s_0:101,s_reset:000,s_2:011,s_init:001,s_3:010" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_mealy_state_curr_reg[0] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\FSM_sequential_mealy_state_curr[0]_i_1_n_0 ),
        .Q(mealy_state_curr[0]));
  (* FSM_ENCODED_STATES = "s_1:100,s_0:101,s_reset:000,s_2:011,s_init:001,s_3:010" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_mealy_state_curr_reg[1] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\FSM_sequential_mealy_state_curr[1]_i_1_n_0 ),
        .Q(mealy_state_curr[1]));
  (* FSM_ENCODED_STATES = "s_1:100,s_0:101,s_reset:000,s_2:011,s_init:001,s_3:010" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_mealy_state_curr_reg[2] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\FSM_sequential_mealy_state_curr[2]_i_1_n_0 ),
        .Q(mealy_state_curr[2]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h24812080)) 
    i__carry_i_10
       (.I0(mealy_state_curr[2]),
        .I1(mealy_state_curr[0]),
        .I2(SB_synch),
        .I3(SA_synch),
        .I4(mealy_state_curr[1]),
        .O(__11));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'hF3FCDF7F)) 
    i__carry_i_11
       (.I0(mealy_state_curr[1]),
        .I1(SA_synch),
        .I2(SB_synch),
        .I3(mealy_state_curr[0]),
        .I4(mealy_state_curr[2]),
        .O(p_1_in));
endmodule

module seg7ctrl
   (c_OBUF,
    Q,
    mclk_IBUF_BUFG,
    reset_IBUF,
    D);
  output c_OBUF;
  output [6:0]Q;
  input mclk_IBUF_BUFG;
  input reset_IBUF;
  input [6:0]D;

  wire [6:0]D;
  wire [6:0]Q;
  wire \abcdefg[6]_i_1_n_0 ;
  wire c_OBUF;
  wire c_i_1_n_0;
  wire \clock_timer[0]_i_1_n_0 ;
  wire \clock_timer[1]_i_1_n_0 ;
  wire \clock_timer[2]_i_1_n_0 ;
  wire \clock_timer[3]_i_1_n_0 ;
  wire [3:0]clock_timer_reg;
  wire mclk_IBUF_BUFG;
  wire reset_IBUF;

  LUT4 #(
    .INIT(16'h0001)) 
    \abcdefg[6]_i_1 
       (.I0(clock_timer_reg[1]),
        .I1(clock_timer_reg[0]),
        .I2(clock_timer_reg[3]),
        .I3(clock_timer_reg[2]),
        .O(\abcdefg[6]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \abcdefg_reg[0] 
       (.C(mclk_IBUF_BUFG),
        .CE(\abcdefg[6]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(D[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \abcdefg_reg[1] 
       (.C(mclk_IBUF_BUFG),
        .CE(\abcdefg[6]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(D[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \abcdefg_reg[2] 
       (.C(mclk_IBUF_BUFG),
        .CE(\abcdefg[6]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(D[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \abcdefg_reg[3] 
       (.C(mclk_IBUF_BUFG),
        .CE(\abcdefg[6]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(D[3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \abcdefg_reg[4] 
       (.C(mclk_IBUF_BUFG),
        .CE(\abcdefg[6]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(D[4]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \abcdefg_reg[5] 
       (.C(mclk_IBUF_BUFG),
        .CE(\abcdefg[6]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(D[5]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \abcdefg_reg[6] 
       (.C(mclk_IBUF_BUFG),
        .CE(\abcdefg[6]_i_1_n_0 ),
        .CLR(reset_IBUF),
        .D(D[6]),
        .Q(Q[6]));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000001)) 
    c_i_1
       (.I0(reset_IBUF),
        .I1(clock_timer_reg[1]),
        .I2(clock_timer_reg[0]),
        .I3(clock_timer_reg[3]),
        .I4(clock_timer_reg[2]),
        .I5(c_OBUF),
        .O(c_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    c_reg
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .D(c_i_1_n_0),
        .Q(c_OBUF),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \clock_timer[0]_i_1 
       (.I0(clock_timer_reg[0]),
        .I1(reset_IBUF),
        .O(\clock_timer[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hD2)) 
    \clock_timer[1]_i_1 
       (.I0(clock_timer_reg[0]),
        .I1(reset_IBUF),
        .I2(clock_timer_reg[1]),
        .O(\clock_timer[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hF708)) 
    \clock_timer[2]_i_1 
       (.I0(clock_timer_reg[1]),
        .I1(clock_timer_reg[0]),
        .I2(reset_IBUF),
        .I3(clock_timer_reg[2]),
        .O(\clock_timer[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'hFF7F0080)) 
    \clock_timer[3]_i_1 
       (.I0(clock_timer_reg[2]),
        .I1(clock_timer_reg[0]),
        .I2(clock_timer_reg[1]),
        .I3(reset_IBUF),
        .I4(clock_timer_reg[3]),
        .O(\clock_timer[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clock_timer_reg[0] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .D(\clock_timer[0]_i_1_n_0 ),
        .Q(clock_timer_reg[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clock_timer_reg[1] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .D(\clock_timer[1]_i_1_n_0 ),
        .Q(clock_timer_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clock_timer_reg[2] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .D(\clock_timer[2]_i_1_n_0 ),
        .Q(clock_timer_reg[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clock_timer_reg[3] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .D(\clock_timer[3]_i_1_n_0 ),
        .Q(clock_timer_reg[3]),
        .R(1'b0));
endmodule

(* NotValidForBitStream *)
module self_test_system
   (SA,
    SB,
    c,
    abcdefg,
    DIR_synch,
    EN_synch,
    mclk,
    reset);
  input SA;
  input SB;
  output c;
  output [6:0]abcdefg;
  output DIR_synch;
  output EN_synch;
  input mclk;
  input reset;

  wire DIR_synch;
  wire DIR_synch_OBUF;
  wire EN_synch;
  wire EN_synch_OBUF;
  wire SA;
  wire SA_IBUF;
  wire SA_synch;
  wire SB;
  wire SB_IBUF;
  wire SB_synch;
  wire STU_n_0;
  wire STU_n_1;
  wire STU_n_2;
  wire STU_n_3;
  wire __11;
  wire [6:0]abcdefg;
  wire [6:0]abcdefg_OBUF;
  wire c;
  wire c_OBUF;
  wire [7:0]data;
  wire dir;
  wire en;
  wire mclk;
  wire mclk_IBUF;
  wire mclk_IBUF_BUFG;
  wire [1:0]moore_state_curr;
  wire [1:0]moore_state_next;
  wire [6:0]p_0_out;
  wire [0:0]p_1_in;
  wire [19:12]pwm_counter_reg;
  wire reset;
  wire reset_IBUF;

initial begin
 $sdf_annotate("self_test_system_time_synth.sdf",,,,"tool_control");
end
  OBUF DIR_synch_OBUF_inst
       (.I(DIR_synch_OBUF),
        .O(DIR_synch));
  OBUF EN_synch_OBUF_inst
       (.I(EN_synch_OBUF),
        .O(EN_synch));
  IBUF SA_IBUF_inst
       (.I(SA),
        .O(SA_IBUF));
  IBUF SB_IBUF_inst
       (.I(SB),
        .O(SB_IBUF));
  self_test_unit STU
       (.D(moore_state_next),
        .DI({STU_n_0,STU_n_1,STU_n_2,STU_n_3}),
        .\FSM_sequential_moore_state_curr_reg[0] (moore_state_curr),
        .Q(data),
        .mclk_IBUF_BUFG(mclk_IBUF_BUFG),
        .pwm_counter_reg(pwm_counter_reg),
        .reset_IBUF(reset_IBUF));
  input_sync UUT_IN_SYNC
       (.SA_IBUF(SA_IBUF),
        .SA_synch(SA_synch),
        .SB_IBUF(SB_IBUF),
        .SB_synch(SB_synch),
        .mclk_IBUF_BUFG(mclk_IBUF_BUFG));
  output_sync UUT_OUT_SYNC
       (.DIR_synch_OBUF(DIR_synch_OBUF),
        .EN_synch_OBUF(EN_synch_OBUF),
        .dir(dir),
        .en(en),
        .mclk_IBUF_BUFG(mclk_IBUF_BUFG));
  pulse_width_modulator UUT_PWM
       (.D(moore_state_next),
        .DI({STU_n_0,STU_n_1,STU_n_2,STU_n_3}),
        .Q(moore_state_curr),
        .dir(dir),
        .en(en),
        .mclk_IBUF_BUFG(mclk_IBUF_BUFG),
        .pwm0_carry_0(data),
        .pwm_counter_reg(pwm_counter_reg),
        .reset_IBUF(reset_IBUF));
  quadrature_decoder UUT_QUAD_DEC
       (.SA_synch(SA_synch),
        .SB_synch(SB_synch),
        .__11(__11),
        .mclk_IBUF_BUFG(mclk_IBUF_BUFG),
        .p_1_in(p_1_in),
        .reset_IBUF(reset_IBUF));
  seg7ctrl UUT_S7C
       (.D(p_0_out),
        .Q(abcdefg_OBUF),
        .c_OBUF(c_OBUF),
        .mclk_IBUF_BUFG(mclk_IBUF_BUFG),
        .reset_IBUF(reset_IBUF));
  velocity_reader UUT_VEL_READ
       (.D(p_0_out),
        .__11(__11),
        .c_OBUF(c_OBUF),
        .mclk_IBUF_BUFG(mclk_IBUF_BUFG),
        .p_1_in(p_1_in),
        .reset_IBUF(reset_IBUF));
  OBUF \abcdefg_OBUF[0]_inst 
       (.I(abcdefg_OBUF[0]),
        .O(abcdefg[0]));
  OBUF \abcdefg_OBUF[1]_inst 
       (.I(abcdefg_OBUF[1]),
        .O(abcdefg[1]));
  OBUF \abcdefg_OBUF[2]_inst 
       (.I(abcdefg_OBUF[2]),
        .O(abcdefg[2]));
  OBUF \abcdefg_OBUF[3]_inst 
       (.I(abcdefg_OBUF[3]),
        .O(abcdefg[3]));
  OBUF \abcdefg_OBUF[4]_inst 
       (.I(abcdefg_OBUF[4]),
        .O(abcdefg[4]));
  OBUF \abcdefg_OBUF[5]_inst 
       (.I(abcdefg_OBUF[5]),
        .O(abcdefg[5]));
  OBUF \abcdefg_OBUF[6]_inst 
       (.I(abcdefg_OBUF[6]),
        .O(abcdefg[6]));
  OBUF c_OBUF_inst
       (.I(c_OBUF),
        .O(c));
  BUFG mclk_IBUF_BUFG_inst
       (.I(mclk_IBUF),
        .O(mclk_IBUF_BUFG));
  IBUF mclk_IBUF_inst
       (.I(mclk),
        .O(mclk_IBUF));
  IBUF reset_IBUF_inst
       (.I(reset),
        .O(reset_IBUF));
endmodule

module self_test_unit
   (DI,
    Q,
    D,
    reset_IBUF,
    pwm_counter_reg,
    \FSM_sequential_moore_state_curr_reg[0] ,
    mclk_IBUF_BUFG);
  output [3:0]DI;
  output [7:0]Q;
  output [1:0]D;
  input reset_IBUF;
  input [7:0]pwm_counter_reg;
  input [1:0]\FSM_sequential_moore_state_curr_reg[0] ;
  input mclk_IBUF_BUFG;

  wire [1:0]D;
  wire [3:0]DI;
  wire [1:0]\FSM_sequential_moore_state_curr_reg[0] ;
  wire [7:0]Q;
  wire i___115_carry__0_i_1_n_0;
  wire i___115_carry__0_i_2_n_0;
  wire i___115_carry__0_i_3_n_0;
  wire i___115_carry__0_i_4_n_0;
  wire i___115_carry__1_i_1_n_0;
  wire i___115_carry__1_i_2_n_0;
  wire i___115_carry__1_i_3_n_0;
  wire i___115_carry__1_i_4_n_0;
  wire i___115_carry__2_i_1_n_0;
  wire i___115_carry__2_i_2_n_0;
  wire i___115_carry__2_i_3_n_0;
  wire i___115_carry__2_i_4_n_0;
  wire i___115_carry__3_i_1_n_0;
  wire i___115_carry__3_i_2_n_0;
  wire i___115_carry__3_i_3_n_0;
  wire i___115_carry__3_i_4_n_0;
  wire i___115_carry__4_i_1_n_0;
  wire i___115_carry__4_i_2_n_0;
  wire i___115_carry__4_i_3_n_0;
  wire i___115_carry__4_i_4_n_0;
  wire i___115_carry__5_i_1_n_0;
  wire i___115_carry__5_i_2_n_0;
  wire i___115_carry__5_i_3_n_0;
  wire i___115_carry__5_i_4_n_0;
  wire i___115_carry__6_i_1_n_0;
  wire i___115_carry__6_i_2_n_0;
  wire i___115_carry_i_2_n_0;
  wire i___115_carry_i_3_n_0;
  wire i___115_carry_i_4_n_0;
  wire i___195_carry__0_i_1_n_0;
  wire i___195_carry__0_i_2_n_0;
  wire i___195_carry__1_i_1_n_0;
  wire i___195_carry__1_i_2_n_0;
  wire i___195_carry__1_i_3_n_0;
  wire i___195_carry__2_i_1_n_0;
  wire i___195_carry__3_i_1_n_0;
  wire i___195_carry__3_i_2_n_0;
  wire i___195_carry__3_i_3_n_0;
  wire i___195_carry__4_i_1_n_0;
  wire i___195_carry_i_1_n_0;
  wire i___195_carry_i_2_n_0;
  wire i___66_carry__0_i_1_n_0;
  wire i___66_carry__0_i_2_n_0;
  wire i___66_carry__0_i_3_n_0;
  wire i___66_carry__0_i_4_n_0;
  wire i___66_carry__0_i_5_n_0;
  wire i___66_carry__1_i_1_n_0;
  wire i___66_carry__1_i_2_n_0;
  wire i___66_carry__1_i_3_n_0;
  wire i___66_carry__1_i_4_n_0;
  wire i___66_carry__1_i_5_n_0;
  wire i___66_carry__1_i_6_n_0;
  wire i___66_carry__2_i_1_n_0;
  wire i___66_carry__2_i_2_n_0;
  wire i___66_carry__2_i_3_n_0;
  wire i___66_carry__2_i_4_n_0;
  wire i___66_carry__2_i_5_n_0;
  wire i___66_carry__2_i_6_n_0;
  wire i___66_carry__3_i_1_n_0;
  wire i___66_carry__3_i_2_n_0;
  wire i___66_carry__3_i_3_n_0;
  wire i___66_carry__3_i_4_n_0;
  wire i___66_carry__3_i_5_n_0;
  wire i___66_carry_i_1_n_0;
  wire i___66_carry_i_2_n_0;
  wire i___66_carry_i_3_n_0;
  wire i___66_carry_i_4_n_0;
  wire i___66_carry_i_5_n_0;
  wire i___66_carry_i_6_n_0;
  wire i__carry__0_i_1__0_n_0;
  wire i__carry__0_i_2__0_n_0;
  wire i__carry__0_i_3__0_n_0;
  wire i__carry__0_i_4__0_n_0;
  wire i__carry__1_i_1_n_0;
  wire i__carry__1_i_2_n_0;
  wire i__carry__1_i_3_n_0;
  wire i__carry__1_i_4_n_0;
  wire i__carry__2_i_1_n_0;
  wire i__carry__2_i_2_n_0;
  wire i__carry__2_i_3_n_0;
  wire i__carry__2_i_4_n_0;
  wire i__carry__3_i_1_n_0;
  wire i__carry__3_i_2_n_0;
  wire i__carry__3_i_3_n_0;
  wire i__carry__3_i_4_n_0;
  wire i__carry__4_i_1_n_0;
  wire i__carry__4_i_2_n_0;
  wire i__carry__4_i_3_n_0;
  wire i__carry__4_i_4_n_0;
  wire i__carry__5_i_1_n_0;
  wire i__carry__5_i_2_n_0;
  wire i__carry__5_i_3_n_0;
  wire i__carry__5_i_4_n_0;
  wire i__carry__6_i_1_n_0;
  wire i__carry__6_i_2_n_0;
  wire i__carry__6_i_3_n_0;
  wire i__carry__6_i_4_n_0;
  wire i__carry__7_i_1_n_0;
  wire i__carry__7_i_2_n_0;
  wire i__carry__7_i_3_n_0;
  wire i__carry_i_1__0_n_0;
  wire i__carry_i_2__0_n_0;
  wire i__carry_i_3__0_n_0;
  wire i__carry_i_4__0_n_0;
  wire i__carry_i_5_n_0;
  wire mclk_IBUF_BUFG;
  wire [28:0]p_2_in;
  wire [31:0]plusOp;
  wire plusOp_carry__0_n_0;
  wire plusOp_carry__0_n_1;
  wire plusOp_carry__0_n_2;
  wire plusOp_carry__0_n_3;
  wire plusOp_carry__1_n_0;
  wire plusOp_carry__1_n_1;
  wire plusOp_carry__1_n_2;
  wire plusOp_carry__1_n_3;
  wire plusOp_carry__2_n_0;
  wire plusOp_carry__2_n_1;
  wire plusOp_carry__2_n_2;
  wire plusOp_carry__2_n_3;
  wire plusOp_carry__3_n_0;
  wire plusOp_carry__3_n_1;
  wire plusOp_carry__3_n_2;
  wire plusOp_carry__3_n_3;
  wire plusOp_carry__4_n_0;
  wire plusOp_carry__4_n_1;
  wire plusOp_carry__4_n_2;
  wire plusOp_carry__4_n_3;
  wire plusOp_carry__5_n_0;
  wire plusOp_carry__5_n_1;
  wire plusOp_carry__5_n_2;
  wire plusOp_carry__5_n_3;
  wire plusOp_carry__6_n_2;
  wire plusOp_carry__6_n_3;
  wire plusOp_carry_n_0;
  wire plusOp_carry_n_1;
  wire plusOp_carry_n_2;
  wire plusOp_carry_n_3;
  wire [7:0]pwm_counter_reg;
  wire reset_IBUF;
  wire [4:0]rom_index;
  wire \rom_index[0]_i_1_n_0 ;
  wire \rom_index[1]_i_1_n_0 ;
  wire \rom_index[2]_i_1_n_0 ;
  wire \rom_index[3]_i_1_n_0 ;
  wire \rom_index[4]_i_2_n_0 ;
  wire \rom_index[4]_i_3_n_0 ;
  wire \rom_index[4]_i_4_n_0 ;
  wire \rom_index[4]_i_5_n_0 ;
  wire \rom_index[4]_i_6_n_0 ;
  wire \rom_index[4]_i_7_n_0 ;
  wire rom_index_0;
  wire [31:0]time_counter;
  wire \time_counter0_inferred__0/i___115_carry__0_n_0 ;
  wire \time_counter0_inferred__0/i___115_carry__0_n_1 ;
  wire \time_counter0_inferred__0/i___115_carry__0_n_2 ;
  wire \time_counter0_inferred__0/i___115_carry__0_n_3 ;
  wire \time_counter0_inferred__0/i___115_carry__1_n_0 ;
  wire \time_counter0_inferred__0/i___115_carry__1_n_1 ;
  wire \time_counter0_inferred__0/i___115_carry__1_n_2 ;
  wire \time_counter0_inferred__0/i___115_carry__1_n_3 ;
  wire \time_counter0_inferred__0/i___115_carry__1_n_4 ;
  wire \time_counter0_inferred__0/i___115_carry__1_n_5 ;
  wire \time_counter0_inferred__0/i___115_carry__1_n_6 ;
  wire \time_counter0_inferred__0/i___115_carry__1_n_7 ;
  wire \time_counter0_inferred__0/i___115_carry__2_n_0 ;
  wire \time_counter0_inferred__0/i___115_carry__2_n_1 ;
  wire \time_counter0_inferred__0/i___115_carry__2_n_2 ;
  wire \time_counter0_inferred__0/i___115_carry__2_n_3 ;
  wire \time_counter0_inferred__0/i___115_carry__2_n_4 ;
  wire \time_counter0_inferred__0/i___115_carry__2_n_5 ;
  wire \time_counter0_inferred__0/i___115_carry__2_n_6 ;
  wire \time_counter0_inferred__0/i___115_carry__2_n_7 ;
  wire \time_counter0_inferred__0/i___115_carry__3_n_0 ;
  wire \time_counter0_inferred__0/i___115_carry__3_n_1 ;
  wire \time_counter0_inferred__0/i___115_carry__3_n_2 ;
  wire \time_counter0_inferred__0/i___115_carry__3_n_3 ;
  wire \time_counter0_inferred__0/i___115_carry__3_n_4 ;
  wire \time_counter0_inferred__0/i___115_carry__3_n_5 ;
  wire \time_counter0_inferred__0/i___115_carry__3_n_6 ;
  wire \time_counter0_inferred__0/i___115_carry__3_n_7 ;
  wire \time_counter0_inferred__0/i___115_carry__4_n_0 ;
  wire \time_counter0_inferred__0/i___115_carry__4_n_1 ;
  wire \time_counter0_inferred__0/i___115_carry__4_n_2 ;
  wire \time_counter0_inferred__0/i___115_carry__4_n_3 ;
  wire \time_counter0_inferred__0/i___115_carry__4_n_4 ;
  wire \time_counter0_inferred__0/i___115_carry__4_n_5 ;
  wire \time_counter0_inferred__0/i___115_carry__4_n_6 ;
  wire \time_counter0_inferred__0/i___115_carry__4_n_7 ;
  wire \time_counter0_inferred__0/i___115_carry__5_n_0 ;
  wire \time_counter0_inferred__0/i___115_carry__5_n_1 ;
  wire \time_counter0_inferred__0/i___115_carry__5_n_2 ;
  wire \time_counter0_inferred__0/i___115_carry__5_n_3 ;
  wire \time_counter0_inferred__0/i___115_carry__5_n_4 ;
  wire \time_counter0_inferred__0/i___115_carry__5_n_5 ;
  wire \time_counter0_inferred__0/i___115_carry__5_n_6 ;
  wire \time_counter0_inferred__0/i___115_carry__5_n_7 ;
  wire \time_counter0_inferred__0/i___115_carry__6_n_3 ;
  wire \time_counter0_inferred__0/i___115_carry__6_n_6 ;
  wire \time_counter0_inferred__0/i___115_carry__6_n_7 ;
  wire \time_counter0_inferred__0/i___115_carry_n_0 ;
  wire \time_counter0_inferred__0/i___115_carry_n_1 ;
  wire \time_counter0_inferred__0/i___115_carry_n_2 ;
  wire \time_counter0_inferred__0/i___115_carry_n_3 ;
  wire \time_counter0_inferred__0/i___195_carry__0_n_0 ;
  wire \time_counter0_inferred__0/i___195_carry__0_n_1 ;
  wire \time_counter0_inferred__0/i___195_carry__0_n_2 ;
  wire \time_counter0_inferred__0/i___195_carry__0_n_3 ;
  wire \time_counter0_inferred__0/i___195_carry__0_n_4 ;
  wire \time_counter0_inferred__0/i___195_carry__0_n_5 ;
  wire \time_counter0_inferred__0/i___195_carry__0_n_6 ;
  wire \time_counter0_inferred__0/i___195_carry__0_n_7 ;
  wire \time_counter0_inferred__0/i___195_carry__1_n_0 ;
  wire \time_counter0_inferred__0/i___195_carry__1_n_1 ;
  wire \time_counter0_inferred__0/i___195_carry__1_n_2 ;
  wire \time_counter0_inferred__0/i___195_carry__1_n_3 ;
  wire \time_counter0_inferred__0/i___195_carry__1_n_4 ;
  wire \time_counter0_inferred__0/i___195_carry__1_n_5 ;
  wire \time_counter0_inferred__0/i___195_carry__1_n_6 ;
  wire \time_counter0_inferred__0/i___195_carry__1_n_7 ;
  wire \time_counter0_inferred__0/i___195_carry__2_n_0 ;
  wire \time_counter0_inferred__0/i___195_carry__2_n_1 ;
  wire \time_counter0_inferred__0/i___195_carry__2_n_2 ;
  wire \time_counter0_inferred__0/i___195_carry__2_n_3 ;
  wire \time_counter0_inferred__0/i___195_carry__2_n_4 ;
  wire \time_counter0_inferred__0/i___195_carry__2_n_5 ;
  wire \time_counter0_inferred__0/i___195_carry__2_n_6 ;
  wire \time_counter0_inferred__0/i___195_carry__2_n_7 ;
  wire \time_counter0_inferred__0/i___195_carry__3_n_0 ;
  wire \time_counter0_inferred__0/i___195_carry__3_n_1 ;
  wire \time_counter0_inferred__0/i___195_carry__3_n_2 ;
  wire \time_counter0_inferred__0/i___195_carry__3_n_3 ;
  wire \time_counter0_inferred__0/i___195_carry__3_n_4 ;
  wire \time_counter0_inferred__0/i___195_carry__3_n_5 ;
  wire \time_counter0_inferred__0/i___195_carry__3_n_6 ;
  wire \time_counter0_inferred__0/i___195_carry__3_n_7 ;
  wire \time_counter0_inferred__0/i___195_carry__4_n_2 ;
  wire \time_counter0_inferred__0/i___195_carry__4_n_3 ;
  wire \time_counter0_inferred__0/i___195_carry__4_n_7 ;
  wire \time_counter0_inferred__0/i___195_carry_n_0 ;
  wire \time_counter0_inferred__0/i___195_carry_n_1 ;
  wire \time_counter0_inferred__0/i___195_carry_n_2 ;
  wire \time_counter0_inferred__0/i___195_carry_n_3 ;
  wire \time_counter0_inferred__0/i___195_carry_n_4 ;
  wire \time_counter0_inferred__0/i___195_carry_n_5 ;
  wire \time_counter0_inferred__0/i___195_carry_n_6 ;
  wire \time_counter0_inferred__0/i___195_carry_n_7 ;
  wire \time_counter0_inferred__0/i___66_carry__0_n_0 ;
  wire \time_counter0_inferred__0/i___66_carry__0_n_1 ;
  wire \time_counter0_inferred__0/i___66_carry__0_n_2 ;
  wire \time_counter0_inferred__0/i___66_carry__0_n_3 ;
  wire \time_counter0_inferred__0/i___66_carry__0_n_4 ;
  wire \time_counter0_inferred__0/i___66_carry__0_n_5 ;
  wire \time_counter0_inferred__0/i___66_carry__0_n_6 ;
  wire \time_counter0_inferred__0/i___66_carry__0_n_7 ;
  wire \time_counter0_inferred__0/i___66_carry__1_n_0 ;
  wire \time_counter0_inferred__0/i___66_carry__1_n_1 ;
  wire \time_counter0_inferred__0/i___66_carry__1_n_2 ;
  wire \time_counter0_inferred__0/i___66_carry__1_n_3 ;
  wire \time_counter0_inferred__0/i___66_carry__1_n_4 ;
  wire \time_counter0_inferred__0/i___66_carry__1_n_5 ;
  wire \time_counter0_inferred__0/i___66_carry__1_n_6 ;
  wire \time_counter0_inferred__0/i___66_carry__1_n_7 ;
  wire \time_counter0_inferred__0/i___66_carry__2_n_0 ;
  wire \time_counter0_inferred__0/i___66_carry__2_n_1 ;
  wire \time_counter0_inferred__0/i___66_carry__2_n_2 ;
  wire \time_counter0_inferred__0/i___66_carry__2_n_3 ;
  wire \time_counter0_inferred__0/i___66_carry__2_n_4 ;
  wire \time_counter0_inferred__0/i___66_carry__2_n_5 ;
  wire \time_counter0_inferred__0/i___66_carry__2_n_6 ;
  wire \time_counter0_inferred__0/i___66_carry__2_n_7 ;
  wire \time_counter0_inferred__0/i___66_carry__3_n_1 ;
  wire \time_counter0_inferred__0/i___66_carry__3_n_2 ;
  wire \time_counter0_inferred__0/i___66_carry__3_n_3 ;
  wire \time_counter0_inferred__0/i___66_carry__3_n_4 ;
  wire \time_counter0_inferred__0/i___66_carry__3_n_5 ;
  wire \time_counter0_inferred__0/i___66_carry__3_n_6 ;
  wire \time_counter0_inferred__0/i___66_carry__3_n_7 ;
  wire \time_counter0_inferred__0/i___66_carry_n_0 ;
  wire \time_counter0_inferred__0/i___66_carry_n_1 ;
  wire \time_counter0_inferred__0/i___66_carry_n_2 ;
  wire \time_counter0_inferred__0/i___66_carry_n_3 ;
  wire \time_counter0_inferred__0/i___66_carry_n_4 ;
  wire \time_counter0_inferred__0/i___66_carry_n_5 ;
  wire \time_counter0_inferred__0/i___66_carry_n_6 ;
  wire \time_counter0_inferred__0/i__carry__0_n_0 ;
  wire \time_counter0_inferred__0/i__carry__0_n_1 ;
  wire \time_counter0_inferred__0/i__carry__0_n_2 ;
  wire \time_counter0_inferred__0/i__carry__0_n_3 ;
  wire \time_counter0_inferred__0/i__carry__1_n_0 ;
  wire \time_counter0_inferred__0/i__carry__1_n_1 ;
  wire \time_counter0_inferred__0/i__carry__1_n_2 ;
  wire \time_counter0_inferred__0/i__carry__1_n_3 ;
  wire \time_counter0_inferred__0/i__carry__2_n_0 ;
  wire \time_counter0_inferred__0/i__carry__2_n_1 ;
  wire \time_counter0_inferred__0/i__carry__2_n_2 ;
  wire \time_counter0_inferred__0/i__carry__2_n_3 ;
  wire \time_counter0_inferred__0/i__carry__3_n_0 ;
  wire \time_counter0_inferred__0/i__carry__3_n_1 ;
  wire \time_counter0_inferred__0/i__carry__3_n_2 ;
  wire \time_counter0_inferred__0/i__carry__3_n_3 ;
  wire \time_counter0_inferred__0/i__carry__4_n_0 ;
  wire \time_counter0_inferred__0/i__carry__4_n_1 ;
  wire \time_counter0_inferred__0/i__carry__4_n_2 ;
  wire \time_counter0_inferred__0/i__carry__4_n_3 ;
  wire \time_counter0_inferred__0/i__carry__5_n_0 ;
  wire \time_counter0_inferred__0/i__carry__5_n_1 ;
  wire \time_counter0_inferred__0/i__carry__5_n_2 ;
  wire \time_counter0_inferred__0/i__carry__5_n_3 ;
  wire \time_counter0_inferred__0/i__carry__6_n_0 ;
  wire \time_counter0_inferred__0/i__carry__6_n_1 ;
  wire \time_counter0_inferred__0/i__carry__6_n_2 ;
  wire \time_counter0_inferred__0/i__carry__6_n_3 ;
  wire \time_counter0_inferred__0/i__carry__6_n_4 ;
  wire \time_counter0_inferred__0/i__carry__7_n_2 ;
  wire \time_counter0_inferred__0/i__carry__7_n_3 ;
  wire \time_counter0_inferred__0/i__carry__7_n_5 ;
  wire \time_counter0_inferred__0/i__carry__7_n_6 ;
  wire \time_counter0_inferred__0/i__carry__7_n_7 ;
  wire \time_counter0_inferred__0/i__carry_n_0 ;
  wire \time_counter0_inferred__0/i__carry_n_1 ;
  wire \time_counter0_inferred__0/i__carry_n_2 ;
  wire \time_counter0_inferred__0/i__carry_n_3 ;
  wire \time_counter[28]_i_1_n_0 ;
  wire \time_counter[31]_i_1_n_0 ;
  wire [3:2]NLW_plusOp_carry__6_CO_UNCONNECTED;
  wire [3:3]NLW_plusOp_carry__6_O_UNCONNECTED;
  wire [3:1]\NLW_time_counter0_inferred__0/i___115_carry__6_CO_UNCONNECTED ;
  wire [3:2]\NLW_time_counter0_inferred__0/i___115_carry__6_O_UNCONNECTED ;
  wire [3:2]\NLW_time_counter0_inferred__0/i___195_carry__4_CO_UNCONNECTED ;
  wire [3:1]\NLW_time_counter0_inferred__0/i___195_carry__4_O_UNCONNECTED ;
  wire [0:0]\NLW_time_counter0_inferred__0/i___66_carry_O_UNCONNECTED ;
  wire [3:3]\NLW_time_counter0_inferred__0/i___66_carry__3_CO_UNCONNECTED ;
  wire [3:0]\NLW_time_counter0_inferred__0/i__carry_O_UNCONNECTED ;
  wire [3:0]\NLW_time_counter0_inferred__0/i__carry__0_O_UNCONNECTED ;
  wire [3:0]\NLW_time_counter0_inferred__0/i__carry__1_O_UNCONNECTED ;
  wire [3:0]\NLW_time_counter0_inferred__0/i__carry__2_O_UNCONNECTED ;
  wire [3:0]\NLW_time_counter0_inferred__0/i__carry__3_O_UNCONNECTED ;
  wire [3:0]\NLW_time_counter0_inferred__0/i__carry__4_O_UNCONNECTED ;
  wire [3:0]\NLW_time_counter0_inferred__0/i__carry__5_O_UNCONNECTED ;
  wire [2:0]\NLW_time_counter0_inferred__0/i__carry__6_O_UNCONNECTED ;
  wire [3:2]\NLW_time_counter0_inferred__0/i__carry__7_CO_UNCONNECTED ;
  wire [3:3]\NLW_time_counter0_inferred__0/i__carry__7_O_UNCONNECTED ;

  ROM ROM_0
       (.D(D),
        .DI(DI),
        .\FSM_sequential_moore_state_curr_reg[0] (\FSM_sequential_moore_state_curr_reg[0] ),
        .Q(Q),
        .\data_reg[0]_0 (rom_index),
        .mclk_IBUF_BUFG(mclk_IBUF_BUFG),
        .pwm_counter_reg(pwm_counter_reg));
  LUT1 #(
    .INIT(2'h1)) 
    i___115_carry__0_i_1
       (.I0(plusOp[7]),
        .O(i___115_carry__0_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i___115_carry__0_i_2
       (.I0(plusOp[6]),
        .O(i___115_carry__0_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i___115_carry__0_i_3
       (.I0(plusOp[5]),
        .O(i___115_carry__0_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i___115_carry__0_i_4
       (.I0(plusOp[4]),
        .O(i___115_carry__0_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i___115_carry__1_i_1
       (.I0(plusOp[11]),
        .I1(\time_counter0_inferred__0/i___66_carry_n_6 ),
        .O(i___115_carry__1_i_1_n_0));
  LUT4 #(
    .INIT(16'h9669)) 
    i___115_carry__1_i_2
       (.I0(plusOp[10]),
        .I1(\time_counter0_inferred__0/i__carry__7_n_6 ),
        .I2(\time_counter0_inferred__0/i__carry__7_n_7 ),
        .I3(i___66_carry_i_2_n_0),
        .O(i___115_carry__1_i_2_n_0));
  LUT3 #(
    .INIT(8'h69)) 
    i___115_carry__1_i_3
       (.I0(plusOp[9]),
        .I1(\time_counter0_inferred__0/i__carry__6_n_4 ),
        .I2(\time_counter0_inferred__0/i__carry__7_n_7 ),
        .O(i___115_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i___115_carry__1_i_4
       (.I0(plusOp[8]),
        .I1(\time_counter0_inferred__0/i__carry__6_n_4 ),
        .O(i___115_carry__1_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i___115_carry__2_i_1
       (.I0(plusOp[15]),
        .I1(\time_counter0_inferred__0/i___66_carry__0_n_6 ),
        .O(i___115_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i___115_carry__2_i_2
       (.I0(plusOp[14]),
        .I1(\time_counter0_inferred__0/i___66_carry__0_n_7 ),
        .O(i___115_carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i___115_carry__2_i_3
       (.I0(plusOp[13]),
        .I1(\time_counter0_inferred__0/i___66_carry_n_4 ),
        .O(i___115_carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i___115_carry__2_i_4
       (.I0(plusOp[12]),
        .I1(\time_counter0_inferred__0/i___66_carry_n_5 ),
        .O(i___115_carry__2_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i___115_carry__3_i_1
       (.I0(plusOp[19]),
        .I1(\time_counter0_inferred__0/i___66_carry__1_n_6 ),
        .O(i___115_carry__3_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i___115_carry__3_i_2
       (.I0(plusOp[18]),
        .I1(\time_counter0_inferred__0/i___66_carry__1_n_7 ),
        .O(i___115_carry__3_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i___115_carry__3_i_3
       (.I0(plusOp[17]),
        .I1(\time_counter0_inferred__0/i___66_carry__0_n_4 ),
        .O(i___115_carry__3_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i___115_carry__3_i_4
       (.I0(plusOp[16]),
        .I1(\time_counter0_inferred__0/i___66_carry__0_n_5 ),
        .O(i___115_carry__3_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i___115_carry__4_i_1
       (.I0(plusOp[23]),
        .I1(\time_counter0_inferred__0/i___66_carry__2_n_6 ),
        .O(i___115_carry__4_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i___115_carry__4_i_2
       (.I0(plusOp[22]),
        .I1(\time_counter0_inferred__0/i___66_carry__2_n_7 ),
        .O(i___115_carry__4_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i___115_carry__4_i_3
       (.I0(plusOp[21]),
        .I1(\time_counter0_inferred__0/i___66_carry__1_n_4 ),
        .O(i___115_carry__4_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i___115_carry__4_i_4
       (.I0(plusOp[20]),
        .I1(\time_counter0_inferred__0/i___66_carry__1_n_5 ),
        .O(i___115_carry__4_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i___115_carry__5_i_1
       (.I0(plusOp[27]),
        .I1(\time_counter0_inferred__0/i___66_carry__3_n_6 ),
        .O(i___115_carry__5_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i___115_carry__5_i_2
       (.I0(plusOp[26]),
        .I1(\time_counter0_inferred__0/i___66_carry__3_n_7 ),
        .O(i___115_carry__5_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i___115_carry__5_i_3
       (.I0(plusOp[25]),
        .I1(\time_counter0_inferred__0/i___66_carry__2_n_4 ),
        .O(i___115_carry__5_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i___115_carry__5_i_4
       (.I0(plusOp[24]),
        .I1(\time_counter0_inferred__0/i___66_carry__2_n_5 ),
        .O(i___115_carry__5_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i___115_carry__6_i_1
       (.I0(plusOp[29]),
        .I1(\time_counter0_inferred__0/i___66_carry__3_n_4 ),
        .O(i___115_carry__6_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i___115_carry__6_i_2
       (.I0(plusOp[28]),
        .I1(\time_counter0_inferred__0/i___66_carry__3_n_5 ),
        .O(i___115_carry__6_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i___115_carry_i_1
       (.I0(time_counter[0]),
        .O(plusOp[0]));
  LUT1 #(
    .INIT(2'h1)) 
    i___115_carry_i_2
       (.I0(plusOp[3]),
        .O(i___115_carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i___115_carry_i_3
       (.I0(plusOp[2]),
        .O(i___115_carry_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i___115_carry_i_4
       (.I0(plusOp[1]),
        .O(i___115_carry_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i___195_carry__0_i_1
       (.I0(\time_counter0_inferred__0/i___115_carry__2_n_5 ),
        .O(i___195_carry__0_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i___195_carry__0_i_2
       (.I0(\time_counter0_inferred__0/i___115_carry__2_n_7 ),
        .O(i___195_carry__0_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i___195_carry__1_i_1
       (.I0(\time_counter0_inferred__0/i___115_carry__3_n_4 ),
        .O(i___195_carry__1_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i___195_carry__1_i_2
       (.I0(\time_counter0_inferred__0/i___115_carry__3_n_5 ),
        .O(i___195_carry__1_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i___195_carry__1_i_3
       (.I0(\time_counter0_inferred__0/i___115_carry__3_n_6 ),
        .O(i___195_carry__1_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i___195_carry__2_i_1
       (.I0(\time_counter0_inferred__0/i___115_carry__4_n_7 ),
        .O(i___195_carry__2_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i___195_carry__3_i_1
       (.I0(\time_counter0_inferred__0/i___115_carry__5_n_4 ),
        .O(i___195_carry__3_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i___195_carry__3_i_2
       (.I0(\time_counter0_inferred__0/i___115_carry__5_n_5 ),
        .O(i___195_carry__3_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i___195_carry__3_i_3
       (.I0(\time_counter0_inferred__0/i___115_carry__5_n_6 ),
        .O(i___195_carry__3_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i___195_carry__4_i_1
       (.I0(\time_counter0_inferred__0/i___115_carry__6_n_6 ),
        .O(i___195_carry__4_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i___195_carry_i_1
       (.I0(\time_counter0_inferred__0/i___115_carry__1_n_4 ),
        .O(i___195_carry_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i___195_carry_i_2
       (.I0(\time_counter0_inferred__0/i___115_carry__1_n_5 ),
        .O(i___195_carry_i_2_n_0));
  LUT3 #(
    .INIT(8'h60)) 
    i___66_carry__0_i_1
       (.I0(\time_counter0_inferred__0/i__carry__7_n_5 ),
        .I1(\time_counter0_inferred__0/i__carry__7_n_7 ),
        .I2(\time_counter0_inferred__0/i__carry__6_n_4 ),
        .O(i___66_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    i___66_carry__0_i_2
       (.I0(\time_counter0_inferred__0/i__carry__6_n_4 ),
        .I1(\time_counter0_inferred__0/i__carry__7_n_6 ),
        .O(i___66_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'hC96C)) 
    i___66_carry__0_i_3
       (.I0(\time_counter0_inferred__0/i__carry__6_n_4 ),
        .I1(\time_counter0_inferred__0/i__carry__7_n_6 ),
        .I2(\time_counter0_inferred__0/i__carry__7_n_5 ),
        .I3(\time_counter0_inferred__0/i__carry__7_n_7 ),
        .O(i___66_carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'h6996)) 
    i___66_carry__0_i_4
       (.I0(i___66_carry__0_i_2_n_0),
        .I1(\time_counter0_inferred__0/i__carry__7_n_5 ),
        .I2(\time_counter0_inferred__0/i__carry__7_n_7 ),
        .I3(\time_counter0_inferred__0/i__carry__6_n_4 ),
        .O(i___66_carry__0_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i___66_carry__0_i_5
       (.I0(\time_counter0_inferred__0/i__carry__6_n_4 ),
        .I1(\time_counter0_inferred__0/i__carry__7_n_6 ),
        .O(i___66_carry__0_i_5_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    i___66_carry__1_i_1
       (.I0(\time_counter0_inferred__0/i__carry__7_n_5 ),
        .I1(\time_counter0_inferred__0/i__carry__7_n_6 ),
        .O(i___66_carry__1_i_1_n_0));
  LUT3 #(
    .INIT(8'h08)) 
    i___66_carry__1_i_2
       (.I0(\time_counter0_inferred__0/i__carry__7_n_6 ),
        .I1(\time_counter0_inferred__0/i__carry__7_n_7 ),
        .I2(\time_counter0_inferred__0/i__carry__7_n_5 ),
        .O(i___66_carry__1_i_2_n_0));
  LUT3 #(
    .INIT(8'h40)) 
    i___66_carry__1_i_3
       (.I0(\time_counter0_inferred__0/i__carry__7_n_6 ),
        .I1(\time_counter0_inferred__0/i__carry__7_n_7 ),
        .I2(\time_counter0_inferred__0/i__carry__7_n_5 ),
        .O(i___66_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    i___66_carry__1_i_4
       (.I0(\time_counter0_inferred__0/i__carry__7_n_5 ),
        .I1(\time_counter0_inferred__0/i__carry__7_n_6 ),
        .O(i___66_carry__1_i_4_n_0));
  LUT3 #(
    .INIT(8'h38)) 
    i___66_carry__1_i_5
       (.I0(\time_counter0_inferred__0/i__carry__7_n_7 ),
        .I1(\time_counter0_inferred__0/i__carry__7_n_6 ),
        .I2(\time_counter0_inferred__0/i__carry__7_n_5 ),
        .O(i___66_carry__1_i_5_n_0));
  LUT3 #(
    .INIT(8'h92)) 
    i___66_carry__1_i_6
       (.I0(\time_counter0_inferred__0/i__carry__7_n_5 ),
        .I1(\time_counter0_inferred__0/i__carry__7_n_7 ),
        .I2(\time_counter0_inferred__0/i__carry__7_n_6 ),
        .O(i___66_carry__1_i_6_n_0));
  LUT4 #(
    .INIT(16'hC2A8)) 
    i___66_carry__2_i_1
       (.I0(\time_counter0_inferred__0/i__carry__6_n_4 ),
        .I1(\time_counter0_inferred__0/i__carry__7_n_6 ),
        .I2(\time_counter0_inferred__0/i__carry__7_n_7 ),
        .I3(\time_counter0_inferred__0/i__carry__7_n_5 ),
        .O(i___66_carry__2_i_1_n_0));
  (* HLUTNM = "lutpair0" *) 
  LUT3 #(
    .INIT(8'h28)) 
    i___66_carry__2_i_2
       (.I0(\time_counter0_inferred__0/i__carry__6_n_4 ),
        .I1(\time_counter0_inferred__0/i__carry__7_n_7 ),
        .I2(\time_counter0_inferred__0/i__carry__7_n_6 ),
        .O(i___66_carry__2_i_2_n_0));
  LUT4 #(
    .INIT(16'hFD54)) 
    i___66_carry__2_i_3
       (.I0(\time_counter0_inferred__0/i__carry__6_n_4 ),
        .I1(\time_counter0_inferred__0/i__carry__7_n_6 ),
        .I2(\time_counter0_inferred__0/i__carry__7_n_7 ),
        .I3(\time_counter0_inferred__0/i__carry__7_n_5 ),
        .O(i___66_carry__2_i_3_n_0));
  LUT5 #(
    .INIT(32'h66699996)) 
    i___66_carry__2_i_4
       (.I0(i___66_carry__2_i_2_n_0),
        .I1(\time_counter0_inferred__0/i__carry__6_n_4 ),
        .I2(\time_counter0_inferred__0/i__carry__7_n_6 ),
        .I3(\time_counter0_inferred__0/i__carry__7_n_7 ),
        .I4(\time_counter0_inferred__0/i__carry__7_n_5 ),
        .O(i___66_carry__2_i_4_n_0));
  (* HLUTNM = "lutpair0" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    i___66_carry__2_i_5
       (.I0(\time_counter0_inferred__0/i__carry__6_n_4 ),
        .I1(\time_counter0_inferred__0/i__carry__7_n_7 ),
        .I2(\time_counter0_inferred__0/i__carry__7_n_6 ),
        .I3(i___66_carry_i_2_n_0),
        .O(i___66_carry__2_i_5_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i___66_carry__2_i_6
       (.I0(\time_counter0_inferred__0/i__carry__7_n_7 ),
        .I1(\time_counter0_inferred__0/i__carry__6_n_4 ),
        .O(i___66_carry__2_i_6_n_0));
  LUT3 #(
    .INIT(8'h48)) 
    i___66_carry__3_i_1
       (.I0(\time_counter0_inferred__0/i__carry__7_n_5 ),
        .I1(\time_counter0_inferred__0/i__carry__7_n_7 ),
        .I2(\time_counter0_inferred__0/i__carry__7_n_6 ),
        .O(i___66_carry__3_i_1_n_0));
  LUT3 #(
    .INIT(8'h80)) 
    i___66_carry__3_i_2
       (.I0(\time_counter0_inferred__0/i__carry__7_n_5 ),
        .I1(\time_counter0_inferred__0/i__carry__7_n_6 ),
        .I2(\time_counter0_inferred__0/i__carry__7_n_7 ),
        .O(i___66_carry__3_i_2_n_0));
  LUT3 #(
    .INIT(8'h78)) 
    i___66_carry__3_i_3
       (.I0(\time_counter0_inferred__0/i__carry__7_n_6 ),
        .I1(\time_counter0_inferred__0/i__carry__7_n_5 ),
        .I2(\time_counter0_inferred__0/i__carry__6_n_4 ),
        .O(i___66_carry__3_i_3_n_0));
  LUT3 #(
    .INIT(8'h18)) 
    i___66_carry__3_i_4
       (.I0(\time_counter0_inferred__0/i__carry__7_n_7 ),
        .I1(\time_counter0_inferred__0/i__carry__7_n_6 ),
        .I2(\time_counter0_inferred__0/i__carry__7_n_5 ),
        .O(i___66_carry__3_i_4_n_0));
  LUT3 #(
    .INIT(8'h54)) 
    i___66_carry__3_i_5
       (.I0(\time_counter0_inferred__0/i__carry__7_n_7 ),
        .I1(\time_counter0_inferred__0/i__carry__7_n_5 ),
        .I2(\time_counter0_inferred__0/i__carry__7_n_6 ),
        .O(i___66_carry__3_i_5_n_0));
  LUT3 #(
    .INIT(8'h08)) 
    i___66_carry_i_1
       (.I0(\time_counter0_inferred__0/i__carry__7_n_6 ),
        .I1(\time_counter0_inferred__0/i__carry__7_n_7 ),
        .I2(\time_counter0_inferred__0/i__carry__7_n_5 ),
        .O(i___66_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    i___66_carry_i_2
       (.I0(\time_counter0_inferred__0/i__carry__7_n_7 ),
        .I1(\time_counter0_inferred__0/i__carry__6_n_4 ),
        .O(i___66_carry_i_2_n_0));
  LUT3 #(
    .INIT(8'h78)) 
    i___66_carry_i_3
       (.I0(\time_counter0_inferred__0/i__carry__7_n_6 ),
        .I1(\time_counter0_inferred__0/i__carry__7_n_5 ),
        .I2(\time_counter0_inferred__0/i__carry__6_n_4 ),
        .O(i___66_carry_i_3_n_0));
  LUT3 #(
    .INIT(8'h38)) 
    i___66_carry_i_4
       (.I0(\time_counter0_inferred__0/i__carry__7_n_7 ),
        .I1(\time_counter0_inferred__0/i__carry__7_n_6 ),
        .I2(\time_counter0_inferred__0/i__carry__7_n_5 ),
        .O(i___66_carry_i_4_n_0));
  LUT3 #(
    .INIT(8'hD2)) 
    i___66_carry_i_5
       (.I0(\time_counter0_inferred__0/i__carry__7_n_6 ),
        .I1(\time_counter0_inferred__0/i__carry__7_n_7 ),
        .I2(\time_counter0_inferred__0/i__carry__7_n_5 ),
        .O(i___66_carry_i_5_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    i___66_carry_i_6
       (.I0(i___66_carry_i_2_n_0),
        .I1(\time_counter0_inferred__0/i__carry__7_n_7 ),
        .I2(\time_counter0_inferred__0/i__carry__7_n_6 ),
        .O(i___66_carry_i_6_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__0_i_1__0
       (.I0(plusOp[4]),
        .I1(plusOp[7]),
        .O(i__carry__0_i_1__0_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__0_i_2__0
       (.I0(plusOp[3]),
        .I1(plusOp[6]),
        .O(i__carry__0_i_2__0_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__0_i_3__0
       (.I0(plusOp[2]),
        .I1(plusOp[5]),
        .O(i__carry__0_i_3__0_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__0_i_4__0
       (.I0(plusOp[1]),
        .I1(plusOp[4]),
        .O(i__carry__0_i_4__0_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__1_i_1
       (.I0(plusOp[8]),
        .I1(plusOp[11]),
        .O(i__carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__1_i_2
       (.I0(plusOp[7]),
        .I1(plusOp[10]),
        .O(i__carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__1_i_3
       (.I0(plusOp[6]),
        .I1(plusOp[9]),
        .O(i__carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__1_i_4
       (.I0(plusOp[5]),
        .I1(plusOp[8]),
        .O(i__carry__1_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__2_i_1
       (.I0(plusOp[12]),
        .I1(plusOp[15]),
        .O(i__carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__2_i_2
       (.I0(plusOp[11]),
        .I1(plusOp[14]),
        .O(i__carry__2_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__2_i_3
       (.I0(plusOp[10]),
        .I1(plusOp[13]),
        .O(i__carry__2_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__2_i_4
       (.I0(plusOp[9]),
        .I1(plusOp[12]),
        .O(i__carry__2_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__3_i_1
       (.I0(plusOp[16]),
        .I1(plusOp[19]),
        .O(i__carry__3_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__3_i_2
       (.I0(plusOp[15]),
        .I1(plusOp[18]),
        .O(i__carry__3_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__3_i_3
       (.I0(plusOp[14]),
        .I1(plusOp[17]),
        .O(i__carry__3_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__3_i_4
       (.I0(plusOp[13]),
        .I1(plusOp[16]),
        .O(i__carry__3_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__4_i_1
       (.I0(plusOp[20]),
        .I1(plusOp[23]),
        .O(i__carry__4_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__4_i_2
       (.I0(plusOp[19]),
        .I1(plusOp[22]),
        .O(i__carry__4_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__4_i_3
       (.I0(plusOp[18]),
        .I1(plusOp[21]),
        .O(i__carry__4_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__4_i_4
       (.I0(plusOp[17]),
        .I1(plusOp[20]),
        .O(i__carry__4_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__5_i_1
       (.I0(plusOp[24]),
        .I1(plusOp[27]),
        .O(i__carry__5_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__5_i_2
       (.I0(plusOp[23]),
        .I1(plusOp[26]),
        .O(i__carry__5_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__5_i_3
       (.I0(plusOp[22]),
        .I1(plusOp[25]),
        .O(i__carry__5_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__5_i_4
       (.I0(plusOp[21]),
        .I1(plusOp[24]),
        .O(i__carry__5_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__6_i_1
       (.I0(plusOp[28]),
        .I1(plusOp[31]),
        .O(i__carry__6_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__6_i_2
       (.I0(plusOp[27]),
        .I1(plusOp[30]),
        .O(i__carry__6_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__6_i_3
       (.I0(plusOp[26]),
        .I1(plusOp[29]),
        .O(i__carry__6_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__6_i_4
       (.I0(plusOp[25]),
        .I1(plusOp[28]),
        .O(i__carry__6_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__7_i_1
       (.I0(plusOp[31]),
        .O(i__carry__7_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__7_i_2
       (.I0(plusOp[30]),
        .O(i__carry__7_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__7_i_3
       (.I0(plusOp[29]),
        .O(i__carry__7_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_1__0
       (.I0(time_counter[0]),
        .O(i__carry_i_1__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    i__carry_i_2__0
       (.I0(time_counter[0]),
        .I1(plusOp[3]),
        .O(i__carry_i_2__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_3__0
       (.I0(plusOp[2]),
        .O(i__carry_i_3__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_4__0
       (.I0(plusOp[1]),
        .O(i__carry_i_4__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry_i_5
       (.I0(time_counter[0]),
        .O(i__carry_i_5_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 plusOp_carry
       (.CI(1'b0),
        .CO({plusOp_carry_n_0,plusOp_carry_n_1,plusOp_carry_n_2,plusOp_carry_n_3}),
        .CYINIT(time_counter[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp[4:1]),
        .S(time_counter[4:1]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 plusOp_carry__0
       (.CI(plusOp_carry_n_0),
        .CO({plusOp_carry__0_n_0,plusOp_carry__0_n_1,plusOp_carry__0_n_2,plusOp_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp[8:5]),
        .S(time_counter[8:5]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 plusOp_carry__1
       (.CI(plusOp_carry__0_n_0),
        .CO({plusOp_carry__1_n_0,plusOp_carry__1_n_1,plusOp_carry__1_n_2,plusOp_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp[12:9]),
        .S(time_counter[12:9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 plusOp_carry__2
       (.CI(plusOp_carry__1_n_0),
        .CO({plusOp_carry__2_n_0,plusOp_carry__2_n_1,plusOp_carry__2_n_2,plusOp_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp[16:13]),
        .S(time_counter[16:13]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 plusOp_carry__3
       (.CI(plusOp_carry__2_n_0),
        .CO({plusOp_carry__3_n_0,plusOp_carry__3_n_1,plusOp_carry__3_n_2,plusOp_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp[20:17]),
        .S(time_counter[20:17]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 plusOp_carry__4
       (.CI(plusOp_carry__3_n_0),
        .CO({plusOp_carry__4_n_0,plusOp_carry__4_n_1,plusOp_carry__4_n_2,plusOp_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp[24:21]),
        .S(time_counter[24:21]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 plusOp_carry__5
       (.CI(plusOp_carry__4_n_0),
        .CO({plusOp_carry__5_n_0,plusOp_carry__5_n_1,plusOp_carry__5_n_2,plusOp_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp[28:25]),
        .S(time_counter[28:25]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 plusOp_carry__6
       (.CI(plusOp_carry__5_n_0),
        .CO({NLW_plusOp_carry__6_CO_UNCONNECTED[3:2],plusOp_carry__6_n_2,plusOp_carry__6_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_plusOp_carry__6_O_UNCONNECTED[3],plusOp[31:29]}),
        .S({1'b0,time_counter[31],time_counter[31],time_counter[31]}));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h1000FFFF)) 
    \rom_index[0]_i_1 
       (.I0(rom_index[2]),
        .I1(rom_index[3]),
        .I2(rom_index[4]),
        .I3(rom_index[1]),
        .I4(rom_index[0]),
        .O(\rom_index[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h10FFFF00)) 
    \rom_index[1]_i_1 
       (.I0(rom_index[2]),
        .I1(rom_index[3]),
        .I2(rom_index[4]),
        .I3(rom_index[1]),
        .I4(rom_index[0]),
        .O(\rom_index[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h77778808)) 
    \rom_index[2]_i_1 
       (.I0(rom_index[0]),
        .I1(rom_index[1]),
        .I2(rom_index[4]),
        .I3(rom_index[3]),
        .I4(rom_index[2]),
        .O(\rom_index[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h78F0)) 
    \rom_index[3]_i_1 
       (.I0(rom_index[0]),
        .I1(rom_index[1]),
        .I2(rom_index[3]),
        .I3(rom_index[2]),
        .O(\rom_index[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \rom_index[4]_i_1 
       (.I0(\rom_index[4]_i_3_n_0 ),
        .I1(\rom_index[4]_i_4_n_0 ),
        .I2(\rom_index[4]_i_5_n_0 ),
        .I3(\rom_index[4]_i_6_n_0 ),
        .I4(\rom_index[4]_i_7_n_0 ),
        .O(rom_index_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h78F0F0F0)) 
    \rom_index[4]_i_2 
       (.I0(rom_index[2]),
        .I1(rom_index[3]),
        .I2(rom_index[4]),
        .I3(rom_index[1]),
        .I4(rom_index[0]),
        .O(\rom_index[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \rom_index[4]_i_3 
       (.I0(time_counter[2]),
        .I1(time_counter[3]),
        .I2(time_counter[0]),
        .I3(time_counter[1]),
        .I4(time_counter[5]),
        .I5(time_counter[4]),
        .O(\rom_index[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \rom_index[4]_i_4 
       (.I0(time_counter[20]),
        .I1(time_counter[21]),
        .I2(time_counter[18]),
        .I3(time_counter[19]),
        .I4(time_counter[23]),
        .I5(time_counter[22]),
        .O(\rom_index[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \rom_index[4]_i_5 
       (.I0(time_counter[26]),
        .I1(time_counter[27]),
        .I2(time_counter[24]),
        .I3(time_counter[25]),
        .I4(time_counter[31]),
        .I5(time_counter[28]),
        .O(\rom_index[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \rom_index[4]_i_6 
       (.I0(time_counter[8]),
        .I1(time_counter[9]),
        .I2(time_counter[6]),
        .I3(time_counter[7]),
        .I4(time_counter[11]),
        .I5(time_counter[10]),
        .O(\rom_index[4]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \rom_index[4]_i_7 
       (.I0(time_counter[14]),
        .I1(time_counter[15]),
        .I2(time_counter[12]),
        .I3(time_counter[13]),
        .I4(time_counter[17]),
        .I5(time_counter[16]),
        .O(\rom_index[4]_i_7_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \rom_index_reg[0] 
       (.C(mclk_IBUF_BUFG),
        .CE(rom_index_0),
        .CLR(reset_IBUF),
        .D(\rom_index[0]_i_1_n_0 ),
        .Q(rom_index[0]));
  FDCE #(
    .INIT(1'b0)) 
    \rom_index_reg[1] 
       (.C(mclk_IBUF_BUFG),
        .CE(rom_index_0),
        .CLR(reset_IBUF),
        .D(\rom_index[1]_i_1_n_0 ),
        .Q(rom_index[1]));
  FDCE #(
    .INIT(1'b0)) 
    \rom_index_reg[2] 
       (.C(mclk_IBUF_BUFG),
        .CE(rom_index_0),
        .CLR(reset_IBUF),
        .D(\rom_index[2]_i_1_n_0 ),
        .Q(rom_index[2]));
  FDCE #(
    .INIT(1'b0)) 
    \rom_index_reg[3] 
       (.C(mclk_IBUF_BUFG),
        .CE(rom_index_0),
        .CLR(reset_IBUF),
        .D(\rom_index[3]_i_1_n_0 ),
        .Q(rom_index[3]));
  FDCE #(
    .INIT(1'b0)) 
    \rom_index_reg[4] 
       (.C(mclk_IBUF_BUFG),
        .CE(rom_index_0),
        .CLR(reset_IBUF),
        .D(\rom_index[4]_i_2_n_0 ),
        .Q(rom_index[4]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \time_counter0_inferred__0/i___115_carry 
       (.CI(1'b0),
        .CO({\time_counter0_inferred__0/i___115_carry_n_0 ,\time_counter0_inferred__0/i___115_carry_n_1 ,\time_counter0_inferred__0/i___115_carry_n_2 ,\time_counter0_inferred__0/i___115_carry_n_3 }),
        .CYINIT(1'b1),
        .DI(plusOp[3:0]),
        .O(p_2_in[3:0]),
        .S({i___115_carry_i_2_n_0,i___115_carry_i_3_n_0,i___115_carry_i_4_n_0,time_counter[0]}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \time_counter0_inferred__0/i___115_carry__0 
       (.CI(\time_counter0_inferred__0/i___115_carry_n_0 ),
        .CO({\time_counter0_inferred__0/i___115_carry__0_n_0 ,\time_counter0_inferred__0/i___115_carry__0_n_1 ,\time_counter0_inferred__0/i___115_carry__0_n_2 ,\time_counter0_inferred__0/i___115_carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI(plusOp[7:4]),
        .O(p_2_in[7:4]),
        .S({i___115_carry__0_i_1_n_0,i___115_carry__0_i_2_n_0,i___115_carry__0_i_3_n_0,i___115_carry__0_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \time_counter0_inferred__0/i___115_carry__1 
       (.CI(\time_counter0_inferred__0/i___115_carry__0_n_0 ),
        .CO({\time_counter0_inferred__0/i___115_carry__1_n_0 ,\time_counter0_inferred__0/i___115_carry__1_n_1 ,\time_counter0_inferred__0/i___115_carry__1_n_2 ,\time_counter0_inferred__0/i___115_carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI(plusOp[11:8]),
        .O({\time_counter0_inferred__0/i___115_carry__1_n_4 ,\time_counter0_inferred__0/i___115_carry__1_n_5 ,\time_counter0_inferred__0/i___115_carry__1_n_6 ,\time_counter0_inferred__0/i___115_carry__1_n_7 }),
        .S({i___115_carry__1_i_1_n_0,i___115_carry__1_i_2_n_0,i___115_carry__1_i_3_n_0,i___115_carry__1_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \time_counter0_inferred__0/i___115_carry__2 
       (.CI(\time_counter0_inferred__0/i___115_carry__1_n_0 ),
        .CO({\time_counter0_inferred__0/i___115_carry__2_n_0 ,\time_counter0_inferred__0/i___115_carry__2_n_1 ,\time_counter0_inferred__0/i___115_carry__2_n_2 ,\time_counter0_inferred__0/i___115_carry__2_n_3 }),
        .CYINIT(1'b0),
        .DI(plusOp[15:12]),
        .O({\time_counter0_inferred__0/i___115_carry__2_n_4 ,\time_counter0_inferred__0/i___115_carry__2_n_5 ,\time_counter0_inferred__0/i___115_carry__2_n_6 ,\time_counter0_inferred__0/i___115_carry__2_n_7 }),
        .S({i___115_carry__2_i_1_n_0,i___115_carry__2_i_2_n_0,i___115_carry__2_i_3_n_0,i___115_carry__2_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \time_counter0_inferred__0/i___115_carry__3 
       (.CI(\time_counter0_inferred__0/i___115_carry__2_n_0 ),
        .CO({\time_counter0_inferred__0/i___115_carry__3_n_0 ,\time_counter0_inferred__0/i___115_carry__3_n_1 ,\time_counter0_inferred__0/i___115_carry__3_n_2 ,\time_counter0_inferred__0/i___115_carry__3_n_3 }),
        .CYINIT(1'b0),
        .DI(plusOp[19:16]),
        .O({\time_counter0_inferred__0/i___115_carry__3_n_4 ,\time_counter0_inferred__0/i___115_carry__3_n_5 ,\time_counter0_inferred__0/i___115_carry__3_n_6 ,\time_counter0_inferred__0/i___115_carry__3_n_7 }),
        .S({i___115_carry__3_i_1_n_0,i___115_carry__3_i_2_n_0,i___115_carry__3_i_3_n_0,i___115_carry__3_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \time_counter0_inferred__0/i___115_carry__4 
       (.CI(\time_counter0_inferred__0/i___115_carry__3_n_0 ),
        .CO({\time_counter0_inferred__0/i___115_carry__4_n_0 ,\time_counter0_inferred__0/i___115_carry__4_n_1 ,\time_counter0_inferred__0/i___115_carry__4_n_2 ,\time_counter0_inferred__0/i___115_carry__4_n_3 }),
        .CYINIT(1'b0),
        .DI(plusOp[23:20]),
        .O({\time_counter0_inferred__0/i___115_carry__4_n_4 ,\time_counter0_inferred__0/i___115_carry__4_n_5 ,\time_counter0_inferred__0/i___115_carry__4_n_6 ,\time_counter0_inferred__0/i___115_carry__4_n_7 }),
        .S({i___115_carry__4_i_1_n_0,i___115_carry__4_i_2_n_0,i___115_carry__4_i_3_n_0,i___115_carry__4_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \time_counter0_inferred__0/i___115_carry__5 
       (.CI(\time_counter0_inferred__0/i___115_carry__4_n_0 ),
        .CO({\time_counter0_inferred__0/i___115_carry__5_n_0 ,\time_counter0_inferred__0/i___115_carry__5_n_1 ,\time_counter0_inferred__0/i___115_carry__5_n_2 ,\time_counter0_inferred__0/i___115_carry__5_n_3 }),
        .CYINIT(1'b0),
        .DI(plusOp[27:24]),
        .O({\time_counter0_inferred__0/i___115_carry__5_n_4 ,\time_counter0_inferred__0/i___115_carry__5_n_5 ,\time_counter0_inferred__0/i___115_carry__5_n_6 ,\time_counter0_inferred__0/i___115_carry__5_n_7 }),
        .S({i___115_carry__5_i_1_n_0,i___115_carry__5_i_2_n_0,i___115_carry__5_i_3_n_0,i___115_carry__5_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \time_counter0_inferred__0/i___115_carry__6 
       (.CI(\time_counter0_inferred__0/i___115_carry__5_n_0 ),
        .CO({\NLW_time_counter0_inferred__0/i___115_carry__6_CO_UNCONNECTED [3:1],\time_counter0_inferred__0/i___115_carry__6_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,plusOp[28]}),
        .O({\NLW_time_counter0_inferred__0/i___115_carry__6_O_UNCONNECTED [3:2],\time_counter0_inferred__0/i___115_carry__6_n_6 ,\time_counter0_inferred__0/i___115_carry__6_n_7 }),
        .S({1'b0,1'b0,i___115_carry__6_i_1_n_0,i___115_carry__6_i_2_n_0}));
  CARRY4 \time_counter0_inferred__0/i___195_carry 
       (.CI(1'b0),
        .CO({\time_counter0_inferred__0/i___195_carry_n_0 ,\time_counter0_inferred__0/i___195_carry_n_1 ,\time_counter0_inferred__0/i___195_carry_n_2 ,\time_counter0_inferred__0/i___195_carry_n_3 }),
        .CYINIT(1'b1),
        .DI({1'b1,1'b1,1'b0,1'b0}),
        .O({\time_counter0_inferred__0/i___195_carry_n_4 ,\time_counter0_inferred__0/i___195_carry_n_5 ,\time_counter0_inferred__0/i___195_carry_n_6 ,\time_counter0_inferred__0/i___195_carry_n_7 }),
        .S({i___195_carry_i_1_n_0,i___195_carry_i_2_n_0,\time_counter0_inferred__0/i___115_carry__1_n_6 ,\time_counter0_inferred__0/i___115_carry__1_n_7 }));
  CARRY4 \time_counter0_inferred__0/i___195_carry__0 
       (.CI(\time_counter0_inferred__0/i___195_carry_n_0 ),
        .CO({\time_counter0_inferred__0/i___195_carry__0_n_0 ,\time_counter0_inferred__0/i___195_carry__0_n_1 ,\time_counter0_inferred__0/i___195_carry__0_n_2 ,\time_counter0_inferred__0/i___195_carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b1,1'b0,1'b1}),
        .O({\time_counter0_inferred__0/i___195_carry__0_n_4 ,\time_counter0_inferred__0/i___195_carry__0_n_5 ,\time_counter0_inferred__0/i___195_carry__0_n_6 ,\time_counter0_inferred__0/i___195_carry__0_n_7 }),
        .S({\time_counter0_inferred__0/i___115_carry__2_n_4 ,i___195_carry__0_i_1_n_0,\time_counter0_inferred__0/i___115_carry__2_n_6 ,i___195_carry__0_i_2_n_0}));
  CARRY4 \time_counter0_inferred__0/i___195_carry__1 
       (.CI(\time_counter0_inferred__0/i___195_carry__0_n_0 ),
        .CO({\time_counter0_inferred__0/i___195_carry__1_n_0 ,\time_counter0_inferred__0/i___195_carry__1_n_1 ,\time_counter0_inferred__0/i___195_carry__1_n_2 ,\time_counter0_inferred__0/i___195_carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b0}),
        .O({\time_counter0_inferred__0/i___195_carry__1_n_4 ,\time_counter0_inferred__0/i___195_carry__1_n_5 ,\time_counter0_inferred__0/i___195_carry__1_n_6 ,\time_counter0_inferred__0/i___195_carry__1_n_7 }),
        .S({i___195_carry__1_i_1_n_0,i___195_carry__1_i_2_n_0,i___195_carry__1_i_3_n_0,\time_counter0_inferred__0/i___115_carry__3_n_7 }));
  CARRY4 \time_counter0_inferred__0/i___195_carry__2 
       (.CI(\time_counter0_inferred__0/i___195_carry__1_n_0 ),
        .CO({\time_counter0_inferred__0/i___195_carry__2_n_0 ,\time_counter0_inferred__0/i___195_carry__2_n_1 ,\time_counter0_inferred__0/i___195_carry__2_n_2 ,\time_counter0_inferred__0/i___195_carry__2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\time_counter0_inferred__0/i___195_carry__2_n_4 ,\time_counter0_inferred__0/i___195_carry__2_n_5 ,\time_counter0_inferred__0/i___195_carry__2_n_6 ,\time_counter0_inferred__0/i___195_carry__2_n_7 }),
        .S({\time_counter0_inferred__0/i___115_carry__4_n_4 ,\time_counter0_inferred__0/i___115_carry__4_n_5 ,\time_counter0_inferred__0/i___115_carry__4_n_6 ,i___195_carry__2_i_1_n_0}));
  CARRY4 \time_counter0_inferred__0/i___195_carry__3 
       (.CI(\time_counter0_inferred__0/i___195_carry__2_n_0 ),
        .CO({\time_counter0_inferred__0/i___195_carry__3_n_0 ,\time_counter0_inferred__0/i___195_carry__3_n_1 ,\time_counter0_inferred__0/i___195_carry__3_n_2 ,\time_counter0_inferred__0/i___195_carry__3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b0}),
        .O({\time_counter0_inferred__0/i___195_carry__3_n_4 ,\time_counter0_inferred__0/i___195_carry__3_n_5 ,\time_counter0_inferred__0/i___195_carry__3_n_6 ,\time_counter0_inferred__0/i___195_carry__3_n_7 }),
        .S({i___195_carry__3_i_1_n_0,i___195_carry__3_i_2_n_0,i___195_carry__3_i_3_n_0,\time_counter0_inferred__0/i___115_carry__5_n_7 }));
  CARRY4 \time_counter0_inferred__0/i___195_carry__4 
       (.CI(\time_counter0_inferred__0/i___195_carry__3_n_0 ),
        .CO({\NLW_time_counter0_inferred__0/i___195_carry__4_CO_UNCONNECTED [3:2],\time_counter0_inferred__0/i___195_carry__4_n_2 ,\time_counter0_inferred__0/i___195_carry__4_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b1,1'b0}),
        .O({\NLW_time_counter0_inferred__0/i___195_carry__4_O_UNCONNECTED [3:1],\time_counter0_inferred__0/i___195_carry__4_n_7 }),
        .S({1'b0,1'b0,i___195_carry__4_i_1_n_0,\time_counter0_inferred__0/i___115_carry__6_n_7 }));
  CARRY4 \time_counter0_inferred__0/i___66_carry 
       (.CI(1'b0),
        .CO({\time_counter0_inferred__0/i___66_carry_n_0 ,\time_counter0_inferred__0/i___66_carry_n_1 ,\time_counter0_inferred__0/i___66_carry_n_2 ,\time_counter0_inferred__0/i___66_carry_n_3 }),
        .CYINIT(1'b0),
        .DI({\time_counter0_inferred__0/i__carry__6_n_4 ,i___66_carry_i_1_n_0,1'b0,i___66_carry_i_2_n_0}),
        .O({\time_counter0_inferred__0/i___66_carry_n_4 ,\time_counter0_inferred__0/i___66_carry_n_5 ,\time_counter0_inferred__0/i___66_carry_n_6 ,\NLW_time_counter0_inferred__0/i___66_carry_O_UNCONNECTED [0]}),
        .S({i___66_carry_i_3_n_0,i___66_carry_i_4_n_0,i___66_carry_i_5_n_0,i___66_carry_i_6_n_0}));
  CARRY4 \time_counter0_inferred__0/i___66_carry__0 
       (.CI(\time_counter0_inferred__0/i___66_carry_n_0 ),
        .CO({\time_counter0_inferred__0/i___66_carry__0_n_0 ,\time_counter0_inferred__0/i___66_carry__0_n_1 ,\time_counter0_inferred__0/i___66_carry__0_n_2 ,\time_counter0_inferred__0/i___66_carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({i___66_carry__0_i_1_n_0,i___66_carry__0_i_2_n_0,1'b0,1'b0}),
        .O({\time_counter0_inferred__0/i___66_carry__0_n_4 ,\time_counter0_inferred__0/i___66_carry__0_n_5 ,\time_counter0_inferred__0/i___66_carry__0_n_6 ,\time_counter0_inferred__0/i___66_carry__0_n_7 }),
        .S({i___66_carry__0_i_3_n_0,i___66_carry__0_i_4_n_0,i___66_carry__0_i_5_n_0,\time_counter0_inferred__0/i__carry__7_n_7 }));
  CARRY4 \time_counter0_inferred__0/i___66_carry__1 
       (.CI(\time_counter0_inferred__0/i___66_carry__0_n_0 ),
        .CO({\time_counter0_inferred__0/i___66_carry__1_n_0 ,\time_counter0_inferred__0/i___66_carry__1_n_1 ,\time_counter0_inferred__0/i___66_carry__1_n_2 ,\time_counter0_inferred__0/i___66_carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,i___66_carry__1_i_1_n_0,i___66_carry__1_i_2_n_0,i___66_carry__1_i_3_n_0}),
        .O({\time_counter0_inferred__0/i___66_carry__1_n_4 ,\time_counter0_inferred__0/i___66_carry__1_n_5 ,\time_counter0_inferred__0/i___66_carry__1_n_6 ,\time_counter0_inferred__0/i___66_carry__1_n_7 }),
        .S({\time_counter0_inferred__0/i__carry__6_n_4 ,i___66_carry__1_i_4_n_0,i___66_carry__1_i_5_n_0,i___66_carry__1_i_6_n_0}));
  CARRY4 \time_counter0_inferred__0/i___66_carry__2 
       (.CI(\time_counter0_inferred__0/i___66_carry__1_n_0 ),
        .CO({\time_counter0_inferred__0/i___66_carry__2_n_0 ,\time_counter0_inferred__0/i___66_carry__2_n_1 ,\time_counter0_inferred__0/i___66_carry__2_n_2 ,\time_counter0_inferred__0/i___66_carry__2_n_3 }),
        .CYINIT(1'b0),
        .DI({i___66_carry__2_i_1_n_0,i___66_carry__2_i_2_n_0,i___66_carry_i_2_n_0,1'b0}),
        .O({\time_counter0_inferred__0/i___66_carry__2_n_4 ,\time_counter0_inferred__0/i___66_carry__2_n_5 ,\time_counter0_inferred__0/i___66_carry__2_n_6 ,\time_counter0_inferred__0/i___66_carry__2_n_7 }),
        .S({i___66_carry__2_i_3_n_0,i___66_carry__2_i_4_n_0,i___66_carry__2_i_5_n_0,i___66_carry__2_i_6_n_0}));
  CARRY4 \time_counter0_inferred__0/i___66_carry__3 
       (.CI(\time_counter0_inferred__0/i___66_carry__2_n_0 ),
        .CO({\NLW_time_counter0_inferred__0/i___66_carry__3_CO_UNCONNECTED [3],\time_counter0_inferred__0/i___66_carry__3_n_1 ,\time_counter0_inferred__0/i___66_carry__3_n_2 ,\time_counter0_inferred__0/i___66_carry__3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,\time_counter0_inferred__0/i__carry__6_n_4 ,i___66_carry__3_i_1_n_0,i___66_carry__3_i_2_n_0}),
        .O({\time_counter0_inferred__0/i___66_carry__3_n_4 ,\time_counter0_inferred__0/i___66_carry__3_n_5 ,\time_counter0_inferred__0/i___66_carry__3_n_6 ,\time_counter0_inferred__0/i___66_carry__3_n_7 }),
        .S({\time_counter0_inferred__0/i__carry__7_n_7 ,i___66_carry__3_i_3_n_0,i___66_carry__3_i_4_n_0,i___66_carry__3_i_5_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \time_counter0_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\time_counter0_inferred__0/i__carry_n_0 ,\time_counter0_inferred__0/i__carry_n_1 ,\time_counter0_inferred__0/i__carry_n_2 ,\time_counter0_inferred__0/i__carry_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry_i_1__0_n_0,1'b0,1'b0,1'b1}),
        .O(\NLW_time_counter0_inferred__0/i__carry_O_UNCONNECTED [3:0]),
        .S({i__carry_i_2__0_n_0,i__carry_i_3__0_n_0,i__carry_i_4__0_n_0,i__carry_i_5_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \time_counter0_inferred__0/i__carry__0 
       (.CI(\time_counter0_inferred__0/i__carry_n_0 ),
        .CO({\time_counter0_inferred__0/i__carry__0_n_0 ,\time_counter0_inferred__0/i__carry__0_n_1 ,\time_counter0_inferred__0/i__carry__0_n_2 ,\time_counter0_inferred__0/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI(plusOp[4:1]),
        .O(\NLW_time_counter0_inferred__0/i__carry__0_O_UNCONNECTED [3:0]),
        .S({i__carry__0_i_1__0_n_0,i__carry__0_i_2__0_n_0,i__carry__0_i_3__0_n_0,i__carry__0_i_4__0_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \time_counter0_inferred__0/i__carry__1 
       (.CI(\time_counter0_inferred__0/i__carry__0_n_0 ),
        .CO({\time_counter0_inferred__0/i__carry__1_n_0 ,\time_counter0_inferred__0/i__carry__1_n_1 ,\time_counter0_inferred__0/i__carry__1_n_2 ,\time_counter0_inferred__0/i__carry__1_n_3 }),
        .CYINIT(1'b0),
        .DI(plusOp[8:5]),
        .O(\NLW_time_counter0_inferred__0/i__carry__1_O_UNCONNECTED [3:0]),
        .S({i__carry__1_i_1_n_0,i__carry__1_i_2_n_0,i__carry__1_i_3_n_0,i__carry__1_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \time_counter0_inferred__0/i__carry__2 
       (.CI(\time_counter0_inferred__0/i__carry__1_n_0 ),
        .CO({\time_counter0_inferred__0/i__carry__2_n_0 ,\time_counter0_inferred__0/i__carry__2_n_1 ,\time_counter0_inferred__0/i__carry__2_n_2 ,\time_counter0_inferred__0/i__carry__2_n_3 }),
        .CYINIT(1'b0),
        .DI(plusOp[12:9]),
        .O(\NLW_time_counter0_inferred__0/i__carry__2_O_UNCONNECTED [3:0]),
        .S({i__carry__2_i_1_n_0,i__carry__2_i_2_n_0,i__carry__2_i_3_n_0,i__carry__2_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \time_counter0_inferred__0/i__carry__3 
       (.CI(\time_counter0_inferred__0/i__carry__2_n_0 ),
        .CO({\time_counter0_inferred__0/i__carry__3_n_0 ,\time_counter0_inferred__0/i__carry__3_n_1 ,\time_counter0_inferred__0/i__carry__3_n_2 ,\time_counter0_inferred__0/i__carry__3_n_3 }),
        .CYINIT(1'b0),
        .DI(plusOp[16:13]),
        .O(\NLW_time_counter0_inferred__0/i__carry__3_O_UNCONNECTED [3:0]),
        .S({i__carry__3_i_1_n_0,i__carry__3_i_2_n_0,i__carry__3_i_3_n_0,i__carry__3_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \time_counter0_inferred__0/i__carry__4 
       (.CI(\time_counter0_inferred__0/i__carry__3_n_0 ),
        .CO({\time_counter0_inferred__0/i__carry__4_n_0 ,\time_counter0_inferred__0/i__carry__4_n_1 ,\time_counter0_inferred__0/i__carry__4_n_2 ,\time_counter0_inferred__0/i__carry__4_n_3 }),
        .CYINIT(1'b0),
        .DI(plusOp[20:17]),
        .O(\NLW_time_counter0_inferred__0/i__carry__4_O_UNCONNECTED [3:0]),
        .S({i__carry__4_i_1_n_0,i__carry__4_i_2_n_0,i__carry__4_i_3_n_0,i__carry__4_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \time_counter0_inferred__0/i__carry__5 
       (.CI(\time_counter0_inferred__0/i__carry__4_n_0 ),
        .CO({\time_counter0_inferred__0/i__carry__5_n_0 ,\time_counter0_inferred__0/i__carry__5_n_1 ,\time_counter0_inferred__0/i__carry__5_n_2 ,\time_counter0_inferred__0/i__carry__5_n_3 }),
        .CYINIT(1'b0),
        .DI(plusOp[24:21]),
        .O(\NLW_time_counter0_inferred__0/i__carry__5_O_UNCONNECTED [3:0]),
        .S({i__carry__5_i_1_n_0,i__carry__5_i_2_n_0,i__carry__5_i_3_n_0,i__carry__5_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \time_counter0_inferred__0/i__carry__6 
       (.CI(\time_counter0_inferred__0/i__carry__5_n_0 ),
        .CO({\time_counter0_inferred__0/i__carry__6_n_0 ,\time_counter0_inferred__0/i__carry__6_n_1 ,\time_counter0_inferred__0/i__carry__6_n_2 ,\time_counter0_inferred__0/i__carry__6_n_3 }),
        .CYINIT(1'b0),
        .DI(plusOp[28:25]),
        .O({\time_counter0_inferred__0/i__carry__6_n_4 ,\NLW_time_counter0_inferred__0/i__carry__6_O_UNCONNECTED [2:0]}),
        .S({i__carry__6_i_1_n_0,i__carry__6_i_2_n_0,i__carry__6_i_3_n_0,i__carry__6_i_4_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \time_counter0_inferred__0/i__carry__7 
       (.CI(\time_counter0_inferred__0/i__carry__6_n_0 ),
        .CO({\NLW_time_counter0_inferred__0/i__carry__7_CO_UNCONNECTED [3:2],\time_counter0_inferred__0/i__carry__7_n_2 ,\time_counter0_inferred__0/i__carry__7_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,plusOp[30:29]}),
        .O({\NLW_time_counter0_inferred__0/i__carry__7_O_UNCONNECTED [3],\time_counter0_inferred__0/i__carry__7_n_5 ,\time_counter0_inferred__0/i__carry__7_n_6 ,\time_counter0_inferred__0/i__carry__7_n_7 }),
        .S({1'b0,i__carry__7_i_1_n_0,i__carry__7_i_2_n_0,i__carry__7_i_3_n_0}));
  LUT3 #(
    .INIT(8'hB8)) 
    \time_counter[10]_i_1 
       (.I0(\time_counter0_inferred__0/i___195_carry_n_5 ),
        .I1(\time_counter0_inferred__0/i___195_carry__4_n_2 ),
        .I2(\time_counter0_inferred__0/i___115_carry__1_n_5 ),
        .O(p_2_in[10]));
  LUT3 #(
    .INIT(8'hB8)) 
    \time_counter[11]_i_1 
       (.I0(\time_counter0_inferred__0/i___195_carry_n_4 ),
        .I1(\time_counter0_inferred__0/i___195_carry__4_n_2 ),
        .I2(\time_counter0_inferred__0/i___115_carry__1_n_4 ),
        .O(p_2_in[11]));
  LUT3 #(
    .INIT(8'hB8)) 
    \time_counter[12]_i_1 
       (.I0(\time_counter0_inferred__0/i___195_carry__0_n_7 ),
        .I1(\time_counter0_inferred__0/i___195_carry__4_n_2 ),
        .I2(\time_counter0_inferred__0/i___115_carry__2_n_7 ),
        .O(p_2_in[12]));
  LUT3 #(
    .INIT(8'hB8)) 
    \time_counter[13]_i_1 
       (.I0(\time_counter0_inferred__0/i___195_carry__0_n_6 ),
        .I1(\time_counter0_inferred__0/i___195_carry__4_n_2 ),
        .I2(\time_counter0_inferred__0/i___115_carry__2_n_6 ),
        .O(p_2_in[13]));
  LUT3 #(
    .INIT(8'hB8)) 
    \time_counter[14]_i_1 
       (.I0(\time_counter0_inferred__0/i___195_carry__0_n_5 ),
        .I1(\time_counter0_inferred__0/i___195_carry__4_n_2 ),
        .I2(\time_counter0_inferred__0/i___115_carry__2_n_5 ),
        .O(p_2_in[14]));
  LUT3 #(
    .INIT(8'hB8)) 
    \time_counter[15]_i_1 
       (.I0(\time_counter0_inferred__0/i___195_carry__0_n_4 ),
        .I1(\time_counter0_inferred__0/i___195_carry__4_n_2 ),
        .I2(\time_counter0_inferred__0/i___115_carry__2_n_4 ),
        .O(p_2_in[15]));
  LUT3 #(
    .INIT(8'hB8)) 
    \time_counter[16]_i_1 
       (.I0(\time_counter0_inferred__0/i___195_carry__1_n_7 ),
        .I1(\time_counter0_inferred__0/i___195_carry__4_n_2 ),
        .I2(\time_counter0_inferred__0/i___115_carry__3_n_7 ),
        .O(p_2_in[16]));
  LUT3 #(
    .INIT(8'hB8)) 
    \time_counter[17]_i_1 
       (.I0(\time_counter0_inferred__0/i___195_carry__1_n_6 ),
        .I1(\time_counter0_inferred__0/i___195_carry__4_n_2 ),
        .I2(\time_counter0_inferred__0/i___115_carry__3_n_6 ),
        .O(p_2_in[17]));
  LUT3 #(
    .INIT(8'hB8)) 
    \time_counter[18]_i_1 
       (.I0(\time_counter0_inferred__0/i___195_carry__1_n_5 ),
        .I1(\time_counter0_inferred__0/i___195_carry__4_n_2 ),
        .I2(\time_counter0_inferred__0/i___115_carry__3_n_5 ),
        .O(p_2_in[18]));
  LUT3 #(
    .INIT(8'hB8)) 
    \time_counter[19]_i_1 
       (.I0(\time_counter0_inferred__0/i___195_carry__1_n_4 ),
        .I1(\time_counter0_inferred__0/i___195_carry__4_n_2 ),
        .I2(\time_counter0_inferred__0/i___115_carry__3_n_4 ),
        .O(p_2_in[19]));
  LUT3 #(
    .INIT(8'hB8)) 
    \time_counter[20]_i_1 
       (.I0(\time_counter0_inferred__0/i___195_carry__2_n_7 ),
        .I1(\time_counter0_inferred__0/i___195_carry__4_n_2 ),
        .I2(\time_counter0_inferred__0/i___115_carry__4_n_7 ),
        .O(p_2_in[20]));
  LUT3 #(
    .INIT(8'hB8)) 
    \time_counter[21]_i_1 
       (.I0(\time_counter0_inferred__0/i___195_carry__2_n_6 ),
        .I1(\time_counter0_inferred__0/i___195_carry__4_n_2 ),
        .I2(\time_counter0_inferred__0/i___115_carry__4_n_6 ),
        .O(p_2_in[21]));
  LUT3 #(
    .INIT(8'hB8)) 
    \time_counter[22]_i_1 
       (.I0(\time_counter0_inferred__0/i___195_carry__2_n_5 ),
        .I1(\time_counter0_inferred__0/i___195_carry__4_n_2 ),
        .I2(\time_counter0_inferred__0/i___115_carry__4_n_5 ),
        .O(p_2_in[22]));
  LUT3 #(
    .INIT(8'hB8)) 
    \time_counter[23]_i_1 
       (.I0(\time_counter0_inferred__0/i___195_carry__2_n_4 ),
        .I1(\time_counter0_inferred__0/i___195_carry__4_n_2 ),
        .I2(\time_counter0_inferred__0/i___115_carry__4_n_4 ),
        .O(p_2_in[23]));
  LUT3 #(
    .INIT(8'hB8)) 
    \time_counter[24]_i_1 
       (.I0(\time_counter0_inferred__0/i___195_carry__3_n_7 ),
        .I1(\time_counter0_inferred__0/i___195_carry__4_n_2 ),
        .I2(\time_counter0_inferred__0/i___115_carry__5_n_7 ),
        .O(p_2_in[24]));
  LUT3 #(
    .INIT(8'hB8)) 
    \time_counter[25]_i_1 
       (.I0(\time_counter0_inferred__0/i___195_carry__3_n_6 ),
        .I1(\time_counter0_inferred__0/i___195_carry__4_n_2 ),
        .I2(\time_counter0_inferred__0/i___115_carry__5_n_6 ),
        .O(p_2_in[25]));
  LUT3 #(
    .INIT(8'hB8)) 
    \time_counter[26]_i_1 
       (.I0(\time_counter0_inferred__0/i___195_carry__3_n_5 ),
        .I1(\time_counter0_inferred__0/i___195_carry__4_n_2 ),
        .I2(\time_counter0_inferred__0/i___115_carry__5_n_5 ),
        .O(p_2_in[26]));
  LUT3 #(
    .INIT(8'hB8)) 
    \time_counter[27]_i_1 
       (.I0(\time_counter0_inferred__0/i___195_carry__3_n_4 ),
        .I1(\time_counter0_inferred__0/i___195_carry__4_n_2 ),
        .I2(\time_counter0_inferred__0/i___115_carry__5_n_4 ),
        .O(p_2_in[27]));
  LUT1 #(
    .INIT(2'h1)) 
    \time_counter[28]_i_1 
       (.I0(reset_IBUF),
        .O(\time_counter[28]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \time_counter[28]_i_2 
       (.I0(\time_counter0_inferred__0/i___195_carry__4_n_7 ),
        .I1(\time_counter0_inferred__0/i___195_carry__4_n_2 ),
        .I2(\time_counter0_inferred__0/i___115_carry__6_n_7 ),
        .O(p_2_in[28]));
  LUT2 #(
    .INIT(4'h8)) 
    \time_counter[31]_i_1 
       (.I0(time_counter[31]),
        .I1(reset_IBUF),
        .O(\time_counter[31]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \time_counter[8]_i_1 
       (.I0(\time_counter0_inferred__0/i___195_carry_n_7 ),
        .I1(\time_counter0_inferred__0/i___195_carry__4_n_2 ),
        .I2(\time_counter0_inferred__0/i___115_carry__1_n_7 ),
        .O(p_2_in[8]));
  LUT3 #(
    .INIT(8'hB8)) 
    \time_counter[9]_i_1 
       (.I0(\time_counter0_inferred__0/i___195_carry_n_6 ),
        .I1(\time_counter0_inferred__0/i___195_carry__4_n_2 ),
        .I2(\time_counter0_inferred__0/i___115_carry__1_n_6 ),
        .O(p_2_in[9]));
  FDRE #(
    .INIT(1'b1)) 
    \time_counter_reg[0] 
       (.C(mclk_IBUF_BUFG),
        .CE(\time_counter[28]_i_1_n_0 ),
        .D(p_2_in[0]),
        .Q(time_counter[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \time_counter_reg[10] 
       (.C(mclk_IBUF_BUFG),
        .CE(\time_counter[28]_i_1_n_0 ),
        .D(p_2_in[10]),
        .Q(time_counter[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \time_counter_reg[11] 
       (.C(mclk_IBUF_BUFG),
        .CE(\time_counter[28]_i_1_n_0 ),
        .D(p_2_in[11]),
        .Q(time_counter[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \time_counter_reg[12] 
       (.C(mclk_IBUF_BUFG),
        .CE(\time_counter[28]_i_1_n_0 ),
        .D(p_2_in[12]),
        .Q(time_counter[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \time_counter_reg[13] 
       (.C(mclk_IBUF_BUFG),
        .CE(\time_counter[28]_i_1_n_0 ),
        .D(p_2_in[13]),
        .Q(time_counter[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \time_counter_reg[14] 
       (.C(mclk_IBUF_BUFG),
        .CE(\time_counter[28]_i_1_n_0 ),
        .D(p_2_in[14]),
        .Q(time_counter[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \time_counter_reg[15] 
       (.C(mclk_IBUF_BUFG),
        .CE(\time_counter[28]_i_1_n_0 ),
        .D(p_2_in[15]),
        .Q(time_counter[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \time_counter_reg[16] 
       (.C(mclk_IBUF_BUFG),
        .CE(\time_counter[28]_i_1_n_0 ),
        .D(p_2_in[16]),
        .Q(time_counter[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \time_counter_reg[17] 
       (.C(mclk_IBUF_BUFG),
        .CE(\time_counter[28]_i_1_n_0 ),
        .D(p_2_in[17]),
        .Q(time_counter[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \time_counter_reg[18] 
       (.C(mclk_IBUF_BUFG),
        .CE(\time_counter[28]_i_1_n_0 ),
        .D(p_2_in[18]),
        .Q(time_counter[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \time_counter_reg[19] 
       (.C(mclk_IBUF_BUFG),
        .CE(\time_counter[28]_i_1_n_0 ),
        .D(p_2_in[19]),
        .Q(time_counter[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \time_counter_reg[1] 
       (.C(mclk_IBUF_BUFG),
        .CE(\time_counter[28]_i_1_n_0 ),
        .D(p_2_in[1]),
        .Q(time_counter[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \time_counter_reg[20] 
       (.C(mclk_IBUF_BUFG),
        .CE(\time_counter[28]_i_1_n_0 ),
        .D(p_2_in[20]),
        .Q(time_counter[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \time_counter_reg[21] 
       (.C(mclk_IBUF_BUFG),
        .CE(\time_counter[28]_i_1_n_0 ),
        .D(p_2_in[21]),
        .Q(time_counter[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \time_counter_reg[22] 
       (.C(mclk_IBUF_BUFG),
        .CE(\time_counter[28]_i_1_n_0 ),
        .D(p_2_in[22]),
        .Q(time_counter[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \time_counter_reg[23] 
       (.C(mclk_IBUF_BUFG),
        .CE(\time_counter[28]_i_1_n_0 ),
        .D(p_2_in[23]),
        .Q(time_counter[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \time_counter_reg[24] 
       (.C(mclk_IBUF_BUFG),
        .CE(\time_counter[28]_i_1_n_0 ),
        .D(p_2_in[24]),
        .Q(time_counter[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \time_counter_reg[25] 
       (.C(mclk_IBUF_BUFG),
        .CE(\time_counter[28]_i_1_n_0 ),
        .D(p_2_in[25]),
        .Q(time_counter[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \time_counter_reg[26] 
       (.C(mclk_IBUF_BUFG),
        .CE(\time_counter[28]_i_1_n_0 ),
        .D(p_2_in[26]),
        .Q(time_counter[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \time_counter_reg[27] 
       (.C(mclk_IBUF_BUFG),
        .CE(\time_counter[28]_i_1_n_0 ),
        .D(p_2_in[27]),
        .Q(time_counter[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \time_counter_reg[28] 
       (.C(mclk_IBUF_BUFG),
        .CE(\time_counter[28]_i_1_n_0 ),
        .D(p_2_in[28]),
        .Q(time_counter[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \time_counter_reg[2] 
       (.C(mclk_IBUF_BUFG),
        .CE(\time_counter[28]_i_1_n_0 ),
        .D(p_2_in[2]),
        .Q(time_counter[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \time_counter_reg[31] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .D(\time_counter[31]_i_1_n_0 ),
        .Q(time_counter[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \time_counter_reg[3] 
       (.C(mclk_IBUF_BUFG),
        .CE(\time_counter[28]_i_1_n_0 ),
        .D(p_2_in[3]),
        .Q(time_counter[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \time_counter_reg[4] 
       (.C(mclk_IBUF_BUFG),
        .CE(\time_counter[28]_i_1_n_0 ),
        .D(p_2_in[4]),
        .Q(time_counter[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \time_counter_reg[5] 
       (.C(mclk_IBUF_BUFG),
        .CE(\time_counter[28]_i_1_n_0 ),
        .D(p_2_in[5]),
        .Q(time_counter[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \time_counter_reg[6] 
       (.C(mclk_IBUF_BUFG),
        .CE(\time_counter[28]_i_1_n_0 ),
        .D(p_2_in[6]),
        .Q(time_counter[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \time_counter_reg[7] 
       (.C(mclk_IBUF_BUFG),
        .CE(\time_counter[28]_i_1_n_0 ),
        .D(p_2_in[7]),
        .Q(time_counter[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \time_counter_reg[8] 
       (.C(mclk_IBUF_BUFG),
        .CE(\time_counter[28]_i_1_n_0 ),
        .D(p_2_in[8]),
        .Q(time_counter[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \time_counter_reg[9] 
       (.C(mclk_IBUF_BUFG),
        .CE(\time_counter[28]_i_1_n_0 ),
        .D(p_2_in[9]),
        .Q(time_counter[9]),
        .R(1'b0));
endmodule

module velocity_reader
   (D,
    mclk_IBUF_BUFG,
    reset_IBUF,
    __11,
    c_OBUF,
    p_1_in);
  output [6:0]D;
  input mclk_IBUF_BUFG;
  input reset_IBUF;
  input __11;
  input c_OBUF;
  input [0:0]p_1_in;

  wire [5:5]ARG0;
  wire [9:5]ARG2;
  wire [11:3]ARG3;
  wire [6:0]D;
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
  wire \abcdefg[0]_i_2_n_0 ;
  wire \abcdefg[1]_i_2_n_0 ;
  wire \abcdefg[2]_i_2_n_0 ;
  wire \abcdefg[3]_i_2_n_0 ;
  wire \abcdefg[4]_i_2_n_0 ;
  wire \abcdefg[4]_i_3_n_0 ;
  wire \abcdefg[4]_i_4_n_0 ;
  wire \abcdefg[4]_i_5_n_0 ;
  wire \abcdefg[4]_i_7_n_0 ;
  wire \abcdefg[5]_i_2_n_0 ;
  wire \abcdefg[6]_i_10_n_0 ;
  wire \abcdefg[6]_i_12_n_0 ;
  wire \abcdefg[6]_i_13_n_0 ;
  wire \abcdefg[6]_i_16_n_0 ;
  wire \abcdefg[6]_i_23_n_0 ;
  wire \abcdefg[6]_i_24_n_0 ;
  wire \abcdefg[6]_i_25_n_0 ;
  wire \abcdefg[6]_i_26_n_0 ;
  wire \abcdefg[6]_i_27_n_0 ;
  wire \abcdefg[6]_i_28_n_0 ;
  wire \abcdefg[6]_i_29_n_0 ;
  wire \abcdefg[6]_i_30_n_0 ;
  wire \abcdefg[6]_i_31_n_0 ;
  wire \abcdefg[6]_i_32_n_0 ;
  wire \abcdefg[6]_i_33_n_0 ;
  wire \abcdefg[6]_i_7_n_0 ;
  wire \abcdefg_reg[6]_i_14_n_2 ;
  wire \abcdefg_reg[6]_i_14_n_3 ;
  wire \abcdefg_reg[6]_i_15_n_0 ;
  wire \abcdefg_reg[6]_i_15_n_1 ;
  wire \abcdefg_reg[6]_i_15_n_2 ;
  wire \abcdefg_reg[6]_i_15_n_3 ;
  wire \abcdefg_reg[6]_i_21_n_0 ;
  wire \abcdefg_reg[6]_i_21_n_1 ;
  wire \abcdefg_reg[6]_i_21_n_2 ;
  wire \abcdefg_reg[6]_i_21_n_3 ;
  wire c_OBUF;
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
  wire i__carry_i_5__0_n_0;
  wire i__carry_i_6_n_0;
  wire i__carry_i_7_n_0;
  wire i__carry_i_8_n_0;
  wire mclk_IBUF_BUFG;
  wire [11:0]moving_sum;
  wire \moving_sum[11]_i_2_n_0 ;
  wire \moving_sum[11]_i_3_n_0 ;
  wire \moving_sum[11]_i_4_n_0 ;
  wire \moving_sum[11]_i_5_n_0 ;
  wire \moving_sum[11]_i_6_n_0 ;
  wire \moving_sum[11]_i_7_n_0 ;
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
  wire [0:0]p_1_in;
  wire [7:0]pos_count;
  wire pos_count_reset__1;
  wire \pos_shift_reg[7][0]_srl8_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ;
  wire \pos_shift_reg[7][1]_srl8_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ;
  wire \pos_shift_reg[7][2]_srl8_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ;
  wire \pos_shift_reg[7][3]_srl8_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ;
  wire \pos_shift_reg[7][4]_srl8_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ;
  wire \pos_shift_reg[7][5]_srl8_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ;
  wire \pos_shift_reg[7][6]_srl8_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ;
  wire \pos_shift_reg[7][7]_srl8_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ;
  wire \pos_shift_reg[8][0]_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ;
  wire \pos_shift_reg[8][1]_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ;
  wire \pos_shift_reg[8][2]_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ;
  wire \pos_shift_reg[8][3]_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ;
  wire \pos_shift_reg[8][4]_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ;
  wire \pos_shift_reg[8][5]_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ;
  wire \pos_shift_reg[8][6]_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ;
  wire \pos_shift_reg[8][7]_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ;
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
  wire \rcount[0]_i_10_n_0 ;
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
  wire reset_IBUF;
  wire ten_ms_pulse;
  wire [7:0]velocity;
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
  wire velocity1_carry_i_22_n_0;
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
  wire [3:2]\NLW_abcdefg_reg[6]_i_14_CO_UNCONNECTED ;
  wire [3:3]\NLW_abcdefg_reg[6]_i_14_O_UNCONNECTED ;
  wire [1:0]\NLW_abcdefg_reg[6]_i_21_O_UNCONNECTED ;
  wire [3:3]NLW_moving_sum_next_carry__1_CO_UNCONNECTED;
  wire [3:3]\NLW_rcount_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:0]NLW_velocity1_carry_O_UNCONNECTED;
  wire [2:0]NLW_velocity1_carry_i_10_O_UNCONNECTED;
  wire [3:2]NLW_velocity1_carry_i_8_CO_UNCONNECTED;
  wire [3:3]NLW_velocity1_carry_i_8_O_UNCONNECTED;

  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\_inferred__0/i__carry_n_0 ,\_inferred__0/i__carry_n_1 ,\_inferred__0/i__carry_n_2 ,\_inferred__0/i__carry_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry_i_1_n_0,i__carry_i_2_n_0,i__carry_i_3_n_0,i__carry_i_4_n_0}),
        .O({\_inferred__0/i__carry_n_4 ,\_inferred__0/i__carry_n_5 ,\_inferred__0/i__carry_n_6 ,\_inferred__0/i__carry_n_7 }),
        .S({i__carry_i_5__0_n_0,i__carry_i_6_n_0,i__carry_i_7_n_0,i__carry_i_8_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \_inferred__0/i__carry__0 
       (.CI(\_inferred__0/i__carry_n_0 ),
        .CO({\NLW__inferred__0/i__carry__0_CO_UNCONNECTED [3],\_inferred__0/i__carry__0_n_1 ,\_inferred__0/i__carry__0_n_2 ,\_inferred__0/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,i__carry__0_i_1_n_0,i__carry__0_i_2_n_0,i__carry__0_i_3_n_0}),
        .O({\_inferred__0/i__carry__0_n_4 ,\_inferred__0/i__carry__0_n_5 ,\_inferred__0/i__carry__0_n_6 ,\_inferred__0/i__carry__0_n_7 }),
        .S({i__carry__0_i_4_n_0,i__carry__0_i_5_n_0,i__carry__0_i_6_n_0,i__carry__0_i_7_n_0}));
  LUT6 #(
    .INIT(64'hE7FCFFFFE7FC0000)) 
    \abcdefg[0]_i_1 
       (.I0(velocity[4]),
        .I1(velocity[5]),
        .I2(velocity[7]),
        .I3(velocity[6]),
        .I4(c_OBUF),
        .I5(\abcdefg[0]_i_2_n_0 ),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hE7FC)) 
    \abcdefg[0]_i_2 
       (.I0(velocity[0]),
        .I1(velocity[1]),
        .I2(velocity[3]),
        .I3(velocity[2]),
        .O(\abcdefg[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAA2AAAAA2AAA222A)) 
    \abcdefg[1]_i_1 
       (.I0(\abcdefg[1]_i_2_n_0 ),
        .I1(c_OBUF),
        .I2(velocity[4]),
        .I3(velocity[5]),
        .I4(velocity[6]),
        .I5(velocity[7]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'hFDDFFCFD)) 
    \abcdefg[1]_i_2 
       (.I0(velocity[0]),
        .I1(c_OBUF),
        .I2(velocity[3]),
        .I3(velocity[1]),
        .I4(velocity[2]),
        .O(\abcdefg[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hBAB3FFFFBAB30000)) 
    \abcdefg[2]_i_1 
       (.I0(velocity[7]),
        .I1(velocity[4]),
        .I2(velocity[5]),
        .I3(velocity[6]),
        .I4(c_OBUF),
        .I5(\abcdefg[2]_i_2_n_0 ),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hBAB3)) 
    \abcdefg[2]_i_2 
       (.I0(velocity[3]),
        .I1(velocity[0]),
        .I2(velocity[1]),
        .I3(velocity[2]),
        .O(\abcdefg[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h796DFFFF796D0000)) 
    \abcdefg[3]_i_1 
       (.I0(velocity[4]),
        .I1(velocity[5]),
        .I2(velocity[6]),
        .I3(velocity[7]),
        .I4(c_OBUF),
        .I5(\abcdefg[3]_i_2_n_0 ),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h796D)) 
    \abcdefg[3]_i_2 
       (.I0(velocity[0]),
        .I1(velocity[1]),
        .I2(velocity[2]),
        .I3(velocity[3]),
        .O(\abcdefg[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000001555505)) 
    \abcdefg[4]_i_1 
       (.I0(\abcdefg[4]_i_2_n_0 ),
        .I1(\abcdefg[4]_i_3_n_0 ),
        .I2(\abcdefg[4]_i_4_n_0 ),
        .I3(velocity[7]),
        .I4(velocity[6]),
        .I5(\abcdefg[4]_i_5_n_0 ),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    \abcdefg[4]_i_2 
       (.I0(velocity[1]),
        .I1(velocity[3]),
        .I2(c_OBUF),
        .I3(velocity[2]),
        .O(\abcdefg[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h3120130200000000)) 
    \abcdefg[4]_i_3 
       (.I0(moving_sum[11]),
        .I1(velocity1),
        .I2(\abcdefg[6]_i_16_n_0 ),
        .I3(moving_sum[8]),
        .I4(ARG3[8]),
        .I5(c_OBUF),
        .O(\abcdefg[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000444400004004)) 
    \abcdefg[4]_i_4 
       (.I0(velocity[4]),
        .I1(c_OBUF),
        .I2(ARG2[9]),
        .I3(\abcdefg[4]_i_7_n_0 ),
        .I4(velocity1),
        .I5(ARG0),
        .O(\abcdefg[4]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h000000A4)) 
    \abcdefg[4]_i_5 
       (.I0(velocity[2]),
        .I1(velocity[1]),
        .I2(velocity[3]),
        .I3(c_OBUF),
        .I4(velocity[0]),
        .O(\abcdefg[4]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \abcdefg[4]_i_6 
       (.I0(ARG3[9]),
        .I1(moving_sum[11]),
        .I2(moving_sum[9]),
        .O(ARG2[9]));
  LUT6 #(
    .INIT(64'h5555555555555755)) 
    \abcdefg[4]_i_7 
       (.I0(moving_sum[11]),
        .I1(ARG2[8]),
        .I2(ARG2[6]),
        .I3(\abcdefg[6]_i_10_n_0 ),
        .I4(ARG2[5]),
        .I5(ARG2[7]),
        .O(\abcdefg[4]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h55555575AAAAAA8A)) 
    \abcdefg[4]_i_8 
       (.I0(moving_sum[11]),
        .I1(ARG2[6]),
        .I2(\abcdefg[6]_i_10_n_0 ),
        .I3(ARG2[5]),
        .I4(ARG2[7]),
        .I5(ARG2[8]),
        .O(ARG0));
  LUT6 #(
    .INIT(64'h671FFFFF671F0000)) 
    \abcdefg[5]_i_1 
       (.I0(velocity[7]),
        .I1(velocity[5]),
        .I2(velocity[6]),
        .I3(velocity[4]),
        .I4(c_OBUF),
        .I5(\abcdefg[5]_i_2_n_0 ),
        .O(D[5]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h671F)) 
    \abcdefg[5]_i_2 
       (.I0(velocity[3]),
        .I1(velocity[1]),
        .I2(velocity[2]),
        .I3(velocity[0]),
        .O(\abcdefg[5]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00053305)) 
    \abcdefg[6]_i_10 
       (.I0(moving_sum[3]),
        .I1(ARG3[3]),
        .I2(moving_sum[4]),
        .I3(moving_sum[11]),
        .I4(ARG3[4]),
        .O(\abcdefg[6]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \abcdefg[6]_i_11 
       (.I0(ARG3[5]),
        .I1(moving_sum[11]),
        .I2(moving_sum[5]),
        .O(ARG2[5]));
  LUT5 #(
    .INIT(32'hFFCCFACC)) 
    \abcdefg[6]_i_12 
       (.I0(ARG3[9]),
        .I1(moving_sum[9]),
        .I2(ARG3[11]),
        .I3(moving_sum[11]),
        .I4(ARG3[10]),
        .O(\abcdefg[6]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'h00000010)) 
    \abcdefg[6]_i_13 
       (.I0(ARG2[7]),
        .I1(ARG2[5]),
        .I2(\abcdefg[6]_i_10_n_0 ),
        .I3(ARG2[6]),
        .I4(ARG2[8]),
        .O(\abcdefg[6]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000102030)) 
    \abcdefg[6]_i_16 
       (.I0(moving_sum[11]),
        .I1(ARG2[6]),
        .I2(\abcdefg[6]_i_10_n_0 ),
        .I3(moving_sum[5]),
        .I4(ARG3[5]),
        .I5(ARG2[7]),
        .O(\abcdefg[6]_i_16_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \abcdefg[6]_i_17 
       (.I0(velocity1),
        .I1(moving_sum[3]),
        .I2(moving_sum[11]),
        .I3(ARG3[3]),
        .O(velocity[0]));
  LUT5 #(
    .INIT(32'h00006C66)) 
    \abcdefg[6]_i_18 
       (.I0(moving_sum[11]),
        .I1(ARG2[6]),
        .I2(ARG3[5]),
        .I3(\abcdefg[6]_i_10_n_0 ),
        .I4(velocity1),
        .O(velocity[3]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h0000B874)) 
    \abcdefg[6]_i_19 
       (.I0(ARG3[5]),
        .I1(moving_sum[11]),
        .I2(moving_sum[5]),
        .I3(\abcdefg[6]_i_10_n_0 ),
        .I4(velocity1),
        .O(velocity[2]));
  LUT6 #(
    .INIT(64'hF76DFFFFF76D0000)) 
    \abcdefg[6]_i_2 
       (.I0(velocity[4]),
        .I1(velocity[7]),
        .I2(velocity[6]),
        .I3(velocity[5]),
        .I4(c_OBUF),
        .I5(\abcdefg[6]_i_7_n_0 ),
        .O(D[6]));
  LUT5 #(
    .INIT(32'h000072D8)) 
    \abcdefg[6]_i_20 
       (.I0(moving_sum[11]),
        .I1(ARG3[4]),
        .I2(moving_sum[4]),
        .I3(ARG3[3]),
        .I4(velocity1),
        .O(velocity[1]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \abcdefg[6]_i_22 
       (.I0(ARG3[8]),
        .I1(moving_sum[11]),
        .I2(moving_sum[8]),
        .O(ARG2[8]));
  LUT1 #(
    .INIT(2'h1)) 
    \abcdefg[6]_i_23 
       (.I0(moving_sum[11]),
        .O(\abcdefg[6]_i_23_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \abcdefg[6]_i_24 
       (.I0(moving_sum[10]),
        .O(\abcdefg[6]_i_24_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \abcdefg[6]_i_25 
       (.I0(moving_sum[9]),
        .O(\abcdefg[6]_i_25_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \abcdefg[6]_i_26 
       (.I0(moving_sum[8]),
        .O(\abcdefg[6]_i_26_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \abcdefg[6]_i_27 
       (.I0(moving_sum[7]),
        .O(\abcdefg[6]_i_27_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \abcdefg[6]_i_28 
       (.I0(moving_sum[6]),
        .O(\abcdefg[6]_i_28_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \abcdefg[6]_i_29 
       (.I0(moving_sum[5]),
        .O(\abcdefg[6]_i_29_n_0 ));
  LUT6 #(
    .INIT(64'h0000000066666C66)) 
    \abcdefg[6]_i_3 
       (.I0(moving_sum[11]),
        .I1(ARG2[7]),
        .I2(ARG2[6]),
        .I3(\abcdefg[6]_i_10_n_0 ),
        .I4(ARG2[5]),
        .I5(velocity1),
        .O(velocity[4]));
  LUT1 #(
    .INIT(2'h1)) 
    \abcdefg[6]_i_30 
       (.I0(moving_sum[4]),
        .O(\abcdefg[6]_i_30_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \abcdefg[6]_i_31 
       (.I0(moving_sum[3]),
        .O(\abcdefg[6]_i_31_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \abcdefg[6]_i_32 
       (.I0(moving_sum[2]),
        .O(\abcdefg[6]_i_32_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \abcdefg[6]_i_33 
       (.I0(moving_sum[1]),
        .O(\abcdefg[6]_i_33_n_0 ));
  LUT4 #(
    .INIT(16'hFFB0)) 
    \abcdefg[6]_i_4 
       (.I0(\abcdefg[6]_i_12_n_0 ),
        .I1(\abcdefg[6]_i_13_n_0 ),
        .I2(moving_sum[11]),
        .I3(velocity1),
        .O(velocity[7]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h0000B874)) 
    \abcdefg[6]_i_5 
       (.I0(ARG3[9]),
        .I1(moving_sum[11]),
        .I2(moving_sum[9]),
        .I3(\abcdefg[6]_i_13_n_0 ),
        .I4(velocity1),
        .O(velocity[6]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h0000B874)) 
    \abcdefg[6]_i_6 
       (.I0(ARG3[8]),
        .I1(moving_sum[11]),
        .I2(moving_sum[8]),
        .I3(\abcdefg[6]_i_16_n_0 ),
        .I4(velocity1),
        .O(velocity[5]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'hF76D)) 
    \abcdefg[6]_i_7 
       (.I0(velocity[0]),
        .I1(velocity[3]),
        .I2(velocity[2]),
        .I3(velocity[1]),
        .O(\abcdefg[6]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \abcdefg[6]_i_8 
       (.I0(ARG3[7]),
        .I1(moving_sum[11]),
        .I2(moving_sum[7]),
        .O(ARG2[7]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \abcdefg[6]_i_9 
       (.I0(ARG3[6]),
        .I1(moving_sum[11]),
        .I2(moving_sum[6]),
        .O(ARG2[6]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \abcdefg_reg[6]_i_14 
       (.CI(\abcdefg_reg[6]_i_15_n_0 ),
        .CO({\NLW_abcdefg_reg[6]_i_14_CO_UNCONNECTED [3:2],\abcdefg_reg[6]_i_14_n_2 ,\abcdefg_reg[6]_i_14_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_abcdefg_reg[6]_i_14_O_UNCONNECTED [3],ARG3[11:9]}),
        .S({1'b0,\abcdefg[6]_i_23_n_0 ,\abcdefg[6]_i_24_n_0 ,\abcdefg[6]_i_25_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \abcdefg_reg[6]_i_15 
       (.CI(\abcdefg_reg[6]_i_21_n_0 ),
        .CO({\abcdefg_reg[6]_i_15_n_0 ,\abcdefg_reg[6]_i_15_n_1 ,\abcdefg_reg[6]_i_15_n_2 ,\abcdefg_reg[6]_i_15_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(ARG3[8:5]),
        .S({\abcdefg[6]_i_26_n_0 ,\abcdefg[6]_i_27_n_0 ,\abcdefg[6]_i_28_n_0 ,\abcdefg[6]_i_29_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \abcdefg_reg[6]_i_21 
       (.CI(1'b0),
        .CO({\abcdefg_reg[6]_i_21_n_0 ,\abcdefg_reg[6]_i_21_n_1 ,\abcdefg_reg[6]_i_21_n_2 ,\abcdefg_reg[6]_i_21_n_3 }),
        .CYINIT(velocity1_carry_i_18_n_0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({ARG3[4:3],\NLW_abcdefg_reg[6]_i_21_O_UNCONNECTED [1:0]}),
        .S({\abcdefg[6]_i_30_n_0 ,\abcdefg[6]_i_31_n_0 ,\abcdefg[6]_i_32_n_0 ,\abcdefg[6]_i_33_n_0 }));
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
    .INIT(8'hF9)) 
    i__carry__0_i_4
       (.I0(pos_count[6]),
        .I1(pos_count[7]),
        .I2(pos_count_reset__1),
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
  LUT6 #(
    .INIT(64'hFFFFFFFF00020000)) 
    i__carry_i_12
       (.I0(i__carry_i_14_n_0),
        .I1(pos_count[7]),
        .I2(pos_count[6]),
        .I3(pos_count[4]),
        .I4(pos_count[5]),
        .I5(ten_ms_pulse),
        .O(i__carry_i_12_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    i__carry_i_13
       (.I0(pos_count[1]),
        .I1(pos_count[0]),
        .I2(pos_count[3]),
        .I3(pos_count[2]),
        .O(i__carry_i_13_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    i__carry_i_14
       (.I0(pos_count[1]),
        .I1(pos_count[0]),
        .I2(pos_count[3]),
        .I3(pos_count[2]),
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
    .INIT(8'h65)) 
    i__carry_i_4
       (.I0(__11),
        .I1(pos_count_reset__1),
        .I2(pos_count[0]),
        .O(i__carry_i_4_n_0));
  LUT3 #(
    .INIT(8'hED)) 
    i__carry_i_5__0
       (.I0(pos_count[2]),
        .I1(pos_count_reset__1),
        .I2(pos_count[3]),
        .O(i__carry_i_5__0_n_0));
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
    .INIT(16'hD22D)) 
    i__carry_i_8
       (.I0(pos_count[0]),
        .I1(pos_count_reset__1),
        .I2(__11),
        .I3(p_1_in),
        .O(i__carry_i_8_n_0));
  LUT6 #(
    .INIT(64'hAAAAEAAAAAAAAAAA)) 
    i__carry_i_9
       (.I0(i__carry_i_12_n_0),
        .I1(i__carry_i_13_n_0),
        .I2(pos_count[7]),
        .I3(pos_count[6]),
        .I4(pos_count[5]),
        .I5(pos_count[4]),
        .O(pos_count_reset__1));
  LUT4 #(
    .INIT(16'h0080)) 
    \moving_sum[11]_i_1 
       (.I0(\moving_sum[11]_i_2_n_0 ),
        .I1(\moving_sum[11]_i_3_n_0 ),
        .I2(\moving_sum[11]_i_4_n_0 ),
        .I3(rcount_reg[19]),
        .O(ten_ms_pulse));
  LUT4 #(
    .INIT(16'h080A)) 
    \moving_sum[11]_i_2 
       (.I0(\moving_sum[11]_i_5_n_0 ),
        .I1(rcount_reg[16]),
        .I2(rcount_reg[17]),
        .I3(rcount_reg[15]),
        .O(\moving_sum[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \moving_sum[11]_i_3 
       (.I0(\moving_sum[11]_i_6_n_0 ),
        .I1(rcount_reg[1]),
        .I2(rcount_reg[0]),
        .I3(rcount_reg[4]),
        .I4(rcount_reg[2]),
        .I5(\moving_sum[11]_i_7_n_0 ),
        .O(\moving_sum[11]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \moving_sum[11]_i_4 
       (.I0(rcount_reg[11]),
        .I1(rcount_reg[13]),
        .I2(rcount_reg[14]),
        .I3(rcount_reg[16]),
        .I4(rcount_reg[18]),
        .I5(rcount_reg[17]),
        .O(\moving_sum[11]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000230000002323)) 
    \moving_sum[11]_i_5 
       (.I0(rcount_reg[13]),
        .I1(rcount_reg[14]),
        .I2(rcount_reg[12]),
        .I3(rcount_reg[10]),
        .I4(rcount_reg[11]),
        .I5(rcount_reg[9]),
        .O(\moving_sum[11]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \moving_sum[11]_i_6 
       (.I0(rcount_reg[10]),
        .I1(rcount_reg[8]),
        .I2(rcount_reg[7]),
        .I3(rcount_reg[5]),
        .O(\moving_sum[11]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0000230000002323)) 
    \moving_sum[11]_i_7 
       (.I0(rcount_reg[7]),
        .I1(rcount_reg[8]),
        .I2(rcount_reg[6]),
        .I3(rcount_reg[4]),
        .I4(rcount_reg[5]),
        .I5(rcount_reg[3]),
        .O(\moving_sum[11]_i_7_n_0 ));
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
  LUT3 #(
    .INIT(8'hD4)) 
    moving_sum_next_carry__0_i_1
       (.I0(\pos_shift_reg[9] [6]),
        .I1(moving_sum[6]),
        .I2(pos_count[6]),
        .O(moving_sum_next_carry__0_i_1_n_0));
  LUT3 #(
    .INIT(8'hD4)) 
    moving_sum_next_carry__0_i_2
       (.I0(\pos_shift_reg[9] [5]),
        .I1(moving_sum[5]),
        .I2(pos_count[5]),
        .O(moving_sum_next_carry__0_i_2_n_0));
  LUT3 #(
    .INIT(8'hD4)) 
    moving_sum_next_carry__0_i_3
       (.I0(\pos_shift_reg[9] [4]),
        .I1(moving_sum[4]),
        .I2(pos_count[4]),
        .O(moving_sum_next_carry__0_i_3_n_0));
  LUT3 #(
    .INIT(8'hD4)) 
    moving_sum_next_carry__0_i_4
       (.I0(\pos_shift_reg[9] [3]),
        .I1(moving_sum[3]),
        .I2(pos_count[3]),
        .O(moving_sum_next_carry__0_i_4_n_0));
  LUT6 #(
    .INIT(64'h8E71718E718E8E71)) 
    moving_sum_next_carry__0_i_5
       (.I0(pos_count[6]),
        .I1(moving_sum[6]),
        .I2(\pos_shift_reg[9] [6]),
        .I3(\pos_shift_reg[9] [7]),
        .I4(pos_count[7]),
        .I5(moving_sum[7]),
        .O(moving_sum_next_carry__0_i_5_n_0));
  LUT6 #(
    .INIT(64'h8E71718E718E8E71)) 
    moving_sum_next_carry__0_i_6
       (.I0(pos_count[5]),
        .I1(moving_sum[5]),
        .I2(\pos_shift_reg[9] [5]),
        .I3(\pos_shift_reg[9] [6]),
        .I4(pos_count[6]),
        .I5(moving_sum[6]),
        .O(moving_sum_next_carry__0_i_6_n_0));
  LUT6 #(
    .INIT(64'h8E71718E718E8E71)) 
    moving_sum_next_carry__0_i_7
       (.I0(pos_count[4]),
        .I1(moving_sum[4]),
        .I2(\pos_shift_reg[9] [4]),
        .I3(\pos_shift_reg[9] [5]),
        .I4(pos_count[5]),
        .I5(moving_sum[5]),
        .O(moving_sum_next_carry__0_i_7_n_0));
  LUT6 #(
    .INIT(64'h8E71718E718E8E71)) 
    moving_sum_next_carry__0_i_8
       (.I0(pos_count[3]),
        .I1(moving_sum[3]),
        .I2(\pos_shift_reg[9] [3]),
        .I3(\pos_shift_reg[9] [4]),
        .I4(pos_count[4]),
        .I5(moving_sum[4]),
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
    .INIT(8'h8E)) 
    moving_sum_next_carry__1_i_1
       (.I0(\pos_shift_reg[9] [7]),
        .I1(moving_sum[7]),
        .I2(pos_count[7]),
        .O(moving_sum_next_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    moving_sum_next_carry__1_i_2
       (.I0(moving_sum[11]),
        .I1(moving_sum[10]),
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
    .INIT(16'hD42B)) 
    moving_sum_next_carry__1_i_5
       (.I0(pos_count[7]),
        .I1(moving_sum[7]),
        .I2(\pos_shift_reg[9] [7]),
        .I3(moving_sum[8]),
        .O(moving_sum_next_carry__1_i_5_n_0));
  LUT3 #(
    .INIT(8'hD4)) 
    moving_sum_next_carry_i_1
       (.I0(\pos_shift_reg[9] [2]),
        .I1(moving_sum[2]),
        .I2(pos_count[2]),
        .O(moving_sum_next_carry_i_1_n_0));
  LUT3 #(
    .INIT(8'hD4)) 
    moving_sum_next_carry_i_2
       (.I0(\pos_shift_reg[9] [1]),
        .I1(moving_sum[1]),
        .I2(pos_count[1]),
        .O(moving_sum_next_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    moving_sum_next_carry_i_3
       (.I0(pos_count[0]),
        .I1(moving_sum[0]),
        .O(moving_sum_next_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    moving_sum_next_carry_i_4
       (.I0(pos_count[0]),
        .I1(moving_sum[0]),
        .O(moving_sum_next_carry_i_4_n_0));
  LUT6 #(
    .INIT(64'h8E71718E718E8E71)) 
    moving_sum_next_carry_i_5
       (.I0(pos_count[2]),
        .I1(moving_sum[2]),
        .I2(\pos_shift_reg[9] [2]),
        .I3(\pos_shift_reg[9] [3]),
        .I4(pos_count[3]),
        .I5(moving_sum[3]),
        .O(moving_sum_next_carry_i_5_n_0));
  LUT6 #(
    .INIT(64'h8E71718E718E8E71)) 
    moving_sum_next_carry_i_6
       (.I0(pos_count[1]),
        .I1(moving_sum[1]),
        .I2(\pos_shift_reg[9] [1]),
        .I3(\pos_shift_reg[9] [2]),
        .I4(pos_count[2]),
        .I5(moving_sum[2]),
        .O(moving_sum_next_carry_i_6_n_0));
  LUT5 #(
    .INIT(32'hE11E1EE1)) 
    moving_sum_next_carry_i_7
       (.I0(moving_sum[0]),
        .I1(pos_count[0]),
        .I2(\pos_shift_reg[9] [1]),
        .I3(pos_count[1]),
        .I4(moving_sum[1]),
        .O(moving_sum_next_carry_i_7_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    moving_sum_next_carry_i_8
       (.I0(moving_sum[0]),
        .I1(pos_count[0]),
        .I2(\pos_shift_reg[9] [0]),
        .O(moving_sum_next_carry_i_8_n_0));
  FDCE #(
    .INIT(1'b0)) 
    \moving_sum_reg[0] 
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .CLR(reset_IBUF),
        .D(moving_sum_next_carry_n_7),
        .Q(moving_sum[0]));
  FDCE #(
    .INIT(1'b0)) 
    \moving_sum_reg[10] 
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .CLR(reset_IBUF),
        .D(moving_sum_next_carry__1_n_5),
        .Q(moving_sum[10]));
  FDCE #(
    .INIT(1'b0)) 
    \moving_sum_reg[11] 
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .CLR(reset_IBUF),
        .D(moving_sum_next_carry__1_n_4),
        .Q(moving_sum[11]));
  FDCE #(
    .INIT(1'b0)) 
    \moving_sum_reg[1] 
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .CLR(reset_IBUF),
        .D(moving_sum_next_carry_n_6),
        .Q(moving_sum[1]));
  FDCE #(
    .INIT(1'b0)) 
    \moving_sum_reg[2] 
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .CLR(reset_IBUF),
        .D(moving_sum_next_carry_n_5),
        .Q(moving_sum[2]));
  FDCE #(
    .INIT(1'b0)) 
    \moving_sum_reg[3] 
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .CLR(reset_IBUF),
        .D(moving_sum_next_carry_n_4),
        .Q(moving_sum[3]));
  FDCE #(
    .INIT(1'b0)) 
    \moving_sum_reg[4] 
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .CLR(reset_IBUF),
        .D(moving_sum_next_carry__0_n_7),
        .Q(moving_sum[4]));
  FDCE #(
    .INIT(1'b0)) 
    \moving_sum_reg[5] 
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .CLR(reset_IBUF),
        .D(moving_sum_next_carry__0_n_6),
        .Q(moving_sum[5]));
  FDCE #(
    .INIT(1'b0)) 
    \moving_sum_reg[6] 
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .CLR(reset_IBUF),
        .D(moving_sum_next_carry__0_n_5),
        .Q(moving_sum[6]));
  FDCE #(
    .INIT(1'b0)) 
    \moving_sum_reg[7] 
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .CLR(reset_IBUF),
        .D(moving_sum_next_carry__0_n_4),
        .Q(moving_sum[7]));
  FDCE #(
    .INIT(1'b0)) 
    \moving_sum_reg[8] 
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .CLR(reset_IBUF),
        .D(moving_sum_next_carry__1_n_7),
        .Q(moving_sum[8]));
  FDCE #(
    .INIT(1'b0)) 
    \moving_sum_reg[9] 
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .CLR(reset_IBUF),
        .D(moving_sum_next_carry__1_n_6),
        .Q(moving_sum[9]));
  FDCE #(
    .INIT(1'b0)) 
    \pos_count_reg[0] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\_inferred__0/i__carry_n_7 ),
        .Q(pos_count[0]));
  FDCE #(
    .INIT(1'b0)) 
    \pos_count_reg[1] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\_inferred__0/i__carry_n_6 ),
        .Q(pos_count[1]));
  FDCE #(
    .INIT(1'b0)) 
    \pos_count_reg[2] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\_inferred__0/i__carry_n_5 ),
        .Q(pos_count[2]));
  FDCE #(
    .INIT(1'b0)) 
    \pos_count_reg[3] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\_inferred__0/i__carry_n_4 ),
        .Q(pos_count[3]));
  FDCE #(
    .INIT(1'b0)) 
    \pos_count_reg[4] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\_inferred__0/i__carry__0_n_7 ),
        .Q(pos_count[4]));
  FDCE #(
    .INIT(1'b0)) 
    \pos_count_reg[5] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\_inferred__0/i__carry__0_n_6 ),
        .Q(pos_count[5]));
  FDCE #(
    .INIT(1'b0)) 
    \pos_count_reg[6] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\_inferred__0/i__carry__0_n_5 ),
        .Q(pos_count[6]));
  FDCE #(
    .INIT(1'b0)) 
    \pos_count_reg[7] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\_inferred__0/i__carry__0_n_4 ),
        .Q(pos_count[7]));
  (* srl_bus_name = "\UUT_VEL_READ/pos_shift_reg[7] " *) 
  (* srl_name = "\UUT_VEL_READ/pos_shift_reg[7][0]_srl8_UUT_VEL_READ_pos_shift_reg_c_6 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \pos_shift_reg[7][0]_srl8_UUT_VEL_READ_pos_shift_reg_c_6 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(ten_ms_pulse),
        .CLK(mclk_IBUF_BUFG),
        .D(pos_count[0]),
        .Q(\pos_shift_reg[7][0]_srl8_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ));
  (* srl_bus_name = "\UUT_VEL_READ/pos_shift_reg[7] " *) 
  (* srl_name = "\UUT_VEL_READ/pos_shift_reg[7][1]_srl8_UUT_VEL_READ_pos_shift_reg_c_6 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \pos_shift_reg[7][1]_srl8_UUT_VEL_READ_pos_shift_reg_c_6 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(ten_ms_pulse),
        .CLK(mclk_IBUF_BUFG),
        .D(pos_count[1]),
        .Q(\pos_shift_reg[7][1]_srl8_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ));
  (* srl_bus_name = "\UUT_VEL_READ/pos_shift_reg[7] " *) 
  (* srl_name = "\UUT_VEL_READ/pos_shift_reg[7][2]_srl8_UUT_VEL_READ_pos_shift_reg_c_6 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \pos_shift_reg[7][2]_srl8_UUT_VEL_READ_pos_shift_reg_c_6 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(ten_ms_pulse),
        .CLK(mclk_IBUF_BUFG),
        .D(pos_count[2]),
        .Q(\pos_shift_reg[7][2]_srl8_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ));
  (* srl_bus_name = "\UUT_VEL_READ/pos_shift_reg[7] " *) 
  (* srl_name = "\UUT_VEL_READ/pos_shift_reg[7][3]_srl8_UUT_VEL_READ_pos_shift_reg_c_6 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \pos_shift_reg[7][3]_srl8_UUT_VEL_READ_pos_shift_reg_c_6 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(ten_ms_pulse),
        .CLK(mclk_IBUF_BUFG),
        .D(pos_count[3]),
        .Q(\pos_shift_reg[7][3]_srl8_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ));
  (* srl_bus_name = "\UUT_VEL_READ/pos_shift_reg[7] " *) 
  (* srl_name = "\UUT_VEL_READ/pos_shift_reg[7][4]_srl8_UUT_VEL_READ_pos_shift_reg_c_6 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \pos_shift_reg[7][4]_srl8_UUT_VEL_READ_pos_shift_reg_c_6 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(ten_ms_pulse),
        .CLK(mclk_IBUF_BUFG),
        .D(pos_count[4]),
        .Q(\pos_shift_reg[7][4]_srl8_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ));
  (* srl_bus_name = "\UUT_VEL_READ/pos_shift_reg[7] " *) 
  (* srl_name = "\UUT_VEL_READ/pos_shift_reg[7][5]_srl8_UUT_VEL_READ_pos_shift_reg_c_6 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \pos_shift_reg[7][5]_srl8_UUT_VEL_READ_pos_shift_reg_c_6 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(ten_ms_pulse),
        .CLK(mclk_IBUF_BUFG),
        .D(pos_count[5]),
        .Q(\pos_shift_reg[7][5]_srl8_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ));
  (* srl_bus_name = "\UUT_VEL_READ/pos_shift_reg[7] " *) 
  (* srl_name = "\UUT_VEL_READ/pos_shift_reg[7][6]_srl8_UUT_VEL_READ_pos_shift_reg_c_6 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \pos_shift_reg[7][6]_srl8_UUT_VEL_READ_pos_shift_reg_c_6 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(ten_ms_pulse),
        .CLK(mclk_IBUF_BUFG),
        .D(pos_count[6]),
        .Q(\pos_shift_reg[7][6]_srl8_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ));
  (* srl_bus_name = "\UUT_VEL_READ/pos_shift_reg[7] " *) 
  (* srl_name = "\UUT_VEL_READ/pos_shift_reg[7][7]_srl8_UUT_VEL_READ_pos_shift_reg_c_6 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \pos_shift_reg[7][7]_srl8_UUT_VEL_READ_pos_shift_reg_c_6 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(ten_ms_pulse),
        .CLK(mclk_IBUF_BUFG),
        .D(pos_count[7]),
        .Q(\pos_shift_reg[7][7]_srl8_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pos_shift_reg[8][0]_UUT_VEL_READ_pos_shift_reg_c_7 
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .D(\pos_shift_reg[7][0]_srl8_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ),
        .Q(\pos_shift_reg[8][0]_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pos_shift_reg[8][1]_UUT_VEL_READ_pos_shift_reg_c_7 
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .D(\pos_shift_reg[7][1]_srl8_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ),
        .Q(\pos_shift_reg[8][1]_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pos_shift_reg[8][2]_UUT_VEL_READ_pos_shift_reg_c_7 
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .D(\pos_shift_reg[7][2]_srl8_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ),
        .Q(\pos_shift_reg[8][2]_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pos_shift_reg[8][3]_UUT_VEL_READ_pos_shift_reg_c_7 
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .D(\pos_shift_reg[7][3]_srl8_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ),
        .Q(\pos_shift_reg[8][3]_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pos_shift_reg[8][4]_UUT_VEL_READ_pos_shift_reg_c_7 
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .D(\pos_shift_reg[7][4]_srl8_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ),
        .Q(\pos_shift_reg[8][4]_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pos_shift_reg[8][5]_UUT_VEL_READ_pos_shift_reg_c_7 
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .D(\pos_shift_reg[7][5]_srl8_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ),
        .Q(\pos_shift_reg[8][5]_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pos_shift_reg[8][6]_UUT_VEL_READ_pos_shift_reg_c_7 
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .D(\pos_shift_reg[7][6]_srl8_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ),
        .Q(\pos_shift_reg[8][6]_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pos_shift_reg[8][7]_UUT_VEL_READ_pos_shift_reg_c_7 
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .D(\pos_shift_reg[7][7]_srl8_UUT_VEL_READ_pos_shift_reg_c_6_n_0 ),
        .Q(\pos_shift_reg[8][7]_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ),
        .R(1'b0));
  FDCE #(
    .INIT(1'b0)) 
    \pos_shift_reg[9][0] 
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .CLR(reset_IBUF),
        .D(pos_shift_reg_gate__6_n_0),
        .Q(\pos_shift_reg[9] [0]));
  FDCE #(
    .INIT(1'b0)) 
    \pos_shift_reg[9][1] 
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .CLR(reset_IBUF),
        .D(pos_shift_reg_gate__5_n_0),
        .Q(\pos_shift_reg[9] [1]));
  FDCE #(
    .INIT(1'b0)) 
    \pos_shift_reg[9][2] 
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .CLR(reset_IBUF),
        .D(pos_shift_reg_gate__4_n_0),
        .Q(\pos_shift_reg[9] [2]));
  FDCE #(
    .INIT(1'b0)) 
    \pos_shift_reg[9][3] 
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .CLR(reset_IBUF),
        .D(pos_shift_reg_gate__3_n_0),
        .Q(\pos_shift_reg[9] [3]));
  FDCE #(
    .INIT(1'b0)) 
    \pos_shift_reg[9][4] 
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .CLR(reset_IBUF),
        .D(pos_shift_reg_gate__2_n_0),
        .Q(\pos_shift_reg[9] [4]));
  FDCE #(
    .INIT(1'b0)) 
    \pos_shift_reg[9][5] 
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .CLR(reset_IBUF),
        .D(pos_shift_reg_gate__1_n_0),
        .Q(\pos_shift_reg[9] [5]));
  FDCE #(
    .INIT(1'b0)) 
    \pos_shift_reg[9][6] 
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .CLR(reset_IBUF),
        .D(pos_shift_reg_gate__0_n_0),
        .Q(\pos_shift_reg[9] [6]));
  FDCE #(
    .INIT(1'b0)) 
    \pos_shift_reg[9][7] 
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .CLR(reset_IBUF),
        .D(pos_shift_reg_gate_n_0),
        .Q(\pos_shift_reg[9] [7]));
  FDCE #(
    .INIT(1'b0)) 
    pos_shift_reg_c
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .CLR(reset_IBUF),
        .D(1'b1),
        .Q(pos_shift_reg_c_n_0));
  FDCE #(
    .INIT(1'b0)) 
    pos_shift_reg_c_0
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .CLR(reset_IBUF),
        .D(pos_shift_reg_c_n_0),
        .Q(pos_shift_reg_c_0_n_0));
  FDCE #(
    .INIT(1'b0)) 
    pos_shift_reg_c_1
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .CLR(reset_IBUF),
        .D(pos_shift_reg_c_0_n_0),
        .Q(pos_shift_reg_c_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    pos_shift_reg_c_2
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .CLR(reset_IBUF),
        .D(pos_shift_reg_c_1_n_0),
        .Q(pos_shift_reg_c_2_n_0));
  FDCE #(
    .INIT(1'b0)) 
    pos_shift_reg_c_3
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .CLR(reset_IBUF),
        .D(pos_shift_reg_c_2_n_0),
        .Q(pos_shift_reg_c_3_n_0));
  FDCE #(
    .INIT(1'b0)) 
    pos_shift_reg_c_4
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .CLR(reset_IBUF),
        .D(pos_shift_reg_c_3_n_0),
        .Q(pos_shift_reg_c_4_n_0));
  FDCE #(
    .INIT(1'b0)) 
    pos_shift_reg_c_5
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .CLR(reset_IBUF),
        .D(pos_shift_reg_c_4_n_0),
        .Q(pos_shift_reg_c_5_n_0));
  FDCE #(
    .INIT(1'b0)) 
    pos_shift_reg_c_6
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .CLR(reset_IBUF),
        .D(pos_shift_reg_c_5_n_0),
        .Q(pos_shift_reg_c_6_n_0));
  FDCE #(
    .INIT(1'b0)) 
    pos_shift_reg_c_7
       (.C(mclk_IBUF_BUFG),
        .CE(ten_ms_pulse),
        .CLR(reset_IBUF),
        .D(pos_shift_reg_c_6_n_0),
        .Q(pos_shift_reg_c_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h8)) 
    pos_shift_reg_gate
       (.I0(\pos_shift_reg[8][7]_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ),
        .I1(pos_shift_reg_c_7_n_0),
        .O(pos_shift_reg_gate_n_0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h8)) 
    pos_shift_reg_gate__0
       (.I0(\pos_shift_reg[8][6]_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ),
        .I1(pos_shift_reg_c_7_n_0),
        .O(pos_shift_reg_gate__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h8)) 
    pos_shift_reg_gate__1
       (.I0(\pos_shift_reg[8][5]_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ),
        .I1(pos_shift_reg_c_7_n_0),
        .O(pos_shift_reg_gate__1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h8)) 
    pos_shift_reg_gate__2
       (.I0(\pos_shift_reg[8][4]_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ),
        .I1(pos_shift_reg_c_7_n_0),
        .O(pos_shift_reg_gate__2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h8)) 
    pos_shift_reg_gate__3
       (.I0(\pos_shift_reg[8][3]_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ),
        .I1(pos_shift_reg_c_7_n_0),
        .O(pos_shift_reg_gate__3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h8)) 
    pos_shift_reg_gate__4
       (.I0(\pos_shift_reg[8][2]_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ),
        .I1(pos_shift_reg_c_7_n_0),
        .O(pos_shift_reg_gate__4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h8)) 
    pos_shift_reg_gate__5
       (.I0(\pos_shift_reg[8][1]_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ),
        .I1(pos_shift_reg_c_7_n_0),
        .O(pos_shift_reg_gate__5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h8)) 
    pos_shift_reg_gate__6
       (.I0(\pos_shift_reg[8][0]_UUT_VEL_READ_pos_shift_reg_c_7_n_0 ),
        .I1(pos_shift_reg_c_7_n_0),
        .O(pos_shift_reg_gate__6_n_0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \rcount[0]_i_10 
       (.I0(rcount_reg[2]),
        .I1(rcount_reg[3]),
        .I2(rcount_reg[0]),
        .I3(rcount_reg[1]),
        .I4(rcount_reg[5]),
        .I5(rcount_reg[4]),
        .O(\rcount[0]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAABBBBBBBBB)) 
    \rcount[0]_i_2 
       (.I0(\rcount[0]_i_7_n_0 ),
        .I1(rcount_reg[15]),
        .I2(rcount_reg[10]),
        .I3(rcount_reg[13]),
        .I4(\rcount[0]_i_8_n_0 ),
        .I5(rcount_reg[14]),
        .O(\rcount[0]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rcount[0]_i_3 
       (.I0(\rcount[0]_i_2_n_0 ),
        .I1(rcount_reg[3]),
        .O(\rcount[0]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rcount[0]_i_4 
       (.I0(\rcount[0]_i_2_n_0 ),
        .I1(rcount_reg[2]),
        .O(\rcount[0]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rcount[0]_i_5 
       (.I0(\rcount[0]_i_2_n_0 ),
        .I1(rcount_reg[1]),
        .O(\rcount[0]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h4)) 
    \rcount[0]_i_6 
       (.I0(rcount_reg[0]),
        .I1(\rcount[0]_i_2_n_0 ),
        .O(\rcount[0]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \rcount[0]_i_7 
       (.I0(rcount_reg[19]),
        .I1(rcount_reg[16]),
        .I2(rcount_reg[18]),
        .I3(rcount_reg[17]),
        .O(\rcount[0]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hFFFEEEEE)) 
    \rcount[0]_i_8 
       (.I0(rcount_reg[12]),
        .I1(rcount_reg[11]),
        .I2(\rcount[0]_i_9_n_0 ),
        .I3(\rcount[0]_i_10_n_0 ),
        .I4(rcount_reg[9]),
        .O(\rcount[0]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \rcount[0]_i_9 
       (.I0(rcount_reg[7]),
        .I1(rcount_reg[6]),
        .I2(rcount_reg[8]),
        .O(\rcount[0]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rcount[12]_i_2 
       (.I0(\rcount[0]_i_2_n_0 ),
        .I1(rcount_reg[15]),
        .O(\rcount[12]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rcount[12]_i_3 
       (.I0(\rcount[0]_i_2_n_0 ),
        .I1(rcount_reg[14]),
        .O(\rcount[12]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rcount[12]_i_4 
       (.I0(\rcount[0]_i_2_n_0 ),
        .I1(rcount_reg[13]),
        .O(\rcount[12]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rcount[12]_i_5 
       (.I0(\rcount[0]_i_2_n_0 ),
        .I1(rcount_reg[12]),
        .O(\rcount[12]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rcount[16]_i_2 
       (.I0(\rcount[0]_i_2_n_0 ),
        .I1(rcount_reg[19]),
        .O(\rcount[16]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rcount[16]_i_3 
       (.I0(\rcount[0]_i_2_n_0 ),
        .I1(rcount_reg[18]),
        .O(\rcount[16]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rcount[16]_i_4 
       (.I0(\rcount[0]_i_2_n_0 ),
        .I1(rcount_reg[17]),
        .O(\rcount[16]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rcount[16]_i_5 
       (.I0(\rcount[0]_i_2_n_0 ),
        .I1(rcount_reg[16]),
        .O(\rcount[16]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rcount[4]_i_2 
       (.I0(\rcount[0]_i_2_n_0 ),
        .I1(rcount_reg[7]),
        .O(\rcount[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rcount[4]_i_3 
       (.I0(\rcount[0]_i_2_n_0 ),
        .I1(rcount_reg[6]),
        .O(\rcount[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rcount[4]_i_4 
       (.I0(\rcount[0]_i_2_n_0 ),
        .I1(rcount_reg[5]),
        .O(\rcount[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rcount[4]_i_5 
       (.I0(\rcount[0]_i_2_n_0 ),
        .I1(rcount_reg[4]),
        .O(\rcount[4]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rcount[8]_i_2 
       (.I0(\rcount[0]_i_2_n_0 ),
        .I1(rcount_reg[11]),
        .O(\rcount[8]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rcount[8]_i_3 
       (.I0(\rcount[0]_i_2_n_0 ),
        .I1(rcount_reg[10]),
        .O(\rcount[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rcount[8]_i_4 
       (.I0(\rcount[0]_i_2_n_0 ),
        .I1(rcount_reg[9]),
        .O(\rcount[8]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \rcount[8]_i_5 
       (.I0(\rcount[0]_i_2_n_0 ),
        .I1(rcount_reg[8]),
        .O(\rcount[8]_i_5_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \rcount_reg[0] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
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
  FDCE #(
    .INIT(1'b0)) 
    \rcount_reg[10] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\rcount_reg[8]_i_1_n_5 ),
        .Q(rcount_reg[10]));
  FDCE #(
    .INIT(1'b0)) 
    \rcount_reg[11] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\rcount_reg[8]_i_1_n_4 ),
        .Q(rcount_reg[11]));
  FDCE #(
    .INIT(1'b0)) 
    \rcount_reg[12] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
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
  FDCE #(
    .INIT(1'b0)) 
    \rcount_reg[13] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\rcount_reg[12]_i_1_n_6 ),
        .Q(rcount_reg[13]));
  FDCE #(
    .INIT(1'b0)) 
    \rcount_reg[14] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\rcount_reg[12]_i_1_n_5 ),
        .Q(rcount_reg[14]));
  FDCE #(
    .INIT(1'b0)) 
    \rcount_reg[15] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\rcount_reg[12]_i_1_n_4 ),
        .Q(rcount_reg[15]));
  FDCE #(
    .INIT(1'b0)) 
    \rcount_reg[16] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
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
  FDCE #(
    .INIT(1'b0)) 
    \rcount_reg[17] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\rcount_reg[16]_i_1_n_6 ),
        .Q(rcount_reg[17]));
  FDCE #(
    .INIT(1'b0)) 
    \rcount_reg[18] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\rcount_reg[16]_i_1_n_5 ),
        .Q(rcount_reg[18]));
  FDCE #(
    .INIT(1'b0)) 
    \rcount_reg[19] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\rcount_reg[16]_i_1_n_4 ),
        .Q(rcount_reg[19]));
  FDCE #(
    .INIT(1'b0)) 
    \rcount_reg[1] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\rcount_reg[0]_i_1_n_6 ),
        .Q(rcount_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \rcount_reg[2] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\rcount_reg[0]_i_1_n_5 ),
        .Q(rcount_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \rcount_reg[3] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\rcount_reg[0]_i_1_n_4 ),
        .Q(rcount_reg[3]));
  FDCE #(
    .INIT(1'b0)) 
    \rcount_reg[4] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
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
  FDCE #(
    .INIT(1'b0)) 
    \rcount_reg[5] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\rcount_reg[4]_i_1_n_6 ),
        .Q(rcount_reg[5]));
  FDCE #(
    .INIT(1'b0)) 
    \rcount_reg[6] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\rcount_reg[4]_i_1_n_5 ),
        .Q(rcount_reg[6]));
  FDCE #(
    .INIT(1'b0)) 
    \rcount_reg[7] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\rcount_reg[4]_i_1_n_4 ),
        .Q(rcount_reg[7]));
  FDCE #(
    .INIT(1'b0)) 
    \rcount_reg[8] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
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
  FDCE #(
    .INIT(1'b0)) 
    \rcount_reg[9] 
       (.C(mclk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
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
    .INIT(16'h30B8)) 
    velocity1_carry_i_1
       (.I0(velocity3[10]),
        .I1(moving_sum[11]),
        .I2(moving_sum[10]),
        .I3(velocity3[11]),
        .O(velocity1_carry_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 velocity1_carry_i_10
       (.CI(1'b0),
        .CO({velocity1_carry_i_10_n_0,velocity1_carry_i_10_n_1,velocity1_carry_i_10_n_2,velocity1_carry_i_10_n_3}),
        .CYINIT(velocity1_carry_i_18_n_0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({velocity3[4],NLW_velocity1_carry_i_10_O_UNCONNECTED[2:0]}),
        .S({velocity1_carry_i_19_n_0,velocity1_carry_i_20_n_0,velocity1_carry_i_21_n_0,velocity1_carry_i_22_n_0}));
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
       (.I0(moving_sum[0]),
        .O(velocity1_carry_i_18_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    velocity1_carry_i_19
       (.I0(moving_sum[4]),
        .O(velocity1_carry_i_19_n_0));
  LUT5 #(
    .INIT(32'hFFBBFCB8)) 
    velocity1_carry_i_2
       (.I0(velocity3[6]),
        .I1(moving_sum[11]),
        .I2(moving_sum[6]),
        .I3(velocity3[7]),
        .I4(moving_sum[7]),
        .O(velocity1_carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    velocity1_carry_i_20
       (.I0(moving_sum[3]),
        .O(velocity1_carry_i_20_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    velocity1_carry_i_21
       (.I0(moving_sum[2]),
        .O(velocity1_carry_i_21_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    velocity1_carry_i_22
       (.I0(moving_sum[1]),
        .O(velocity1_carry_i_22_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    velocity1_carry_i_3
       (.I0(velocity3[5]),
        .I1(moving_sum[11]),
        .I2(moving_sum[5]),
        .O(velocity2));
  LUT4 #(
    .INIT(16'h0347)) 
    velocity1_carry_i_4
       (.I0(velocity3[11]),
        .I1(moving_sum[11]),
        .I2(moving_sum[10]),
        .I3(velocity3[10]),
        .O(velocity1_carry_i_4_n_0));
  LUT5 #(
    .INIT(32'h8F808080)) 
    velocity1_carry_i_5
       (.I0(velocity3[9]),
        .I1(velocity3[8]),
        .I2(moving_sum[11]),
        .I3(moving_sum[8]),
        .I4(moving_sum[9]),
        .O(velocity1_carry_i_5_n_0));
  LUT5 #(
    .INIT(32'h00053305)) 
    velocity1_carry_i_6
       (.I0(moving_sum[7]),
        .I1(velocity3[7]),
        .I2(moving_sum[6]),
        .I3(moving_sum[11]),
        .I4(velocity3[6]),
        .O(velocity1_carry_i_6_n_0));
  LUT5 #(
    .INIT(32'h202F2020)) 
    velocity1_carry_i_7
       (.I0(velocity3[4]),
        .I1(velocity3[5]),
        .I2(moving_sum[11]),
        .I3(moving_sum[5]),
        .I4(moving_sum[4]),
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
