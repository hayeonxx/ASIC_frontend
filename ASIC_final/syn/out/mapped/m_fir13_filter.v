/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : S-2021.06-SP5-5
// Date      : Mon Jun 16 19:12:32 2025
/////////////////////////////////////////////////////////////


module fir13_filter ( clk, n_rst, x_in, y_out );
  input [7:0] x_in;
  output [7:0] y_out;
  input clk, n_rst;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17,
         N18, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31, N32,
         N33, N34, N35, N36, N38, N39, N40, N41, N42, N43, N44, N45, N46, N47,
         N48, intadd_0_A_12_, intadd_0_A_11_, intadd_0_A_10_, intadd_0_A_9_,
         intadd_0_A_8_, intadd_0_A_7_, intadd_0_A_6_, intadd_0_A_5_,
         intadd_0_A_4_, intadd_0_A_3_, intadd_0_A_2_, intadd_0_A_1_,
         intadd_0_A_0_, intadd_0_B_12_, intadd_0_B_10_, intadd_0_B_7_,
         intadd_0_B_6_, intadd_0_B_5_, intadd_0_B_4_, intadd_0_B_3_,
         intadd_0_B_2_, intadd_0_B_1_, intadd_0_B_0_, intadd_0_CI,
         intadd_0_SUM_12_, intadd_0_SUM_11_, intadd_0_SUM_10_, intadd_0_SUM_9_,
         intadd_0_SUM_8_, intadd_0_SUM_7_, intadd_0_SUM_6_, intadd_0_SUM_5_,
         intadd_0_SUM_4_, intadd_0_SUM_3_, intadd_0_SUM_2_, intadd_0_SUM_1_,
         intadd_0_SUM_0_, intadd_0_n13, intadd_0_n12, intadd_0_n11,
         intadd_0_n10, intadd_0_n9, intadd_0_n8, intadd_0_n7, intadd_0_n6,
         intadd_0_n5, intadd_0_n4, intadd_0_n3, intadd_0_n2, intadd_0_n1,
         intadd_1_CI, intadd_1_n9, intadd_1_n8, intadd_1_n7, intadd_1_n6,
         intadd_1_n5, intadd_1_n4, intadd_1_n3, intadd_1_n2, intadd_1_n1,
         intadd_2_A_7_, intadd_2_A_6_, intadd_2_A_5_, intadd_2_A_4_,
         intadd_2_A_3_, intadd_2_A_2_, intadd_2_B_7_, intadd_2_B_6_,
         intadd_2_B_5_, intadd_2_B_4_, intadd_2_B_3_, intadd_2_B_2_,
         intadd_2_B_1_, intadd_2_B_0_, intadd_2_CI, intadd_2_SUM_7_,
         intadd_2_SUM_6_, intadd_2_SUM_5_, intadd_2_SUM_4_, intadd_2_SUM_3_,
         intadd_2_SUM_2_, intadd_2_SUM_1_, intadd_2_SUM_0_, intadd_2_n8,
         intadd_2_n7, intadd_2_n6, intadd_2_n5, intadd_2_n4, intadd_2_n3,
         intadd_2_n2, intadd_2_n1, intadd_3_A_5_, intadd_3_A_4_, intadd_3_A_3_,
         intadd_3_A_2_, intadd_3_A_1_, intadd_3_B_7_, intadd_3_B_6_,
         intadd_3_B_4_, intadd_3_B_3_, intadd_3_B_2_, intadd_3_B_1_,
         intadd_3_B_0_, intadd_3_CI, intadd_3_SUM_0_, intadd_3_n8, intadd_3_n7,
         intadd_3_n6, intadd_3_n5, intadd_3_n4, intadd_3_n3, intadd_3_n2,
         intadd_3_n1, intadd_4_A_7_, intadd_4_A_6_, intadd_4_A_5_,
         intadd_4_A_4_, intadd_4_A_2_, intadd_4_B_6_, intadd_4_B_5_,
         intadd_4_B_4_, intadd_4_B_3_, intadd_4_B_2_, intadd_4_B_1_,
         intadd_4_B_0_, intadd_4_CI, intadd_4_SUM_7_, intadd_4_SUM_6_,
         intadd_4_SUM_4_, intadd_4_SUM_3_, intadd_4_SUM_2_, intadd_4_SUM_1_,
         intadd_4_n8, intadd_4_n7, intadd_4_n6, intadd_4_n5, intadd_4_n4,
         intadd_4_n3, intadd_4_n2, intadd_4_n1, intadd_5_CI, intadd_5_SUM_6_,
         intadd_5_SUM_5_, intadd_5_SUM_4_, intadd_5_SUM_3_, intadd_5_SUM_2_,
         intadd_5_SUM_1_, intadd_5_SUM_0_, intadd_5_n7, intadd_5_n6,
         intadd_5_n5, intadd_5_n4, intadd_5_n3, intadd_5_n2, intadd_5_n1,
         intadd_6_CI, intadd_6_SUM_6_, intadd_6_SUM_5_, intadd_6_SUM_2_,
         intadd_6_SUM_1_, intadd_6_SUM_0_, intadd_6_n7, intadd_6_n6,
         intadd_6_n5, intadd_6_n4, intadd_6_n3, intadd_6_n2, intadd_6_n1,
         intadd_7_CI, intadd_7_SUM_6_, intadd_7_SUM_5_, intadd_7_SUM_4_,
         intadd_7_SUM_3_, intadd_7_SUM_2_, intadd_7_SUM_1_, intadd_7_SUM_0_,
         intadd_7_n7, intadd_7_n6, intadd_7_n5, intadd_7_n4, intadd_7_n3,
         intadd_7_n2, intadd_7_n1, intadd_8_CI, intadd_8_SUM_6_,
         intadd_8_SUM_5_, intadd_8_SUM_4_, intadd_8_SUM_3_, intadd_8_SUM_2_,
         intadd_8_SUM_1_, intadd_8_n7, intadd_8_n6, intadd_8_n5, intadd_8_n4,
         intadd_8_n3, intadd_8_n2, intadd_8_n1, intadd_9_CI, intadd_9_SUM_6_,
         intadd_9_SUM_5_, intadd_9_SUM_4_, intadd_9_SUM_3_, intadd_9_SUM_2_,
         intadd_9_SUM_1_, intadd_9_SUM_0_, intadd_9_n7, intadd_9_n6,
         intadd_9_n5, intadd_9_n4, intadd_9_n3, intadd_9_n2, intadd_9_n1,
         intadd_10_A_4_, intadd_10_B_4_, intadd_10_B_0_, intadd_10_SUM_3_,
         intadd_10_SUM_2_, intadd_10_SUM_1_, intadd_10_SUM_0_, intadd_10_n5,
         intadd_10_n4, intadd_10_n3, intadd_10_n2, intadd_10_n1,
         intadd_11_B_4_, intadd_11_B_0_, intadd_11_SUM_3_, intadd_11_SUM_2_,
         intadd_11_SUM_1_, intadd_11_SUM_0_, intadd_11_n5, intadd_11_n4,
         intadd_11_n3, intadd_11_n2, intadd_11_n1, intadd_12_A_1_,
         intadd_12_A_0_, intadd_12_B_4_, intadd_12_B_3_, intadd_12_B_2_,
         intadd_12_B_1_, intadd_12_B_0_, intadd_12_CI, intadd_12_n5,
         intadd_12_n4, intadd_12_n3, intadd_12_n2, intadd_12_n1,
         intadd_13_A_2_, intadd_13_A_0_, intadd_13_B_3_, intadd_13_B_2_,
         intadd_13_B_1_, intadd_13_B_0_, intadd_13_CI, intadd_13_SUM_2_,
         intadd_13_SUM_1_, intadd_13_n4, intadd_13_n3, intadd_13_n2,
         intadd_13_n1, intadd_14_A_3_, intadd_14_A_2_, intadd_14_A_1_,
         intadd_14_A_0_, intadd_14_B_3_, intadd_14_B_2_, intadd_14_B_1_,
         intadd_14_CI, intadd_14_SUM_2_, intadd_14_SUM_1_, intadd_14_SUM_0_,
         intadd_14_n4, intadd_14_n3, intadd_14_n2, intadd_14_n1,
         intadd_15_A_1_, intadd_15_B_3_, intadd_15_B_2_, intadd_15_B_1_,
         intadd_15_B_0_, intadd_15_CI, intadd_15_SUM_1_, intadd_15_SUM_0_,
         intadd_15_n4, intadd_15_n3, intadd_15_n2, intadd_15_n1,
         intadd_16_A_2_, intadd_16_n4, intadd_16_n3, intadd_16_n2,
         intadd_16_n1, intadd_17_A_3_, intadd_17_A_2_, intadd_17_B_3_,
         intadd_17_B_2_, intadd_17_B_1_, intadd_17_CI, intadd_17_SUM_2_,
         intadd_17_SUM_1_, intadd_17_SUM_0_, intadd_17_n4, intadd_17_n3,
         intadd_17_n2, intadd_17_n1, intadd_18_A_1_, intadd_18_A_0_,
         intadd_18_B_0_, intadd_18_CI, intadd_18_n3, intadd_18_n2,
         intadd_18_n1, intadd_19_A_2_, intadd_19_A_1_, intadd_19_B_0_,
         intadd_19_SUM_2_, intadd_19_SUM_0_, intadd_19_n3, intadd_19_n2,
         intadd_19_n1, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133;
  wire   [7:0] x0;
  wire   [7:0] x1;
  wire   [7:0] x2;
  wire   [7:0] x3;
  wire   [7:0] x4;
  wire   [7:0] x5;
  wire   [7:1] x6;
  wire   [7:1] x7;
  wire   [7:0] x8;
  wire   [7:0] x9;
  wire   [7:0] x10;
  wire   [7:0] x11;
  wire   [6:0] x12;
  wire   [15:0] s2_0;
  wire   [16:0] s2_1;
  wire   [19:9] acc;
  wire   [6:0] clip;

  DFFARX1_RVT x0_reg_7_ ( .D(x_in[7]), .CLK(clk), .RSTB(n10), .Q(x0[7]), .QN(
        n121) );
  DFFARX1_RVT x0_reg_6_ ( .D(x_in[6]), .CLK(clk), .RSTB(n11), .Q(x0[6]) );
  DFFARX1_RVT x0_reg_5_ ( .D(x_in[5]), .CLK(clk), .RSTB(n12), .Q(x0[5]) );
  DFFARX1_RVT x0_reg_4_ ( .D(x_in[4]), .CLK(clk), .RSTB(n12), .Q(x0[4]) );
  DFFARX1_RVT x0_reg_3_ ( .D(x_in[3]), .CLK(clk), .RSTB(n7), .Q(x0[3]) );
  DFFARX1_RVT x0_reg_2_ ( .D(x_in[2]), .CLK(clk), .RSTB(n11), .Q(x0[2]) );
  DFFARX1_RVT x0_reg_1_ ( .D(x_in[1]), .CLK(clk), .RSTB(n13), .Q(x0[1]) );
  DFFARX1_RVT x0_reg_0_ ( .D(x_in[0]), .CLK(clk), .RSTB(n17), .Q(x0[0]) );
  DFFARX1_RVT x1_reg_7_ ( .D(x0[7]), .CLK(clk), .RSTB(n11), .Q(x1[7]), .QN(
        n127) );
  DFFARX1_RVT x1_reg_6_ ( .D(x0[6]), .CLK(clk), .RSTB(n13), .Q(x1[6]) );
  DFFARX1_RVT x1_reg_5_ ( .D(x0[5]), .CLK(clk), .RSTB(n17), .Q(x1[5]) );
  DFFARX1_RVT x1_reg_4_ ( .D(x0[4]), .CLK(clk), .RSTB(n7), .Q(x1[4]) );
  DFFARX1_RVT x1_reg_3_ ( .D(x0[3]), .CLK(clk), .RSTB(n10), .Q(x1[3]) );
  DFFARX1_RVT x1_reg_2_ ( .D(x0[2]), .CLK(clk), .RSTB(n7), .Q(x1[2]) );
  DFFARX1_RVT x1_reg_1_ ( .D(x0[1]), .CLK(clk), .RSTB(n7), .Q(x1[1]) );
  DFFARX1_RVT x1_reg_0_ ( .D(x0[0]), .CLK(clk), .RSTB(n12), .Q(x1[0]) );
  DFFARX1_RVT x2_reg_7_ ( .D(x1[7]), .CLK(clk), .RSTB(n10), .Q(x2[7]) );
  DFFARX1_RVT x2_reg_6_ ( .D(x1[6]), .CLK(clk), .RSTB(n_rst), .Q(x2[6]) );
  DFFARX1_RVT x2_reg_5_ ( .D(x1[5]), .CLK(clk), .RSTB(n_rst), .Q(x2[5]) );
  DFFARX1_RVT x2_reg_4_ ( .D(x1[4]), .CLK(clk), .RSTB(n16), .Q(x2[4]) );
  DFFARX1_RVT x2_reg_3_ ( .D(x1[3]), .CLK(clk), .RSTB(n9), .Q(x2[3]) );
  DFFARX1_RVT x2_reg_2_ ( .D(x1[2]), .CLK(clk), .RSTB(n8), .Q(x2[2]) );
  DFFARX1_RVT x2_reg_1_ ( .D(x1[1]), .CLK(clk), .RSTB(n8), .Q(x2[1]) );
  DFFARX1_RVT x2_reg_0_ ( .D(x1[0]), .CLK(clk), .RSTB(n10), .Q(x2[0]) );
  DFFARX1_RVT x3_reg_7_ ( .D(x2[7]), .CLK(clk), .RSTB(n9), .Q(x3[7]), .QN(n126) );
  DFFARX1_RVT x3_reg_6_ ( .D(x2[6]), .CLK(clk), .RSTB(n6), .Q(x3[6]) );
  DFFARX1_RVT x3_reg_5_ ( .D(x2[5]), .CLK(clk), .RSTB(n12), .Q(x3[5]) );
  DFFARX1_RVT x3_reg_4_ ( .D(x2[4]), .CLK(clk), .RSTB(n15), .Q(x3[4]) );
  DFFARX1_RVT x3_reg_3_ ( .D(x2[3]), .CLK(clk), .RSTB(n11), .Q(x3[3]) );
  DFFARX1_RVT x3_reg_2_ ( .D(x2[2]), .CLK(clk), .RSTB(n6), .Q(x3[2]) );
  DFFARX1_RVT x3_reg_1_ ( .D(x2[1]), .CLK(clk), .RSTB(n6), .Q(x3[1]) );
  DFFARX1_RVT x3_reg_0_ ( .D(x2[0]), .CLK(clk), .RSTB(n9), .Q(x3[0]) );
  DFFARX1_RVT x4_reg_7_ ( .D(x3[7]), .CLK(clk), .RSTB(n12), .Q(x4[7]), .QN(
        n130) );
  DFFARX1_RVT x4_reg_6_ ( .D(x3[6]), .CLK(clk), .RSTB(n14), .Q(x4[6]) );
  DFFARX1_RVT x4_reg_5_ ( .D(x3[5]), .CLK(clk), .RSTB(n11), .Q(x4[5]) );
  DFFARX1_RVT x4_reg_4_ ( .D(x3[4]), .CLK(clk), .RSTB(n13), .Q(x4[4]) );
  DFFARX1_RVT x4_reg_3_ ( .D(x3[3]), .CLK(clk), .RSTB(n11), .Q(x4[3]) );
  DFFARX1_RVT x4_reg_2_ ( .D(x3[2]), .CLK(clk), .RSTB(n_rst), .Q(x4[2]) );
  DFFARX1_RVT x4_reg_1_ ( .D(x3[1]), .CLK(clk), .RSTB(n8), .Q(x4[1]) );
  DFFARX1_RVT x4_reg_0_ ( .D(x3[0]), .CLK(clk), .RSTB(n9), .Q(x4[0]) );
  DFFARX1_RVT x5_reg_7_ ( .D(x4[7]), .CLK(clk), .RSTB(n12), .Q(x5[7]), .QN(
        n129) );
  DFFARX1_RVT x5_reg_6_ ( .D(x4[6]), .CLK(clk), .RSTB(n14), .Q(x5[6]) );
  DFFARX1_RVT x5_reg_5_ ( .D(x4[5]), .CLK(clk), .RSTB(n11), .Q(x5[5]) );
  DFFARX1_RVT x5_reg_4_ ( .D(x4[4]), .CLK(clk), .RSTB(n16), .Q(x5[4]) );
  DFFARX1_RVT x5_reg_3_ ( .D(x4[3]), .CLK(clk), .RSTB(n6), .Q(x5[3]) );
  DFFARX1_RVT x5_reg_2_ ( .D(x4[2]), .CLK(clk), .RSTB(n11), .Q(x5[2]) );
  DFFARX1_RVT x5_reg_1_ ( .D(x4[1]), .CLK(clk), .RSTB(n16), .Q(x5[1]) );
  DFFARX1_RVT x5_reg_0_ ( .D(x4[0]), .CLK(clk), .RSTB(n12), .Q(x5[0]), .QN(
        n124) );
  DFFARX1_RVT x6_reg_7_ ( .D(x5[7]), .CLK(clk), .RSTB(n6), .Q(x6[7]) );
  DFFARX1_RVT x6_reg_6_ ( .D(x5[6]), .CLK(clk), .RSTB(n6), .Q(x6[6]) );
  DFFARX1_RVT x6_reg_5_ ( .D(x5[5]), .CLK(clk), .RSTB(n6), .Q(x6[5]) );
  DFFARX1_RVT x6_reg_4_ ( .D(x5[4]), .CLK(clk), .RSTB(n6), .Q(x6[4]) );
  DFFARX1_RVT x6_reg_3_ ( .D(x5[3]), .CLK(clk), .RSTB(n6), .Q(x6[3]) );
  DFFARX1_RVT x6_reg_2_ ( .D(x5[2]), .CLK(clk), .RSTB(n6), .Q(x6[2]) );
  DFFARX1_RVT x6_reg_1_ ( .D(x5[1]), .CLK(clk), .RSTB(n17), .Q(x6[1]), .QN(
        n133) );
  DFFARX1_RVT x6_reg_0_ ( .D(x5[0]), .CLK(clk), .RSTB(n12), .Q(N20), .QN(n125)
         );
  DFFARX1_RVT x7_reg_7_ ( .D(x6[7]), .CLK(clk), .RSTB(n15), .Q(x7[7]), .QN(
        n120) );
  DFFARX1_RVT x7_reg_6_ ( .D(x6[6]), .CLK(clk), .RSTB(n14), .Q(x7[6]) );
  DFFARX1_RVT x7_reg_5_ ( .D(x6[5]), .CLK(clk), .RSTB(n11), .Q(x7[5]) );
  DFFARX1_RVT x7_reg_4_ ( .D(x6[4]), .CLK(clk), .RSTB(n6), .Q(x7[4]) );
  DFFARX1_RVT x7_reg_3_ ( .D(x6[3]), .CLK(clk), .RSTB(n15), .Q(x7[3]) );
  DFFARX1_RVT x7_reg_2_ ( .D(x6[2]), .CLK(clk), .RSTB(n14), .Q(x7[2]) );
  DFFARX1_RVT x7_reg_1_ ( .D(x6[1]), .CLK(clk), .RSTB(n_rst), .Q(x7[1]) );
  DFFARX1_RVT x8_reg_7_ ( .D(x7[7]), .CLK(clk), .RSTB(n_rst), .Q(x8[7]), .QN(
        n122) );
  DFFARX1_RVT x8_reg_6_ ( .D(x7[6]), .CLK(clk), .RSTB(n17), .Q(x8[6]) );
  DFFARX1_RVT x8_reg_5_ ( .D(x7[5]), .CLK(clk), .RSTB(n16), .Q(x8[5]) );
  DFFARX1_RVT x8_reg_4_ ( .D(x7[4]), .CLK(clk), .RSTB(n15), .Q(x8[4]) );
  DFFARX1_RVT x8_reg_3_ ( .D(x7[3]), .CLK(clk), .RSTB(n14), .Q(x8[3]) );
  DFFARX1_RVT x8_reg_2_ ( .D(x7[2]), .CLK(clk), .RSTB(n16), .Q(x8[2]) );
  DFFARX1_RVT x8_reg_1_ ( .D(x7[1]), .CLK(clk), .RSTB(n17), .Q(x8[1]) );
  DFFARX1_RVT x8_reg_0_ ( .D(s2_1[0]), .CLK(clk), .RSTB(n15), .Q(x8[0]) );
  DFFARX1_RVT x9_reg_7_ ( .D(x8[7]), .CLK(clk), .RSTB(n6), .Q(x9[7]), .QN(n118) );
  DFFARX1_RVT x9_reg_6_ ( .D(x8[6]), .CLK(clk), .RSTB(n16), .Q(x9[6]) );
  DFFARX1_RVT x9_reg_5_ ( .D(x8[5]), .CLK(clk), .RSTB(n15), .Q(x9[5]) );
  DFFARX1_RVT x9_reg_4_ ( .D(x8[4]), .CLK(clk), .RSTB(n14), .Q(x9[4]) );
  DFFARX1_RVT x9_reg_3_ ( .D(x8[3]), .CLK(clk), .RSTB(n_rst), .Q(x9[3]) );
  DFFARX1_RVT x9_reg_2_ ( .D(x8[2]), .CLK(clk), .RSTB(n17), .Q(x9[2]) );
  DFFARX1_RVT x9_reg_1_ ( .D(x8[1]), .CLK(clk), .RSTB(n15), .Q(x9[1]) );
  DFFARX1_RVT x9_reg_0_ ( .D(x8[0]), .CLK(clk), .RSTB(n16), .Q(x9[0]) );
  DFFARX1_RVT x10_reg_7_ ( .D(x9[7]), .CLK(clk), .RSTB(n15), .Q(x10[7]) );
  DFFARX1_RVT x11_reg_7_ ( .D(x10[7]), .CLK(clk), .RSTB(n17), .Q(x11[7]), .QN(
        n119) );
  DFFARX1_RVT x12_reg_7_ ( .D(x11[7]), .CLK(clk), .RSTB(n17), .QN(n128) );
  DFFARX1_RVT x10_reg_6_ ( .D(x9[6]), .CLK(clk), .RSTB(n14), .Q(x10[6]) );
  DFFARX1_RVT x11_reg_6_ ( .D(x10[6]), .CLK(clk), .RSTB(n16), .Q(x11[6]) );
  DFFARX1_RVT x12_reg_6_ ( .D(x11[6]), .CLK(clk), .RSTB(n9), .Q(x12[6]) );
  DFFARX1_RVT x10_reg_5_ ( .D(x9[5]), .CLK(clk), .RSTB(n9), .Q(x10[5]) );
  DFFARX1_RVT x11_reg_5_ ( .D(x10[5]), .CLK(clk), .RSTB(n9), .Q(x11[5]) );
  DFFARX1_RVT x12_reg_5_ ( .D(x11[5]), .CLK(clk), .RSTB(n9), .Q(x12[5]) );
  DFFARX1_RVT x10_reg_4_ ( .D(x9[4]), .CLK(clk), .RSTB(n9), .Q(x10[4]) );
  DFFARX1_RVT x11_reg_4_ ( .D(x10[4]), .CLK(clk), .RSTB(n9), .Q(x11[4]) );
  DFFARX1_RVT x12_reg_4_ ( .D(x11[4]), .CLK(clk), .RSTB(n9), .Q(x12[4]) );
  DFFARX1_RVT x10_reg_3_ ( .D(x9[3]), .CLK(clk), .RSTB(n8), .Q(x10[3]) );
  DFFARX1_RVT x11_reg_3_ ( .D(x10[3]), .CLK(clk), .RSTB(n8), .Q(x11[3]) );
  DFFARX1_RVT x12_reg_3_ ( .D(x11[3]), .CLK(clk), .RSTB(n8), .Q(x12[3]) );
  DFFARX1_RVT x10_reg_2_ ( .D(x9[2]), .CLK(clk), .RSTB(n8), .Q(x10[2]) );
  DFFARX1_RVT x11_reg_2_ ( .D(x10[2]), .CLK(clk), .RSTB(n16), .Q(x11[2]) );
  DFFARX1_RVT x12_reg_2_ ( .D(x11[2]), .CLK(clk), .RSTB(n17), .Q(x12[2]) );
  DFFARX1_RVT x10_reg_1_ ( .D(x9[1]), .CLK(clk), .RSTB(n16), .Q(x10[1]) );
  DFFARX1_RVT x11_reg_1_ ( .D(x10[1]), .CLK(clk), .RSTB(n15), .Q(x11[1]) );
  DFFARX1_RVT x12_reg_1_ ( .D(x11[1]), .CLK(clk), .RSTB(n14), .Q(x12[1]) );
  DFFARX1_RVT x10_reg_0_ ( .D(x9[0]), .CLK(clk), .RSTB(n13), .Q(x10[0]) );
  DFFARX1_RVT x11_reg_0_ ( .D(x10[0]), .CLK(clk), .RSTB(n_rst), .Q(x11[0]) );
  DFFARX1_RVT x12_reg_0_ ( .D(x11[0]), .CLK(clk), .RSTB(n16), .Q(x12[0]) );
  DFFARX1_RVT s2_0_reg_15_ ( .D(N18), .CLK(clk), .RSTB(n17), .Q(s2_0[15]), 
        .QN(n123) );
  DFFARX1_RVT s2_0_reg_14_ ( .D(N17), .CLK(clk), .RSTB(n15), .Q(s2_0[14]) );
  DFFARX1_RVT s2_0_reg_13_ ( .D(N16), .CLK(clk), .RSTB(n14), .Q(s2_0[13]) );
  DFFARX1_RVT s2_0_reg_12_ ( .D(N15), .CLK(clk), .RSTB(n6), .Q(s2_0[12]) );
  DFFARX1_RVT s2_0_reg_11_ ( .D(N14), .CLK(clk), .RSTB(n9), .Q(s2_0[11]) );
  DFFARX1_RVT s2_0_reg_10_ ( .D(N13), .CLK(clk), .RSTB(n10), .Q(s2_0[10]) );
  DFFARX1_RVT s2_0_reg_9_ ( .D(N12), .CLK(clk), .RSTB(n17), .Q(s2_0[9]) );
  DFFARX1_RVT s2_0_reg_8_ ( .D(N11), .CLK(clk), .RSTB(n11), .Q(s2_0[8]) );
  DFFARX1_RVT s2_0_reg_7_ ( .D(N10), .CLK(clk), .RSTB(n7), .Q(s2_0[7]) );
  DFFARX1_RVT s2_0_reg_6_ ( .D(N9), .CLK(clk), .RSTB(n10), .Q(s2_0[6]) );
  DFFARX1_RVT s2_0_reg_5_ ( .D(N8), .CLK(clk), .RSTB(n16), .Q(s2_0[5]) );
  DFFARX1_RVT s2_0_reg_4_ ( .D(N7), .CLK(clk), .RSTB(n8), .Q(s2_0[4]) );
  DFFARX1_RVT s2_0_reg_3_ ( .D(N6), .CLK(clk), .RSTB(n7), .Q(s2_0[3]) );
  DFFARX1_RVT s2_0_reg_2_ ( .D(N5), .CLK(clk), .RSTB(n10), .Q(s2_0[2]) );
  DFFARX1_RVT s2_0_reg_1_ ( .D(N4), .CLK(clk), .RSTB(n15), .Q(s2_0[1]) );
  DFFARX1_RVT s2_0_reg_0_ ( .D(N3), .CLK(clk), .RSTB(n_rst), .Q(s2_0[0]) );
  DFFARX1_RVT s2_1_reg_18_ ( .D(N38), .CLK(clk), .RSTB(n_rst), .QN(n132) );
  DFFARX1_RVT s2_1_reg_16_ ( .D(N36), .CLK(clk), .RSTB(n10), .Q(s2_1[16]) );
  DFFARX1_RVT s2_1_reg_15_ ( .D(N35), .CLK(clk), .RSTB(n8), .Q(s2_1[15]) );
  DFFARX1_RVT s2_1_reg_14_ ( .D(N34), .CLK(clk), .RSTB(n14), .Q(s2_1[14]) );
  DFFARX1_RVT s2_1_reg_13_ ( .D(N33), .CLK(clk), .RSTB(n7), .Q(s2_1[13]) );
  DFFARX1_RVT s2_1_reg_12_ ( .D(N32), .CLK(clk), .RSTB(n10), .Q(s2_1[12]) );
  DFFARX1_RVT s2_1_reg_11_ ( .D(N31), .CLK(clk), .RSTB(n8), .Q(s2_1[11]) );
  DFFARX1_RVT s2_1_reg_10_ ( .D(N30), .CLK(clk), .RSTB(n13), .Q(s2_1[10]) );
  DFFARX1_RVT s2_1_reg_9_ ( .D(N29), .CLK(clk), .RSTB(n7), .Q(s2_1[9]) );
  DFFARX1_RVT s2_1_reg_8_ ( .D(N28), .CLK(clk), .RSTB(n10), .Q(s2_1[8]) );
  DFFARX1_RVT s2_1_reg_7_ ( .D(N27), .CLK(clk), .RSTB(n8), .Q(s2_1[7]) );
  DFFARX1_RVT s2_1_reg_6_ ( .D(N26), .CLK(clk), .RSTB(n8), .Q(s2_1[6]) );
  DFFARX1_RVT s2_1_reg_5_ ( .D(N25), .CLK(clk), .RSTB(n7), .Q(s2_1[5]) );
  DFFARX1_RVT s2_1_reg_4_ ( .D(N24), .CLK(clk), .RSTB(n13), .Q(s2_1[4]) );
  DFFARX1_RVT s2_1_reg_3_ ( .D(N23), .CLK(clk), .RSTB(n13), .Q(s2_1[3]) );
  DFFARX1_RVT s2_1_reg_2_ ( .D(N22), .CLK(clk), .RSTB(n11), .Q(s2_1[2]) );
  DFFARX1_RVT s2_1_reg_1_ ( .D(N21), .CLK(clk), .RSTB(n12), .Q(s2_1[1]) );
  DFFARX1_RVT s2_1_reg_0_ ( .D(N20), .CLK(clk), .RSTB(n13), .Q(s2_1[0]), .QN(
        n117) );
  DFFARX1_RVT acc_reg_19_ ( .D(N48), .CLK(clk), .RSTB(n12), .Q(acc[19]), .QN(
        n131) );
  DFFARX1_RVT acc_reg_17_ ( .D(N47), .CLK(clk), .RSTB(n7), .Q(acc[17]) );
  DFFARX1_RVT acc_reg_16_ ( .D(N46), .CLK(clk), .RSTB(n14), .Q(acc[16]) );
  DFFARX1_RVT acc_reg_15_ ( .D(N45), .CLK(clk), .RSTB(n10), .Q(acc[15]) );
  DFFARX1_RVT acc_reg_14_ ( .D(N44), .CLK(clk), .RSTB(n8), .Q(acc[14]) );
  DFFARX1_RVT acc_reg_13_ ( .D(N43), .CLK(clk), .RSTB(n12), .Q(acc[13]) );
  DFFARX1_RVT acc_reg_12_ ( .D(N42), .CLK(clk), .RSTB(n13), .Q(acc[12]) );
  DFFARX1_RVT acc_reg_11_ ( .D(N41), .CLK(clk), .RSTB(n_rst), .Q(acc[11]) );
  DFFARX1_RVT acc_reg_10_ ( .D(N40), .CLK(clk), .RSTB(n10), .Q(acc[10]) );
  DFFARX1_RVT acc_reg_9_ ( .D(N39), .CLK(clk), .RSTB(n7), .Q(acc[9]) );
  DFFARX1_RVT y_out_reg_7_ ( .D(acc[19]), .CLK(clk), .RSTB(n17), .Q(y_out[7])
         );
  DFFARX1_RVT y_out_reg_6_ ( .D(clip[6]), .CLK(clk), .RSTB(n12), .Q(y_out[6])
         );
  DFFARX1_RVT y_out_reg_5_ ( .D(clip[5]), .CLK(clk), .RSTB(n7), .Q(y_out[5])
         );
  DFFARX1_RVT y_out_reg_4_ ( .D(clip[4]), .CLK(clk), .RSTB(n11), .Q(y_out[4])
         );
  DFFARX1_RVT y_out_reg_3_ ( .D(clip[3]), .CLK(clk), .RSTB(n13), .Q(y_out[3])
         );
  DFFARX1_RVT y_out_reg_2_ ( .D(clip[2]), .CLK(clk), .RSTB(n13), .Q(y_out[2])
         );
  DFFARX1_RVT y_out_reg_1_ ( .D(clip[1]), .CLK(clk), .RSTB(n7), .Q(y_out[1])
         );
  DFFARX1_RVT y_out_reg_0_ ( .D(clip[0]), .CLK(clk), .RSTB(n13), .Q(y_out[0])
         );
  FADDX1_RVT intadd_0_U14 ( .A(intadd_0_B_0_), .B(intadd_0_A_0_), .CI(
        intadd_0_CI), .CO(intadd_0_n13), .S(intadd_0_SUM_0_) );
  FADDX1_RVT intadd_0_U13 ( .A(intadd_0_B_1_), .B(intadd_0_A_1_), .CI(
        intadd_0_n13), .CO(intadd_0_n12), .S(intadd_0_SUM_1_) );
  FADDX1_RVT intadd_0_U12 ( .A(intadd_0_B_2_), .B(intadd_0_A_2_), .CI(
        intadd_0_n12), .CO(intadd_0_n11), .S(intadd_0_SUM_2_) );
  FADDX1_RVT intadd_0_U11 ( .A(intadd_0_B_3_), .B(intadd_0_A_3_), .CI(
        intadd_0_n11), .CO(intadd_0_n10), .S(intadd_0_SUM_3_) );
  FADDX1_RVT intadd_0_U10 ( .A(intadd_0_B_4_), .B(intadd_0_A_4_), .CI(
        intadd_0_n10), .CO(intadd_0_n9), .S(intadd_0_SUM_4_) );
  FADDX1_RVT intadd_0_U9 ( .A(intadd_0_B_5_), .B(intadd_0_A_5_), .CI(
        intadd_0_n9), .CO(intadd_0_n8), .S(intadd_0_SUM_5_) );
  FADDX1_RVT intadd_0_U8 ( .A(intadd_0_B_6_), .B(intadd_0_A_6_), .CI(
        intadd_0_n8), .CO(intadd_0_n7), .S(intadd_0_SUM_6_) );
  FADDX1_RVT intadd_0_U7 ( .A(intadd_0_B_7_), .B(intadd_0_A_7_), .CI(
        intadd_0_n7), .CO(intadd_0_n6), .S(intadd_0_SUM_7_) );
  FADDX1_RVT intadd_0_U6 ( .A(intadd_12_n1), .B(intadd_0_A_8_), .CI(
        intadd_0_n6), .CO(intadd_0_n5), .S(intadd_0_SUM_8_) );
  FADDX1_RVT intadd_0_U5 ( .A(intadd_15_n1), .B(intadd_0_A_9_), .CI(
        intadd_0_n5), .CO(intadd_0_n4), .S(intadd_0_SUM_9_) );
  FADDX1_RVT intadd_0_U4 ( .A(intadd_0_B_10_), .B(intadd_0_A_10_), .CI(
        intadd_0_n4), .CO(intadd_0_n3), .S(intadd_0_SUM_10_) );
  FADDX1_RVT intadd_0_U3 ( .A(intadd_14_n1), .B(intadd_0_A_11_), .CI(
        intadd_0_n3), .CO(intadd_0_n2), .S(intadd_0_SUM_11_) );
  FADDX1_RVT intadd_0_U2 ( .A(intadd_0_B_12_), .B(intadd_0_A_12_), .CI(
        intadd_0_n2), .CO(intadd_0_n1), .S(intadd_0_SUM_12_) );
  FADDX1_RVT intadd_1_U10 ( .A(s2_1[9]), .B(s2_0[9]), .CI(intadd_1_CI), .CO(
        intadd_1_n9), .S(N39) );
  FADDX1_RVT intadd_1_U9 ( .A(s2_1[10]), .B(s2_0[10]), .CI(intadd_1_n9), .CO(
        intadd_1_n8), .S(N40) );
  FADDX1_RVT intadd_1_U8 ( .A(s2_1[11]), .B(s2_0[11]), .CI(intadd_1_n8), .CO(
        intadd_1_n7), .S(N41) );
  FADDX1_RVT intadd_1_U7 ( .A(s2_1[12]), .B(s2_0[12]), .CI(intadd_1_n7), .CO(
        intadd_1_n6), .S(N42) );
  FADDX1_RVT intadd_1_U6 ( .A(s2_1[13]), .B(s2_0[13]), .CI(intadd_1_n6), .CO(
        intadd_1_n5), .S(N43) );
  FADDX1_RVT intadd_1_U5 ( .A(s2_1[14]), .B(s2_0[14]), .CI(intadd_1_n5), .CO(
        intadd_1_n4), .S(N44) );
  FADDX1_RVT intadd_1_U4 ( .A(s2_0[15]), .B(s2_1[15]), .CI(intadd_1_n4), .CO(
        intadd_1_n3), .S(N45) );
  FADDX1_RVT intadd_1_U3 ( .A(s2_0[15]), .B(s2_1[16]), .CI(intadd_1_n3), .CO(
        intadd_1_n2), .S(N46) );
  FADDX1_RVT intadd_1_U2 ( .A(n132), .B(n123), .CI(intadd_1_n2), .CO(
        intadd_1_n1), .S(N47) );
  FADDX1_RVT intadd_2_U9 ( .A(intadd_2_B_0_), .B(x6[2]), .CI(intadd_2_CI), 
        .CO(intadd_2_n8), .S(intadd_2_SUM_0_) );
  FADDX1_RVT intadd_2_U8 ( .A(intadd_2_B_1_), .B(x6[3]), .CI(intadd_2_n8), 
        .CO(intadd_2_n7), .S(intadd_2_SUM_1_) );
  FADDX1_RVT intadd_2_U7 ( .A(intadd_2_B_2_), .B(intadd_2_A_2_), .CI(
        intadd_2_n7), .CO(intadd_2_n6), .S(intadd_2_SUM_2_) );
  FADDX1_RVT intadd_2_U6 ( .A(intadd_2_B_3_), .B(intadd_2_A_3_), .CI(
        intadd_2_n6), .CO(intadd_2_n5), .S(intadd_2_SUM_3_) );
  FADDX1_RVT intadd_2_U5 ( .A(intadd_2_B_4_), .B(intadd_2_A_4_), .CI(
        intadd_2_n5), .CO(intadd_2_n4), .S(intadd_2_SUM_4_) );
  FADDX1_RVT intadd_2_U4 ( .A(intadd_2_B_5_), .B(intadd_2_A_5_), .CI(
        intadd_2_n4), .CO(intadd_2_n3), .S(intadd_2_SUM_5_) );
  FADDX1_RVT intadd_2_U3 ( .A(intadd_2_B_6_), .B(intadd_2_A_6_), .CI(
        intadd_2_n3), .CO(intadd_2_n2), .S(intadd_2_SUM_6_) );
  FADDX1_RVT intadd_2_U2 ( .A(intadd_2_B_7_), .B(intadd_2_A_7_), .CI(
        intadd_2_n2), .CO(intadd_2_n1), .S(intadd_2_SUM_7_) );
  FADDX1_RVT intadd_3_U9 ( .A(intadd_3_B_0_), .B(intadd_6_n1), .CI(intadd_3_CI), .CO(intadd_3_n8), .S(intadd_3_SUM_0_) );
  FADDX1_RVT intadd_3_U8 ( .A(intadd_3_B_1_), .B(intadd_3_A_1_), .CI(
        intadd_3_n8), .CO(intadd_3_n7), .S(N30) );
  FADDX1_RVT intadd_3_U7 ( .A(intadd_3_B_2_), .B(intadd_3_A_2_), .CI(
        intadd_3_n7), .CO(intadd_3_n6), .S(N31) );
  FADDX1_RVT intadd_3_U6 ( .A(intadd_3_B_3_), .B(intadd_3_A_3_), .CI(
        intadd_3_n6), .CO(intadd_3_n5), .S(N32) );
  FADDX1_RVT intadd_3_U5 ( .A(intadd_3_B_4_), .B(intadd_3_A_4_), .CI(
        intadd_3_n5), .CO(intadd_3_n4), .S(N33) );
  FADDX1_RVT intadd_3_U4 ( .A(intadd_11_n1), .B(intadd_3_A_5_), .CI(
        intadd_3_n4), .CO(intadd_3_n3), .S(N34) );
  FADDX1_RVT intadd_3_U3 ( .A(intadd_3_B_6_), .B(intadd_10_n1), .CI(
        intadd_3_n3), .CO(intadd_3_n2), .S(N35) );
  FADDX1_RVT intadd_3_U2 ( .A(intadd_3_B_7_), .B(intadd_6_n1), .CI(intadd_3_n2), .CO(intadd_3_n1), .S(N36) );
  FADDX1_RVT intadd_4_U9 ( .A(intadd_4_B_0_), .B(x6[4]), .CI(intadd_4_CI), 
        .CO(intadd_4_n8), .S(intadd_2_B_2_) );
  FADDX1_RVT intadd_4_U8 ( .A(intadd_4_B_1_), .B(x6[5]), .CI(intadd_4_n8), 
        .CO(intadd_4_n7), .S(intadd_4_SUM_1_) );
  FADDX1_RVT intadd_4_U7 ( .A(intadd_4_B_2_), .B(intadd_4_A_2_), .CI(
        intadd_4_n7), .CO(intadd_4_n6), .S(intadd_4_SUM_2_) );
  FADDX1_RVT intadd_4_U6 ( .A(intadd_4_B_3_), .B(intadd_2_A_2_), .CI(
        intadd_4_n6), .CO(intadd_4_n5), .S(intadd_4_SUM_3_) );
  FADDX1_RVT intadd_4_U5 ( .A(intadd_4_B_4_), .B(intadd_4_A_4_), .CI(
        intadd_4_n5), .CO(intadd_4_n4), .S(intadd_4_SUM_4_) );
  FADDX1_RVT intadd_4_U4 ( .A(intadd_4_B_5_), .B(intadd_4_A_5_), .CI(
        intadd_4_n4), .CO(intadd_4_n3), .S(intadd_2_A_7_) );
  FADDX1_RVT intadd_4_U3 ( .A(intadd_4_B_6_), .B(intadd_4_A_6_), .CI(
        intadd_4_n3), .CO(intadd_4_n2), .S(intadd_4_SUM_6_) );
  FADDX1_RVT intadd_4_U2 ( .A(intadd_13_n1), .B(intadd_4_A_7_), .CI(
        intadd_4_n2), .CO(intadd_4_n1), .S(intadd_4_SUM_7_) );
  FADDX1_RVT intadd_5_U8 ( .A(x8[1]), .B(x4[1]), .CI(intadd_5_CI), .CO(
        intadd_5_n7), .S(intadd_5_SUM_0_) );
  FADDX1_RVT intadd_5_U7 ( .A(x8[2]), .B(x4[2]), .CI(intadd_5_n7), .CO(
        intadd_5_n6), .S(intadd_5_SUM_1_) );
  FADDX1_RVT intadd_5_U6 ( .A(x8[3]), .B(x4[3]), .CI(intadd_5_n6), .CO(
        intadd_5_n5), .S(intadd_5_SUM_2_) );
  FADDX1_RVT intadd_5_U5 ( .A(x8[4]), .B(x4[4]), .CI(intadd_5_n5), .CO(
        intadd_5_n4), .S(intadd_5_SUM_3_) );
  FADDX1_RVT intadd_5_U4 ( .A(x8[5]), .B(x4[5]), .CI(intadd_5_n4), .CO(
        intadd_5_n3), .S(intadd_5_SUM_4_) );
  FADDX1_RVT intadd_5_U3 ( .A(x8[6]), .B(x4[6]), .CI(intadd_5_n3), .CO(
        intadd_5_n2), .S(intadd_5_SUM_5_) );
  FADDX1_RVT intadd_5_U2 ( .A(n122), .B(n130), .CI(intadd_5_n2), .CO(
        intadd_5_n1), .S(intadd_5_SUM_6_) );
  FADDX1_RVT intadd_6_U8 ( .A(x7[1]), .B(x5[1]), .CI(intadd_6_CI), .CO(
        intadd_6_n7), .S(intadd_6_SUM_0_) );
  FADDX1_RVT intadd_6_U7 ( .A(x7[2]), .B(x5[2]), .CI(intadd_6_n7), .CO(
        intadd_6_n6), .S(intadd_6_SUM_1_) );
  FADDX1_RVT intadd_6_U6 ( .A(x7[3]), .B(x5[3]), .CI(intadd_6_n6), .CO(
        intadd_6_n5), .S(intadd_6_SUM_2_) );
  FADDX1_RVT intadd_6_U5 ( .A(x7[4]), .B(x5[4]), .CI(intadd_6_n5), .CO(
        intadd_6_n4), .S(intadd_4_A_4_) );
  FADDX1_RVT intadd_6_U4 ( .A(x7[5]), .B(x5[5]), .CI(intadd_6_n4), .CO(
        intadd_6_n3), .S(intadd_4_A_5_) );
  FADDX1_RVT intadd_6_U3 ( .A(x7[6]), .B(x5[6]), .CI(intadd_6_n3), .CO(
        intadd_6_n2), .S(intadd_6_SUM_5_) );
  FADDX1_RVT intadd_6_U2 ( .A(n120), .B(n129), .CI(intadd_6_n2), .CO(
        intadd_6_n1), .S(intadd_6_SUM_6_) );
  FADDX1_RVT intadd_7_U8 ( .A(x12[1]), .B(x0[1]), .CI(intadd_7_CI), .CO(
        intadd_7_n7), .S(intadd_7_SUM_0_) );
  FADDX1_RVT intadd_7_U7 ( .A(x12[2]), .B(x0[2]), .CI(intadd_7_n7), .CO(
        intadd_7_n6), .S(intadd_7_SUM_1_) );
  FADDX1_RVT intadd_7_U6 ( .A(x12[3]), .B(x0[3]), .CI(intadd_7_n6), .CO(
        intadd_7_n5), .S(intadd_7_SUM_2_) );
  FADDX1_RVT intadd_7_U5 ( .A(x12[4]), .B(x0[4]), .CI(intadd_7_n5), .CO(
        intadd_7_n4), .S(intadd_7_SUM_3_) );
  FADDX1_RVT intadd_7_U4 ( .A(x12[5]), .B(x0[5]), .CI(intadd_7_n4), .CO(
        intadd_7_n3), .S(intadd_7_SUM_4_) );
  FADDX1_RVT intadd_7_U3 ( .A(x12[6]), .B(x0[6]), .CI(intadd_7_n3), .CO(
        intadd_7_n2), .S(intadd_7_SUM_5_) );
  FADDX1_RVT intadd_7_U2 ( .A(n128), .B(n121), .CI(intadd_7_n2), .CO(
        intadd_7_n1), .S(intadd_7_SUM_6_) );
  FADDX1_RVT intadd_8_U8 ( .A(x11[1]), .B(x1[1]), .CI(intadd_8_CI), .CO(
        intadd_8_n7), .S(intadd_0_B_0_) );
  FADDX1_RVT intadd_8_U7 ( .A(x11[2]), .B(x1[2]), .CI(intadd_8_n7), .CO(
        intadd_8_n6), .S(intadd_8_SUM_1_) );
  FADDX1_RVT intadd_8_U6 ( .A(x11[3]), .B(x1[3]), .CI(intadd_8_n6), .CO(
        intadd_8_n5), .S(intadd_8_SUM_2_) );
  FADDX1_RVT intadd_8_U5 ( .A(x11[4]), .B(x1[4]), .CI(intadd_8_n5), .CO(
        intadd_8_n4), .S(intadd_8_SUM_3_) );
  FADDX1_RVT intadd_8_U4 ( .A(x11[5]), .B(x1[5]), .CI(intadd_8_n4), .CO(
        intadd_8_n3), .S(intadd_8_SUM_4_) );
  FADDX1_RVT intadd_8_U3 ( .A(x11[6]), .B(x1[6]), .CI(intadd_8_n3), .CO(
        intadd_8_n2), .S(intadd_8_SUM_5_) );
  FADDX1_RVT intadd_8_U2 ( .A(n119), .B(n127), .CI(intadd_8_n2), .CO(
        intadd_8_n1), .S(intadd_8_SUM_6_) );
  FADDX1_RVT intadd_9_U8 ( .A(x9[1]), .B(x3[1]), .CI(intadd_9_CI), .CO(
        intadd_9_n7), .S(intadd_9_SUM_0_) );
  FADDX1_RVT intadd_9_U7 ( .A(x9[2]), .B(x3[2]), .CI(intadd_9_n7), .CO(
        intadd_9_n6), .S(intadd_9_SUM_1_) );
  FADDX1_RVT intadd_9_U6 ( .A(x9[3]), .B(x3[3]), .CI(intadd_9_n6), .CO(
        intadd_9_n5), .S(intadd_9_SUM_2_) );
  FADDX1_RVT intadd_9_U5 ( .A(x9[4]), .B(x3[4]), .CI(intadd_9_n5), .CO(
        intadd_9_n4), .S(intadd_9_SUM_3_) );
  FADDX1_RVT intadd_9_U4 ( .A(x9[5]), .B(x3[5]), .CI(intadd_9_n4), .CO(
        intadd_9_n3), .S(intadd_9_SUM_4_) );
  FADDX1_RVT intadd_9_U3 ( .A(x9[6]), .B(x3[6]), .CI(intadd_9_n3), .CO(
        intadd_9_n2), .S(intadd_9_SUM_5_) );
  FADDX1_RVT intadd_9_U2 ( .A(n118), .B(n126), .CI(intadd_9_n2), .CO(
        intadd_9_n1), .S(intadd_9_SUM_6_) );
  FADDX1_RVT intadd_10_U6 ( .A(intadd_10_B_0_), .B(x6[3]), .CI(intadd_6_SUM_2_), .CO(intadd_10_n5), .S(intadd_10_SUM_0_) );
  FADDX1_RVT intadd_10_U5 ( .A(intadd_4_A_4_), .B(x6[4]), .CI(intadd_10_n5), 
        .CO(intadd_10_n4), .S(intadd_10_SUM_1_) );
  FADDX1_RVT intadd_10_U4 ( .A(intadd_4_A_5_), .B(x6[5]), .CI(intadd_10_n4), 
        .CO(intadd_10_n3), .S(intadd_10_SUM_2_) );
  FADDX1_RVT intadd_10_U3 ( .A(intadd_6_SUM_5_), .B(x6[6]), .CI(intadd_10_n3), 
        .CO(intadd_10_n2), .S(intadd_10_SUM_3_) );
  FADDX1_RVT intadd_10_U2 ( .A(intadd_10_B_4_), .B(intadd_10_A_4_), .CI(
        intadd_10_n2), .CO(intadd_10_n1), .S(intadd_3_A_5_) );
  FADDX1_RVT intadd_11_U6 ( .A(intadd_11_B_0_), .B(intadd_6_SUM_1_), .CI(
        intadd_5_SUM_2_), .CO(intadd_11_n5), .S(intadd_11_SUM_0_) );
  FADDX1_RVT intadd_11_U5 ( .A(intadd_10_SUM_0_), .B(intadd_5_SUM_3_), .CI(
        intadd_11_n5), .CO(intadd_11_n4), .S(intadd_11_SUM_1_) );
  FADDX1_RVT intadd_11_U4 ( .A(intadd_10_SUM_1_), .B(intadd_5_SUM_4_), .CI(
        intadd_11_n4), .CO(intadd_11_n3), .S(intadd_11_SUM_2_) );
  FADDX1_RVT intadd_11_U3 ( .A(intadd_10_SUM_2_), .B(intadd_2_A_6_), .CI(
        intadd_11_n3), .CO(intadd_11_n2), .S(intadd_11_SUM_3_) );
  FADDX1_RVT intadd_11_U2 ( .A(intadd_11_B_4_), .B(intadd_10_SUM_3_), .CI(
        intadd_11_n2), .CO(intadd_11_n1), .S(intadd_3_A_4_) );
  FADDX1_RVT intadd_12_U6 ( .A(intadd_12_B_0_), .B(intadd_12_A_0_), .CI(
        intadd_12_CI), .CO(intadd_12_n5), .S(intadd_0_A_3_) );
  FADDX1_RVT intadd_12_U5 ( .A(intadd_12_B_1_), .B(intadd_12_A_1_), .CI(
        intadd_12_n5), .CO(intadd_12_n4), .S(intadd_0_A_4_) );
  FADDX1_RVT intadd_12_U4 ( .A(intadd_12_B_2_), .B(intadd_8_SUM_5_), .CI(
        intadd_12_n4), .CO(intadd_12_n3), .S(intadd_0_A_5_) );
  FADDX1_RVT intadd_12_U3 ( .A(intadd_12_B_3_), .B(intadd_8_SUM_6_), .CI(
        intadd_12_n3), .CO(intadd_12_n2), .S(intadd_0_A_6_) );
  FADDX1_RVT intadd_12_U2 ( .A(intadd_12_B_4_), .B(intadd_18_n1), .CI(
        intadd_12_n2), .CO(intadd_12_n1), .S(intadd_0_B_7_) );
  FADDX1_RVT intadd_13_U5 ( .A(intadd_13_B_0_), .B(intadd_13_A_0_), .CI(
        intadd_13_CI), .CO(intadd_13_n4), .S(intadd_4_B_3_) );
  FADDX1_RVT intadd_13_U4 ( .A(intadd_13_B_1_), .B(intadd_6_SUM_2_), .CI(
        intadd_13_n4), .CO(intadd_13_n3), .S(intadd_13_SUM_1_) );
  FADDX1_RVT intadd_13_U3 ( .A(intadd_13_B_2_), .B(intadd_13_A_2_), .CI(
        intadd_13_n3), .CO(intadd_13_n2), .S(intadd_13_SUM_2_) );
  FADDX1_RVT intadd_13_U2 ( .A(intadd_13_B_3_), .B(intadd_2_A_5_), .CI(
        intadd_13_n2), .CO(intadd_13_n1), .S(intadd_4_B_6_) );
  FADDX1_RVT intadd_14_U5 ( .A(intadd_8_SUM_3_), .B(intadd_14_A_0_), .CI(
        intadd_14_CI), .CO(intadd_14_n4), .S(intadd_14_SUM_0_) );
  FADDX1_RVT intadd_14_U4 ( .A(intadd_14_B_1_), .B(intadd_14_A_1_), .CI(
        intadd_14_n4), .CO(intadd_14_n3), .S(intadd_14_SUM_1_) );
  FADDX1_RVT intadd_14_U3 ( .A(intadd_14_B_2_), .B(intadd_14_A_2_), .CI(
        intadd_14_n3), .CO(intadd_14_n2), .S(intadd_14_SUM_2_) );
  FADDX1_RVT intadd_14_U2 ( .A(intadd_14_B_3_), .B(intadd_14_A_3_), .CI(
        intadd_14_n2), .CO(intadd_14_n1), .S(intadd_0_A_10_) );
  FADDX1_RVT intadd_15_U5 ( .A(intadd_15_B_0_), .B(intadd_8_SUM_4_), .CI(
        intadd_15_CI), .CO(intadd_15_n4), .S(intadd_15_SUM_0_) );
  FADDX1_RVT intadd_15_U4 ( .A(intadd_15_B_1_), .B(intadd_15_A_1_), .CI(
        intadd_15_n4), .CO(intadd_15_n3), .S(intadd_15_SUM_1_) );
  FADDX1_RVT intadd_15_U3 ( .A(intadd_15_B_2_), .B(intadd_14_SUM_0_), .CI(
        intadd_15_n3), .CO(intadd_15_n2), .S(intadd_0_A_7_) );
  FADDX1_RVT intadd_15_U2 ( .A(intadd_15_B_3_), .B(intadd_14_SUM_1_), .CI(
        intadd_15_n2), .CO(intadd_15_n1), .S(intadd_0_A_8_) );
  FADDX1_RVT intadd_16_U5 ( .A(intadd_13_B_0_), .B(intadd_6_SUM_0_), .CI(
        intadd_4_SUM_1_), .CO(intadd_16_n4), .S(intadd_2_B_3_) );
  FADDX1_RVT intadd_16_U4 ( .A(intadd_4_SUM_2_), .B(intadd_6_SUM_1_), .CI(
        intadd_16_n4), .CO(intadd_16_n3), .S(intadd_2_B_4_) );
  FADDX1_RVT intadd_16_U3 ( .A(intadd_4_SUM_3_), .B(intadd_16_A_2_), .CI(
        intadd_16_n3), .CO(intadd_16_n2), .S(intadd_2_B_5_) );
  FADDX1_RVT intadd_16_U2 ( .A(intadd_4_SUM_4_), .B(intadd_13_SUM_1_), .CI(
        intadd_16_n2), .CO(intadd_16_n1), .S(intadd_2_B_6_) );
  FADDX1_RVT intadd_17_U5 ( .A(intadd_8_SUM_6_), .B(intadd_7_n1), .CI(
        intadd_17_CI), .CO(intadd_17_n4), .S(intadd_17_SUM_0_) );
  FADDX1_RVT intadd_17_U4 ( .A(intadd_17_B_1_), .B(intadd_9_SUM_6_), .CI(
        intadd_17_n4), .CO(intadd_17_n3), .S(intadd_17_SUM_1_) );
  FADDX1_RVT intadd_17_U3 ( .A(intadd_17_B_2_), .B(intadd_17_A_2_), .CI(
        intadd_17_n3), .CO(intadd_17_n2), .S(intadd_17_SUM_2_) );
  FADDX1_RVT intadd_17_U2 ( .A(intadd_17_B_3_), .B(intadd_17_A_3_), .CI(
        intadd_17_n2), .CO(intadd_17_n1), .S(N17) );
  FADDX1_RVT intadd_18_U4 ( .A(intadd_18_B_0_), .B(intadd_18_A_0_), .CI(
        intadd_18_CI), .CO(intadd_18_n3), .S(intadd_0_B_4_) );
  FADDX1_RVT intadd_18_U3 ( .A(intadd_15_SUM_0_), .B(intadd_18_A_1_), .CI(
        intadd_18_n3), .CO(intadd_18_n2), .S(intadd_0_B_5_) );
  FADDX1_RVT intadd_18_U2 ( .A(intadd_15_SUM_1_), .B(intadd_14_B_1_), .CI(
        intadd_18_n2), .CO(intadd_18_n1), .S(intadd_0_B_6_) );
  FADDX1_RVT intadd_19_U4 ( .A(intadd_19_B_0_), .B(intadd_0_A_1_), .CI(
        intadd_7_SUM_1_), .CO(intadd_19_n3), .S(intadd_19_SUM_0_) );
  FADDX1_RVT intadd_19_U3 ( .A(intadd_7_SUM_2_), .B(intadd_19_A_1_), .CI(
        intadd_19_n3), .CO(intadd_19_n2), .S(intadd_14_CI) );
  FADDX1_RVT intadd_19_U2 ( .A(intadd_7_SUM_3_), .B(intadd_19_A_2_), .CI(
        intadd_19_n2), .CO(intadd_19_n1), .S(intadd_19_SUM_2_) );
  NBUFFX2_RVT U15 ( .A(n17), .Y(n6) );
  NBUFFX2_RVT U16 ( .A(n16), .Y(n7) );
  NBUFFX2_RVT U17 ( .A(n15), .Y(n8) );
  NBUFFX2_RVT U18 ( .A(n15), .Y(n9) );
  NBUFFX2_RVT U19 ( .A(n15), .Y(n10) );
  NBUFFX2_RVT U20 ( .A(n14), .Y(n11) );
  NBUFFX2_RVT U21 ( .A(n14), .Y(n12) );
  NBUFFX2_RVT U22 ( .A(n14), .Y(n13) );
  NBUFFX2_RVT U23 ( .A(n_rst), .Y(n14) );
  NBUFFX2_RVT U24 ( .A(n_rst), .Y(n15) );
  NBUFFX2_RVT U25 ( .A(n_rst), .Y(n16) );
  NBUFFX2_RVT U26 ( .A(n_rst), .Y(n17) );
  INVX0_RVT U27 ( .A(intadd_6_SUM_6_), .Y(intadd_2_A_6_) );
  INVX0_RVT U28 ( .A(intadd_7_SUM_6_), .Y(n44) );
  INVX0_RVT U29 ( .A(intadd_13_SUM_2_), .Y(intadd_3_CI) );
  INVX0_RVT U30 ( .A(intadd_16_n1), .Y(intadd_3_B_0_) );
  INVX0_RVT U31 ( .A(intadd_11_SUM_1_), .Y(intadd_4_A_6_) );
  INVX0_RVT U32 ( .A(intadd_5_SUM_6_), .Y(n20) );
  INVX0_RVT U33 ( .A(intadd_5_SUM_4_), .Y(intadd_4_B_5_) );
  INVX0_RVT U34 ( .A(intadd_17_SUM_1_), .Y(n47) );
  INVX0_RVT U35 ( .A(n59), .Y(n45) );
  INVX0_RVT U36 ( .A(intadd_11_SUM_3_), .Y(n22) );
  INVX0_RVT U37 ( .A(n110), .Y(n19) );
  INVX0_RVT U38 ( .A(n18), .Y(intadd_3_A_2_) );
  INVX0_RVT U39 ( .A(intadd_4_SUM_7_), .Y(intadd_3_B_2_) );
  INVX0_RVT U40 ( .A(intadd_7_SUM_2_), .Y(n70) );
  INVX0_RVT U41 ( .A(intadd_9_SUM_2_), .Y(intadd_19_A_1_) );
  INVX0_RVT U42 ( .A(intadd_7_SUM_1_), .Y(n82) );
  INVX0_RVT U43 ( .A(n28), .Y(intadd_17_CI) );
  INVX0_RVT U44 ( .A(intadd_6_SUM_2_), .Y(intadd_2_A_2_) );
  INVX0_RVT U45 ( .A(intadd_6_SUM_5_), .Y(intadd_2_A_5_) );
  INVX0_RVT U46 ( .A(intadd_11_SUM_0_), .Y(intadd_13_A_2_) );
  INVX0_RVT U47 ( .A(intadd_5_SUM_5_), .Y(intadd_13_B_3_) );
  INVX0_RVT U48 ( .A(intadd_3_SUM_0_), .Y(intadd_2_B_7_) );
  INVX0_RVT U49 ( .A(intadd_7_n1), .Y(n39) );
  INVX0_RVT U50 ( .A(intadd_17_SUM_2_), .Y(intadd_0_A_12_) );
  INVX0_RVT U51 ( .A(intadd_4_n1), .Y(intadd_3_B_3_) );
  INVX0_RVT U52 ( .A(n21), .Y(intadd_3_A_3_) );
  INVX0_RVT U53 ( .A(n27), .Y(intadd_5_CI) );
  INVX0_RVT U54 ( .A(intadd_5_SUM_1_), .Y(intadd_4_A_2_) );
  INVX0_RVT U55 ( .A(n72), .Y(n43) );
  INVX0_RVT U56 ( .A(intadd_9_n1), .Y(n58) );
  INVX0_RVT U57 ( .A(intadd_5_SUM_0_), .Y(intadd_13_B_0_) );
  INVX0_RVT U58 ( .A(n102), .Y(intadd_10_B_0_) );
  INVX0_RVT U59 ( .A(intadd_5_SUM_3_), .Y(intadd_4_B_4_) );
  INVX0_RVT U60 ( .A(n29), .Y(intadd_9_CI) );
  INVX0_RVT U61 ( .A(n90), .Y(n88) );
  INVX0_RVT U62 ( .A(n56), .Y(intadd_7_CI) );
  INVX0_RVT U63 ( .A(intadd_7_SUM_0_), .Y(n77) );
  INVX0_RVT U64 ( .A(intadd_9_SUM_3_), .Y(intadd_19_A_2_) );
  INVX0_RVT U65 ( .A(n83), .Y(n89) );
  INVX0_RVT U66 ( .A(intadd_9_SUM_4_), .Y(intadd_18_A_0_) );
  INVX0_RVT U67 ( .A(intadd_9_SUM_5_), .Y(intadd_18_A_1_) );
  INVX0_RVT U68 ( .A(intadd_9_SUM_6_), .Y(intadd_14_B_1_) );
  INVX0_RVT U69 ( .A(intadd_7_SUM_3_), .Y(n63) );
  INVX0_RVT U70 ( .A(intadd_7_SUM_4_), .Y(intadd_14_A_0_) );
  INVX0_RVT U71 ( .A(intadd_8_SUM_5_), .Y(n42) );
  INVX0_RVT U72 ( .A(intadd_7_SUM_5_), .Y(n53) );
  INVX0_RVT U73 ( .A(intadd_4_B_0_), .Y(intadd_4_B_1_) );
  INVX0_RVT U74 ( .A(intadd_6_SUM_0_), .Y(intadd_2_B_0_) );
  INVX0_RVT U75 ( .A(intadd_5_SUM_2_), .Y(intadd_16_A_2_) );
  INVX0_RVT U76 ( .A(intadd_6_n1), .Y(n105) );
  INVX0_RVT U77 ( .A(n65), .Y(n86) );
  INVX0_RVT U78 ( .A(intadd_9_SUM_0_), .Y(intadd_0_A_0_) );
  INVX0_RVT U79 ( .A(n30), .Y(intadd_8_CI) );
  INVX0_RVT U80 ( .A(intadd_8_SUM_1_), .Y(n94) );
  INVX0_RVT U81 ( .A(intadd_9_SUM_1_), .Y(intadd_0_A_1_) );
  INVX0_RVT U82 ( .A(intadd_8_SUM_4_), .Y(intadd_12_A_1_) );
  INVX0_RVT U83 ( .A(intadd_17_SUM_0_), .Y(intadd_14_A_3_) );
  INVX0_RVT U84 ( .A(intadd_8_SUM_6_), .Y(intadd_14_A_1_) );
  INVX0_RVT U85 ( .A(intadd_8_n1), .Y(n49) );
  INVX0_RVT U86 ( .A(intadd_4_A_5_), .Y(intadd_2_A_4_) );
  INVX0_RVT U87 ( .A(intadd_11_SUM_2_), .Y(intadd_4_A_7_) );
  INVX0_RVT U88 ( .A(n26), .Y(intadd_10_A_4_) );
  INVX0_RVT U89 ( .A(intadd_5_n1), .Y(n104) );
  INVX0_RVT U90 ( .A(intadd_1_n1), .Y(N48) );
  INVX0_RVT U91 ( .A(intadd_2_SUM_7_), .Y(N29) );
  INVX0_RVT U92 ( .A(intadd_4_SUM_6_), .Y(intadd_3_A_1_) );
  INVX0_RVT U93 ( .A(intadd_2_n1), .Y(intadd_3_B_1_) );
  INVX0_RVT U94 ( .A(n25), .Y(intadd_3_B_4_) );
  INVX0_RVT U95 ( .A(intadd_3_n1), .Y(N38) );
  INVX0_RVT U96 ( .A(intadd_0_SUM_5_), .Y(N9) );
  INVX0_RVT U97 ( .A(intadd_0_SUM_6_), .Y(N10) );
  INVX0_RVT U98 ( .A(intadd_0_SUM_7_), .Y(N11) );
  INVX0_RVT U99 ( .A(intadd_0_SUM_8_), .Y(N12) );
  INVX0_RVT U100 ( .A(intadd_0_SUM_9_), .Y(N13) );
  INVX0_RVT U101 ( .A(intadd_0_SUM_10_), .Y(N14) );
  INVX0_RVT U102 ( .A(intadd_0_SUM_11_), .Y(N15) );
  INVX0_RVT U103 ( .A(intadd_0_SUM_12_), .Y(N16) );
  INVX0_RVT U104 ( .A(intadd_0_n1), .Y(intadd_17_B_3_) );
  INVX0_RVT U105 ( .A(intadd_17_n1), .Y(N18) );
  INVX0_RVT U106 ( .A(intadd_2_SUM_0_), .Y(N22) );
  INVX0_RVT U107 ( .A(intadd_0_SUM_0_), .Y(N4) );
  INVX0_RVT U108 ( .A(intadd_2_SUM_1_), .Y(N23) );
  INVX0_RVT U109 ( .A(intadd_0_SUM_1_), .Y(N5) );
  INVX0_RVT U110 ( .A(intadd_2_SUM_2_), .Y(N24) );
  INVX0_RVT U111 ( .A(intadd_2_SUM_3_), .Y(N25) );
  INVX0_RVT U112 ( .A(intadd_2_SUM_4_), .Y(N26) );
  INVX0_RVT U113 ( .A(intadd_0_SUM_2_), .Y(N6) );
  INVX0_RVT U114 ( .A(intadd_0_SUM_3_), .Y(N7) );
  INVX0_RVT U115 ( .A(intadd_2_SUM_5_), .Y(N27) );
  INVX0_RVT U116 ( .A(intadd_0_SUM_4_), .Y(N8) );
  INVX0_RVT U117 ( .A(intadd_2_SUM_6_), .Y(N28) );
  INVX0_RVT U118 ( .A(intadd_6_SUM_1_), .Y(intadd_2_B_1_) );
  INVX0_RVT U119 ( .A(intadd_4_A_4_), .Y(intadd_2_A_3_) );
  AO22X1_RVT U120 ( .A1(intadd_5_n1), .A2(n105), .A3(n104), .A4(intadd_6_n1), 
        .Y(n110) );
  AO22X1_RVT U121 ( .A1(n19), .A2(intadd_13_B_3_), .A3(n110), .A4(
        intadd_5_SUM_5_), .Y(n24) );
  FADDX1_RVT U122 ( .A(intadd_2_A_6_), .B(intadd_6_SUM_5_), .CI(n20), .CO(n23), 
        .S(n18) );
  NAND2X0_RVT U123 ( .A1(x4[0]), .A2(x8[0]), .Y(n27) );
  OAI21X1_RVT U124 ( .A1(x4[0]), .A2(x8[0]), .A3(n27), .Y(intadd_4_CI) );
  OR2X1_RVT U125 ( .A1(x6[6]), .A2(intadd_4_CI), .Y(intadd_13_CI) );
  FADDX1_RVT U126 ( .A(n24), .B(n23), .CI(n22), .CO(n25), .S(n21) );
  AO22X1_RVT U127 ( .A1(s2_1[0]), .A2(x5[0]), .A3(n117), .A4(n124), .Y(
        intadd_4_B_0_) );
  AO222X1_RVT U128 ( .A1(N20), .A2(x6[7]), .A3(N20), .A4(intadd_4_B_1_), .A5(
        x6[7]), .A6(intadd_4_B_1_), .Y(n107) );
  OR2X1_RVT U129 ( .A1(x6[1]), .A2(n107), .Y(n103) );
  NAND2X0_RVT U130 ( .A1(x6[2]), .A2(n103), .Y(n102) );
  FADDX1_RVT U131 ( .A(x6[7]), .B(intadd_2_A_6_), .CI(intadd_5_n1), .CO(n111), 
        .S(n26) );
  OAI222X1_RVT U132 ( .A1(n104), .A2(intadd_6_n1), .A3(n104), .A4(n111), .A5(
        intadd_6_n1), .A6(n111), .Y(intadd_3_B_7_) );
  NAND2X0_RVT U133 ( .A1(x11[0]), .A2(x1[0]), .Y(n30) );
  OA21X1_RVT U134 ( .A1(x11[0]), .A2(x1[0]), .A3(n30), .Y(n87) );
  NAND2X0_RVT U135 ( .A1(x9[0]), .A2(x3[0]), .Y(n29) );
  OA21X1_RVT U136 ( .A1(x9[0]), .A2(x3[0]), .A3(n29), .Y(n65) );
  AND2X1_RVT U137 ( .A1(n87), .A2(n86), .Y(intadd_0_CI) );
  INVX0_RVT U138 ( .A(n87), .Y(n78) );
  AO21X1_RVT U139 ( .A1(n65), .A2(n78), .A3(intadd_0_CI), .Y(N3) );
  NAND2X0_RVT U140 ( .A1(x0[0]), .A2(x12[0]), .Y(n56) );
  OA21X1_RVT U141 ( .A1(s2_1[1]), .A2(s2_0[1]), .A3(s2_1[0]), .Y(n31) );
  AO22X1_RVT U142 ( .A1(s2_1[1]), .A2(s2_0[1]), .A3(s2_0[0]), .A4(n31), .Y(n32) );
  AO222X1_RVT U143 ( .A1(s2_0[2]), .A2(s2_1[2]), .A3(s2_0[2]), .A4(n32), .A5(
        s2_1[2]), .A6(n32), .Y(n33) );
  AO222X1_RVT U144 ( .A1(s2_0[3]), .A2(s2_1[3]), .A3(s2_0[3]), .A4(n33), .A5(
        s2_1[3]), .A6(n33), .Y(n34) );
  AO222X1_RVT U145 ( .A1(s2_0[4]), .A2(s2_1[4]), .A3(s2_0[4]), .A4(n34), .A5(
        s2_1[4]), .A6(n34), .Y(n35) );
  AO222X1_RVT U146 ( .A1(s2_0[5]), .A2(s2_1[5]), .A3(s2_0[5]), .A4(n35), .A5(
        s2_1[5]), .A6(n35), .Y(n36) );
  AO222X1_RVT U147 ( .A1(s2_0[6]), .A2(s2_1[6]), .A3(s2_0[6]), .A4(n36), .A5(
        s2_1[6]), .A6(n36), .Y(n37) );
  AO222X1_RVT U148 ( .A1(s2_0[7]), .A2(s2_1[7]), .A3(s2_0[7]), .A4(n37), .A5(
        s2_1[7]), .A6(n37), .Y(n38) );
  AO222X1_RVT U149 ( .A1(s2_0[8]), .A2(s2_1[8]), .A3(s2_0[8]), .A4(n38), .A5(
        s2_1[8]), .A6(n38), .Y(intadd_1_CI) );
  FADDX1_RVT U150 ( .A(intadd_9_n1), .B(n44), .CI(n39), .CO(intadd_17_A_3_), 
        .S(intadd_17_A_2_) );
  NAND2X0_RVT U151 ( .A1(intadd_8_SUM_6_), .A2(n44), .Y(n40) );
  AO22X1_RVT U152 ( .A1(intadd_7_SUM_6_), .A2(intadd_14_A_1_), .A3(n49), .A4(
        n40), .Y(intadd_17_B_2_) );
  NAND2X0_RVT U153 ( .A1(intadd_8_SUM_5_), .A2(intadd_18_A_1_), .Y(n54) );
  AO22X1_RVT U154 ( .A1(intadd_9_SUM_5_), .A2(n42), .A3(n54), .A4(n53), .Y(
        intadd_17_B_1_) );
  AND2X1_RVT U155 ( .A1(intadd_8_SUM_1_), .A2(intadd_0_A_0_), .Y(n79) );
  OA22X1_RVT U156 ( .A1(n79), .A2(intadd_7_SUM_0_), .A3(intadd_8_SUM_1_), .A4(
        intadd_0_A_0_), .Y(intadd_19_B_0_) );
  AO222X1_RVT U157 ( .A1(intadd_8_n1), .A2(intadd_19_n1), .A3(intadd_8_n1), 
        .A4(n58), .A5(intadd_19_n1), .A6(n58), .Y(n52) );
  FADDX1_RVT U158 ( .A(n42), .B(intadd_18_A_0_), .CI(intadd_7_SUM_4_), .CO(n28), .S(n60) );
  INVX0_RVT U159 ( .A(n40), .Y(n41) );
  OA22X1_RVT U160 ( .A1(n60), .A2(n41), .A3(intadd_8_SUM_6_), .A4(n44), .Y(n51) );
  AO22X1_RVT U161 ( .A1(intadd_8_SUM_5_), .A2(intadd_9_SUM_5_), .A3(n42), .A4(
        intadd_18_A_1_), .Y(n72) );
  AO22X1_RVT U162 ( .A1(n72), .A2(n53), .A3(n43), .A4(intadd_7_SUM_5_), .Y(n50) );
  AO22X1_RVT U163 ( .A1(intadd_7_SUM_6_), .A2(intadd_8_SUM_6_), .A3(n44), .A4(
        intadd_14_A_1_), .Y(n59) );
  AO22X1_RVT U164 ( .A1(intadd_8_n1), .A2(n45), .A3(n49), .A4(n59), .Y(n46) );
  FADDX1_RVT U165 ( .A(n48), .B(n47), .CI(n46), .CO(intadd_0_B_12_), .S(
        intadd_0_A_11_) );
  AO22X1_RVT U166 ( .A1(intadd_9_n1), .A2(intadd_8_n1), .A3(n58), .A4(n49), 
        .Y(n93) );
  HADDX1_RVT U167 ( .A0(n93), .B0(intadd_19_n1), .SO(intadd_14_B_2_) );
  FADDX1_RVT U168 ( .A(n52), .B(n51), .CI(n50), .CO(n48), .S(intadd_14_B_3_)
         );
  FADDX1_RVT U169 ( .A(n53), .B(intadd_8_SUM_4_), .CI(intadd_19_SUM_2_), .CO(
        intadd_14_A_2_), .S(n75) );
  INVX0_RVT U170 ( .A(n54), .Y(n55) );
  OA22X1_RVT U171 ( .A1(n55), .A2(n71), .A3(intadd_8_SUM_5_), .A4(
        intadd_18_A_1_), .Y(n74) );
  OA21X1_RVT U172 ( .A1(x0[0]), .A2(x12[0]), .A3(n56), .Y(n67) );
  AO222X1_RVT U173 ( .A1(n67), .A2(intadd_0_B_0_), .A3(n67), .A4(n86), .A5(
        intadd_0_B_0_), .A6(n86), .Y(n69) );
  AO22X1_RVT U174 ( .A1(intadd_8_SUM_1_), .A2(intadd_9_SUM_0_), .A3(n94), .A4(
        intadd_0_A_0_), .Y(n98) );
  INVX0_RVT U175 ( .A(n98), .Y(n57) );
  AO22X1_RVT U176 ( .A1(n98), .A2(n77), .A3(n57), .A4(intadd_7_SUM_0_), .Y(n68) );
  AO222X1_RVT U177 ( .A1(intadd_8_n1), .A2(n92), .A3(intadd_8_n1), .A4(n58), 
        .A5(n92), .A6(n58), .Y(n73) );
  HADDX1_RVT U178 ( .A0(n60), .B0(n59), .SO(n61) );
  FADDX1_RVT U179 ( .A(n62), .B(intadd_14_SUM_2_), .CI(n61), .CO(
        intadd_0_B_10_), .S(intadd_0_A_9_) );
  FADDX1_RVT U180 ( .A(n63), .B(intadd_8_SUM_2_), .CI(intadd_19_SUM_0_), .CO(
        n71), .S(intadd_15_A_1_) );
  NAND2X0_RVT U181 ( .A1(intadd_8_SUM_3_), .A2(intadd_19_A_2_), .Y(n83) );
  AND2X1_RVT U182 ( .A1(n87), .A2(n77), .Y(n81) );
  HADDX1_RVT U183 ( .A0(n67), .B0(intadd_0_B_0_), .SO(n99) );
  INVX0_RVT U184 ( .A(n99), .Y(n64) );
  AO22X1_RVT U185 ( .A1(n65), .A2(n99), .A3(n86), .A4(n64), .Y(n80) );
  OA22X1_RVT U186 ( .A1(intadd_8_SUM_3_), .A2(intadd_19_A_2_), .A3(n89), .A4(
        n84), .Y(intadd_15_B_1_) );
  NAND2X0_RVT U187 ( .A1(intadd_8_SUM_2_), .A2(intadd_19_A_1_), .Y(n90) );
  INVX0_RVT U188 ( .A(intadd_0_B_0_), .Y(n66) );
  NAND2X0_RVT U189 ( .A1(n67), .A2(n66), .Y(n76) );
  OA22X1_RVT U190 ( .A1(intadd_8_SUM_2_), .A2(intadd_19_A_1_), .A3(n88), .A4(
        n91), .Y(intadd_15_B_0_) );
  FADDX1_RVT U191 ( .A(n70), .B(n69), .CI(n68), .CO(n85), .S(intadd_15_CI) );
  HADDX1_RVT U192 ( .A0(n72), .B0(n71), .SO(intadd_15_B_2_) );
  FADDX1_RVT U193 ( .A(n75), .B(n74), .CI(n73), .CO(n62), .S(intadd_15_B_3_)
         );
  FADDX1_RVT U194 ( .A(intadd_0_A_1_), .B(intadd_8_SUM_1_), .CI(n76), .CO(n91), 
        .S(intadd_12_A_0_) );
  AO22X1_RVT U195 ( .A1(n87), .A2(intadd_7_SUM_0_), .A3(n78), .A4(n77), .Y(
        intadd_12_B_0_) );
  OA22X1_RVT U196 ( .A1(n79), .A2(n99), .A3(intadd_8_SUM_1_), .A4(
        intadd_0_A_0_), .Y(intadd_12_CI) );
  FADDX1_RVT U197 ( .A(n82), .B(n81), .CI(n80), .CO(n84), .S(intadd_12_B_1_)
         );
  OA21X1_RVT U198 ( .A1(intadd_8_SUM_3_), .A2(intadd_19_A_2_), .A3(n83), .Y(
        n100) );
  HADDX1_RVT U199 ( .A0(n100), .B0(n84), .SO(intadd_12_B_2_) );
  FADDX1_RVT U200 ( .A(intadd_18_A_0_), .B(intadd_8_SUM_4_), .CI(n85), .CO(n92), .S(intadd_12_B_3_) );
  OA22X1_RVT U201 ( .A1(n87), .A2(n86), .A3(intadd_0_CI), .A4(n94), .Y(n97) );
  OA22X1_RVT U202 ( .A1(intadd_8_SUM_2_), .A2(intadd_19_A_1_), .A3(n88), .A4(
        n97), .Y(n101) );
  OA22X1_RVT U203 ( .A1(intadd_8_SUM_3_), .A2(intadd_19_A_2_), .A3(n89), .A4(
        n101), .Y(intadd_18_B_0_) );
  OA21X1_RVT U204 ( .A1(intadd_8_SUM_2_), .A2(intadd_19_A_1_), .A3(n90), .Y(
        n96) );
  HADDX1_RVT U205 ( .A0(n96), .B0(n91), .SO(intadd_18_CI) );
  HADDX1_RVT U206 ( .A0(n93), .B0(n92), .SO(intadd_12_B_4_) );
  INVX0_RVT U207 ( .A(N3), .Y(n95) );
  AO22X1_RVT U208 ( .A1(intadd_8_SUM_1_), .A2(n95), .A3(n94), .A4(N3), .Y(
        intadd_0_B_1_) );
  HADDX1_RVT U209 ( .A0(n97), .B0(n96), .SO(intadd_0_A_2_) );
  HADDX1_RVT U210 ( .A0(n99), .B0(n98), .SO(intadd_0_B_2_) );
  HADDX1_RVT U211 ( .A0(n101), .B0(n100), .SO(intadd_0_B_3_) );
  AND2X1_RVT U212 ( .A1(s2_1[0]), .A2(x5[0]), .Y(intadd_6_CI) );
  OA21X1_RVT U213 ( .A1(x6[2]), .A2(n103), .A3(n102), .Y(intadd_11_B_0_) );
  AO222X1_RVT U214 ( .A1(intadd_5_SUM_5_), .A2(n105), .A3(intadd_5_SUM_5_), 
        .A4(n104), .A5(n105), .A6(n104), .Y(n106) );
  FADDX1_RVT U215 ( .A(intadd_5_n1), .B(n106), .CI(intadd_5_SUM_6_), .CO(
        intadd_10_B_4_), .S(intadd_11_B_4_) );
  AO22X1_RVT U216 ( .A1(N20), .A2(intadd_4_B_1_), .A3(n125), .A4(intadd_4_B_0_), .Y(n113) );
  HADDX1_RVT U217 ( .A0(x6[7]), .B0(n113), .SO(intadd_13_A_0_) );
  HADDX1_RVT U218 ( .A0(x6[1]), .B0(n107), .SO(n108) );
  FADDX1_RVT U219 ( .A(n108), .B(intadd_4_A_2_), .CI(intadd_2_B_0_), .CO(
        intadd_13_B_2_), .S(intadd_13_B_1_) );
  NAND2X0_RVT U220 ( .A1(x6[6]), .A2(intadd_4_CI), .Y(n109) );
  NAND2X0_RVT U221 ( .A1(intadd_13_CI), .A2(n109), .Y(intadd_4_B_2_) );
  AO222X1_RVT U222 ( .A1(N20), .A2(x6[1]), .A3(N20), .A4(intadd_4_B_0_), .A5(
        x6[1]), .A6(intadd_4_B_0_), .Y(intadd_2_CI) );
  HADDX1_RVT U223 ( .A0(n111), .B0(n110), .SO(intadd_3_B_6_) );
  INVX0_RVT U224 ( .A(n113), .Y(n112) );
  AO22X1_RVT U225 ( .A1(x6[1]), .A2(n113), .A3(n133), .A4(n112), .Y(N21) );
  NAND2X0_RVT U226 ( .A1(acc[17]), .A2(acc[16]), .Y(n114) );
  NAND2X0_RVT U227 ( .A1(acc[19]), .A2(n114), .Y(n116) );
  AO222X1_RVT U228 ( .A1(n131), .A2(acc[16]), .A3(n131), .A4(acc[17]), .A5(
        n131), .A6(acc[19]), .Y(n115) );
  AO21X1_RVT U229 ( .A1(acc[9]), .A2(n116), .A3(n115), .Y(clip[0]) );
  AO21X1_RVT U230 ( .A1(acc[10]), .A2(n116), .A3(n115), .Y(clip[1]) );
  AO21X1_RVT U231 ( .A1(acc[11]), .A2(n116), .A3(n115), .Y(clip[2]) );
  AO21X1_RVT U232 ( .A1(acc[12]), .A2(n116), .A3(n115), .Y(clip[3]) );
  AO21X1_RVT U233 ( .A1(acc[13]), .A2(n116), .A3(n115), .Y(clip[4]) );
  AO21X1_RVT U234 ( .A1(acc[14]), .A2(n116), .A3(n115), .Y(clip[5]) );
  AO21X1_RVT U235 ( .A1(acc[15]), .A2(n116), .A3(n115), .Y(clip[6]) );
endmodule

