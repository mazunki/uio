-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
-- Date        : Fri May  6 19:42:10 2022
-- Host        : stamford.ifi.uio.no running 64-bit Red Hat Enterprise Linux release 8.5 (Ootpa)
-- Command     : write_vhdl -force -mode funcsim
--               /uio/hume/student-u81/rolfvh/IN3160-22/oblig10/oblig_10_system/oblig_10_system.gen/sources_1/bd/tutorial_bd/ip/tutorial_bd_fpga_system_0_0/tutorial_bd_fpga_system_0_0_sim_netlist.vhdl
-- Design      : tutorial_bd_fpga_system_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity tutorial_bd_fpga_system_0_0_input_sync is
  port (
    SA_synch : out STD_LOGIC;
    SB_synch : out STD_LOGIC;
    SA : in STD_LOGIC;
    mclk : in STD_LOGIC;
    SB : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of tutorial_bd_fpga_system_0_0_input_sync : entity is "input_sync";
end tutorial_bd_fpga_system_0_0_input_sync;

architecture STRUCTURE of tutorial_bd_fpga_system_0_0_input_sync is
  signal temp_a : STD_LOGIC;
  signal temp_b : STD_LOGIC;
begin
SA_synch_reg: unisim.vcomponents.FDRE
     port map (
      C => mclk,
      CE => '1',
      D => temp_a,
      Q => SA_synch,
      R => '0'
    );
SB_synch_reg: unisim.vcomponents.FDRE
     port map (
      C => mclk,
      CE => '1',
      D => temp_b,
      Q => SB_synch,
      R => '0'
    );
temp_a_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => mclk,
      CE => '1',
      D => SA,
      Q => temp_a,
      R => '0'
    );
temp_b_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => mclk,
      CE => '1',
      D => SB,
      Q => temp_b,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity tutorial_bd_fpga_system_0_0_output_sync is
  port (
    DIR_synch : out STD_LOGIC;
    EN_synch : out STD_LOGIC;
    dir : in STD_LOGIC;
    mclk : in STD_LOGIC;
    en : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of tutorial_bd_fpga_system_0_0_output_sync : entity is "output_sync";
end tutorial_bd_fpga_system_0_0_output_sync;

architecture STRUCTURE of tutorial_bd_fpga_system_0_0_output_sync is
begin
DIR_synch_reg: unisim.vcomponents.FDRE
     port map (
      C => mclk,
      CE => '1',
      D => dir,
      Q => DIR_synch,
      R => '0'
    );
EN_synch_reg: unisim.vcomponents.FDRE
     port map (
      C => mclk,
      CE => '1',
      D => en,
      Q => EN_synch,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity tutorial_bd_fpga_system_0_0_pulse_width_modulator is
  port (
    en : out STD_LOGIC;
    dir : out STD_LOGIC;
    mclk : in STD_LOGIC;
    reset : in STD_LOGIC;
    gpio : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of tutorial_bd_fpga_system_0_0_pulse_width_modulator : entity is "pulse_width_modulator";
end tutorial_bd_fpga_system_0_0_pulse_width_modulator;

architecture STRUCTURE of tutorial_bd_fpga_system_0_0_pulse_width_modulator is
  signal \FSM_sequential_moore_state_curr[1]_i_2_n_0\ : STD_LOGIC;
  signal moore_state_curr : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal moore_state_next : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal pwm : STD_LOGIC;
  signal pwm0_carry_i_1_n_0 : STD_LOGIC;
  signal pwm0_carry_i_2_n_0 : STD_LOGIC;
  signal pwm0_carry_i_3_n_0 : STD_LOGIC;
  signal pwm0_carry_i_4_n_0 : STD_LOGIC;
  signal pwm0_carry_i_5_n_0 : STD_LOGIC;
  signal pwm0_carry_i_6_n_0 : STD_LOGIC;
  signal pwm0_carry_i_7_n_0 : STD_LOGIC;
  signal pwm0_carry_i_8_n_0 : STD_LOGIC;
  signal pwm0_carry_n_1 : STD_LOGIC;
  signal pwm0_carry_n_2 : STD_LOGIC;
  signal pwm0_carry_n_3 : STD_LOGIC;
  signal \pwm_counter[0]_i_2_n_0\ : STD_LOGIC;
  signal pwm_counter_reg : STD_LOGIC_VECTOR ( 19 downto 12 );
  signal \pwm_counter_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \pwm_counter_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \pwm_counter_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \pwm_counter_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \pwm_counter_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \pwm_counter_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \pwm_counter_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \pwm_counter_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \pwm_counter_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \pwm_counter_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \pwm_counter_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \pwm_counter_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \pwm_counter_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \pwm_counter_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \pwm_counter_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \pwm_counter_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \pwm_counter_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \pwm_counter_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \pwm_counter_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \pwm_counter_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \pwm_counter_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \pwm_counter_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \pwm_counter_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \pwm_counter_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \pwm_counter_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \pwm_counter_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \pwm_counter_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \pwm_counter_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \pwm_counter_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \pwm_counter_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \pwm_counter_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \pwm_counter_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \pwm_counter_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \pwm_counter_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \pwm_counter_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \pwm_counter_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \pwm_counter_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \pwm_counter_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \pwm_counter_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \pwm_counter_reg_n_0_[0]\ : STD_LOGIC;
  signal \pwm_counter_reg_n_0_[10]\ : STD_LOGIC;
  signal \pwm_counter_reg_n_0_[11]\ : STD_LOGIC;
  signal \pwm_counter_reg_n_0_[1]\ : STD_LOGIC;
  signal \pwm_counter_reg_n_0_[2]\ : STD_LOGIC;
  signal \pwm_counter_reg_n_0_[3]\ : STD_LOGIC;
  signal \pwm_counter_reg_n_0_[4]\ : STD_LOGIC;
  signal \pwm_counter_reg_n_0_[5]\ : STD_LOGIC;
  signal \pwm_counter_reg_n_0_[6]\ : STD_LOGIC;
  signal \pwm_counter_reg_n_0_[7]\ : STD_LOGIC;
  signal \pwm_counter_reg_n_0_[8]\ : STD_LOGIC;
  signal \pwm_counter_reg_n_0_[9]\ : STD_LOGIC;
  signal NLW_pwm0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_pwm_counter_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_moore_state_curr[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \FSM_sequential_moore_state_curr[1]_i_1\ : label is "soft_lutpair0";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_moore_state_curr_reg[0]\ : label is "forward:01,forward_idle:00,reverse_idle:10,reverse:11";
  attribute FSM_ENCODED_STATES of \FSM_sequential_moore_state_curr_reg[1]\ : label is "forward:01,forward_idle:00,reverse_idle:10,reverse:11";
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of pwm0_carry : label is 11;
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \pwm_counter_reg[0]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \pwm_counter_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \pwm_counter_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \pwm_counter_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \pwm_counter_reg[8]_i_1\ : label is 11;
begin
DIR_synch_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moore_state_curr(1),
      O => dir
    );
EN_synch_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => moore_state_curr(0),
      I1 => pwm,
      O => en
    );
\FSM_sequential_moore_state_curr[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA54"
    )
        port map (
      I0 => moore_state_curr(1),
      I1 => gpio(6),
      I2 => \FSM_sequential_moore_state_curr[1]_i_2_n_0\,
      I3 => gpio(7),
      O => moore_state_next(0)
    );
\FSM_sequential_moore_state_curr[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8B8B8B9"
    )
        port map (
      I0 => moore_state_curr(1),
      I1 => moore_state_curr(0),
      I2 => gpio(7),
      I3 => \FSM_sequential_moore_state_curr[1]_i_2_n_0\,
      I4 => gpio(6),
      O => moore_state_next(1)
    );
\FSM_sequential_moore_state_curr[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => gpio(0),
      I1 => gpio(1),
      I2 => gpio(2),
      I3 => gpio(3),
      I4 => gpio(4),
      I5 => gpio(5),
      O => \FSM_sequential_moore_state_curr[1]_i_2_n_0\
    );
\FSM_sequential_moore_state_curr_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => moore_state_next(0),
      Q => moore_state_curr(0)
    );
\FSM_sequential_moore_state_curr_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => moore_state_next(1),
      Q => moore_state_curr(1)
    );
pwm0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => pwm,
      CO(2) => pwm0_carry_n_1,
      CO(1) => pwm0_carry_n_2,
      CO(0) => pwm0_carry_n_3,
      CYINIT => '0',
      DI(3) => pwm0_carry_i_1_n_0,
      DI(2) => pwm0_carry_i_2_n_0,
      DI(1) => pwm0_carry_i_3_n_0,
      DI(0) => pwm0_carry_i_4_n_0,
      O(3 downto 0) => NLW_pwm0_carry_O_UNCONNECTED(3 downto 0),
      S(3) => pwm0_carry_i_5_n_0,
      S(2) => pwm0_carry_i_6_n_0,
      S(1) => pwm0_carry_i_7_n_0,
      S(0) => pwm0_carry_i_8_n_0
    );
pwm0_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => gpio(6),
      I1 => pwm_counter_reg(18),
      I2 => pwm_counter_reg(19),
      I3 => gpio(7),
      O => pwm0_carry_i_1_n_0
    );
pwm0_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => gpio(4),
      I1 => pwm_counter_reg(16),
      I2 => pwm_counter_reg(17),
      I3 => gpio(5),
      O => pwm0_carry_i_2_n_0
    );
pwm0_carry_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => gpio(2),
      I1 => pwm_counter_reg(14),
      I2 => pwm_counter_reg(15),
      I3 => gpio(3),
      O => pwm0_carry_i_3_n_0
    );
pwm0_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => gpio(0),
      I1 => pwm_counter_reg(12),
      I2 => pwm_counter_reg(13),
      I3 => gpio(1),
      O => pwm0_carry_i_4_n_0
    );
pwm0_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => gpio(6),
      I1 => pwm_counter_reg(18),
      I2 => gpio(7),
      I3 => pwm_counter_reg(19),
      O => pwm0_carry_i_5_n_0
    );
pwm0_carry_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => gpio(4),
      I1 => pwm_counter_reg(16),
      I2 => gpio(5),
      I3 => pwm_counter_reg(17),
      O => pwm0_carry_i_6_n_0
    );
pwm0_carry_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => gpio(2),
      I1 => pwm_counter_reg(14),
      I2 => gpio(3),
      I3 => pwm_counter_reg(15),
      O => pwm0_carry_i_7_n_0
    );
pwm0_carry_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => gpio(0),
      I1 => pwm_counter_reg(12),
      I2 => gpio(1),
      I3 => pwm_counter_reg(13),
      O => pwm0_carry_i_8_n_0
    );
\pwm_counter[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \pwm_counter_reg_n_0_[0]\,
      O => \pwm_counter[0]_i_2_n_0\
    );
\pwm_counter_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \pwm_counter_reg[0]_i_1_n_7\,
      Q => \pwm_counter_reg_n_0_[0]\
    );
\pwm_counter_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \pwm_counter_reg[0]_i_1_n_0\,
      CO(2) => \pwm_counter_reg[0]_i_1_n_1\,
      CO(1) => \pwm_counter_reg[0]_i_1_n_2\,
      CO(0) => \pwm_counter_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \pwm_counter_reg[0]_i_1_n_4\,
      O(2) => \pwm_counter_reg[0]_i_1_n_5\,
      O(1) => \pwm_counter_reg[0]_i_1_n_6\,
      O(0) => \pwm_counter_reg[0]_i_1_n_7\,
      S(3) => \pwm_counter_reg_n_0_[3]\,
      S(2) => \pwm_counter_reg_n_0_[2]\,
      S(1) => \pwm_counter_reg_n_0_[1]\,
      S(0) => \pwm_counter[0]_i_2_n_0\
    );
\pwm_counter_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \pwm_counter_reg[8]_i_1_n_5\,
      Q => \pwm_counter_reg_n_0_[10]\
    );
\pwm_counter_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \pwm_counter_reg[8]_i_1_n_4\,
      Q => \pwm_counter_reg_n_0_[11]\
    );
\pwm_counter_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \pwm_counter_reg[12]_i_1_n_7\,
      Q => pwm_counter_reg(12)
    );
\pwm_counter_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pwm_counter_reg[8]_i_1_n_0\,
      CO(3) => \pwm_counter_reg[12]_i_1_n_0\,
      CO(2) => \pwm_counter_reg[12]_i_1_n_1\,
      CO(1) => \pwm_counter_reg[12]_i_1_n_2\,
      CO(0) => \pwm_counter_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \pwm_counter_reg[12]_i_1_n_4\,
      O(2) => \pwm_counter_reg[12]_i_1_n_5\,
      O(1) => \pwm_counter_reg[12]_i_1_n_6\,
      O(0) => \pwm_counter_reg[12]_i_1_n_7\,
      S(3 downto 0) => pwm_counter_reg(15 downto 12)
    );
\pwm_counter_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \pwm_counter_reg[12]_i_1_n_6\,
      Q => pwm_counter_reg(13)
    );
\pwm_counter_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \pwm_counter_reg[12]_i_1_n_5\,
      Q => pwm_counter_reg(14)
    );
\pwm_counter_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \pwm_counter_reg[12]_i_1_n_4\,
      Q => pwm_counter_reg(15)
    );
\pwm_counter_reg[16]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \pwm_counter_reg[16]_i_1_n_7\,
      Q => pwm_counter_reg(16)
    );
\pwm_counter_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pwm_counter_reg[12]_i_1_n_0\,
      CO(3) => \NLW_pwm_counter_reg[16]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \pwm_counter_reg[16]_i_1_n_1\,
      CO(1) => \pwm_counter_reg[16]_i_1_n_2\,
      CO(0) => \pwm_counter_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \pwm_counter_reg[16]_i_1_n_4\,
      O(2) => \pwm_counter_reg[16]_i_1_n_5\,
      O(1) => \pwm_counter_reg[16]_i_1_n_6\,
      O(0) => \pwm_counter_reg[16]_i_1_n_7\,
      S(3 downto 0) => pwm_counter_reg(19 downto 16)
    );
\pwm_counter_reg[17]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \pwm_counter_reg[16]_i_1_n_6\,
      Q => pwm_counter_reg(17)
    );
\pwm_counter_reg[18]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \pwm_counter_reg[16]_i_1_n_5\,
      Q => pwm_counter_reg(18)
    );
\pwm_counter_reg[19]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \pwm_counter_reg[16]_i_1_n_4\,
      Q => pwm_counter_reg(19)
    );
\pwm_counter_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \pwm_counter_reg[0]_i_1_n_6\,
      Q => \pwm_counter_reg_n_0_[1]\
    );
\pwm_counter_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \pwm_counter_reg[0]_i_1_n_5\,
      Q => \pwm_counter_reg_n_0_[2]\
    );
\pwm_counter_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \pwm_counter_reg[0]_i_1_n_4\,
      Q => \pwm_counter_reg_n_0_[3]\
    );
\pwm_counter_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \pwm_counter_reg[4]_i_1_n_7\,
      Q => \pwm_counter_reg_n_0_[4]\
    );
\pwm_counter_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pwm_counter_reg[0]_i_1_n_0\,
      CO(3) => \pwm_counter_reg[4]_i_1_n_0\,
      CO(2) => \pwm_counter_reg[4]_i_1_n_1\,
      CO(1) => \pwm_counter_reg[4]_i_1_n_2\,
      CO(0) => \pwm_counter_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \pwm_counter_reg[4]_i_1_n_4\,
      O(2) => \pwm_counter_reg[4]_i_1_n_5\,
      O(1) => \pwm_counter_reg[4]_i_1_n_6\,
      O(0) => \pwm_counter_reg[4]_i_1_n_7\,
      S(3) => \pwm_counter_reg_n_0_[7]\,
      S(2) => \pwm_counter_reg_n_0_[6]\,
      S(1) => \pwm_counter_reg_n_0_[5]\,
      S(0) => \pwm_counter_reg_n_0_[4]\
    );
\pwm_counter_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \pwm_counter_reg[4]_i_1_n_6\,
      Q => \pwm_counter_reg_n_0_[5]\
    );
\pwm_counter_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \pwm_counter_reg[4]_i_1_n_5\,
      Q => \pwm_counter_reg_n_0_[6]\
    );
\pwm_counter_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \pwm_counter_reg[4]_i_1_n_4\,
      Q => \pwm_counter_reg_n_0_[7]\
    );
\pwm_counter_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \pwm_counter_reg[8]_i_1_n_7\,
      Q => \pwm_counter_reg_n_0_[8]\
    );
\pwm_counter_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \pwm_counter_reg[4]_i_1_n_0\,
      CO(3) => \pwm_counter_reg[8]_i_1_n_0\,
      CO(2) => \pwm_counter_reg[8]_i_1_n_1\,
      CO(1) => \pwm_counter_reg[8]_i_1_n_2\,
      CO(0) => \pwm_counter_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \pwm_counter_reg[8]_i_1_n_4\,
      O(2) => \pwm_counter_reg[8]_i_1_n_5\,
      O(1) => \pwm_counter_reg[8]_i_1_n_6\,
      O(0) => \pwm_counter_reg[8]_i_1_n_7\,
      S(3) => \pwm_counter_reg_n_0_[11]\,
      S(2) => \pwm_counter_reg_n_0_[10]\,
      S(1) => \pwm_counter_reg_n_0_[9]\,
      S(0) => \pwm_counter_reg_n_0_[8]\
    );
\pwm_counter_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \pwm_counter_reg[8]_i_1_n_6\,
      Q => \pwm_counter_reg_n_0_[9]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity tutorial_bd_fpga_system_0_0_quadrature_decoder is
  port (
    pos_dec : out STD_LOGIC;
    \__11\ : out STD_LOGIC;
    SB_synch : in STD_LOGIC;
    SA_synch : in STD_LOGIC;
    mclk : in STD_LOGIC;
    reset : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of tutorial_bd_fpga_system_0_0_quadrature_decoder : entity is "quadrature_decoder";
end tutorial_bd_fpga_system_0_0_quadrature_decoder;

architecture STRUCTURE of tutorial_bd_fpga_system_0_0_quadrature_decoder is
  signal \FSM_sequential_mealy_state_curr[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_mealy_state_curr[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_mealy_state_curr[2]_i_1_n_0\ : STD_LOGIC;
  signal mealy_state_curr : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_mealy_state_curr[0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \FSM_sequential_mealy_state_curr[1]_i_1\ : label is "soft_lutpair2";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_mealy_state_curr_reg[0]\ : label is "s_1:100,s_0:101,s_reset:000,s_2:011,s_init:001,s_3:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_mealy_state_curr_reg[1]\ : label is "s_1:100,s_0:101,s_reset:000,s_2:011,s_init:001,s_3:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_mealy_state_curr_reg[2]\ : label is "s_1:100,s_0:101,s_reset:000,s_2:011,s_init:001,s_3:010";
  attribute SOFT_HLUTNM of \i__carry_i_10\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \i__carry_i_11\ : label is "soft_lutpair1";
begin
\FSM_sequential_mealy_state_curr[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01C3C1D7"
    )
        port map (
      I0 => mealy_state_curr(1),
      I1 => SB_synch,
      I2 => SA_synch,
      I3 => mealy_state_curr(0),
      I4 => mealy_state_curr(2),
      O => \FSM_sequential_mealy_state_curr[0]_i_1_n_0\
    );
\FSM_sequential_mealy_state_curr[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4CCC4C80"
    )
        port map (
      I0 => mealy_state_curr(2),
      I1 => SA_synch,
      I2 => SB_synch,
      I3 => mealy_state_curr(0),
      I4 => mealy_state_curr(1),
      O => \FSM_sequential_mealy_state_curr[1]_i_1_n_0\
    );
\FSM_sequential_mealy_state_curr[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0F0F090A"
    )
        port map (
      I0 => mealy_state_curr(0),
      I1 => SB_synch,
      I2 => SA_synch,
      I3 => mealy_state_curr(1),
      I4 => mealy_state_curr(2),
      O => \FSM_sequential_mealy_state_curr[2]_i_1_n_0\
    );
\FSM_sequential_mealy_state_curr_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \FSM_sequential_mealy_state_curr[0]_i_1_n_0\,
      Q => mealy_state_curr(0)
    );
\FSM_sequential_mealy_state_curr_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \FSM_sequential_mealy_state_curr[1]_i_1_n_0\,
      Q => mealy_state_curr(1)
    );
\FSM_sequential_mealy_state_curr_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \FSM_sequential_mealy_state_curr[2]_i_1_n_0\,
      Q => mealy_state_curr(2)
    );
\i__carry_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"24208180"
    )
        port map (
      I0 => mealy_state_curr(2),
      I1 => SA_synch,
      I2 => SB_synch,
      I3 => mealy_state_curr(1),
      I4 => mealy_state_curr(0),
      O => \__11\
    );
\i__carry_i_11\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"24204202"
    )
        port map (
      I0 => mealy_state_curr(2),
      I1 => SB_synch,
      I2 => SA_synch,
      I3 => mealy_state_curr(1),
      I4 => mealy_state_curr(0),
      O => pos_dec
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity tutorial_bd_fpga_system_0_0_seg7ctrl is
  port (
    c_reg_0 : out STD_LOGIC;
    mclk : in STD_LOGIC;
    reset : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of tutorial_bd_fpga_system_0_0_seg7ctrl : entity is "seg7ctrl";
end tutorial_bd_fpga_system_0_0_seg7ctrl;

architecture STRUCTURE of tutorial_bd_fpga_system_0_0_seg7ctrl is
  signal c_i_1_n_0 : STD_LOGIC;
  signal \^c_reg_0\ : STD_LOGIC;
  signal clock_timer_reg : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal plusOp : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \clock_timer[0]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \clock_timer[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \clock_timer[2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \clock_timer[3]_i_1\ : label is "soft_lutpair3";
begin
  c_reg_0 <= \^c_reg_0\;
c_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000001"
    )
        port map (
      I0 => reset,
      I1 => clock_timer_reg(3),
      I2 => clock_timer_reg(2),
      I3 => clock_timer_reg(0),
      I4 => clock_timer_reg(1),
      I5 => \^c_reg_0\,
      O => c_i_1_n_0
    );
c_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => mclk,
      CE => '1',
      D => c_i_1_n_0,
      Q => \^c_reg_0\,
      R => '0'
    );
\clock_timer[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => clock_timer_reg(0),
      O => plusOp(0)
    );
\clock_timer[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => clock_timer_reg(0),
      I1 => clock_timer_reg(1),
      O => plusOp(1)
    );
\clock_timer[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => clock_timer_reg(0),
      I1 => clock_timer_reg(1),
      I2 => clock_timer_reg(2),
      O => plusOp(2)
    );
\clock_timer[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => clock_timer_reg(1),
      I1 => clock_timer_reg(0),
      I2 => clock_timer_reg(2),
      I3 => clock_timer_reg(3),
      O => plusOp(3)
    );
\clock_timer_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => plusOp(0),
      Q => clock_timer_reg(0)
    );
\clock_timer_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => plusOp(1),
      Q => clock_timer_reg(1)
    );
\clock_timer_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => plusOp(2),
      Q => clock_timer_reg(2)
    );
\clock_timer_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => plusOp(3),
      Q => clock_timer_reg(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity tutorial_bd_fpga_system_0_0_velocity_reader is
  port (
    \moving_sum_reg[11]_0\ : out STD_LOGIC;
    \moving_sum_reg[11]_1\ : out STD_LOGIC;
    abcdefg : out STD_LOGIC_VECTOR ( 6 downto 0 );
    \moving_sum_reg[7]_0\ : out STD_LOGIC;
    \moving_sum_reg[8]_0\ : out STD_LOGIC;
    \moving_sum_reg[9]_0\ : out STD_LOGIC;
    \moving_sum_reg[11]_2\ : out STD_LOGIC;
    \moving_sum_reg[11]_3\ : out STD_LOGIC;
    \moving_sum_reg[5]_0\ : out STD_LOGIC;
    mclk : in STD_LOGIC;
    reset : in STD_LOGIC;
    \__11\ : in STD_LOGIC;
    pos_dec : in STD_LOGIC;
    abcdefg_1_sp_1 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of tutorial_bd_fpga_system_0_0_velocity_reader : entity is "velocity_reader";
end tutorial_bd_fpga_system_0_0_velocity_reader;

architecture STRUCTURE of tutorial_bd_fpga_system_0_0_velocity_reader is
  signal ARG2 : STD_LOGIC_VECTOR ( 9 downto 5 );
  signal ARG3 : STD_LOGIC_VECTOR ( 11 downto 3 );
  signal \_inferred__0/i__carry__0_n_1\ : STD_LOGIC;
  signal \_inferred__0/i__carry__0_n_2\ : STD_LOGIC;
  signal \_inferred__0/i__carry__0_n_3\ : STD_LOGIC;
  signal \_inferred__0/i__carry__0_n_4\ : STD_LOGIC;
  signal \_inferred__0/i__carry__0_n_5\ : STD_LOGIC;
  signal \_inferred__0/i__carry__0_n_6\ : STD_LOGIC;
  signal \_inferred__0/i__carry__0_n_7\ : STD_LOGIC;
  signal \_inferred__0/i__carry_n_0\ : STD_LOGIC;
  signal \_inferred__0/i__carry_n_1\ : STD_LOGIC;
  signal \_inferred__0/i__carry_n_2\ : STD_LOGIC;
  signal \_inferred__0/i__carry_n_3\ : STD_LOGIC;
  signal \_inferred__0/i__carry_n_4\ : STD_LOGIC;
  signal \_inferred__0/i__carry_n_5\ : STD_LOGIC;
  signal \_inferred__0/i__carry_n_6\ : STD_LOGIC;
  signal \_inferred__0/i__carry_n_7\ : STD_LOGIC;
  signal \abcdefg[0]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \abcdefg[0]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \abcdefg[1]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \abcdefg[1]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \abcdefg[1]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \abcdefg[1]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \abcdefg[2]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \abcdefg[2]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \abcdefg[3]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \abcdefg[3]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \abcdefg[4]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \abcdefg[4]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \abcdefg[4]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \abcdefg[4]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \abcdefg[5]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \abcdefg[5]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \abcdefg[6]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \abcdefg[6]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal abcdefg_1_sn_1 : STD_LOGIC;
  signal \gpio2[1]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \gpio2[1]_INST_0_i_1_n_1\ : STD_LOGIC;
  signal \gpio2[1]_INST_0_i_1_n_2\ : STD_LOGIC;
  signal \gpio2[1]_INST_0_i_1_n_3\ : STD_LOGIC;
  signal \gpio2[1]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \gpio2[1]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \gpio2[1]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \gpio2[1]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \gpio2[1]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \gpio2[3]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \gpio2[4]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \gpio2[5]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \gpio2[5]_INST_0_i_1_n_1\ : STD_LOGIC;
  signal \gpio2[5]_INST_0_i_1_n_2\ : STD_LOGIC;
  signal \gpio2[5]_INST_0_i_1_n_3\ : STD_LOGIC;
  signal \gpio2[5]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \gpio2[5]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \gpio2[5]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \gpio2[5]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \gpio2[5]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \gpio2[6]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \gpio2[7]_INST_0_i_1_n_2\ : STD_LOGIC;
  signal \gpio2[7]_INST_0_i_1_n_3\ : STD_LOGIC;
  signal \gpio2[7]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \gpio2[7]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \gpio2[7]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \gpio2[7]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_5_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_6_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_7_n_0\ : STD_LOGIC;
  signal \i__carry_i_12_n_0\ : STD_LOGIC;
  signal \i__carry_i_13_n_0\ : STD_LOGIC;
  signal \i__carry_i_14_n_0\ : STD_LOGIC;
  signal \i__carry_i_1_n_0\ : STD_LOGIC;
  signal \i__carry_i_2_n_0\ : STD_LOGIC;
  signal \i__carry_i_3_n_0\ : STD_LOGIC;
  signal \i__carry_i_4_n_0\ : STD_LOGIC;
  signal \i__carry_i_5_n_0\ : STD_LOGIC;
  signal \i__carry_i_6_n_0\ : STD_LOGIC;
  signal \i__carry_i_7_n_0\ : STD_LOGIC;
  signal \i__carry_i_8_n_0\ : STD_LOGIC;
  signal moving_sum : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \moving_sum[11]_i_1_n_0\ : STD_LOGIC;
  signal \moving_sum[11]_i_2_n_0\ : STD_LOGIC;
  signal \moving_sum[11]_i_3_n_0\ : STD_LOGIC;
  signal \moving_sum[11]_i_4_n_0\ : STD_LOGIC;
  signal \moving_sum[11]_i_5_n_0\ : STD_LOGIC;
  signal \moving_sum_next_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \moving_sum_next_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \moving_sum_next_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \moving_sum_next_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \moving_sum_next_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \moving_sum_next_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \moving_sum_next_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \moving_sum_next_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \moving_sum_next_carry__0_n_0\ : STD_LOGIC;
  signal \moving_sum_next_carry__0_n_1\ : STD_LOGIC;
  signal \moving_sum_next_carry__0_n_2\ : STD_LOGIC;
  signal \moving_sum_next_carry__0_n_3\ : STD_LOGIC;
  signal \moving_sum_next_carry__0_n_4\ : STD_LOGIC;
  signal \moving_sum_next_carry__0_n_5\ : STD_LOGIC;
  signal \moving_sum_next_carry__0_n_6\ : STD_LOGIC;
  signal \moving_sum_next_carry__0_n_7\ : STD_LOGIC;
  signal \moving_sum_next_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \moving_sum_next_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \moving_sum_next_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \moving_sum_next_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \moving_sum_next_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \moving_sum_next_carry__1_n_1\ : STD_LOGIC;
  signal \moving_sum_next_carry__1_n_2\ : STD_LOGIC;
  signal \moving_sum_next_carry__1_n_3\ : STD_LOGIC;
  signal \moving_sum_next_carry__1_n_4\ : STD_LOGIC;
  signal \moving_sum_next_carry__1_n_5\ : STD_LOGIC;
  signal \moving_sum_next_carry__1_n_6\ : STD_LOGIC;
  signal \moving_sum_next_carry__1_n_7\ : STD_LOGIC;
  signal moving_sum_next_carry_i_1_n_0 : STD_LOGIC;
  signal moving_sum_next_carry_i_2_n_0 : STD_LOGIC;
  signal moving_sum_next_carry_i_3_n_0 : STD_LOGIC;
  signal moving_sum_next_carry_i_4_n_0 : STD_LOGIC;
  signal moving_sum_next_carry_i_5_n_0 : STD_LOGIC;
  signal moving_sum_next_carry_i_6_n_0 : STD_LOGIC;
  signal moving_sum_next_carry_i_7_n_0 : STD_LOGIC;
  signal moving_sum_next_carry_i_8_n_0 : STD_LOGIC;
  signal moving_sum_next_carry_n_0 : STD_LOGIC;
  signal moving_sum_next_carry_n_1 : STD_LOGIC;
  signal moving_sum_next_carry_n_2 : STD_LOGIC;
  signal moving_sum_next_carry_n_3 : STD_LOGIC;
  signal moving_sum_next_carry_n_4 : STD_LOGIC;
  signal moving_sum_next_carry_n_5 : STD_LOGIC;
  signal moving_sum_next_carry_n_6 : STD_LOGIC;
  signal moving_sum_next_carry_n_7 : STD_LOGIC;
  signal \^moving_sum_reg[11]_0\ : STD_LOGIC;
  signal \^moving_sum_reg[11]_1\ : STD_LOGIC;
  signal \^moving_sum_reg[11]_2\ : STD_LOGIC;
  signal \^moving_sum_reg[11]_3\ : STD_LOGIC;
  signal \^moving_sum_reg[5]_0\ : STD_LOGIC;
  signal \^moving_sum_reg[7]_0\ : STD_LOGIC;
  signal \^moving_sum_reg[8]_0\ : STD_LOGIC;
  signal \^moving_sum_reg[9]_0\ : STD_LOGIC;
  signal pos_count : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \pos_count_reset__1\ : STD_LOGIC;
  signal \pos_shift_reg[7][0]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0\ : STD_LOGIC;
  signal \pos_shift_reg[7][1]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0\ : STD_LOGIC;
  signal \pos_shift_reg[7][2]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0\ : STD_LOGIC;
  signal \pos_shift_reg[7][3]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0\ : STD_LOGIC;
  signal \pos_shift_reg[7][4]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0\ : STD_LOGIC;
  signal \pos_shift_reg[7][5]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0\ : STD_LOGIC;
  signal \pos_shift_reg[7][6]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0\ : STD_LOGIC;
  signal \pos_shift_reg[7][7]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0\ : STD_LOGIC;
  signal \pos_shift_reg[8][0]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0\ : STD_LOGIC;
  signal \pos_shift_reg[8][1]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0\ : STD_LOGIC;
  signal \pos_shift_reg[8][2]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0\ : STD_LOGIC;
  signal \pos_shift_reg[8][3]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0\ : STD_LOGIC;
  signal \pos_shift_reg[8][4]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0\ : STD_LOGIC;
  signal \pos_shift_reg[8][5]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0\ : STD_LOGIC;
  signal \pos_shift_reg[8][6]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0\ : STD_LOGIC;
  signal \pos_shift_reg[8][7]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0\ : STD_LOGIC;
  signal \pos_shift_reg[9]\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal pos_shift_reg_c_0_n_0 : STD_LOGIC;
  signal pos_shift_reg_c_1_n_0 : STD_LOGIC;
  signal pos_shift_reg_c_2_n_0 : STD_LOGIC;
  signal pos_shift_reg_c_3_n_0 : STD_LOGIC;
  signal pos_shift_reg_c_4_n_0 : STD_LOGIC;
  signal pos_shift_reg_c_5_n_0 : STD_LOGIC;
  signal pos_shift_reg_c_6_n_0 : STD_LOGIC;
  signal pos_shift_reg_c_7_n_0 : STD_LOGIC;
  signal pos_shift_reg_c_n_0 : STD_LOGIC;
  signal \pos_shift_reg_gate__0_n_0\ : STD_LOGIC;
  signal \pos_shift_reg_gate__1_n_0\ : STD_LOGIC;
  signal \pos_shift_reg_gate__2_n_0\ : STD_LOGIC;
  signal \pos_shift_reg_gate__3_n_0\ : STD_LOGIC;
  signal \pos_shift_reg_gate__4_n_0\ : STD_LOGIC;
  signal \pos_shift_reg_gate__5_n_0\ : STD_LOGIC;
  signal \pos_shift_reg_gate__6_n_0\ : STD_LOGIC;
  signal pos_shift_reg_gate_n_0 : STD_LOGIC;
  signal \rcount[0]_i_2_n_0\ : STD_LOGIC;
  signal \rcount[0]_i_3_n_0\ : STD_LOGIC;
  signal \rcount[0]_i_4_n_0\ : STD_LOGIC;
  signal \rcount[0]_i_5_n_0\ : STD_LOGIC;
  signal \rcount[0]_i_6_n_0\ : STD_LOGIC;
  signal \rcount[0]_i_7_n_0\ : STD_LOGIC;
  signal \rcount[0]_i_8_n_0\ : STD_LOGIC;
  signal \rcount[0]_i_9_n_0\ : STD_LOGIC;
  signal \rcount[12]_i_2_n_0\ : STD_LOGIC;
  signal \rcount[12]_i_3_n_0\ : STD_LOGIC;
  signal \rcount[12]_i_4_n_0\ : STD_LOGIC;
  signal \rcount[12]_i_5_n_0\ : STD_LOGIC;
  signal \rcount[16]_i_2_n_0\ : STD_LOGIC;
  signal \rcount[16]_i_3_n_0\ : STD_LOGIC;
  signal \rcount[16]_i_4_n_0\ : STD_LOGIC;
  signal \rcount[16]_i_5_n_0\ : STD_LOGIC;
  signal \rcount[4]_i_2_n_0\ : STD_LOGIC;
  signal \rcount[4]_i_3_n_0\ : STD_LOGIC;
  signal \rcount[4]_i_4_n_0\ : STD_LOGIC;
  signal \rcount[4]_i_5_n_0\ : STD_LOGIC;
  signal \rcount[8]_i_2_n_0\ : STD_LOGIC;
  signal \rcount[8]_i_3_n_0\ : STD_LOGIC;
  signal \rcount[8]_i_4_n_0\ : STD_LOGIC;
  signal \rcount[8]_i_5_n_0\ : STD_LOGIC;
  signal rcount_reg : STD_LOGIC_VECTOR ( 19 downto 0 );
  signal \rcount_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \rcount_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \rcount_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \rcount_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \rcount_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \rcount_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \rcount_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \rcount_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \rcount_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \rcount_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \rcount_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \rcount_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \rcount_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \rcount_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \rcount_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \rcount_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \rcount_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \rcount_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \rcount_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \rcount_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \rcount_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \rcount_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \rcount_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \rcount_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \rcount_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \rcount_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \rcount_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \rcount_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \rcount_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \rcount_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \rcount_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \rcount_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \rcount_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \rcount_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \rcount_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \rcount_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \rcount_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \rcount_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \rcount_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal velocity1 : STD_LOGIC;
  signal velocity1_carry_i_10_n_0 : STD_LOGIC;
  signal velocity1_carry_i_10_n_1 : STD_LOGIC;
  signal velocity1_carry_i_10_n_2 : STD_LOGIC;
  signal velocity1_carry_i_10_n_3 : STD_LOGIC;
  signal velocity1_carry_i_11_n_0 : STD_LOGIC;
  signal velocity1_carry_i_12_n_0 : STD_LOGIC;
  signal velocity1_carry_i_13_n_0 : STD_LOGIC;
  signal velocity1_carry_i_14_n_0 : STD_LOGIC;
  signal velocity1_carry_i_15_n_0 : STD_LOGIC;
  signal velocity1_carry_i_16_n_0 : STD_LOGIC;
  signal velocity1_carry_i_17_n_0 : STD_LOGIC;
  signal velocity1_carry_i_18_n_0 : STD_LOGIC;
  signal velocity1_carry_i_19_n_0 : STD_LOGIC;
  signal velocity1_carry_i_1_n_0 : STD_LOGIC;
  signal velocity1_carry_i_20_n_0 : STD_LOGIC;
  signal velocity1_carry_i_21_n_0 : STD_LOGIC;
  signal velocity1_carry_i_2_n_0 : STD_LOGIC;
  signal velocity1_carry_i_4_n_0 : STD_LOGIC;
  signal velocity1_carry_i_5_n_0 : STD_LOGIC;
  signal velocity1_carry_i_6_n_0 : STD_LOGIC;
  signal velocity1_carry_i_7_n_0 : STD_LOGIC;
  signal velocity1_carry_i_8_n_2 : STD_LOGIC;
  signal velocity1_carry_i_8_n_3 : STD_LOGIC;
  signal velocity1_carry_i_9_n_0 : STD_LOGIC;
  signal velocity1_carry_i_9_n_1 : STD_LOGIC;
  signal velocity1_carry_i_9_n_2 : STD_LOGIC;
  signal velocity1_carry_i_9_n_3 : STD_LOGIC;
  signal velocity1_carry_n_1 : STD_LOGIC;
  signal velocity1_carry_n_2 : STD_LOGIC;
  signal velocity1_carry_n_3 : STD_LOGIC;
  signal velocity2 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal velocity3 : STD_LOGIC_VECTOR ( 11 downto 4 );
  signal \NLW__inferred__0/i__carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_gpio2[1]_INST_0_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_gpio2[7]_INST_0_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_gpio2[7]_INST_0_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_moving_sum_next_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_rcount_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_velocity1_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_velocity1_carry_i_10_O_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_velocity1_carry_i_8_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_velocity1_carry_i_8_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \_inferred__0/i__carry\ : label is 35;
  attribute ADDER_THRESHOLD of \_inferred__0/i__carry__0\ : label is 35;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \abcdefg[0]_INST_0\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \abcdefg[0]_INST_0_i_2\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \abcdefg[1]_INST_0_i_3\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \abcdefg[1]_INST_0_i_4\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \abcdefg[2]_INST_0\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \abcdefg[2]_INST_0_i_2\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \abcdefg[3]_INST_0\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \abcdefg[3]_INST_0_i_2\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \abcdefg[4]_INST_0\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \abcdefg[4]_INST_0_i_3\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \abcdefg[4]_INST_0_i_4\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \abcdefg[5]_INST_0\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \abcdefg[5]_INST_0_i_2\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \abcdefg[6]_INST_0\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \abcdefg[6]_INST_0_i_2\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \gpio2[0]_INST_0\ : label is "soft_lutpair5";
  attribute ADDER_THRESHOLD of \gpio2[1]_INST_0_i_1\ : label is 35;
  attribute SOFT_HLUTNM of \gpio2[2]_INST_0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \gpio2[4]_INST_0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \gpio2[5]_INST_0\ : label is "soft_lutpair9";
  attribute ADDER_THRESHOLD of \gpio2[5]_INST_0_i_1\ : label is 35;
  attribute SOFT_HLUTNM of \gpio2[6]_INST_0\ : label is "soft_lutpair10";
  attribute ADDER_THRESHOLD of \gpio2[7]_INST_0_i_1\ : label is 35;
  attribute SOFT_HLUTNM of \gpio2[7]_INST_0_i_6\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \gpio2[7]_INST_0_i_7\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \gpio2[7]_INST_0_i_8\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \gpio2[7]_INST_0_i_9\ : label is "soft_lutpair10";
  attribute ADDER_THRESHOLD of moving_sum_next_carry : label is 35;
  attribute ADDER_THRESHOLD of \moving_sum_next_carry__0\ : label is 35;
  attribute HLUTNM : string;
  attribute HLUTNM of \moving_sum_next_carry__0_i_1\ : label is "lutpair5";
  attribute HLUTNM of \moving_sum_next_carry__0_i_2\ : label is "lutpair4";
  attribute HLUTNM of \moving_sum_next_carry__0_i_3\ : label is "lutpair3";
  attribute HLUTNM of \moving_sum_next_carry__0_i_4\ : label is "lutpair2";
  attribute HLUTNM of \moving_sum_next_carry__0_i_6\ : label is "lutpair5";
  attribute HLUTNM of \moving_sum_next_carry__0_i_7\ : label is "lutpair4";
  attribute HLUTNM of \moving_sum_next_carry__0_i_8\ : label is "lutpair3";
  attribute ADDER_THRESHOLD of \moving_sum_next_carry__1\ : label is 35;
  attribute HLUTNM of moving_sum_next_carry_i_1 : label is "lutpair1";
  attribute HLUTNM of moving_sum_next_carry_i_2 : label is "lutpair0";
  attribute HLUTNM of moving_sum_next_carry_i_3 : label is "lutpair6";
  attribute HLUTNM of moving_sum_next_carry_i_5 : label is "lutpair2";
  attribute HLUTNM of moving_sum_next_carry_i_6 : label is "lutpair1";
  attribute HLUTNM of moving_sum_next_carry_i_7 : label is "lutpair0";
  attribute HLUTNM of moving_sum_next_carry_i_8 : label is "lutpair6";
  attribute srl_bus_name : string;
  attribute srl_bus_name of \pos_shift_reg[7][0]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6\ : label is "\U0/UUT_VEL_READ/pos_shift_reg[7] ";
  attribute srl_name : string;
  attribute srl_name of \pos_shift_reg[7][0]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6\ : label is "\U0/UUT_VEL_READ/pos_shift_reg[7][0]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6 ";
  attribute srl_bus_name of \pos_shift_reg[7][1]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6\ : label is "\U0/UUT_VEL_READ/pos_shift_reg[7] ";
  attribute srl_name of \pos_shift_reg[7][1]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6\ : label is "\U0/UUT_VEL_READ/pos_shift_reg[7][1]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6 ";
  attribute srl_bus_name of \pos_shift_reg[7][2]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6\ : label is "\U0/UUT_VEL_READ/pos_shift_reg[7] ";
  attribute srl_name of \pos_shift_reg[7][2]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6\ : label is "\U0/UUT_VEL_READ/pos_shift_reg[7][2]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6 ";
  attribute srl_bus_name of \pos_shift_reg[7][3]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6\ : label is "\U0/UUT_VEL_READ/pos_shift_reg[7] ";
  attribute srl_name of \pos_shift_reg[7][3]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6\ : label is "\U0/UUT_VEL_READ/pos_shift_reg[7][3]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6 ";
  attribute srl_bus_name of \pos_shift_reg[7][4]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6\ : label is "\U0/UUT_VEL_READ/pos_shift_reg[7] ";
  attribute srl_name of \pos_shift_reg[7][4]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6\ : label is "\U0/UUT_VEL_READ/pos_shift_reg[7][4]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6 ";
  attribute srl_bus_name of \pos_shift_reg[7][5]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6\ : label is "\U0/UUT_VEL_READ/pos_shift_reg[7] ";
  attribute srl_name of \pos_shift_reg[7][5]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6\ : label is "\U0/UUT_VEL_READ/pos_shift_reg[7][5]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6 ";
  attribute srl_bus_name of \pos_shift_reg[7][6]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6\ : label is "\U0/UUT_VEL_READ/pos_shift_reg[7] ";
  attribute srl_name of \pos_shift_reg[7][6]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6\ : label is "\U0/UUT_VEL_READ/pos_shift_reg[7][6]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6 ";
  attribute srl_bus_name of \pos_shift_reg[7][7]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6\ : label is "\U0/UUT_VEL_READ/pos_shift_reg[7] ";
  attribute srl_name of \pos_shift_reg[7][7]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6\ : label is "\U0/UUT_VEL_READ/pos_shift_reg[7][7]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6 ";
  attribute SOFT_HLUTNM of pos_shift_reg_gate : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \pos_shift_reg_gate__0\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \pos_shift_reg_gate__1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \pos_shift_reg_gate__2\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \pos_shift_reg_gate__3\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \pos_shift_reg_gate__4\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \pos_shift_reg_gate__5\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \pos_shift_reg_gate__6\ : label is "soft_lutpair18";
  attribute ADDER_THRESHOLD of \rcount_reg[0]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \rcount_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \rcount_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \rcount_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \rcount_reg[8]_i_1\ : label is 11;
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of velocity1_carry : label is 11;
  attribute ADDER_THRESHOLD of velocity1_carry_i_10 : label is 35;
  attribute ADDER_THRESHOLD of velocity1_carry_i_8 : label is 35;
  attribute ADDER_THRESHOLD of velocity1_carry_i_9 : label is 35;
begin
  abcdefg_1_sn_1 <= abcdefg_1_sp_1;
  \moving_sum_reg[11]_0\ <= \^moving_sum_reg[11]_0\;
  \moving_sum_reg[11]_1\ <= \^moving_sum_reg[11]_1\;
  \moving_sum_reg[11]_2\ <= \^moving_sum_reg[11]_2\;
  \moving_sum_reg[11]_3\ <= \^moving_sum_reg[11]_3\;
  \moving_sum_reg[5]_0\ <= \^moving_sum_reg[5]_0\;
  \moving_sum_reg[7]_0\ <= \^moving_sum_reg[7]_0\;
  \moving_sum_reg[8]_0\ <= \^moving_sum_reg[8]_0\;
  \moving_sum_reg[9]_0\ <= \^moving_sum_reg[9]_0\;
\_inferred__0/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \_inferred__0/i__carry_n_0\,
      CO(2) => \_inferred__0/i__carry_n_1\,
      CO(1) => \_inferred__0/i__carry_n_2\,
      CO(0) => \_inferred__0/i__carry_n_3\,
      CYINIT => '0',
      DI(3) => \i__carry_i_1_n_0\,
      DI(2) => \i__carry_i_2_n_0\,
      DI(1) => \i__carry_i_3_n_0\,
      DI(0) => \i__carry_i_4_n_0\,
      O(3) => \_inferred__0/i__carry_n_4\,
      O(2) => \_inferred__0/i__carry_n_5\,
      O(1) => \_inferred__0/i__carry_n_6\,
      O(0) => \_inferred__0/i__carry_n_7\,
      S(3) => \i__carry_i_5_n_0\,
      S(2) => \i__carry_i_6_n_0\,
      S(1) => \i__carry_i_7_n_0\,
      S(0) => \i__carry_i_8_n_0\
    );
\_inferred__0/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__0/i__carry_n_0\,
      CO(3) => \NLW__inferred__0/i__carry__0_CO_UNCONNECTED\(3),
      CO(2) => \_inferred__0/i__carry__0_n_1\,
      CO(1) => \_inferred__0/i__carry__0_n_2\,
      CO(0) => \_inferred__0/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => \i__carry__0_i_1_n_0\,
      DI(1) => \i__carry__0_i_2_n_0\,
      DI(0) => \i__carry__0_i_3_n_0\,
      O(3) => \_inferred__0/i__carry__0_n_4\,
      O(2) => \_inferred__0/i__carry__0_n_5\,
      O(1) => \_inferred__0/i__carry__0_n_6\,
      O(0) => \_inferred__0/i__carry__0_n_7\,
      S(3) => \i__carry__0_i_4_n_0\,
      S(2) => \i__carry__0_i_5_n_0\,
      S(1) => \i__carry__0_i_6_n_0\,
      S(0) => \i__carry__0_i_7_n_0\
    );
\abcdefg[0]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reset,
      I1 => \abcdefg[0]_INST_0_i_1_n_0\,
      O => abcdefg(0)
    );
\abcdefg[0]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2043FFFF20430000"
    )
        port map (
      I0 => \^moving_sum_reg[7]_0\,
      I1 => \^moving_sum_reg[11]_2\,
      I2 => \^moving_sum_reg[9]_0\,
      I3 => \^moving_sum_reg[8]_0\,
      I4 => abcdefg_1_sn_1,
      I5 => \abcdefg[0]_INST_0_i_2_n_0\,
      O => \abcdefg[0]_INST_0_i_1_n_0\
    );
\abcdefg[0]_INST_0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2043"
    )
        port map (
      I0 => \^moving_sum_reg[11]_3\,
      I1 => \^moving_sum_reg[11]_1\,
      I2 => \^moving_sum_reg[5]_0\,
      I3 => \^moving_sum_reg[11]_0\,
      O => \abcdefg[0]_INST_0_i_2_n_0\
    );
\abcdefg[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8880888080888880"
    )
        port map (
      I0 => \abcdefg[1]_INST_0_i_1_n_0\,
      I1 => \abcdefg[1]_INST_0_i_2_n_0\,
      I2 => \abcdefg[1]_INST_0_i_3_n_0\,
      I3 => \^moving_sum_reg[11]_1\,
      I4 => \^moving_sum_reg[5]_0\,
      I5 => \^moving_sum_reg[11]_0\,
      O => abcdefg(1)
    );
\abcdefg[1]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555551500000000"
    )
        port map (
      I0 => reset,
      I1 => abcdefg_1_sn_1,
      I2 => \^moving_sum_reg[8]_0\,
      I3 => \^moving_sum_reg[9]_0\,
      I4 => \^moving_sum_reg[11]_2\,
      I5 => \abcdefg[1]_INST_0_i_4_n_0\,
      O => \abcdefg[1]_INST_0_i_1_n_0\
    );
\abcdefg[1]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F7F77FF7"
    )
        port map (
      I0 => \^moving_sum_reg[7]_0\,
      I1 => abcdefg_1_sn_1,
      I2 => \^moving_sum_reg[11]_2\,
      I3 => \^moving_sum_reg[9]_0\,
      I4 => \^moving_sum_reg[8]_0\,
      O => \abcdefg[1]_INST_0_i_2_n_0\
    );
\abcdefg[1]_INST_0_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAFBB"
    )
        port map (
      I0 => abcdefg_1_sn_1,
      I1 => moving_sum(3),
      I2 => ARG3(3),
      I3 => moving_sum(11),
      I4 => velocity1,
      O => \abcdefg[1]_INST_0_i_3_n_0\
    );
\abcdefg[1]_INST_0_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => \^moving_sum_reg[11]_0\,
      I1 => \^moving_sum_reg[11]_1\,
      I2 => abcdefg_1_sn_1,
      I3 => \^moving_sum_reg[5]_0\,
      O => \abcdefg[1]_INST_0_i_4_n_0\
    );
\abcdefg[2]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reset,
      I1 => \abcdefg[2]_INST_0_i_1_n_0\,
      O => abcdefg(2)
    );
\abcdefg[2]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"02BAFFFF02BA0000"
    )
        port map (
      I0 => \^moving_sum_reg[7]_0\,
      I1 => \^moving_sum_reg[8]_0\,
      I2 => \^moving_sum_reg[9]_0\,
      I3 => \^moving_sum_reg[11]_2\,
      I4 => abcdefg_1_sn_1,
      I5 => \abcdefg[2]_INST_0_i_2_n_0\,
      O => \abcdefg[2]_INST_0_i_1_n_0\
    );
\abcdefg[2]_INST_0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"02BA"
    )
        port map (
      I0 => \^moving_sum_reg[11]_3\,
      I1 => \^moving_sum_reg[11]_0\,
      I2 => \^moving_sum_reg[5]_0\,
      I3 => \^moving_sum_reg[11]_1\,
      O => \abcdefg[2]_INST_0_i_2_n_0\
    );
\abcdefg[3]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reset,
      I1 => \abcdefg[3]_INST_0_i_1_n_0\,
      O => abcdefg(3)
    );
\abcdefg[3]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A41AFFFFA41A0000"
    )
        port map (
      I0 => \^moving_sum_reg[7]_0\,
      I1 => \^moving_sum_reg[11]_2\,
      I2 => \^moving_sum_reg[9]_0\,
      I3 => \^moving_sum_reg[8]_0\,
      I4 => abcdefg_1_sn_1,
      I5 => \abcdefg[3]_INST_0_i_2_n_0\,
      O => \abcdefg[3]_INST_0_i_1_n_0\
    );
\abcdefg[3]_INST_0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A41A"
    )
        port map (
      I0 => \^moving_sum_reg[11]_3\,
      I1 => \^moving_sum_reg[11]_1\,
      I2 => \^moving_sum_reg[5]_0\,
      I3 => \^moving_sum_reg[11]_0\,
      O => \abcdefg[3]_INST_0_i_2_n_0\
    );
\abcdefg[4]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => reset,
      I1 => \abcdefg[4]_INST_0_i_1_n_0\,
      I2 => \abcdefg[4]_INST_0_i_2_n_0\,
      O => abcdefg(4)
    );
\abcdefg[4]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555F55D55555555"
    )
        port map (
      I0 => \abcdefg[4]_INST_0_i_3_n_0\,
      I1 => \^moving_sum_reg[8]_0\,
      I2 => \^moving_sum_reg[11]_2\,
      I3 => \^moving_sum_reg[9]_0\,
      I4 => \^moving_sum_reg[7]_0\,
      I5 => abcdefg_1_sn_1,
      O => \abcdefg[4]_INST_0_i_1_n_0\
    );
\abcdefg[4]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"D5555555"
    )
        port map (
      I0 => \abcdefg[4]_INST_0_i_4_n_0\,
      I1 => \^moving_sum_reg[9]_0\,
      I2 => \^moving_sum_reg[8]_0\,
      I3 => \^moving_sum_reg[11]_2\,
      I4 => abcdefg_1_sn_1,
      O => \abcdefg[4]_INST_0_i_2_n_0\
    );
\abcdefg[4]_INST_0_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFEEFFF"
    )
        port map (
      I0 => \^moving_sum_reg[11]_3\,
      I1 => abcdefg_1_sn_1,
      I2 => \^moving_sum_reg[5]_0\,
      I3 => \^moving_sum_reg[11]_1\,
      I4 => \^moving_sum_reg[11]_0\,
      O => \abcdefg[4]_INST_0_i_3_n_0\
    );
\abcdefg[4]_INST_0_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => \^moving_sum_reg[11]_0\,
      I1 => \^moving_sum_reg[11]_1\,
      I2 => \^moving_sum_reg[5]_0\,
      I3 => abcdefg_1_sn_1,
      O => \abcdefg[4]_INST_0_i_4_n_0\
    );
\abcdefg[5]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reset,
      I1 => \abcdefg[5]_INST_0_i_1_n_0\,
      O => abcdefg(5)
    );
\abcdefg[5]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"98E0FFFF98E00000"
    )
        port map (
      I0 => \^moving_sum_reg[8]_0\,
      I1 => \^moving_sum_reg[11]_2\,
      I2 => \^moving_sum_reg[9]_0\,
      I3 => \^moving_sum_reg[7]_0\,
      I4 => abcdefg_1_sn_1,
      I5 => \abcdefg[5]_INST_0_i_2_n_0\,
      O => \abcdefg[5]_INST_0_i_1_n_0\
    );
\abcdefg[5]_INST_0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"98E0"
    )
        port map (
      I0 => \^moving_sum_reg[11]_0\,
      I1 => \^moving_sum_reg[11]_1\,
      I2 => \^moving_sum_reg[5]_0\,
      I3 => \^moving_sum_reg[11]_3\,
      O => \abcdefg[5]_INST_0_i_2_n_0\
    );
\abcdefg[6]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => reset,
      I1 => \abcdefg[6]_INST_0_i_1_n_0\,
      O => abcdefg(6)
    );
\abcdefg[6]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4910FFFF49100000"
    )
        port map (
      I0 => \^moving_sum_reg[8]_0\,
      I1 => \^moving_sum_reg[11]_2\,
      I2 => \^moving_sum_reg[9]_0\,
      I3 => \^moving_sum_reg[7]_0\,
      I4 => abcdefg_1_sn_1,
      I5 => \abcdefg[6]_INST_0_i_2_n_0\,
      O => \abcdefg[6]_INST_0_i_1_n_0\
    );
\abcdefg[6]_INST_0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4910"
    )
        port map (
      I0 => \^moving_sum_reg[11]_0\,
      I1 => \^moving_sum_reg[11]_1\,
      I2 => \^moving_sum_reg[5]_0\,
      I3 => \^moving_sum_reg[11]_3\,
      O => \abcdefg[6]_INST_0_i_2_n_0\
    );
\gpio2[0]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FBEA"
    )
        port map (
      I0 => velocity1,
      I1 => moving_sum(11),
      I2 => ARG3(3),
      I3 => moving_sum(3),
      O => \^moving_sum_reg[11]_3\
    );
\gpio2[1]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000072D8"
    )
        port map (
      I0 => moving_sum(11),
      I1 => ARG3(4),
      I2 => moving_sum(4),
      I3 => ARG3(3),
      I4 => velocity1,
      O => \^moving_sum_reg[11]_0\
    );
\gpio2[1]_INST_0_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \gpio2[1]_INST_0_i_1_n_0\,
      CO(2) => \gpio2[1]_INST_0_i_1_n_1\,
      CO(1) => \gpio2[1]_INST_0_i_1_n_2\,
      CO(0) => \gpio2[1]_INST_0_i_1_n_3\,
      CYINIT => \gpio2[1]_INST_0_i_2_n_0\,
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => ARG3(4 downto 3),
      O(1 downto 0) => \NLW_gpio2[1]_INST_0_i_1_O_UNCONNECTED\(1 downto 0),
      S(3) => \gpio2[1]_INST_0_i_3_n_0\,
      S(2) => \gpio2[1]_INST_0_i_4_n_0\,
      S(1) => \gpio2[1]_INST_0_i_5_n_0\,
      S(0) => \gpio2[1]_INST_0_i_6_n_0\
    );
\gpio2[1]_INST_0_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(0),
      O => \gpio2[1]_INST_0_i_2_n_0\
    );
\gpio2[1]_INST_0_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(4),
      O => \gpio2[1]_INST_0_i_3_n_0\
    );
\gpio2[1]_INST_0_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(3),
      O => \gpio2[1]_INST_0_i_4_n_0\
    );
\gpio2[1]_INST_0_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(2),
      O => \gpio2[1]_INST_0_i_5_n_0\
    );
\gpio2[1]_INST_0_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(1),
      O => \gpio2[1]_INST_0_i_6_n_0\
    );
\gpio2[2]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000AC5C"
    )
        port map (
      I0 => ARG3(5),
      I1 => moving_sum(5),
      I2 => moving_sum(11),
      I3 => \gpio2[3]_INST_0_i_2_n_0\,
      I4 => velocity1,
      O => \^moving_sum_reg[5]_0\
    );
\gpio2[3]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000066C6"
    )
        port map (
      I0 => moving_sum(11),
      I1 => ARG2(6),
      I2 => \gpio2[3]_INST_0_i_2_n_0\,
      I3 => ARG3(5),
      I4 => velocity1,
      O => \^moving_sum_reg[11]_1\
    );
\gpio2[3]_INST_0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => moving_sum(6),
      I1 => ARG3(6),
      I2 => moving_sum(11),
      O => ARG2(6)
    );
\gpio2[3]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00500353"
    )
        port map (
      I0 => ARG3(4),
      I1 => moving_sum(4),
      I2 => moving_sum(11),
      I3 => ARG3(3),
      I4 => moving_sum(3),
      O => \gpio2[3]_INST_0_i_2_n_0\
    );
\gpio2[4]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000AC5C"
    )
        port map (
      I0 => ARG3(7),
      I1 => moving_sum(7),
      I2 => moving_sum(11),
      I3 => \gpio2[4]_INST_0_i_1_n_0\,
      I4 => velocity1,
      O => \^moving_sum_reg[7]_0\
    );
\gpio2[4]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000A0011001B00"
    )
        port map (
      I0 => moving_sum(11),
      I1 => moving_sum(5),
      I2 => ARG3(5),
      I3 => \gpio2[3]_INST_0_i_2_n_0\,
      I4 => ARG3(6),
      I5 => moving_sum(6),
      O => \gpio2[4]_INST_0_i_1_n_0\
    );
\gpio2[5]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000AC5C"
    )
        port map (
      I0 => ARG3(8),
      I1 => moving_sum(8),
      I2 => moving_sum(11),
      I3 => \gpio2[5]_INST_0_i_2_n_0\,
      I4 => velocity1,
      O => \^moving_sum_reg[8]_0\
    );
\gpio2[5]_INST_0_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \gpio2[1]_INST_0_i_1_n_0\,
      CO(3) => \gpio2[5]_INST_0_i_1_n_0\,
      CO(2) => \gpio2[5]_INST_0_i_1_n_1\,
      CO(1) => \gpio2[5]_INST_0_i_1_n_2\,
      CO(0) => \gpio2[5]_INST_0_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => ARG3(8 downto 5),
      S(3) => \gpio2[5]_INST_0_i_3_n_0\,
      S(2) => \gpio2[5]_INST_0_i_4_n_0\,
      S(1) => \gpio2[5]_INST_0_i_5_n_0\,
      S(0) => \gpio2[5]_INST_0_i_6_n_0\
    );
\gpio2[5]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000201030"
    )
        port map (
      I0 => moving_sum(11),
      I1 => ARG2(6),
      I2 => \gpio2[3]_INST_0_i_2_n_0\,
      I3 => ARG3(5),
      I4 => moving_sum(5),
      I5 => ARG2(7),
      O => \gpio2[5]_INST_0_i_2_n_0\
    );
\gpio2[5]_INST_0_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(8),
      O => \gpio2[5]_INST_0_i_3_n_0\
    );
\gpio2[5]_INST_0_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(7),
      O => \gpio2[5]_INST_0_i_4_n_0\
    );
\gpio2[5]_INST_0_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(6),
      O => \gpio2[5]_INST_0_i_5_n_0\
    );
\gpio2[5]_INST_0_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(5),
      O => \gpio2[5]_INST_0_i_6_n_0\
    );
\gpio2[6]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000AC5C"
    )
        port map (
      I0 => ARG3(9),
      I1 => moving_sum(9),
      I2 => moving_sum(11),
      I3 => \gpio2[6]_INST_0_i_1_n_0\,
      I4 => velocity1,
      O => \^moving_sum_reg[9]_0\
    );
\gpio2[6]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => ARG2(7),
      I1 => ARG2(5),
      I2 => \gpio2[3]_INST_0_i_2_n_0\,
      I3 => ARG2(6),
      I4 => ARG2(8),
      O => \gpio2[6]_INST_0_i_1_n_0\
    );
\gpio2[7]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFAAEFAA"
    )
        port map (
      I0 => velocity1,
      I1 => ARG3(10),
      I2 => \gpio2[7]_INST_0_i_2_n_0\,
      I3 => moving_sum(11),
      I4 => ARG3(11),
      O => \^moving_sum_reg[11]_2\
    );
\gpio2[7]_INST_0_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \gpio2[5]_INST_0_i_1_n_0\,
      CO(3 downto 2) => \NLW_gpio2[7]_INST_0_i_1_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \gpio2[7]_INST_0_i_1_n_2\,
      CO(0) => \gpio2[7]_INST_0_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_gpio2[7]_INST_0_i_1_O_UNCONNECTED\(3),
      O(2 downto 0) => ARG3(11 downto 9),
      S(3) => '0',
      S(2) => \gpio2[7]_INST_0_i_3_n_0\,
      S(1) => \gpio2[7]_INST_0_i_4_n_0\,
      S(0) => \gpio2[7]_INST_0_i_5_n_0\
    );
\gpio2[7]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000010"
    )
        port map (
      I0 => ARG2(8),
      I1 => ARG2(6),
      I2 => \gpio2[3]_INST_0_i_2_n_0\,
      I3 => ARG2(5),
      I4 => ARG2(7),
      I5 => ARG2(9),
      O => \gpio2[7]_INST_0_i_2_n_0\
    );
\gpio2[7]_INST_0_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(11),
      O => \gpio2[7]_INST_0_i_3_n_0\
    );
\gpio2[7]_INST_0_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(10),
      O => \gpio2[7]_INST_0_i_4_n_0\
    );
\gpio2[7]_INST_0_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(9),
      O => \gpio2[7]_INST_0_i_5_n_0\
    );
\gpio2[7]_INST_0_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => moving_sum(8),
      I1 => ARG3(8),
      I2 => moving_sum(11),
      O => ARG2(8)
    );
\gpio2[7]_INST_0_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => moving_sum(5),
      I1 => ARG3(5),
      I2 => moving_sum(11),
      O => ARG2(5)
    );
\gpio2[7]_INST_0_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => moving_sum(7),
      I1 => ARG3(7),
      I2 => moving_sum(11),
      O => ARG2(7)
    );
\gpio2[7]_INST_0_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => moving_sum(9),
      I1 => ARG3(9),
      I2 => moving_sum(11),
      O => ARG2(9)
    );
\i__carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => pos_count(5),
      I1 => \pos_count_reset__1\,
      O => \i__carry__0_i_1_n_0\
    );
\i__carry__0_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => pos_count(4),
      I1 => \pos_count_reset__1\,
      O => \i__carry__0_i_2_n_0\
    );
\i__carry__0_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => pos_count(3),
      I1 => \pos_count_reset__1\,
      O => \i__carry__0_i_3_n_0\
    );
\i__carry__0_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"ED"
    )
        port map (
      I0 => pos_count(6),
      I1 => \pos_count_reset__1\,
      I2 => pos_count(7),
      O => \i__carry__0_i_4_n_0\
    );
\i__carry__0_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"ED"
    )
        port map (
      I0 => pos_count(5),
      I1 => \pos_count_reset__1\,
      I2 => pos_count(6),
      O => \i__carry__0_i_5_n_0\
    );
\i__carry__0_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"ED"
    )
        port map (
      I0 => pos_count(4),
      I1 => \pos_count_reset__1\,
      I2 => pos_count(5),
      O => \i__carry__0_i_6_n_0\
    );
\i__carry__0_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"ED"
    )
        port map (
      I0 => pos_count(3),
      I1 => \pos_count_reset__1\,
      I2 => pos_count(4),
      O => \i__carry__0_i_7_n_0\
    );
\i__carry_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => pos_count(2),
      I1 => \pos_count_reset__1\,
      O => \i__carry_i_1_n_0\
    );
\i__carry_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DFFF"
    )
        port map (
      I0 => pos_count(5),
      I1 => pos_count(3),
      I2 => pos_count(0),
      I3 => pos_count(1),
      O => \i__carry_i_12_n_0\
    );
\i__carry_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAABAAAA"
    )
        port map (
      I0 => \moving_sum[11]_i_1_n_0\,
      I1 => \i__carry_i_14_n_0\,
      I2 => pos_count(0),
      I3 => pos_count(1),
      I4 => pos_count(6),
      I5 => pos_count(5),
      O => \i__carry_i_13_n_0\
    );
\i__carry_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => pos_count(2),
      I1 => pos_count(3),
      I2 => pos_count(7),
      I3 => pos_count(4),
      O => \i__carry_i_14_n_0\
    );
\i__carry_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => pos_count(1),
      I1 => \pos_count_reset__1\,
      O => \i__carry_i_2_n_0\
    );
\i__carry_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \__11\,
      I1 => \pos_count_reset__1\,
      I2 => pos_count(0),
      O => \i__carry_i_3_n_0\
    );
\i__carry_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2D"
    )
        port map (
      I0 => pos_count(0),
      I1 => \pos_count_reset__1\,
      I2 => \__11\,
      O => \i__carry_i_4_n_0\
    );
\i__carry_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"ED"
    )
        port map (
      I0 => pos_count(2),
      I1 => \pos_count_reset__1\,
      I2 => pos_count(3),
      O => \i__carry_i_5_n_0\
    );
\i__carry_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"ED"
    )
        port map (
      I0 => pos_count(1),
      I1 => \pos_count_reset__1\,
      I2 => pos_count(2),
      O => \i__carry_i_6_n_0\
    );
\i__carry_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3E31"
    )
        port map (
      I0 => pos_count(0),
      I1 => \__11\,
      I2 => \pos_count_reset__1\,
      I3 => pos_count(1),
      O => \i__carry_i_7_n_0\
    );
\i__carry_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2DD2"
    )
        port map (
      I0 => pos_count(0),
      I1 => \pos_count_reset__1\,
      I2 => \__11\,
      I3 => pos_dec,
      O => \i__carry_i_8_n_0\
    );
\i__carry_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00000001"
    )
        port map (
      I0 => \i__carry_i_12_n_0\,
      I1 => pos_count(7),
      I2 => pos_count(6),
      I3 => pos_count(4),
      I4 => pos_count(2),
      I5 => \i__carry_i_13_n_0\,
      O => \pos_count_reset__1\
    );
\moving_sum[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000010"
    )
        port map (
      I0 => rcount_reg(18),
      I1 => rcount_reg(15),
      I2 => \moving_sum[11]_i_2_n_0\,
      I3 => rcount_reg(17),
      I4 => rcount_reg(16),
      I5 => rcount_reg(19),
      O => \moving_sum[11]_i_1_n_0\
    );
\moving_sum[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
        port map (
      I0 => rcount_reg(12),
      I1 => \moving_sum[11]_i_3_n_0\,
      I2 => rcount_reg(11),
      I3 => rcount_reg(10),
      I4 => rcount_reg(14),
      I5 => rcount_reg(13),
      O => \moving_sum[11]_i_2_n_0\
    );
\moving_sum[11]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => rcount_reg(7),
      I1 => rcount_reg(8),
      I2 => \moving_sum[11]_i_4_n_0\,
      I3 => rcount_reg(6),
      I4 => \moving_sum[11]_i_5_n_0\,
      O => \moving_sum[11]_i_3_n_0\
    );
\moving_sum[11]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => rcount_reg(3),
      I1 => rcount_reg(0),
      I2 => rcount_reg(1),
      I3 => rcount_reg(2),
      I4 => rcount_reg(5),
      I5 => rcount_reg(4),
      O => \moving_sum[11]_i_4_n_0\
    );
\moving_sum[11]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => rcount_reg(11),
      I1 => rcount_reg(10),
      I2 => rcount_reg(9),
      O => \moving_sum[11]_i_5_n_0\
    );
moving_sum_next_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => moving_sum_next_carry_n_0,
      CO(2) => moving_sum_next_carry_n_1,
      CO(1) => moving_sum_next_carry_n_2,
      CO(0) => moving_sum_next_carry_n_3,
      CYINIT => '0',
      DI(3) => moving_sum_next_carry_i_1_n_0,
      DI(2) => moving_sum_next_carry_i_2_n_0,
      DI(1) => moving_sum_next_carry_i_3_n_0,
      DI(0) => moving_sum_next_carry_i_4_n_0,
      O(3) => moving_sum_next_carry_n_4,
      O(2) => moving_sum_next_carry_n_5,
      O(1) => moving_sum_next_carry_n_6,
      O(0) => moving_sum_next_carry_n_7,
      S(3) => moving_sum_next_carry_i_5_n_0,
      S(2) => moving_sum_next_carry_i_6_n_0,
      S(1) => moving_sum_next_carry_i_7_n_0,
      S(0) => moving_sum_next_carry_i_8_n_0
    );
\moving_sum_next_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => moving_sum_next_carry_n_0,
      CO(3) => \moving_sum_next_carry__0_n_0\,
      CO(2) => \moving_sum_next_carry__0_n_1\,
      CO(1) => \moving_sum_next_carry__0_n_2\,
      CO(0) => \moving_sum_next_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \moving_sum_next_carry__0_i_1_n_0\,
      DI(2) => \moving_sum_next_carry__0_i_2_n_0\,
      DI(1) => \moving_sum_next_carry__0_i_3_n_0\,
      DI(0) => \moving_sum_next_carry__0_i_4_n_0\,
      O(3) => \moving_sum_next_carry__0_n_4\,
      O(2) => \moving_sum_next_carry__0_n_5\,
      O(1) => \moving_sum_next_carry__0_n_6\,
      O(0) => \moving_sum_next_carry__0_n_7\,
      S(3) => \moving_sum_next_carry__0_i_5_n_0\,
      S(2) => \moving_sum_next_carry__0_i_6_n_0\,
      S(1) => \moving_sum_next_carry__0_i_7_n_0\,
      S(0) => \moving_sum_next_carry__0_i_8_n_0\
    );
\moving_sum_next_carry__0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8E"
    )
        port map (
      I0 => moving_sum(6),
      I1 => pos_count(6),
      I2 => \pos_shift_reg[9]\(6),
      O => \moving_sum_next_carry__0_i_1_n_0\
    );
\moving_sum_next_carry__0_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8E"
    )
        port map (
      I0 => moving_sum(5),
      I1 => pos_count(5),
      I2 => \pos_shift_reg[9]\(5),
      O => \moving_sum_next_carry__0_i_2_n_0\
    );
\moving_sum_next_carry__0_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8E"
    )
        port map (
      I0 => moving_sum(4),
      I1 => pos_count(4),
      I2 => \pos_shift_reg[9]\(4),
      O => \moving_sum_next_carry__0_i_3_n_0\
    );
\moving_sum_next_carry__0_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8E"
    )
        port map (
      I0 => moving_sum(3),
      I1 => pos_count(3),
      I2 => \pos_shift_reg[9]\(3),
      O => \moving_sum_next_carry__0_i_4_n_0\
    );
\moving_sum_next_carry__0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9669"
    )
        port map (
      I0 => \moving_sum_next_carry__0_i_1_n_0\,
      I1 => pos_count(7),
      I2 => moving_sum(7),
      I3 => \pos_shift_reg[9]\(7),
      O => \moving_sum_next_carry__0_i_5_n_0\
    );
\moving_sum_next_carry__0_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9669"
    )
        port map (
      I0 => moving_sum(6),
      I1 => pos_count(6),
      I2 => \pos_shift_reg[9]\(6),
      I3 => \moving_sum_next_carry__0_i_2_n_0\,
      O => \moving_sum_next_carry__0_i_6_n_0\
    );
\moving_sum_next_carry__0_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9669"
    )
        port map (
      I0 => moving_sum(5),
      I1 => pos_count(5),
      I2 => \pos_shift_reg[9]\(5),
      I3 => \moving_sum_next_carry__0_i_3_n_0\,
      O => \moving_sum_next_carry__0_i_7_n_0\
    );
\moving_sum_next_carry__0_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9669"
    )
        port map (
      I0 => moving_sum(4),
      I1 => pos_count(4),
      I2 => \pos_shift_reg[9]\(4),
      I3 => \moving_sum_next_carry__0_i_4_n_0\,
      O => \moving_sum_next_carry__0_i_8_n_0\
    );
\moving_sum_next_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \moving_sum_next_carry__0_n_0\,
      CO(3) => \NLW_moving_sum_next_carry__1_CO_UNCONNECTED\(3),
      CO(2) => \moving_sum_next_carry__1_n_1\,
      CO(1) => \moving_sum_next_carry__1_n_2\,
      CO(0) => \moving_sum_next_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 1) => moving_sum(9 downto 8),
      DI(0) => \moving_sum_next_carry__1_i_1_n_0\,
      O(3) => \moving_sum_next_carry__1_n_4\,
      O(2) => \moving_sum_next_carry__1_n_5\,
      O(1) => \moving_sum_next_carry__1_n_6\,
      O(0) => \moving_sum_next_carry__1_n_7\,
      S(3) => \moving_sum_next_carry__1_i_2_n_0\,
      S(2) => \moving_sum_next_carry__1_i_3_n_0\,
      S(1) => \moving_sum_next_carry__1_i_4_n_0\,
      S(0) => \moving_sum_next_carry__1_i_5_n_0\
    );
\moving_sum_next_carry__1_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D4"
    )
        port map (
      I0 => pos_count(7),
      I1 => moving_sum(7),
      I2 => \pos_shift_reg[9]\(7),
      O => \moving_sum_next_carry__1_i_1_n_0\
    );
\moving_sum_next_carry__1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => moving_sum(10),
      I1 => moving_sum(11),
      O => \moving_sum_next_carry__1_i_2_n_0\
    );
\moving_sum_next_carry__1_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => moving_sum(9),
      I1 => moving_sum(10),
      O => \moving_sum_next_carry__1_i_3_n_0\
    );
\moving_sum_next_carry__1_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => moving_sum(8),
      I1 => moving_sum(9),
      O => \moving_sum_next_carry__1_i_4_n_0\
    );
\moving_sum_next_carry__1_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8E71"
    )
        port map (
      I0 => \pos_shift_reg[9]\(7),
      I1 => moving_sum(7),
      I2 => pos_count(7),
      I3 => moving_sum(8),
      O => \moving_sum_next_carry__1_i_5_n_0\
    );
moving_sum_next_carry_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8E"
    )
        port map (
      I0 => moving_sum(2),
      I1 => pos_count(2),
      I2 => \pos_shift_reg[9]\(2),
      O => moving_sum_next_carry_i_1_n_0
    );
moving_sum_next_carry_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8E"
    )
        port map (
      I0 => moving_sum(1),
      I1 => pos_count(1),
      I2 => \pos_shift_reg[9]\(1),
      O => moving_sum_next_carry_i_2_n_0
    );
moving_sum_next_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => pos_count(0),
      I1 => moving_sum(0),
      O => moving_sum_next_carry_i_3_n_0
    );
moving_sum_next_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => moving_sum(0),
      I1 => pos_count(0),
      O => moving_sum_next_carry_i_4_n_0
    );
moving_sum_next_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9669"
    )
        port map (
      I0 => moving_sum(3),
      I1 => pos_count(3),
      I2 => \pos_shift_reg[9]\(3),
      I3 => moving_sum_next_carry_i_1_n_0,
      O => moving_sum_next_carry_i_5_n_0
    );
moving_sum_next_carry_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9669"
    )
        port map (
      I0 => moving_sum(2),
      I1 => pos_count(2),
      I2 => \pos_shift_reg[9]\(2),
      I3 => moving_sum_next_carry_i_2_n_0,
      O => moving_sum_next_carry_i_6_n_0
    );
moving_sum_next_carry_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9669"
    )
        port map (
      I0 => moving_sum(1),
      I1 => pos_count(1),
      I2 => \pos_shift_reg[9]\(1),
      I3 => moving_sum_next_carry_i_3_n_0,
      O => moving_sum_next_carry_i_7_n_0
    );
moving_sum_next_carry_i_8: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => pos_count(0),
      I1 => moving_sum(0),
      I2 => \pos_shift_reg[9]\(0),
      O => moving_sum_next_carry_i_8_n_0
    );
\moving_sum_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      CLR => reset,
      D => moving_sum_next_carry_n_7,
      Q => moving_sum(0)
    );
\moving_sum_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      CLR => reset,
      D => \moving_sum_next_carry__1_n_5\,
      Q => moving_sum(10)
    );
\moving_sum_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      CLR => reset,
      D => \moving_sum_next_carry__1_n_4\,
      Q => moving_sum(11)
    );
\moving_sum_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      CLR => reset,
      D => moving_sum_next_carry_n_6,
      Q => moving_sum(1)
    );
\moving_sum_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      CLR => reset,
      D => moving_sum_next_carry_n_5,
      Q => moving_sum(2)
    );
\moving_sum_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      CLR => reset,
      D => moving_sum_next_carry_n_4,
      Q => moving_sum(3)
    );
\moving_sum_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      CLR => reset,
      D => \moving_sum_next_carry__0_n_7\,
      Q => moving_sum(4)
    );
\moving_sum_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      CLR => reset,
      D => \moving_sum_next_carry__0_n_6\,
      Q => moving_sum(5)
    );
\moving_sum_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      CLR => reset,
      D => \moving_sum_next_carry__0_n_5\,
      Q => moving_sum(6)
    );
\moving_sum_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      CLR => reset,
      D => \moving_sum_next_carry__0_n_4\,
      Q => moving_sum(7)
    );
\moving_sum_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      CLR => reset,
      D => \moving_sum_next_carry__1_n_7\,
      Q => moving_sum(8)
    );
\moving_sum_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      CLR => reset,
      D => \moving_sum_next_carry__1_n_6\,
      Q => moving_sum(9)
    );
\pos_count_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \_inferred__0/i__carry_n_7\,
      Q => pos_count(0)
    );
\pos_count_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \_inferred__0/i__carry_n_6\,
      Q => pos_count(1)
    );
\pos_count_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \_inferred__0/i__carry_n_5\,
      Q => pos_count(2)
    );
\pos_count_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \_inferred__0/i__carry_n_4\,
      Q => pos_count(3)
    );
\pos_count_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \_inferred__0/i__carry__0_n_7\,
      Q => pos_count(4)
    );
\pos_count_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \_inferred__0/i__carry__0_n_6\,
      Q => pos_count(5)
    );
\pos_count_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \_inferred__0/i__carry__0_n_5\,
      Q => pos_count(6)
    );
\pos_count_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \_inferred__0/i__carry__0_n_4\,
      Q => pos_count(7)
    );
\pos_shift_reg[7][0]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => \moving_sum[11]_i_1_n_0\,
      CLK => mclk,
      D => pos_count(0),
      Q => \pos_shift_reg[7][0]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0\
    );
\pos_shift_reg[7][1]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => \moving_sum[11]_i_1_n_0\,
      CLK => mclk,
      D => pos_count(1),
      Q => \pos_shift_reg[7][1]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0\
    );
\pos_shift_reg[7][2]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => \moving_sum[11]_i_1_n_0\,
      CLK => mclk,
      D => pos_count(2),
      Q => \pos_shift_reg[7][2]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0\
    );
\pos_shift_reg[7][3]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => \moving_sum[11]_i_1_n_0\,
      CLK => mclk,
      D => pos_count(3),
      Q => \pos_shift_reg[7][3]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0\
    );
\pos_shift_reg[7][4]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => \moving_sum[11]_i_1_n_0\,
      CLK => mclk,
      D => pos_count(4),
      Q => \pos_shift_reg[7][4]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0\
    );
\pos_shift_reg[7][5]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => \moving_sum[11]_i_1_n_0\,
      CLK => mclk,
      D => pos_count(5),
      Q => \pos_shift_reg[7][5]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0\
    );
\pos_shift_reg[7][6]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => \moving_sum[11]_i_1_n_0\,
      CLK => mclk,
      D => pos_count(6),
      Q => \pos_shift_reg[7][6]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0\
    );
\pos_shift_reg[7][7]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => \moving_sum[11]_i_1_n_0\,
      CLK => mclk,
      D => pos_count(7),
      Q => \pos_shift_reg[7][7]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0\
    );
\pos_shift_reg[8][0]_U0_UUT_VEL_READ_pos_shift_reg_c_7\: unisim.vcomponents.FDRE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      D => \pos_shift_reg[7][0]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0\,
      Q => \pos_shift_reg[8][0]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0\,
      R => '0'
    );
\pos_shift_reg[8][1]_U0_UUT_VEL_READ_pos_shift_reg_c_7\: unisim.vcomponents.FDRE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      D => \pos_shift_reg[7][1]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0\,
      Q => \pos_shift_reg[8][1]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0\,
      R => '0'
    );
\pos_shift_reg[8][2]_U0_UUT_VEL_READ_pos_shift_reg_c_7\: unisim.vcomponents.FDRE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      D => \pos_shift_reg[7][2]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0\,
      Q => \pos_shift_reg[8][2]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0\,
      R => '0'
    );
\pos_shift_reg[8][3]_U0_UUT_VEL_READ_pos_shift_reg_c_7\: unisim.vcomponents.FDRE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      D => \pos_shift_reg[7][3]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0\,
      Q => \pos_shift_reg[8][3]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0\,
      R => '0'
    );
\pos_shift_reg[8][4]_U0_UUT_VEL_READ_pos_shift_reg_c_7\: unisim.vcomponents.FDRE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      D => \pos_shift_reg[7][4]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0\,
      Q => \pos_shift_reg[8][4]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0\,
      R => '0'
    );
\pos_shift_reg[8][5]_U0_UUT_VEL_READ_pos_shift_reg_c_7\: unisim.vcomponents.FDRE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      D => \pos_shift_reg[7][5]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0\,
      Q => \pos_shift_reg[8][5]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0\,
      R => '0'
    );
\pos_shift_reg[8][6]_U0_UUT_VEL_READ_pos_shift_reg_c_7\: unisim.vcomponents.FDRE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      D => \pos_shift_reg[7][6]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0\,
      Q => \pos_shift_reg[8][6]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0\,
      R => '0'
    );
\pos_shift_reg[8][7]_U0_UUT_VEL_READ_pos_shift_reg_c_7\: unisim.vcomponents.FDRE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      D => \pos_shift_reg[7][7]_srl8_U0_UUT_VEL_READ_pos_shift_reg_c_6_n_0\,
      Q => \pos_shift_reg[8][7]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0\,
      R => '0'
    );
\pos_shift_reg[9][0]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      CLR => reset,
      D => \pos_shift_reg_gate__6_n_0\,
      Q => \pos_shift_reg[9]\(0)
    );
\pos_shift_reg[9][1]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      CLR => reset,
      D => \pos_shift_reg_gate__5_n_0\,
      Q => \pos_shift_reg[9]\(1)
    );
\pos_shift_reg[9][2]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      CLR => reset,
      D => \pos_shift_reg_gate__4_n_0\,
      Q => \pos_shift_reg[9]\(2)
    );
\pos_shift_reg[9][3]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      CLR => reset,
      D => \pos_shift_reg_gate__3_n_0\,
      Q => \pos_shift_reg[9]\(3)
    );
\pos_shift_reg[9][4]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      CLR => reset,
      D => \pos_shift_reg_gate__2_n_0\,
      Q => \pos_shift_reg[9]\(4)
    );
\pos_shift_reg[9][5]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      CLR => reset,
      D => \pos_shift_reg_gate__1_n_0\,
      Q => \pos_shift_reg[9]\(5)
    );
\pos_shift_reg[9][6]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      CLR => reset,
      D => \pos_shift_reg_gate__0_n_0\,
      Q => \pos_shift_reg[9]\(6)
    );
\pos_shift_reg[9][7]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      CLR => reset,
      D => pos_shift_reg_gate_n_0,
      Q => \pos_shift_reg[9]\(7)
    );
pos_shift_reg_c: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      CLR => reset,
      D => '1',
      Q => pos_shift_reg_c_n_0
    );
pos_shift_reg_c_0: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      CLR => reset,
      D => pos_shift_reg_c_n_0,
      Q => pos_shift_reg_c_0_n_0
    );
pos_shift_reg_c_1: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      CLR => reset,
      D => pos_shift_reg_c_0_n_0,
      Q => pos_shift_reg_c_1_n_0
    );
pos_shift_reg_c_2: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      CLR => reset,
      D => pos_shift_reg_c_1_n_0,
      Q => pos_shift_reg_c_2_n_0
    );
pos_shift_reg_c_3: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      CLR => reset,
      D => pos_shift_reg_c_2_n_0,
      Q => pos_shift_reg_c_3_n_0
    );
pos_shift_reg_c_4: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      CLR => reset,
      D => pos_shift_reg_c_3_n_0,
      Q => pos_shift_reg_c_4_n_0
    );
pos_shift_reg_c_5: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      CLR => reset,
      D => pos_shift_reg_c_4_n_0,
      Q => pos_shift_reg_c_5_n_0
    );
pos_shift_reg_c_6: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      CLR => reset,
      D => pos_shift_reg_c_5_n_0,
      Q => pos_shift_reg_c_6_n_0
    );
pos_shift_reg_c_7: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => \moving_sum[11]_i_1_n_0\,
      CLR => reset,
      D => pos_shift_reg_c_6_n_0,
      Q => pos_shift_reg_c_7_n_0
    );
pos_shift_reg_gate: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \pos_shift_reg[8][7]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0\,
      I1 => pos_shift_reg_c_7_n_0,
      O => pos_shift_reg_gate_n_0
    );
\pos_shift_reg_gate__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \pos_shift_reg[8][6]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0\,
      I1 => pos_shift_reg_c_7_n_0,
      O => \pos_shift_reg_gate__0_n_0\
    );
\pos_shift_reg_gate__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \pos_shift_reg[8][5]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0\,
      I1 => pos_shift_reg_c_7_n_0,
      O => \pos_shift_reg_gate__1_n_0\
    );
\pos_shift_reg_gate__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \pos_shift_reg[8][4]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0\,
      I1 => pos_shift_reg_c_7_n_0,
      O => \pos_shift_reg_gate__2_n_0\
    );
\pos_shift_reg_gate__3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \pos_shift_reg[8][3]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0\,
      I1 => pos_shift_reg_c_7_n_0,
      O => \pos_shift_reg_gate__3_n_0\
    );
\pos_shift_reg_gate__4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \pos_shift_reg[8][2]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0\,
      I1 => pos_shift_reg_c_7_n_0,
      O => \pos_shift_reg_gate__4_n_0\
    );
\pos_shift_reg_gate__5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \pos_shift_reg[8][1]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0\,
      I1 => pos_shift_reg_c_7_n_0,
      O => \pos_shift_reg_gate__5_n_0\
    );
\pos_shift_reg_gate__6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \pos_shift_reg[8][0]_U0_UUT_VEL_READ_pos_shift_reg_c_7_n_0\,
      I1 => pos_shift_reg_c_7_n_0,
      O => \pos_shift_reg_gate__6_n_0\
    );
\rcount[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF00000000"
    )
        port map (
      I0 => rcount_reg(16),
      I1 => rcount_reg(19),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => rcount_reg(17),
      I4 => rcount_reg(18),
      I5 => rcount_reg(0),
      O => \rcount[0]_i_2_n_0\
    );
\rcount[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF00000000"
    )
        port map (
      I0 => rcount_reg(16),
      I1 => rcount_reg(19),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => rcount_reg(17),
      I4 => rcount_reg(18),
      I5 => rcount_reg(3),
      O => \rcount[0]_i_3_n_0\
    );
\rcount[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF00000000"
    )
        port map (
      I0 => rcount_reg(16),
      I1 => rcount_reg(19),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => rcount_reg(17),
      I4 => rcount_reg(18),
      I5 => rcount_reg(2),
      O => \rcount[0]_i_4_n_0\
    );
\rcount[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF00000000"
    )
        port map (
      I0 => rcount_reg(16),
      I1 => rcount_reg(19),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => rcount_reg(17),
      I4 => rcount_reg(18),
      I5 => rcount_reg(1),
      O => \rcount[0]_i_5_n_0\
    );
\rcount[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000007FFFFFFF"
    )
        port map (
      I0 => rcount_reg(16),
      I1 => rcount_reg(19),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => rcount_reg(17),
      I4 => rcount_reg(18),
      I5 => rcount_reg(0),
      O => \rcount[0]_i_6_n_0\
    );
\rcount[0]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEAAAAAAAA"
    )
        port map (
      I0 => rcount_reg(15),
      I1 => rcount_reg(10),
      I2 => \rcount[0]_i_8_n_0\,
      I3 => rcount_reg(11),
      I4 => rcount_reg(12),
      I5 => rcount_reg(14),
      O => \rcount[0]_i_7_n_0\
    );
\rcount[0]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEAAAAAAAA"
    )
        port map (
      I0 => rcount_reg(13),
      I1 => rcount_reg(7),
      I2 => rcount_reg(6),
      I3 => \rcount[0]_i_9_n_0\,
      I4 => rcount_reg(8),
      I5 => rcount_reg(9),
      O => \rcount[0]_i_8_n_0\
    );
\rcount[0]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => rcount_reg(2),
      I1 => rcount_reg(1),
      I2 => rcount_reg(5),
      I3 => rcount_reg(0),
      I4 => rcount_reg(3),
      I5 => rcount_reg(4),
      O => \rcount[0]_i_9_n_0\
    );
\rcount[12]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF00000000"
    )
        port map (
      I0 => rcount_reg(16),
      I1 => rcount_reg(19),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => rcount_reg(17),
      I4 => rcount_reg(18),
      I5 => rcount_reg(15),
      O => \rcount[12]_i_2_n_0\
    );
\rcount[12]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF00000000"
    )
        port map (
      I0 => rcount_reg(16),
      I1 => rcount_reg(19),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => rcount_reg(17),
      I4 => rcount_reg(18),
      I5 => rcount_reg(14),
      O => \rcount[12]_i_3_n_0\
    );
\rcount[12]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF00000000"
    )
        port map (
      I0 => rcount_reg(16),
      I1 => rcount_reg(19),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => rcount_reg(17),
      I4 => rcount_reg(18),
      I5 => rcount_reg(13),
      O => \rcount[12]_i_4_n_0\
    );
\rcount[12]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF00000000"
    )
        port map (
      I0 => rcount_reg(16),
      I1 => rcount_reg(19),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => rcount_reg(17),
      I4 => rcount_reg(18),
      I5 => rcount_reg(12),
      O => \rcount[12]_i_5_n_0\
    );
\rcount[16]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4CCCCCCC"
    )
        port map (
      I0 => rcount_reg(16),
      I1 => rcount_reg(19),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => rcount_reg(17),
      I4 => rcount_reg(18),
      O => \rcount[16]_i_2_n_0\
    );
\rcount[16]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF0000"
    )
        port map (
      I0 => rcount_reg(16),
      I1 => rcount_reg(19),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => rcount_reg(17),
      I4 => rcount_reg(18),
      O => \rcount[16]_i_3_n_0\
    );
\rcount[16]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F00FF00"
    )
        port map (
      I0 => rcount_reg(16),
      I1 => rcount_reg(19),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => rcount_reg(17),
      I4 => rcount_reg(18),
      O => \rcount[16]_i_4_n_0\
    );
\rcount[16]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2AAAAAAA"
    )
        port map (
      I0 => rcount_reg(16),
      I1 => rcount_reg(19),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => rcount_reg(17),
      I4 => rcount_reg(18),
      O => \rcount[16]_i_5_n_0\
    );
\rcount[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF00000000"
    )
        port map (
      I0 => rcount_reg(16),
      I1 => rcount_reg(19),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => rcount_reg(17),
      I4 => rcount_reg(18),
      I5 => rcount_reg(7),
      O => \rcount[4]_i_2_n_0\
    );
\rcount[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF00000000"
    )
        port map (
      I0 => rcount_reg(16),
      I1 => rcount_reg(19),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => rcount_reg(17),
      I4 => rcount_reg(18),
      I5 => rcount_reg(6),
      O => \rcount[4]_i_3_n_0\
    );
\rcount[4]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF00000000"
    )
        port map (
      I0 => rcount_reg(16),
      I1 => rcount_reg(19),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => rcount_reg(17),
      I4 => rcount_reg(18),
      I5 => rcount_reg(5),
      O => \rcount[4]_i_4_n_0\
    );
\rcount[4]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF00000000"
    )
        port map (
      I0 => rcount_reg(16),
      I1 => rcount_reg(19),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => rcount_reg(17),
      I4 => rcount_reg(18),
      I5 => rcount_reg(4),
      O => \rcount[4]_i_5_n_0\
    );
\rcount[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF00000000"
    )
        port map (
      I0 => rcount_reg(16),
      I1 => rcount_reg(19),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => rcount_reg(17),
      I4 => rcount_reg(18),
      I5 => rcount_reg(11),
      O => \rcount[8]_i_2_n_0\
    );
\rcount[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF00000000"
    )
        port map (
      I0 => rcount_reg(16),
      I1 => rcount_reg(19),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => rcount_reg(17),
      I4 => rcount_reg(18),
      I5 => rcount_reg(10),
      O => \rcount[8]_i_3_n_0\
    );
\rcount[8]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF00000000"
    )
        port map (
      I0 => rcount_reg(16),
      I1 => rcount_reg(19),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => rcount_reg(17),
      I4 => rcount_reg(18),
      I5 => rcount_reg(9),
      O => \rcount[8]_i_4_n_0\
    );
\rcount[8]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF00000000"
    )
        port map (
      I0 => rcount_reg(16),
      I1 => rcount_reg(19),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => rcount_reg(17),
      I4 => rcount_reg(18),
      I5 => rcount_reg(8),
      O => \rcount[8]_i_5_n_0\
    );
\rcount_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[0]_i_1_n_7\,
      Q => rcount_reg(0)
    );
\rcount_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \rcount_reg[0]_i_1_n_0\,
      CO(2) => \rcount_reg[0]_i_1_n_1\,
      CO(1) => \rcount_reg[0]_i_1_n_2\,
      CO(0) => \rcount_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \rcount[0]_i_2_n_0\,
      O(3) => \rcount_reg[0]_i_1_n_4\,
      O(2) => \rcount_reg[0]_i_1_n_5\,
      O(1) => \rcount_reg[0]_i_1_n_6\,
      O(0) => \rcount_reg[0]_i_1_n_7\,
      S(3) => \rcount[0]_i_3_n_0\,
      S(2) => \rcount[0]_i_4_n_0\,
      S(1) => \rcount[0]_i_5_n_0\,
      S(0) => \rcount[0]_i_6_n_0\
    );
\rcount_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[8]_i_1_n_5\,
      Q => rcount_reg(10)
    );
\rcount_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[8]_i_1_n_4\,
      Q => rcount_reg(11)
    );
\rcount_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[12]_i_1_n_7\,
      Q => rcount_reg(12)
    );
\rcount_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \rcount_reg[8]_i_1_n_0\,
      CO(3) => \rcount_reg[12]_i_1_n_0\,
      CO(2) => \rcount_reg[12]_i_1_n_1\,
      CO(1) => \rcount_reg[12]_i_1_n_2\,
      CO(0) => \rcount_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \rcount_reg[12]_i_1_n_4\,
      O(2) => \rcount_reg[12]_i_1_n_5\,
      O(1) => \rcount_reg[12]_i_1_n_6\,
      O(0) => \rcount_reg[12]_i_1_n_7\,
      S(3) => \rcount[12]_i_2_n_0\,
      S(2) => \rcount[12]_i_3_n_0\,
      S(1) => \rcount[12]_i_4_n_0\,
      S(0) => \rcount[12]_i_5_n_0\
    );
\rcount_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[12]_i_1_n_6\,
      Q => rcount_reg(13)
    );
\rcount_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[12]_i_1_n_5\,
      Q => rcount_reg(14)
    );
\rcount_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[12]_i_1_n_4\,
      Q => rcount_reg(15)
    );
\rcount_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[16]_i_1_n_7\,
      Q => rcount_reg(16)
    );
\rcount_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \rcount_reg[12]_i_1_n_0\,
      CO(3) => \NLW_rcount_reg[16]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \rcount_reg[16]_i_1_n_1\,
      CO(1) => \rcount_reg[16]_i_1_n_2\,
      CO(0) => \rcount_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \rcount_reg[16]_i_1_n_4\,
      O(2) => \rcount_reg[16]_i_1_n_5\,
      O(1) => \rcount_reg[16]_i_1_n_6\,
      O(0) => \rcount_reg[16]_i_1_n_7\,
      S(3) => \rcount[16]_i_2_n_0\,
      S(2) => \rcount[16]_i_3_n_0\,
      S(1) => \rcount[16]_i_4_n_0\,
      S(0) => \rcount[16]_i_5_n_0\
    );
\rcount_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[16]_i_1_n_6\,
      Q => rcount_reg(17)
    );
\rcount_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[16]_i_1_n_5\,
      Q => rcount_reg(18)
    );
\rcount_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[16]_i_1_n_4\,
      Q => rcount_reg(19)
    );
\rcount_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[0]_i_1_n_6\,
      Q => rcount_reg(1)
    );
\rcount_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[0]_i_1_n_5\,
      Q => rcount_reg(2)
    );
\rcount_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[0]_i_1_n_4\,
      Q => rcount_reg(3)
    );
\rcount_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[4]_i_1_n_7\,
      Q => rcount_reg(4)
    );
\rcount_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \rcount_reg[0]_i_1_n_0\,
      CO(3) => \rcount_reg[4]_i_1_n_0\,
      CO(2) => \rcount_reg[4]_i_1_n_1\,
      CO(1) => \rcount_reg[4]_i_1_n_2\,
      CO(0) => \rcount_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \rcount_reg[4]_i_1_n_4\,
      O(2) => \rcount_reg[4]_i_1_n_5\,
      O(1) => \rcount_reg[4]_i_1_n_6\,
      O(0) => \rcount_reg[4]_i_1_n_7\,
      S(3) => \rcount[4]_i_2_n_0\,
      S(2) => \rcount[4]_i_3_n_0\,
      S(1) => \rcount[4]_i_4_n_0\,
      S(0) => \rcount[4]_i_5_n_0\
    );
\rcount_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[4]_i_1_n_6\,
      Q => rcount_reg(5)
    );
\rcount_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[4]_i_1_n_5\,
      Q => rcount_reg(6)
    );
\rcount_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[4]_i_1_n_4\,
      Q => rcount_reg(7)
    );
\rcount_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[8]_i_1_n_7\,
      Q => rcount_reg(8)
    );
\rcount_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \rcount_reg[4]_i_1_n_0\,
      CO(3) => \rcount_reg[8]_i_1_n_0\,
      CO(2) => \rcount_reg[8]_i_1_n_1\,
      CO(1) => \rcount_reg[8]_i_1_n_2\,
      CO(0) => \rcount_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \rcount_reg[8]_i_1_n_4\,
      O(2) => \rcount_reg[8]_i_1_n_5\,
      O(1) => \rcount_reg[8]_i_1_n_6\,
      O(0) => \rcount_reg[8]_i_1_n_7\,
      S(3) => \rcount[8]_i_2_n_0\,
      S(2) => \rcount[8]_i_3_n_0\,
      S(1) => \rcount[8]_i_4_n_0\,
      S(0) => \rcount[8]_i_5_n_0\
    );
\rcount_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[8]_i_1_n_6\,
      Q => rcount_reg(9)
    );
velocity1_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => velocity1,
      CO(2) => velocity1_carry_n_1,
      CO(1) => velocity1_carry_n_2,
      CO(0) => velocity1_carry_n_3,
      CYINIT => '0',
      DI(3) => velocity1_carry_i_1_n_0,
      DI(2) => '0',
      DI(1) => velocity1_carry_i_2_n_0,
      DI(0) => velocity2(5),
      O(3 downto 0) => NLW_velocity1_carry_O_UNCONNECTED(3 downto 0),
      S(3) => velocity1_carry_i_4_n_0,
      S(2) => velocity1_carry_i_5_n_0,
      S(1) => velocity1_carry_i_6_n_0,
      S(0) => velocity1_carry_i_7_n_0
    );
velocity1_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0CAC"
    )
        port map (
      I0 => velocity3(10),
      I1 => moving_sum(10),
      I2 => moving_sum(11),
      I3 => velocity3(11),
      O => velocity1_carry_i_1_n_0
    );
velocity1_carry_i_10: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => velocity1_carry_i_10_n_0,
      CO(2) => velocity1_carry_i_10_n_1,
      CO(1) => velocity1_carry_i_10_n_2,
      CO(0) => velocity1_carry_i_10_n_3,
      CYINIT => \gpio2[1]_INST_0_i_2_n_0\,
      DI(3 downto 0) => B"0000",
      O(3) => velocity3(4),
      O(2 downto 0) => NLW_velocity1_carry_i_10_O_UNCONNECTED(2 downto 0),
      S(3) => velocity1_carry_i_18_n_0,
      S(2) => velocity1_carry_i_19_n_0,
      S(1) => velocity1_carry_i_20_n_0,
      S(0) => velocity1_carry_i_21_n_0
    );
velocity1_carry_i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(11),
      O => velocity1_carry_i_11_n_0
    );
velocity1_carry_i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(10),
      O => velocity1_carry_i_12_n_0
    );
velocity1_carry_i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(9),
      O => velocity1_carry_i_13_n_0
    );
velocity1_carry_i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(8),
      O => velocity1_carry_i_14_n_0
    );
velocity1_carry_i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(7),
      O => velocity1_carry_i_15_n_0
    );
velocity1_carry_i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(6),
      O => velocity1_carry_i_16_n_0
    );
velocity1_carry_i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(5),
      O => velocity1_carry_i_17_n_0
    );
velocity1_carry_i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(4),
      O => velocity1_carry_i_18_n_0
    );
velocity1_carry_i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(3),
      O => velocity1_carry_i_19_n_0
    );
velocity1_carry_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFCFFACA"
    )
        port map (
      I0 => moving_sum(6),
      I1 => velocity3(6),
      I2 => moving_sum(11),
      I3 => velocity3(7),
      I4 => moving_sum(7),
      O => velocity1_carry_i_2_n_0
    );
velocity1_carry_i_20: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(2),
      O => velocity1_carry_i_20_n_0
    );
velocity1_carry_i_21: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(1),
      O => velocity1_carry_i_21_n_0
    );
velocity1_carry_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => moving_sum(5),
      I1 => velocity3(5),
      I2 => moving_sum(11),
      O => velocity2(5)
    );
velocity1_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0353"
    )
        port map (
      I0 => velocity3(10),
      I1 => moving_sum(10),
      I2 => moving_sum(11),
      I3 => velocity3(11),
      O => velocity1_carry_i_4_n_0
    );
velocity1_carry_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AC0CA000"
    )
        port map (
      I0 => velocity3(8),
      I1 => moving_sum(8),
      I2 => moving_sum(11),
      I3 => velocity3(9),
      I4 => moving_sum(9),
      O => velocity1_carry_i_5_n_0
    );
velocity1_carry_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00500353"
    )
        port map (
      I0 => velocity3(6),
      I1 => moving_sum(6),
      I2 => moving_sum(11),
      I3 => velocity3(7),
      I4 => moving_sum(7),
      O => velocity1_carry_i_6_n_0
    );
velocity1_carry_i_7: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00A00CAC"
    )
        port map (
      I0 => velocity3(4),
      I1 => moving_sum(4),
      I2 => moving_sum(11),
      I3 => velocity3(5),
      I4 => moving_sum(5),
      O => velocity1_carry_i_7_n_0
    );
velocity1_carry_i_8: unisim.vcomponents.CARRY4
     port map (
      CI => velocity1_carry_i_9_n_0,
      CO(3 downto 2) => NLW_velocity1_carry_i_8_CO_UNCONNECTED(3 downto 2),
      CO(1) => velocity1_carry_i_8_n_2,
      CO(0) => velocity1_carry_i_8_n_3,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => NLW_velocity1_carry_i_8_O_UNCONNECTED(3),
      O(2 downto 0) => velocity3(11 downto 9),
      S(3) => '0',
      S(2) => velocity1_carry_i_11_n_0,
      S(1) => velocity1_carry_i_12_n_0,
      S(0) => velocity1_carry_i_13_n_0
    );
velocity1_carry_i_9: unisim.vcomponents.CARRY4
     port map (
      CI => velocity1_carry_i_10_n_0,
      CO(3) => velocity1_carry_i_9_n_0,
      CO(2) => velocity1_carry_i_9_n_1,
      CO(1) => velocity1_carry_i_9_n_2,
      CO(0) => velocity1_carry_i_9_n_3,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => velocity3(8 downto 5),
      S(3) => velocity1_carry_i_14_n_0,
      S(2) => velocity1_carry_i_15_n_0,
      S(1) => velocity1_carry_i_16_n_0,
      S(0) => velocity1_carry_i_17_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity tutorial_bd_fpga_system_0_0_fpga_system is
  port (
    c_reg : out STD_LOGIC;
    \moving_sum_reg[11]\ : out STD_LOGIC;
    \moving_sum_reg[11]_0\ : out STD_LOGIC;
    DIR_synch : out STD_LOGIC;
    EN_synch : out STD_LOGIC;
    abcdefg : out STD_LOGIC_VECTOR ( 6 downto 0 );
    \moving_sum_reg[7]\ : out STD_LOGIC;
    \moving_sum_reg[8]\ : out STD_LOGIC;
    \moving_sum_reg[9]\ : out STD_LOGIC;
    \moving_sum_reg[11]_1\ : out STD_LOGIC;
    \moving_sum_reg[11]_2\ : out STD_LOGIC;
    \moving_sum_reg[5]\ : out STD_LOGIC;
    mclk : in STD_LOGIC;
    reset : in STD_LOGIC;
    SA : in STD_LOGIC;
    SB : in STD_LOGIC;
    gpio : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of tutorial_bd_fpga_system_0_0_fpga_system : entity is "fpga_system";
end tutorial_bd_fpga_system_0_0_fpga_system;

architecture STRUCTURE of tutorial_bd_fpga_system_0_0_fpga_system is
  signal SA_synch : STD_LOGIC;
  signal SB_synch : STD_LOGIC;
  signal \__11\ : STD_LOGIC;
  signal \^c_reg\ : STD_LOGIC;
  signal dir : STD_LOGIC;
  signal en : STD_LOGIC;
  signal pos_dec : STD_LOGIC;
begin
  c_reg <= \^c_reg\;
UUT_IN_SYNC: entity work.tutorial_bd_fpga_system_0_0_input_sync
     port map (
      SA => SA,
      SA_synch => SA_synch,
      SB => SB,
      SB_synch => SB_synch,
      mclk => mclk
    );
UUT_OUT_SYNC: entity work.tutorial_bd_fpga_system_0_0_output_sync
     port map (
      DIR_synch => DIR_synch,
      EN_synch => EN_synch,
      dir => dir,
      en => en,
      mclk => mclk
    );
UUT_PWM: entity work.tutorial_bd_fpga_system_0_0_pulse_width_modulator
     port map (
      dir => dir,
      en => en,
      gpio(7 downto 0) => gpio(7 downto 0),
      mclk => mclk,
      reset => reset
    );
UUT_QUAD_DEC: entity work.tutorial_bd_fpga_system_0_0_quadrature_decoder
     port map (
      SA_synch => SA_synch,
      SB_synch => SB_synch,
      \__11\ => \__11\,
      mclk => mclk,
      pos_dec => pos_dec,
      reset => reset
    );
UUT_S7C: entity work.tutorial_bd_fpga_system_0_0_seg7ctrl
     port map (
      c_reg_0 => \^c_reg\,
      mclk => mclk,
      reset => reset
    );
UUT_VEL_READ: entity work.tutorial_bd_fpga_system_0_0_velocity_reader
     port map (
      \__11\ => \__11\,
      abcdefg(6 downto 0) => abcdefg(6 downto 0),
      abcdefg_1_sp_1 => \^c_reg\,
      mclk => mclk,
      \moving_sum_reg[11]_0\ => \moving_sum_reg[11]\,
      \moving_sum_reg[11]_1\ => \moving_sum_reg[11]_0\,
      \moving_sum_reg[11]_2\ => \moving_sum_reg[11]_1\,
      \moving_sum_reg[11]_3\ => \moving_sum_reg[11]_2\,
      \moving_sum_reg[5]_0\ => \moving_sum_reg[5]\,
      \moving_sum_reg[7]_0\ => \moving_sum_reg[7]\,
      \moving_sum_reg[8]_0\ => \moving_sum_reg[8]\,
      \moving_sum_reg[9]_0\ => \moving_sum_reg[9]\,
      pos_dec => pos_dec,
      reset => reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity tutorial_bd_fpga_system_0_0 is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of tutorial_bd_fpga_system_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of tutorial_bd_fpga_system_0_0 : entity is "tutorial_bd_fpga_system_0_0,fpga_system,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of tutorial_bd_fpga_system_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of tutorial_bd_fpga_system_0_0 : entity is "package_project";
  attribute x_core_info : string;
  attribute x_core_info of tutorial_bd_fpga_system_0_0 : entity is "fpga_system,Vivado 2020.2";
end tutorial_bd_fpga_system_0_0;

architecture STRUCTURE of tutorial_bd_fpga_system_0_0 is
  attribute x_interface_info : string;
  attribute x_interface_info of reset : signal is "xilinx.com:signal:reset:1.0 reset RST";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of reset : signal is "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
U0: entity work.tutorial_bd_fpga_system_0_0_fpga_system
     port map (
      DIR_synch => DIR_synch,
      EN_synch => EN_synch,
      SA => SA,
      SB => SB,
      abcdefg(6 downto 0) => abcdefg(6 downto 0),
      c_reg => c,
      gpio(7 downto 0) => gpio(7 downto 0),
      mclk => mclk,
      \moving_sum_reg[11]\ => gpio2(1),
      \moving_sum_reg[11]_0\ => gpio2(3),
      \moving_sum_reg[11]_1\ => gpio2(7),
      \moving_sum_reg[11]_2\ => gpio2(0),
      \moving_sum_reg[5]\ => gpio2(2),
      \moving_sum_reg[7]\ => gpio2(4),
      \moving_sum_reg[8]\ => gpio2(5),
      \moving_sum_reg[9]\ => gpio2(6),
      reset => reset
    );
end STRUCTURE;
