# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: /uio/hume/student-u81/rolfvh/IN3160-22/oblig10/vitis_workspace2/hello_world_system/_ide/scripts/debugger_hello_world-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source /uio/hume/student-u81/rolfvh/IN3160-22/oblig10/vitis_workspace2/hello_world_system/_ide/scripts/debugger_hello_world-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zed 210248779875" && level==0 && jtag_device_ctx=="jsn-Zed-210248779875-23727093-0"}
fpga -file /uio/hume/student-u81/rolfvh/IN3160-22/oblig10/vitis_workspace2/hello_world/_ide/bitstream/tutorial_bd_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw /uio/hume/student-u81/rolfvh/IN3160-22/oblig10/vitis_workspace2/hw_platform/export/hw_platform/hw/tutorial_bd_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source /uio/hume/student-u81/rolfvh/IN3160-22/oblig10/vitis_workspace2/hello_world/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow /uio/hume/student-u81/rolfvh/IN3160-22/oblig10/vitis_workspace2/hello_world/Debug/hello_world.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
