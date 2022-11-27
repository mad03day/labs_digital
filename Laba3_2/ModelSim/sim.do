
###########################
# Simple modelsim do file #
###########################

# Delete old compilation results
if { [file exists "work"] } {
    vdel -all
}

# Create new modelsim working library
vlib work

# Compile all the Verilog sources in current folder into working library
vlog  lab3_2.v lab3_2_tb.v

# Open testbench module for simulation
vsim work.testbench

# Add all testbench signals to waveform diagram
add wave sim:/testbench/*
add wave sim:/testbench/lab3_2_inst/cnt_ff
add wave sim:/testbench/lab3_2_inst/div_const_ff
add wave sim:/testbench/lab3_2_inst/preload_cnt
onbreak resume
# Run simulation
run -all
wave zoom full