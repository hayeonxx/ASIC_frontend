###############################################################
# PrimeTime Run Script - pt.tcl
# Location: mydesign/sta/pt.tcl
###############################################################

#Source common_setup & pt_setup Tcl files
#source ./common_setup.tcl
source ./pt_setup.tcl

#Define Search Path
set_app_var sh_source_uses_search_path true
set_app_var search_path "$search_path"

#Read netlist and link design
set_app_var link_path "$link_path"

read_verilog $NETLIST_FILES
current_design $DESIGN_NAME
#link_design -verbose

#Back annotate parasitics
#read_parasitics $PARASITIC_FILES

#Apply Constraints
if {[file extension $constraint_file] eq ".sdc"} {
    read_sdc -echo $constraint_file
} else {
    source -echo $constraint_file
}

update_timing
check_timing > ./rpt/check_timing.rpt

report_analysis_coverage > ./rpt/analysis_coverage.rpt
report_analysis_coverage
report_timing

#Save session
file delete -force fir13_filter_pt_session
save_session fir13_filter_pt_session

quit