###################################################################

# Created by write_sdc on Mon Dec 11 12:48:45 2023

###################################################################
set sdc_version 2.1

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA
set_load -pin_load 10 [get_ports scan_en]
set_load -pin_load 10 [get_ports test_mode]
set_load -pin_load 10 [get_ports power_save]
set_load -pin_load 15 [get_ports pidsel]
set_load -pin_load 15 [get_ports pgnt_n]
set_load -pin_load 10 [get_ports {pad[15]}]
set_load -pin_load 10 [get_ports {pad[14]}]
set_load -pin_load 10 [get_ports {pad[13]}]
set_load -pin_load 10 [get_ports {pad[12]}]
set_load -pin_load 10 [get_ports {pad[11]}]
set_load -pin_load 10 [get_ports {pad[10]}]
set_load -pin_load 10 [get_ports {pad[9]}]
set_load -pin_load 10 [get_ports {pad[8]}]
set_load -pin_load 10 [get_ports {pad[7]}]
set_load -pin_load 10 [get_ports {pad[6]}]
set_load -pin_load 10 [get_ports {pad[5]}]
set_load -pin_load 10 [get_ports {pad[4]}]
set_load -pin_load 10 [get_ports {pad[3]}]
set_load -pin_load 10 [get_ports {pad[2]}]
set_load -pin_load 10 [get_ports {pad[1]}]
set_load -pin_load 10 [get_ports {pad[0]}]
set_load -pin_load 10 [get_ports ppar]
set_load -pin_load 10 [get_ports {pc_be[3]}]
set_load -pin_load 10 [get_ports {pc_be[2]}]
set_load -pin_load 10 [get_ports {pc_be[1]}]
set_load -pin_load 10 [get_ports {pc_be[0]}]
set_load -pin_load 10 [get_ports pframe_n]
set_load -pin_load 10 [get_ports ptrdy_n]
set_load -pin_load 10 [get_ports pirdy_n]
set_load -pin_load 10 [get_ports pdevsel_n]
set_load -pin_load 10 [get_ports pstop_n]
set_load -pin_load 10 [get_ports pperr_n]
set_load -pin_load 10 [get_ports pserr_n]
set_load -pin_load 10 [get_ports preq_n]
set_load -pin_load 15 [get_ports pm66en]
set_load -pin_load 10 [get_ports sd_CK]
set_load -pin_load 10 [get_ports sd_CKn]
set_load -pin_load 10 [get_ports {sd_DQ[15]}]
set_load -pin_load 10 [get_ports {sd_DQ[14]}]
set_load -pin_load 10 [get_ports {sd_DQ[13]}]
set_load -pin_load 10 [get_ports {sd_DQ[12]}]
set_load -pin_load 10 [get_ports {sd_DQ[11]}]
set_load -pin_load 10 [get_ports {sd_DQ[10]}]
set_load -pin_load 10 [get_ports {sd_DQ[9]}]
set_load -pin_load 10 [get_ports {sd_DQ[8]}]
set_load -pin_load 10 [get_ports {sd_DQ[7]}]
set_load -pin_load 10 [get_ports {sd_DQ[6]}]
set_load -pin_load 10 [get_ports {sd_DQ[5]}]
set_load -pin_load 10 [get_ports {sd_DQ[4]}]
set_load -pin_load 10 [get_ports {sd_DQ[3]}]
set_load -pin_load 10 [get_ports {sd_DQ[2]}]
set_load -pin_load 10 [get_ports {sd_DQ[1]}]
set_load -pin_load 10 [get_ports {sd_DQ[0]}]
set_load -pin_load 10 [get_ports {sd_A[9]}]
set_load -pin_load 10 [get_ports {sd_A[8]}]
set_load -pin_load 10 [get_ports {sd_A[7]}]
set_load -pin_load 10 [get_ports {sd_A[6]}]
set_load -pin_load 10 [get_ports {sd_A[5]}]
set_load -pin_load 10 [get_ports {sd_A[4]}]
set_load -pin_load 10 [get_ports {sd_A[3]}]
set_load -pin_load 10 [get_ports {sd_A[2]}]
set_load -pin_load 10 [get_ports {sd_A[1]}]
set_load -pin_load 10 [get_ports {sd_A[0]}]
set_load -pin_load 10 [get_ports {sd_BWS[1]}]
set_load -pin_load 10 [get_ports {sd_BWS[0]}]
set_load -pin_load 10 [get_ports sd_LD]
set_load -pin_load 10 [get_ports sd_RW]
set_case_analysis 0 [get_ports scan_en]
set_case_analysis 0 [get_ports power_save]
set_case_analysis 1 [get_ports pm66en]
set_ideal_network [get_pins I_CLK_SOURCE_SDRAM_CLK/Y]
set_ideal_network [get_pins I_CLK_SOURCE_SYS_2x_CLK/Y]
set_ideal_network [get_pins I_CLK_SOURCE_SYS_CLK/Y]
set_ideal_network [get_pins I_CLK_SOURCE_PCLK/Y]
set_ideal_network -no_propagate  [get_pins I_ORCA_TOP/I_RESET_BLOCK/C48/Y]
set_ideal_network -no_propagate  [get_pins I_ORCA_TOP/I_RESET_BLOCK/C52/Y]
set_ideal_network -no_propagate  [get_pins I_ORCA_TOP/I_RESET_BLOCK/C56/Y]
set_ideal_network -no_propagate  [get_pins I_ORCA_TOP/I_RESET_BLOCK/C60/Y]
set_ideal_network [get_pins I_ORCA_TOP/I_SDRAM_IF/sd_mux_CKn/Y]
set_ideal_network [get_pins I_ORCA_TOP/I_SDRAM_IF/sd_mux_CK/Y]
set_ideal_network [get_pins I_ORCA_TOP/I_SDRAM_IF/genblk1_0__sd_mux_dq_out/Y]
set_ideal_network [get_pins I_ORCA_TOP/I_SDRAM_IF/genblk1_1__sd_mux_dq_out/Y]
set_ideal_network [get_pins I_ORCA_TOP/I_SDRAM_IF/genblk1_2__sd_mux_dq_out/Y]
set_ideal_network [get_pins I_ORCA_TOP/I_SDRAM_IF/genblk1_3__sd_mux_dq_out/Y]
set_ideal_network [get_pins I_ORCA_TOP/I_SDRAM_IF/genblk1_4__sd_mux_dq_out/Y]
set_ideal_network [get_pins I_ORCA_TOP/I_SDRAM_IF/genblk1_5__sd_mux_dq_out/Y]
set_ideal_network [get_pins I_ORCA_TOP/I_SDRAM_IF/genblk1_6__sd_mux_dq_out/Y]
set_ideal_network [get_pins I_ORCA_TOP/I_SDRAM_IF/genblk1_7__sd_mux_dq_out/Y]
set_ideal_network [get_pins I_ORCA_TOP/I_SDRAM_IF/genblk1_8__sd_mux_dq_out/Y]
set_ideal_network [get_pins I_ORCA_TOP/I_SDRAM_IF/genblk1_9__sd_mux_dq_out/Y]
set_ideal_network [get_pins I_ORCA_TOP/I_SDRAM_IF/genblk1_10__sd_mux_dq_out/Y]
set_ideal_network [get_pins I_ORCA_TOP/I_SDRAM_IF/genblk1_11__sd_mux_dq_out/Y]
set_ideal_network [get_pins I_ORCA_TOP/I_SDRAM_IF/genblk1_12__sd_mux_dq_out/Y]
set_ideal_network [get_pins I_ORCA_TOP/I_SDRAM_IF/genblk1_13__sd_mux_dq_out/Y]
set_ideal_network [get_pins I_ORCA_TOP/I_SDRAM_IF/genblk1_14__sd_mux_dq_out/Y]
set_ideal_network [get_pins I_ORCA_TOP/I_SDRAM_IF/genblk1_15__sd_mux_dq_out/Y]
create_clock [get_ports pclk]  -period 8  -waveform {0 4}
set_clock_uncertainty -setup 0.3  [get_clocks pclk]
create_clock [get_ports sys_clk]  -period 4  -waveform {0 2}
set_clock_uncertainty -setup 0.3  [get_clocks sys_clk]
create_clock [get_ports sdr_clk]  -period 4  -waveform {0 2}
set_clock_uncertainty -setup 0.3  [get_clocks sdr_clk]
create_clock [get_pins I_CLOCK_GEN/I_PLL_PCI/CLK_1X]  -name PCI_CLK  -period 8  -waveform {0 4}
set_clock_uncertainty -setup 0.3  [get_clocks PCI_CLK]
create_clock [get_pins I_CLOCK_GEN/I_PLL_SD/CLK_1X]  -name SDRAM_CLK  -period 4  -waveform {0 2}
set_clock_uncertainty -setup 0.3  [get_clocks SDRAM_CLK]
create_generated_clock [get_ports sd_CK]  -name SD_DDR_CLK  -source [get_pins I_CLOCK_GEN/I_PLL_SD/CLK_1X]  -divide_by 1
set_clock_uncertainty -setup 0.3  [get_clocks SD_DDR_CLK]
create_generated_clock [get_pins I_CLOCK_GEN/I_CLKMUL/CLK_1X]  -name SYS_CLK  -source [get_pins I_CLOCK_GEN/I_CLKMUL/CLK_IN]  -multiply_by 1
set_clock_uncertainty -setup 0.3  [get_clocks SYS_CLK]
set_clock_gating_check -rise -setup 0.2 [get_clocks SYS_CLK]
set_clock_gating_check -fall -setup 0.2 [get_clocks SYS_CLK]
set_clock_gating_check -rise -hold 0.1 [get_clocks SYS_CLK]
set_clock_gating_check -fall -hold 0.1 [get_clocks SYS_CLK]
create_generated_clock [get_pins I_CLOCK_GEN/I_CLKMUL/CLK_2X]  -name SYS_2x_CLK  -source [get_pins I_CLOCK_GEN/I_CLKMUL/CLK_IN]  -multiply_by 2
set_clock_uncertainty -setup 0.4  [get_clocks SYS_2x_CLK]
group_path -name INS  -from [list [get_ports scan_en] [get_ports test_mode] [get_ports power_save]  \
[get_ports sys_clk] [get_ports pclk] [get_ports prst_n] [get_ports pidsel]     \
[get_ports pgnt_n] [get_ports {pad[15]}] [get_ports {pad[14]}] [get_ports      \
{pad[13]}] [get_ports {pad[12]}] [get_ports {pad[11]}] [get_ports {pad[10]}]   \
[get_ports {pad[9]}] [get_ports {pad[8]}] [get_ports {pad[7]}] [get_ports      \
{pad[6]}] [get_ports {pad[5]}] [get_ports {pad[4]}] [get_ports {pad[3]}]       \
[get_ports {pad[2]}] [get_ports {pad[1]}] [get_ports {pad[0]}] [get_ports      \
ppar] [get_ports {pc_be[3]}] [get_ports {pc_be[2]}] [get_ports {pc_be[1]}]     \
[get_ports {pc_be[0]}] [get_ports pframe_n] [get_ports ptrdy_n] [get_ports     \
pirdy_n] [get_ports pdevsel_n] [get_ports pstop_n] [get_ports pperr_n]         \
[get_ports pserr_n] [get_ports pm66en] [get_ports sdr_clk] [get_ports          \
{sd_DQ[15]}] [get_ports {sd_DQ[14]}] [get_ports {sd_DQ[13]}] [get_ports        \
{sd_DQ[12]}] [get_ports {sd_DQ[11]}] [get_ports {sd_DQ[10]}] [get_ports        \
{sd_DQ[9]}] [get_ports {sd_DQ[8]}] [get_ports {sd_DQ[7]}] [get_ports           \
{sd_DQ[6]}] [get_ports {sd_DQ[5]}] [get_ports {sd_DQ[4]}] [get_ports           \
{sd_DQ[3]}] [get_ports {sd_DQ[2]}] [get_ports {sd_DQ[1]}] [get_ports           \
{sd_DQ[0]}]]
group_path -name OUTS  -to [list [get_ports {pad[15]}] [get_ports {pad[14]}] [get_ports {pad[13]}]   \
[get_ports {pad[12]}] [get_ports {pad[11]}] [get_ports {pad[10]}] [get_ports   \
{pad[9]}] [get_ports {pad[8]}] [get_ports {pad[7]}] [get_ports {pad[6]}]       \
[get_ports {pad[5]}] [get_ports {pad[4]}] [get_ports {pad[3]}] [get_ports      \
{pad[2]}] [get_ports {pad[1]}] [get_ports {pad[0]}] [get_ports ppar]           \
[get_ports {pc_be[3]}] [get_ports {pc_be[2]}] [get_ports {pc_be[1]}]           \
[get_ports {pc_be[0]}] [get_ports pframe_n] [get_ports ptrdy_n] [get_ports     \
pirdy_n] [get_ports pdevsel_n] [get_ports pstop_n] [get_ports pperr_n]         \
[get_ports pserr_n] [get_ports preq_n] [get_ports sd_CK] [get_ports sd_CKn]    \
[get_ports {sd_DQ[15]}] [get_ports {sd_DQ[14]}] [get_ports {sd_DQ[13]}]        \
[get_ports {sd_DQ[12]}] [get_ports {sd_DQ[11]}] [get_ports {sd_DQ[10]}]        \
[get_ports {sd_DQ[9]}] [get_ports {sd_DQ[8]}] [get_ports {sd_DQ[7]}]           \
[get_ports {sd_DQ[6]}] [get_ports {sd_DQ[5]}] [get_ports {sd_DQ[4]}]           \
[get_ports {sd_DQ[3]}] [get_ports {sd_DQ[2]}] [get_ports {sd_DQ[1]}]           \
[get_ports {sd_DQ[0]}] [get_ports {sd_A[9]}] [get_ports {sd_A[8]}] [get_ports  \
{sd_A[7]}] [get_ports {sd_A[6]}] [get_ports {sd_A[5]}] [get_ports {sd_A[4]}]   \
[get_ports {sd_A[3]}] [get_ports {sd_A[2]}] [get_ports {sd_A[1]}] [get_ports   \
{sd_A[0]}] [get_ports {sd_BWS[1]}] [get_ports {sd_BWS[0]}] [get_ports sd_LD]   \
[get_ports sd_RW]]
set_false_path   -from [get_clocks SYS_CLK]  -to [list [get_clocks PCI_CLK] [get_clocks SDRAM_CLK] [get_clocks SD_DDR_CLK]]
set_false_path   -from [get_clocks SYS_2x_CLK]  -to [list [get_clocks PCI_CLK] [get_clocks SDRAM_CLK] [get_clocks SD_DDR_CLK]]
set_false_path   -from [get_clocks PCI_CLK]  -to [list [get_clocks SYS_CLK] [get_clocks SYS_2x_CLK] [get_clocks SDRAM_CLK] \
[get_clocks SD_DDR_CLK]]
set_false_path   -from [get_clocks SDRAM_CLK]  -to [list [get_clocks SYS_CLK] [get_clocks SYS_2x_CLK] [get_clocks PCI_CLK]]
set_false_path   -from [get_clocks SD_DDR_CLK]  -to [list [get_clocks SYS_CLK] [get_clocks SYS_2x_CLK] [get_clocks PCI_CLK]]
set_multicycle_path 2 -setup -from [get_clocks sdr_clk] -to [get_clocks        \
SD_DDR_CLK]
set_multicycle_path 1 -hold -end -from [get_clocks sdr_clk] -to [get_clocks    \
SD_DDR_CLK]
set_multicycle_path 2 -setup -from [get_clocks SDRAM_CLK] -to [get_clocks      \
SD_DDR_CLK]
set_multicycle_path 1 -hold -end -from [get_clocks SDRAM_CLK] -to [get_clocks  \
SD_DDR_CLK]
set_input_delay -clock PCI_CLK  -max 4  [get_ports scan_en]
set_input_delay -clock PCI_CLK  -min 2  [get_ports scan_en]
set_input_delay -clock PCI_CLK  -max 4  [get_ports power_save]
set_input_delay -clock PCI_CLK  -min 2  [get_ports power_save]
set_input_delay -clock PCI_CLK  -max 6  [get_ports pidsel]
set_input_delay -clock PCI_CLK  -min 2  [get_ports pidsel]
set_input_delay -clock PCI_CLK  -max 6  [get_ports pgnt_n]
set_input_delay -clock PCI_CLK  -min 2  [get_ports pgnt_n]
set_input_delay -clock PCI_CLK  -max 6  [get_ports {pad[15]}]
set_input_delay -clock PCI_CLK  -min 2  [get_ports {pad[15]}]
set_input_delay -clock PCI_CLK  -max 6  [get_ports {pad[14]}]
set_input_delay -clock PCI_CLK  -min 2  [get_ports {pad[14]}]
set_input_delay -clock PCI_CLK  -max 6  [get_ports {pad[13]}]
set_input_delay -clock PCI_CLK  -min 2  [get_ports {pad[13]}]
set_input_delay -clock PCI_CLK  -max 6  [get_ports {pad[12]}]
set_input_delay -clock PCI_CLK  -min 2  [get_ports {pad[12]}]
set_input_delay -clock PCI_CLK  -max 6  [get_ports {pad[11]}]
set_input_delay -clock PCI_CLK  -min 2  [get_ports {pad[11]}]
set_input_delay -clock PCI_CLK  -max 6  [get_ports {pad[10]}]
set_input_delay -clock PCI_CLK  -min 2  [get_ports {pad[10]}]
set_input_delay -clock PCI_CLK  -max 6  [get_ports {pad[9]}]
set_input_delay -clock PCI_CLK  -min 2  [get_ports {pad[9]}]
set_input_delay -clock PCI_CLK  -max 6  [get_ports {pad[8]}]
set_input_delay -clock PCI_CLK  -min 2  [get_ports {pad[8]}]
set_input_delay -clock PCI_CLK  -max 6  [get_ports {pad[7]}]
set_input_delay -clock PCI_CLK  -min 2  [get_ports {pad[7]}]
set_input_delay -clock PCI_CLK  -max 6  [get_ports {pad[6]}]
set_input_delay -clock PCI_CLK  -min 2  [get_ports {pad[6]}]
set_input_delay -clock PCI_CLK  -max 6  [get_ports {pad[5]}]
set_input_delay -clock PCI_CLK  -min 2  [get_ports {pad[5]}]
set_input_delay -clock PCI_CLK  -max 6  [get_ports {pad[4]}]
set_input_delay -clock PCI_CLK  -min 2  [get_ports {pad[4]}]
set_input_delay -clock PCI_CLK  -max 6  [get_ports {pad[3]}]
set_input_delay -clock PCI_CLK  -min 2  [get_ports {pad[3]}]
set_input_delay -clock PCI_CLK  -max 6  [get_ports {pad[2]}]
set_input_delay -clock PCI_CLK  -min 2  [get_ports {pad[2]}]
set_input_delay -clock PCI_CLK  -max 6  [get_ports {pad[1]}]
set_input_delay -clock PCI_CLK  -min 2  [get_ports {pad[1]}]
set_input_delay -clock PCI_CLK  -max 6  [get_ports {pad[0]}]
set_input_delay -clock PCI_CLK  -min 2  [get_ports {pad[0]}]
set_input_delay -clock PCI_CLK  -max 6  [get_ports ppar]
set_input_delay -clock PCI_CLK  -min 2  [get_ports ppar]
set_input_delay -clock PCI_CLK  -max 6  [get_ports {pc_be[3]}]
set_input_delay -clock PCI_CLK  -min 2  [get_ports {pc_be[3]}]
set_input_delay -clock PCI_CLK  -max 6  [get_ports {pc_be[2]}]
set_input_delay -clock PCI_CLK  -min 2  [get_ports {pc_be[2]}]
set_input_delay -clock PCI_CLK  -max 6  [get_ports {pc_be[1]}]
set_input_delay -clock PCI_CLK  -min 2  [get_ports {pc_be[1]}]
set_input_delay -clock PCI_CLK  -max 6  [get_ports {pc_be[0]}]
set_input_delay -clock PCI_CLK  -min 2  [get_ports {pc_be[0]}]
set_input_delay -clock PCI_CLK  -max 6  [get_ports pframe_n]
set_input_delay -clock PCI_CLK  -min 2  [get_ports pframe_n]
set_input_delay -clock PCI_CLK  -max 6  [get_ports ptrdy_n]
set_input_delay -clock PCI_CLK  -min 2  [get_ports ptrdy_n]
set_input_delay -clock PCI_CLK  -max 6  [get_ports pirdy_n]
set_input_delay -clock PCI_CLK  -min 2  [get_ports pirdy_n]
set_input_delay -clock PCI_CLK  -max 6  [get_ports pdevsel_n]
set_input_delay -clock PCI_CLK  -min 2  [get_ports pdevsel_n]
set_input_delay -clock PCI_CLK  -max 6  [get_ports pstop_n]
set_input_delay -clock PCI_CLK  -min 2  [get_ports pstop_n]
set_input_delay -clock PCI_CLK  -max 6  [get_ports pperr_n]
set_input_delay -clock PCI_CLK  -min 2  [get_ports pperr_n]
set_input_delay -clock PCI_CLK  -max 6  [get_ports pserr_n]
set_input_delay -clock PCI_CLK  -min 2  [get_ports pserr_n]
set_input_delay -clock PCI_CLK  -max 6  [get_ports pm66en]
set_input_delay -clock PCI_CLK  -min 2  [get_ports pm66en]
set_input_delay -clock SDRAM_CLK  -max 0.8  [get_ports {sd_DQ[15]}]
set_input_delay -clock SDRAM_CLK  -min 0.2  [get_ports {sd_DQ[15]}]
set_input_delay -clock SDRAM_CLK  -clock_fall  -max 0.8  -add_delay  [get_ports {sd_DQ[15]}]
set_input_delay -clock SDRAM_CLK  -clock_fall  -min 0.2  -add_delay  [get_ports {sd_DQ[15]}]
set_input_delay -clock SDRAM_CLK  -max 0.8  [get_ports {sd_DQ[14]}]
set_input_delay -clock SDRAM_CLK  -min 0.2  [get_ports {sd_DQ[14]}]
set_input_delay -clock SDRAM_CLK  -clock_fall  -max 0.8  -add_delay  [get_ports {sd_DQ[14]}]
set_input_delay -clock SDRAM_CLK  -clock_fall  -min 0.2  -add_delay  [get_ports {sd_DQ[14]}]
set_input_delay -clock SDRAM_CLK  -max 0.8  [get_ports {sd_DQ[13]}]
set_input_delay -clock SDRAM_CLK  -min 0.2  [get_ports {sd_DQ[13]}]
set_input_delay -clock SDRAM_CLK  -clock_fall  -max 0.8  -add_delay  [get_ports {sd_DQ[13]}]
set_input_delay -clock SDRAM_CLK  -clock_fall  -min 0.2  -add_delay  [get_ports {sd_DQ[13]}]
set_input_delay -clock SDRAM_CLK  -max 0.8  [get_ports {sd_DQ[12]}]
set_input_delay -clock SDRAM_CLK  -min 0.2  [get_ports {sd_DQ[12]}]
set_input_delay -clock SDRAM_CLK  -clock_fall  -max 0.8  -add_delay  [get_ports {sd_DQ[12]}]
set_input_delay -clock SDRAM_CLK  -clock_fall  -min 0.2  -add_delay  [get_ports {sd_DQ[12]}]
set_input_delay -clock SDRAM_CLK  -max 0.8  [get_ports {sd_DQ[11]}]
set_input_delay -clock SDRAM_CLK  -min 0.2  [get_ports {sd_DQ[11]}]
set_input_delay -clock SDRAM_CLK  -clock_fall  -max 0.8  -add_delay  [get_ports {sd_DQ[11]}]
set_input_delay -clock SDRAM_CLK  -clock_fall  -min 0.2  -add_delay  [get_ports {sd_DQ[11]}]
set_input_delay -clock SDRAM_CLK  -max 0.8  [get_ports {sd_DQ[10]}]
set_input_delay -clock SDRAM_CLK  -min 0.2  [get_ports {sd_DQ[10]}]
set_input_delay -clock SDRAM_CLK  -clock_fall  -max 0.8  -add_delay  [get_ports {sd_DQ[10]}]
set_input_delay -clock SDRAM_CLK  -clock_fall  -min 0.2  -add_delay  [get_ports {sd_DQ[10]}]
set_input_delay -clock SDRAM_CLK  -max 0.8  [get_ports {sd_DQ[9]}]
set_input_delay -clock SDRAM_CLK  -min 0.2  [get_ports {sd_DQ[9]}]
set_input_delay -clock SDRAM_CLK  -clock_fall  -max 0.8  -add_delay  [get_ports {sd_DQ[9]}]
set_input_delay -clock SDRAM_CLK  -clock_fall  -min 0.2  -add_delay  [get_ports {sd_DQ[9]}]
set_input_delay -clock SDRAM_CLK  -max 0.8  [get_ports {sd_DQ[8]}]
set_input_delay -clock SDRAM_CLK  -min 0.2  [get_ports {sd_DQ[8]}]
set_input_delay -clock SDRAM_CLK  -clock_fall  -max 0.8  -add_delay  [get_ports {sd_DQ[8]}]
set_input_delay -clock SDRAM_CLK  -clock_fall  -min 0.2  -add_delay  [get_ports {sd_DQ[8]}]
set_input_delay -clock SDRAM_CLK  -max 0.8  [get_ports {sd_DQ[7]}]
set_input_delay -clock SDRAM_CLK  -min 0.2  [get_ports {sd_DQ[7]}]
set_input_delay -clock SDRAM_CLK  -clock_fall  -max 0.8  -add_delay  [get_ports {sd_DQ[7]}]
set_input_delay -clock SDRAM_CLK  -clock_fall  -min 0.2  -add_delay  [get_ports {sd_DQ[7]}]
set_input_delay -clock SDRAM_CLK  -max 0.8  [get_ports {sd_DQ[6]}]
set_input_delay -clock SDRAM_CLK  -min 0.2  [get_ports {sd_DQ[6]}]
set_input_delay -clock SDRAM_CLK  -clock_fall  -max 0.8  -add_delay  [get_ports {sd_DQ[6]}]
set_input_delay -clock SDRAM_CLK  -clock_fall  -min 0.2  -add_delay  [get_ports {sd_DQ[6]}]
set_input_delay -clock SDRAM_CLK  -max 0.8  [get_ports {sd_DQ[5]}]
set_input_delay -clock SDRAM_CLK  -min 0.2  [get_ports {sd_DQ[5]}]
set_input_delay -clock SDRAM_CLK  -clock_fall  -max 0.8  -add_delay  [get_ports {sd_DQ[5]}]
set_input_delay -clock SDRAM_CLK  -clock_fall  -min 0.2  -add_delay  [get_ports {sd_DQ[5]}]
set_input_delay -clock SDRAM_CLK  -max 0.8  [get_ports {sd_DQ[4]}]
set_input_delay -clock SDRAM_CLK  -min 0.2  [get_ports {sd_DQ[4]}]
set_input_delay -clock SDRAM_CLK  -clock_fall  -max 0.8  -add_delay  [get_ports {sd_DQ[4]}]
set_input_delay -clock SDRAM_CLK  -clock_fall  -min 0.2  -add_delay  [get_ports {sd_DQ[4]}]
set_input_delay -clock SDRAM_CLK  -max 0.8  [get_ports {sd_DQ[3]}]
set_input_delay -clock SDRAM_CLK  -min 0.2  [get_ports {sd_DQ[3]}]
set_input_delay -clock SDRAM_CLK  -clock_fall  -max 0.8  -add_delay  [get_ports {sd_DQ[3]}]
set_input_delay -clock SDRAM_CLK  -clock_fall  -min 0.2  -add_delay  [get_ports {sd_DQ[3]}]
set_input_delay -clock SDRAM_CLK  -max 0.8  [get_ports {sd_DQ[2]}]
set_input_delay -clock SDRAM_CLK  -min 0.2  [get_ports {sd_DQ[2]}]
set_input_delay -clock SDRAM_CLK  -clock_fall  -max 0.8  -add_delay  [get_ports {sd_DQ[2]}]
set_input_delay -clock SDRAM_CLK  -clock_fall  -min 0.2  -add_delay  [get_ports {sd_DQ[2]}]
set_input_delay -clock SDRAM_CLK  -max 0.8  [get_ports {sd_DQ[1]}]
set_input_delay -clock SDRAM_CLK  -min 0.2  [get_ports {sd_DQ[1]}]
set_input_delay -clock SDRAM_CLK  -clock_fall  -max 0.8  -add_delay  [get_ports {sd_DQ[1]}]
set_input_delay -clock SDRAM_CLK  -clock_fall  -min 0.2  -add_delay  [get_ports {sd_DQ[1]}]
set_input_delay -clock SDRAM_CLK  -max 0.8  [get_ports {sd_DQ[0]}]
set_input_delay -clock SDRAM_CLK  -min 0.2  [get_ports {sd_DQ[0]}]
set_input_delay -clock SDRAM_CLK  -clock_fall  -max 0.8  -add_delay  [get_ports {sd_DQ[0]}]
set_input_delay -clock SDRAM_CLK  -clock_fall  -min 0.2  -add_delay  [get_ports {sd_DQ[0]}]
set_output_delay -clock PCI_CLK  -max 4  [get_ports {pad[15]}]
set_output_delay -clock PCI_CLK  -min -1  [get_ports {pad[15]}]
set_output_delay -clock PCI_CLK  -max 4  [get_ports {pad[14]}]
set_output_delay -clock PCI_CLK  -min -1  [get_ports {pad[14]}]
set_output_delay -clock PCI_CLK  -max 4  [get_ports {pad[13]}]
set_output_delay -clock PCI_CLK  -min -1  [get_ports {pad[13]}]
set_output_delay -clock PCI_CLK  -max 4  [get_ports {pad[12]}]
set_output_delay -clock PCI_CLK  -min -1  [get_ports {pad[12]}]
set_output_delay -clock PCI_CLK  -max 4  [get_ports {pad[11]}]
set_output_delay -clock PCI_CLK  -min -1  [get_ports {pad[11]}]
set_output_delay -clock PCI_CLK  -max 4  [get_ports {pad[10]}]
set_output_delay -clock PCI_CLK  -min -1  [get_ports {pad[10]}]
set_output_delay -clock PCI_CLK  -max 4  [get_ports {pad[9]}]
set_output_delay -clock PCI_CLK  -min -1  [get_ports {pad[9]}]
set_output_delay -clock PCI_CLK  -max 4  [get_ports {pad[8]}]
set_output_delay -clock PCI_CLK  -min -1  [get_ports {pad[8]}]
set_output_delay -clock PCI_CLK  -max 4  [get_ports {pad[7]}]
set_output_delay -clock PCI_CLK  -min -1  [get_ports {pad[7]}]
set_output_delay -clock PCI_CLK  -max 4  [get_ports {pad[6]}]
set_output_delay -clock PCI_CLK  -min -1  [get_ports {pad[6]}]
set_output_delay -clock PCI_CLK  -max 4  [get_ports {pad[5]}]
set_output_delay -clock PCI_CLK  -min -1  [get_ports {pad[5]}]
set_output_delay -clock PCI_CLK  -max 4  [get_ports {pad[4]}]
set_output_delay -clock PCI_CLK  -min -1  [get_ports {pad[4]}]
set_output_delay -clock PCI_CLK  -max 4  [get_ports {pad[3]}]
set_output_delay -clock PCI_CLK  -min -1  [get_ports {pad[3]}]
set_output_delay -clock PCI_CLK  -max 4  [get_ports {pad[2]}]
set_output_delay -clock PCI_CLK  -min -1  [get_ports {pad[2]}]
set_output_delay -clock PCI_CLK  -max 4  [get_ports {pad[1]}]
set_output_delay -clock PCI_CLK  -min -1  [get_ports {pad[1]}]
set_output_delay -clock PCI_CLK  -max 4  [get_ports {pad[0]}]
set_output_delay -clock PCI_CLK  -min -1  [get_ports {pad[0]}]
set_output_delay -clock PCI_CLK  -max 4  [get_ports ppar]
set_output_delay -clock PCI_CLK  -min -1  [get_ports ppar]
set_output_delay -clock PCI_CLK  -max 4  [get_ports {pc_be[3]}]
set_output_delay -clock PCI_CLK  -min -1  [get_ports {pc_be[3]}]
set_output_delay -clock PCI_CLK  -max 4  [get_ports {pc_be[2]}]
set_output_delay -clock PCI_CLK  -min -1  [get_ports {pc_be[2]}]
set_output_delay -clock PCI_CLK  -max 4  [get_ports {pc_be[1]}]
set_output_delay -clock PCI_CLK  -min -1  [get_ports {pc_be[1]}]
set_output_delay -clock PCI_CLK  -max 4  [get_ports {pc_be[0]}]
set_output_delay -clock PCI_CLK  -min -1  [get_ports {pc_be[0]}]
set_output_delay -clock PCI_CLK  -max 4  [get_ports pframe_n]
set_output_delay -clock PCI_CLK  -min -1  [get_ports pframe_n]
set_output_delay -clock PCI_CLK  -max 4  [get_ports ptrdy_n]
set_output_delay -clock PCI_CLK  -min -1  [get_ports ptrdy_n]
set_output_delay -clock PCI_CLK  -max 4  [get_ports pirdy_n]
set_output_delay -clock PCI_CLK  -min -1  [get_ports pirdy_n]
set_output_delay -clock PCI_CLK  -max 4  [get_ports pdevsel_n]
set_output_delay -clock PCI_CLK  -min -1  [get_ports pdevsel_n]
set_output_delay -clock PCI_CLK  -max 4  [get_ports pstop_n]
set_output_delay -clock PCI_CLK  -min -1  [get_ports pstop_n]
set_output_delay -clock PCI_CLK  -max 4  [get_ports pperr_n]
set_output_delay -clock PCI_CLK  -min -1  [get_ports pperr_n]
set_output_delay -clock PCI_CLK  -max 4  [get_ports pserr_n]
set_output_delay -clock PCI_CLK  -min -1  [get_ports pserr_n]
set_output_delay -clock SD_DDR_CLK  -max 0.75  [get_ports {sd_DQ[15]}]
set_output_delay -clock SD_DDR_CLK  -min -0.1  [get_ports {sd_DQ[15]}]
set_output_delay -clock SD_DDR_CLK  -clock_fall  -max 0.75  -add_delay  [get_ports {sd_DQ[15]}]
set_output_delay -clock SD_DDR_CLK  -clock_fall  -min -0.1  -add_delay  [get_ports {sd_DQ[15]}]
set_output_delay -clock SD_DDR_CLK  -max 0.75  [get_ports {sd_DQ[14]}]
set_output_delay -clock SD_DDR_CLK  -min -0.1  [get_ports {sd_DQ[14]}]
set_output_delay -clock SD_DDR_CLK  -clock_fall  -max 0.75  -add_delay  [get_ports {sd_DQ[14]}]
set_output_delay -clock SD_DDR_CLK  -clock_fall  -min -0.1  -add_delay  [get_ports {sd_DQ[14]}]
set_output_delay -clock SD_DDR_CLK  -max 0.75  [get_ports {sd_DQ[13]}]
set_output_delay -clock SD_DDR_CLK  -min -0.1  [get_ports {sd_DQ[13]}]
set_output_delay -clock SD_DDR_CLK  -clock_fall  -max 0.75  -add_delay  [get_ports {sd_DQ[13]}]
set_output_delay -clock SD_DDR_CLK  -clock_fall  -min -0.1  -add_delay  [get_ports {sd_DQ[13]}]
set_output_delay -clock SD_DDR_CLK  -max 0.75  [get_ports {sd_DQ[12]}]
set_output_delay -clock SD_DDR_CLK  -min -0.1  [get_ports {sd_DQ[12]}]
set_output_delay -clock SD_DDR_CLK  -clock_fall  -max 0.75  -add_delay  [get_ports {sd_DQ[12]}]
set_output_delay -clock SD_DDR_CLK  -clock_fall  -min -0.1  -add_delay  [get_ports {sd_DQ[12]}]
set_output_delay -clock SD_DDR_CLK  -max 0.75  [get_ports {sd_DQ[11]}]
set_output_delay -clock SD_DDR_CLK  -min -0.1  [get_ports {sd_DQ[11]}]
set_output_delay -clock SD_DDR_CLK  -clock_fall  -max 0.75  -add_delay  [get_ports {sd_DQ[11]}]
set_output_delay -clock SD_DDR_CLK  -clock_fall  -min -0.1  -add_delay  [get_ports {sd_DQ[11]}]
set_output_delay -clock SD_DDR_CLK  -max 0.75  [get_ports {sd_DQ[10]}]
set_output_delay -clock SD_DDR_CLK  -min -0.1  [get_ports {sd_DQ[10]}]
set_output_delay -clock SD_DDR_CLK  -clock_fall  -max 0.75  -add_delay  [get_ports {sd_DQ[10]}]
set_output_delay -clock SD_DDR_CLK  -clock_fall  -min -0.1  -add_delay  [get_ports {sd_DQ[10]}]
set_output_delay -clock SD_DDR_CLK  -max 0.75  [get_ports {sd_DQ[9]}]
set_output_delay -clock SD_DDR_CLK  -min -0.1  [get_ports {sd_DQ[9]}]
set_output_delay -clock SD_DDR_CLK  -clock_fall  -max 0.75  -add_delay  [get_ports {sd_DQ[9]}]
set_output_delay -clock SD_DDR_CLK  -clock_fall  -min -0.1  -add_delay  [get_ports {sd_DQ[9]}]
set_output_delay -clock SD_DDR_CLK  -max 0.75  [get_ports {sd_DQ[8]}]
set_output_delay -clock SD_DDR_CLK  -min -0.1  [get_ports {sd_DQ[8]}]
set_output_delay -clock SD_DDR_CLK  -clock_fall  -max 0.75  -add_delay  [get_ports {sd_DQ[8]}]
set_output_delay -clock SD_DDR_CLK  -clock_fall  -min -0.1  -add_delay  [get_ports {sd_DQ[8]}]
set_output_delay -clock SD_DDR_CLK  -max 0.75  [get_ports {sd_DQ[7]}]
set_output_delay -clock SD_DDR_CLK  -min -0.1  [get_ports {sd_DQ[7]}]
set_output_delay -clock SD_DDR_CLK  -clock_fall  -max 0.75  -add_delay  [get_ports {sd_DQ[7]}]
set_output_delay -clock SD_DDR_CLK  -clock_fall  -min -0.1  -add_delay  [get_ports {sd_DQ[7]}]
set_output_delay -clock SD_DDR_CLK  -max 0.75  [get_ports {sd_DQ[6]}]
set_output_delay -clock SD_DDR_CLK  -min -0.1  [get_ports {sd_DQ[6]}]
set_output_delay -clock SD_DDR_CLK  -clock_fall  -max 0.75  -add_delay  [get_ports {sd_DQ[6]}]
set_output_delay -clock SD_DDR_CLK  -clock_fall  -min -0.1  -add_delay  [get_ports {sd_DQ[6]}]
set_output_delay -clock SD_DDR_CLK  -max 0.75  [get_ports {sd_DQ[5]}]
set_output_delay -clock SD_DDR_CLK  -min -0.1  [get_ports {sd_DQ[5]}]
set_output_delay -clock SD_DDR_CLK  -clock_fall  -max 0.75  -add_delay  [get_ports {sd_DQ[5]}]
set_output_delay -clock SD_DDR_CLK  -clock_fall  -min -0.1  -add_delay  [get_ports {sd_DQ[5]}]
set_output_delay -clock SD_DDR_CLK  -max 0.75  [get_ports {sd_DQ[4]}]
set_output_delay -clock SD_DDR_CLK  -min -0.1  [get_ports {sd_DQ[4]}]
set_output_delay -clock SD_DDR_CLK  -clock_fall  -max 0.75  -add_delay  [get_ports {sd_DQ[4]}]
set_output_delay -clock SD_DDR_CLK  -clock_fall  -min -0.1  -add_delay  [get_ports {sd_DQ[4]}]
set_output_delay -clock SD_DDR_CLK  -max 0.75  [get_ports {sd_DQ[3]}]
set_output_delay -clock SD_DDR_CLK  -min -0.1  [get_ports {sd_DQ[3]}]
set_output_delay -clock SD_DDR_CLK  -clock_fall  -max 0.75  -add_delay  [get_ports {sd_DQ[3]}]
set_output_delay -clock SD_DDR_CLK  -clock_fall  -min -0.1  -add_delay  [get_ports {sd_DQ[3]}]
set_output_delay -clock SD_DDR_CLK  -max 0.75  [get_ports {sd_DQ[2]}]
set_output_delay -clock SD_DDR_CLK  -min -0.1  [get_ports {sd_DQ[2]}]
set_output_delay -clock SD_DDR_CLK  -clock_fall  -max 0.75  -add_delay  [get_ports {sd_DQ[2]}]
set_output_delay -clock SD_DDR_CLK  -clock_fall  -min -0.1  -add_delay  [get_ports {sd_DQ[2]}]
set_output_delay -clock SD_DDR_CLK  -max 0.75  [get_ports {sd_DQ[1]}]
set_output_delay -clock SD_DDR_CLK  -min -0.1  [get_ports {sd_DQ[1]}]
set_output_delay -clock SD_DDR_CLK  -clock_fall  -max 0.75  -add_delay  [get_ports {sd_DQ[1]}]
set_output_delay -clock SD_DDR_CLK  -clock_fall  -min -0.1  -add_delay  [get_ports {sd_DQ[1]}]
set_output_delay -clock SD_DDR_CLK  -max 0.75  [get_ports {sd_DQ[0]}]
set_output_delay -clock SD_DDR_CLK  -min -0.1  [get_ports {sd_DQ[0]}]
set_output_delay -clock SD_DDR_CLK  -clock_fall  -max 0.75  -add_delay  [get_ports {sd_DQ[0]}]
set_output_delay -clock SD_DDR_CLK  -clock_fall  -min -0.1  -add_delay  [get_ports {sd_DQ[0]}]
set_output_delay -clock PCI_CLK  -max 4  [get_ports preq_n]
set_output_delay -clock PCI_CLK  -min -1  [get_ports preq_n]
set_output_delay -clock SD_DDR_CLK  -max 0.75  [get_ports {sd_A[9]}]
set_output_delay -clock SD_DDR_CLK  -min -0.1  [get_ports {sd_A[9]}]
set_output_delay -clock SD_DDR_CLK  -max 0.75  [get_ports {sd_A[8]}]
set_output_delay -clock SD_DDR_CLK  -min -0.1  [get_ports {sd_A[8]}]
set_output_delay -clock SD_DDR_CLK  -max 0.75  [get_ports {sd_A[7]}]
set_output_delay -clock SD_DDR_CLK  -min -0.1  [get_ports {sd_A[7]}]
set_output_delay -clock SD_DDR_CLK  -max 0.75  [get_ports {sd_A[6]}]
set_output_delay -clock SD_DDR_CLK  -min -0.1  [get_ports {sd_A[6]}]
set_output_delay -clock SD_DDR_CLK  -max 0.75  [get_ports {sd_A[5]}]
set_output_delay -clock SD_DDR_CLK  -min -0.1  [get_ports {sd_A[5]}]
set_output_delay -clock SD_DDR_CLK  -max 0.75  [get_ports {sd_A[4]}]
set_output_delay -clock SD_DDR_CLK  -min -0.1  [get_ports {sd_A[4]}]
set_output_delay -clock SD_DDR_CLK  -max 0.75  [get_ports {sd_A[3]}]
set_output_delay -clock SD_DDR_CLK  -min -0.1  [get_ports {sd_A[3]}]
set_output_delay -clock SD_DDR_CLK  -max 0.75  [get_ports {sd_A[2]}]
set_output_delay -clock SD_DDR_CLK  -min -0.1  [get_ports {sd_A[2]}]
set_output_delay -clock SD_DDR_CLK  -max 0.75  [get_ports {sd_A[1]}]
set_output_delay -clock SD_DDR_CLK  -min -0.1  [get_ports {sd_A[1]}]
set_output_delay -clock SD_DDR_CLK  -max 0.75  [get_ports {sd_A[0]}]
set_output_delay -clock SD_DDR_CLK  -min -0.1  [get_ports {sd_A[0]}]
set_output_delay -clock SD_DDR_CLK  -max 0.75  [get_ports {sd_BWS[1]}]
set_output_delay -clock SD_DDR_CLK  -min -0.1  [get_ports {sd_BWS[1]}]
set_output_delay -clock SD_DDR_CLK  -max 0.75  [get_ports {sd_BWS[0]}]
set_output_delay -clock SD_DDR_CLK  -min -0.1  [get_ports {sd_BWS[0]}]
set_output_delay -clock SD_DDR_CLK  -max 0.75  [get_ports sd_LD]
set_output_delay -clock SD_DDR_CLK  -min -0.1  [get_ports sd_LD]
set_output_delay -clock SD_DDR_CLK  -max 0.75  [get_ports sd_RW]
set_output_delay -clock SD_DDR_CLK  -min -0.1  [get_ports sd_RW]
set_input_transition -max 0.5  [get_ports scan_en]
set_input_transition -min 0.5  [get_ports scan_en]
set_input_transition -max 0.5  [get_ports test_mode]
set_input_transition -min 0.5  [get_ports test_mode]
set_input_transition -max 0.5  [get_ports power_save]
set_input_transition -min 0.5  [get_ports power_save]
set_input_transition -max 0.5  [get_ports sys_clk]
set_input_transition -min 0.5  [get_ports sys_clk]
set_input_transition -max 0.5  [get_ports pclk]
set_input_transition -min 0.5  [get_ports pclk]
set_input_transition -max 0.5  [get_ports prst_n]
set_input_transition -min 0.5  [get_ports prst_n]
set_input_transition -max 1  [get_ports pidsel]
set_input_transition -min 1  [get_ports pidsel]
set_input_transition -max 1  [get_ports pgnt_n]
set_input_transition -min 1  [get_ports pgnt_n]
set_input_transition -max 1  [get_ports {pad[15]}]
set_input_transition -min 1  [get_ports {pad[15]}]
set_input_transition -max 1  [get_ports {pad[14]}]
set_input_transition -min 1  [get_ports {pad[14]}]
set_input_transition -max 1  [get_ports {pad[13]}]
set_input_transition -min 1  [get_ports {pad[13]}]
set_input_transition -max 1  [get_ports {pad[12]}]
set_input_transition -min 1  [get_ports {pad[12]}]
set_input_transition -max 1  [get_ports {pad[11]}]
set_input_transition -min 1  [get_ports {pad[11]}]
set_input_transition -max 1  [get_ports {pad[10]}]
set_input_transition -min 1  [get_ports {pad[10]}]
set_input_transition -max 1  [get_ports {pad[9]}]
set_input_transition -min 1  [get_ports {pad[9]}]
set_input_transition -max 1  [get_ports {pad[8]}]
set_input_transition -min 1  [get_ports {pad[8]}]
set_input_transition -max 1  [get_ports {pad[7]}]
set_input_transition -min 1  [get_ports {pad[7]}]
set_input_transition -max 1  [get_ports {pad[6]}]
set_input_transition -min 1  [get_ports {pad[6]}]
set_input_transition -max 1  [get_ports {pad[5]}]
set_input_transition -min 1  [get_ports {pad[5]}]
set_input_transition -max 1  [get_ports {pad[4]}]
set_input_transition -min 1  [get_ports {pad[4]}]
set_input_transition -max 1  [get_ports {pad[3]}]
set_input_transition -min 1  [get_ports {pad[3]}]
set_input_transition -max 1  [get_ports {pad[2]}]
set_input_transition -min 1  [get_ports {pad[2]}]
set_input_transition -max 1  [get_ports {pad[1]}]
set_input_transition -min 1  [get_ports {pad[1]}]
set_input_transition -max 1  [get_ports {pad[0]}]
set_input_transition -min 1  [get_ports {pad[0]}]
set_input_transition -max 1  [get_ports ppar]
set_input_transition -min 1  [get_ports ppar]
set_input_transition -max 1  [get_ports {pc_be[3]}]
set_input_transition -min 1  [get_ports {pc_be[3]}]
set_input_transition -max 1  [get_ports {pc_be[2]}]
set_input_transition -min 1  [get_ports {pc_be[2]}]
set_input_transition -max 1  [get_ports {pc_be[1]}]
set_input_transition -min 1  [get_ports {pc_be[1]}]
set_input_transition -max 1  [get_ports {pc_be[0]}]
set_input_transition -min 1  [get_ports {pc_be[0]}]
set_input_transition -max 1  [get_ports pframe_n]
set_input_transition -min 1  [get_ports pframe_n]
set_input_transition -max 1  [get_ports ptrdy_n]
set_input_transition -min 1  [get_ports ptrdy_n]
set_input_transition -max 1  [get_ports pirdy_n]
set_input_transition -min 1  [get_ports pirdy_n]
set_input_transition -max 1  [get_ports pdevsel_n]
set_input_transition -min 1  [get_ports pdevsel_n]
set_input_transition -max 1  [get_ports pstop_n]
set_input_transition -min 1  [get_ports pstop_n]
set_input_transition -max 1  [get_ports pperr_n]
set_input_transition -min 1  [get_ports pperr_n]
set_input_transition -max 1  [get_ports pserr_n]
set_input_transition -min 1  [get_ports pserr_n]
set_input_transition -max 1  [get_ports pm66en]
set_input_transition -min 1  [get_ports pm66en]
set_input_transition -max 0.5  [get_ports sdr_clk]
set_input_transition -min 0.5  [get_ports sdr_clk]
set_input_transition -max 0.5  [get_ports {sd_DQ[15]}]
set_input_transition -min 0.5  [get_ports {sd_DQ[15]}]
set_input_transition -max 0.5  [get_ports {sd_DQ[14]}]
set_input_transition -min 0.5  [get_ports {sd_DQ[14]}]
set_input_transition -max 0.5  [get_ports {sd_DQ[13]}]
set_input_transition -min 0.5  [get_ports {sd_DQ[13]}]
set_input_transition -max 0.5  [get_ports {sd_DQ[12]}]
set_input_transition -min 0.5  [get_ports {sd_DQ[12]}]
set_input_transition -max 0.5  [get_ports {sd_DQ[11]}]
set_input_transition -min 0.5  [get_ports {sd_DQ[11]}]
set_input_transition -max 0.5  [get_ports {sd_DQ[10]}]
set_input_transition -min 0.5  [get_ports {sd_DQ[10]}]
set_input_transition -max 0.5  [get_ports {sd_DQ[9]}]
set_input_transition -min 0.5  [get_ports {sd_DQ[9]}]
set_input_transition -max 0.5  [get_ports {sd_DQ[8]}]
set_input_transition -min 0.5  [get_ports {sd_DQ[8]}]
set_input_transition -max 0.5  [get_ports {sd_DQ[7]}]
set_input_transition -min 0.5  [get_ports {sd_DQ[7]}]
set_input_transition -max 0.5  [get_ports {sd_DQ[6]}]
set_input_transition -min 0.5  [get_ports {sd_DQ[6]}]
set_input_transition -max 0.5  [get_ports {sd_DQ[5]}]
set_input_transition -min 0.5  [get_ports {sd_DQ[5]}]
set_input_transition -max 0.5  [get_ports {sd_DQ[4]}]
set_input_transition -min 0.5  [get_ports {sd_DQ[4]}]
set_input_transition -max 0.5  [get_ports {sd_DQ[3]}]
set_input_transition -min 0.5  [get_ports {sd_DQ[3]}]
set_input_transition -max 0.5  [get_ports {sd_DQ[2]}]
set_input_transition -min 0.5  [get_ports {sd_DQ[2]}]
set_input_transition -max 0.5  [get_ports {sd_DQ[1]}]
set_input_transition -min 0.5  [get_ports {sd_DQ[1]}]
set_input_transition -max 0.5  [get_ports {sd_DQ[0]}]
set_input_transition -min 0.5  [get_ports {sd_DQ[0]}]
set_clock_gating_check -low -rise -setup 0.2 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_0__sd_mux_dq_out/A1]
set_clock_gating_check -low -fall -setup 0.2 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_0__sd_mux_dq_out/A1]
set_clock_gating_check -low -rise -hold 0.1 [get_pins                          \
I_ORCA_TOP/I_SDRAM_IF/genblk1_0__sd_mux_dq_out/A1]
set_clock_gating_check -low -fall -hold 0.1 [get_pins                          \
I_ORCA_TOP/I_SDRAM_IF/genblk1_0__sd_mux_dq_out/A1]
set_clock_gating_check -high -rise -setup 0.2 [get_pins                        \
I_ORCA_TOP/I_SDRAM_IF/genblk1_0__sd_mux_dq_out/A2]
set_clock_gating_check -high -fall -setup 0.2 [get_pins                        \
I_ORCA_TOP/I_SDRAM_IF/genblk1_0__sd_mux_dq_out/A2]
set_clock_gating_check -high -rise -hold 0.1 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_0__sd_mux_dq_out/A2]
set_clock_gating_check -high -fall -hold 0.1 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_0__sd_mux_dq_out/A2]
set_clock_gating_check -low -rise -setup 0.2 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_1__sd_mux_dq_out/A1]
set_clock_gating_check -low -fall -setup 0.2 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_1__sd_mux_dq_out/A1]
set_clock_gating_check -low -rise -hold 0.1 [get_pins                          \
I_ORCA_TOP/I_SDRAM_IF/genblk1_1__sd_mux_dq_out/A1]
set_clock_gating_check -low -fall -hold 0.1 [get_pins                          \
I_ORCA_TOP/I_SDRAM_IF/genblk1_1__sd_mux_dq_out/A1]
set_clock_gating_check -high -rise -setup 0.2 [get_pins                        \
I_ORCA_TOP/I_SDRAM_IF/genblk1_1__sd_mux_dq_out/A2]
set_clock_gating_check -high -fall -setup 0.2 [get_pins                        \
I_ORCA_TOP/I_SDRAM_IF/genblk1_1__sd_mux_dq_out/A2]
set_clock_gating_check -high -rise -hold 0.1 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_1__sd_mux_dq_out/A2]
set_clock_gating_check -high -fall -hold 0.1 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_1__sd_mux_dq_out/A2]
set_clock_gating_check -low -rise -setup 0.2 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_2__sd_mux_dq_out/A1]
set_clock_gating_check -low -fall -setup 0.2 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_2__sd_mux_dq_out/A1]
set_clock_gating_check -low -rise -hold 0.1 [get_pins                          \
I_ORCA_TOP/I_SDRAM_IF/genblk1_2__sd_mux_dq_out/A1]
set_clock_gating_check -low -fall -hold 0.1 [get_pins                          \
I_ORCA_TOP/I_SDRAM_IF/genblk1_2__sd_mux_dq_out/A1]
set_clock_gating_check -high -rise -setup 0.2 [get_pins                        \
I_ORCA_TOP/I_SDRAM_IF/genblk1_2__sd_mux_dq_out/A2]
set_clock_gating_check -high -fall -setup 0.2 [get_pins                        \
I_ORCA_TOP/I_SDRAM_IF/genblk1_2__sd_mux_dq_out/A2]
set_clock_gating_check -high -rise -hold 0.1 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_2__sd_mux_dq_out/A2]
set_clock_gating_check -high -fall -hold 0.1 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_2__sd_mux_dq_out/A2]
set_clock_gating_check -low -rise -setup 0.2 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_3__sd_mux_dq_out/A1]
set_clock_gating_check -low -fall -setup 0.2 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_3__sd_mux_dq_out/A1]
set_clock_gating_check -low -rise -hold 0.1 [get_pins                          \
I_ORCA_TOP/I_SDRAM_IF/genblk1_3__sd_mux_dq_out/A1]
set_clock_gating_check -low -fall -hold 0.1 [get_pins                          \
I_ORCA_TOP/I_SDRAM_IF/genblk1_3__sd_mux_dq_out/A1]
set_clock_gating_check -high -rise -setup 0.2 [get_pins                        \
I_ORCA_TOP/I_SDRAM_IF/genblk1_3__sd_mux_dq_out/A2]
set_clock_gating_check -high -fall -setup 0.2 [get_pins                        \
I_ORCA_TOP/I_SDRAM_IF/genblk1_3__sd_mux_dq_out/A2]
set_clock_gating_check -high -rise -hold 0.1 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_3__sd_mux_dq_out/A2]
set_clock_gating_check -high -fall -hold 0.1 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_3__sd_mux_dq_out/A2]
set_clock_gating_check -low -rise -setup 0.2 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_4__sd_mux_dq_out/A1]
set_clock_gating_check -low -fall -setup 0.2 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_4__sd_mux_dq_out/A1]
set_clock_gating_check -low -rise -hold 0.1 [get_pins                          \
I_ORCA_TOP/I_SDRAM_IF/genblk1_4__sd_mux_dq_out/A1]
set_clock_gating_check -low -fall -hold 0.1 [get_pins                          \
I_ORCA_TOP/I_SDRAM_IF/genblk1_4__sd_mux_dq_out/A1]
set_clock_gating_check -high -rise -setup 0.2 [get_pins                        \
I_ORCA_TOP/I_SDRAM_IF/genblk1_4__sd_mux_dq_out/A2]
set_clock_gating_check -high -fall -setup 0.2 [get_pins                        \
I_ORCA_TOP/I_SDRAM_IF/genblk1_4__sd_mux_dq_out/A2]
set_clock_gating_check -high -rise -hold 0.1 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_4__sd_mux_dq_out/A2]
set_clock_gating_check -high -fall -hold 0.1 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_4__sd_mux_dq_out/A2]
set_clock_gating_check -low -rise -setup 0.2 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_5__sd_mux_dq_out/A1]
set_clock_gating_check -low -fall -setup 0.2 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_5__sd_mux_dq_out/A1]
set_clock_gating_check -low -rise -hold 0.1 [get_pins                          \
I_ORCA_TOP/I_SDRAM_IF/genblk1_5__sd_mux_dq_out/A1]
set_clock_gating_check -low -fall -hold 0.1 [get_pins                          \
I_ORCA_TOP/I_SDRAM_IF/genblk1_5__sd_mux_dq_out/A1]
set_clock_gating_check -high -rise -setup 0.2 [get_pins                        \
I_ORCA_TOP/I_SDRAM_IF/genblk1_5__sd_mux_dq_out/A2]
set_clock_gating_check -high -fall -setup 0.2 [get_pins                        \
I_ORCA_TOP/I_SDRAM_IF/genblk1_5__sd_mux_dq_out/A2]
set_clock_gating_check -high -rise -hold 0.1 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_5__sd_mux_dq_out/A2]
set_clock_gating_check -high -fall -hold 0.1 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_5__sd_mux_dq_out/A2]
set_clock_gating_check -low -rise -setup 0.2 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_6__sd_mux_dq_out/A1]
set_clock_gating_check -low -fall -setup 0.2 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_6__sd_mux_dq_out/A1]
set_clock_gating_check -low -rise -hold 0.1 [get_pins                          \
I_ORCA_TOP/I_SDRAM_IF/genblk1_6__sd_mux_dq_out/A1]
set_clock_gating_check -low -fall -hold 0.1 [get_pins                          \
I_ORCA_TOP/I_SDRAM_IF/genblk1_6__sd_mux_dq_out/A1]
set_clock_gating_check -high -rise -setup 0.2 [get_pins                        \
I_ORCA_TOP/I_SDRAM_IF/genblk1_6__sd_mux_dq_out/A2]
set_clock_gating_check -high -fall -setup 0.2 [get_pins                        \
I_ORCA_TOP/I_SDRAM_IF/genblk1_6__sd_mux_dq_out/A2]
set_clock_gating_check -high -rise -hold 0.1 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_6__sd_mux_dq_out/A2]
set_clock_gating_check -high -fall -hold 0.1 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_6__sd_mux_dq_out/A2]
set_clock_gating_check -low -rise -setup 0.2 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_7__sd_mux_dq_out/A1]
set_clock_gating_check -low -fall -setup 0.2 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_7__sd_mux_dq_out/A1]
set_clock_gating_check -low -rise -hold 0.1 [get_pins                          \
I_ORCA_TOP/I_SDRAM_IF/genblk1_7__sd_mux_dq_out/A1]
set_clock_gating_check -low -fall -hold 0.1 [get_pins                          \
I_ORCA_TOP/I_SDRAM_IF/genblk1_7__sd_mux_dq_out/A1]
set_clock_gating_check -high -rise -setup 0.2 [get_pins                        \
I_ORCA_TOP/I_SDRAM_IF/genblk1_7__sd_mux_dq_out/A2]
set_clock_gating_check -high -fall -setup 0.2 [get_pins                        \
I_ORCA_TOP/I_SDRAM_IF/genblk1_7__sd_mux_dq_out/A2]
set_clock_gating_check -high -rise -hold 0.1 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_7__sd_mux_dq_out/A2]
set_clock_gating_check -high -fall -hold 0.1 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_7__sd_mux_dq_out/A2]
set_clock_gating_check -low -rise -setup 0.2 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_8__sd_mux_dq_out/A1]
set_clock_gating_check -low -fall -setup 0.2 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_8__sd_mux_dq_out/A1]
set_clock_gating_check -low -rise -hold 0.1 [get_pins                          \
I_ORCA_TOP/I_SDRAM_IF/genblk1_8__sd_mux_dq_out/A1]
set_clock_gating_check -low -fall -hold 0.1 [get_pins                          \
I_ORCA_TOP/I_SDRAM_IF/genblk1_8__sd_mux_dq_out/A1]
set_clock_gating_check -high -rise -setup 0.2 [get_pins                        \
I_ORCA_TOP/I_SDRAM_IF/genblk1_8__sd_mux_dq_out/A2]
set_clock_gating_check -high -fall -setup 0.2 [get_pins                        \
I_ORCA_TOP/I_SDRAM_IF/genblk1_8__sd_mux_dq_out/A2]
set_clock_gating_check -high -rise -hold 0.1 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_8__sd_mux_dq_out/A2]
set_clock_gating_check -high -fall -hold 0.1 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_8__sd_mux_dq_out/A2]
set_clock_gating_check -low -rise -setup 0.2 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_9__sd_mux_dq_out/A1]
set_clock_gating_check -low -fall -setup 0.2 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_9__sd_mux_dq_out/A1]
set_clock_gating_check -low -rise -hold 0.1 [get_pins                          \
I_ORCA_TOP/I_SDRAM_IF/genblk1_9__sd_mux_dq_out/A1]
set_clock_gating_check -low -fall -hold 0.1 [get_pins                          \
I_ORCA_TOP/I_SDRAM_IF/genblk1_9__sd_mux_dq_out/A1]
set_clock_gating_check -high -rise -setup 0.2 [get_pins                        \
I_ORCA_TOP/I_SDRAM_IF/genblk1_9__sd_mux_dq_out/A2]
set_clock_gating_check -high -fall -setup 0.2 [get_pins                        \
I_ORCA_TOP/I_SDRAM_IF/genblk1_9__sd_mux_dq_out/A2]
set_clock_gating_check -high -rise -hold 0.1 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_9__sd_mux_dq_out/A2]
set_clock_gating_check -high -fall -hold 0.1 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_9__sd_mux_dq_out/A2]
set_clock_gating_check -low -rise -setup 0.2 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_10__sd_mux_dq_out/A1]
set_clock_gating_check -low -fall -setup 0.2 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_10__sd_mux_dq_out/A1]
set_clock_gating_check -low -rise -hold 0.1 [get_pins                          \
I_ORCA_TOP/I_SDRAM_IF/genblk1_10__sd_mux_dq_out/A1]
set_clock_gating_check -low -fall -hold 0.1 [get_pins                          \
I_ORCA_TOP/I_SDRAM_IF/genblk1_10__sd_mux_dq_out/A1]
set_clock_gating_check -high -rise -setup 0.2 [get_pins                        \
I_ORCA_TOP/I_SDRAM_IF/genblk1_10__sd_mux_dq_out/A2]
set_clock_gating_check -high -fall -setup 0.2 [get_pins                        \
I_ORCA_TOP/I_SDRAM_IF/genblk1_10__sd_mux_dq_out/A2]
set_clock_gating_check -high -rise -hold 0.1 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_10__sd_mux_dq_out/A2]
set_clock_gating_check -high -fall -hold 0.1 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_10__sd_mux_dq_out/A2]
set_clock_gating_check -low -rise -setup 0.2 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_11__sd_mux_dq_out/A1]
set_clock_gating_check -low -fall -setup 0.2 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_11__sd_mux_dq_out/A1]
set_clock_gating_check -low -rise -hold 0.1 [get_pins                          \
I_ORCA_TOP/I_SDRAM_IF/genblk1_11__sd_mux_dq_out/A1]
set_clock_gating_check -low -fall -hold 0.1 [get_pins                          \
I_ORCA_TOP/I_SDRAM_IF/genblk1_11__sd_mux_dq_out/A1]
set_clock_gating_check -high -rise -setup 0.2 [get_pins                        \
I_ORCA_TOP/I_SDRAM_IF/genblk1_11__sd_mux_dq_out/A2]
set_clock_gating_check -high -fall -setup 0.2 [get_pins                        \
I_ORCA_TOP/I_SDRAM_IF/genblk1_11__sd_mux_dq_out/A2]
set_clock_gating_check -high -rise -hold 0.1 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_11__sd_mux_dq_out/A2]
set_clock_gating_check -high -fall -hold 0.1 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_11__sd_mux_dq_out/A2]
set_clock_gating_check -low -rise -setup 0.2 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_12__sd_mux_dq_out/A1]
set_clock_gating_check -low -fall -setup 0.2 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_12__sd_mux_dq_out/A1]
set_clock_gating_check -low -rise -hold 0.1 [get_pins                          \
I_ORCA_TOP/I_SDRAM_IF/genblk1_12__sd_mux_dq_out/A1]
set_clock_gating_check -low -fall -hold 0.1 [get_pins                          \
I_ORCA_TOP/I_SDRAM_IF/genblk1_12__sd_mux_dq_out/A1]
set_clock_gating_check -high -rise -setup 0.2 [get_pins                        \
I_ORCA_TOP/I_SDRAM_IF/genblk1_12__sd_mux_dq_out/A2]
set_clock_gating_check -high -fall -setup 0.2 [get_pins                        \
I_ORCA_TOP/I_SDRAM_IF/genblk1_12__sd_mux_dq_out/A2]
set_clock_gating_check -high -rise -hold 0.1 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_12__sd_mux_dq_out/A2]
set_clock_gating_check -high -fall -hold 0.1 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_12__sd_mux_dq_out/A2]
set_clock_gating_check -low -rise -setup 0.2 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_13__sd_mux_dq_out/A1]
set_clock_gating_check -low -fall -setup 0.2 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_13__sd_mux_dq_out/A1]
set_clock_gating_check -low -rise -hold 0.1 [get_pins                          \
I_ORCA_TOP/I_SDRAM_IF/genblk1_13__sd_mux_dq_out/A1]
set_clock_gating_check -low -fall -hold 0.1 [get_pins                          \
I_ORCA_TOP/I_SDRAM_IF/genblk1_13__sd_mux_dq_out/A1]
set_clock_gating_check -high -rise -setup 0.2 [get_pins                        \
I_ORCA_TOP/I_SDRAM_IF/genblk1_13__sd_mux_dq_out/A2]
set_clock_gating_check -high -fall -setup 0.2 [get_pins                        \
I_ORCA_TOP/I_SDRAM_IF/genblk1_13__sd_mux_dq_out/A2]
set_clock_gating_check -high -rise -hold 0.1 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_13__sd_mux_dq_out/A2]
set_clock_gating_check -high -fall -hold 0.1 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_13__sd_mux_dq_out/A2]
set_clock_gating_check -low -rise -setup 0.2 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_14__sd_mux_dq_out/A1]
set_clock_gating_check -low -fall -setup 0.2 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_14__sd_mux_dq_out/A1]
set_clock_gating_check -low -rise -hold 0.1 [get_pins                          \
I_ORCA_TOP/I_SDRAM_IF/genblk1_14__sd_mux_dq_out/A1]
set_clock_gating_check -low -fall -hold 0.1 [get_pins                          \
I_ORCA_TOP/I_SDRAM_IF/genblk1_14__sd_mux_dq_out/A1]
set_clock_gating_check -high -rise -setup 0.2 [get_pins                        \
I_ORCA_TOP/I_SDRAM_IF/genblk1_14__sd_mux_dq_out/A2]
set_clock_gating_check -high -fall -setup 0.2 [get_pins                        \
I_ORCA_TOP/I_SDRAM_IF/genblk1_14__sd_mux_dq_out/A2]
set_clock_gating_check -high -rise -hold 0.1 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_14__sd_mux_dq_out/A2]
set_clock_gating_check -high -fall -hold 0.1 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_14__sd_mux_dq_out/A2]
set_clock_gating_check -low -rise -setup 0.2 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_15__sd_mux_dq_out/A1]
set_clock_gating_check -low -fall -setup 0.2 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_15__sd_mux_dq_out/A1]
set_clock_gating_check -low -rise -hold 0.1 [get_pins                          \
I_ORCA_TOP/I_SDRAM_IF/genblk1_15__sd_mux_dq_out/A1]
set_clock_gating_check -low -fall -hold 0.1 [get_pins                          \
I_ORCA_TOP/I_SDRAM_IF/genblk1_15__sd_mux_dq_out/A1]
set_clock_gating_check -high -rise -setup 0.2 [get_pins                        \
I_ORCA_TOP/I_SDRAM_IF/genblk1_15__sd_mux_dq_out/A2]
set_clock_gating_check -high -fall -setup 0.2 [get_pins                        \
I_ORCA_TOP/I_SDRAM_IF/genblk1_15__sd_mux_dq_out/A2]
set_clock_gating_check -high -rise -hold 0.1 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_15__sd_mux_dq_out/A2]
set_clock_gating_check -high -fall -hold 0.1 [get_pins                         \
I_ORCA_TOP/I_SDRAM_IF/genblk1_15__sd_mux_dq_out/A2]
