module ALU (
  input reset_n,
  input clk,
  input [15:0] Oprnd_A,
  input [15:0] Oprnd_B,
  input [5:0] ALU_OP,
  input Latch_Result,
  input Latch_Flags,
  output [15:0] Lachd_Result,
  output Zro_Flag,
  output Neg_Flag,
  output Carry_Flag
);

  reg [15:0] Op_Result;
  reg ALU_Zro, ALU_Carry, ALU_Neg;
 reg [15:0] Result;
// reg [31:0] carry;
// integer count;
 reg [15:0] Lachd_Result;
 reg Zro_Flag;
 reg Neg_Flag;
 reg Carry_Flag;

  always @(posedge clk)
  begin
    if (Latch_Result)
      Lachd_Result <= Op_Result;
  end

  //always @(reset_n or clk or Latch_Flags or ALU_Zro or ALU_Neg or ALU_Carry)
  always @( posedge clk or negedge reset_n  )
  begin
    if (reset_n == 0)
    begin
      Zro_Flag <= 0;
      Neg_Flag <= 0;
      Carry_Flag <= 0;
    end else 
      if (Latch_Flags == 1)
      begin
        Zro_Flag <= ALU_Zro;
        Neg_Flag <= ALU_Neg;
        Carry_Flag <= ALU_Carry;
      end
  end

  always @(Oprnd_A, Oprnd_B, ALU_OP)
  begin
//    reg [15:0] Result;
//    reg [31:0] carry;
//    integer I, count;

    //carry = 0;
    //count = 0;

    case (ALU_OP)
      6'b000000: // OP_ADD
        Result = Oprnd_A + Oprnd_B;
      6'b000001: // OP_ADD_PLUS_ONE
        Result = Oprnd_A + (Oprnd_B + 1);
      6'b000010: // OP_A | OP_Ap | OP_App
        Result = Oprnd_A;
      6'b000111: // OP_A | OP_Ap | OP_App
        Result = Oprnd_A;
      6'b010101: // OP_A | OP_Ap | OP_App
        Result = Oprnd_A;
      6'b000011: // OP_A_PLUS_ONE
        Result = Oprnd_A + 1;
      6'b000101: // OP_SUB
        Result = Oprnd_A - Oprnd_B;
      6'b000100: // OP_SUB_MINUS_ONE
        Result = Oprnd_A - (Oprnd_B + 1);
      6'b000110: // OP_A_MINUS_ONE
        Result = Oprnd_A - 1;
      6'b010000: // OP_ALL_ZEROS
        Result = 16'b0;
      6'b010001: // OP_A_AND_B
        Result = Oprnd_A & Oprnd_B;
      6'b010010: // OP_notA_AND_B
        Result = ~(Oprnd_A) & Oprnd_B;
      6'b010011: // OP_B
        Result = Oprnd_B;
      6'b011000: // OP_notA_AND_notB
        Result = ~(Oprnd_A) & ~(Oprnd_B);
      6'b011001: // OP_A_XNOR_B
        Result = ~(Oprnd_A ^ Oprnd_B);
      6'b011010: // OP_notA
        Result = ~(Oprnd_A);
      6'b011011: // OP_notA_OR_B
        Result = ~(Oprnd_A) | Oprnd_B;
      6'b010100: // OP_A_AND_notB
        Result = Oprnd_A & ~(Oprnd_B);
      6'b010110: // OP_A_XOR_B
        Result = Oprnd_A ^ Oprnd_B;
      6'b010111: // OP_A_OR_B
        Result = Oprnd_A | Oprnd_B;
      6'b011100: // OP_notB
        Result = ~(Oprnd_B);
      6'b011101: // OP_A_OR_notB
        Result = Oprnd_A | ~(Oprnd_B);
      6'b011110: // OP_A_NAND_B
        Result = ~(Oprnd_A & Oprnd_B);
      6'b011111: // OP_ALL_ONES
        Result = 16'b1111111111111111;
      default: // OTHERS
        Result = 16'b0000000000000000;
    endcase

    if (Result == 16'b0000000000000000)
     begin
      ALU_Zro <= 1;
     end
    else begin
      ALU_Zro <= 0;
     end

    //if (Result < 16'b0000000000000000)
    if (Result == 16'b0000000000000000)
    begin
      ALU_Neg <= 1;
    end
    else begin
      ALU_Neg <= 0;
    end

    ALU_Carry <= 0;

    Op_Result <= Result;
  end
endmodule
