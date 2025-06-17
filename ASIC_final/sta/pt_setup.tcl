###########################################################################
# pt_setup.tcl – PrimeTime 
# location : mydesign/sta/pt_setup.tcl
###########################################################################

#Report and Results directories
set REPORTS_DIR "rpt"
file mkdir $REPORTS_DIR

#Library & Design Setup
set lib_rvt  "/tools/dk/SAED32_EDK/lib/stdcell_rvt/db_nldm"

set search_path ". $lib_rvt"

set target_library "saed32rvt_ss0p95v125c.db"

set link_path "* $target_library "
    # saed32io_fc_ss0p95v125c_2p25v.db \
    # saed32pll_ss0p95v125c_2p25v.db \
    # saed32sram_ss0p95v125c.db \
    # dw_foundation.sldb"

set NETLIST_FILES "../syn/out/mapped/m_fir13_filter.v"

#set PARASTIC_FILES ""

set constraint_file "./con/fir13_filter_pt.sdc"


set DESIGN_NAME "fir13_filter"
