debImport "-f" "run.f"
debLoadSimResult /home1/std251_4/week03/counter/sim/fnc/top.fsdb
wvCreateWindow
verdiWindowResize -win $_Verdi_1 "500" "182" "900" "700"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
schCreateWindow -delim "." -win $_nSchema1 -scope "tb_counter"
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -inst "u_counter"
schPushViewIn -win $_nSchema3
schSelect -win $_nSchema3 -inst "counter:FSM0:9:14:Counter"
schPushViewIn -win $_nSchema3
srcSetScope "tb_counter.u_counter" -delim "." -win $_nTrace1
srcSelect -win $_nTrace1 -range {9 14 1 2 1 1}
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiDockWidgetSetCurTab -dock windowDock_nSchema_3
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -inst "counter:FSM0:9:14:Counter"
schDeselectAll -win $_nSchema3
schPopViewUp -win $_nSchema3
schSetOptions -win $_nSchema3 -portName on
schSetOptions -win $_nSchema3 -pinName on
schSetOptions -win $_nSchema3 -instName on
schSetOptions -win $_nSchema3 -localNetName on
schSetOptions -win $_nSchema3 -completeName on
schSetOptions -win $_nSchema3 -alignRight on
schSetOptions -win $_nSchema3 -alignRight off
schSetOptions -win $_nSchema3 -parameterList on
schSetOptions -win $_nSchema3 -highContrastMode on
schSelect -win $_nSchema3 -inst "u_counter"
schPushViewIn -win $_nSchema3
schPopViewUp -win $_nSchema3
schSelect -win $_nSchema3 -inst "u_counter"
schPushViewIn -win $_nSchema3
wvCreateWindow
verdiSetActWin -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 0)}
wvOpenFile -win $_nWave4 {/home1/std251_4/week03/counter/sim/fnc/top.fsdb}
wvGetSignalOpen -win $_nWave4
wvGetSignalSetScope -win $_nWave4 "/tb_counter"
wvSetPosition -win $_nWave4 {("G1" 3)}
wvSetPosition -win $_nWave4 {("G1" 3)}
wvAddSignal -win $_nWave4 -clear
wvAddSignal -win $_nWave4 -group {"G1" \
{/tb_counter/clk} \
{/tb_counter/out\[3:0\]} \
{/tb_counter/rst} \
}
wvAddSignal -win $_nWave4 -group {"G2" \
}
wvSelectSignal -win $_nWave4 {( "G1" 1 2 3 )} 
wvSetPosition -win $_nWave4 {("G1" 3)}
wvSetPosition -win $_nWave4 {("G1" 3)}
wvSetPosition -win $_nWave4 {("G1" 3)}
wvAddSignal -win $_nWave4 -clear
wvAddSignal -win $_nWave4 -group {"G1" \
{/tb_counter/clk} \
{/tb_counter/out\[3:0\]} \
{/tb_counter/rst} \
}
wvAddSignal -win $_nWave4 -group {"G2" \
}
wvSelectSignal -win $_nWave4 {( "G1" 1 2 3 )} 
wvSetPosition -win $_nWave4 {("G1" 3)}
wvGetSignalClose -win $_nWave4
wvSetCursor -win $_nWave4 65.133025 -snap {("G2" 0)}
wvSelectSignal -win $_nWave4 {( "G1" 2 )} 
wvZoomOut -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 1 2 3 )} 
wvSelectSignal -win $_nWave4 {( "G1" 2 )} 
wvSelectSignal -win $_nWave4 {( "G1" 3 )} 
wvSetPosition -win $_nWave4 {("G1" 2)}
wvSetPosition -win $_nWave4 {("G1" 1)}
wvMoveSelected -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 1)}
wvSetPosition -win $_nWave4 {("G1" 2)}
wvSetCursor -win $_nWave4 157.137073 -snap {("G2" 0)}
wvBusWaveform -win $_nWave4 -analog
wvAddSignal -win $_nWave4 "/tb_counter/DtoA_rst"
wvSetPosition -win $_nWave4 {("G1" 2)}
wvSetPosition -win $_nWave4 {("G1" 3)}
wvSetPosition -win $_nWave4 {("G1" 4)}
wvSetPosition -win $_nWave4 {("G2" 0)}
wvMoveSelected -win $_nWave4
wvSetPosition -win $_nWave4 {("G2" 1)}
wvSetPosition -win $_nWave4 {("G2" 1)}
wvCut -win $_nWave4
wvSetPosition -win $_nWave4 {("G3" 0)}
wvSetPosition -win $_nWave4 {("G2" 0)}
wvSelectSignal -win $_nWave4 {( "G1" 3 )} 
wvBusWaveform -win $_nWave4 -analog
wvSetPosition -win $_nWave4 {("G2" 0)}
schSelect -win $_nSchema3 -port "out\[3:0\]"
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -instpin "counter:FSM0:9:14:Counter" "rst" \
          "counter:FSM0:9:14:Counter" "out\[3:0\]" "counter:FSM0:9:14:Counter" \
          "clk"
schDeselectAll -win $_nSchema3
schSelect -win $_nSchema3 -port "out\[3:0\]"
schProperties -win $_nSchema3
schProperties -win $_nSchema3 -Basic on
schDeselectAll -win $_nSchema3
schSelect -win $_nSchema3 -port "out\[3:0\]"
schSelect -win $_nSchema3 -port "out\[3:0\]"
schDeselectAll -win $_nSchema3
schSelect -win $_nSchema3 -port "out\[3:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave2
schSelect -win $_nSchema3 -port "out\[3:0\]"
schPopViewUp -win $_nSchema3
schSelect -win $_nSchema3 -inst "u_counter"
schPushViewIn -win $_nSchema3
wvGetSignalOpen -win $_nWave4
wvGetSignalSetScope -win $_nWave4 "/tb_counter"
wvGetSignalSetScope -win $_nWave4 "/tb_counter"
verdiSetActWin -win $_nWave4
wvSetPosition -win $_nWave4 {("G2" 1)}
wvSetPosition -win $_nWave4 {("G2" 1)}
wvAddSignal -win $_nWave4 -clear
wvAddSignal -win $_nWave4 -group {"G1" \
{/tb_counter/clk} \
{/tb_counter/rst} \
{/tb_counter/out\[3:0\]} -height 98 \
}
wvAddSignal -win $_nWave4 -group {"G2" \
{/tb_counter/out\[3:0\]} \
}
wvAddSignal -win $_nWave4 -group {"G3" \
}
wvSelectSignal -win $_nWave4 {( "G2" 1 )} 
wvSetPosition -win $_nWave4 {("G2" 1)}
wvSetPosition -win $_nWave4 {("G2" 1)}
wvSetPosition -win $_nWave4 {("G2" 1)}
wvAddSignal -win $_nWave4 -clear
wvAddSignal -win $_nWave4 -group {"G1" \
{/tb_counter/clk} \
{/tb_counter/rst} \
{/tb_counter/out\[3:0\]} -height 98 \
}
wvAddSignal -win $_nWave4 -group {"G2" \
{/tb_counter/out\[3:0\]} \
}
wvAddSignal -win $_nWave4 -group {"G3" \
}
wvSelectSignal -win $_nWave4 {( "G2" 1 )} 
wvSetPosition -win $_nWave4 {("G2" 1)}
wvGetSignalClose -win $_nWave4
wvSetPosition -win $_nWave4 {("G2" 0)}
wvSetPosition -win $_nWave4 {("G1" 3)}
wvSetPosition -win $_nWave4 {("G1" 2)}
wvSetPosition -win $_nWave4 {("G2" 1)}
wvSetPosition -win $_nWave4 {("G2" 0)}
wvSetPosition -win $_nWave4 {("G1" 3)}
wvSetPosition -win $_nWave4 {("G1" 2)}
wvSetPosition -win $_nWave4 {("G1" 1)}
wvSetPosition -win $_nWave4 {("G1" 2)}
wvMoveSelected -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 2)}
wvSetPosition -win $_nWave4 {("G1" 3)}
wvSelectGroup -win $_nWave4 {G2}
wvSelectGroup -win $_nWave4 {G3}
wvSetCursor -win $_nWave4 320.699826 -snap {("G1" 4)}
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomIn -win $_nWave4
verdiWindowResize -win $_Verdi_1 "500" "182" "900" "700"
debExit
