	#setup version
	set ver [getenv ver]
	set fm_ver [getenv fm_ver]
	set curr_dir [pwd]
	set REPORTS ${curr_dir}/4_rpt/${fm_ver}
	set SCRIPTS ${curr_dir}/0_Script
	
	##implement_design_path
	set implement_design_path ../../out/mapped
	##TOP module
	set TOP_MODULE "mydesign"

	set clock_gating_mode 1
	set QUIT_ON_FINISH 0
