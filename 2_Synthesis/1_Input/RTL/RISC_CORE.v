//`include "/data/user/alps04/ORCA_14/1_syn/1_input/RTL/VERILOG/RISCTYPES.v"
module RISC_CORE (
  input clk,
  input Test_Regfile_Clk,
  input Test_Mode,
  input reset_n,
  input [31:0] Instrn,
  output reg [31:0] Xecutng_Instrn,
  output EndOfInstrn,
  output reg [10:0] PSW,
  output reg Rd_Instr,
  output reg [15:0] RESULT_DATA,
  output OUT_VALID,
  output STACK_FULL
);

  // Signal declarations
  reg [15:0] Oprnd_A, Oprnd_B, Op_Result, RegPort_A, RegPort_B, RegPort_C;
  reg [6:0] Addr_A, Addr_B, Addr_C;
  reg [5:0] ALU_OP;
  reg ALU_Zro, ALU_Neg, ALU_Carry, Zro_Flag, Neg_Flag, Carry_Flag,
       PSW_Zro, PushEnbl, PopEnbl, PSW_Neg, PSW_Carry,
       Write_RegC, Rd_Oprnd_A, Rd_Oprnd_B, Latch_Instr, Latch_Flags,
       Latch_Result, UseData_Imm_Or_RegB, UseData_Imm_Or_ALU,
       Reset_AluRegs;
  reg [31:0] Crnt_Instrn_1, Crnt_Instrn_2;
  reg [11:0] PushDataIn, PopDataOut;
  reg [7:0] Return_Addr, Imm_Addr;
  reg [7:0] PC;
  reg testable_ram_clk;
  reg [2:0] Current_State;

  // Port mapping for components
  ALU I_ALU (
    .reset_n(reset_n),
    .clk(clk),
    .Oprnd_A(Oprnd_A),
    .Oprnd_B(Oprnd_B),
    .ALU_OP(ALU_OP),
    .Latch_Result(Latch_Result),
    .Latch_Flags(Latch_Flags),
    .Lachd_Result(Op_Result),
    .Zro_Flag(ALU_Zro),
    .Neg_Flag(ALU_Neg),
    .Carry_Flag(ALU_Carry)
  );

  CONTROL I_CONTROL (
    .clk(clk),
    .reset_n(reset_n),
    .Crnt_Instrn(Crnt_Instrn_2),
    .Current_State(Current_State),
    .Neg_Flag(Neg_Flag),
    .Carry_Flag(Carry_Flag),
    .Zro_Flag(Zro_Flag),
    .Latch_Instr(Latch_Instr),
    .Rd_Oprnd_A(Rd_Oprnd_A),
    .Rd_Oprnd_B(Rd_Oprnd_B),
    .Latch_Flags(Latch_Flags),
    .Latch_Result(Latch_Result),
    .Write_RegC(Write_RegC),
    .UseData_Imm_Or_RegB(UseData_Imm_Or_RegB),
    .UseData_Imm_Or_ALU(UseData_Imm_Or_ALU),
    .Reset_AluRegs(Reset_AluRegs),
    .EndOfInstrn(EndOfInstrn),
    .PushEnbl(PushEnbl),
    .PopEnbl(PopEnbl),
    .OUT_VALID(OUT_VALID)
  );

  DATA_PATH I_DATA_PATH (
    .clk(clk),
    .reset_n(reset_n),
    .Reset_AluRegs(Reset_AluRegs),
    .Rd_Oprnd_A(Rd_Oprnd_A),
    .Rd_Oprnd_B(Rd_Oprnd_B),
    .UseData_Imm_Or_RegB(UseData_Imm_Or_RegB),
    .UseData_Imm_Or_ALU(UseData_Imm_Or_ALU),
    .Latch_Flags(Latch_Flags),
    .ALU_Zro(ALU_Zro),
    .ALU_Neg(ALU_Neg),
    .ALU_Carry(ALU_Carry),
    .PSW_Zro(PSW_Zro),
    .PSW_Neg(PSW_Neg),
    .PSW_Carry(PSW_Carry),
    .Crnt_Instrn(Crnt_Instrn_2),
    .RegPort_A(RegPort_A),
    .RegPort_B(RegPort_B),
    .Op_Result(Op_Result),
    .Zro_Flag(Zro_Flag),
    .Neg_Flag(Neg_Flag),
    .Carry_Flag(Carry_Flag),
    .Addr_A(Addr_A),
    .Oprnd_A(Oprnd_A),
    .Oprnd_B(Oprnd_B),
    .RegPort_C(RegPort_C)
  );

  INSTRN_LAT I_INSTRN_LAT (
    .clk(clk),
    .Instrn(Instrn),
    .Latch_Instr(Latch_Instr),
    .Crnt_Instrn_1(Crnt_Instrn_1),
    .Crnt_Instrn_2(Crnt_Instrn_2)
  );

  PRGRM_CNT_TOP I_PRGRM_CNT_TOP (
    .clk(clk),
    .reset_n(reset_n),
    .Crnt_Instrn(Crnt_Instrn_2),
    .Zro_Flag(Zro_Flag),
    .Carry_Flag(Carry_Flag),
    .Neg_Flag(Neg_Flag),
    .Return_Addr(Return_Addr),
    .Current_State(Current_State),
    .PC(PC)
  );

//  assign testable_ram_clk = (Test_Mode == 1) ? Test_Regfile_Clk : clk;

  REG_FILE I_REG_FILE (
    .clk(testable_ram_clk),
    .Addr_A(Addr_A),
    .Addr_B(Addr_B),
    .Addr_C(Addr_C),
    .RegPort_C(RegPort_C),
    .Write_RegC(Write_RegC),
    .RegPort_A(RegPort_A),
    .RegPort_B(RegPort_B)
  );

  STACK_TOP I_STACK_TOP (
    .reset_n(reset_n),
    .clk(clk),
    .PushEnbl(PushEnbl),
    .PopEnbl(PopEnbl),
    .PushDataIn(PushDataIn),
    .PopDataOut(PopDataOut),
    .STACK_FULL(STACK_FULL)
  );

  // Connectivity definitions
/*  assign PushDataIn[11:0] = {ALU_Zro, Zro_Flag, Neg_Flag, Carry_Flag, PC};
  assign Return_Addr = PopDataOut[7:0];
  assign PSW_Zro = PopDataOut[10];
  assign PSW_Neg = PopDataOut[9];
  assign PSW_Carry = PopDataOut[8];
  assign ALU_OP = Crnt_Instrn_1[29:24];
  assign Addr_B = Crnt_Instrn_1[6:0];
  assign Addr_C = Crnt_Instrn_1[22:16];
  assign PSW = {PC, Zro_Flag, Neg_Flag, Carry_Flag};
  assign Rd_Instr = Latch_Instr;
  assign Xecutng_Instrn = Crnt_Instrn_1;
  assign RESULT_DATA = RegPort_A;
  assign testable_ram_clk = (Test_Mode == 1) ? Test_Regfile_Clk : clk;
*/
   
  always @(*) begin
   PushDataIn[11:0] <= {ALU_Zro, Zro_Flag, Neg_Flag, Carry_Flag, PC};
   Return_Addr <= PopDataOut[7:0];
   PSW_Zro <= PopDataOut[10];
   PSW_Neg <= PopDataOut[9];
   PSW_Carry <= PopDataOut[8];
   ALU_OP <= Crnt_Instrn_1[29:24];
   Addr_B <= Crnt_Instrn_1[6:0];
   Addr_C <= Crnt_Instrn_1[22:16];
   PSW <= {PC, Zro_Flag, Neg_Flag, Carry_Flag};
   Rd_Instr <= Latch_Instr;
   Xecutng_Instrn <= Crnt_Instrn_1;
   RESULT_DATA <= RegPort_A;
   testable_ram_clk <= (Test_Mode == 1) ? Test_Regfile_Clk : clk;
  end
endmodule

