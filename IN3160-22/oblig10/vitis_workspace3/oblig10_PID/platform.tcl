# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /uio/hume/student-u81/rolfvh/IN3160-22/oblig10/vitis_workspace3/oblig10_PID/platform.tcl
# 
# OR launch xsct and run below command.
# source /uio/hume/student-u81/rolfvh/IN3160-22/oblig10/vitis_workspace3/oblig10_PID/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {oblig10_PID}\
-hw {/uio/hume/student-u81/rolfvh/IN3160-22/oblig10/oblig_10_system/oblig10_PID.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -fsbl-target {psu_cortexa53_0} -out {/uio/hume/student-u81/rolfvh/IN3160-22/oblig10/vitis_workspace3}

platform write
platform generate -domains 
platform active {oblig10_PID}
platform generate
