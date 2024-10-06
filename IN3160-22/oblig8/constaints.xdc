
# clock
create_clock -period 10.000 -name clk100hz -waveform {0.000 5.000} [get_ports {mclk}]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {mclk}]

# inputs
set_property PACKAGE_PIN Y9  [get_ports {mclk}]
set_property PACKAGE_PIN R18 [get_ports {reset}]
set_property PACKAGE_PIN V10 [get_ports {SA}]
set_property PACKAGE_PIN W8  [get_ports {SB}]

set_property IOSTANDARD LVCMOS33 [get_ports {mclk}]
set_property IOSTANDARD LVCMOS33 [get_ports {reset}]

set_property IOSTANDARD LVCMOS33 [get_ports {SA}]
set_property IOSTANDARD LVCMOS33 [get_ports {SB}]

set_input_delay -clock clk100hz -max 4.0 [get_ports {reset}]
                    
set_input_delay -clock clk100hz -max 4.0 [get_ports {SA}]
set_input_delay -clock clk100hz -max 4.0 [get_ports {SB}]

# outputs
set_property PACKAGE_PIN AB7 [get_ports {abcdefg[6]}]
set_property PACKAGE_PIN AB6 [get_ports {abcdefg[5]}]
set_property PACKAGE_PIN Y4  [get_ports {abcdefg[4]}]
set_property PACKAGE_PIN AA4 [get_ports {abcdefg[3]}]
set_property PACKAGE_PIN V7  [get_ports {abcdefg[2]}]
set_property PACKAGE_PIN W7  [get_ports {abcdefg[1]}]
set_property PACKAGE_PIN V5  [get_ports {abcdefg[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {abcdefg[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {abcdefg[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {abcdefg[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {abcdefg[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {abcdefg[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {abcdefg[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {abcdefg[0]}]

# set_output_delay -clock clk100hz -max 20.0 [get_ports {abcdefg[6]}]
# set_output_delay -clock clk100hz -max 20.0 [get_ports {abcdefg[5]}]
# set_output_delay -clock clk100hz -max 20.0 [get_ports {abcdefg[4]}]
# set_output_delay -clock clk100hz -max 20.0 [get_ports {abcdefg[3]}]
# set_output_delay -clock clk100hz -max 20.0 [get_ports {abcdefg[2]}]
# set_output_delay -clock clk100hz -max 20.0 [get_ports {abcdefg[1]}]
# set_output_delay -clock clk100hz -max 20.0 [get_ports {abcdefg[0]}]

set_property PACKAGE_PIN W12 [get_ports {DIR_synch}]
set_property PACKAGE_PIN W11 [get_ports {EN_synch}]
set_property PACKAGE_PIN V4  [get_ports {c}]

set_property IOSTANDARD LVCMOS33 [get_ports {DIR_synch}]
set_property IOSTANDARD LVCMOS33 [get_ports {EN_synch}]
set_property IOSTANDARD LVCMOS33 [get_ports {c}]

# set_output_delay -clock clk100hz -max 20.0 [get_ports {DIR_synch}]
# set_output_delay -clock clk100hz -max 20.0 [get_ports {EN_synch}]
# set_output_delay -clock clk100hz -max 20.0 [get_ports {c}]



