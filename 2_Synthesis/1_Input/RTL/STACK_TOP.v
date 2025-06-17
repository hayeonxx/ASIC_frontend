/*
module STACK_TOP (
  input reset_n,
  input clk,
  input PushEnbl,
  input PopEnbl,
  input [11:0] PushDataIn,
  output [11:0] PopDataOut,
  output STACK_FULL
);

  wire [2:0] TOS;
  wire STACK_FULL_int;

  STACK_FSM I_STACK_FSM (
    .reset_n(reset_n),
    .clk(clk),
    .PushEnbl(PushEnbl),
    .PopEnbl(PopEnbl),
    .TOS(TOS),
    .STACK_FULL(STACK_FULL_int)
  );

  STACK_MEM I1_STACK_MEM (
    .clk(clk),
    .PushEnbl(PushEnbl),
    .PopEnbl(PopEnbl),
    .Stack_Full(STACK_FULL_int),
    .TOS(TOS),
    .PushDataIn(PushDataIn[3:0]),
    .PopDataOut(PopDataOut[3:0])
  );

  STACK_MEM I2_STACK_MEM (
    .clk(clk),
    .PushEnbl(PushEnbl),
    .PopEnbl(PopEnbl),
    .Stack_Full(STACK_FULL_int),
    .TOS(TOS),
    .PushDataIn(PushDataIn[7:4]),
    .PopDataOut(PopDataOut[7:4])
  );

  STACK_MEM I3_STACK_MEM (
    .clk(clk),
    .PushEnbl(PushEnbl),
    .PopEnbl(PopEnbl),
    .Stack_Full(STACK_FULL_int),
    .TOS(TOS),
    .PushDataIn(PushDataIn[11:8]),
    .PopDataOut(PopDataOut[11:8])
  );

  assign STACK_FULL = STACK_FULL_int;

endmodule
*/



module STACK_TOP (
  input reset_n,                        // Reset
  input clk,                            // Clock
  input PushEnbl,                       // Push cmd for stack
  input PopEnbl,                        // Pop cmd for stack
  input [11:0] PushDataIn,              // Data to be pushed into the stack 
  output wire [11:0] PopDataOut, 	// Data popped out of the stack
  output wire STACK_FULL                // Stack is full
);

  // Internal signals and register declarations
  wire [0:2] TOS;
  wire STACK_FULL_int;


  assign STACK_FULL = STACK_FULL_int;

//  assign PopDataOut = 12'b000000000000;

  // Instantiate STACK_FSM
  STACK_FSM I_STACK_FSM (
    .reset_n(reset_n),
    .clk(clk),
    .PushEnbl(PushEnbl),
    .PopEnbl(PopEnbl),
    .TOS(TOS),
    .STACK_FULL(STACK_FULL_int)
  );

  // Instantiate three instances of STACK_MEM for each nibble of PushDataIn and PopDataOut
  STACK_MEM I1_STACK_MEM (
    .clk(clk),
    .PushEnbl(PushEnbl),
    .PopEnbl(PopEnbl),
    .Stack_Full(STACK_FULL_int),
    .TOS(TOS),
    .PushDataIn(PushDataIn[3:0]),
    .PopDataOut(PopDataOut[3:0])
  );

  STACK_MEM I2_STACK_MEM (
    .clk(clk),
    .PushEnbl(PushEnbl),
    .PopEnbl(PopEnbl),
    .Stack_Full(STACK_FULL_int),
    .TOS(TOS),
    .PushDataIn(PushDataIn[7:4]),
    .PopDataOut(PopDataOut[7:4])
  );

  STACK_MEM I3_STACK_MEM (
    .clk(clk),
    .PushEnbl(PushEnbl),
    .PopEnbl(PopEnbl),
    .Stack_Full(STACK_FULL_int),
    .TOS(TOS),
    .PushDataIn(PushDataIn[11:8]),
    .PopDataOut(PopDataOut[11:8])
  );
  
  

  
endmodule

