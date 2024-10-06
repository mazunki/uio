
vsim work.self_test_system -voptargs=+acc
add wave -r /*

force -freeze sim:/self_test_system/reset 0 0
force -freeze sim:/self_test_system/mclk 1 0, 0 {5 ns} -r 10ns

run 10 ns
force -freeze sim:/self_test_system/reset 1 0
run 20 ns
force -freeze sim:/self_test_system/reset 0 0

run 1000 ns

