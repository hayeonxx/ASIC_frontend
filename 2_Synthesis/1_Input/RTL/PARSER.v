
module PARSER (
    input sys_clk,       // 125 MHz
    input pclk,          // 66 MHz
    input sys_rst_n,
    
    input [3:0] pcmd,
    input pcmd_valid,

    output wire [3:0] pcmd_out,
    output wire pcmd_out_valid,

    output wire [3:0] blender_op,
    output reg blender_clk_en,

    output wire context_en,
    output wire [7:0] context_cmd,
    
    output wire fifo_read_pop,
    input fifo_read_empty,

    output wire fifo_write_push,
    input fifo_write_full,

    output wire [7:0] risc_Instrn_lo,
    input [15:0] risc_Xecutng_Instrn_lo,

    output reg [1:0] pci_w_mux_select,
    output reg [1:0] sd_w_mux_select,

    output wire parser_sd_rfifo_pop,
    input sd_rfifo_parser_empty,
    output wire parser_sd_wfifo_push,
    input sd_wfifo_parser_full
);
  integer i;
  reg [3:0] r_pcmd;
  reg r_pcmd_valid;
  reg [3:0] sync_pcmd;
  reg sync_pcmd_valid;

  reg [3:0] i_pcmd_out;
  reg i_pcmd_out_valid;
  reg [3:0] r_pcmd_out;
  reg r_pcmd_out_valid;
  reg [3:0] sync_pcmd_out;
  reg sync_pcmd_out_valid;

  wire [19:0] in_bus;
  reg [19:0] i_reg;
  reg [19:0] out_bus;


assign in_bus = {fifo_read_empty, fifo_write_full, risc_Xecutng_Instrn_lo, sd_rfifo_parser_empty, sd_wfifo_parser_full};
assign risc_Instrn_lo = out_bus[7:0];
assign blender_op = out_bus[11:8];
assign fifo_read_pop = out_bus[12];
assign fifo_write_push = out_bus[13];
assign parser_sd_rfifo_pop = out_bus[14];
assign parser_sd_wfifo_push = out_bus[15];

assign context_en = out_bus[0] & out_bus[8];
assign context_cmd = {out_bus[19:16], out_bus[11:8]};

always @(posedge sys_clk) begin
    r_pcmd <= sync_pcmd;
    sync_pcmd <= pcmd;
    r_pcmd_valid <= sync_pcmd_valid;
    sync_pcmd_valid <= pcmd_valid;
end


always @(posedge pclk) begin
    r_pcmd_out <= sync_pcmd_out;
    sync_pcmd_out <= i_pcmd_out;
    r_pcmd_out_valid <= sync_pcmd_out_valid;
    sync_pcmd_out_valid <= i_pcmd_out_valid;
end


assign pcmd_out = r_pcmd_out;
assign pcmd_out_valid = r_pcmd_out_valid;
integer n;

always @(posedge sys_clk or negedge sys_rst_n) begin
  if (!sys_rst_n) begin
    blender_clk_en <= 1'b0;
  end else begin
    blender_clk_en <= r_pcmd_valid & r_pcmd[2];
  end
end


always @(posedge sys_clk) begin
  for (n = 0; n < 19; n = n + 1) begin
    i_reg[n] <= in_bus[n] ^ in_bus[n + 1];
  end
  i_reg[19] <= in_bus[0] ^ in_bus[19];
end


always @(posedge sys_clk or negedge sys_rst_n) begin
  if (sys_rst_n == 1'b0) begin
    i_pcmd_out <= 4'b0000;
    i_pcmd_out_valid <= 1'b0;
  end else begin
    i_pcmd_out <= i_reg[10:7] + i_reg[3:0];
    i_pcmd_out_valid <= i_reg[17] ^ i_reg[13];
  end
end


always @(posedge sys_clk or negedge sys_rst_n) begin
  if (sys_rst_n == 1'b0) begin
    out_bus <= 20'b0;
  end else begin
    if (r_pcmd_valid == 1'b1) begin
      case(r_pcmd)
        4'b0101: out_bus <= {4'b0000, i_reg[19:4]};
        4'b1010: out_bus <= {4'b0000, i_reg[18:3]};
        4'b1100: out_bus <= {4'b0000, i_reg[17:9], i_reg[6:0]};
        4'b0011: out_bus <= {4'b0000, i_reg[16:1]};
        4'b1001: out_bus <= {4'b0000, i_reg[19:10], i_reg[5:0]};
        default: out_bus <= ~{4'b0000, i_reg[19:4]};
      endcase
    end else begin
      out_bus <= i_reg;
    end
  end
end


always @(posedge sys_clk  or negedge sys_rst_n) begin
  if (sys_rst_n == 1'b0) begin
    pci_w_mux_select <= 2'b00;
    sd_w_mux_select  <= 2'b00;
  end else begin
    case (in_bus[3:0])
      4'b0101: begin
        pci_w_mux_select <= 2'b01;
        sd_w_mux_select  <= 2'b10;
      end
      4'b1010: begin
        pci_w_mux_select <= 2'b10;
        sd_w_mux_select  <= 2'b01;
      end
      4'b0110: begin
        pci_w_mux_select <= 2'b00;
        sd_w_mux_select  <= 2'b11;
      end
      4'b1001: begin
        pci_w_mux_select <= 2'b11;
        sd_w_mux_select  <= 2'b00;
      end
      4'b1111: begin
        pci_w_mux_select <= 2'b11;
        sd_w_mux_select  <= 2'b11;
      end
      default: begin
        pci_w_mux_select <= 2'b01;
        sd_w_mux_select  <= 2'b01;
      end
    endcase
  end
end


endmodule
