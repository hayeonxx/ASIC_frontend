module complex_cal(
    input clk,
    input n_rst,

    input cal_mode,    
    input din_vld,
    input signed [7:0] din_re_1,
    input signed [7:0]din_im_1,
    input signed [7:0] din_re_2,
    input signed [7:0] din_im_2,

    output reg signed [7:0] dout_re,
    output reg signed [7:0] dout_im,
    output reg dout_vld
);

    wire signed [7:0] add_dout_re;
    wire signed [7:0] add_dout_im;
    wire add_dout_vld;

    wire signed [7:0] mul_dout_re;
    wire signed [7:0] mul_dout_im;
    wire mul_dout_vld;

    complex_add u_complex_add (
        .re_1(din_re_1),
        .im_1(din_im_1),
        .re_2(din_re_2), 
        .im_2(din_im_2),
        .add_din_vld(din_vld & ~cal_mode),
        .add_dout_re(add_dout_re),
        .add_dout_im(add_dout_im),
        .add_dout_vld(add_dout_vld)
    );

    complex_mul u_complex_mul (
        .re_1(din_re_1), 
        .im_1(din_im_1),
        .re_2(din_re_2), 
        .im_2(din_im_2),
        .mul_din_vld(din_vld & cal_mode),
        .mul_dout_re(mul_dout_re),
        .mul_dout_im(mul_dout_im),
        .mul_dout_vld(mul_dout_vld)
    );

    wire signed [7:0] result_re = (add_dout_vld) ? add_dout_re : mul_dout_re;
    wire signed [7:0] result_im = (add_dout_vld) ? add_dout_im : mul_dout_im;
    wire result_vld = add_dout_vld | mul_dout_vld;

    reg signed [7:0] dout_re_d, dout_im_d;
    reg dout_vld_d;

    always @(posedge clk or negedge n_rst) begin
        if (!n_rst) begin
            dout_re_d <= 0;
            dout_im_d <= 0;
            dout_vld_d <= 0;
            dout_re <= 0;
            dout_im <= 0;
            dout_vld <= 0;
        end else begin
            dout_re_d <= result_re;
            dout_im_d <= result_im;
            dout_vld_d <= result_vld;

            dout_re <= dout_re_d;
            dout_im <= dout_im_d;
            dout_vld <= dout_vld_d;
        end
    end

endmodule
