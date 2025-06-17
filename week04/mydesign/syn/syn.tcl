 
##########################################################################################
# Reading a Verilog RTL File
##########################################################################################
source -e -v ./scr/1_run_syn_setup
source -e -v ./scr/2_run_syn_read_verilog

##########################################################################################
# Explicitly Link the Design and Checks Current Design for Connectivity Hierarchy Issues
##########################################################################################
source -e -v ./scr/3_run_syn_link_check

source -e -v ./scr/4_run_syn_constraints
source -e -v ./scr/5_run_syn_compile 
#source -e -v ./scr/6_run_syn_report
source -e -v ./scr/7_run_syn_write_output
