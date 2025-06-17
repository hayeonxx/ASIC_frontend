#####################################################################
# Read reference design - RTL
#####################################################################

	read_verilog -r -libname WORK {complex_cal.v complex_mul.v complex_add.v}
	
	set_top r:/WORK/${TOP_MODULE}

#####################################################################
# Read implement design - Netlist
#####################################################################

	read_verilog -i -libname WORK ${implement_design_path}/complex_cal.v
 	
	set_top i:/WORK/${TOP_MODULE}

