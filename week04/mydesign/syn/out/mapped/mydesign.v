/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : S-2021.06-SP5-5
// Date      : Sat May 31 09:54:59 2025
/////////////////////////////////////////////////////////////


module shift2 ( clk, n_rst, din, dout );
  output [1:0] dout;
  input clk, n_rst, din;


  DFFARX1_RVT shift_r_reg_1_ ( .D(din), .CLK(clk), .RSTB(n_rst), .Q(dout[1])
         );
  DFFARX1_RVT shift_r_reg_0_ ( .D(dout[1]), .CLK(clk), .RSTB(n_rst), .Q(
        dout[0]) );
endmodule


module mydesign ( clk, n_rst, din1, up1_dn0, sel, cin1, cin2, do1, do2, do3, 
        co1, co2 );
  output [1:0] do1;
  output [1:0] do2;
  output [1:0] do3;
  input clk, n_rst, din1, up1_dn0, sel, cin1, cin2;
  output co1, co2;
  wire   N16, sel_d1, n3, n4, n5, n6, n7;
  wire   [1:0] shift2_do;
  wire   [1:0] cnt;

  shift2 u_shift2 ( .clk(clk), .n_rst(n_rst), .din(n3), .dout(shift2_do) );
  DFFARX1_RVT cnt_reg_0_ ( .D(n6), .CLK(clk), .RSTB(n_rst), .Q(cnt[0]), .QN(n6) );
  DFFARX1_RVT xor_ff_reg_0_ ( .D(do1[0]), .CLK(clk), .RSTB(n_rst), .Q(do2[0])
         );
  DFFARX1_RVT cnt_reg_1_ ( .D(N16), .CLK(clk), .RSTB(n_rst), .Q(cnt[1]), .QN(
        n7) );
  DFFARX1_RVT xor_ff_reg_1_ ( .D(do1[1]), .CLK(clk), .RSTB(n_rst), .Q(do2[1])
         );
  DFFARX1_RVT sel_d1_reg ( .D(sel), .CLK(clk), .RSTB(n_rst), .Q(sel_d1), .QN(
        n5) );
  INVX0_RVT U14 ( .A(din1), .Y(n3) );
  HADDX1_RVT U15 ( .A0(cnt[1]), .B0(shift2_do[1]), .SO(do1[1]) );
  HADDX1_RVT U16 ( .A0(cnt[0]), .B0(shift2_do[0]), .SO(do1[0]) );
  INVX0_RVT U17 ( .A(sel), .Y(n4) );
  AO22X1_RVT U18 ( .A1(sel), .A2(cin1), .A3(n4), .A4(cin2), .Y(co2) );
  AO22X1_RVT U19 ( .A1(sel), .A2(cin2), .A3(n4), .A4(cin1), .Y(co1) );
  AO22X1_RVT U20 ( .A1(cnt[0]), .A2(n5), .A3(n6), .A4(sel_d1), .Y(do3[0]) );
  AO22X1_RVT U21 ( .A1(cnt[1]), .A2(n5), .A3(n7), .A4(sel_d1), .Y(do3[1]) );
  FADDX1_RVT U22 ( .A(up1_dn0), .B(cnt[1]), .CI(n6), .S(N16) );
endmodule

