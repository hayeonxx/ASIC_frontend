// module shift2 (
//     input clk,
//     input n_rst,
//     input s_in,
//     output reg [1:0] p_out
// );


// always @(posedge clk or negedge n_rst) begin
//     if (!n_rst) 
//         p_out <= 2'b00; 

//     else 
//         p_out <= {s_in, p_out[1]};
// end

// endmodule

//`define LINT_2

module shift2(
	clk,
	n_rst,
	din,
	dout
);

input clk;
input n_rst;
input din;

`ifdef LINT_2
output [2:0] dout;
`else
output [1:0] dout;
`endif

reg [1:0] shift_r;

`ifdef LINT_2
reg		  shift_onemore;

always @(posedge clk or negedge n_rst)
	if (!n_rst) begin
		shift_onemore <= 1'h0;
	end
	else begin
		shift_onemore <= shift_r[0];
	end
`endif	

always @(posedge clk or negedge n_rst)
	if (!n_rst) begin
		shift_r <= 2'h0;
	end
	else begin
		shift_r <= {din,shift_r[1]};
	end

`ifdef LINT_2
assign dout = {shift_r,shift_onemore};	
`else
assign dout = shift_r;
`endif

endmodule

