`timescale 1ns/10ps

`define T_CLK 10



module tb_shift_ff;



    reg clk;

    reg rst;

    reg in;

    wire out;

    



    shift_ff u_shift_ff(

        .clk(clk),

        .rst(rst),

        .in(in),

        .out(out)

    );



    initial begin

        clk = 1'b0;

        rst = 1'b1;

        in = 0;    

        #(`T_CLK * 2.2) rst = 1'b0; 

    end



    always #(`T_CLK / 2) clk = ~clk;  



    initial begin

        #(`T_CLK) in = 1;  

        #(`T_CLK*10) in = 0; 

        #(`T_CLK*10) in = 1; 

        #(`T_CLK*10) in = 0; 

        #(`T_CLK*10) in = 1; 

        #(`T_CLK*10) $finish; 

    end

    initial begin
	    $fsdbDumpfile("top.fsdb");
	    $fsdbDumpvars(0);
    end

endmodule




