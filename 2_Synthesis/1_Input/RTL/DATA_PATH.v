module DATA_PATH (
  input clk,
  input reset_n,
  input Reset_AluRegs,
  input Rd_Oprnd_A,
  input Rd_Oprnd_B,
  input UseData_Imm_Or_RegB,
  input UseData_Imm_Or_ALU,
  input Latch_Flags,
//  input [15:0] ALU_Zro,
  input ALU_Zro,
//  input [15:0] ALU_Neg,
  input ALU_Neg,
//  input [15:0] ALU_Carry,
  input ALU_Carry,
//  input [15:0] PSW_Zro,
  input PSW_Zro,
  input PSW_Neg,
  input PSW_Carry,
  input [31:0] Crnt_Instrn,
  input [15:0] RegPort_A,
  input [15:0] RegPort_B,
  input [15:0] Op_Result,
  output reg Zro_Flag,
  output reg Neg_Flag,
  output reg Carry_Flag,
  output reg [6:0] Addr_A,
  output [15:0] Oprnd_A,
  output [15:0] Oprnd_B,
  output [15:0] RegPort_C
);

  reg PSWL_Zro;
  reg PSWL_Neg;
  reg PSWL_Carry;
  reg [15:0] Oprnd_A;
  reg [15:0] Oprnd_B;
  reg [15:0] RegPort_C;
  always @(posedge clk) begin
    if (Reset_AluRegs == 1'b1) begin
      Oprnd_A <= 16'b0000000000000000;
    end else if (Rd_Oprnd_A == 1'b1) begin
      Oprnd_A <= RegPort_A;
    end

    if (Reset_AluRegs == 1'b1) begin
      Oprnd_B <= 16'b0000000000000000;
    end else if (Rd_Oprnd_B == 1'b1) begin
      if (UseData_Imm_Or_RegB == 1'b1) begin
        Oprnd_B <= {8'b00000000, Crnt_Instrn[7:0]};
      end else if (UseData_Imm_Or_RegB == 1'b0) begin
        Oprnd_B <= RegPort_B;
      end
    end
  end

  always @(posedge clk or negedge reset_n) begin
    if (reset_n == 1'b0) begin
      PSWL_Zro <= 1'b0;
      PSWL_Neg <= 1'b0;
      PSWL_Carry <= 1'b0;
    end else begin
      if (Latch_Flags == 1'b1) begin
        PSWL_Zro <= PSW_Zro;
        PSWL_Neg <= PSW_Neg;
        PSWL_Carry <= PSW_Carry;
      end
    end
  end

  always @(Crnt_Instrn or Op_Result or UseData_Imm_Or_ALU) begin
    if (UseData_Imm_Or_ALU == 1'b1) begin
      RegPort_C <= Crnt_Instrn[15:0];
    end else begin
      RegPort_C <= Op_Result;
    end
  end

  always @(Crnt_Instrn or PSWL_Zro or PSWL_Neg or PSWL_Carry or ALU_Zro or ALU_Neg or ALU_Carry) begin
    if (Crnt_Instrn[31:24] == 8'b00001000) begin
      Zro_Flag <= PSWL_Zro;
      Neg_Flag <= PSWL_Neg;
      Carry_Flag <= PSWL_Carry;
    end else begin
      Zro_Flag <= ALU_Zro;
      Neg_Flag <= ALU_Neg;
      Carry_Flag <= ALU_Carry;
    end
  end

  always @(Crnt_Instrn) begin
    if (Crnt_Instrn[31:30] == 2'b00 && Crnt_Instrn[24] == 1'b1) begin
      Addr_A <= Crnt_Instrn[6:0];
    end else begin
      Addr_A <= Crnt_Instrn[14:8];
    end
  end

endmodule

