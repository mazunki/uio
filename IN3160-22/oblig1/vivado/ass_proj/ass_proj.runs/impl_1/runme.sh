#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/uio/kant/ifi-project06/robin/programs/Vitis/2020.2/bin:/uio/kant/ifi-project06/robin/programs/Vivado/2020.2/ids_lite/ISE/bin/lin64:/uio/kant/ifi-project06/robin/programs/Vivado/2020.2/bin
else
  PATH=/uio/kant/ifi-project06/robin/programs/Vitis/2020.2/bin:/uio/kant/ifi-project06/robin/programs/Vivado/2020.2/ids_lite/ISE/bin/lin64:/uio/kant/ifi-project06/robin/programs/Vivado/2020.2/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/uio/hume/student-u81/rolfvh/IN3160-22/oblig1/vivado/ass_proj/ass_proj.runs/impl_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

# pre-commands:
/bin/touch .write_bitstream.begin.rst
EAStep vivado -log FIRST.vdi -applog -m64 -product Vivado -messageDb vivado.pb -mode batch -source FIRST.tcl -notrace

