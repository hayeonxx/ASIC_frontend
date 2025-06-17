verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
debImport "-f" "run.f"
debLoadSimResult /home1/std251_4/ASIC_final/sim/fnc/top.fsdb
wvCreateWindow
verdiWindowResize -win $_Verdi_1 "0" "0" "1440" "996"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
schCreateWindow -delim "." -win $_nSchema1 -scope "tb_fir13_filter"
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -inst "u_fir13_filter"
schPushViewIn -win $_nSchema3
verdiSetActWin -win $_nWave2
wvCreateWindow
verdiSetActWin -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 0)}
wvOpenFile -win $_nWave4 {/home1/std251_4/ASIC_final/sim/fnc/test.fsdb}
wvGetSignalOpen -win $_nWave4
wvGetSignalSetScope -win $_nWave4 "/tb_fir13_filter"
wvSetPosition -win $_nWave4 {("G1" 2)}
wvSetPosition -win $_nWave4 {("G1" 2)}
wvAddSignal -win $_nWave4 -clear
wvAddSignal -win $_nWave4 -group {"G1" \
{/tb_fir13_filter/xn\[7:0\]} \
{/tb_fir13_filter/yn\[7:0\]} \
}
wvAddSignal -win $_nWave4 -group {"G2" \
}
wvSelectSignal -win $_nWave4 {( "G1" 1 2 )} 
wvSetPosition -win $_nWave4 {("G1" 2)}
wvSetPosition -win $_nWave4 {("G1" 2)}
wvSetPosition -win $_nWave4 {("G1" 2)}
wvAddSignal -win $_nWave4 -clear
wvAddSignal -win $_nWave4 -group {"G1" \
{/tb_fir13_filter/xn\[7:0\]} \
{/tb_fir13_filter/yn\[7:0\]} \
}
wvAddSignal -win $_nWave4 -group {"G2" \
}
wvSelectSignal -win $_nWave4 {( "G1" 1 2 )} 
wvSetPosition -win $_nWave4 {("G1" 2)}
wvGetSignalClose -win $_nWave4
wvSetCursor -win $_nWave4 938523.076923 -snap {("G2" 0)}
verdiWindowBeWindow -win $_nWave4
wvResizeWindow -win $_nWave4 0 0 1920 447
wvSetCursor -win $_nWave2 358990.712570
verdiSetActWin -win $_nWave2
wvOpenFile -win $_nWave2 -mul \
           {/home1/std251_4/ASIC_final/sim/fnc/test.fsdb} {/home1/std251_4/ASIC_final/sim/pre/test.pre.fsdb} 
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/tb_fir13_filter"
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_fir13_filter/xn\[7:0\]} \
{/tb_fir13_filter/yn\[7:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 )} 
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/tb_fir13_filter/xn\[7:0\]} \
{/tb_fir13_filter/yn\[7:0\]} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 )} 
wvSetPosition -win $_nWave2 {("G1" 2)}
wvGetSignalClose -win $_nWave2
verdiWindowBeWindow -win $_nWave2
wvResizeWindow -win $_nWave2 0 0 1920 447
verdiSetActWin -win $_nWave4
wvSetCursor -win $_nWave2 2109877.917506 -snap {("G2" 0)}
verdiSetActWin -win $_nWave2
verdiSetActWin -win $_nWave4
wvSyncAllWaveform -win $_nWave4 -cursor_marker on -horizontal_range on \
           -vertical_scroll on
wvZoomIn -win $_nWave4
wvZoomIn -win $_nWave4
wvZoomIn -win $_nWave4
wvZoomIn -win $_nWave4
wvZoomIn -win $_nWave4
wvZoomIn -win $_nWave4
wvZoomIn -win $_nWave4
wvZoomIn -win $_nWave4
wvZoomIn -win $_nWave4
wvZoomIn -win $_nWave4
verdiSetActWin -win $_nWave2
wvZoomOut -win $_nWave4
verdiSetActWin -win $_nWave4
wvZoomIn -win $_nWave4
wvZoomIn -win $_nWave4
wvZoomIn -win $_nWave4
verdiSetActWin -win $_nWave2
wvSetCursor -win $_nWave4 2081101.414054 -snap {("G2" 0)}
verdiSetActWin -win $_nWave4
verdiSetActWin -win $_nWave2
verdiSetActWin -win $_nWave4
verdiSetActWin -win $_nWave2
wvDigitalToAnalog -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave4 2065027.331357 -snap {("G2" 0)}
verdiSetActWin -win $_nWave4
wvDigitalToAnalog -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 4 )} 
wvSelectGroup -win $_nWave4 {G2}
wvSelectSignal -win $_nWave4 {( "G1" 4 )} 
wvSelectSignal -win $_nWave4 {( "G1" 1 )} 
wvSelectSignal -win $_nWave4 {( "G1" 1 )} 
wvSelectSignal -win $_nWave4 {( "G1" 1 2 )} 
wvSetRadix -win $_nWave4 -2Com
wvDigitalToAnalog -win $_nWave4
wvSelectSignal -win $_nWave4 {( "G1" 4 )} 
wvSelectSignal -win $_nWave4 {( "G1" 3 )} 
wvSelectSignal -win $_nWave4 {( "G1" 3 4 )} 
wvCut -win $_nWave4
wvSetPosition -win $_nWave4 {("G1" 2)}
wvSelectGroup -win $_nWave4 {G1}
wvSelectSignal -win $_nWave4 {( "G1" 1 )} 
wvSelectSignal -win $_nWave4 {( "G1" 1 2 )} 
wvSetRadix -win $_nWave4 -2Com
wvDigitalToAnalog -win $_nWave4
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
verdiSetActWin -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 3 4 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSelectSignal -win $_nWave2 {( "G1" 1 2 )} 
wvSetRadix -win $_nWave2 -2Com
wvDigitalToAnalog -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave4 {( "G1" 4 )} 
verdiSetActWin -win $_nWave4
verdiSetActWin -win $_nSchema_3
debReload
verdiSetActWin -win $_nWave4
wvSetCursor -win $_nWave2 24186374.783112 -snap {("G1" 4)}
verdiSetActWin -win $_nWave2
wvSetCursor -win $_nWave2 29619929.438982 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 13125209.947947 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 12754740.312319 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 15930194.331984 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 17235658.762290 -snap {("G1" 4)}
wvSetCursor -win $_nWave2 20322905.725853 -snap {("G1" 4)}
verdiSetActWin -win $_nWave4
wvResizeWindow -win $_nWave4 67 230 1920 391
wvResizeWindow -win $_nWave4 67 230 1920 411
verdiSetActWin -win $_nWave2
wvResizeWindow -win $_nWave2 99 437 1920 447
verdiSetActWin -win $_nWave4
wvSetCursor -win $_nWave2 16111050.809604 -snap {("G2" 0)}
verdiSetActWin -win $_nWave2
wvResizeWindow -win $_nWave4 -10 19 1920 1016
verdiSetActWin -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvZoomOut -win $_nWave4
wvResizeWindow -win $_nWave4 -91 77 1920 411
wvResizeWindow -win $_nWave4 -91 77 1895 411
wvSelectSignal -win $_nWave4 {( "G1" 4 )} 
wvSelectSignal -win $_nWave4 {( "G1" 4 )} 
wvSelectGroup -win $_nWave4 {G1}
wvResizeWindow -win $_nWave4 -166 72 2073 411
verdiSetActWin -win $_nSchema_3
debReload
schCreateWindow -delim "." -win $_nSchema1 -scope "tb_fir13_filter"
verdiSetActWin -win $_nSchema_5
schSelect -win $_nSchema5 -inst "u_fir13_filter"
schPushViewIn -win $_nSchema5
verdiWindowBeWindow -win $_nSchema_5
schSetOptions -win $_nSchema5 -portName on
schSetOptions -win $_nSchema5 -portName off
schSetOptions -win $_nSchema5 -pinName on
schSetOptions -win $_nSchema5 -portName on
schSetOptions -win $_nSchema5 -instName on
schSetOptions -win $_nSchema5 -localNetName on
schSetOptions -win $_nSchema5 -completeName on
schSetOptions -win $_nSchema5 -alignRight on
schSetOptions -win $_nSchema5 -stickyLocator on
schSetOptions -win $_nSchema5 -parameterList on
schSetOptions -win $_nSchema5 -highContrastMode on
schSetOptions -win $_nSchema5 -highContrastMode off
schZoomOut -win $_nSchema5 -pos 38786 21515
schZoomOut -win $_nSchema5 -pos 38786 21514
schZoomIn -win $_nSchema5 -pos 38905 23380
schCloseWindow -win $_nSchema5
verdiSetActWin -win $_nSchema_3
schCreateWindow -delim "." -win $_nSchema1 -scope "tb_fir13_filter"
verdiSetActWin -win $_nSchema_6
schSelect -win $_nSchema6 -inst "u_fir13_filter"
schPushViewIn -win $_nSchema6
verdiSetActWin -win $_nWave4
wvTpfCloseForm -win $_nWave4
wvGetSignalClose -win $_nWave4
wvCloseWindow -win $_nWave4
verdiSetActWin -win $_nSchema_6
verdiSetActWin -win $_nWave2
wvTpfCloseForm -win $_nWave2
wvGetSignalClose -win $_nWave2
wvCloseWindow -win $_nWave2
verdiSetActWin -win $_nSchema_6
wvCreateWindow
verdiSetActWin -win $_nWave7
wvGetSignalOpen -win $_nWave7
wvGetSignalSetScope -win $_nWave7 "/tb_fir13_filter"
wvSetPosition -win $_nWave7 {("G1" 2)}
wvSetPosition -win $_nWave7 {("G1" 2)}
wvAddSignal -win $_nWave7 -clear
wvAddSignal -win $_nWave7 -group {"G1" \
{/tb_fir13_filter/xn\[7:0\]} \
{/tb_fir13_filter/yn\[7:0\]} \
}
wvAddSignal -win $_nWave7 -group {"G2" \
}
wvSelectSignal -win $_nWave7 {( "G1" 1 2 )} 
wvSetPosition -win $_nWave7 {("G1" 2)}
wvSetPosition -win $_nWave7 {("G1" 2)}
wvSetPosition -win $_nWave7 {("G1" 2)}
wvAddSignal -win $_nWave7 -clear
wvAddSignal -win $_nWave7 -group {"G1" \
{/tb_fir13_filter/xn\[7:0\]} \
{/tb_fir13_filter/yn\[7:0\]} \
}
wvAddSignal -win $_nWave7 -group {"G2" \
}
wvSelectSignal -win $_nWave7 {( "G1" 1 2 )} 
wvSetPosition -win $_nWave7 {("G1" 2)}
wvGetSignalClose -win $_nWave7
wvCreateWindow
verdiSetActWin -win $_nWave8
wvSetPosition -win $_nWave8 {("G1" 0)}
wvOpenFile -win $_nWave8 {/home1/std251_4/ASIC_final/sim/pre/test.pre.fsdb}
wvGetSignalOpen -win $_nWave8
wvGetSignalSetScope -win $_nWave8 "/tb_fir13_filter"
wvSetPosition -win $_nWave8 {("G1" 6)}
wvSetPosition -win $_nWave8 {("G1" 6)}
wvAddSignal -win $_nWave8 -clear
wvAddSignal -win $_nWave8 -group {"G1" \
{/tb_fir13_filter/clk} \
{/tb_fir13_filter/i\[31:0\]} \
{/tb_fir13_filter/n_rst} \
{/tb_fir13_filter/r_addr\[12:0\]} \
{/tb_fir13_filter/xn\[7:0\]} \
{/tb_fir13_filter/yn\[7:0\]} \
}
wvAddSignal -win $_nWave8 -group {"G2" \
}
wvSelectSignal -win $_nWave8 {( "G1" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave8 {("G1" 6)}
wvSetPosition -win $_nWave8 {("G1" 6)}
wvSetPosition -win $_nWave8 {("G1" 6)}
wvAddSignal -win $_nWave8 -clear
wvAddSignal -win $_nWave8 -group {"G1" \
{/tb_fir13_filter/clk} \
{/tb_fir13_filter/i\[31:0\]} \
{/tb_fir13_filter/n_rst} \
{/tb_fir13_filter/r_addr\[12:0\]} \
{/tb_fir13_filter/xn\[7:0\]} \
{/tb_fir13_filter/yn\[7:0\]} \
}
wvAddSignal -win $_nWave8 -group {"G2" \
}
wvSelectSignal -win $_nWave8 {( "G1" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave8 {("G1" 6)}
wvGetSignalClose -win $_nWave8
verdiWindowBeWindow -win $_nWave8
wvResizeWindow -win $_nWave8 0 0 1920 447
verdiSetActWin -win $_nWave7
wvOpenFile -win $_nWave7 {/home1/std251_4/ASIC_final/sim/fnc/test.fsdb}
wvGetSignalOpen -win $_nWave7
wvGetSignalSetScope -win $_nWave7 "/tb_fir13_filter"
wvSetCursor -win $_nWave7 63494.955965 -snap {("G2" 0)}
verdiWindowBeWindow -win $_nWave7
wvResizeWindow -win $_nWave7 0 0 1920 447
wvCut -win $_nWave7
wvSetPosition -win $_nWave7 {("G1" 0)}
wvSetFileTimeRange -win $_nWave7 -time_unit 1p 0 30200000
wvGetSignalOpen -win $_nWave7
wvSetPosition -win $_nWave7 {("G1" 6)}
wvSetPosition -win $_nWave7 {("G1" 6)}
wvAddSignal -win $_nWave7 -clear
wvAddSignal -win $_nWave7 -group {"G1" \
{/tb_fir13_filter/clk} \
{/tb_fir13_filter/i\[31:0\]} \
{/tb_fir13_filter/n_rst} \
{/tb_fir13_filter/r_addr\[12:0\]} \
{/tb_fir13_filter/xn\[7:0\]} \
{/tb_fir13_filter/yn\[7:0\]} \
}
wvAddSignal -win $_nWave7 -group {"G2" \
}
wvSelectSignal -win $_nWave7 {( "G1" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave7 {("G1" 6)}
wvSetPosition -win $_nWave7 {("G1" 6)}
wvSetPosition -win $_nWave7 {("G1" 6)}
wvAddSignal -win $_nWave7 -clear
wvAddSignal -win $_nWave7 -group {"G1" \
{/tb_fir13_filter/clk} \
{/tb_fir13_filter/i\[31:0\]} \
{/tb_fir13_filter/n_rst} \
{/tb_fir13_filter/r_addr\[12:0\]} \
{/tb_fir13_filter/xn\[7:0\]} \
{/tb_fir13_filter/yn\[7:0\]} \
}
wvAddSignal -win $_nWave7 -group {"G2" \
}
wvSelectSignal -win $_nWave7 {( "G1" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave7 {("G1" 6)}
wvGetSignalClose -win $_nWave7
wvResizeWindow -win $_nWave8 -10 696 1920 449
verdiSetActWin -win $_nWave8
verdiSetActWin -win $_nWave7
wvSyncAllWaveform -win $_nWave7 -cursor_marker on -horizontal_range on \
           -vertical_scroll on
wvZoomIn -win $_nWave7
wvZoomIn -win $_nWave7
wvZoomIn -win $_nWave7
wvZoomIn -win $_nWave7
wvSetCursor -win $_nWave7 2186610.429716 -snap {("G2" 0)}
wvZoomIn -win $_nWave7
wvZoomIn -win $_nWave7
wvZoomIn -win $_nWave7
wvZoomIn -win $_nWave7
wvZoomIn -win $_nWave7
wvZoomIn -win $_nWave7
wvZoomIn -win $_nWave7
wvZoomIn -win $_nWave7
wvZoomIn -win $_nWave7
wvZoomIn -win $_nWave7
wvZoomIn -win $_nWave7
wvZoomIn -win $_nWave7
wvZoomIn -win $_nWave7
wvZoomIn -win $_nWave7
wvZoomIn -win $_nWave7
wvZoomOut -win $_nWave7
wvZoomOut -win $_nWave7
wvZoomOut -win $_nWave7
wvZoomOut -win $_nWave7
wvZoomOut -win $_nWave7
wvZoomOut -win $_nWave7
wvZoomOut -win $_nWave7
wvZoomOut -win $_nWave7
wvZoomOut -win $_nWave7
wvZoomOut -win $_nWave7
wvZoomIn -win $_nWave7
wvZoomIn -win $_nWave7
wvZoomIn -win $_nWave7
wvZoomIn -win $_nWave7
wvTpfCloseForm -win $_nWave7
wvGetSignalClose -win $_nWave7
wvCloseWindow -win $_nWave7
verdiSetActWin -win $_nWave8
wvTpfCloseForm -win $_nWave8
wvGetSignalClose -win $_nWave8
wvCloseWindow -win $_nWave8
verdiSetActWin -win $_nSchema_6
debExit
