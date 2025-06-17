debImport "-f" "run.f"
wvCreateWindow
wvOpenFile -win $_nWave2 {/home1/std251_4/week03/mux_4to1/sim/fnc/top.fsdb}
verdiWindowResize -win $_Verdi_1 "56" "75" "1053" "824"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
schCreateWindow -delim "." -win $_nSchema1 -scope "tb_mux_4to1"
verdiSetActWin -win $_nSchema_3
wvCreateWindow
verdiSetActWin -win $_nWave4
debReload
schSelect -win $_nSchema3 -inst "u_mux_4to1"
schPushViewIn -win $_nSchema3
verdiSetActWin -win $_nSchema_3
wvCreateWindow
verdiSetActWin -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 0)}
wvOpenFile -win $_nWave5 {/home1/std251_4/week03/mux_4to1/sim/fnc/top.fsdb}
wvGetSignalOpen -win $_nWave5
wvGetSignalSetScope -win $_nWave5 "/tb_mux_4to1"
wvSetPosition -win $_nWave5 {("G1" 6)}
wvSetPosition -win $_nWave5 {("G1" 6)}
wvAddSignal -win $_nWave5 -clear
wvAddSignal -win $_nWave5 -group {"G1" \
{/tb_mux_4to1/A\[3:0\]} \
{/tb_mux_4to1/B\[3:0\]} \
{/tb_mux_4to1/C\[3:0\]} \
{/tb_mux_4to1/D\[3:0\]} \
{/tb_mux_4to1/out\[3:0\]} \
{/tb_mux_4to1/sel\[1:0\]} \
}
wvAddSignal -win $_nWave5 -group {"G2" \
}
wvSelectSignal -win $_nWave5 {( "G1" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave5 {("G1" 6)}
wvSetPosition -win $_nWave5 {("G1" 6)}
wvSetPosition -win $_nWave5 {("G1" 6)}
wvAddSignal -win $_nWave5 -clear
wvAddSignal -win $_nWave5 -group {"G1" \
{/tb_mux_4to1/A\[3:0\]} \
{/tb_mux_4to1/B\[3:0\]} \
{/tb_mux_4to1/C\[3:0\]} \
{/tb_mux_4to1/D\[3:0\]} \
{/tb_mux_4to1/out\[3:0\]} \
{/tb_mux_4to1/sel\[1:0\]} \
}
wvAddSignal -win $_nWave5 -group {"G2" \
}
wvSelectSignal -win $_nWave5 {( "G1" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave5 {("G1" 6)}
wvGetSignalClose -win $_nWave5
verdiWindowResize -win $_Verdi_1 "56" "75" "1380" "824"
verdiSetActWin -win $_nSchema_3
schSetOptions -win $_nSchema3 -portName on
schSetOptions -win $_nSchema3 -pinName on
schSetOptions -win $_nSchema3 -instName on
schSetOptions -win $_nSchema3 -localNetName on
schSetOptions -win $_nSchema3 -completeName on
schSetOptions -win $_nSchema3 -parameterList on
schSetOptions -win $_nSchema3 -highContrastMode on
wvZoomOut -win $_nWave5
verdiSetActWin -win $_nWave5
wvZoomOut -win $_nWave5
wvZoomOut -win $_nWave5
wvSelectSignal -win $_nWave5 {( "G1" 6 )} 
wvSetPosition -win $_nWave5 {("G1" 5)}
wvSetPosition -win $_nWave5 {("G1" 4)}
wvMoveSelected -win $_nWave5
wvSetPosition -win $_nWave5 {("G1" 4)}
wvSetPosition -win $_nWave5 {("G1" 5)}
wvSelectGroup -win $_nWave5 {G2}
wvSelectSignal -win $_nWave5 {( "G1" 4 )} 
wvSelectSignal -win $_nWave5 {( "G1" 5 )} 
wvSelectGroup -win $_nWave5 {G2}
schZoomOut -win $_nSchema3 -pos 6712 3300
verdiSetActWin -win $_nSchema_3
debExit
