module dff(
	input clk,
	input n_rst,
	input d,
	output q
);
reg q_ff;
always@(posedge clk or negedge n_rst)
	if(!n_rst)
		q_ff <= 1'b0;
	else
		q_ff <= d;
assign q = q_ff;
endmodule
