SetActiveLib -work
comp -include "$DSN\src\BOOTH.vhd" 
comp -include "$DSN\src\TestBench\booth_TB.vhd" 
asim TESTBENCH_FOR_booth 
wave 
wave -noreg A
wave -noreg B
wave -noreg C
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$DSN\src\TestBench\booth_TB_tim_cfg.vhd" 
# asim TIMING_FOR_booth 
