/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : S-2021.06-SP5-5
// Date      : Mon May 26 14:48:37 2025
/////////////////////////////////////////////////////////////


module complex_add ( re_1, im_1, re_2, im_2, add_din_vld, add_dout_re, 
        add_dout_im, add_dout_vld );
  input [7:0] re_1;
  input [7:0] im_1;
  input [7:0] re_2;
  input [7:0] im_2;
  output [7:0] add_dout_re;
  output [7:0] add_dout_im;
  input add_din_vld;
  output add_dout_vld;
  wire   add_dout_vld;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1;
  assign add_dout_vld = add_din_vld;

  ADD_TC_OP add_13 ( .A(re_1), .B(re_2), .Z({add_dout_re, 
        SYNOPSYS_UNCONNECTED__0}) );
  ADD_TC_OP add_14 ( .A(im_1), .B(im_2), .Z({add_dout_im, 
        SYNOPSYS_UNCONNECTED__1}) );
endmodule


module complex_mul ( re_1, im_1, re_2, im_2, mul_din_vld, mul_dout_re, 
        mul_dout_im, mul_dout_vld );
  input [7:0] re_1;
  input [7:0] im_1;
  input [7:0] re_2;
  input [7:0] im_2;
  output [7:0] mul_dout_re;
  output [7:0] mul_dout_im;
  input mul_din_vld;
  output mul_dout_vld;
  wire   mul_dout_vld, N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12,
         N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26,
         N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40,
         N41, N42, N43, N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54,
         N55, N56, N57, N58, N59, N60, N61, N62, N63;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15;
  assign mul_dout_vld = mul_din_vld;

  MULT_TC_OP mult_13 ( .A(re_1), .B(re_2), .Z({N15, N14, N13, N12, N11, N10, 
        N9, N8, N7, N6, N5, N4, N3, N2, N1, N0}) );
  MULT_TC_OP mult_13_2 ( .A(im_1), .B(im_2), .Z({N31, N30, N29, N28, N27, N26, 
        N25, N24, N23, N22, N21, N20, N19, N18, N17, N16}) );
  MULT_TC_OP mult_14 ( .A(re_1), .B(im_2), .Z({N47, N46, N45, N44, N43, N42, 
        N41, N40, N39, N38, N37, N36, N35, N34, N33, N32}) );
  MULT_TC_OP mult_14_2 ( .A(im_1), .B(re_2), .Z({N63, N62, N61, N60, N59, N58, 
        N57, N56, N55, N54, N53, N52, N51, N50, N49, N48}) );
  SUB_TC_OP sub_13 ( .A({N15, N14, N13, N12, N11, N10, N9, N8, N7, N6, N5, N4, 
        N3, N2, N1, N0}), .B({N31, N30, N29, N28, N27, N26, N25, N24, N23, N22, 
        N21, N20, N19, N18, N17, N16}), .Z({mul_dout_re, 
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7}) );
  ADD_TC_OP add_14 ( .A({N47, N46, N45, N44, N43, N42, N41, N40, N39, N38, N37, 
        N36, N35, N34, N33, N32}), .B({N63, N62, N61, N60, N59, N58, N57, N56, 
        N55, N54, N53, N52, N51, N50, N49, N48}), .Z({mul_dout_im, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15}) );
endmodule


module complex_cal ( clk, n_rst, cal_mode, din_vld, din_re_1, din_im_1, 
        din_re_2, din_im_2, dout_re, dout_im, dout_vld );
  input [7:0] din_re_1;
  input [7:0] din_im_1;
  input [7:0] din_re_2;
  input [7:0] din_im_2;
  output [7:0] dout_re;
  output [7:0] dout_im;
  input clk, n_rst, cal_mode, din_vld;
  output dout_vld;
  wire   N0, N1, _0_net_, add_dout_vld, _1_net_, mul_dout_vld, N2, result_vld,
         N3, dout_vld_d, N4;
  wire   [7:0] add_dout_re;
  wire   [7:0] add_dout_im;
  wire   [7:0] mul_dout_re;
  wire   [7:0] mul_dout_im;
  wire   [7:0] result_re;
  wire   [7:0] result_im;
  wire   [7:0] dout_im_d;
  wire   [7:0] dout_re_d;

  complex_add u_complex_add ( .re_1(din_re_1), .im_1(din_im_1), .re_2(din_re_2), .im_2(din_im_2), .add_din_vld(_0_net_), .add_dout_re(add_dout_re), 
        .add_dout_im(add_dout_im), .add_dout_vld(add_dout_vld) );
  complex_mul u_complex_mul ( .re_1(din_re_1), .im_1(din_im_1), .re_2(din_re_2), .im_2(din_im_2), .mul_din_vld(_1_net_), .mul_dout_re(mul_dout_re), 
        .mul_dout_im(mul_dout_im), .mul_dout_vld(mul_dout_vld) );
  \**SEQGEN**  \dout_im_reg[7]  ( .clear(N3), .preset(1'b0), .next_state(
        dout_im_d[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_im[7]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dout_im_reg[6]  ( .clear(N3), .preset(1'b0), .next_state(
        dout_im_d[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_im[6]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dout_im_reg[5]  ( .clear(N3), .preset(1'b0), .next_state(
        dout_im_d[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_im[5]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dout_im_reg[4]  ( .clear(N3), .preset(1'b0), .next_state(
        dout_im_d[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_im[4]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dout_im_reg[3]  ( .clear(N3), .preset(1'b0), .next_state(
        dout_im_d[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_im[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dout_im_reg[2]  ( .clear(N3), .preset(1'b0), .next_state(
        dout_im_d[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_im[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dout_im_reg[1]  ( .clear(N3), .preset(1'b0), .next_state(
        dout_im_d[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_im[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dout_im_reg[0]  ( .clear(N3), .preset(1'b0), .next_state(
        dout_im_d[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_im[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  dout_vld_reg ( .clear(N3), .preset(1'b0), .next_state(
        dout_vld_d), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_vld), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  dout_vld_d_reg ( .clear(N3), .preset(1'b0), .next_state(
        result_vld), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_vld_d), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dout_im_d_reg[7]  ( .clear(N3), .preset(1'b0), .next_state(
        result_im[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_im_d[7]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dout_im_d_reg[6]  ( .clear(N3), .preset(1'b0), .next_state(
        result_im[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_im_d[6]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dout_im_d_reg[5]  ( .clear(N3), .preset(1'b0), .next_state(
        result_im[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_im_d[5]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dout_im_d_reg[4]  ( .clear(N3), .preset(1'b0), .next_state(
        result_im[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_im_d[4]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dout_im_d_reg[3]  ( .clear(N3), .preset(1'b0), .next_state(
        result_im[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_im_d[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dout_im_d_reg[2]  ( .clear(N3), .preset(1'b0), .next_state(
        result_im[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_im_d[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dout_im_d_reg[1]  ( .clear(N3), .preset(1'b0), .next_state(
        result_im[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_im_d[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dout_im_d_reg[0]  ( .clear(N3), .preset(1'b0), .next_state(
        result_im[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_im_d[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dout_re_d_reg[7]  ( .clear(N3), .preset(1'b0), .next_state(
        result_re[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_re_d[7]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dout_re_d_reg[6]  ( .clear(N3), .preset(1'b0), .next_state(
        result_re[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_re_d[6]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dout_re_d_reg[5]  ( .clear(N3), .preset(1'b0), .next_state(
        result_re[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_re_d[5]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dout_re_d_reg[4]  ( .clear(N3), .preset(1'b0), .next_state(
        result_re[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_re_d[4]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dout_re_d_reg[3]  ( .clear(N3), .preset(1'b0), .next_state(
        result_re[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_re_d[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dout_re_d_reg[2]  ( .clear(N3), .preset(1'b0), .next_state(
        result_re[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_re_d[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dout_re_d_reg[1]  ( .clear(N3), .preset(1'b0), .next_state(
        result_re[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_re_d[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dout_re_d_reg[0]  ( .clear(N3), .preset(1'b0), .next_state(
        result_re[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_re_d[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dout_re_reg[7]  ( .clear(N3), .preset(1'b0), .next_state(
        dout_re_d[7]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_re[7]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dout_re_reg[6]  ( .clear(N3), .preset(1'b0), .next_state(
        dout_re_d[6]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_re[6]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dout_re_reg[5]  ( .clear(N3), .preset(1'b0), .next_state(
        dout_re_d[5]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_re[5]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dout_re_reg[4]  ( .clear(N3), .preset(1'b0), .next_state(
        dout_re_d[4]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_re[4]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dout_re_reg[3]  ( .clear(N3), .preset(1'b0), .next_state(
        dout_re_d[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_re[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dout_re_reg[2]  ( .clear(N3), .preset(1'b0), .next_state(
        dout_re_d[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_re[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dout_re_reg[1]  ( .clear(N3), .preset(1'b0), .next_state(
        dout_re_d[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_re[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  \dout_re_reg[0]  ( .clear(N3), .preset(1'b0), .next_state(
        dout_re_d[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        dout_re[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  SELECT_OP C107 ( .DATA1(add_dout_re), .DATA2(mul_dout_re), .CONTROL1(N0), 
        .CONTROL2(N1), .Z(result_re) );
  GTECH_BUF B_0 ( .A(add_dout_vld), .Z(N0) );
  GTECH_BUF B_1 ( .A(N2), .Z(N1) );
  SELECT_OP C108 ( .DATA1(add_dout_im), .DATA2(mul_dout_im), .CONTROL1(N0), 
        .CONTROL2(N1), .Z(result_im) );
  GTECH_AND2 C111 ( .A(din_vld), .B(N4), .Z(_0_net_) );
  GTECH_NOT I_0 ( .A(cal_mode), .Z(N4) );
  GTECH_AND2 C113 ( .A(din_vld), .B(cal_mode), .Z(_1_net_) );
  GTECH_NOT I_1 ( .A(add_dout_vld), .Z(N2) );
  GTECH_OR2 C120 ( .A(add_dout_vld), .B(mul_dout_vld), .Z(result_vld) );
  GTECH_NOT I_2 ( .A(n_rst), .Z(N3) );
endmodule

