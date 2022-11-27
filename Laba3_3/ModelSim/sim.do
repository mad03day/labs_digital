
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
vlog  lab3_3.v lab3_3_tb.v

# Open testbench module for simulation
vsim work.testbench

# Add all testbench signals to waveform diagram
add wave sim:/testbench/*
add wave sim:/testbench/lab3_3_inst/cnt_nco
add wave sim:/testbench/lab3_3_inst/phase_step
add wave sim:/testbench/lab3_3_inst/preload_cnt
onbreak resume
# Run simulation
run -all
wave zoom full
