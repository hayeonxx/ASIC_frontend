#!bin/csh -f
# edit

#module load syn/2018.06-SP4
module load syn/2021.06-SP5-5

#setenv work_path /slowfs/dgscratch1/asic/ASIC_Project/1_FrontEnd/2_Synthesis
setenv tool_path /global/apps/syn_2021.06-SP5-5
#setenv tool_path /global/apps/syn_2018.06-SP4

set path = (. $tool_path/bin $path)

alias g 'gvim'
