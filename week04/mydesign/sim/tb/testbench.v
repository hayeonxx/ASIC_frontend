`timescale 1ns/1ps
`define T_CLK 10

module testbench();

    reg clk;
    reg n_rst;
    reg din1;
    reg up1_dn0;
    reg sel;
    reg cin1;
    reg cin2;

    wire [1:0] do1;
    wire [1:0] do2;
    wire [1:0] do3;
    wire co1;
    wire co2;

    mydesign u_mydesign(
        .clk(clk),
        .n_rst(n_rst),
        .din1(din1),
        .up1_dn0(up1_dn0),
        .sel(sel),
        .cin1(cin1),
        .cin2(cin2),
        .do1(do1),
        .do2(do2),
        .do3(do3),
        .co1(co1),
        .co2(co2)
    );

    initial begin
        clk = 1'b1;
        n_rst = 1'b0;
        #(`T_CLK * 2.2) n_rst = 1'b1;
    end

    always #(`T_CLK/2) clk = ~clk;

    initial begin
        din1 = 1'b0;
        up1_dn0 = 1'b1;
        sel = 1'b0;
        cin1 = 1'b0;
        cin2 = 1'b1;

        wait(n_rst==1'b1);
        #(`T_CLK) din1 = 1'b1;
        #(`T_CLK*5) din1 = 1'b0;
                    sel = 1'b1;
        #(`T_CLK*5) din1 = 1'b1;
                    up1_dn0 = 1'b0;
        #(`T_CLK*5) $finish;
    end

    `ifdef SDF_PRE
    initial begin
        $sdf_annotate("../syn/out/mapped/mydesign.pre.sdf", u_mydesign);
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
