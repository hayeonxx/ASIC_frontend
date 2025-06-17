#!bin/csh -f
# edit

module load fm/2021.06-SP5
# /home1/std251_4/week04/mydesign/fm
setenv work_path ~/week09/complex_cal
# setenv tool_path /tools/synopsys_2021/fm/S-2021.06-SP5
setenv tool_path /global/apps/fm_2021.06-SP5

set path = (. $tool_path/bin $path)

alias g 'gvim'
