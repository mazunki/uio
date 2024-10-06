# Connect to the Digilent Cable on localhost:3121
open_hw_manager
connect_hw_server -url localhost:3121
#current_hw_target [get_hw_targets */xilinx_tcf/Digilent/12345] Alternative but not as flexible
current_hw_target [lindex [get_hw_targets] 0]
open_hw_target

# Program the Device
current_hw_device [lindex [get_hw_devices] 1]
set_property PROGRAM.FILE {./project_2/project_2.runs/impl_1/self_test_system.bit} [lindex [get_hw_devices] 1] 

program_hw_devices [lindex [get_hw_devices] 1]
refresh_hw_device [lindex [get_hw_devices] 1]
