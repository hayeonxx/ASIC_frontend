#####################################################################
# Read reference design - RTL
#####################################################################

	read_verilog -r -libname WORK {\
                                     mydesign.v \
                                     shift2.v \
	}
	
	set_top r:/WORK/${TOP_MODULE}

#####################################################################
# Read implement design - Netlist
#####################################################################

	read_verilog -i -libname WORK ${implement_design_path}/mydesign.v
 	
	set_top i:/WORK/${TOP_MODULE}

