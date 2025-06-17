/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : S-2021.06-SP5-5
// Date      : Sat May 31 09:54:56 2025
/////////////////////////////////////////////////////////////


module shift2 ( clk, n_rst, din, dout );
  output [1:0] dout;
  input clk, n_rst, din;
  wire   N0;

  \**SEQGEN**  \shift_r_reg[1]  ( .clear(N0), .preset(1'b0), .next_state(din), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(dout[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \shift_r_reg[0]  ( .clear(N0), .preset(1'b0), .next_state(
        dout[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(dout[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  GTECH_NOT I_0 ( .A(n_rst), .Z(N0) );
endmodule


module mydesign ( clk, n_rst, din1, up1_dn0, sel, cin1, cin2, do1, do2, do3, 
        co1, co2 );
  output [1:0] do1;
  output [1:0] do2;
  output [1:0] do3;
  input clk, n_rst, din1, up1_dn0, sel, cin1, cin2;
  output co1, co2;
  wire   N0, N1, N2, N3, N4, N5, n_din1, N6, N7, N8, N9, N10, N11, N12, N13,
         N14, N15, N16, N17, sel_d1, N18, N19, N20, N21;
  wire   [1:0] shift2_do;
  wire   [1:0] cnt;

  shift2 u_shift2 ( .clk(clk), .n_rst(n_rst), .din(n_din1), .dout(shift2_do)
         );
  \**SEQGEN**  \xor_ff_reg[1]  ( .clear(N6), .preset(1'b0), .next_state(do1[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(do2[1]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1)
         );
  \**SEQGEN**  \xor_ff_reg[0]  ( .clear(N6), .preset(1'b0), .next_state(do1[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(do2[0]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1)
         );
  \**SEQGEN**  \cnt_reg[1]  ( .clear(N7), .preset(1'b0), .next_state(N16), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(cnt[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \cnt_reg[0]  ( .clear(N7), .preset(1'b0), .next_state(N15), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(cnt[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  sel_d1_reg ( .clear(N17), .preset(1'b0), .next_state(sel), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(sel_d1), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  ADD_UNS_OP add_151 ( .A(cnt), .B(1'b1), .Z({N12, N11}) );
  SUB_UNS_OP sub_151 ( .A(cnt), .B(1'b1), .Z({N14, N13}) );
  SELECT_OP C65 ( .DATA1({N12, N11}), .DATA2({N14, N13}), .CONTROL1(N0), 
        .CONTROL2(N1), .Z({N16, N15}) );
  GTECH_BUF B_0 ( .A(up1_dn0), .Z(N0) );
  GTECH_BUF B_1 ( .A(N10), .Z(N1) );
  SELECT_OP C66 ( .DATA1({N19, N20}), .DATA2(cnt), .CONTROL1(N2), .CONTROL2(N3), .Z(do3) );
  GTECH_BUF B_2 ( .A(sel_d1), .Z(N2) );
  GTECH_BUF B_3 ( .A(N18), .Z(N3) );
  SELECT_OP C67 ( .DATA1(cin2), .DATA2(cin1), .CONTROL1(N4), .CONTROL2(N5), 
        .Z(co1) );
  GTECH_BUF B_4 ( .A(sel), .Z(N4) );
  GTECH_BUF B_5 ( .A(N21), .Z(N5) );
  SELECT_OP C68 ( .DATA1(cin1), .DATA2(cin2), .CONTROL1(N4), .CONTROL2(N5), 
        .Z(co2) );
  GTECH_NOT I_0 ( .A(din1), .Z(n_din1) );
  GTECH_XOR2 C72 ( .A(shift2_do[1]), .B(cnt[1]), .Z(do1[1]) );
  GTECH_XOR2 C73 ( .A(shift2_do[0]), .B(cnt[0]), .Z(do1[0]) );
  GTECH_NOT I_1 ( .A(n_rst), .Z(N6) );
  GTECH_NOT I_2 ( .A(n_rst), .Z(N7) );
  GTECH_BUF B_6 ( .A(n_rst), .Z(N8) );
  GTECH_BUF B_7 ( .A(N8), .Z(N9) );
  GTECH_NOT I_3 ( .A(up1_dn0), .Z(N10) );
  GTECH_AND2 C81 ( .A(N9), .B(up1_dn0) );
  GTECH_AND2 C82 ( .A(N9), .B(N10) );
  GTECH_NOT I_4 ( .A(n_rst), .Z(N17) );
  GTECH_NOT I_5 ( .A(sel_d1), .Z(N18) );
  GTECH_NOT I_6 ( .A(cnt[1]), .Z(N19) );
  GTECH_NOT I_7 ( .A(cnt[0]), .Z(N20) );
  GTECH_NOT I_8 ( .A(sel), .Z(N21) );
endmodule

