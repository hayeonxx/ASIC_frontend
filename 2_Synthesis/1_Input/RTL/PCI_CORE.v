
module PCI_CORE #(
  parameter pci_data_width = 16
) (
  // PCI chip bus
  input pclk,
  input pci_rst_n,
  input pidsel,
  input pgnt_n,

  input [pci_data_width-1:0] pad_in,
  output reg [pci_data_width-1:0] pad_out,
  output reg pad_en,
  input ppar_in,
  output reg ppar_out,
  output reg ppar_en,
  input [3:0] pc_be_in,
  output reg [3:0] pc_be_out,
  output reg pc_be_en,
  input pframe_n_in,
  output reg pframe_n_out,
  output reg pframe_n_en,
  input ptrdy_n_in,
  output reg ptrdy_n_out,
  output reg ptrdy_n_en,
  input pirdy_n_in,
  output reg pirdy_n_out,
  output reg pirdy_n_en,
  input pdevsel_n_in,
  output reg pdevsel_n_out,
  output reg pdevsel_n_en,
  input pstop_n_in,
  output reg pstop_n_out,
  output reg pstop_n_en,
  input pperr_n_in,
  output reg pperr_n_out,
  output reg pperr_n_en,
  input pserr_n_in,
  output reg pserr_n_out,
  output reg pserr_n_en,

  output reg preq_n,
  input pm66en,

  // internal bus interface
  output reg [pci_data_width*2-1:0] read_data,
  input [pci_data_width*2-1:0] write_data,

  output reg read_push,
  input read_full,

  output reg write_pop,
  input write_empty,

  output reg cmd_valid,
  output reg [3:0] cmd,

  input cmd_in_valid,
  input [3:0] cmd_in
);
  parameter shift_size = 60;   // Changed from 100 to 60

  reg [10:0] d_in_p_bus;
  reg [22:0] d_out_p_bus;
  reg [6:0] d_in_i_bus;
  reg [6:0] d_out_i_bus;
  reg i_pad_en;
  reg i_pc_be_en;

  reg [pci_data_width-1:0] mega_shift [0:shift_size];
//  reg [0:shift_size] mega_shift [pci_data_width-1:0];
  reg [pci_data_width-1:0] pad_out_buf;

  function [pci_data_width-1:0] word_mux;
    input [pci_data_width-1:0] ein;
    reg [pci_data_width-1:0] word;
    reg [pci_data_width-1:0] rol_word;
    parameter pci_data_width = 16;
    integer i, n;
    integer bits_to_rotate;
    begin
      for (i =0 ; i < pci_data_width; i = i + 1) begin
        bits_to_rotate = i;
        rol_word = (ein << bits_to_rotate) | (ein >> (16-bits_to_rotate));
        for (n = 0 ; n < pci_data_width; n = n + 1) begin
          word[i] = rol_word[n] ^ word[i];
        end
      end
      word_mux =  word;
//      return word;
    end
  endfunction

  always @(*) begin
    d_in_p_bus <= {pidsel, pgnt_n, ppar_in, pframe_n_in, ptrdy_n_in, pirdy_n_in, pdevsel_n_in, pstop_n_in, pperr_n_in, pserr_n_in, pm66en};
    d_in_i_bus <= {read_full, write_empty, cmd_in_valid, cmd_in};
    i_pad_en <= d_out_p_bus[0];
    ppar_out <= d_out_p_bus[1];
    ppar_en <= d_out_p_bus[2];
    i_pc_be_en <= d_out_p_bus[3];
    pframe_n_out <= d_out_p_bus[4];
    pframe_n_en <= d_out_p_bus[5];
    ptrdy_n_out <= d_out_p_bus[6];
    ptrdy_n_en <= d_out_p_bus[7];
    pirdy_n_out <= d_out_p_bus[8];
    pirdy_n_en <= d_out_p_bus[9];
    pdevsel_n_out <= d_out_p_bus[10];
    pdevsel_n_en <= d_out_p_bus[11];
    pstop_n_out <= d_out_p_bus[12];
    pstop_n_en <= d_out_p_bus[13];
    pperr_n_out <= d_out_p_bus[14];
    pperr_n_en <= d_out_p_bus[15];
    pserr_n_out <= d_out_p_bus[16];
    pserr_n_en <= d_out_p_bus[17];
    preq_n <= d_out_p_bus[18];
    pc_be_out <= d_out_p_bus[22:19];
    read_push <= d_out_i_bus[0];
    write_pop <= d_out_i_bus[1];
    cmd_valid <= d_out_i_bus[2];
    cmd <= d_out_i_bus[6:3];
    pad_out <= pad_out_buf;
  end

  always @(posedge pclk or negedge pci_rst_n) begin
    if (!pci_rst_n) begin
      pad_en <= 1'b1;
    end else begin
      pad_en <= ~i_pad_en;
    end
  end

  always @(posedge pclk or negedge pci_rst_n) begin
    if (!pci_rst_n) begin
      pc_be_en <= 1'b0;
    end else begin
      pc_be_en <= ~i_pc_be_en;
    end
  end

  always @(pc_be_in, pad_in) begin
    read_data <= 0; // Equivalent to (OTHERS => '0') in VHDL
    case (pc_be_in)
      4'b1100: read_data[31:16] <= pad_in;
      4'b0011: read_data[15:0] <= pad_in;
      4'b1010: begin
                 read_data[31:24] <= pad_in[15:8];
                 read_data[15:8] <= pad_in[7:0];
               end
      4'b0101: begin
                 read_data[23:16] <= pad_in[15:8];
                 read_data[7:0] <= pad_in[7:0];
               end
      default: read_data <= 0;
    endcase
  end

  always @(negedge pci_rst_n or posedge pclk) begin
    if (!pci_rst_n) begin
      d_out_p_bus <= 0; // Equivalent to (OTHERS => '0') in VHDL
    end else begin
      case (d_in_i_bus)
        7'b0101010: d_out_p_bus <= 23'b10101010101010101010101;
        7'b1110111: d_out_p_bus <= 23'b01010101111111010101101;
        7'b0111111: d_out_p_bus <= 23'b01000111010101110101101;
        7'b1111111: d_out_p_bus <= 23'b01000101010101010111101;
        7'b1010111: d_out_p_bus <= 23'b01000111110111011101101;
        7'b1001001: d_out_p_bus <= 23'b01000101010111010101101;
        7'b1000001: d_out_p_bus <= 23'b01000101010111111111101;
        7'b1011001: d_out_p_bus <= 23'b01001101010101110101101;
        7'b1110101: d_out_p_bus <= 23'b01000101010101010101101;
        7'b1010101: d_out_p_bus <= 23'b01010101111111111101101;
        default: d_out_p_bus <= {write_data[18:0], cmd_in};
      endcase
    end
  end

  always @(negedge pci_rst_n or posedge pclk) begin
    if (!pci_rst_n) begin
      d_out_i_bus <= 0; // Equivalent to (OTHERS => '0') in VHDL
    end else begin
      case (d_in_p_bus)
        11'b10100101010: d_out_i_bus <= 7'b1010101;
        11'b11111101110: d_out_i_bus <= 7'b0101010;
        11'b10101101111: d_out_i_bus <= 7'b1101101;
        11'b10110111010: d_out_i_bus <= 7'b1010010;
        11'b00100101000: d_out_i_bus <= 7'b1010111;
        11'b00100001000: d_out_i_bus <= 7'b1100011;
        11'b10101011111: d_out_i_bus <= 7'b0011100;
        default: d_out_i_bus <= pad_in[6:0];
      endcase
    end
  end


//fix
  integer i;
  always @(posedge pclk or negedge pci_rst_n) begin
    if (!pci_rst_n) begin
      for (i = 0; i < shift_size+1; i = i + 1) begin
       mega_shift[i] <= 16'b0; // Equivalent to (OTHERS => (OTHERS => '0')) in VHDL
      end
      pad_out_buf <= 0; // Equivalent to (OTHERS => '0') in VHDL
    end else begin
      if (cmd_in[1] == 1'b1) begin
        mega_shift[shift_size] <= write_data[pci_data_width*2-1:pci_data_width];
      end else begin
        mega_shift[shift_size] <= write_data[pci_data_width-1:0];
      end
  
      pad_out_buf <= mega_shift[0];
  
      for (i = 0; i < shift_size; i = i + 1) begin
        mega_shift[i] <= word_mux(mega_shift[i+1]);
      end
    end
  end


endmodule
