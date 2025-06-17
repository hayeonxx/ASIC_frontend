`timescale 1ns/100ps

`define T_CLK 10

module tb_counter();

reg clk;
reg rst;
wire [3:0] out;

counter u_counter(
	.clk(clk),
	.rst(rst),
	.out(out)
);


initial begin
	clk = 1'b0;
	rst = 1'b1;
	#(`T_CLK * 2.2) rst = 1'b0;
end

always #(`T_CLK/2) clk = ~clk;

initial begin
    #(`T_CLK*50) $finish();
end

initial begin
	$fsdbDumpfile("top.fsdb");
	$fsdbDumpvars(0);
end

endmodule
