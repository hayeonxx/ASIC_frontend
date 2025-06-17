# fir_fast.sdc
#################################
# Fast Clock (333MHz = 3ns)
#################################
create_clock -name clk -period 2.91 [get_ports clk]

# Generator delay: 0.7ns
set_clock_latency -source 0.5 [get_clocks clk]

# Network delay (ideal): 0.3ns
set_clock_latency -max 0.5 [get_clocks clk]

# Uncertainty = jitter + margin + skew
set_clock_uncertainty -setup 0.15 [get_clocks clk]

# Transition constraint (drive strength hint)
set_clock_transition 0.2 [get_clocks clk]

set_input_delay -max 0.15 -clock clk [get_ports n_rst]
set_input_delay -min 0.05 -clock clk [get_ports n_rst]

# Input delay example
set_input_delay -max 1.75 -clock clk [get_ports x_in]
set_input_delay -min 0.05 -clock clk [get_ports x_in]
# Output delay example
set_output_delay -max 1.16 -clock clk [get_ports y_out]


# Load (capacitance)
set_driving_cell -library saed32rvt_ss0p95v125c -lib_cell INVX0_RVT [get_ports x_in]

# #AND2X1_RVT/A1 capacitance 0.472084
# #MAX_INPUT_LOAD = 0.472084 * 5 = 2.36042
# #OUTPUT_LOAD = 2.36042 * 3 = 7.08126

set_max_capacitance 2.36 [get_ports x_in]

set_load -max 7.08 [all_outputs]
