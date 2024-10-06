# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /uio/hume/student-u81/rolfvh/IN3160-22/oblig10/vitis_workspace2/hw_platform/platform.tcl
# 
# OR launch xsct and run below command.
# source /uio/hume/student-u81/rolfvh/IN3160-22/oblig10/vitis_workspace2/hw_platform/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {hw_platform}\
-hw {/uio/hume/student-u81/rolfvh/IN3160-22/oblig10/oblig_10_system/tutorial_bd_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -fsbl-target {psu_cortexa53_0} -out {/uio/hume/student-u81/rolfvh/IN3160-22/oblig10/vitis_workspace2}

platform write
platform generate -domains 
platform active {hw_platform}
platform generate
platform active {hw_platform}
platform config -updatehw {/uio/hume/student-u81/rolfvh/IN3160-22/oblig10/oblig_10_system/tutorial_bd_wrapper.xsa}
platform generate -domains 
