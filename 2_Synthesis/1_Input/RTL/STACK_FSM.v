module STACK_FSM (
  input reset_n,     // Reset
  input clk,         // Clock
  input PushEnbl,    // Push cmd for stack
  input PopEnbl,     // Pop cmd for stack
  output reg [0:2] TOS,  // Stack address
  output reg STACK_FULL  // Stack is full
);

  // Define the stack states
  parameter EMPTY = 2'b00;
  parameter NORMAL = 2'b01;
  parameter FULL = 2'b10;
  parameter error = 2'b11;

  // Define signals to hold the current stack state and the next stack state
  reg [1:0] Crnt_Stack, Next_Stack;
  reg [0:2] Next_TOS, TOS_int;

  // State transition logic
  always @(Crnt_Stack, TOS_int, PushEnbl, PopEnbl) begin
    if (PushEnbl & PopEnbl) begin
      Next_Stack <= error;
      Next_TOS <= 3'b000;
    end else begin
      case (Crnt_Stack)
        EMPTY:
          if (PushEnbl) begin
            Next_Stack <= NORMAL;
            Next_TOS <= 3'b001;
          end else if (PopEnbl) begin
            Next_Stack <= error;
            Next_TOS <= 3'b000;
          end else begin
            Next_Stack <= EMPTY;
            Next_TOS <= 3'b000;
          end

        NORMAL:
          if (PushEnbl) begin
            if (TOS_int == 3'b111) begin
              Next_Stack <= FULL;
              Next_TOS <= 3'b111;
            end else begin
              Next_Stack <= NORMAL;
              Next_TOS <= TOS_int + 1;
            end
          end else if (PopEnbl) begin
            if (TOS_int == 3'b001) begin
              Next_Stack <= EMPTY;
              Next_TOS <= 3'b000;
            end else begin
              Next_Stack <= NORMAL;
              Next_TOS <= TOS_int - 1;
            end
          end else begin
            Next_Stack <= NORMAL;
            Next_TOS <= TOS_int;
          end

        FULL:
          if (PushEnbl) begin
            Next_Stack <= error;
            Next_TOS <= 3'b111;
          end else if (PopEnbl) begin
            Next_Stack <= NORMAL;
            Next_TOS <= 3'b111;
          end else begin
            Next_Stack <= FULL;
            Next_TOS <= 3'b111;
          end

        error:
	  begin
            Next_Stack <= error;
            Next_TOS <= 3'b111;
	  end
      endcase
    end
  end

  // State register
always @(posedge clk or negedge reset_n) begin
  if (reset_n == 1'b0) begin
    Crnt_Stack <= 1'b0;
    TOS_int <= 3'b000;
    STACK_FULL <= 1'b0;
  end else  begin
    Crnt_Stack <= Next_Stack;
    TOS_int <= Next_TOS;
    if (Crnt_Stack == 2'b10 && TOS_int == 3'b111) begin
      STACK_FULL <= 1'b1;
    end else begin
      STACK_FULL <= 1'b0;
    end
  end
end

always @(*) begin
  TOS <= TOS_int;
end
endmodule

