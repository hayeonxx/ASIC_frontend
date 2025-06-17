module shift_ff (

    input clk,

    input rst,

    input in,

    output out

);



reg [4:0] q;

assign out = q[4];



always @(posedge clk or posedge rst) begin

    if (rst) begin

        q <= 5'b0; 

    end

    else begin

        q[0] <= in;

        q[4:1] <= q[3:0];

    end

end



endmodule



/*

module shift_ff (

    input clk,

    input rst,

    input d,  

    output reg [4:0] out  

);



always @(posedge clk or posedge rst) begin

    if (rst) 

        out <= 5'b00001;  

    else 

        out <= {out[3:0], d};  

end



endmodule

*/


