
module STACK_MEM(
    input clk,                                // Clock
    input PushEnbl,                           // Push cmd for stack
    input PopEnbl,                            // Pop cmd for stack
    input Stack_Full,                         // Stack is full flag

    input [0:2] TOS,                          // Stack address

    input [3:0] PushDataIn,                   // Data to be pushed into the stack 
    output reg [3:0] PopDataOut               // Data popped out of the stack
);

  reg [3:0] Stack_Mem [0:7];
  reg [0:2] Pop_Address;

  // Generate Correct Address for Pop
  always @(Stack_Full, TOS)
  begin
    if (Stack_Full)
      Pop_Address <= TOS;
    else
      Pop_Address <= TOS - 1;
  end

  // Stack Memory writes; described as a set of registers (edge-sensitive)
  always @(posedge clk)
  begin
    if (PushEnbl)         // {
      Stack_Mem[TOS] <= PushDataIn;
  end

  // Stack Memory reads; the output is latched every clock edge
  always @(posedge clk)
  begin
    if (PopEnbl)
      PopDataOut <= Stack_Mem[Pop_Address];
  end

endmodule
