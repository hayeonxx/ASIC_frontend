`timescale 1ns/100ps
`define T_CLK 10

module tb_dff();
	reg clk;
	reg n_rst;
	reg d;
	wire q;

initial begin
	clk = 1'b1;
	n_rst = 1'b0;
	#(`T_CLK*2.1)n_rst = 1'b1;
end
always #(`T_CLK/2)clk = ~clk;

dff u_dff(
	.clk(clk),
	.n_rst(n_rst),
	.d(d),
	.q(q)
);

initial begin
	d = 1'b0;
	wait(n_rst == 1'b1);
	#(`T_CLK) d = 1'b0;
	#(`T_CLK) d = 1'b1;
	#(`T_CLK) d = 1'b0;
	#(`T_CLK*2) $finish;
end
wire qn, qq;
assign qn = ~q;
dff u_dff_inv(
	.clk(clk),
	.n_rst(n_rst),
	.d(qn),
	.q(qq)
);

initial begin
	wait(n_rst == 1'b1);
	$display("%t: %b - %b", $time, d,q);
	#(`T_CLK) $display("%t: %b - %b", $time, d,q);
	#(`T_CLK) $display("%t: %b - %b", $time, d,q);
	#(`T_CLK) $display("%t: %b - %b", $time, d,q);
end
initial begin
	$fsdbDumpfile("top.fsdb");
	$fsdbDumpvars(0);
end
endmodule
