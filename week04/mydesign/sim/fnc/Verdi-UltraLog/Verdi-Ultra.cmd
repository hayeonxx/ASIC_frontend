verdiSetActWin -dock widgetDock_<Message>
debImport "-f" "run_pre.f"
debLoadSimResult /home1/std251_4/week04/mydesign/sim/fnc/test.pre.fsdb
wvCreateWindow
verdiWindowResize -win $_Verdi_1 "101" "86" "1052" "762"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
wvCreateWindow
verdiSetActWin -win $_nWave3
wvSetPosition -win $_nWave3 {("G1" 0)}
wvOpenFile -win $_nWave3 {/home1/std251_4/week04/mydesign/sim/fnc/test.pre.fsdb}
wvZoom -win $_nWave3 5913.837398 6041.934959
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvReloadFile -win $_nWave3
wvGetSignalOpen -win $_nWave3
wvGetSignalSetScope -win $_nWave3 "/testbench"
wvSetPosition -win $_nWave3 {("G1" 12)}
wvSetPosition -win $_nWave3 {("G1" 12)}
wvAddSignal -win $_nWave3 -clear
wvAddSignal -win $_nWave3 -group {"G1" \
{/testbench/cin1} \
{/testbench/cin2} \
{/testbench/clk} \
{/testbench/co1} \
{/testbench/co2} \
{/testbench/din1} \
{/testbench/do1\[1:0\]} \
{/testbench/do2\[1:0\]} \
{/testbench/do3\[1:0\]} \
{/testbench/n_rst} \
{/testbench/sel} \
{/testbench/up1_dn0} \
}
wvAddSignal -win $_nWave3 -group {"G2" \
}
wvSelectSignal -win $_nWave3 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 )} 
wvSetPosition -win $_nWave3 {("G1" 12)}
wvSetPosition -win $_nWave3 {("G1" 12)}
wvSetPosition -win $_nWave3 {("G1" 12)}
wvAddSignal -win $_nWave3 -clear
wvAddSignal -win $_nWave3 -group {"G1" \
{/testbench/cin1} \
{/testbench/cin2} \
{/testbench/clk} \
{/testbench/co1} \
{/testbench/co2} \
{/testbench/din1} \
{/testbench/do1\[1:0\]} \
{/testbench/do2\[1:0\]} \
{/testbench/do3\[1:0\]} \
{/testbench/n_rst} \
{/testbench/sel} \
{/testbench/up1_dn0} \
}
wvAddSignal -win $_nWave3 -group {"G2" \
}
wvSelectSignal -win $_nWave3 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 )} 
wvSetPosition -win $_nWave3 {("G1" 12)}
wvGetSignalClose -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
verdiWindowBeWindow -win $_nWave3
wvResizeWindow -win $_nWave3 -8 19 1048 378
verdiSetActWin -win $_nWave2
wvOpenFile -win $_nWave2 {/home1/std251_4/week04/mydesign/sim/fnc/test.fsdb}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/testbench"
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/testbench/cin1} \
{/testbench/cin2} \
{/testbench/clk} \
{/testbench/co1} \
{/testbench/co2} \
{/testbench/din1} \
{/testbench/do1\[1:0\]} \
{/testbench/do2\[1:0\]} \
{/testbench/do3\[1:0\]} \
{/testbench/n_rst} \
{/testbench/sel} \
{/testbench/up1_dn0} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 )} 
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvSetPosition -win $_nWave2 {("G1" 12)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/testbench/cin1} \
{/testbench/cin2} \
{/testbench/clk} \
{/testbench/co1} \
{/testbench/co2} \
{/testbench/din1} \
{/testbench/do1\[1:0\]} \
{/testbench/do2\[1:0\]} \
{/testbench/do3\[1:0\]} \
{/testbench/n_rst} \
{/testbench/sel} \
{/testbench/up1_dn0} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 )} 
wvSetPosition -win $_nWave2 {("G1" 12)}
wvGetSignalClose -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave3 121489.531300 -snap {("G1" 8)}
verdiSetActWin -win $_nWave3
wvSyncAllWaveform -win $_nWave3 -cursor_marker on -horizontal_range on \
           -vertical_scroll on
wvZoomIn -win $_nWave3
verdiSetActWin -win $_nWave2
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 -10 19 1052 387
verdiSetActWin -win $_nWave3
verdiSetActWin -win $_nWave2
wvSetCursor -win $_nWave2 107857.723577 -snap {("G1" 7)}
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 7 )} 
wvSelectSignal -win $_nWave3 {( "G1" 7 )} 
verdiSetActWin -win $_nWave3
wvSetCursor -win $_nWave3 101671.528588 -snap {("G1" 12)}
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomIn -win $_nWave3
wvZoomOut -win $_nWave3
wvTpfCloseForm -win $_nWave3
wvGetSignalClose -win $_nWave3
wvCloseWindow -win $_nWave3
verdiSetActWin -win $_nWave2
wvTpfCloseForm -win $_nWave2
wvGetSignalClose -win $_nWave2
wvCloseWindow -win $_nWave2
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
debExit
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    wvResizeWindow -win $_nWave5 -10 19 1920 1016
verdiSetActWin -win $_nWave5
wvTpfCloseForm -win $_nWave5
wvGetSignalClose -win $_nWave5
wvCloseWindow -win $_nWave5
verdiSetActWin -win $_nWave2
wvTpfCloseForm -win $_nWave4
wvGetSignalClose -win $_nWave4
wvCloseWindow -win $_nWave4
debExit
