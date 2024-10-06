vsim -novopt work.test_first
add wave sim:/test_first/UUT/clk
add wave sim:/test_first/UUT/reset
add wave sim:/test_first/UUT/load
add wave sim:/test_first/UUT/inp
add wave sim:/test_first/UUT/count
add wave sim:/test_first/UUT/max_count
run 1 us
