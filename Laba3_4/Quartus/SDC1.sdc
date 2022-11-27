#**************************************************************
# Create Clock
#**************************************************************
create_clock -period 20 [get_ports CLOCK2_50]
create_clock -period 20 [get_ports CLOCK3_50]
create_clock -period 20 [get_ports CLOCK_50]
create_clock -period 20 [get_ports CLOCK4_50]
#**************************************************************
# Create Generated Clock
#**************************************************************
derive_pll_clocks
#**************************************************************
# Set Clock Uncertainty
#**************************************************************
derive_clock_uncertainty