onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+tutorial_bd -L xilinx_vip -L xil_defaultlib -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.tutorial_bd xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {tutorial_bd.udo}

run -all

endsim

quit -force
