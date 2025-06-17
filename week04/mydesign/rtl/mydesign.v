// module mydesign(
//     input clk,
//     input n_rst,
//     input din1,
//     input up1_dn0,
//     input sel,
//     input cin1,
//     input cin2,
//     output [1:0] do1,
//     output [1:0] do2,
//     output [1:0] do3,
//     output co1,
//     output co2
// );

//     //not_gate
//     wire din1_inv;
//     assign din1_inv = ~din1;

//     //shift2
//     wire [1:0] p_out;

//     shift2 u_shift2(
//         .clk(clk),
//         .n_rst(n_rst),
//         .s_in(din1_inv),
//         .p_out(p_out)
//     );

//     assign do1 = p_out;
    
//     //cnt
//     reg [1:0] up1_do0;
    
//     always @(posedge clk or negedge n_rst) begin
//         if (!n_rst) 
//             up1_do0 <= 2'b00;  
//         else if (up1_dn0)
//             up1_do0 <= up1_do0 + 1;  
//         else
//             up1_do0 <= up1_do0 - 1;  
//     end
    
//     //inv
//     wire [1:0] inv_up1_do0;
//     assign inv_up1_do0 = ~up1_do0;

//     //mux
//     assign do3 = sel ? inv_up1_do0 : up1_do0;

//     //xor
//     wire [1:0] do2_xor;
//     assign do2_xor = p_out ^ up1_do0;

//     //ff
//     reg [1:0] do2_ff;
//     always @(posedge clk or negedge n_rst) begin
//         if (!n_rst)
//             do2_ff <= 2'b00;  
//         else
//             do2_ff <= do2_xor;  
//     end

//     assign do2 = do2_ff;

//     //swap
//     assign co1 = sel ? cin2 : cin1;
//     assign co2 = sel ? cin1 : cin2;


// endmodule
//`define LINT_2

module mydesign(
	clk,
	n_rst,
	din1,
	up1_dn0,
	sel,
	cin1,
	cin2,

	do1,
	do2,
	do3,
	co1,
	co2
);

input clk;
input n_rst;

input din1;
input up1_dn0;
input sel;
input cin1;
input cin2;

output [1:0] do1;
output [1:0] do2;
output [1:0] do3;

output co1;
output co2;

wire n_din1;
assign n_din1 = ~din1;

wire [1:0] shift2_do;
`ifdef LINT_2
wire shift2_do_onemore;
`endif

shift2 u_shift2(
	.clk(clk),
	.n_rst(n_rst),

	.din(n_din1),
`ifdef LINT_2
	.dout({shift2_do,shift2_do_onemore})
`else
	.dout(shift2_do)
`endif
);


reg [1:0] cnt;

wire [1:0] xor_co;
reg  [1:0] xor_ff;
assign xor_co = (shift2_do ^ cnt);

//assign do1 = shift2_do; // ver.1
assign do1 = xor_co; // ver.2

always @(posedge clk or negedge n_rst)
	if(!n_rst) begin
		xor_ff <= 2'h0;	
	end
	else begin
		xor_ff <= xor_co; 
	end

assign do2 = xor_ff;

always @(posedge clk or negedge n_rst)
	if(!n_rst) begin
		cnt <= 2'h0;
	end
	else begin
		cnt <= (up1_dn0 == 1'b1)? cnt + 2'h1 : cnt - 2'h1;
	end


// ver.2
reg sel_d1;
always @(posedge clk or negedge n_rst)
	if(!n_rst) begin
		sel_d1 <= 1'b0;
	end
	else begin
		sel_d1 <= sel;
	end

assign do3 = (sel_d1 == 1'b1)? ~cnt : cnt;

assign co1 = (sel == 1'b1)? cin2 : cin1;
assign co2 = (sel == 1'b1)? cin1 : cin2;

endmodule

