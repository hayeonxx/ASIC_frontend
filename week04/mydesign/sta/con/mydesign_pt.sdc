#####################################
 # clean-up
 #####################################
 #####################################
# Constraints file for design mydesign
###################################

## define create clock : 333.33MHz -> 3ns
create_clock -name clk -period 3.0 [get_ports clk]

## source_latency : clock generator delay = 700ps
set_clock_latency -source 0.7 [get_clocks clk]


##network latency
set_clock_latency -max 0.3 [get_clocks clk]

##jitter + margin + skew*2 = 40 + 50 + 30*2 = 150ps
set_clock_uncertainty -setup 0.15 [get_clocks clk]

##transition time(rise/fall time) = 120ps
set_clock_transition 0.12 [get_clocks clk] 

#####reset######
#Recovery Untested : clk edge 전 reset 안정되어 있어야 함(-min 필요) 
#Removal Untested : clk edge 이후 일정 시간 reset 유지되어야 함 (-max, -min 필요 )
#max : clk period의 10% 정도 delay
set_input_delay -max 0.3 -clock clk [get_ports n_rst]
set_input_delay -min 0.05 -clock clk [get_ports n_rst]

##Input/Output Dealy
set_input_delay -max 2.15 -clock clk [get_ports din1]
set_input_delay -max 0.45 -clock clk [get_ports up1_dn0]
set_input_delay -max 0.4 -clock clk [get_ports sel]

set_output_delay -max 0.5 -clock clk [get_ports do1]
set_output_delay -max 0.4 -clock clk [get_ports do2]
set_output_delay -max 2.04 -clock clk [get_ports do3]

set_input_delay -max 0.2 -clock clk [get_ports cin*]
set_output_delay -max 0.2 -clock clk [get_ports co*]


set_driving_cell -library saed32rvt_ss0p95v125c -lib_cell INVX0_RVT [get_ports {din1 up1_dn0 sel cin1 cin2}]

# #AND2X1_RVT/A1 capacitance 0.472084
# #MAX_INPUT_LOAD = 0.472084 * 5 = 2.36042
# #OUTPUT_LOAD = 2.36042 * 3 = 7.08126

set_max_capacitance 2.36 [get_ports {din1 up1_dn0 sel cin1 cin2}]

set_load 7.08 [all_outputs]
