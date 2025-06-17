
module PRGRM_CNT (
  input reset_n,
  input clk,
  input Incrmnt_PC,
  input Ld_Brnch_Addr,
  input Ld_Rtn_Addr,
  input [7:0] Imm_Addr,
  input [7:0] Return_Addr,
  output reg [7:0] PC
);

  reg [7:0] PCint;

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      PCint <= 8'b00000000;
    end
    else begin 
	if (Incrmnt_PC) begin
      		PCint <= PCint + 8'b00000001;
    	end
    	else if (Ld_Rtn_Addr) begin
      		PCint <= Return_Addr;
    	end
    	else if (Ld_Brnch_Addr) begin
      		PCint <= Imm_Addr;
    	end
    end
  end

  always @(*) begin
    PC <= PCint;
  end

endmodule
