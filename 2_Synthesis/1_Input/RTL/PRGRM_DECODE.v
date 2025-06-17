//`include "/data/user/alps04/ORCA_14/1_syn/1_input/RTL/VERILOG/RISCTYPES.v"
module PRGRM_DECODE (
  input Zro_Flag,
  input Carry_Flag,
  input Neg_Flag,
  input [2:0] CurrentState,
  input [31:0] Crnt_Instrn,
  output reg Incrmnt_PC,
  output reg Ld_Brnch_Addr,
  output reg Ld_Rtn_Addr
);

  reg Brnch_Addr;
  reg Rtn_Addr;
  reg Take_Branch;

  reg Neg, Zro, Carry, Jmp;

  always @(Take_Branch, CurrentState, Crnt_Instrn, Zro_Flag, Carry_Flag, Neg_Flag, Brnch_Addr, Rtn_Addr) begin
    Brnch_Addr <= 0;
    Rtn_Addr <= 0;
    // Determine if Jmp on False or Jmp on True
    if (Crnt_Instrn[25] == 1'b1) begin
     // Take_Branch = ~(Neg_Flag | Carry_Flag | Zro_Flag);
     Neg <= ~(Neg_Flag);
     Carry <= ~(Carry_Flag);
     Zro  <= ~(Zro_Flag);
     Jmp <= 1'b0;
    end else begin
//      Take_Branch = Neg_Flag | Carry_Flag | Zro_Flag;
     Neg <= Neg_Flag;
     Carry <= Carry_Flag;
     Zro  <= Zro_Flag;
     Jmp <= 1'b1;
    end

    // Determines which of the CONDITIONs needs to be checked and whether to jmp
    case (Crnt_Instrn[23:16])
      8'b00000000: Take_Branch <= Neg;
      8'b00000001: Take_Branch <= Zro;
      8'b00000010: Take_Branch <= Carry;
      8'b00111111: Take_Branch <= Jmp;
      default: Take_Branch <= 1'b0;
    endcase

    case (CurrentState)
      3'b100: begin
       if (Crnt_Instrn[31:30] == 0) begin
        // For Jmp/Call with condition check
        if ((Crnt_Instrn[29] || Crnt_Instrn[28]) && Take_Branch) begin
          Brnch_Addr <= 1'b1;
        end
        // For Return
        if (Crnt_Instrn[27]) begin
          Rtn_Addr <= 1'b1;
        end
       end
        // If not Jumping or Returning, increment PC
        if (Rtn_Addr || Brnch_Addr) begin
          Incrmnt_PC <= 1'b0;
        end else begin
          Incrmnt_PC <= 1'b1;
        end
      end
      default: Incrmnt_PC <= 1'b0;
    endcase
  end

  always @(*) begin
    Ld_Brnch_Addr <= Brnch_Addr;
    Ld_Rtn_Addr <= Rtn_Addr;
  end

endmodule

