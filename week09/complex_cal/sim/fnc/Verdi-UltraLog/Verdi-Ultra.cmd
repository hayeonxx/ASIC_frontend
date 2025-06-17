verdiSetActWin -dock widgetDock_<Message>
debImport "-f" "run.f"
debLoadSimResult /home1/std251_4/week09/complex_cal/sim/fnc/top.fsdb
wvCreateWindow
verdiWindowResize -win $_Verdi_1 "738" "157" "1052" "754"
verdiSewvCreateWindow
debExit
k_MTB_SOURCE_TAB_1
srcHBSelect "tb_complex_cal" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
schCreateWindow -delim "." -win $_nSchema1 -scope "tb_complex_cal"
verdiSetActWin -win $_nSchema_3
wvCreateWindow
verdiSetActWin -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 0)}
wvOpenFile -win $_nWave4 {/home1/std251_4/week09/complex_cal/sim/fnc/top.fsdb}
wvSetCursor -win $_nWave4 39628.599303
wvGetSignalOpen -win $_nWave4
wvGetSignalSetScope -win $_nWave4 "/tb_complex_cal"
wvSetPosition -win $_nWave4 {("G1" 13)}
wvSetPosition -win $_nWave4 {("G1" 13)}
wvAddSignal -win $_nWave4 -clear
wvAddSignal -win $_nWave4 -group {"G1" \
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
wvAddSignal -win $_nWave4 -group {"G2" \
}
wvSelectSignal -win $_nWave4 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 )} 
wvSetPosition -win $_nWave4 {("G1" 13)}
wvSetPosition -win $_nWave4 {("G1" 13)}
wvSetPosition -win $_nWave4 {("G1" 13)}
wvAddSignal -win $_nWave4 -clear
wvAddSignal -win $_nWave4 -group {"G1" \
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
wvAddSignal -win $_nWave4 -group {"G2" \
}
wvSelectSignal -win $_nWave4 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 )} 
wvSetPosition -win $_nWave4 {("G1" 13)}
wvGetSignalClose -win $_nWave4
wvZoomIn -win $_nWave4
wvZoomIn -win $_nWave4
wvZoomIn -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 10 )} 
wvSelectSignal -win $_nWave4 {( "G1" 9 )} 
wvSelectSignal -win $_nWave4 {( "G1" 8 )} 
wvSelectSignal -win $_nWave4 {( "G1" 9 )} 
wvSelectSignal -win $_nWave4 {( "G1" 12 )} 
wvSelectSignal -win $_nWave4 {( "G1" 13 )} 
wvSelectSignal -win $_nWave4 {( "G1" 13 )} 
wvSetRadix -win $_nWave4 -format UDec
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave4 -off
wvGetSignalClose -win $_nWave4
wvReloadFile -win $_nWave4
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave4 -off
wvGetSignalClose -win $_nWave4
wvReloadFile -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 12 )} 
wvSelectSignal -win $_nWave4 {( "G1" 12 )} 
wvSetRadix -win $_nWave4 -format UDec
wvSelectSignal -win $_nWave4 {( "G1" 12 )} 
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave4 -off
wvGetSignalClose -win $_nWave4
wvReloadFile -win $_nWave4
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave4 -off
wvGetSignalClose -win $_nWave4
wvReloadFile -win $_nWave4
wvSetCursor -win $_nWave4 378474.750844 -snap {("G1" 5)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave4 -off
wvGetSignalClose -win $_nWave4
wvReloadFile -win $_nWave4
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave4 -off
wvGetSignalClose -win $_nWave4
wvReloadFile -win $_nWave4
wvSetCursor -win $_nWave4 376484.407076 -snap {("G1" 11)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave4 -off
wvGetSignalClose -win $_nWave4
wvReloadFile -win $_nWave4
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave4 -off
wvGetSignalClose -win $_nWave4
wvReloadFile -win $_nWave4
wvSetCursor -win $_nWave4 3457.867621 -snap {("G1" 10)}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave4 -off
wvGetSignalClose -win $_nWave4
wvReloadFile -win $_nWave4
debExit
