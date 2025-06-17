module CLOCK_GEN (
  input pclk,
  input sdram_clk,
  input sys_clk,
  input pclk_fb,
  input sdram_clk_fb,
  input test_mode,
  input powersave,
  output reg o_pclk,
  output reg o_sdram_clk,
  output reg o_sys_clk,
  output reg o_sys_2x_clk
);

  wire net_pclk;
  wire net_sdram_clk;
  wire net_sys_clk;
  wire net_sys_2x_clk;
  wire net_ps_sys_2x_clk;
 
  //0824
  wire ti_hi = 1;
  wire ti_low = 0;
  // Define the PLL module here (assuming you have a separate Verilog file for the PLL module)

  // Define the CLKMUL module here (assuming you have a separate Verilog file for the CLKMUL module)

  // Instantiate the PLL and CLKMUL modules
  PLL I_PLL_PCI (
    .REF_CLK(pclk),
    .FB_CLK(pclk_fb),
    .FB_MODE(ti_hi),
    .PLL_BYPASS(ti_low),
    .CLK_1X(net_pclk),
    .CLK_2X(),
    .CLK_4X()
  );

  PLL I_PLL_SD (
    .REF_CLK(sdram_clk),
    .FB_CLK(sdram_clk_fb),
    .FB_MODE(ti_hi),
    .PLL_BYPASS(ti_low),
    .CLK_1X(net_sdram_clk),
    .CLK_2X(),
    .CLK_4X()
  );

  CLKMUL I_CLKMUL (
    .CLK_IN(sys_clk),
    .CLK_1X(net_sys_clk),
    .CLK_2X(net_sys_2x_clk)
  );
    
  // In powersave mode, the 2x clock runs at the same speed as the sys_clk
  assign net_ps_sys_2x_clk = (powersave == 1'b1) ? net_sys_clk : net_sys_2x_clk;
  
  // All output clocks are muxed with their respective test clocks
  always @(*) begin
    o_pclk = (test_mode == 1'b1) ? pclk : net_pclk;
    o_sdram_clk = (test_mode == 1'b1) ? sdram_clk : net_sdram_clk;
    o_sys_clk = (test_mode == 1'b1) ? sys_clk : net_sys_clk;
    o_sys_2x_clk = (test_mode == 1'b1) ? sys_clk : net_ps_sys_2x_clk;
  end

endmodule

