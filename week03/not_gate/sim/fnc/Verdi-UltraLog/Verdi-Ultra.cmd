verdiSetActWin -dock widgetDock_<Message>
debImport "-f" "run.f"
debLoadSimResult /home1/std251_4/week03/not_gate/sim/fnc/top.fsdb
wvCreateWindow
verdiWindowResize -win $_Verdi_1 "28" "286" "900" "700"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
schCreateWindow -delim "." -win $_nSchema1 -scope "tb_not_gate"
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -inst "u_not_gate"
schPushViewIn -win $_nSchema3
schSelect -win $_nSchema3 -inst "not_gate:SigTap0:6:6:Combo"
schSetOptions -win $_nSchema3 -portName on
schSetOptions -win $_nSchema3 -pinName on
schSetOptions -win $_nSchema3 -instName on
schSetOptions -win $_nSchema3 -localNetName on
schSetOptions -win $_nSchema3 -completeName on
schSetOptions -win $_nSchema3 -parameterList on
schSetOptions -win $_nSchema3 -highContrastMode on
schSetOptions -win $_nSchema3 -parameterList off
schSetOptions -win $_nSchema3 -parameterList on
schSetOptions -win $_nSchema3 -highContrastMode off
schZoomOut -win $_nSchema3 -pos 2293 1280
schZoomOut -win $_nSchema3 -pos 2293 1279
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_not_gate"
verdiSetActWin -win $_nWave2
wvCreateWindow
verdiSetActWin -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 0)}
wvOpenFile -win $_nWave4 {/home1/std251_4/week03/not_gate/sim/fnc/top.fsdb}
wvGetSignalOpen -win $_nWave4
wvGetSignalSetScope -win $_nWave4 "/tb_not_gate"
wvSetPosition -win $_nWave4 {("G1" 2)}
wvSetPosition -win $_nWave4 {("G1" 2)}
wvAddSignal -win $_nWave4 -clear
wvAddSignal -win $_nWave4 -group {"G1" \
{/tb_not_gate/a} \
{/tb_not_gate/o} \
}
wvAddSignal -win $_nWave4 -group {"G2" \
}
wvSelectSignal -win $_nWave4 {( "G1" 1 2 )} 
wvSetPosition -win $_nWave4 {("G1" 2)}
wvSetPosition -win $_nWave4 {("G1" 2)}
wvSetPosition -win $_nWave4 {("G1" 2)}
wvAddSignal -win $_nWave4 -clear
wvAddSignal -win $_nWave4 -group {"G1" \
{/tb_not_gate/a} \
{/tb_not_gate/o} \
}
wvAddSignal -win $_nWave4 -group {"G2" \
}
wvSelectSignal -win $_nWave4 {( "G1" 1 2 )} 
wvSetPosition -win $_nWave4 {("G1" 2)}
wvGetSignalClose -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvSetCursor -win $_nWave4 71.780682 -snap {("G2" 0)}
wvSelectGroup -win $_nWave4 {G2}
schDeselectAll -win $_nSchema3
verdiSetActWin -win $_nSchema_3
verdiWindowResize -win $_Verdi_1 "481" "220" "900" "700"
debExit
