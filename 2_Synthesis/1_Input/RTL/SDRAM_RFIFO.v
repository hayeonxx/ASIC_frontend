module SDRAM_RFIFO #(
	parameter fifo_data_width = 32,
		fifo_depth = 64
) (
  input fifo_clk_push,
  input fifo_clk_pop,
  input fifo_rst_n,
  input test_mode,
  input fifo_push_req_n,
  input fifo_pop_req_n,
  input [31:0] fifo_data_in,
  output push_empty_fifo,
  output push_ae_fifo,
  output push_hf_fifo,
  output push_af_fifo,
  output push_full_fifo,
  output push_error_fifo,
  output pop_empty_fifo,
  output pop_ae_fifo,
  output pop_hf_fifo,
  output pop_af_fifo,
  output pop_full_fifo,
  output pop_error_fifo,
  output reg [31:0] data_out_fifo
);
  
  wire ti_hi = 1'b1;
  wire ti_low = 1'b0;
//  wire we_n;
//  wire [5:0] wr_addr, rd_addr;
//  wire [31:0] data_in, data_out;
  reg we_n;
  reg [5:0] wr_addr, rd_addr;
  reg [31:0] data_in, data_out;
  wire [31:0] bus_hi = 32'b1;

  //parameter  fifo_depth = 64 ; 
  // Instantiate DW_fifoctl_s2_sf module
  DW_fifoctl_s2_sf #(
    .depth(fifo_depth),
    .push_ae_lvl(2),
    .push_af_lvl(2),
    .pop_ae_lvl(2),
    .pop_af_lvl(2),
    .err_mode(0),
    .push_sync(1),
    .pop_sync(1),
    .rst_mode(0)
  ) SD_RFIFO_CTL (
    .clk_push(fifo_clk_push),
    .clk_pop(fifo_clk_pop),
    .rst_n(fifo_rst_n),
    .push_req_n(fifo_push_req_n),
    .pop_req_n(fifo_pop_req_n),
    .we_n(we_n),
    .push_empty(push_empty_fifo),
    .push_ae(push_ae_fifo),
    .push_hf(push_hf_fifo),
    .push_af(push_af_fifo),
    .push_full(push_full_fifo),
    .push_error(push_error_fifo),
    .pop_empty(pop_empty_fifo),
    .pop_ae(pop_ae_fifo),
    .pop_hf(pop_hf_fifo),
    .pop_af(pop_af_fifo),
    .pop_full(pop_full_fifo),
    .pop_error(pop_error_fifo),
    .wr_addr(wr_addr),
    .rd_addr(rd_addr),
    .push_word_count(),
    .pop_word_count(),
    .test(test_mode)
  );

//  assign data_in = fifo_data_in;
//  assign data_out_fifo = data_out;
  

  always @(*) begin
    data_in <= fifo_data_in;
    data_out_fifo <= data_out;
  end

  // Instantiate ram32x64 module
/*
  ram32x64 SD_RFIFO_RAM (
    .A1(wr_addr),
    .CE1(fifo_clk_push),
    .WEB1(we_n),
    .OEB1(ti_hi),
    .CSB1(ti_low),
    .IO1(data_in),
    .A2(rd_addr),
    .CE2(fifo_clk_pop),
    .WEB2(ti_hi),
    .OEB2(ti_low),
    .CSB2(ti_low),
    .IO2(data_out)
  );
*/

  SRAM2RW64x32 SD_RFIFO_RAM (
    .A1(wr_addr),
    .CE1(fifo_clk_push),
    .WEB1(we_n),
    .OEB1(ti_hi),
    .CSB1(ti_low),
    .I1(data_in),
    .I2(bus_hi),
    .A2(rd_addr),
    .CE2(fifo_clk_pop),
    .WEB2(ti_hi),
    .OEB2(ti_low),
    .CSB2(ti_low),
    .O1(),
    .O2(data_out)
  );


endmodule
