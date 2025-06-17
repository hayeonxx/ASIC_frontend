module complex_add (
    input signed [7:0] re_1,
    input signed [7:0] im_1,
    input signed [7:0] re_2,
    input signed [7:0] im_2,
    input add_din_vld,

    output signed [7:0] add_dout_re,
    output signed [7:0] add_dout_im,
    output add_dout_vld
);

    wire signed [8:0] sum_re = re_1 + re_2;
    wire signed [8:0] sum_im = im_1 + im_2;

    assign add_dout_re = sum_re[8:1];  
    assign add_dout_im = sum_im[8:1];
    assign add_dout_vld = add_din_vld;

endmodule

