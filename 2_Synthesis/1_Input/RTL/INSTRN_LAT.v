module INSTRN_LAT (
  input clk,
  input [31:0] Instrn,
  input Latch_Instr,
  output reg [31:0] Crnt_Instrn_1,
  output reg [31:0] Crnt_Instrn_2
);

  always @(posedge clk) begin
    if (Latch_Instr == 1'b1) begin
      Crnt_Instrn_1 <= Instrn;
      Crnt_Instrn_2 <= Instrn;
    end
  end

endmodule

