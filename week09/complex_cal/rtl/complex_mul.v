module complex_mul (
    input signed [7:0] re_1,
    input signed [7:0] im_1,
    input signed [7:0] re_2,
    input signed [7:0] im_2,
    input mul_din_vld,

    output signed [7:0] mul_dout_re,
    output signed [7:0] mul_dout_im,
    output mul_dout_vld
);

    wire signed [15:0] mul_re = (re_1 * re_2) - (im_1 * im_2);
    wire signed [15:0] mul_im = (re_1 * im_2) + (im_1 * re_2);

    assign mul_dout_re = $signed(mul_re[15:8]);
    assign mul_dout_im = $signed(mul_im[15:8]);

    assign mul_dout_vld = mul_din_vld;

endmodule
