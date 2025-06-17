verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -win $_OneSearch
debImport "-f" "run_pre.f"
debLoadSimResult /home1/std251_4/week09/complex_cal/sim/pre/test.pre.fsdb
wvCreateWindow
verdiWindowResize -win $_Verdi_1 "793" "204" "900" "700"
verdiSetActWidebExit
widgetDock_MTB_SOURCE_TAB_1
wvCreateWindow
verdiSetActWin -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 0)}
wvOpenFile -win $_nWave3 \
           {/home1/std251_4/week09/complex_cal/sim/fnc/test.pre.fsdb}
verdiWindowBeWindow -win $_nWave3
wvResizeWindow -win $_nWave3 0 0 1920 414
verdiSetActWin -win $_nWave2
wvOpenFile -win $_nWave2 {/home1/std251_4/week09/complex_cal/sim/fnc/test.fsdb}
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 0 0 1920 414
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_complex_cal"
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_complex_cal/cal_mode} \
{/tb_complex_cal/clk} \
{/tb_complex_cal/din_im_1\[7:0\]} \
{/tb_complex_cal/din_im_2\[7:0\]} \
{/tb_complex_cal/din_re_1\[7:0\]} \
{/tb_complex_cal/din_re_2\[7:0\]} \
{/tb_complex_cal/din_vld} \
{/tb_complex_cal/dout_im\[7:0\]} \
{/tb_complex_cal/dout_re\[7:0\]} \
{/tb_complex_cal/dout_vld} \
{/tb_complex_cal/n_rst} \
{/tb_complex_cal/r1\[31:0\]} \
{/tb_complex_cal/r2\[31:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 )} 
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvSetPosition -win $_nWave2 {("G1" 13)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_complex_cal/cal_mode} \
{/tb_complex_cal/clk} \
{/tb_complex_cal/din_im_1\[7:0\]} \
{/tb_complex_cal/din_im_2\[7:0\]} \
{/tb_complex_cal/din_re_1\[7:0\]} \
{/tb_complex_cal/din_re_2\[7:0\]} \
{/tb_complex_cal/din_vld} \
{/tb_complex_cal/dout_im\[7:0\]} \
{/tb_complex_cal/dout_re\[7:0\]} \
{/tb_complex_cal/dout_vld} \
{/tb_complex_cal/n_rst} \
{/tb_complex_cal/r1\[31:0\]} \
{/tb_complex_cal/r2\[31:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 )} 
wvSetPosition -win $_nWave2 {("G1" 13)}
wvGetSignalClose -win $_nWave2
wvSelectGroup -win $_nWave3 {G1}
verdiSetActWin -win $_nWave3
wvGetSignalOpen -win $_nWave3
wvGetSignalSetScope -win $_nWave3 "/tb_complex_cal"
wvSetPosition -win $_nWave3 {("G1" 13)}
wvSetPosition -win $_nWave3 {("G1" 13)}
wvAddSignal -win $_nWave3 -clear
wvAddSignal -win $_nWave3 -group {"G1" \
{/tb_complex_cal/cal_mode} \
{/tb_complex_cal/clk} \
{/tb_complex_cal/din_im_1\[7:0\]} \
{/tb_complex_cal/din_im_2\[7:0\]} \
{/tb_complex_cal/din_re_1\[7:0\]} \
{/tb_complex_cal/din_re_2\[7:0\]} \
{/tb_complex_cal/din_vld} \
{/tb_complex_cal/dout_im\[7:0\]} \
{/tb_complex_cal/dout_re\[7:0\]} \
{/tb_complex_cal/dout_vld} \
{/tb_complex_cal/n_rst} \
{/tb_complex_cal/r1\[31:0\]} \
{/tb_complex_cal/r2\[31:0\]} \
}
wvAddSignal -win $_nWave3 -group {"G2" \
}
wvSelectSignal -win $_nWave3 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 )} 
wvSetPosition -win $_nWave3 {("G1" 13)}
wvSetPosition -win $_nWave3 {("G1" 13)}
wvSetPosition -win $_nWave3 {("G1" 13)}
wvAddSignal -win $_nWave3 -clear
wvAddSignal -win $_nWave3 -group {"G1" \
{/tb_complex_cal/cal_mode} \
{/tb_complex_cal/clk} \
{/tb_complex_cal/din_im_1\[7:0\]} \
{/tb_complex_cal/din_im_2\[7:0\]} \
{/tb_complex_cal/din_re_1\[7:0\]} \
{/tb_complex_cal/din_re_2\[7:0\]} \
{/tb_complex_cal/din_vld} \
{/tb_complex_cal/dout_im\[7:0\]} \
{/tb_complex_cal/dout_re\[7:0\]} \
{/tb_complex_cal/dout_vld} \
{/tb_complex_cal/n_rst} \
{/tb_complex_cal/r1\[31:0\]} \
{/tb_complex_cal/r2\[31:0\]} \
}
wvAddSignal -win $_nWave3 -group {"G2" \
}
wvSelectSignal -win $_nWave3 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 )} 
wvSetPosition -win $_nWave3 {("G1" 13)}
wvGetSignalClose -win $_nWave3
wvSyncAllWaveform -win $_nWave3 -cursor_marker on -horizontal_range on \
           -vertical_scroll on
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
verdiSetActWin -win $_nWave2
verdiSetActWin -win $_nWave3
verdiSetActWin -win $_nWave2
wvSelectGroup -win $_nWave2 {G2}
wvZoomIn -win $_nWave3
verdiSetActWin -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvSetCursor -win $_nWave2 240348.727145
verdiSetActWin -win $_nWave2
wvZoomOut -win $_nWave3
verdiSetActWin -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave2 20386.159781 -snap {("G2" 0)}
verdiSetActWin -win $_nWave2
wvResizeWindow -win $_nWave2 -10 425 1920 451
wvSetCursor -win $_nWave3 2071930.469479 -snap {("G2" 0)}
verdiSetActWin -win $_nWave3
wvResizeWindow -win $_nWave3 -32 38 1920 442
wvSelectGroup -win $_nWave2 {G2}
verdiSetActWin -win $_nWave2
wvZoomOut -win $_nWave3
verdiSetActWin -win $_nWave3
verdiSetActWin -win $_nWave2
wvSetCursor -win $_nWave3 30275972.259194
verdiSetActWin -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
verdiSetActWin -win $_nWave2
verdiSetActWin -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvResizeWindow -win $_nWave3 -34 19 1920 442
verdiSetActWin -win $_nWave2
wvResizeWindow -win $_nWave2 -10 428 1920 451
verdiSetActWin -win $_nWave3
wvResizeWindow -win $_nWave3 -34 19 1920 442
verdiSetActWin -win $_nWave2
wvResizeWindow -win $_nWave2 -10 428 1920 451
verdiSetActWin -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSelectSignal -win $_nWave3 {( "G1" 12 )} 
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvSetCursor -win $_nWave3 47370131.579555 -snap {("G1" 9)}
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvSetCursor -win $_nWave2 473700.054086 -snap {("G1" 9)}
verdiSetActWin -win $_nWave2
verdiSetActWin -win $_nWave3
wvResizeWindow -win $_nWave3 -34 19 1920 442
verdiSetActWin -win $_nWave2
wvResizeWindow -win $_nWave2 -10 428 1920 451
wvSetCursor -win $_nWave3 47370195.580989
verdiSetActWin -win $_nWave3
wvSetCursor -win $_nWave3 47370205.891795
wvSetCursor -win $_nWave2 473699.992442
verdiSetActWin -win $_nWave2
wvSetCursor -win $_nWave3 47370203.314094
verdiSetActWin -win $_nWave3
wvSetCursor -win $_nWave3 47370209.758348
wvSetCursor -win $_nWave2 473699.979733
verdiSetActWin -win $_nWave2
