debImport "-f" "run.f"
debLoadSimResult /home1/std251_4/week03/shift_ff/sim/fnc/top.fsdb
wvCreateWindow
verdiWindowResize -win $_Verdi_1 "500" "182" "900" "700"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
schCreateWindow -delim "." -win $_nSchema1 -scope "tb_shift_ff"
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -inst "u_shift_ff"
schPushViewIn -win $_nSchema3
schSelect -win $_nSchema3 -inst "shift_ff:Always0:21:37:Reg"
schPushViewIn -win $_nSchema3
srcSetScope "tb_shift_ff.u_shift_ff" -delim "." -win $_nTrace1
srcSelect -win $_nTrace1 -range {21 37 1 2 1 1}
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcHBSelect "tb_shift_ff" -win $_nTrace1
srcHBSelect "tb_shift_ff" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
schCreateWindow -delim "." -win $_nSchema1 -scope "tb_shift_ff.u_shift_ff"
verdiSetActWin -win $_nSchema_4
schSetOptions -win $_nSchema4 -portName on
schSetOptions -win $_nSchema4 -pinName on
schSetOptions -win $_nSchema4 -instName on
schSetOptions -win $_nSchema4 -localNetName on
schSetOptions -win $_nSchema4 -completeName on
schSetOptions -win $_nSchema4 -parameterList on
schSetOptions -win $_nSchema4 -parameterList off
schSetOptions -win $_nSchema4 -highContrastMode on
schSetOptions -win $_nSchema4 -parameterList on
schSetOptions -win $_nSchema4 -highContrastMode off
schSelect -win $_nSchema4 -inst "shift_ff:Always0:21:37:Reg"
schPushViewIn -win $_nSchema4
srcSelect -win $_nTrace1 -range {21 37 1 2 1 1}
verdiSetActWin -dock widgetDock_<Inst._Tree>
schCreateWindow -delim "." -win $_nSchema1 -scope "tb_shift_ff.u_shift_ff"
verdiSetActWin -win $_nSchema_5
schPopViewUp -win $_nSchema5
schSelect -win $_nSchema5 -inst "u_shift_ff"
schPushViewIn -win $_nSchema5
schSetOptions -win $_nSchema5 -portName on
schSetOptions -win $_nSchema5 -pinName on
schSetOptions -win $_nSchema5 -instName on
schSetOptions -win $_nSchema5 -localNetName on
schSetOptions -win $_nSchema5 -completeName on
schSetOptions -win $_nSchema5 -parameterList on
wvCreateWindow
verdiSetActWin -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 0)}
wvOpenFile -win $_nWave6 {/home1/std251_4/week03/shift_ff/sim/fnc/top.fsdb}
wvGetSignalOpen -win $_nWave6
wvGetSignalSetScope -win $_nWave6 "/tb_shift_ff"
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvAddSignal -win $_nWave6 -clear
wvAddSignal -win $_nWave6 -group {"G1" \
{/tb_shift_ff/clk} \
{/tb_shift_ff/in} \
{/tb_shift_ff/out} \
{/tb_shift_ff/rst} \
}
wvAddSignal -win $_nWave6 -group {"G2" \
}
wvSelectSignal -win $_nWave6 {( "G1" 1 2 3 4 )} 
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvSetPosition -win $_nWave6 {("G1" 4)}
wvAddSignal -win $_nWave6 -clear
wvAddSignal -win $_nWave6 -group {"G1" \
{/tb_shift_ff/clk} \
{/tb_shift_ff/in} \
{/tb_shift_ff/out} \
{/tb_shift_ff/rst} \
}
wvAddSignal -win $_nWave6 -group {"G2" \
}
wvSelectSignal -win $_nWave6 {( "G1" 1 2 3 4 )} 
wvSetPosition -win $_nWave6 {("G1" 4)}
wvGetSignalClose -win $_nWave6
wvZoomOut -win $_nWave6
wvSelectSignal -win $_nWave6 {( "G1" 4 )} 
wvSetPosition -win $_nWave6 {("G1" 3)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvSetPosition -win $_nWave6 {("G1" 1)}
wvMoveSelected -win $_nWave6
wvSetPosition -win $_nWave6 {("G1" 1)}
wvSetPosition -win $_nWave6 {("G1" 2)}
wvZoomOut -win $_nWave6
verdiSetActWin -win $_nSchema_5
debExit
