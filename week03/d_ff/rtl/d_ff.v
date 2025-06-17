module d_ff(D, Q, clk, rst);

  input D, clk, rst;

  output reg Q;

  

  always @(posedge clk or posedge rst)

    if(rst)

        Q <= 0;

    else

        Q <= D;

endmodule

      


