//`include "/data/user/alps04/ORCA_14/1_syn/1_input/RTL/VERILOG/RISCTYPES.v"
module PRGRM_FSM (
  input clk,
  input reset_n,
  output reg [2:0] CurrentState
);
// add
parameter [2:0] RESET_STATE = 0;
parameter [2:0] FETCH_INSTR = 1;
parameter [2:0] READ_OPS = 2;
parameter [2:0] EXECUTE = 3;
parameter [2:0] WRITEBACK = 4;


//
  reg [2:0] Current_State;
  reg [2:0] Next_State;

  always @(Current_State) begin
    case (Current_State)
      RESET_STATE: Next_State <= FETCH_INSTR;
      FETCH_INSTR: Next_State <= READ_OPS;
      READ_OPS: Next_State <= EXECUTE;
      EXECUTE: Next_State <= WRITEBACK;
      WRITEBACK: Next_State <= FETCH_INSTR;
    endcase
  end

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      Current_State <= RESET_STATE;
    end else begin
      Current_State <= Next_State;
    end
  end

  always @(*) begin
    CurrentState <= Current_State;
  end

endmodule

