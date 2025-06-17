/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : S-2021.06-SP5-5
// Date      : Mon Jun 16 19:12:28 2025
/////////////////////////////////////////////////////////////


module fir13_filter ( clk, n_rst, x_in, y_out );
  input [7:0] x_in;
  output [7:0] y_out;
  input clk, n_rst;
  wire   N0, N1, N2, p0_16, p1_16, p6_16, s1_0_17, s1_1_17, N3, N4, N5, N6, N7,
         N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21,
         N22, N23, N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35,
         N36, N37, N38, N39, N40, N41, N42, N43, N44, N45, N46, N47, N48, N49,
         N50, N51, N52, N53, N54, N55, N56, N57, N58, N59,
         SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4,
         SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6,
         SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8,
         SYNOPSYS_UNCONNECTED_9;
  wire   [7:0] x0;
  wire   [7:0] x1;
  wire   [7:0] x2;
  wire   [7:0] x3;
  wire   [7:0] x4;
  wire   [7:0] x5;
  wire   [7:0] x6;
  wire   [7:0] x7;
  wire   [7:0] x8;
  wire   [7:0] x9;
  wire   [7:0] x10;
  wire   [7:0] x11;
  wire   [7:0] x12;
  wire   [8:0] sum0;
  wire   [8:0] sum1;
  wire   [8:0] sum3;
  wire   [8:0] sum4;
  wire   [8:0] sum5;
  wire   [13:0] p0;
  wire   [13:0] p1;
  wire   [16:0] p4;
  wire   [16:0] p5;
  wire   [14:0] p6;
  wire   [14:0] s1_0;
  wire   [14:0] s1_1;
  wire   [17:0] s1_2;
  wire   [18:0] s2_0;
  wire   [18:0] s2_1;
  wire   [19:9] acc;
  wire   [7:0] clip;

  \**SEQGEN**  x11_reg_7_ ( .clear(N2), .preset(1'b0), .next_state(x10[7]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x11[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x11_reg_6_ ( .clear(N2), .preset(1'b0), .next_state(x10[6]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x11[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x11_reg_5_ ( .clear(N2), .preset(1'b0), .next_state(x10[5]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x11[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x11_reg_4_ ( .clear(N2), .preset(1'b0), .next_state(x10[4]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x11[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x11_reg_3_ ( .clear(N2), .preset(1'b0), .next_state(x10[3]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x11[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x11_reg_2_ ( .clear(N2), .preset(1'b0), .next_state(x10[2]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x11[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x11_reg_1_ ( .clear(N2), .preset(1'b0), .next_state(x10[1]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x11[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x11_reg_0_ ( .clear(N2), .preset(1'b0), .next_state(x10[0]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x11[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x12_reg_7_ ( .clear(N2), .preset(1'b0), .next_state(x11[7]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x12[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x12_reg_6_ ( .clear(N2), .preset(1'b0), .next_state(x11[6]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x12[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x12_reg_5_ ( .clear(N2), .preset(1'b0), .next_state(x11[5]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x12[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x12_reg_4_ ( .clear(N2), .preset(1'b0), .next_state(x11[4]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x12[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x12_reg_3_ ( .clear(N2), .preset(1'b0), .next_state(x11[3]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x12[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x12_reg_2_ ( .clear(N2), .preset(1'b0), .next_state(x11[2]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x12[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x12_reg_1_ ( .clear(N2), .preset(1'b0), .next_state(x11[1]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x12[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x12_reg_0_ ( .clear(N2), .preset(1'b0), .next_state(x11[0]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x12[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x0_reg_7_ ( .clear(N2), .preset(1'b0), .next_state(x_in[7]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x0[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x0_reg_6_ ( .clear(N2), .preset(1'b0), .next_state(x_in[6]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x0[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x0_reg_5_ ( .clear(N2), .preset(1'b0), .next_state(x_in[5]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x0[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x0_reg_4_ ( .clear(N2), .preset(1'b0), .next_state(x_in[4]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x0[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x0_reg_3_ ( .clear(N2), .preset(1'b0), .next_state(x_in[3]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x0[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x0_reg_2_ ( .clear(N2), .preset(1'b0), .next_state(x_in[2]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x0[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x0_reg_1_ ( .clear(N2), .preset(1'b0), .next_state(x_in[1]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x0[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x0_reg_0_ ( .clear(N2), .preset(1'b0), .next_state(x_in[0]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x0[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x1_reg_7_ ( .clear(N2), .preset(1'b0), .next_state(x0[7]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x1[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x1_reg_6_ ( .clear(N2), .preset(1'b0), .next_state(x0[6]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x1[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x1_reg_5_ ( .clear(N2), .preset(1'b0), .next_state(x0[5]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x1[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x1_reg_4_ ( .clear(N2), .preset(1'b0), .next_state(x0[4]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x1[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x1_reg_3_ ( .clear(N2), .preset(1'b0), .next_state(x0[3]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x1[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x1_reg_2_ ( .clear(N2), .preset(1'b0), .next_state(x0[2]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x1[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x1_reg_1_ ( .clear(N2), .preset(1'b0), .next_state(x0[1]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x1[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x1_reg_0_ ( .clear(N2), .preset(1'b0), .next_state(x0[0]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x1[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x2_reg_7_ ( .clear(N2), .preset(1'b0), .next_state(x1[7]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x2[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x2_reg_6_ ( .clear(N2), .preset(1'b0), .next_state(x1[6]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x2[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x2_reg_5_ ( .clear(N2), .preset(1'b0), .next_state(x1[5]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x2[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x2_reg_4_ ( .clear(N2), .preset(1'b0), .next_state(x1[4]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x2[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x2_reg_3_ ( .clear(N2), .preset(1'b0), .next_state(x1[3]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x2[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x2_reg_2_ ( .clear(N2), .preset(1'b0), .next_state(x1[2]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x2[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x2_reg_1_ ( .clear(N2), .preset(1'b0), .next_state(x1[1]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x2[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x2_reg_0_ ( .clear(N2), .preset(1'b0), .next_state(x1[0]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x2[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x3_reg_7_ ( .clear(N2), .preset(1'b0), .next_state(x2[7]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x3[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x3_reg_6_ ( .clear(N2), .preset(1'b0), .next_state(x2[6]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x3[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x3_reg_5_ ( .clear(N2), .preset(1'b0), .next_state(x2[5]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x3[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x3_reg_4_ ( .clear(N2), .preset(1'b0), .next_state(x2[4]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x3[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x3_reg_3_ ( .clear(N2), .preset(1'b0), .next_state(x2[3]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x3[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x3_reg_2_ ( .clear(N2), .preset(1'b0), .next_state(x2[2]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x3[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x3_reg_1_ ( .clear(N2), .preset(1'b0), .next_state(x2[1]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x3[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x3_reg_0_ ( .clear(N2), .preset(1'b0), .next_state(x2[0]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x3[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x4_reg_7_ ( .clear(N2), .preset(1'b0), .next_state(x3[7]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x4[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x4_reg_6_ ( .clear(N2), .preset(1'b0), .next_state(x3[6]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x4[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x4_reg_5_ ( .clear(N2), .preset(1'b0), .next_state(x3[5]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x4[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x4_reg_4_ ( .clear(N2), .preset(1'b0), .next_state(x3[4]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x4[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x4_reg_3_ ( .clear(N2), .preset(1'b0), .next_state(x3[3]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x4[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x4_reg_2_ ( .clear(N2), .preset(1'b0), .next_state(x3[2]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x4[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x4_reg_1_ ( .clear(N2), .preset(1'b0), .next_state(x3[1]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x4[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x4_reg_0_ ( .clear(N2), .preset(1'b0), .next_state(x3[0]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x4[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x5_reg_7_ ( .clear(N2), .preset(1'b0), .next_state(x4[7]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x5[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x5_reg_6_ ( .clear(N2), .preset(1'b0), .next_state(x4[6]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x5[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x5_reg_5_ ( .clear(N2), .preset(1'b0), .next_state(x4[5]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x5[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x5_reg_4_ ( .clear(N2), .preset(1'b0), .next_state(x4[4]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x5[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x5_reg_3_ ( .clear(N2), .preset(1'b0), .next_state(x4[3]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x5[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x5_reg_2_ ( .clear(N2), .preset(1'b0), .next_state(x4[2]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x5[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x5_reg_1_ ( .clear(N2), .preset(1'b0), .next_state(x4[1]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x5[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x5_reg_0_ ( .clear(N2), .preset(1'b0), .next_state(x4[0]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x5[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x6_reg_7_ ( .clear(N2), .preset(1'b0), .next_state(x5[7]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x6[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x6_reg_6_ ( .clear(N2), .preset(1'b0), .next_state(x5[6]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x6[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x6_reg_5_ ( .clear(N2), .preset(1'b0), .next_state(x5[5]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x6[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x6_reg_4_ ( .clear(N2), .preset(1'b0), .next_state(x5[4]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x6[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x6_reg_3_ ( .clear(N2), .preset(1'b0), .next_state(x5[3]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x6[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x6_reg_2_ ( .clear(N2), .preset(1'b0), .next_state(x5[2]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x6[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x6_reg_1_ ( .clear(N2), .preset(1'b0), .next_state(x5[1]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x6[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x6_reg_0_ ( .clear(N2), .preset(1'b0), .next_state(x5[0]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x6[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x7_reg_7_ ( .clear(N2), .preset(1'b0), .next_state(x6[7]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x7[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x7_reg_6_ ( .clear(N2), .preset(1'b0), .next_state(x6[6]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x7[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x7_reg_5_ ( .clear(N2), .preset(1'b0), .next_state(x6[5]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x7[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x7_reg_4_ ( .clear(N2), .preset(1'b0), .next_state(x6[4]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x7[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x7_reg_3_ ( .clear(N2), .preset(1'b0), .next_state(x6[3]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x7[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x7_reg_2_ ( .clear(N2), .preset(1'b0), .next_state(x6[2]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x7[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x7_reg_1_ ( .clear(N2), .preset(1'b0), .next_state(x6[1]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x7[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x7_reg_0_ ( .clear(N2), .preset(1'b0), .next_state(x6[0]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x7[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x8_reg_7_ ( .clear(N2), .preset(1'b0), .next_state(x7[7]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x8[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x8_reg_6_ ( .clear(N2), .preset(1'b0), .next_state(x7[6]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x8[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x8_reg_5_ ( .clear(N2), .preset(1'b0), .next_state(x7[5]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x8[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x8_reg_4_ ( .clear(N2), .preset(1'b0), .next_state(x7[4]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x8[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x8_reg_3_ ( .clear(N2), .preset(1'b0), .next_state(x7[3]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x8[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x8_reg_2_ ( .clear(N2), .preset(1'b0), .next_state(x7[2]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x8[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x8_reg_1_ ( .clear(N2), .preset(1'b0), .next_state(x7[1]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x8[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x8_reg_0_ ( .clear(N2), .preset(1'b0), .next_state(x7[0]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x8[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x9_reg_7_ ( .clear(N2), .preset(1'b0), .next_state(x8[7]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x9[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x9_reg_6_ ( .clear(N2), .preset(1'b0), .next_state(x8[6]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x9[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x9_reg_5_ ( .clear(N2), .preset(1'b0), .next_state(x8[5]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x9[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x9_reg_4_ ( .clear(N2), .preset(1'b0), .next_state(x8[4]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x9[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x9_reg_3_ ( .clear(N2), .preset(1'b0), .next_state(x8[3]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x9[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x9_reg_2_ ( .clear(N2), .preset(1'b0), .next_state(x8[2]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x9[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x9_reg_1_ ( .clear(N2), .preset(1'b0), .next_state(x8[1]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x9[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x9_reg_0_ ( .clear(N2), .preset(1'b0), .next_state(x8[0]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x9[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x10_reg_7_ ( .clear(N2), .preset(1'b0), .next_state(x9[7]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x10[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x10_reg_6_ ( .clear(N2), .preset(1'b0), .next_state(x9[6]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x10[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x10_reg_5_ ( .clear(N2), .preset(1'b0), .next_state(x9[5]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x10[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x10_reg_4_ ( .clear(N2), .preset(1'b0), .next_state(x9[4]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x10[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x10_reg_3_ ( .clear(N2), .preset(1'b0), .next_state(x9[3]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x10[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x10_reg_2_ ( .clear(N2), .preset(1'b0), .next_state(x9[2]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x10[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x10_reg_1_ ( .clear(N2), .preset(1'b0), .next_state(x9[1]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x10[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x10_reg_0_ ( .clear(N2), .preset(1'b0), .next_state(x9[0]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x10[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_0_reg_18_ ( .clear(N2), .preset(1'b0), .next_state(N19), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_0[18]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_0_reg_17_ ( .clear(N2), .preset(1'b0), .next_state(N19), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_0[17]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_0_reg_16_ ( .clear(N2), .preset(1'b0), .next_state(N19), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_0[16]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_0_reg_15_ ( .clear(N2), .preset(1'b0), .next_state(N18), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_0[15]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_0_reg_14_ ( .clear(N2), .preset(1'b0), .next_state(N17), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_0[14]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_0_reg_13_ ( .clear(N2), .preset(1'b0), .next_state(N16), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_0[13]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_0_reg_12_ ( .clear(N2), .preset(1'b0), .next_state(N15), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_0[12]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_0_reg_11_ ( .clear(N2), .preset(1'b0), .next_state(N14), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_0[11]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_0_reg_10_ ( .clear(N2), .preset(1'b0), .next_state(N13), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_0[10]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_0_reg_9_ ( .clear(N2), .preset(1'b0), .next_state(N12), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_0[9]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_0_reg_8_ ( .clear(N2), .preset(1'b0), .next_state(N11), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_0[8]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_0_reg_7_ ( .clear(N2), .preset(1'b0), .next_state(N10), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_0[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_0_reg_6_ ( .clear(N2), .preset(1'b0), .next_state(N9), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_0[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_0_reg_5_ ( .clear(N2), .preset(1'b0), .next_state(N8), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_0[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_0_reg_4_ ( .clear(N2), .preset(1'b0), .next_state(N7), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_0[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_0_reg_3_ ( .clear(N2), .preset(1'b0), .next_state(N6), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_0[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_0_reg_2_ ( .clear(N2), .preset(1'b0), .next_state(N5), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_0[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_0_reg_1_ ( .clear(N2), .preset(1'b0), .next_state(N4), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_0[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_0_reg_0_ ( .clear(N2), .preset(1'b0), .next_state(N3), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_0[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_1_reg_18_ ( .clear(N2), .preset(1'b0), .next_state(N38), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_1[18]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_1_reg_17_ ( .clear(N2), .preset(1'b0), .next_state(N37), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_1[17]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_1_reg_16_ ( .clear(N2), .preset(1'b0), .next_state(N36), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_1[16]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_1_reg_15_ ( .clear(N2), .preset(1'b0), .next_state(N35), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_1[15]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_1_reg_14_ ( .clear(N2), .preset(1'b0), .next_state(N34), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_1[14]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_1_reg_13_ ( .clear(N2), .preset(1'b0), .next_state(N33), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_1[13]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_1_reg_12_ ( .clear(N2), .preset(1'b0), .next_state(N32), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_1[12]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_1_reg_11_ ( .clear(N2), .preset(1'b0), .next_state(N31), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_1[11]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_1_reg_10_ ( .clear(N2), .preset(1'b0), .next_state(N30), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_1[10]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_1_reg_9_ ( .clear(N2), .preset(1'b0), .next_state(N29), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_1[9]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_1_reg_8_ ( .clear(N2), .preset(1'b0), .next_state(N28), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_1[8]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_1_reg_7_ ( .clear(N2), .preset(1'b0), .next_state(N27), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_1[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_1_reg_6_ ( .clear(N2), .preset(1'b0), .next_state(N26), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_1[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_1_reg_5_ ( .clear(N2), .preset(1'b0), .next_state(N25), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_1[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_1_reg_4_ ( .clear(N2), .preset(1'b0), .next_state(N24), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_1[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_1_reg_3_ ( .clear(N2), .preset(1'b0), .next_state(N23), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_1[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_1_reg_2_ ( .clear(N2), .preset(1'b0), .next_state(N22), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_1[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_1_reg_1_ ( .clear(N2), .preset(1'b0), .next_state(N21), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_1[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  s2_1_reg_0_ ( .clear(N2), .preset(1'b0), .next_state(N20), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(s2_1[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  acc_reg_19_ ( .clear(N2), .preset(1'b0), .next_state(N49), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(acc[19]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  acc_reg_18_ ( .clear(N2), .preset(1'b0), .next_state(N48), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(acc[18]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  acc_reg_17_ ( .clear(N2), .preset(1'b0), .next_state(N47), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(acc[17]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  acc_reg_16_ ( .clear(N2), .preset(1'b0), .next_state(N46), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(acc[16]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  acc_reg_15_ ( .clear(N2), .preset(1'b0), .next_state(N45), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(acc[15]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  acc_reg_14_ ( .clear(N2), .preset(1'b0), .next_state(N44), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(acc[14]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  acc_reg_13_ ( .clear(N2), .preset(1'b0), .next_state(N43), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(acc[13]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  acc_reg_12_ ( .clear(N2), .preset(1'b0), .next_state(N42), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(acc[12]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  acc_reg_11_ ( .clear(N2), .preset(1'b0), .next_state(N41), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(acc[11]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  acc_reg_10_ ( .clear(N2), .preset(1'b0), .next_state(N40), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(acc[10]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  acc_reg_9_ ( .clear(N2), .preset(1'b0), .next_state(N39), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(acc[9]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  y_out_reg_7_ ( .clear(N2), .preset(1'b0), .next_state(clip[7]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(y_out[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  y_out_reg_6_ ( .clear(N2), .preset(1'b0), .next_state(clip[6]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(y_out[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  y_out_reg_5_ ( .clear(N2), .preset(1'b0), .next_state(clip[5]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(y_out[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  y_out_reg_4_ ( .clear(N2), .preset(1'b0), .next_state(clip[4]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(y_out[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  y_out_reg_3_ ( .clear(N2), .preset(1'b0), .next_state(clip[3]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(y_out[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  y_out_reg_2_ ( .clear(N2), .preset(1'b0), .next_state(clip[2]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(y_out[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  y_out_reg_1_ ( .clear(N2), .preset(1'b0), .next_state(clip[1]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(y_out[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  y_out_reg_0_ ( .clear(N2), .preset(1'b0), .next_state(clip[0]), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(y_out[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  GTECH_AND2 C385 ( .A(acc[17]), .B(acc[18]), .Z(N54) );
  GTECH_AND2 C386 ( .A(acc[16]), .B(N54), .Z(N55) );
  GTECH_NOT I_0 ( .A(N55), .Z(N56) );
  GTECH_NOT I_1 ( .A(acc[19]), .Z(N57) );
  GTECH_OR2 C389 ( .A(acc[17]), .B(acc[18]), .Z(N58) );
  GTECH_OR2 C390 ( .A(acc[16]), .B(N58), .Z(N59) );
  ADD_TC_OP add_35 ( .A(x0), .B(x12), .Z(sum0) );
  ADD_TC_OP add_36 ( .A(x1), .B(x11), .Z(sum1) );
  ADD_TC_OP add_38 ( .A(x3), .B(x9), .Z(sum3) );
  ADD_TC_OP add_39 ( .A(x4), .B(x8), .Z(sum4) );
  ADD_TC_OP add_40 ( .A(x5), .B(x7), .Z(sum5) );
  MULT_TC_OP mult_43 ( .A({1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .B(sum0), .Z(
        {p0_16, p0}) );
  MULT_TC_OP mult_44 ( .A({1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b1}), .B(sum1), .Z(
        {p1_16, p1}) );
  MULT_TC_OP mult_46 ( .A({1'b0, 1'b1, 1'b0, 1'b0, 1'b1, 1'b0, 1'b1}), .B(sum3), .Z({s1_1_17, s1_1}) );
  MULT_TC_OP mult_47 ( .A({1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .B(sum4), .Z(p4) );
  MULT_TC_OP mult_48 ( .A({1'b0, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 1'b1, 1'b0}), 
        .B(sum5), .Z(p5) );
  MULT_TC_OP mult_49 ( .A({1'b0, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}), 
        .B(x6), .Z({p6_16, p6}) );
  ADD_TC_OP add_73 ( .A(s2_0), .B(s2_1), .Z({N49, N48, N47, N46, N45, N44, N43, 
        N42, N41, N40, N39, SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2, 
        SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4, SYNOPSYS_UNCONNECTED_5, 
        SYNOPSYS_UNCONNECTED_6, SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8, 
        SYNOPSYS_UNCONNECTED_9}) );
  ADD_TC_OP add_52 ( .A({p0_16, p0}), .B({p1_16, p1}), .Z({s1_0_17, s1_0}) );
  ADD_TC_OP add_54 ( .A(p4), .B(p5), .Z(s1_2) );
  ADD_TC_OP add_62 ( .A({s1_0_17, s1_0}), .B({s1_1_17, s1_1}), .Z({N19, N18, 
        N17, N16, N15, N14, N13, N12, N11, N10, N9, N8, N7, N6, N5, N4, N3})
         );
  ADD_TC_OP add_63 ( .A(s1_2), .B({p6_16, p6}), .Z({N38, N37, N36, N35, N34, 
        N33, N32, N31, N30, N29, N28, N27, N26, N25, N24, N23, N22, N21, N20})
         );
  SELECT_OP C393 ( .DATA1({1'b0, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}), 
        .DATA2({1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .DATA3({
        acc[19], acc[15:9]}), .CONTROL1(N0), .CONTROL2(N1), .CONTROL3(N53), 
        .Z(clip) );
  GTECH_BUF B_0 ( .A(N50), .Z(N0) );
  GTECH_BUF B_1 ( .A(N51), .Z(N1) );
  GTECH_NOT I_2 ( .A(n_rst), .Z(N2) );
  GTECH_BUF B_2 ( .A(n_rst) );
  GTECH_AND2 C400 ( .A(N57), .B(N59), .Z(N50) );
  GTECH_AND2 C401 ( .A(acc[19]), .B(N56), .Z(N51) );
  GTECH_OR2 C404 ( .A(N51), .B(N50), .Z(N52) );
  GTECH_NOT I_3 ( .A(N52), .Z(N53) );
endmodule

