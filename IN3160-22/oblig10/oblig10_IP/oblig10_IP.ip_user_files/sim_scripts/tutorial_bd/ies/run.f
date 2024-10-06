-makelib ies_lib/xilinx_vip -sv \
  "/opt/ifi/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "/opt/ifi/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "/opt/ifi/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "/opt/ifi/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "/opt/ifi/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "/opt/ifi/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "/opt/ifi/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "/opt/ifi/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "/opt/ifi/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/tutorial_bd/ip/tutorial_bd_processing_system7_0_0/tutorial_bd_processing_system7_0_0_sim_netlist.vhdl" \
  "../../../bd/tutorial_bd/sim/tutorial_bd.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

