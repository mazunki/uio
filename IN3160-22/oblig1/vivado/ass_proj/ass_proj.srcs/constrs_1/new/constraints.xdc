
# assigning ports
set_property PACKAGE_PIN U21 [get_ports {count[3]}]
set_property PACKAGE_PIN U22 [get_ports {count[2]}]
set_property PACKAGE_PIN T21 [get_ports {count[1]}]
set_property PACKAGE_PIN T22 [get_ports {count[0]}]
set_property PACKAGE_PIN F21 [get_ports {inp[3]}]
set_property PACKAGE_PIN H22 [get_ports {inp[2]}]
set_property PACKAGE_PIN G22 [get_ports {inp[1]}]
set_property PACKAGE_PIN F22 [get_ports {inp[0]}]
set_property PACKAGE_PIN T18 [get_ports clk]
set_property PACKAGE_PIN M15 [get_ports load]
set_property PACKAGE_PIN U14 [get_ports max_count]
set_property PACKAGE_PIN P16 [get_ports reset]

# more ports yolo
set_property PACKAGE_PIN H17 [get_ports up]
set_property PACKAGE_PIN U19 [get_ports min_count]

# setting pins to 3.3V
set_property IOSTANDARD LVCMOS33 [get_ports {inp[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {inp[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {inp[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {inp[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports load]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

# more 3.3v
set_property IOSTANDARD LVCMOS33 [get_ports up]

# idk what this does tbh
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk]

# this doesn't even work? what should it do anyway
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 33]]

# clock created with vivado which for whatever reason uses 20us in the image
# but the text says period=10us so welp idk
create_clock -period 20.000 -waveform {0.000 10.000} [get_ports clk]

