`timescale 1ns / 1ps

module fir13_filter(
    input wire clk,
    input wire n_rst,
    input wire signed [7:0] x_in,
    output reg signed [7:0] y_out
);

    // Filter coefficients
    wire signed [7:0] h0 = -8'sd24;
    wire signed [7:0] h1 = -8'sd21;
    wire signed [7:0] h2 = 8'sd0;
    wire signed [7:0] h3 = 8'sd37;
    wire signed [7:0] h4 = 8'sd80;
    wire signed [7:0] h5 = 8'sd114;
    wire signed [7:0] h6 = 8'sd127;

    // Shift register
    reg signed [7:0] x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12;
    always @(posedge clk or negedge n_rst) begin
        if (!n_rst) begin
            x0 <= 0;  x1 <= 0;  x2 <= 0;  x3 <= 0;  x4 <= 0;
            x5 <= 0;  x6 <= 0;  x7 <= 0;  x8 <= 0;  x9 <= 0;
            x10 <= 0; x11 <= 0; x12 <= 0;
        end else begin
            x12 <= x11; x11 <= x10; x10 <= x9; x9 <= x8;
            x8  <= x7;  x7  <= x6;  x6  <= x5; x5 <= x4;
            x4  <= x3;  x3  <= x2;  x2  <= x1; x1 <= x0;
            x0  <= x_in;
        end
    end

    // Sum
    wire signed [8:0] sum0 = x0 + x12;
    wire signed [8:0] sum1 = x1 + x11;
    wire signed [8:0] sum2 = x2 + x10;
    wire signed [8:0] sum3 = x3 + x9;
    wire signed [8:0] sum4 = x4 + x8;
    wire signed [8:0] sum5 = x5 + x7;

    // Product: 8x9 → 17bit
    wire signed [16:0] p0 = h0 * sum0;
    wire signed [16:0] p1 = h1 * sum1;
    wire signed [16:0] p2 = h2 * sum2;
    wire signed [16:0] p3 = h3 * sum3;
    wire signed [16:0] p4 = h4 * sum4;
    wire signed [16:0] p5 = h5 * sum5;
    wire signed [16:0] p6 = h6 * x6;

    // // Add tree
    wire signed [17:0] s1_0 = p0 + p1;
    wire signed [17:0] s1_1 = p2 + p3;
    wire signed [17:0] s1_2 = p4 + p5;

    reg signed [18:0] s2_0, s2_1;
        always @(posedge clk or negedge n_rst) begin
        if (!n_rst) begin
            s2_0 <= 0;
            s2_1 <= 0;
        end else begin
            s2_0 <= s1_0 + s1_1;
            s2_1 <= s1_2 + p6;
        end
    end
    
    reg signed [19:0] acc ;

    always @(posedge clk or negedge n_rst) begin
        if (!n_rst) begin
            acc <= 0;
        end else begin
            acc <= s2_0 + s2_1;
        end
    end

    wire sign = acc[19];
    wire signed [2:0] acc_top3 = $signed(acc[18:16]);
    wire signed [6:0] acc_mid7 = $signed(acc[15:9]);
    wire signed [7:0] clip_val = $signed({sign, acc_mid7});
    
    // Clipping
    wire signed [7:0] clip;
    assign clip = (sign == 1'b0 && acc_top3 != 3'sb000) ? 8'sd127 :
                (sign == 1'b1 && acc_top3 != 3'sb111) ? -8'sd128 :
                $signed(clip_val);

    // Output register
    always @(posedge clk or negedge n_rst) begin
        if (!n_rst)
            y_out <= 8'd0;
        else
            y_out <= clip;
    end

endmodule
