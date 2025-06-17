/*
module MUX21X1_RVT (
  input A1,
  input A2,
  input S0,
  output reg Y
);
  always @(A1, A2, S0) begin
    if (S0 == 1'b0)
      Y = A1;
    else
      Y = A2;
  end
endmodule
*/
module SDRAM_IF #(
  parameter sd_a_width = 10,
  parameter sd_dq_width = 16
) (
  input sdram_clk,
  input sdram_rst_n,
  input risc_OUT_VALID,
  input risc_STACK_FULL,
  input risc_EndOfInstrn,
  input [10:0] risc_PSW,
  input risc_Rd_Instr,
  output reg [9:0] sd_A,
  output sd_CK,
  output sd_CKn,
  output reg sd_LD,
  output reg sd_RW,
  output reg [1:0] sd_BWS,
  input [15:0] sd_DQ_in,
  output [15:0] sd_DQ_out,
  output [15:0] sd_DQ_en,
  output reg sd_wfifo_pop,
  input sd_wfifo_empty,
  output reg sd_rfifo_push,
  input sd_rfifo_full,
  output [31:0] sd_rfifo_DQ_out,
  input [31:0] sd_wfifo_DQ_in
);
  
 integer i ;
 reg [15:0] sd_DQ_en ;
 reg [31:0] sd_rfifo_DQ_out ;

  parameter shift_size = 30;

  reg [14:0] u_control_bus;
  reg [14:0] sync_control_bus;
  reg [14:0] control_bus;
  
  reg [sd_a_width+7:0] out_control;
  reg [sd_a_width+7:0] c_out_control;

  reg [sd_dq_width-1:0] DQ_in_0;
  reg [sd_dq_width-1:0] DQ_in_1;

  reg [sd_dq_width-1:0] DQ_out_0;
  reg [sd_dq_width-1:0] DQ_out_1;

  wire ti_hi = 1;
  wire ti_low = 0;

  function MUX_FUNC;
    input D0;
    input D1;
    input S;
    begin
      if (S == 1'b0)
        MUX_FUNC = D0;
      else
        MUX_FUNC = D1;
    end
  endfunction

  reg [15:0] mega_shift_0 [0:shift_size];
  reg [15:0] mega_shift_1 [0:shift_size];


  function [sd_dq_width-1:0] word_mux;
    input [sd_dq_width-1:0] ein;
    reg [sd_dq_width-1:0] word;
    reg [sd_dq_width-1:0] rol_word;
    integer i, n;
    parameter sd_dq_width = 16;
    integer bits_to_rotate;
    begin
//      reg [sd_dq_width-1:0] word;
//      reg [sd_dq_width-1:0] rol_word;
//      integer i, n;
      
      for (i = 0; i < sd_dq_width; i = i + 1) begin
        bits_to_rotate = i;
        rol_word = (ein << bits_to_rotate) | (ein >> (16-bits_to_rotate));
        //rol_word = ein << i;
        //word = {sd_dq_width{1'b0}};
        for (n = 0; n < sd_dq_width; n = n + 1) begin
          word[i] = rol_word[n] ^ word[i];
        end
      end
      
      word_mux = word;
    end
  endfunction
/*
function [15:0] word_mux(input [15:0] ein);
  reg [15:0] word;
  reg [15:0] rol_word;
  integer i, n;
begin
  for (i = 0; i < 16; i=i+1) begin
    rol_word = ein << i;
    //word = 16'b0;
    for (n = 0; n < 16; n=n+1) begin
      word[i] = word[i] ^ rol_word[n];
    end
  end

  word_mux = word;
end
endfunction
*/
  always @(posedge sdram_clk or negedge sdram_rst_n) begin
    if (!sdram_rst_n)
      sd_DQ_en <= 16'b0000000000000000;
    else if (c_out_control[0])
        sd_DQ_en <= 16'b0000000000000000;
      else
        sd_DQ_en <= 16'b1111111111111111;
  end

  always @(posedge sdram_clk) begin
    control_bus <= sync_control_bus;
    sync_control_bus <= u_control_bus;
  end

  always @(posedge sdram_clk or negedge sdram_rst_n) begin
    if (!sdram_rst_n)
      out_control <= 0;
    else 
      out_control <= c_out_control;
  end

/*
  reg [16:0] temp;

  always @(*) begin
    temp <= {control_bus, sd_rfifo_full, sd_wfifo_empty} ;
  end
*/
  always @(control_bus, sd_wfifo_empty, sd_rfifo_full) begin
    case ({control_bus, sd_rfifo_full, sd_wfifo_empty})
      17'b01010101010101010:
        c_out_control <= {control_bus, sd_rfifo_full, sd_wfifo_empty, 1'b1} + 981;
      17'b10101010101010101:
        c_out_control <= {control_bus, sd_rfifo_full, sd_wfifo_empty, 1'b1} + 97632;
      17'b01101101101101101:
        c_out_control <= {control_bus, sd_rfifo_full, sd_wfifo_empty, 1'b1} + 13243;
      17'b10010010010010010:
        c_out_control <= {control_bus, sd_rfifo_full, sd_wfifo_empty, 1'b1} + 4565;
      17'b11011011011011011:
        c_out_control <= {control_bus, sd_rfifo_full, sd_wfifo_empty, 1'b1} + 92734;
      17'b11101010001101001:
        c_out_control <= {control_bus, sd_rfifo_full, sd_wfifo_empty, 1'b1} + 18273;
      17'b01001011010100110:
        c_out_control <= {control_bus, sd_rfifo_full, sd_wfifo_empty, 1'b1} + 7346;
      default:
        c_out_control <= {control_bus, sd_rfifo_full, sd_wfifo_empty, 1'b1} + 3114;
    endcase
  end

  always @(posedge sdram_clk) begin
    DQ_in_0 <= sd_DQ_in;
  end

  always @(negedge sdram_clk) begin
    DQ_in_1 <= sd_DQ_in;
  end

  always @(DQ_in_0, DQ_in_1) begin
    sd_rfifo_DQ_out[31:16] <= DQ_in_1;
    sd_rfifo_DQ_out[15:0] <= DQ_in_0;
  end

  always @(posedge sdram_clk) begin
    DQ_out_0 <= mega_shift_0[0];

    mega_shift_0[shift_size] <= sd_wfifo_DQ_in[sd_dq_width-1:0];

    for (i = 0; i < shift_size  ; i = i + 1) begin
      mega_shift_0[i] <= word_mux(mega_shift_0[i+1]);
    end
  end

  always @(negedge sdram_clk) begin
    DQ_out_1 <= mega_shift_1[0];

    mega_shift_1[shift_size] <= sd_wfifo_DQ_in[31:sd_dq_width];

    for (i = 0; i < shift_size   ; i = i + 1) begin
      mega_shift_1[i] <= word_mux(mega_shift_1[i+1]);
    end
  end



  always @(*) begin
    u_control_bus <= {risc_PSW, risc_OUT_VALID, risc_STACK_FULL, risc_EndOfInstrn, risc_Rd_Instr};
    sd_A <= out_control[sd_a_width-1:0];

    sd_LD <= out_control[sd_a_width];
    sd_RW <= out_control[sd_a_width+1];
    sd_BWS <= out_control[sd_a_width+3:sd_a_width+2];
  
    sd_wfifo_pop <= out_control[sd_a_width+4];
    sd_rfifo_push <= out_control[sd_a_width+5];

    
  end


  generate
	genvar bit_index;
    for (bit_index = sd_dq_width-1; bit_index >= 0; bit_index = bit_index - 1) begin
      MUX21X1_RVT sd_mux_dq_out (
        .A1(DQ_out_0[bit_index]),
        .A2(DQ_out_1[bit_index]),
        .S0(sdram_clk),
        .Y(sd_DQ_out[bit_index])
      );
    end
  endgenerate
  
  MUX21X1_RVT sd_mux_CK (
    .A1(ti_low),
    .A2(ti_hi),
    .S0(sdram_clk),
    .Y(sd_CK)
  );

  MUX21X1_RVT sd_mux_CKn (
    .A1(ti_hi),
    .A2(ti_low),
    .S0(sdram_clk),
    .Y(sd_CKn)
  );

endmodule


