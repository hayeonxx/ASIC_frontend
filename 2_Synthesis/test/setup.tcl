
link // 




set_preferred_routing_direction -layers {M1 M3 M5 M7} -direction horizontal 
set_preferred_routing_direction -layers {M2 M4 M5 M8 MRDL} -direction vertical

//create the design library and set tluplus files 
set ndm_reference_library /slowfs/dgscratch2/asic/ASIC_Project/2_BACKEND/1_pnr/rundir/00_create_ndm/ndm/saed32rvt.ndm
set ndm_design_library  ./ORCA_new.ndm
if{! [file isdirectory $ndm_design_library]} {   create_lib -ref_libs $ndm_reference_library  \
     -technology /slowfs/dgscratch2/asic/ASIC_Project/2_BACKEND/1_pnr/libdir/TECH/saed32nm_1p9m_mw.tf $ndm_design_library  check_library  \
        } else {    open_lib $ndm_design_library   }   

set_tlu_plus_files -max_tluplus  /slowfs/dgscratch2/asic/ASIC_Project/2_BACKEND/1_pnr/libdir/TECH/saed32nm_1p9m_Cmax.tluplus -tech2itf_map  /slowfs/dgscratch2/asic/ASIC_Project/2_BACKEND/1_pnr/libdir/TECH/map/saed32nm_tf_itf_tluplus.map

set_utilization 0.6
set_aspect_ratio 1


//create_die_area -coordinate {{0 0}{600 400}
DIEAREA ( 0 0 ) ( 0 1440000 ) ( 1440000 1440000 ) ( 1440000 0 ) ;
//initialize_floorplan -side_length {939 939 939 939} -core_offset {250.548 251.004 250.548 251.004} 

//DCNTX에 ICCII의 플로어플랜을 로드합니다.

//create_net -power “VDD VDDL"

//create_net -ground VSS

//read_floorplan floorplan_dc/floorplan.tcl
//read_floorplan /slowfs/dgscratch2/asic/ASIC_Project/2_BACKEND/1_pnr/rundir/02_floorplan/fp.tcl
read_floorplan /slowfs/dgscratch2/asic/ASIC_Project/2_BACKEND/1_pnr/rundir/02_floorplan/ORCA_TOP.def
extract_physical_constraints /slowfs/dgscratch2/asic/ASIC_Project/2_BACKEND/1_pnr/rundir/02_floorplan/ORCA_TOP.def
