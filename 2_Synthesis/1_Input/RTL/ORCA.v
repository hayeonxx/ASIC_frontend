module ORCA #(
  parameter sd_a_width = 10,       // was 23 in Orca I
            sd_dq_width = 16,      // was 32 in Orca I
            sd_rfifo_depth = 64,
            sd_wfifo_depth = 64,
            pci_data_width = 16,    // was 32 in Orca I - now implements the mini-PCI protocol ;-)
            pci_rfifo_depth = 32,
            pci_wfifo_depth = 32
) (
  // for now... revive in ORCA 2.1
  // test_mem_clk, // IN  std_logic;
  // test_sys2x_clk, // IN  std_logic;

  input scan_en, // IN  std_logic;
  input test_mode, // IN  std_logic;
  // An iddq control pin is only needed if we had pull-up/down PADs
  // iddq_mode, // IN  std_logic;

  // for now... revive in ORCA 2.1
  // TCK, // IN std_logic;
  // TRST, // IN std_logic;
  // TMS, // IN std_logic;
  // TDI, // IN std_logic;
  // TDO, // OUT std_logic;

  input power_save, // IN  std_logic;

  // System Clock
  input sys_clk, // IN  std_logic;

  // PCI Interface
  input pclk, // IN  std_logic;
  input prst_n, // IN  std_logic;

  input pidsel, // IN  std_logic;
  input pgnt_n, // IN  std_logic;
  inout wire [pci_data_width-1:0] pad,
  inout wire ppar, // INOUT std_logic;
  // inout wire ppar64, // INOUT std_logic;
  inout wire [3:0] pc_be, // INOUT std_logic_vector(3 DOWNTO 0);
  inout wire pframe_n, // INOUT std_logic;
  inout wire ptrdy_n, // INOUT std_logic;
  inout wire pirdy_n, // INOUT std_logic;
  inout wire pdevsel_n, // INOUT std_logic;
  inout wire pstop_n, // INOUT std_logic;
  inout wire pperr_n, // INOUT std_logic;
  inout wire pserr_n, // INOUT std_logic;
  // inout wire pack64_n, // INOUT std_logic;
  // inout wire preq64_n, // INOUT std_logic;

  output preq_n, // OUT   std_logic;
  input pm66en, // IN    std_logic;

  // DDR SDRAM Interface
  input sdr_clk, // IN    std_logic;
  output sd_CK, // OUT   std_logic;
  output sd_CKn, // OUT   std_logic;
  inout wire [sd_dq_width-1:0] sd_DQ, // INOUT std_logic_vector(sd_dq_width-1 DOWNTO 0);
  output [sd_a_width-1:0] sd_A, // OUT   std_logic_vector(sd_a_width-1 DOWNTO 0);
  output [1:0] sd_BWS, // OUT   std_logic_vector(1 DOWNTO 0);  -- byte write select mask
  output sd_LD, // OUT   std_logic;  -- Synchronous Load
  output sd_RW // OUT   std_logic   -- Synchronous Read/Write
);

// Define all the Verilog signals
wire ti_hi, ti_low;
reg reset_net;
//wire net_pad_en;
wire net_pad_en;
reg [5:0] net_pad_scan_en;
wire [pci_data_width-1:0] net_pad_in;
wire [pci_data_width-1:0] net_pad_out;

// PCI signals
wire net_pidsel;
wire net_pgnt_n;

wire net_ppar_in;
wire net_ppar_out;
wire net_ppar_en;
wire [3:0] net_pc_be_in;
wire [3:0] net_pc_be_out;
wire net_pc_be_en;
wire net_pframe_n_in;
wire net_pframe_n_out;
wire net_pframe_n_en;
wire net_ptrdy_n_in;
wire net_ptrdy_n_out;
wire net_ptrdy_n_en;
wire net_pirdy_n_in;
wire net_pirdy_n_out;
wire net_pirdy_n_en;
wire net_pdevsel_n_in;
wire net_pdevsel_n_out;
wire net_pdevsel_n_en;
wire net_pstop_n_in;
wire net_pstop_n_out;
wire net_pstop_n_en;
wire net_pperr_n_in;
wire net_pperr_n_out;
wire net_pperr_n_en;
wire net_pserr_n_in;
wire net_pserr_n_out;
wire net_pserr_n_en;

wire net_preq_n;
wire net_pm66en;

wire net_pclk;
wire net_sdram_clk;
wire net_sys_clk;

wire net_pclk_fb;
wire net_sdram_clk_fb;

wire net_test_mem_clk;

wire s_test_mode;
reg s_iddq_mode;
wire s_scan_en;
wire s_power_save;

wire buf_pclk;
wire buf_sys_clk;
wire buf_sys_2x_clk;
wire buf_sdram_clk;
wire s_pclk;
wire s_sys_clk;
wire s_sys_2x_clk;
wire s_sdram_clk;

reg TAP_unconnected;
reg s_TDI;
wire s_TDO;
reg s_TMS;
reg s_TCK;
reg s_TRST;
wire s_prst_n;

wire [sd_a_width-1:0] net_sdram_A;
reg [sd_a_width-1:0] net_sdram_A_in;
wire net_sdram_CK;
wire net_sdram_CKn;
wire net_sdram_LD;
wire net_sdram_RW;
wire [1:0] net_sdram_BWS;

wire [sd_dq_width-1:0] net_sdram_DQ_in;
wire [sd_dq_width-1:0] net_sdram_DQ_out;
wire [sd_dq_width-1:0] net_sdram_DQ_en;

wire net_test_sys2x_clk;

//0801
wire net_pad_en_output;
wire net_pad_en_input;
wire temp_inv_0;
wire temp_inv_1;
wire temp_inv_2;
wire temp_inv_3;
wire temp_inv_4;
wire temp_inv_5;
wire temp_inv_6;
wire temp_inv_7;
wire temp_inv_8;
wire temp_inv_9;

assign temp_inv_0 = ~net_ppar_en;
assign temp_inv_1 = ~net_pc_be_en;
assign temp_inv_2 = ~net_pframe_n_en;
assign temp_inv_3 = ~net_ptrdy_n_en;
assign temp_inv_4 = ~net_pirdy_n_en;
assign temp_inv_5 = ~net_pdevsel_n_en;
assign temp_inv_6 = ~net_pstop_n_en;
assign temp_inv_7 = ~net_pperr_n_en;
assign temp_inv_8 = ~net_pserr_n_en;

wire [sd_dq_width-1:0] inv_net_sdram_DQ_en;

assign inv_net_sdram_DQ_en = ~net_sdram_DQ_en;

// RTL code for the ORCA goes here...

// Assuming ti_low, ti_hi, pclk, sys_clk, sdr_clk are input signals.
// Assuming net_pclk, net_sys_clk, net_sdram_clk are internal signals.

assign ti_low = 1'b0;
assign ti_hi = 1'b1;

// Assuming pc3d01 is the module for the IO pad instantiation
// and PAD, CIN are its port names in the VHDL code.
/*
pc3d01 pclk_iopad (
  .PAD(pclk),
  .CIN(net_pclk)
);

pc3d01 sys_clk_iopad (
  .PAD(sys_clk),
  .CIN(net_sys_clk)
);

pc3d01 sdr_clk_iopad (
  .PAD(sdr_clk),
  .CIN(net_sdram_clk)
);
*/

I1025_NS pclk_iopad (
  .PADIO(pclk),
  .DOUT(net_pclk),
  .R_EN(ti_hi)
);

I1025_NS sys_clk_iopad (
  .PADIO(sys_clk),
  .DOUT(net_sys_clk),
  .R_EN(ti_hi)
);

I1025_NS sdr_clk_iopad (
  .PADIO(sdr_clk),
  .DOUT(net_sdram_clk),
  .R_EN(ti_hi)
);

// Assuming test_mode, scan_en, power_save, prst_n, pidsel, pgnt_n, and pad are input/output signals.
// Assuming s_test_mode, s_scan_en, s_power_save, s_prst_n, net_pidsel, net_pgnt_n, net_pad_in, net_pad_out, and net_pad_en are internal signals.

// Instantiation for test_mode signal
/*
pc3d01 test_mode_iopad (
  .PAD(test_mode),
  .CIN(s_test_mode)
);

// Instantiation for scan_en signal
pc3d01 scan_en_iopad (
  .PAD(scan_en),
  .CIN(s_scan_en)
);

// Instantiation for power_save signal
pc3d01 powersave_iopad (
  .PAD(power_save),
  .CIN(s_power_save)
);

// Instantiation for prst_n signal
pc3d01 prst_n_iopad (
  .PAD(prst_n),
  .CIN(s_prst_n)
);

// Instantiation for pidsel signal
pc3d01 pidsel_iopad (
  .PAD(pidsel),
  .CIN(net_pidsel)
);

// Instantiation for pgnt_n signal
pc3d01 pgnt_n_iopad (
  .PAD(pgnt_n),
  .CIN(net_pgnt_n)
);
*/

I1025_NS test_mode_iopad (
  .PADIO(test_mode),
  .DOUT(s_test_mode),
  .R_EN(ti_hi)
);

// Instantiation for scan_en signal
I1025_NS scan_en_iopad (
  .PADIO(scan_en),
  .DOUT(s_scan_en),
  .R_EN(ti_hi)
);

// Instantiation for power_save signal
I1025_NS powersave_iopad (
  .PADIO(power_save),
  .DOUT(s_power_save),
  .R_EN(ti_hi)
);

// Instantiation for prst_n signal
I1025_NS prst_n_iopad (
  .PADIO(prst_n),
  .DOUT(s_prst_n),
  .R_EN(ti_hi)
);

// Instantiation for pidsel signal
I1025_NS pidsel_iopad (
  .PADIO(pidsel),
  .DOUT(net_pidsel),
  .R_EN(ti_hi)
);

// Instantiation for pgnt_n signal
I1025_NS pgnt_n_iopad (
  .PADIO(pgnt_n),
  .DOUT(net_pgnt_n),
  .R_EN(ti_hi)
);

// Assuming pci_data_width is a parameter representing the data width
// of the PCI_Bus.

genvar bit_index;
assign net_pad_en_output = net_pad_en & ~test_mode ; // func for test_mode =0,  scan_mode for test_mode =1
assign net_pad_en_input = ~net_pad_en | test_mode ;
generate
  for (bit_index = pci_data_width-1; bit_index >= 6; bit_index= bit_index - 1) begin// : PCI_BUS_LOOP
    // Instantiation for each pad signal within the PCI_Bus loop
    B12I1025_NS pad_iopad (
      .PADIO(pad[bit_index]),
      .DOUT(net_pad_in[bit_index]),
      .DIN(net_pad_out[bit_index]),
      .EN(net_pad_en_output),
      .R_EN(net_pad_en_input),
      .PULL_DOWN(ti_low),
      .PULL_UP(ti_hi)
    );
  end
endgenerate


// Assuming PAD, ppar, pc_be, pframe_n, ptrdy_n, pirdy_n, pdevsel_n, pstop_n, pperr_n, pserr_n, preq_n, and pm66en are input/output signals.
// Assuming net_pad_in, net_pad_out, net_pad_en, net_ppar_in, net_ppar_out, net_ppar_en, net_pc_be_in, net_pc_be_out, net_pc_be_en,
// net_pframe_n_in, net_pframe_n_out, net_pframe_n_en, net_ptrdy_n_in, net_ptrdy_n_out, net_ptrdy_n_en, net_pirdy_n_in, net_pirdy_n_out,
// net_pirdy_n_en, net_pdevsel_n_in, net_pdevsel_n_out, net_pdevsel_n_en, net_pstop_n_in, net_pstop_n_out, net_pstop_n_en, net_pperr_n_in,
// net_pperr_n_out, net_pperr_n_en, net_pserr_n_in, net_pserr_n_out, net_pserr_n_en, net_preq_n, and net_pm66en are internal signals.

genvar bit_index;

generate
    // Generate loop for PCI_Bus_lo
    for (bit_index = 5; bit_index >= 0; bit_index = bit_index - 1) begin// : PCI_Bus_lo
        B12I1025_NS pad_iopad (
            .PADIO(pad[bit_index]),
            .DOUT(net_pad_in[bit_index]),
            .DIN(net_pad_out[bit_index]),
            // OEN is connected conditionally
            .EN(net_pad_en_output),  // or .OEN(net_pad_scan_en[bit_index])
	    .R_EN(net_pad_en_input),
	    .PULL_DOWN(ti_low),
	    .PULL_UP(ti_low)
        );
    end
endgenerate



// Instantiation for ppar signal
B12I1025_NS ppar_iopad (
  .PADIO(ppar),
  .DOUT(net_ppar_in),
  .DIN(net_ppar_out),
  .EN(net_ppar_en),
  .R_EN(temp_inv_0),
  .PULL_DOWN(ti_hi),
  .PULL_UP(ti_low)
);

// Instantiation for PCI_BE_Bus loop
genvar bit_index;
generate
  for (bit_index = 3; bit_index >= 0; bit_index = bit_index - 1 ) begin : PCI_BE_Bus
    B12I1025_NS pc_be_iopad (
      .PADIO(pc_be[bit_index]),
      .DOUT(net_pc_be_in[bit_index]),
      .DIN(net_pc_be_out[bit_index]),
      .EN(net_pc_be_en),
      .R_EN(temp_inv_1),
      .PULL_DOWN(ti_low),
      .PULL_UP(ti_hi)
    );
  end
endgenerate

// Instantiation for pframe_n signal
B12I1025_NS pframe_n_iopad (
  .PADIO(pframe_n),
  .DOUT(net_pframe_n_in),
  .DIN(net_pframe_n_out),
  .EN(net_pframe_n_en),
  .R_EN(temp_inv_2),
  .PULL_DOWN(ti_low),
  .PULL_UP(ti_hi)
);

// Instantiation for ptrdy_n signal
B12I1025_NS ptrdy_n_iopad (
  .PADIO(ptrdy_n),
  .DOUT(net_ptrdy_n_in),
  .DIN(net_ptrdy_n_out),
  .EN(net_ptrdy_n_en),
  .R_EN(temp_inv_3),
  .PULL_DOWN(ti_low),
  .PULL_UP(ti_hi)
);

// Instantiation for pirdy_n signal
B12I1025_NS pirdy_n_iopad (
  .PADIO(pirdy_n),
  .DOUT(net_pirdy_n_in),
  .DIN(net_pirdy_n_out),
  .EN(net_pirdy_n_en),
  .R_EN(temp_inv_4),
  .PULL_DOWN(ti_low),
  .PULL_UP(ti_hi)
);

// Instantiation for pdevsel_n signal
B12I1025_NS pdevsel_n_iopad (
  .PADIO(pdevsel_n),
  .DOUT(net_pdevsel_n_in),
  .DIN(net_pdevsel_n_out),
  .EN(net_pdevsel_n_en),
  .R_EN(temp_inv_5),
  .PULL_DOWN(ti_low),
  .PULL_UP(ti_hi)
);

// Instantiation for pstop_n signal
B12I1025_NS pstop_n_iopad (
  .PADIO(pstop_n),
  .DOUT(net_pstop_n_in),
  .DIN(net_pstop_n_out),
  .EN(net_pstop_n_en),
  .R_EN(temp_inv_6),
  .PULL_DOWN(ti_low),
  .PULL_UP(ti_hi)
);

// Instantiation for pperr_n signal
B12I1025_NS pperr_n_iopad (
  .PADIO(pperr_n),
  .DOUT(net_pperr_n_in),
  .DIN(net_pperr_n_out),
  .EN(net_pperr_n_en),
  .R_EN(temp_inv_7),
  .PULL_DOWN(ti_low),
  .PULL_UP(ti_hi)
);

// Instantiation for pserr_n signal
B12I1025_NS pserr_n_iopad (
  .PADIO(pserr_n),
  .DOUT(net_pserr_n_in),
  .DIN(net_pserr_n_out),
  .EN(net_pserr_n_en),
  .R_EN(temp_inv_8),
  .PULL_DOWN(ti_low),
  .PULL_UP(ti_hi)
);

// Instantiation for preq_n signal
D8I1025_NS preq_n_iopad (
  .PADIO(preq_n),
  .DIN(net_preq_n),
  .EN(ti_hi)
);

// Instantiation for pm66en signal
I1025_NS pm66en_iopad (
  .PADIO(pm66en),
  .DOUT(net_pm66en),
  .R_EN(ti_hi)
);


// Assuming sd_A, net_sdram_A, sd_CK, net_sdram_CK, sd_CKn, net_sdram_CKn, sd_LD, net_sdram_LD, sd_RW, net_sdram_RW, sd_BWS, net_sdram_BWS,
// sd_DQ, net_sdram_DQ_in, net_sdram_DQ_out, and net_sdram_DQ_en are input/output signals.
// Assuming sd_a_width and sd_dq_width are integer constants.

// Instantiation for SDRAM_A_Bus loop
genvar bit_index;
generate
  for (bit_index = sd_a_width - 1; bit_index >= 0; bit_index = bit_index - 1) begin : SDRAM_A_Bus
    D8I1025_NS sdram_A_iopad (
      .PADIO(sd_A[bit_index]),
      .DIN(net_sdram_A[bit_index]),
      .EN(ti_hi)
    );
  end
endgenerate

// Instantiation for sdram_CK signal
D8I1025_NS sdram_CK_iopad (
  .DIN(net_sdram_CK),
  .PADIO(sd_CK),
  .EN(ti_hi)
);

// Instantiation for sdram_CKn signal
D8I1025_NS sdram_CKn_iopad (
  .DIN(net_sdram_CKn),
  .PADIO(sd_CKn),
  .EN(ti_hi)
);

// Instantiation for sdram_LD signal
D8I1025_NS sdram_LD_iopad (
  .DIN(net_sdram_LD),
  .PADIO(sd_LD),
  .EN(ti_hi)
);

// Instantiation for sdram_RW signal
D8I1025_NS sdram_RW_iopad (
  .DIN(net_sdram_RW),
  .PADIO(sd_RW),
  .EN(ti_hi)
);

// Instantiation for SDRAM_BWS_Bus loop
genvar bit_index;
generate
  for (bit_index = 1; bit_index >= 0; bit_index = bit_index - 1) begin : SDRAM_BWS_Bus
    D8I1025_NS sdram_BWS_iopad (
      .DIN(net_sdram_BWS[bit_index]),
      .PADIO(sd_BWS[bit_index]),
      .EN(ti_hi)
    );
  end
endgenerate

// Instantiation for SDRAM_DQ_Bus loop
//genvar bit_index;
//generate
//  for (bit_index = sd_dq_width - 1; bit_index >= 0; bit_index = bit_index - 1) begin : SDRAM_DQ_Bus
//    B16I1025_NS sdram_DQ_iopad (
//      .PADIO(sd_DQ[bit_index]),
//      .DIN(net_sdram_DQ_in[bit_index]),
//      .DOUT(net_sdram_DQ_out[bit_index]),
//      .EN(net_sdram_DQ_en[bit_index]),
//      .R_EN(inv_net_sdram_DQ_en[bit_index]),
//      .PULL_UP(ti_hi),
//      .PULL_DOWN(ti_low)
//    );
//  end
//endgenerate

genvar bit_index;
generate
  for (bit_index = sd_dq_width - 1; bit_index >= 0; bit_index = bit_index - 1) begin : SDRAM_DQ_Bus
    B16I1025_NS sdram_DQ_iopad (
      .PADIO(sd_DQ[bit_index]),
      .DIN(net_sdram_DQ_out[bit_index]),
      .DOUT(net_sdram_DQ_in[bit_index]),
      .EN(net_sdram_DQ_en[bit_index]),
      .R_EN(inv_net_sdram_DQ_en[bit_index]),
      .PULL_UP(ti_hi),
      .PULL_DOWN(ti_low)
    );
  end
endgenerate

// Assuming all the signals (net_pclk, net_sdram_clk, net_sys_clk, etc.) are declared as inputs/outputs.

IOPOWER U_IOPOWER (
  .VDD(),
  .VSS()
);

CLOCK_GEN I_CLOCK_GEN (
  .pclk(net_pclk),
  .sdram_clk(net_sdram_clk),
  .sys_clk(net_sys_clk),

  .pclk_fb(net_pclk_fb),
  .sdram_clk_fb(net_sdram_clk_fb),

  .test_mode(s_test_mode),
  .powersave(s_power_save),

  .o_pclk(s_pclk),
  .o_sdram_clk(s_sdram_clk),
  .o_sys_clk(s_sys_clk),
  .o_sys_2x_clk(s_sys_2x_clk)
);

NBUFFX4_RVT I_CLK_SOURCE_PCLK (
  .A(s_pclk),
  .Y(buf_pclk)
);
//assign buf_pclk = s_pclk;
//
NBUFFX4_RVT I_CLK_SOURCE_SYS_CLK (
  .A(s_sys_clk),
  .Y(buf_sys_clk)
);
//assign buf_sys_clk = s_sys_clk;
//
NBUFFX4_RVT I_CLK_SOURCE_SYS_2x_CLK (
  .A(s_sys_2x_clk),
  .Y(buf_sys_2x_clk)
);
//assign buf_sys_2x_clk = s_sys_2x_clk;
//
NBUFFX4_RVT I_CLK_SOURCE_SDRAM_CLK (
  .A(s_sdram_clk),
  .Y(buf_sdram_clk)
);
//assign buf_sdram_clk = s_sdram_clk ;

assign net_test_mem_clk = buf_sys_clk;

ORCA_TOP I_ORCA_TOP (
  .sys_clk(buf_sys_clk),
  .sys_2x_clk(buf_sys_2x_clk),
  .sdram_clk(buf_sdram_clk),
  .pll_pci_fb(net_pclk_fb),
  .pll_sdram_fb(net_sdram_clk_fb),

  .scan_en(s_scan_en),
  .test_mode(s_test_mode),
  .test_mem_clk(net_test_mem_clk),

  .pclk(buf_pclk),
  .prst_n(s_prst_n),

  .pidsel(net_pidsel),
  .pgnt_n(net_pgnt_n),

  .pad_in(net_pad_in),
  .pad_out(net_pad_out),
  .pad_en(net_pad_en),
    
  .ppar_in(net_ppar_in),
  .ppar_out(net_ppar_out),
  .ppar_en(net_ppar_en),
  .pc_be_in(net_pc_be_in),
  .pc_be_out(net_pc_be_out),
  .pc_be_en(net_pc_be_en),
  .pframe_n_in(net_pframe_n_in),
  .pframe_n_out(net_pframe_n_out),
  .pframe_n_en(net_pframe_n_en),
  .ptrdy_n_in(net_ptrdy_n_in),
  .ptrdy_n_out(net_ptrdy_n_out),
  .ptrdy_n_en(net_ptrdy_n_en),
  .pirdy_n_in(net_pirdy_n_in),
  .pirdy_n_out(net_pirdy_n_out),
  .pirdy_n_en(net_pirdy_n_en),
  .pdevsel_n_in(net_pdevsel_n_in),
  .pdevsel_n_out(net_pdevsel_n_out),
  .pdevsel_n_en(net_pdevsel_n_en),
  .pstop_n_in(net_pstop_n_in),
  .pstop_n_out(net_pstop_n_out),
  .pstop_n_en(net_pstop_n_en),
  .pperr_n_in(net_pperr_n_in),
  .pperr_n_out(net_pperr_n_out),
  .pperr_n_en(net_pperr_n_en),
  .pserr_n_in(net_pserr_n_in),
  .pserr_n_out(net_pserr_n_out),
  .pserr_n_en(net_pserr_n_en),

  .preq_n(net_preq_n),
  .pm66en(net_pm66en),

  .sd_A(net_sdram_A),
  .sd_CK(net_sdram_CK),
  .sd_CKn(net_sdram_CKn),
  .sd_LD(net_sdram_LD),
  .sd_RW(net_sdram_RW),
  .sd_BWS(net_sdram_BWS),
  .sd_DQ_in(net_sdram_DQ_in),
  .sd_DQ_out(net_sdram_DQ_out),
  .sd_DQ_en(net_sdram_DQ_en)
);


endmodule
