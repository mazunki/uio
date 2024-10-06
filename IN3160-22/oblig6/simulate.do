vsim -vopt work.tb_bin2ssd(beh)
add wave -r /*
run 500 ns
quit -sim

vsim -vopt work.tb_seg7ctrl(tb_beh)
add wave -r /*
run 500 ns
quit -sim

vsim -vopt work.tb_seg7ctrl(tb_rom)
add wave -r /*
run 1 sec
quit -sim

