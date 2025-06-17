`timescale 1ns/100ps

`define T_CLK 10

module tb_d_ff;

    reg clk;

    reg rst;

    reg D;

    wire Q;



    d_ff u_d_ff(

        .clk(clk),

        .rst(rst),

        .D(D),

        .Q(Q)

    );



    initial begin

        clk = 1'b1;

        rst = 1'b1;

        #(`T_CLK*2.1) rst = 1'b0;

    end



    always #(`T_CLK/2) clk = ~clk;



    initial begin

        D = 0;
	wait(rst == 1'b0);
        #10

        D = 1 ;

        #10

        D = 0;

        #10

        D = 1 ;

        #10

        D = 0;

        #10

        D = 1 ;

        #10

        D = 1;

        #10

        D = 0 ;

        #10

        

        $finish;

    end
    initial begin
	    $fsdbDumpfile("top.fsdb");
	    $fsdbDumpvars(0);
    end


endmodule




