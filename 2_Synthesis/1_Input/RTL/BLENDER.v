module BLENDER (clk, reset_n, clk_enable, test_mode, operation, op1, op2, result);

input clk; 
input reset_n;
input clk_enable;
input test_mode;
input [3:0] operation;
input [31:0] op1;
input [31:0] op2;
output [31:0] result;
reg [31:0] result;

reg gclk;
reg trans1;
reg trans2;
reg trans3;
reg rem_red;
reg rem_green;
reg rem_blue;
reg c_trans1;
reg c_trans2;
reg c_trans3;
reg c_rem_red;
reg c_rem_green;
reg c_rem_blue;
reg [31:0] s1_op1;
reg [31:0] s1_op2;
reg [31:0] s2_op1;
reg [31:0] s2_op2;
reg [31:0] s3_op1;
reg [31:0] s3_op2;
reg [31:0] s4_op1;
reg [31:0] s4_op2;
reg [31:0] s5_result;
reg latched_clk_en;

always @(clk_enable or clk)
begin : clk_en_latch
	if (clk == 1'b0)
	begin
		latched_clk_en <= clk_enable;
	end
end

  always @(clk or latched_clk_en or test_mode) begin
    gclk <= clk & (latched_clk_en | test_mode);
  end
//assign gclk = clk & (latched_clk_en | test_mode);

//always @ (reset_n or gclk or c_trans1 or c_trans2 or c_trans3 or c_rem_red or c_rem_blue or c_rem_green)
always @ (negedge reset_n or posedge gclk)
begin : command_seq
	if (reset_n == 1'b0)
	begin
		trans1 <= 1'b0;
		trans2 <= 1'b0;
		trans3 <= 1'b0;
		rem_red <= 1'b0;
		rem_blue <= 1'b0;
		rem_green <= 1'b0;
	end
	//else if (gclk == 1'b1)
	//else if (reset_n == 1'b1)
	else
	begin
		trans1 <= c_trans1;
		trans2 <= c_trans2;
		trans3 <= c_trans3;
		rem_red <= c_rem_red;
		rem_blue <= c_rem_blue;
		rem_green <= c_rem_green;
	end
end

always @(operation)
begin : command_decode
	c_trans1 <= 1'b0;
	c_trans2 <= 1'b0;
	c_trans3 <= 1'b0;
	c_rem_red <= 1'b0;
	c_rem_blue <= 1'b0;
	c_rem_green <= 1'b0;
	case (operation)
		4'b0101 :
		begin
			c_trans1 <= 1'b1;
			c_rem_red <= 1'b1;
		end
		4'b1101 :
		begin
			c_rem_blue <= 1'b1;
		end
		4'b1010 :
		begin
			c_rem_green <= 1'b1;
			c_trans2 <= 1'b1;
		end
		4'b1001 :
		begin
			c_trans3 <= 1'b1;
		end
		4'b1110 :
		begin
			c_trans1 <= 1'b1;
			c_trans2 <= 1'b1;
			c_trans3 <= 1'b1;
		end
		4'b1111 :
		begin
			c_rem_red <= 1'b1;
		end
		default :
		begin
//#add default
/*
			c_trans1 = 1'b0;
			c_trans2 = 1'b0;
			c_trans3 = 1'b0;
			c_rem_red = 1'b0;
			c_rem_blue = 1'b0;
			c_rem_green = 1'b0;
*/
		end
	endcase
end

always @(posedge gclk)
begin : s1
//	@(posedge gclk);
	if (trans1 == 1'b1)
	begin
		s1_op1 <= {op1[31:24], op2[23:16], op1[15:8], op2[7:0]};
		s1_op2 <= {op2[31:24], op1[23:16], op2[15:8], op1[7:0]};
	end
	else if (trans2 == 1'b1)
	begin
		s1_op1 <= {op2[7:0], op1[31:24], op2[23:16], op1[15:8]};
		s1_op2 <= {op1[7:0], op2[31:24], op1[23:16], op2[15:8]};
	end
	else
	begin
		s1_op1 <= op1;
		s1_op2 <= op2;
	end
end

always @(posedge gclk)
begin : s2
//	@(posedge gclk);
	if (rem_red == 1'b1)
	begin
		s2_op1 <= {8'b00000000, s1_op2[23:16], s1_op1[15:8], s1_op2[7:0]};
		s2_op2 <= {8'b00000000, s1_op1[23:16], s1_op2[15:8], s1_op1[7:0]};
	end
	else if (rem_green == 1'b1)
	begin
		s2_op1 <= {s1_op2[7:0], 8'b00000000, s1_op2[23:16], s1_op1[15:8]};
		s2_op2 <= {s1_op1[7:0], 8'b00000000, s1_op1[23:16], s1_op2[15:8]};
	end
	else if (rem_blue == 1'b1)
	begin
		s2_op1 <= {s1_op2[7:0], s1_op2[23:16], 8'b00000000, s1_op1[15:8]};
		s2_op2 <= {s1_op1[7:0], s1_op1[23:16], 8'b00000000, s1_op2[15:8]};
	end
	else
	begin
		s2_op1 <= s1_op1;
		s2_op2 <= s1_op2;
	end
end

always @(posedge gclk)
begin : s3
//	@(posedge gclk);
	if (trans3 == 1'b1)
	begin
		s3_op1 <= s2_op1 + 7;
		s3_op2 <= s2_op2 - 23;
	end
	else if (trans1 == 1'b1 & trans2 == 1'b1)
	begin
		s3_op1 <= s2_op1 + 214;
		s3_op2 <= s2_op2 - 997;
	end
	else
	begin
		s3_op1 <= s2_op1;
		s3_op2 <= s2_op2;
	end
end

always @(posedge gclk)
begin : s4
//	@(posedge gclk);
	if (rem_green == 1'b1 & rem_red == 1'b1)
	begin
		s4_op1 <= {(s3_op1[31:16] + s3_op1[15:0]), (s3_op2[31:16] + s3_op2[15:0])};
		s4_op2 <= {(s3_op2[31:16] + s3_op1[15:0]), (s3_op2[31:16] + s3_op1[15:0])};
	end
	else if (trans2 == 1'b1 & trans3 == 1'b1)
	begin
		s4_op1 <= s3_op1[31:16] * s3_op1[15:0];
		s4_op2 <= s3_op2[31:16] * s3_op2[15:0];
	end
	else
	begin
		s4_op1 <= s3_op1;
		s4_op2 <= s3_op2;
	end
end

always @(posedge gclk)
begin : s5
//	@(posedge gclk);
	s5_result <= s4_op1 + s4_op2;
end

always @(posedge gclk)
begin : sout
//	@(posedge gclk);
	result <= s5_result + 123522;
end
endmodule




