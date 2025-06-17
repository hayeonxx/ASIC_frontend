//`include "/data/user/alps04/ORCA_14/1_syn/1_input/RTL/VERILOG/RISCTYPES.v"
module PRGRM_CNT_TOP (
  input clk,
  input reset_n,
  input [31:0] Crnt_Instrn,
  input Zro_Flag,
  input Carry_Flag,
  input Neg_Flag,
  input [7:0] Return_Addr,
  output reg [2:0] Current_State,
  output reg [7:0] PC
);

  reg Incrmnt_PC, Ld_Brnch_Addr, Ld_Rtn_Addr;
  reg [2:0] CurrentState;

  always @(*) begin
    Current_State <= CurrentState;	
  end

  PRGRM_FSM I_PRGRM_FSM (
    .clk(clk),
    .reset_n(reset_n),
    .CurrentState(CurrentState)
  );

  PRGRM_DECODE I_PRGRM_DECODE (
    .Zro_Flag(Zro_Flag),
    .Carry_Flag(Carry_Flag),
    .Neg_Flag(Neg_Flag),
    .CurrentState(CurrentState),
    .Crnt_Instrn(Crnt_Instrn),
    .Incrmnt_PC(Incrmnt_PC),
    .Ld_Brnch_Addr(Ld_Brnch_Addr),
    .Ld_Rtn_Addr(Ld_Rtn_Addr)
  );

  PRGRM_CNT I_PRGRM_CNT (
    .reset_n(reset_n),
    .clk(clk),
    .Incrmnt_PC(Incrmnt_PC),
    .Ld_Brnch_Addr(Ld_Brnch_Addr),
    .Ld_Rtn_Addr(Ld_Rtn_Addr),
    .Imm_Addr(Crnt_Instrn[7:0]),
    .Return_Addr(Return_Addr),
    .PC(PC)
  );

endmodule

