verdiSetActWin -dock widgetDock_<Message>
debImport "-f" "run.f"
debLoadSimResult /home1/std251_4/week03/dff/sim/fnc/top.fsdb
wvCreateWindow
verdiWindowResize -win $_Verdi_1 "253" "130" "966" "825"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
wvCreateWindow
verdiSetActWin -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 0)}
wvOpenFile -win $_nWave3 {/home1/std251_4/week03/dff/sim/fnc/top.fsdb}
wvGetSignalOpen -win $_nWave3
wvGetSignalSetScope -win $_nWave3 "/tb_dff"
wvSetPosition -win $_nWave3 {("G1" 5)}
wvSetPosition -win $_nWave3 {("G1" 5)}
wvAddSignal -win $_nWave3 -clear
wvAddSignal -win $_nWave3 -group {"G1" \
{/tb_dff/clk} \
{/tb_dff/d} \
{/tb_dff/n_rst} \
{/tb_dff/q} \
{/tb_dff/qn} \
}
wvAddSignal -win $_nWave3 -group {"G2" \
}
wvSelectSignal -win $_nWave3 {( "G1" 1 2 3 4 5 )} 
wvSetPosition -win $_nWave3 {("G1" 5)}
wvSetPosition -win $_nWave3 {("G1" 5)}
wvSetPosition -win $_nWave3 {("G1" 5)}
wvAddSignal -win $_nWave3 -clear
wvAddSignal -win $_nWave3 -group {"G1" \
{/tb_dff/clk} \
{/tb_dff/d} \
{/tb_dff/n_rst} \
{/tb_dff/q} \
{/tb_dff/qn} \
}
wvAddSignal -win $_nWave3 -group {"G2" \
}
wvSelectSignal -win $_nWave3 {( "G1" 1 2 3 4 5 )} 
wvSetPosition -win $_nWave3 {("G1" 5)}
wvGetSignalClose -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
verdiSetActWin -win $_nWave3
verdiWindowResize -win $_Verdi_1 "78" "94" "966" "825"
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcAction -pos 25 4 0 -win $_nTrace1 -name " " -ctrlKey off
srcDeselectAll -win $_nTrace1
srcAction -pos 25 4 0 -win $_nTrace1 -name " " -ctrlKey off
srcDeselectAll -win $_nTrace1
srcAction -pos 25 4 0 -win $_nTrace1 -name " " -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {26 27 2 1 1 1} -backward
srcDeselectAll -win $_nTrace1
debExit
