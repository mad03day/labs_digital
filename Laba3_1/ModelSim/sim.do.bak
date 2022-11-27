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
vlog  laba3_1.v laba3_1_tb.v

# Open testbench module for simulation
vsim work.testbench

# Add all testbench signals to waveform diagram
add wave sim:/testbench/*
add wave sim:/testbench/laba3_1_inst/cnt
add wave sim:/testbench/laba3_1_inst/sync_rst_cnt
onbreak resume
# Run simulation
run -all
wave zoom full
