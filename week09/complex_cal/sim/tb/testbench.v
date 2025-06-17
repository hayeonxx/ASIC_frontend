`timescale 1ns/100ps

`define T_CLK 10

module tb_complex_cal();

parameter D_WIDTH = 8;
parameter DEPTH = 1250;

reg clk, n_rst;

initial clk = 1'b1;
always #(`T_CLK/2) clk = ~clk;

initial begin
	n_rst = 1'b0;
	#(`T_CLK * 2.2) n_rst = 1'b1;
end

reg				  cal_mode;
reg               din_vld;

reg [D_WIDTH-1:0] din_re_1;
reg [D_WIDTH-1:0] din_im_1;
reg [D_WIDTH-1:0] din_re_2;
reg [D_WIDTH-1:0] din_im_2;

wire [D_WIDTH-1:0] dout_re;
wire [D_WIDTH-1:0] dout_im;
wire               dout_vld;


reg [D_WIDTH-1:0] mem_din_re_1[0:DEPTH-1];
reg [D_WIDTH-1:0] mem_din_im_1[0:DEPTH-1];
reg [D_WIDTH-1:0] mem_din_re_2[0:DEPTH-1];
reg [D_WIDTH-1:0] mem_din_im_2[0:DEPTH-1];
reg [D_WIDTH-1:0] mem_dout_re[0:DEPTH-1];
reg [D_WIDTH-1:0] mem_dout_im[0:DEPTH-1];

initial begin
	$readmemh("../tb/din_1_real.txt",mem_din_re_1);
	$readmemh("../tb/din_1_imag.txt",mem_din_im_1);
	$readmemh("../tb/din_2_real.txt",mem_din_re_2);
	$readmemh("../tb/din_2_imag.txt",mem_din_im_2);
	$readmemh("../tb/dout_imag.txt",mem_dout_im);
	$readmemh("../tb/dout_real.txt",mem_dout_re);
	$readmemh("../tb/dout_imag.txt",mem_dout_im);
end

integer r1, r2;
initial begin

	r1 = 0;
	cal_mode = 1'b0;
	din_vld = 1'b0;
	din_re_1 = {(D_WIDTH){1'b0}};
	din_im_1 = {(D_WIDTH){1'b0}};
	din_re_2 = {(D_WIDTH){1'b0}};
	din_im_2 = {(D_WIDTH){1'b0}};

	wait(n_rst == 1'b1);

	for (r1 = 0; r1 < DEPTH; r1=r1+1) begin
		#(`T_CLK * 5)
		if (r1 < DEPTH/2) cal_mode = 1'b0;	
		else			  cal_mode = 1'b1;	
		din_vld = 1'b1;
		din_re_1 = mem_din_re_1[r1];
		din_im_1 = mem_din_im_1[r1];
		din_re_2 = mem_din_re_2[r1];
		din_im_2 = mem_din_im_2[r1];
		#(`T_CLK * 1)
		din_vld = 1'b0;
	end

	#(`T_CLK * 5) $finish;

end


initial begin
	r2 = 0;
	wait(n_rst == 1'b1);

	while(1) begin
		wait(dout_vld == 1'b1)
		//$display("%d : out : re = %h, im = %h",r2,  dout_re, dout_im);

		if(dout_re != mem_dout_re[r2]) $display("%t, ERROR!!!!!, ",$time);
		if(dout_im != mem_dout_im[r2]) $display("%t, ERROR!!!!!, ",$time);
		r2 = r2 + 1;
		#(`T_CLK*2);
	end

end

complex_cal u_complex_cal(
    .clk(clk),
    .n_rst(n_rst),

    .cal_mode(cal_mode),

    .din_vld(din_vld),
    .din_re_1(din_re_1),
    .din_im_1(din_im_1),
    .din_re_2(din_re_2),
    .din_im_2(din_im_2),
    .dout_re(dout_re),
    .dout_im(dout_im),
    .dout_vld(dout_vld)
);



`ifdef SDF_PRE
initial begin
	$sdf_annotate("../../syn/out/mapped/complex_cal.pre.sdf", u_complex_cal);
end
`endif 

initial begin
	`ifdef SDF_PRE
		$fsdbDumpfile("test.pre.fsdb");
	`else
		$fsdbDumpfile("test.fsdb");
	`endif
	$fsdbDumpvars(0);
end

endmodule
