module ORCA_TOP #(
  parameter integer sd_a_width = 10,
            sd_dq_width = 16,
            sd_rfifo_depth = 64,
            sd_wfifo_depth = 64,
            pci_data_width = 16,
            pci_rfifo_depth = 32,
            pci_wfifo_depth = 32
)  (
  input sys_clk,
  input sys_2x_clk,
  input sdram_clk,

  // these pins connect to the PLL - feedback
  output pll_pci_fb,
  output pll_sdram_fb,

  // SCAN
  input scan_en,
  input test_mode,
  input test_mem_clk,

  // PCI Interface
  input pclk,
  input prst_n,
  input pidsel,
  input pgnt_n,
  input [pci_data_width-1:0] pad_in,
  output [pci_data_width-1:0] pad_out,
  output pad_en,
  input ppar_in,
  output ppar_out,
  output ppar_en,
  input [3:0] pc_be_in,
  output [3:0] pc_be_out,
  output pc_be_en,
  input pframe_n_in,
  output pframe_n_out,
  output pframe_n_en,
  input ptrdy_n_in,
  output ptrdy_n_out,
  output ptrdy_n_en,
  input pirdy_n_in,
  output pirdy_n_out,
  output pirdy_n_en,
  input pdevsel_n_in,
  output pdevsel_n_out,
  output pdevsel_n_en,
  input pstop_n_in,
  output pstop_n_out,
  output pstop_n_en,
  input pperr_n_in,
  output pperr_n_out,
  output pperr_n_en,
  input pserr_n_in,
  output pserr_n_out,
  output pserr_n_en,
  output preq_n,
  input pm66en,

  // SDRAM Interface
  output [sd_a_width-1:0] sd_A,
  output sd_CK,
  output sd_CKn,
  output sd_LD,
  output sd_RW,
  output [1:0] sd_BWS,
  input [sd_dq_width-1:0] sd_DQ_in,
  output [sd_dq_width-1:0] sd_DQ_out,
  output [sd_dq_width-1:0] sd_DQ_en
);
// Declare signals with their data types
wire ti_hi = 1'b1;
wire ti_low = 1'b0;
wire [31:0] net_pci_context_data;
wire [31:0] net_pci_read_data, net_pci_write_data;
wire net_pci_read_push, net_pci_write_pop, net_pci_write_empty;
wire [31:0] net_sd_sys_read_data, net_pci_sys_read_data, net_blender_result;
wire net_blender_clk_en;
wire [3:0] net_blender_op;
wire net_context_en;
wire [7:0] net_context_cmd;
wire [3:0] net_pci_parser_cmd, net_parser_pci_cmd;
wire net_pci_parser_cmd_valid, net_parser_pci_cmd_valid;
wire net_parser_sd_rfifo_pop, net_sd_rfifo_parser_empty;
wire net_parser_sd_wfifo_push, net_sd_wfifo_parser_full;
wire [1:0] net_pci_w_mux_select, net_sd_w_mux_select;
wire [31:0] net_risc_Xecutng_Instrn;
wire [15:0] net_risc_RESULT_DATA;
wire net_risc_sd_EndOfInstrn;
wire [10:0] net_risc_sd_PSW;
wire net_risc_sd_Rd_Instr, net_risc_sd_OUT_VALID, net_risc_sd_STACK_FULL;
wire net_sd_wfifo_pop, net_sd_wfifo_empty, net_sd_rfifo_push, net_sd_rfifo_full;
wire [sd_dq_width*2-1:0] net_sd_wfifo_data, net_sdram_if_wDQ, net_sdram_if_rDQ;
wire [31:0] net_pci_wfifo_data;
wire net_pci_read_full, net_parser_fifo_read_pop, net_parser_fifo_read_empty;
wire net_parser_fifo_write_push, net_parser_fifo_write_full;
wire [7:0] net_parser_risc_Instrn_lo;
wire [31:0] net_risc_Instrn;
wire [31:0] temp_vector1, temp_vector2;
//wire pci_rst_n, sys_rst_n, sys_2x_rst_n, sdram_rst_n;
reg pci_rst_n, sys_rst_n, sys_2x_rst_n, sdram_rst_n;
reg s_pci_rst_n, s_sys_rst_n, s_sys_2x_rst_n, s_sdram_rst_n;

  // Design Component instantiations:

  // RESET_BLOCK component instantiation
  RESET_BLOCK I_RESET_BLOCK (
    .pclk(pclk),
    .sys_clk(sys_clk),
    .sys_2x_clk(sys_2x_clk),
    .sdram_clk(sdram_clk),
    .prst_n(prst_n),
    .test_mode(test_mode),
    .pci_rst_n(pci_rst_n),
    .sdram_rst_n(sdram_rst_n),
    .sys_rst_n(sys_rst_n),
    .sys_2x_rst_n(sys_2x_rst_n)
  );

  // PCI_CORE component instantiation
  PCI_CORE #(
    .pci_data_width(pci_data_width)
  ) I_PCI_CORE (
    .pclk(pclk),
    .pci_rst_n(pci_rst_n),
    .pidsel(pidsel),
    .pgnt_n(pgnt_n),
    .pad_in(pad_in),
    .pad_out(pad_out),
    .pad_en(pad_en),
    .ppar_in(ppar_in),
    .ppar_out(ppar_out),
    .ppar_en(ppar_en),
    .pc_be_in(pc_be_in),
    .pc_be_out(pc_be_out),
    .pc_be_en(pc_be_en),
    .pframe_n_in(pframe_n_in),
    .pframe_n_out(pframe_n_out),
    .pframe_n_en(pframe_n_en),
    .ptrdy_n_in(ptrdy_n_in),
    .ptrdy_n_out(ptrdy_n_out),
    .ptrdy_n_en(ptrdy_n_en),
    .pirdy_n_in(pirdy_n_in),
    .pirdy_n_out(pirdy_n_out),
    .pirdy_n_en(pirdy_n_en),
    .pdevsel_n_in(pdevsel_n_in),
    .pdevsel_n_out(pdevsel_n_out),
    .pdevsel_n_en(pdevsel_n_en),
    .pstop_n_in(pstop_n_in),
    .pstop_n_out(pstop_n_out),
    .pstop_n_en(pstop_n_en),
    .pperr_n_in(pperr_n_in),
    .pperr_n_out(pperr_n_out),
    .pperr_n_en(pperr_n_en),
    .pserr_n_in(pserr_n_in),
    .pserr_n_out(pserr_n_out),
    .pserr_n_en(pserr_n_en),
    .preq_n(preq_n),
    .pm66en(pm66en),
    .read_data(net_pci_read_data),
    .write_data(net_pci_write_data),
    .read_push(net_pci_read_push),
    .read_full(net_pci_read_full),
    .write_pop(net_pci_write_pop),
    .write_empty(net_pci_write_empty),
    .cmd_valid(net_pci_parser_cmd_valid),
    .cmd(net_pci_parser_cmd),
    .cmd_in_valid(net_parser_pci_cmd_valid),
    .cmd_in(net_parser_pci_cmd)
  );

  // Instantiate PARSER module
  PARSER I_PARSER (
    .sys_clk(sys_clk),
    .pclk(pclk),
    .sys_rst_n(sys_rst_n),

    .pcmd(net_pci_parser_cmd),
    .pcmd_valid(net_pci_parser_cmd_valid),

    .pcmd_out(net_parser_pci_cmd),
    .pcmd_out_valid(net_parser_pci_cmd_valid),

    .context_en(net_context_en),
    .context_cmd(net_context_cmd),

    .blender_op(net_blender_op),
    .blender_clk_en(net_blender_clk_en),

    .fifo_read_pop(net_parser_fifo_read_pop),
    .fifo_read_empty(net_parser_fifo_read_empty),

    .fifo_write_push(net_parser_fifo_write_push),
    .fifo_write_full(net_parser_fifo_write_full),

    .risc_Instrn_lo(net_parser_risc_Instrn_lo),
    .risc_Xecutng_Instrn_lo(net_risc_Xecutng_Instrn[15:0]),

    .pci_w_mux_select(net_pci_w_mux_select),
    .sd_w_mux_select(net_sd_w_mux_select),

    .parser_sd_rfifo_pop(net_parser_sd_rfifo_pop),
    .sd_rfifo_parser_empty(net_sd_rfifo_parser_empty),
    .parser_sd_wfifo_push(net_parser_sd_wfifo_push),
    .sd_wfifo_parser_full(net_sd_wfifo_parser_full)
  );

  CONTEXT_MEM I_CONTEXT_MEM (
    // Connect ports here
    .sys_clk          (sys_clk),
    .sys_rst_n        (sys_rst_n),
    .context_en       (net_context_en),
    .cmd              (net_context_cmd),
    .pci_data_in      (net_pci_sys_read_data),
    .pci_context_data (net_pci_context_data)
  );

  SDRAM_IF #(
    .sd_a_width(sd_a_width),
    .sd_dq_width(sd_dq_width)
  ) I_SDRAM_IF (
    // Connect ports here
    .sdram_clk        (sdram_clk),
    .sdram_rst_n      (sdram_rst_n),
    .risc_OUT_VALID   (net_risc_sd_OUT_VALID),
    .risc_STACK_FULL  (net_risc_sd_STACK_FULL),
    .risc_EndOfInstrn (net_risc_sd_EndOfInstrn),
    .risc_PSW         (net_risc_sd_PSW),
    .risc_Rd_Instr    (net_risc_sd_Rd_Instr),
    .sd_A             (sd_A),
    .sd_CK            (sd_CK),
    .sd_CKn           (sd_CKn),
    .sd_LD            (sd_LD),
    .sd_RW            (sd_RW),
    .sd_BWS           (sd_BWS),
    .sd_DQ_in         (sd_DQ_in),
    .sd_DQ_out        (sd_DQ_out),
    .sd_DQ_en         (sd_DQ_en),
    .sd_wfifo_pop     (net_sd_wfifo_pop),
    .sd_wfifo_empty   (net_sd_wfifo_empty),
    .sd_rfifo_push    (net_sd_rfifo_push),
    .sd_rfifo_full    (net_sd_rfifo_full),
    .sd_rfifo_DQ_out  (net_sdram_if_rDQ),
    .sd_wfifo_DQ_in   (net_sdram_if_wDQ)
  );

  assign net_risc_Instrn = {net_pci_context_data[31:8], net_parser_risc_Instrn_lo};
  
 
  // Instantiate the RISC_CORE component
  RISC_CORE I_RISC_CORE (
    // Connect ports here
    .clk              (sys_2x_clk),
    .Test_Regfile_Clk (test_mem_clk),
    .Test_Mode        (test_mode),
    .reset_n          (sys_2x_rst_n),
    .Instrn           (net_risc_Instrn),
    .Xecutng_Instrn   (net_risc_Xecutng_Instrn),
    .EndOfInstrn      (net_risc_sd_EndOfInstrn),
    .PSW              (net_risc_sd_PSW),
    .Rd_Instr         (net_risc_sd_Rd_Instr),
    .RESULT_DATA      (net_risc_RESULT_DATA),
    .OUT_VALID        (net_risc_sd_OUT_VALID),
    .STACK_FULL       (net_risc_sd_STACK_FULL)
  );

  // Instantiate the BLENDER component
  BLENDER I_BLENDER (
    // Connect ports here
    .clk          (sys_clk),
    .reset_n      (sys_rst_n),
    .clk_enable   (net_blender_clk_en),
    .test_mode    (test_mode),
    .operation    (net_blender_op),
    .op1          (net_sd_sys_read_data),
    .op2          (net_pci_context_data),
    .result       (net_blender_result)
  );

  // Instantiate the PCI_RFIFO component
  PCI_RFIFO #(
    .fifo_data_width(pci_data_width*2),
    .fifo_depth(pci_rfifo_depth)
  ) I_PCI_READ_FIFO (
    // Connect ports here
    .fifo_clk_push      (pclk),
    .fifo_clk_pop       (sys_clk),
    .fifo_rst_n         (pci_rst_n),
    .test_mode          (test_mode),
    .fifo_push_req_n    (net_pci_read_push),
    .fifo_pop_req_n     (net_parser_fifo_read_pop),
    .fifo_data_in       (net_pci_read_data),
    .push_empty_fifo    (),
    .push_ae_fifo       (),
    .push_hf_fifo       (),
    .push_af_fifo       (),
    .push_full_fifo     (net_pci_read_full),
    .push_error_fifo    (),
    .pop_empty_fifo     (net_parser_fifo_read_empty),
    .pop_ae_fifo        (),
    .pop_hf_fifo        (),
    .pop_af_fifo        (),
    .pop_full_fifo      (),
    .pop_error_fifo     (),
    .data_out_fifo      (net_pci_sys_read_data)
  );

  // Instantiate the PCI_WFIFO component
  PCI_WFIFO #(
    .fifo_data_width(pci_data_width*2),
    .fifo_depth(pci_wfifo_depth)
  ) I_PCI_WRITE_FIFO (
    // Connect ports here
    .fifo_clk_push      (sys_clk),
    .fifo_clk_pop       (pclk),
    .fifo_rst_n         (sys_rst_n),
    .test_mode          (test_mode),
    .fifo_push_req_n    (net_parser_fifo_write_push),
    .fifo_pop_req_n     (net_pci_write_pop),
    .fifo_data_in       (net_pci_wfifo_data),
    .push_empty_fifo    (),
    .push_ae_fifo       (),
    .push_hf_fifo       (),
    .push_af_fifo       (),
    .push_full_fifo     (net_parser_fifo_write_full),
    .push_error_fifo    (),
    .pop_empty_fifo     (net_pci_write_empty),
    .pop_ae_fifo        (),
    .pop_hf_fifo        (),
    .pop_af_fifo        (),
    .pop_full_fifo      (),
    .pop_error_fifo     (),
    .data_out_fifo      (net_pci_write_data)
  );

  // Instantiate the SDRAM_RFIFO component
  SDRAM_RFIFO #(
    .fifo_data_width(sd_dq_width*2),
    .fifo_depth(sd_rfifo_depth)
  ) I_SDRAM_READ_FIFO (
    // Connect ports here
    .fifo_clk_push      (sdram_clk),
    .fifo_clk_pop       (sys_clk),
    .fifo_rst_n         (sdram_rst_n),
    .test_mode          (test_mode),
    .fifo_push_req_n    (net_sd_rfifo_push),
    .fifo_pop_req_n     (net_parser_sd_rfifo_pop),
    .fifo_data_in       (net_sdram_if_rDQ),
    .push_empty_fifo    (),
    .push_ae_fifo       (),
    .push_hf_fifo       (),
    .push_af_fifo       (),
    .push_full_fifo     (net_sd_rfifo_full),
    .push_error_fifo    (),
    .pop_empty_fifo     (net_sd_rfifo_parser_empty),
    .pop_ae_fifo        (),
    .pop_hf_fifo        (),
    .pop_af_fifo        (),
    .pop_full_fifo      (),
    .pop_error_fifo     (),
    .data_out_fifo      (net_sd_sys_read_data)
  );
/*
  // Instantiate the SDRAM_WFIFO component
  SDRAM_WFIFO #(
    .fifo_data_width(sd_dq_width*2),
    .fifo_depth(sd_wfifo_depth)
  ) I_SDRAM_WRITE_FIFO (
    // Connect ports here
    .fifo_clk_push      (),
    .fifo_clk_pop       (),
    .fifo_rst_n         (),
    .test_mode          (),
    .fifo_push_req_n    (),
    .fifo_pop_req_n     (),
    .fifo_data_in       (),
    .push_empty_fifo    (),
    .push_ae_fifo       (),
    .push_hf_fifo       (),
    .push_af_fifo       (),
    .push_full_fifo     (push_full_fifo),
    .push_error_fifo    (push_error_fifo),
    .pop_empty_fifo     (pop_empty_fifo),
    .pop_ae_fifo        (pop_ae_fifo),
    .pop_hf_fifo        (pop_hf_fifo),
    .pop_af_fifo        (pop_af_fifo),
    .pop_full_fifo      (pop_full_fifo),
    .pop_error_fifo     (pop_error_fifo),
    .data_out_fifo      (data_out_fifo)
  );

  // Instantiate the SD_W_MUX component
  SD_W_MUX I_SD_W_MUX (
    // Connect ports here
    .blender_data      (blender_data),
    .pci_read_data     (pci_read_data),
    .risc_result_data  (risc_result_data),
    .sd_w_select       (sd_w_select),
    .sd_wfifo_data     (sd_wfifo_data)
  );

  // Instantiate the PCI_W_MUX component
  PCI_W_MUX I_PCI_W_MUX (
    // Connect ports here
    .blender_data      (blender_data),
    .sdram_read_data   (sdram_read_data),
    .risc_result_data  (risc_result_data),
    .pci_w_select      (pci_w_select),
    .pci_wfifo_data    (pci_wfifo_data)
  );*/
// Instantiate SDRAM_WFIFO
SDRAM_WFIFO #( .fifo_data_width(sd_dq_width*2), .fifo_depth(sd_wfifo_depth) )
I_SDRAM_WRITE_FIFO (
    .fifo_clk_push(sys_clk),
    .fifo_clk_pop(sdram_clk),
    .fifo_rst_n(sys_rst_n),
    .test_mode(test_mode),
    .fifo_push_req_n(net_parser_sd_wfifo_push),
    .fifo_pop_req_n(net_sd_wfifo_pop),
    .fifo_data_in(net_sd_wfifo_data),
    .push_full_fifo(net_sd_wfifo_parser_full),
    .pop_empty_fifo(net_sd_wfifo_empty),
    .data_out_fifo(net_sdram_if_wDQ)
);

// Assign temp_vector1
assign temp_vector1 = {net_risc_RESULT_DATA, net_risc_Xecutng_Instrn[31:16]};

// Instantiate PCI_W_MUX
PCI_W_MUX I_PCI_W_MUX (
    .blender_data(net_blender_result),
    .sdram_read_data(net_sd_sys_read_data),
    .risc_result_data(temp_vector1),
    .pci_w_select(net_pci_w_mux_select),
    .pci_wfifo_data(net_pci_wfifo_data)
);

// Assign temp_vector2
assign temp_vector2 = {net_risc_RESULT_DATA, net_risc_Xecutng_Instrn[31:16]};

// Instantiate SD_W_MUX
SD_W_MUX I_SD_W_MUX (
    .blender_data(net_blender_result),
    .pci_read_data(net_pci_context_data),
    .risc_result_data(temp_vector2),
    .sd_w_select(net_sd_w_mux_select),
    .sd_wfifo_data(net_sd_wfifo_data)
);

// Feedback paths
assign pll_pci_fb = pclk;
assign pll_sdram_fb = sdram_clk;

endmodule

