verdiSetActWin -dock widgetDock_<Message>
debImport "-f" "run.f"
debLoadSimResult /home1/std251_4/week03/d_ff/sim/fnc/top.fsdb
wvCreateWindow
verdiWindowResize -win $_Verdi_1 "0" "0" "900" "700"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
schCreateWindow -delim "." -win $_nSchema1 -scope "tb_d_ff"
verdiSetActWin -win $_nSchema_3
wvCreateWindow
verdiSetActWin -win $_nWave4
schSelect -win $_nSchema3 -inst "u_d_ff"
schPushViewIn -win $_nSchema3
verdiSetActWin -win $_nSchema_3
verdiSetActWin -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 0)}
wvOpenFile -win $_nWave4 {/home1/std251_4/week03/d_ff/sim/fnc/top.fsdb}
wvGetSignalOpen -win $_nWave4
wvGetSignalSetScope -win $_nWave4 "/tb_d_ff"
wvSetPosition -win $_nWave4 {("G1" 5)}
wvSetPosition -win $_nWave4 {("G1" 5)}
wvAddSignal -win $_nWave4 -clear
wvAddSignal -win $_nWave4 -group {"G1" \
{/tb_d_ff/D} \
{/tb_d_ff/D} \
{/tb_d_ff/Q} \
{/tb_d_ff/clk} \
{/tb_d_ff/rst} \
}
wvAddSignal -win $_nWave4 -group {"G2" \
}
wvSelectSignal -win $_nWave4 {( "G1" 2 3 4 5 )} 
wvSetPosition -win $_nWave4 {("G1" 5)}
wvSetPosition -win $_nWave4 {("G1" 5)}
wvSetPosition -win $_nWave4 {("G1" 5)}
wvAddSignal -win $_nWave4 -clear
wvAddSignal -win $_nWave4 -group {"G1" \
{/tb_d_ff/D} \
{/tb_d_ff/D} \
{/tb_d_ff/Q} \
{/tb_d_ff/clk} \
{/tb_d_ff/rst} \
}
wvAddSignal -win $_nWave4 -group {"G2" \
}
wvSelectSignal -win $_nWave4 {( "G1" 2 3 4 5 )} 
wvSetPosition -win $_nWave4 {("G1" 5)}
wvGetSignalClose -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
verdiSetActWin -win $_nSchema_3
schPopViewUp -win $_nSchema3
schZoomIn -win $_nSchema3 -pos 11705 4204
schZoomIn -win $_nSchema3 -pos 11705 4204
schZoomOut -win $_nSchema3 -pos 11705 4204
schZoomOut -win $_nSchema3 -pos 11703 4204
schSelect -win $_nSchema3 -inst "u_d_ff"
schPushViewIn -win $_nSchema3
schZoomIn -win $_nSchema3 -pos 8455 3635
schZoomIn -win $_nSchema3 -pos 8455 3635
schSelect -win $_nSchema3 -signal "Q"
schDeselectAll -win $_nSchema3
debExit
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   debExit
