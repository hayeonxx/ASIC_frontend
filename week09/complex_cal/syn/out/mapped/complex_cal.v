/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : S-2021.06-SP5-5
// Date      : Mon May 26 14:48:58 2025
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
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21;

  INVX1_RVT U1 ( .A(n11), .Y(add_dout_re[7]) );
  INVX1_RVT U2 ( .A(n21), .Y(add_dout_im[7]) );
  INVX0_RVT U3 ( .A(re_1[7]), .Y(n9) );
  INVX0_RVT U4 ( .A(im_2[7]), .Y(n20) );
  AND2X1_RVT U5 ( .A1(re_1[0]), .A2(re_2[0]), .Y(n6) );
  FADDX1_RVT U6 ( .A(re_2[5]), .B(re_1[5]), .CI(n2), .CO(n7), .S(
        add_dout_re[4]) );
  FADDX1_RVT U7 ( .A(re_2[4]), .B(re_1[4]), .CI(n3), .CO(n2), .S(
        add_dout_re[3]) );
  FADDX1_RVT U8 ( .A(re_2[3]), .B(re_1[3]), .CI(n4), .CO(n3), .S(
        add_dout_re[2]) );
  FADDX1_RVT U9 ( .A(re_2[2]), .B(re_1[2]), .CI(n5), .CO(n4), .S(
        add_dout_re[1]) );
  FADDX1_RVT U10 ( .A(re_2[1]), .B(re_1[1]), .CI(n6), .CO(n5), .S(
        add_dout_re[0]) );
  INVX1_RVT U11 ( .A(re_2[7]), .Y(n10) );
  FADDX1_RVT U12 ( .A(re_2[6]), .B(re_1[6]), .CI(n7), .CO(n8), .S(
        add_dout_re[5]) );
  FADDX1_RVT U13 ( .A(n10), .B(n9), .CI(n8), .CO(n11), .S(add_dout_re[6]) );
  AND2X1_RVT U14 ( .A1(im_1[0]), .A2(im_2[0]), .Y(n16) );
  FADDX1_RVT U15 ( .A(im_2[5]), .B(im_1[5]), .CI(n12), .CO(n17), .S(
        add_dout_im[4]) );
  FADDX1_RVT U16 ( .A(im_2[4]), .B(im_1[4]), .CI(n13), .CO(n12), .S(
        add_dout_im[3]) );
  FADDX1_RVT U17 ( .A(im_2[3]), .B(im_1[3]), .CI(n14), .CO(n13), .S(
        add_dout_im[2]) );
  FADDX1_RVT U18 ( .A(im_2[2]), .B(im_1[2]), .CI(n15), .CO(n14), .S(
        add_dout_im[1]) );
  FADDX1_RVT U19 ( .A(im_2[1]), .B(im_1[1]), .CI(n16), .CO(n15), .S(
        add_dout_im[0]) );
  INVX1_RVT U20 ( .A(im_1[7]), .Y(n19) );
  FADDX1_RVT U21 ( .A(im_2[6]), .B(n17), .CI(im_1[6]), .CO(n18), .S(
        add_dout_im[5]) );
  FADDX1_RVT U22 ( .A(n20), .B(n19), .CI(n18), .CO(n21), .S(add_dout_im[6]) );
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
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n22, n24, n25, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n38, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n75, n77, n78, n79, n80, n81, n82, n83, n84, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n386, n387, n388, n389, n390, n391,
         n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424,
         n425, n426, n427, n428, n429, n430, n431, n432, n433, n434, n435,
         n436, n437, n438, n439, n440, n441, n442, n443, n444, n445, n446,
         n447, n448, n449, n450, n451, n452, n453, n454, n455, n456, n457,
         n458, n459, n460, n461, n462, n463, n464, n465, n466, n467, n468,
         n469, n470, n471, n472, n473, n474, n475, n476, n477, n478, n479,
         n480, n481, n482, n483, n484, n485, n486, n487, n488, n489, n490,
         n491, n492, n493, n494, n495, n496, n497, n498, n499, n500, n501,
         n502, n503, n504, n505, n506, n507, n508, n509, n510, n511, n512,
         n513, n514, n515, n516, n517, n518, n519, n520, n521, n522, n523,
         n524, n525, n526, n527, n528, n529, n530, n531, n532, n533, n534,
         n535, n536, n537, n538, n539, n540, n541, n542, n543, n544, n545,
         n546, n547, n548, n549, n550, n551, n552, n553, n554, n555, n556,
         n557, n558, n559, n560, n561, n562, n563, n564, n565, n566, n567,
         n568, n569, n570, n571, n572, n573, n574, n575, n576, n577, n578,
         n579, n580, n581, n582, n583, n584, n585, n586, n587, n588, n589,
         n590, n591, n592, n593, n594, n595, n596, n597, n598, n599, n600,
         n601, n602, n603, n604, n605, n606, n607, n608, n609, n610, n611,
         n612, n613, n614, n615, n616, n617, n618, n619, n620, n621, n622,
         n623, n624, n625, n626, n627, n628, n629, n630, n631, n632, n633,
         n634, n635, n636, n637, n638, n639, n640, n641, n642, n643, n644,
         n645, n646, n647, n648, n649, n650, n651, n652, n653, n654, n655,
         n656, n657, n658, n659, n660, n661, n662, n663, n664, n665, n666,
         n667, n668, n669, n670, n671, n672, n673, n674, n675, n676, n677,
         n678, n679, n680, n681, n682, n683, n684, n685, n686, n687, n688,
         n689, n690, n691, n692, n693, n694, n695, n696, n697, n698, n699,
         n700, n701, n702, n703, n704, n705, n706, n707, n708, n709, n710,
         n711, n712, n713, n714, n715, n716, n717, n718, n719, n720, n721,
         n722, n723, n724, n725, n726, n727, n728, n729, n730, n731, n732,
         n733, n734, n735, n736, n737, n738, n739, n740, n741, n742, n743,
         n744, n745, n746, n747, n748, n749, n750, n751, n752, n753, n754,
         n755, n756, n757, n758, n759, n760, n761, n762, n763, n764, n765,
         n766, n767, n768, n769, n770, n771, n772, n773, n774, n775, n776,
         n777, n778, n779, n781, n782, n783, n784, n785, n786, n787, n788,
         n789, n790, n791, n792, n793, n794, n795, n796, n797, n798, n799,
         n800, n801, n802, n803, n804, n805, n806, n807, n808, n809, n810,
         n811, n812, n813, n814, n815, n816, n817, n818, n819, n820, n821,
         n822, n823, n824, n825, n826, n827, n828, n829, n830, n831, n832,
         n833, n834, n835, n836, n837, n838, n839, n840, n841, n842, n843,
         n844, n845, n846, n847, n848, n849, n850, n851, n852, n853, n854,
         n855, n856, n857, n858, n859, n860, n862, n863, n864, n865, n866,
         n867, n868, n869, n870, n871, n872, n873, n874, n875, n876, n877,
         n878, n879, n880, n881, n882, n883, n884, n885, n886, n887, n888,
         n889, n890, n891, n892, n893, n894, n895, n896, n897, n898, n899,
         n900, n901, n902, n903, n904, n905, n906, n907, n908, n909, n910,
         n911, n912, n913, n914, n915, n916, n917, n918, n919, n920, n921,
         n922, n923, n924, n925, n926, n927, n928, n929, n930, n931, n932,
         n933, n934, n935, n936, n937, n938, n939, n940, n941, n942, n943,
         n944, n945, n946, n947, n948, n949, n951, n952, n953, n954, n955;

  INVX0_RVT U1 ( .A(n125), .Y(n22) );
  OAI21X1_RVT U2 ( .A1(n931), .A2(n936), .A3(n932), .Y(n925) );
  OR2X1_RVT U3 ( .A1(n469), .A2(n470), .Y(n516) );
  OR2X1_RVT U4 ( .A1(n739), .A2(n11), .Y(n146) );
  XOR3X1_RVT U5 ( .A1(n453), .A2(n454), .A3(n452), .Y(n436) );
  OAI22X1_RVT U6 ( .A1(n10), .A2(n573), .A3(n546), .A4(n575), .Y(n578) );
  NAND3X0_RVT U7 ( .A1(n158), .A2(n157), .A3(n156), .Y(n372) );
  XNOR2X1_RVT U8 ( .A1(n226), .A2(n70), .Y(n531) );
  XNOR2X1_RVT U9 ( .A1(n226), .A2(n109), .Y(n884) );
  XNOR2X1_RVT U10 ( .A1(n288), .A2(n289), .Y(n307) );
  XNOR2X1_RVT U11 ( .A1(n14), .A2(n69), .Y(n546) );
  INVX0_RVT U12 ( .A(n239), .Y(n7) );
  INVX0_RVT U13 ( .A(n144), .Y(n5) );
  INVX1_RVT U14 ( .A(n238), .Y(n6) );
  XOR2X1_RVT U15 ( .A1(im_2[2]), .A2(n72), .Y(n408) );
  OAI22X1_RVT U16 ( .A1(n294), .A2(n63), .A3(n243), .A4(n167), .Y(n292) );
  OAI22X1_RVT U17 ( .A1(n484), .A2(n10), .A3(n301), .A4(n575), .Y(n530) );
  XNOR2X1_RVT U18 ( .A1(n106), .A2(n70), .Y(n876) );
  NBUFFX2_RVT U19 ( .A(n572), .Y(n107) );
  NAND2X0_RVT U20 ( .A1(n690), .A2(n691), .Y(n36) );
  FADDX1_RVT U21 ( .A(n313), .B(n311), .CI(n312), .CO(n270), .S(n370) );
  XNOR2X1_RVT U22 ( .A1(n104), .A2(n811), .Y(n794) );
  XOR2X1_RVT U23 ( .A1(n811), .A2(n72), .Y(n407) );
  XNOR2X1_RVT U24 ( .A1(n9), .A2(n607), .Y(n871) );
  OAI22X1_RVT U25 ( .A1(n254), .A2(n574), .A3(n64), .A4(n255), .Y(n279) );
  OAI22X1_RVT U26 ( .A1(n256), .A2(n574), .A3(n248), .A4(n255), .Y(n265) );
  NBUFFX2_RVT U27 ( .A(n319), .Y(n223) );
  NBUFFX8_RVT U28 ( .A(n255), .Y(n575) );
  XNOR2X1_RVT U29 ( .A1(n811), .A2(n108), .Y(n742) );
  XNOR2X1_RVT U30 ( .A1(n81), .A2(n19), .Y(n752) );
  XNOR2X1_RVT U31 ( .A1(n104), .A2(n607), .Y(n275) );
  XNOR2X1_RVT U32 ( .A1(n15), .A2(n19), .Y(n751) );
  XNOR2X1_RVT U33 ( .A1(n104), .A2(n608), .Y(n251) );
  XNOR2X1_RVT U34 ( .A1(n814), .A2(n19), .Y(n746) );
  XNOR2X1_RVT U35 ( .A1(n14), .A2(n19), .Y(n611) );
  XNOR2X1_RVT U36 ( .A1(n226), .A2(n113), .Y(n323) );
  XNOR2X1_RVT U37 ( .A1(n485), .A2(n112), .Y(n246) );
  XNOR2X1_RVT U38 ( .A1(n177), .A2(re_1[3]), .Y(n320) );
  HADDX1_RVT U39 ( .A0(n741), .B0(n740), .C1(n759), .SO(n784) );
  XNOR2X1_RVT U40 ( .A1(n75), .A2(n19), .Y(n620) );
  XNOR2X1_RVT U41 ( .A1(n226), .A2(n811), .Y(n700) );
  XNOR2X1_RVT U42 ( .A1(n226), .A2(n715), .Y(n614) );
  XNOR2X1_RVT U43 ( .A1(n872), .A2(re_1[1]), .Y(n259) );
  NBUFFX2_RVT U44 ( .A(re_2[2]), .Y(n79) );
  INVX1_RVT U45 ( .A(n610), .Y(n2) );
  XNOR2X1_RVT U46 ( .A1(n14), .A2(n811), .Y(n641) );
  AND2X1_RVT U47 ( .A1(n609), .A2(n213), .Y(n181) );
  XNOR2X1_RVT U48 ( .A1(n104), .A2(n109), .Y(n615) );
  XNOR2X1_RVT U49 ( .A1(n109), .A2(re_1[1]), .Y(n632) );
  XNOR2X1_RVT U50 ( .A1(n872), .A2(n809), .Y(n638) );
  XNOR2X1_RVT U51 ( .A1(n109), .A2(n814), .Y(n631) );
  XOR2X1_RVT U52 ( .A1(n607), .A2(n87), .Y(n128) );
  INVX1_RVT U53 ( .A(n25), .Y(n781) );
  NBUFFX2_RVT U54 ( .A(re_2[0]), .Y(n803) );
  NBUFFX2_RVT U55 ( .A(n220), .Y(n124) );
  XNOR2X1_RVT U56 ( .A1(n226), .A2(n19), .Y(n645) );
  XNOR2X1_RVT U57 ( .A1(n106), .A2(n177), .Y(n639) );
  XNOR2X1_RVT U58 ( .A1(n70), .A2(n87), .Y(n622) );
  NBUFFX2_RVT U59 ( .A(n877), .Y(n217) );
  NBUFFX2_RVT U60 ( .A(n885), .Y(n220) );
  INVX0_RVT U61 ( .A(n109), .Y(n629) );
  INVX2_RVT U62 ( .A(n874), .Y(n118) );
  NBUFFX2_RVT U63 ( .A(n880), .Y(n209) );
  XNOR2X1_RVT U64 ( .A1(n177), .A2(n753), .Y(n719) );
  NBUFFX2_RVT U65 ( .A(re_2[4]), .Y(n608) );
  NBUFFX2_RVT U66 ( .A(re_1[7]), .Y(n870) );
  NBUFFX2_RVT U67 ( .A(im_2[0]), .Y(n802) );
  NBUFFX4_RVT U68 ( .A(re_2[1]), .Y(n113) );
  AOI21X1_RVT U69 ( .A1(n941), .A2(n954), .A3(n951), .Y(n953) );
  AOI21X1_RVT U70 ( .A1(n943), .A2(n941), .A3(n942), .Y(n946) );
  AOI21X1_RVT U71 ( .A1(n55), .A2(n511), .A3(n510), .Y(n514) );
  AOI21X1_RVT U72 ( .A1(n237), .A2(n516), .A3(n56), .Y(n520) );
  INVX2_RVT U73 ( .A(n91), .Y(n504) );
  INVX2_RVT U74 ( .A(n110), .Y(n949) );
  AO21X1_RVT U75 ( .A1(n869), .A2(n941), .A3(n868), .Y(n935) );
  OR2X1_RVT U76 ( .A1(n863), .A2(n862), .Y(n30) );
  INVX1_RVT U77 ( .A(n885), .Y(n88) );
  NBUFFX2_RVT U78 ( .A(n63), .Y(n1) );
  OR2X2_RVT U79 ( .A1(n3), .A2(n2), .Y(n51) );
  INVX2_RVT U80 ( .A(n25), .Y(n3) );
  XNOR2X2_RVT U81 ( .A1(im_2[2]), .A2(im_2[1]), .Y(n25) );
  NBUFFX2_RVT U82 ( .A(im_2[6]), .Y(n4) );
  OAI22X2_RVT U83 ( .A1(n638), .A2(n637), .A3(n217), .A4(n636), .Y(n681) );
  OA21X1_RVT U84 ( .A1(n852), .A2(n851), .A3(n12), .Y(n858) );
  OA21X1_RVT U85 ( .A1(n7), .A2(n6), .A3(n5), .Y(n833) );
  AND2X1_RVT U86 ( .A1(n863), .A2(n862), .Y(n153) );
  NBUFFX8_RVT U87 ( .A(n637), .Y(n225) );
  NBUFFX4_RVT U88 ( .A(re_1[1]), .Y(n15) );
  OAI22X1_RVT U89 ( .A1(n220), .A2(n630), .A3(n629), .A4(n160), .Y(n679) );
  XOR2X2_RVT U90 ( .A1(n176), .A2(re_2[2]), .Y(n155) );
  AO21X1_RVT U91 ( .A1(n867), .A2(n111), .A3(n866), .Y(n868) );
  INVX1_RVT U92 ( .A(n8), .Y(n467) );
  OR2X1_RVT U93 ( .A1(n464), .A2(n458), .Y(n8) );
  NBUFFX2_RVT U94 ( .A(im_1[7]), .Y(n9) );
  NBUFFX2_RVT U95 ( .A(n574), .Y(n10) );
  NBUFFX8_RVT U96 ( .A(re_1[0]), .Y(n814) );
  INVX1_RVT U97 ( .A(n80), .Y(n238) );
  OR2X1_RVT U98 ( .A1(im_2[4]), .A2(im_2[3]), .Y(n206) );
  OR2X2_RVT U99 ( .A1(n476), .A2(n475), .Y(n508) );
  XOR3X2_RVT U100 ( .A1(n735), .A2(n734), .A3(n71), .Y(n739) );
  INVX1_RVT U101 ( .A(n163), .Y(n11) );
  NBUFFX2_RVT U102 ( .A(im_1[4]), .Y(n47) );
  INVX1_RVT U103 ( .A(n12), .Y(n856) );
  OR2X1_RVT U104 ( .A1(n854), .A2(n853), .Y(n12) );
  XNOR2X2_RVT U105 ( .A1(n177), .A2(n47), .Y(n649) );
  OR2X2_RVT U106 ( .A1(n640), .A2(n13), .Y(n637) );
  XNOR2X2_RVT U107 ( .A1(n151), .A2(n872), .Y(n13) );
  NBUFFX2_RVT U108 ( .A(n753), .Y(n98) );
  XNOR2X2_RVT U109 ( .A1(re_2[6]), .A2(re_2[5]), .Y(n877) );
  OAI22X1_RVT U110 ( .A1(n622), .A2(n217), .A3(n636), .A4(n225), .Y(n643) );
  NBUFFX2_RVT U111 ( .A(im_2[7]), .Y(n38) );
  NBUFFX4_RVT U112 ( .A(re_2[6]), .Y(n151) );
  NBUFFX2_RVT U113 ( .A(n870), .Y(n14) );
  NBUFFX2_RVT U114 ( .A(n670), .Y(n16) );
  OAI22X2_RVT U115 ( .A1(n383), .A2(n275), .A3(n251), .A4(n319), .Y(n263) );
  OAI22X1_RVT U116 ( .A1(n637), .A2(n622), .A3(n613), .A4(n217), .Y(n618) );
  AND2X1_RVT U117 ( .A1(im_2[3]), .A2(im_2[4]), .Y(n208) );
  INVX1_RVT U118 ( .A(n17), .Y(n693) );
  AND3X1_RVT U119 ( .A1(n36), .A2(n35), .A3(n34), .Y(n17) );
  NBUFFX4_RVT U120 ( .A(im_2[7]), .Y(n109) );
  NBUFFX8_RVT U121 ( .A(im_1[3]), .Y(n753) );
  OAI22X2_RVT U122 ( .A1(n661), .A2(n217), .A3(n613), .A4(n225), .Y(n658) );
  NBUFFX8_RVT U123 ( .A(re_2[7]), .Y(n872) );
  OR2X1_RVT U124 ( .A1(n859), .A2(n860), .Y(n954) );
  NBUFFX2_RVT U125 ( .A(n607), .Y(n18) );
  NBUFFX16_RVT U126 ( .A(n112), .Y(n19) );
  INVX1_RVT U127 ( .A(n20), .Y(n129) );
  OA21X1_RVT U128 ( .A1(n857), .A2(n856), .A3(n855), .Y(n20) );
  XOR2X2_RVT U129 ( .A1(n116), .A2(re_1[4]), .Y(n245) );
  XOR2X2_RVT U130 ( .A1(im_1[5]), .A2(im_1[6]), .Y(n194) );
  XNOR2X2_RVT U131 ( .A1(im_1[7]), .A2(im_1[6]), .Y(n198) );
  XOR3X2_RVT U132 ( .A1(n292), .A2(n290), .A3(n291), .Y(n305) );
  XOR2X2_RVT U133 ( .A1(n109), .A2(n96), .Y(n274) );
  XOR2X2_RVT U134 ( .A1(n660), .A2(im_1[4]), .Y(n242) );
  MUX21X2_RVT U135 ( .A1(n207), .A2(n206), .S0(n715), .Y(n716) );
  XOR3X2_RVT U136 ( .A1(n664), .A2(n663), .A3(n662), .Y(n668) );
  FADDX1_RVT U137 ( .A(n664), .B(n663), .CI(n662), .CO(n904) );
  OR2X1_RVT U138 ( .A1(n22), .A2(n164), .Y(n29) );
  AO21X1_RVT U139 ( .A1(n126), .A2(n234), .A3(n233), .Y(n164) );
  NBUFFX2_RVT U140 ( .A(n225), .Y(n24) );
  NBUFFX8_RVT U141 ( .A(im_2[3]), .Y(n112) );
  XOR2X2_RVT U142 ( .A1(n38), .A2(im_2[6]), .Y(n219) );
  XNOR2X2_RVT U143 ( .A1(im_2[6]), .A2(im_2[5]), .Y(n885) );
  OAI21X2_RVT U144 ( .A1(n465), .A2(n464), .A3(n463), .Y(n466) );
  OR2X1_RVT U145 ( .A1(re_1[5]), .A2(n874), .Y(n119) );
  XOR2X2_RVT U146 ( .A1(n753), .A2(im_1[2]), .Y(n241) );
  NAND2X0_RVT U147 ( .A1(n164), .A2(n27), .Y(n28) );
  NAND2X0_RVT U148 ( .A1(n28), .A2(n29), .Y(mul_dout_im[7]) );
  INVX1_RVT U149 ( .A(n125), .Y(n27) );
  OR2X1_RVT U150 ( .A1(n862), .A2(n863), .Y(n696) );
  AO21X1_RVT U151 ( .A1(n53), .A2(n696), .A3(n153), .Y(n942) );
  NAND2X0_RVT U152 ( .A1(n610), .A2(n25), .Y(n750) );
  OAI22X2_RVT U153 ( .A1(n620), .A2(n51), .A3(n25), .A4(n611), .Y(n625) );
  XNOR2X2_RVT U154 ( .A1(re_1[3]), .A2(re_1[4]), .Y(n532) );
  XOR2X2_RVT U155 ( .A1(re_1[1]), .A2(re_1[2]), .Y(n123) );
  XOR3X2_RVT U156 ( .A1(n694), .A2(n695), .A3(n693), .Y(n863) );
  NAND2X0_RVT U157 ( .A1(n694), .A2(n693), .Y(n31) );
  NAND2X0_RVT U158 ( .A1(n695), .A2(n693), .Y(n32) );
  NAND2X0_RVT U159 ( .A1(n695), .A2(n694), .Y(n33) );
  NAND3X0_RVT U160 ( .A1(n33), .A2(n31), .A3(n32), .Y(n864) );
  NAND2X0_RVT U161 ( .A1(n691), .A2(n689), .Y(n34) );
  NAND2X0_RVT U162 ( .A1(n690), .A2(n689), .Y(n35) );
  NBUFFX4_RVT U163 ( .A(re_1[5]), .Y(n116) );
  NBUFFX4_RVT U164 ( .A(im_1[1]), .Y(n96) );
  NBUFFX4_RVT U165 ( .A(re_2[5]), .Y(n607) );
  NBUFFX4_RVT U166 ( .A(im_2[1]), .Y(n811) );
  NBUFFX4_RVT U167 ( .A(re_1[2]), .Y(n81) );
  XOR3X2_RVT U168 ( .A1(n906), .A2(n907), .A3(n905), .Y(n865) );
  NAND2X0_RVT U169 ( .A1(n905), .A2(n906), .Y(n48) );
  NAND2X0_RVT U170 ( .A1(n907), .A2(n905), .Y(n49) );
  NAND2X0_RVT U171 ( .A1(n907), .A2(n906), .Y(n50) );
  NAND3X0_RVT U172 ( .A1(n50), .A2(n49), .A3(n48), .Y(n911) );
  NBUFFX2_RVT U173 ( .A(n532), .Y(n52) );
  NAND3X0_RVT U174 ( .A1(n171), .A2(n172), .A3(n173), .Y(n297) );
  INVX2_RVT U175 ( .A(n194), .Y(n571) );
  AO21X1_RVT U176 ( .A1(n858), .A2(n137), .A3(n129), .Y(n941) );
  NBUFFX4_RVT U177 ( .A(im_2[5]), .Y(n715) );
  INVX1_RVT U178 ( .A(re_1[5]), .Y(n148) );
  XNOR2X1_RVT U179 ( .A1(im_1[1]), .A2(im_1[2]), .Y(n385) );
  XNOR2X1_RVT U180 ( .A1(re_1[3]), .A2(re_1[2]), .Y(n136) );
  XNOR2X1_RVT U181 ( .A1(im_1[4]), .A2(im_1[3]), .Y(n535) );
  NAND2X0_RVT U182 ( .A1(n146), .A2(n154), .Y(n53) );
  NAND2X0_RVT U183 ( .A1(n954), .A2(n188), .Y(n54) );
  OAI22X1_RVT U184 ( .A1(n252), .A2(n571), .A3(n9), .A4(n572), .Y(n281) );
  NBUFFX2_RVT U185 ( .A(n299), .Y(n572) );
  AO21X1_RVT U186 ( .A1(n468), .A2(n467), .A3(n466), .Y(n55) );
  NBUFFX8_RVT U187 ( .A(re_1[3]), .Y(n104) );
  AND2X1_RVT U188 ( .A1(n470), .A2(n469), .Y(n56) );
  XOR2X2_RVT U189 ( .A1(n57), .A2(n120), .Y(n271) );
  OA22X1_RVT U190 ( .A1(n257), .A2(n574), .A3(n256), .A4(n255), .Y(n57) );
  INVX1_RVT U191 ( .A(n336), .Y(n337) );
  NAND2X0_RVT U192 ( .A1(n860), .A2(n859), .Y(n58) );
  INVX1_RVT U193 ( .A(n272), .Y(n120) );
  XNOR2X1_RVT U194 ( .A1(n177), .A2(n87), .Y(n755) );
  XNOR2X1_RVT U195 ( .A1(n104), .A2(n151), .Y(n276) );
  XNOR2X1_RVT U196 ( .A1(n378), .A2(n112), .Y(n318) );
  INVX1_RVT U197 ( .A(n532), .Y(n61) );
  XNOR2X1_RVT U198 ( .A1(n104), .A2(n19), .Y(n710) );
  OAI22X1_RVT U199 ( .A1(n217), .A2(n634), .A3(n633), .A4(n637), .Y(n677) );
  INVX1_RVT U200 ( .A(n870), .Y(n64) );
  XNOR2X1_RVT U201 ( .A1(n70), .A2(n100), .Y(n878) );
  OAI22X1_RVT U202 ( .A1(n527), .A2(n10), .A3(n484), .A4(n575), .Y(n526) );
  NAND2X0_RVT U203 ( .A1(n367), .A2(n471), .Y(n59) );
  XOR2X1_RVT U204 ( .A1(n226), .A2(n18), .Y(n60) );
  INVX0_RVT U205 ( .A(n58), .Y(n951) );
  INVX0_RVT U206 ( .A(n492), .Y(n95) );
  OAI22X1_RVT U207 ( .A1(n249), .A2(n63), .A3(n318), .A4(n384), .Y(n346) );
  NBUFFX4_RVT U208 ( .A(n385), .Y(n63) );
  INVX0_RVT U209 ( .A(n811), .Y(n175) );
  INVX0_RVT U210 ( .A(n715), .Y(n717) );
  INVX1_RVT U211 ( .A(n567), .Y(n588) );
  INVX1_RVT U212 ( .A(n102), .Y(n512) );
  INVX0_RVT U213 ( .A(n507), .Y(n101) );
  INVX0_RVT U214 ( .A(n68), .Y(n468) );
  INVX0_RVT U215 ( .A(n936), .Y(n930) );
  INVX0_RVT U216 ( .A(n587), .Y(n557) );
  INVX0_RVT U217 ( .A(n931), .Y(n933) );
  INVX0_RVT U218 ( .A(n927), .Y(n917) );
  INVX1_RVT U219 ( .A(n733), .Y(n71) );
  NAND2X0_RVT U220 ( .A1(n338), .A2(n339), .Y(n332) );
  FADDX1_RVT U221 ( .A(n370), .B(n369), .CI(n368), .CO(n339), .S(n469) );
  INVX0_RVT U222 ( .A(n651), .Y(n652) );
  OR2X1_RVT U223 ( .A1(n922), .A2(n923), .Y(n921) );
  OR2X1_RVT U224 ( .A1(n289), .A2(n288), .Y(n499) );
  OR2X1_RVT U225 ( .A1(n618), .A2(n617), .Y(n662) );
  INVX1_RVT U226 ( .A(n922), .Y(n920) );
  INVX0_RVT U227 ( .A(n650), .Y(n654) );
  OAI22X1_RVT U228 ( .A1(n711), .A2(n750), .A3(n25), .A4(n645), .Y(n722) );
  OAI22X1_RVT U229 ( .A1(n115), .A2(n394), .A3(n393), .A4(n406), .Y(n445) );
  INVX0_RVT U230 ( .A(n159), .Y(n94) );
  OAI22X1_RVT U231 ( .A1(n816), .A2(n676), .A3(n813), .A4(n700), .Y(n701) );
  INVX0_RVT U232 ( .A(n639), .Y(n224) );
  OAI22X1_RVT U233 ( .A1(n115), .A2(n393), .A3(n408), .A4(n406), .Y(n388) );
  INVX0_RVT U234 ( .A(n778), .Y(n211) );
  OR2X1_RVT U235 ( .A1(n802), .A2(n65), .Y(n386) );
  INVX0_RVT U236 ( .A(n298), .Y(n201) );
  INVX0_RVT U237 ( .A(n341), .Y(n200) );
  INVX0_RVT U238 ( .A(n612), .Y(n210) );
  INVX0_RVT U239 ( .A(n534), .Y(n204) );
  NOR2X0_RVT U240 ( .A1(n802), .A2(n106), .Y(n134) );
  INVX0_RVT U241 ( .A(n871), .Y(n214) );
  INVX0_RVT U242 ( .A(n104), .Y(n376) );
  NOR2X0_RVT U243 ( .A1(n809), .A2(n712), .Y(n133) );
  OR2X1_RVT U244 ( .A1(n803), .A2(n73), .Y(n317) );
  XOR2X1_RVT U245 ( .A1(n4), .A2(n485), .Y(n486) );
  INVX0_RVT U246 ( .A(n278), .Y(n97) );
  INVX1_RVT U247 ( .A(n67), .Y(n808) );
  INVX0_RVT U248 ( .A(n208), .Y(n207) );
  NBUFFX8_RVT U249 ( .A(n116), .Y(n226) );
  INVX1_RVT U250 ( .A(n19), .Y(n744) );
  OR2X1_RVT U251 ( .A1(n176), .A2(n809), .Y(n743) );
  INVX1_RVT U252 ( .A(n206), .Y(n205) );
  XNOR2X1_RVT U253 ( .A1(n14), .A2(n109), .Y(n875) );
  NBUFFX4_RVT U254 ( .A(im_1[5]), .Y(n660) );
  NBUFFX4_RVT U255 ( .A(re_1[6]), .Y(n874) );
  NBUFFX4_RVT U256 ( .A(im_1[0]), .Y(n809) );
  NBUFFX2_RVT U257 ( .A(n98), .Y(n65) );
  XNOR2X2_RVT U258 ( .A1(n226), .A2(n177), .Y(n277) );
  NBUFFX2_RVT U259 ( .A(n483), .Y(n66) );
  XOR2X2_RVT U260 ( .A1(n112), .A2(im_2[2]), .Y(n610) );
  AO21X1_RVT U261 ( .A1(n135), .A2(n739), .A3(n185), .Y(n154) );
  NBUFFX2_RVT U262 ( .A(n113), .Y(n67) );
  XNOR2X2_RVT U263 ( .A1(im_2[6]), .A2(n378), .Y(n243) );
  INVX2_RVT U264 ( .A(n877), .Y(n640) );
  XOR3X2_RVT U265 ( .A1(n325), .A2(n326), .A3(n324), .Y(n368) );
  FADDX1_RVT U266 ( .A(n326), .B(n325), .CI(n324), .CO(n328) );
  FADDX1_RVT U267 ( .A(n454), .B(n453), .CI(n452), .CO(n459) );
  OA21X1_RVT U268 ( .A1(n439), .A2(n438), .A3(n437), .Y(n68) );
  NBUFFX2_RVT U269 ( .A(n151), .Y(n69) );
  INVX8_RVT U270 ( .A(im_1[7]), .Y(n547) );
  AO21X1_RVT U271 ( .A1(n510), .A2(n478), .A3(n477), .Y(n479) );
  NBUFFX8_RVT U272 ( .A(n872), .Y(n70) );
  NBUFFX8_RVT U273 ( .A(n96), .Y(n72) );
  NBUFFX2_RVT U274 ( .A(n148), .Y(n73) );
  XOR2X2_RVT U275 ( .A1(n627), .A2(n628), .Y(n685) );
  AND2X1_RVT U276 ( .A1(n628), .A2(n627), .Y(n623) );
  NBUFFX2_RVT U277 ( .A(n874), .Y(n75) );
  AND2X1_RVT U278 ( .A1(n473), .A2(n474), .Y(n102) );
  OR2X1_RVT U279 ( .A1(n367), .A2(n471), .Y(n518) );
  XOR3X2_RVT U280 ( .A1(n339), .A2(n338), .A3(n337), .Y(n471) );
  AOI22X1_RVT U281 ( .A1(n90), .A2(n372), .A3(n77), .A4(n371), .Y(n367) );
  OR2X1_RVT U282 ( .A1(n372), .A2(n90), .Y(n77) );
  OR2X1_RVT U283 ( .A1(n195), .A2(n474), .Y(n222) );
  NBUFFX2_RVT U284 ( .A(n228), .Y(n78) );
  OR2X1_RVT U285 ( .A1(n562), .A2(n540), .Y(n567) );
  OA21X1_RVT U286 ( .A1(n821), .A2(n820), .A3(n819), .Y(n80) );
  NBUFFX2_RVT U287 ( .A(n835), .Y(n82) );
  NBUFFX4_RVT U288 ( .A(n779), .Y(n92) );
  NBUFFX2_RVT U289 ( .A(n402), .Y(n83) );
  INVX8_RVT U290 ( .A(n814), .Y(n405) );
  NOR2X0_RVT U291 ( .A1(n504), .A2(n84), .Y(n506) );
  INVX0_RVT U292 ( .A(n511), .Y(n84) );
  AND2X1_RVT U293 ( .A1(n59), .A2(n516), .Y(n511) );
  XOR3X2_RVT U294 ( .A1(n776), .A2(n775), .A3(n774), .Y(n853) );
  NBUFFX2_RVT U295 ( .A(im_1[2]), .Y(n87) );
  XNOR2X2_RVT U296 ( .A1(n67), .A2(n87), .Y(n799) );
  XNOR2X2_RVT U297 ( .A1(n226), .A2(n69), .Y(n492) );
  XOR2X2_RVT U298 ( .A1(im_2[6]), .A2(n96), .Y(n262) );
  XOR2X2_RVT U299 ( .A1(n221), .A2(n72), .Y(n394) );
  XOR2X2_RVT U300 ( .A1(n19), .A2(n72), .Y(n393) );
  XOR2X2_RVT U301 ( .A1(n715), .A2(n96), .Y(n340) );
  AND2X1_RVT U302 ( .A1(n88), .A2(n814), .Y(n674) );
  NOR2X0_RVT U303 ( .A1(n216), .A2(n89), .Y(n215) );
  AO22X1_RVT U304 ( .A1(n89), .A2(n139), .A3(n181), .A4(n130), .Y(n644) );
  AO22X1_RVT U305 ( .A1(n89), .A2(n128), .A3(n181), .A4(n131), .Y(n703) );
  AO22X1_RVT U306 ( .A1(n89), .A2(n130), .A3(n216), .A4(n128), .Y(n680) );
  AO22X1_RVT U307 ( .A1(n89), .A2(n133), .A3(n181), .A4(n18), .Y(n758) );
  AO22X1_RVT U308 ( .A1(n89), .A2(n131), .A3(n181), .A4(n141), .Y(n761) );
  AO22X1_RVT U309 ( .A1(n89), .A2(n132), .A3(n181), .A4(n139), .Y(n624) );
  AO22X1_RVT U310 ( .A1(n89), .A2(n142), .A3(n181), .A4(n132), .Y(n659) );
  AO22X1_RVT U311 ( .A1(n89), .A2(n214), .A3(n181), .A4(n142), .Y(n888) );
  INVX2_RVT U312 ( .A(n213), .Y(n89) );
  XOR2X2_RVT U313 ( .A1(n608), .A2(n176), .Y(n213) );
  NBUFFX2_RVT U314 ( .A(n373), .Y(n90) );
  NBUFFX2_RVT U315 ( .A(n222), .Y(n91) );
  NBUFFX8_RVT U316 ( .A(n660), .Y(n106) );
  XOR3X2_RVT U317 ( .A1(n487), .A2(n488), .A3(n93), .Y(n497) );
  FADDX1_RVT U318 ( .A(n488), .B(n487), .CI(n93), .CO(n524) );
  AO22X1_RVT U319 ( .A1(n95), .A2(n61), .A3(n60), .A4(n94), .Y(n93) );
  AO22X1_RVT U320 ( .A1(n60), .A2(n61), .A3(n94), .A4(n97), .Y(n291) );
  NOR2X0_RVT U321 ( .A1(n501), .A2(n500), .Y(n540) );
  NBUFFX2_RVT U322 ( .A(n776), .Y(n99) );
  XNOR2X2_RVT U323 ( .A1(n221), .A2(n378), .Y(n249) );
  XNOR2X2_RVT U324 ( .A1(re_1[1]), .A2(n607), .Y(n316) );
  NBUFFX2_RVT U325 ( .A(im_1[6]), .Y(n100) );
  AO21X1_RVT U326 ( .A1(n102), .A2(n508), .A3(n101), .Y(n477) );
  AND2X1_RVT U327 ( .A1(n781), .A2(n814), .Y(n800) );
  INVX1_RVT U328 ( .A(n103), .Y(n137) );
  OA21X1_RVT U329 ( .A1(n850), .A2(n849), .A3(n848), .Y(n103) );
  NBUFFX2_RVT U330 ( .A(n536), .Y(n105) );
  INVX8_RVT U331 ( .A(n753), .Y(n378) );
  NBUFFX2_RVT U332 ( .A(re_1[4]), .Y(n108) );
  OR2X1_RVT U333 ( .A1(n928), .A2(n165), .Y(n162) );
  AO21X1_RVT U334 ( .A1(n186), .A2(n926), .A3(n925), .Y(n165) );
  OR2X1_RVT U335 ( .A1(n934), .A2(n184), .Y(n183) );
  AO21X1_RVT U336 ( .A1(n186), .A2(n937), .A3(n930), .Y(n184) );
  INVX4_RVT U337 ( .A(n176), .Y(n177) );
  INVX2_RVT U338 ( .A(n123), .Y(n383) );
  AO21X2_RVT U339 ( .A1(n941), .A2(n940), .A3(n111), .Y(n110) );
  NAND2X0_RVT U340 ( .A1(n154), .A2(n146), .Y(n111) );
  NAND2X0_RVT U341 ( .A1(n269), .A2(n270), .Y(n172) );
  XNOR2X2_RVT U342 ( .A1(n108), .A2(n19), .Y(n711) );
  XNOR2X2_RVT U343 ( .A1(n547), .A2(n19), .Y(n300) );
  XNOR2X2_RVT U344 ( .A1(n9), .A2(n113), .Y(n635) );
  XNOR2X2_RVT U345 ( .A1(n100), .A2(n113), .Y(n648) );
  XNOR2X2_RVT U346 ( .A1(n15), .A2(n67), .Y(n403) );
  XNOR2X2_RVT U347 ( .A1(n104), .A2(n67), .Y(n382) );
  XOR2X2_RVT U348 ( .A1(re_2[2]), .A2(re_2[1]), .Y(n779) );
  XNOR2X2_RVT U349 ( .A1(n106), .A2(n113), .Y(n699) );
  XNOR2X2_RVT U350 ( .A1(n870), .A2(n113), .Y(n256) );
  XNOR2X2_RVT U351 ( .A1(n72), .A2(n67), .Y(n806) );
  XNOR2X2_RVT U352 ( .A1(n65), .A2(n67), .Y(n777) );
  XNOR2X2_RVT U353 ( .A1(n698), .A2(n67), .Y(n754) );
  INVX2_RVT U354 ( .A(n114), .Y(n140) );
  AND2X1_RVT U355 ( .A1(n807), .A2(n113), .Y(n114) );
  NOR2X0_RVT U356 ( .A1(n115), .A2(n213), .Y(n741) );
  INVX2_RVT U357 ( .A(n809), .Y(n115) );
  NOR2X0_RVT U358 ( .A1(n807), .A2(n10), .Y(n315) );
  XOR2X2_RVT U359 ( .A1(n874), .A2(n148), .Y(n574) );
  AO22X1_RVT U360 ( .A1(n119), .A2(n870), .A3(n117), .A4(n64), .Y(n255) );
  OR2X1_RVT U361 ( .A1(n148), .A2(n118), .Y(n117) );
  AO21X1_RVT U362 ( .A1(n402), .A2(n405), .A3(n259), .Y(n272) );
  INVX2_RVT U363 ( .A(n121), .Y(n402) );
  AND2X1_RVT U364 ( .A1(n405), .A2(re_1[1]), .Y(n121) );
  XOR2X2_RVT U365 ( .A1(n98), .A2(n607), .Y(n130) );
  XNOR2X2_RVT U366 ( .A1(n872), .A2(n98), .Y(n613) );
  XOR3X2_RVT U367 ( .A1(n784), .A2(n783), .A3(n782), .Y(n122) );
  OR2X2_RVT U368 ( .A1(n155), .A2(n779), .Y(n228) );
  AND2X1_RVT U369 ( .A1(n921), .A2(n924), .Y(n125) );
  XNOR2X1_RVT U370 ( .A1(n715), .A2(n814), .Y(n713) );
  XNOR2X1_RVT U371 ( .A1(n14), .A2(n715), .Y(n879) );
  XNOR2X1_RVT U372 ( .A1(n715), .A2(n81), .Y(n647) );
  XNOR2X1_RVT U373 ( .A1(n715), .A2(n108), .Y(n621) );
  XNOR2X1_RVT U374 ( .A1(n715), .A2(n75), .Y(n655) );
  XNOR2X1_RVT U375 ( .A1(n15), .A2(n715), .Y(n714) );
  OAI22X2_RVT U376 ( .A1(n298), .A2(n178), .A3(n273), .A4(n105), .Y(n304) );
  AO21X1_RVT U377 ( .A1(n941), .A2(n869), .A3(n868), .Y(n126) );
  INVX4_RVT U378 ( .A(n660), .Y(n485) );
  NAND2X0_RVT U379 ( .A1(n219), .A2(n885), .Y(n127) );
  XNOR2X1_RVT U380 ( .A1(n941), .A2(n955), .Y(mul_dout_im[0]) );
  XNOR2X2_RVT U381 ( .A1(n9), .A2(n177), .Y(n612) );
  XOR2X2_RVT U382 ( .A1(n607), .A2(n608), .Y(n609) );
  XOR2X2_RVT U383 ( .A1(n18), .A2(n96), .Y(n131) );
  XOR2X2_RVT U384 ( .A1(n607), .A2(n698), .Y(n139) );
  XNOR2X1_RVT U385 ( .A1(n96), .A2(n177), .Y(n778) );
  INVX0_RVT U386 ( .A(n63), .Y(n374) );
  INVX1_RVT U387 ( .A(n472), .Y(n510) );
  OR2X1_RVT U388 ( .A1(n803), .A2(n376), .Y(n377) );
  OAI22X1_RVT U389 ( .A1(n383), .A2(n320), .A3(n352), .A4(n319), .Y(n357) );
  OAI22X1_RVT U390 ( .A1(n405), .A2(n316), .A3(n83), .A4(n353), .Y(n360) );
  OAI22X1_RVT U391 ( .A1(n317), .A2(n52), .A3(n73), .A4(n169), .Y(n359) );
  AND2X1_RVT U392 ( .A1(n809), .A2(n92), .Y(n801) );
  OAI22X1_RVT U393 ( .A1(n115), .A2(n262), .A3(n340), .A4(n406), .Y(n347) );
  OAI22X1_RVT U394 ( .A1(n115), .A2(n340), .A3(n394), .A4(n406), .Y(n442) );
  OAI22X1_RVT U395 ( .A1(n878), .A2(n217), .A3(n24), .A4(n876), .Y(n891) );
  INVX0_RVT U396 ( .A(n246), .Y(n203) );
  INVX0_RVT U397 ( .A(n247), .Y(n202) );
  AOI21X1_RVT U398 ( .A1(n434), .A2(n433), .A3(n235), .Y(n438) );
  NOR2X0_RVT U399 ( .A1(n555), .A2(n556), .Y(n587) );
  NOR2X0_RVT U400 ( .A1(n582), .A2(n583), .Y(n591) );
  INVX1_RVT U401 ( .A(n929), .Y(n937) );
  INVX0_RVT U402 ( .A(n18), .Y(n712) );
  OR2X1_RVT U403 ( .A1(n814), .A2(n717), .Y(n718) );
  INVX0_RVT U404 ( .A(n342), .Y(n178) );
  OR2X1_RVT U405 ( .A1(n814), .A2(n629), .Y(n630) );
  INVX1_RVT U406 ( .A(n872), .Y(n633) );
  OR2X1_RVT U407 ( .A1(n809), .A2(n633), .Y(n634) );
  OR2X1_RVT U408 ( .A1(n809), .A2(n808), .Y(n810) );
  OR2X1_RVT U409 ( .A1(n814), .A2(n744), .Y(n745) );
  AND2X1_RVT U410 ( .A1(n814), .A2(n720), .Y(n740) );
  INVX1_RVT U411 ( .A(n880), .Y(n720) );
  OAI22X1_RVT U412 ( .A1(n405), .A2(n375), .A3(n404), .A4(n83), .Y(n399) );
  OAI22X1_RVT U413 ( .A1(n377), .A2(n383), .A3(n376), .A4(n223), .Y(n398) );
  OAI22X1_RVT U414 ( .A1(n405), .A2(n353), .A3(n375), .A4(n83), .Y(n391) );
  OAI22X1_RVT U415 ( .A1(n383), .A2(n352), .A3(n382), .A4(n223), .Y(n392) );
  OAI22X1_RVT U416 ( .A1(n386), .A2(n1), .A3(n65), .A4(n168), .Y(n387) );
  OAI22X1_RVT U417 ( .A1(n383), .A2(n382), .A3(n381), .A4(n223), .Y(n389) );
  OAI22X1_RVT U418 ( .A1(n383), .A2(n293), .A3(n276), .A4(n223), .Y(n288) );
  OAI22X1_RVT U419 ( .A1(n405), .A2(n404), .A3(n403), .A4(n83), .Y(n427) );
  OAI22X1_RVT U420 ( .A1(n115), .A2(n408), .A3(n407), .A4(n406), .Y(n426) );
  NOR2X0_RVT U421 ( .A1(n420), .A2(n421), .Y(n424) );
  INVX0_RVT U422 ( .A(n559), .Y(n560) );
  INVX0_RVT U423 ( .A(n562), .Y(n564) );
  NOR2X0_RVT U424 ( .A1(n587), .A2(n567), .Y(n569) );
  AO21X1_RVT U425 ( .A1(n594), .A2(n593), .A3(n592), .Y(n595) );
  NOR2X0_RVT U426 ( .A1(n591), .A2(n587), .Y(n593) );
  INVX0_RVT U427 ( .A(n153), .Y(n947) );
  NAND2X0_RVT U428 ( .A1(n240), .A2(n927), .Y(n928) );
  INVX1_RVT U429 ( .A(n509), .Y(n179) );
  INVX1_RVT U430 ( .A(n30), .Y(n939) );
  XOR2X1_RVT U431 ( .A1(n607), .A2(n106), .Y(n132) );
  AND3X1_RVT U432 ( .A1(n190), .A2(n189), .A3(n191), .Y(n135) );
  XOR2X1_RVT U433 ( .A1(n802), .A2(n485), .Y(n138) );
  INVX1_RVT U434 ( .A(n779), .Y(n227) );
  XOR2X1_RVT U435 ( .A1(n18), .A2(n809), .Y(n141) );
  XOR2X1_RVT U436 ( .A1(n607), .A2(n100), .Y(n142) );
  XOR2X1_RVT U437 ( .A1(n177), .A2(n100), .Y(n143) );
  AND2X1_RVT U438 ( .A1(n829), .A2(n828), .Y(n144) );
  XOR2X1_RVT U439 ( .A1(n177), .A2(n809), .Y(n145) );
  AND2X1_RVT U440 ( .A1(n557), .A2(n590), .Y(n147) );
  XNOR2X2_RVT U441 ( .A1(re_1[1]), .A2(n151), .Y(n258) );
  AO21X1_RVT U442 ( .A1(n153), .A2(n697), .A3(n152), .Y(n866) );
  INVX0_RVT U443 ( .A(n152), .Y(n944) );
  AND2X1_RVT U444 ( .A1(n864), .A2(n865), .Y(n152) );
  AND2X1_RVT U445 ( .A1(n696), .A2(n697), .Y(n867) );
  OR2X1_RVT U446 ( .A1(n864), .A2(n865), .Y(n697) );
  NAND2X0_RVT U447 ( .A1(n860), .A2(n859), .Y(n185) );
  OR2X1_RVT U448 ( .A1(n688), .A2(n687), .Y(n626) );
  XOR3X2_RVT U449 ( .A1(n364), .A2(n366), .A3(n365), .Y(n449) );
  NAND2X0_RVT U450 ( .A1(n365), .A2(n364), .Y(n156) );
  NAND2X0_RVT U451 ( .A1(n366), .A2(n365), .Y(n157) );
  NAND2X0_RVT U452 ( .A1(n366), .A2(n364), .Y(n158) );
  NAND2X0_RVT U453 ( .A1(n532), .A2(n245), .Y(n159) );
  XNOR2X1_RVT U454 ( .A1(n109), .A2(n108), .Y(n656) );
  NAND2X0_RVT U455 ( .A1(n885), .A2(n219), .Y(n160) );
  NAND2X0_RVT U456 ( .A1(n165), .A2(n928), .Y(n161) );
  NAND2X0_RVT U457 ( .A1(n161), .A2(n162), .Y(mul_dout_im[6]) );
  NAND3X0_RVT U458 ( .A1(n190), .A2(n191), .A3(n189), .Y(n163) );
  OAI22X1_RVT U459 ( .A1(n383), .A2(n276), .A3(n275), .A4(n319), .Y(n283) );
  OAI22X1_RVT U460 ( .A1(n574), .A2(n257), .A3(n256), .A4(n575), .Y(n166) );
  NAND2X0_RVT U461 ( .A1(n385), .A2(n241), .Y(n167) );
  NAND2X0_RVT U462 ( .A1(n241), .A2(n385), .Y(n168) );
  NAND2X0_RVT U463 ( .A1(n241), .A2(n385), .Y(n384) );
  INVX1_RVT U464 ( .A(n228), .Y(n212) );
  NOR2X0_RVT U465 ( .A1(n435), .A2(n436), .Y(n439) );
  NAND2X0_RVT U466 ( .A1(n245), .A2(n532), .Y(n169) );
  NAND2X0_RVT U467 ( .A1(n532), .A2(n245), .Y(n170) );
  NAND2X0_RVT U468 ( .A1(n532), .A2(n245), .Y(n321) );
  OAI22X1_RVT U469 ( .A1(n52), .A2(n531), .A3(n492), .A4(n169), .Y(n529) );
  OAI22X1_RVT U470 ( .A1(n532), .A2(n323), .A3(n322), .A4(n170), .Y(n356) );
  OAI22X1_RVT U471 ( .A1(n532), .A2(n253), .A3(n323), .A4(n321), .Y(n344) );
  OAI22X1_RVT U472 ( .A1(n380), .A2(n1), .A3(n379), .A4(n167), .Y(n397) );
  OAI22X1_RVT U473 ( .A1(n318), .A2(n63), .A3(n354), .A4(n167), .Y(n358) );
  AO21X1_RVT U474 ( .A1(n63), .A2(n168), .A3(n294), .Y(n487) );
  OAI22X1_RVT U475 ( .A1(n243), .A2(n63), .A3(n250), .A4(n384), .Y(n287) );
  XNOR2X1_RVT U476 ( .A1(n96), .A2(n70), .Y(n636) );
  OAI22X1_RVT U477 ( .A1(n405), .A2(n259), .A3(n258), .A4(n402), .Y(n313) );
  OAI22X1_RVT U478 ( .A1(n405), .A2(n258), .A3(n316), .A4(n402), .Y(n348) );
  XOR3X2_RVT U479 ( .A1(n270), .A2(n271), .A3(n269), .Y(n329) );
  NAND2X0_RVT U480 ( .A1(n271), .A2(n269), .Y(n171) );
  NAND2X0_RVT U481 ( .A1(n271), .A2(n270), .Y(n173) );
  OA21X1_RVT U482 ( .A1(n562), .A2(n559), .A3(n563), .Y(n174) );
  NOR2X0_RVT U483 ( .A1(n541), .A2(n542), .Y(n562) );
  INVX2_RVT U484 ( .A(re_2[3]), .Y(n176) );
  NBUFFX2_RVT U485 ( .A(n47), .Y(n698) );
  NAND2X0_RVT U486 ( .A1(n242), .A2(n535), .Y(n536) );
  XNOR2X2_RVT U487 ( .A1(n14), .A2(n608), .Y(n484) );
  OR2X1_RVT U488 ( .A1(n803), .A2(n64), .Y(n254) );
  XOR2X2_RVT U489 ( .A1(n180), .A2(n179), .Y(mul_dout_re[2]) );
  AO21X1_RVT U490 ( .A1(n506), .A2(n237), .A3(n505), .Y(n180) );
  AND2X1_RVT U491 ( .A1(n213), .A2(n609), .Y(n216) );
  AND2X1_RVT U492 ( .A1(n809), .A2(n640), .Y(n675) );
  NAND2X0_RVT U493 ( .A1(n184), .A2(n934), .Y(n182) );
  NAND2X0_RVT U494 ( .A1(n182), .A2(n183), .Y(mul_dout_im[5]) );
  AO21X1_RVT U495 ( .A1(n869), .A2(n941), .A3(n868), .Y(n186) );
  NBUFFX2_RVT U496 ( .A(n668), .Y(n187) );
  NAND2X0_RVT U497 ( .A1(n739), .A2(n135), .Y(n188) );
  NAND2X0_RVT U498 ( .A1(n737), .A2(n199), .Y(n189) );
  NAND2X0_RVT U499 ( .A1(n737), .A2(n738), .Y(n190) );
  NAND2X0_RVT U500 ( .A1(n199), .A2(n738), .Y(n191) );
  FADDX1_RVT U501 ( .A(n729), .B(n727), .CI(n728), .CO(n738), .S(n774) );
  AO21X1_RVT U502 ( .A1(n480), .A2(n237), .A3(n479), .Y(n192) );
  AND2X1_RVT U503 ( .A1(n242), .A2(n535), .Y(n193) );
  NAND3X0_RVT U504 ( .A1(n332), .A2(n331), .A3(n330), .Y(n195) );
  OAI22X1_RVT U505 ( .A1(n571), .A2(n570), .A3(n548), .A4(n107), .Y(n576) );
  OAI22X1_RVT U506 ( .A1(n571), .A2(n493), .A3(n300), .A4(n107), .Y(n495) );
  OAI22X1_RVT U507 ( .A1(n571), .A2(n533), .A3(n493), .A4(n107), .Y(n528) );
  OAI22X1_RVT U508 ( .A1(n571), .A2(n548), .A3(n533), .A4(n107), .Y(n544) );
  INVX1_RVT U509 ( .A(re_2[0]), .Y(n807) );
  OR2X2_RVT U510 ( .A1(n136), .A2(n123), .Y(n319) );
  AO22X1_RVT U511 ( .A1(n723), .A2(n722), .A3(n721), .A4(n196), .Y(n724) );
  OR2X1_RVT U512 ( .A1(n723), .A2(n722), .Y(n196) );
  AOI22X1_RVT U513 ( .A1(n231), .A2(n232), .A3(n197), .A4(n230), .Y(n721) );
  OR2X1_RVT U514 ( .A1(n232), .A2(n231), .Y(n197) );
  OAI22X1_RVT U515 ( .A1(n755), .A2(n228), .A3(n227), .A4(n719), .Y(n760) );
  OAI22X1_RVT U516 ( .A1(n250), .A2(n63), .A3(n249), .A4(n168), .Y(n264) );
  FADDX1_RVT U517 ( .A(n351), .B(n350), .CI(n349), .CO(n327), .S(n373) );
  XOR3X2_RVT U518 ( .A1(n790), .A2(n789), .A3(n788), .Y(n847) );
  FADDX1_RVT U519 ( .A(n789), .B(n790), .CI(n788), .CO(n851) );
  OR2X2_RVT U520 ( .A1(n198), .A2(n194), .Y(n299) );
  AO22X1_RVT U521 ( .A1(n210), .A2(n92), .A3(n212), .A4(n143), .Y(n617) );
  AND2X1_RVT U522 ( .A1(n471), .A2(n367), .Y(n517) );
  XOR3X2_RVT U523 ( .A1(n835), .A2(n837), .A3(n836), .Y(n831) );
  FADDX1_RVT U524 ( .A(n837), .B(n836), .CI(n82), .CO(n841) );
  OA22X1_RVT U525 ( .A1(n807), .A2(n648), .A3(n140), .A4(n699), .Y(n232) );
  NBUFFX2_RVT U526 ( .A(n736), .Y(n199) );
  AO22X1_RVT U527 ( .A1(n193), .A2(n485), .A3(n342), .A4(n134), .Y(n355) );
  AO22X1_RVT U528 ( .A1(n200), .A2(n342), .A3(n193), .A4(n138), .Y(n441) );
  AO21X1_RVT U529 ( .A1(n178), .A2(n105), .A3(n534), .Y(n543) );
  AO22X1_RVT U530 ( .A1(n486), .A2(n342), .A3(n193), .A4(n201), .Y(n496) );
  AO22X1_RVT U531 ( .A1(n203), .A2(n342), .A3(n193), .A4(n202), .Y(n326) );
  AO22X1_RVT U532 ( .A1(n204), .A2(n342), .A3(n193), .A4(n486), .Y(n525) );
  OR2X2_RVT U533 ( .A1(n208), .A2(n205), .Y(n880) );
  AO22X1_RVT U534 ( .A1(n212), .A2(n145), .A3(n92), .A4(n211), .Y(n792) );
  OR2X1_RVT U535 ( .A1(n871), .A2(n215), .Y(n883) );
  NBUFFX2_RVT U536 ( .A(im_2[4]), .Y(n221) );
  AND2X1_RVT U537 ( .A1(n222), .A2(n508), .Y(n478) );
  XNOR2X2_RVT U538 ( .A1(n221), .A2(n485), .Y(n273) );
  XOR3X2_RVT U539 ( .A1(n280), .A2(n279), .A3(n281), .Y(n349) );
  FADDX1_RVT U540 ( .A(n279), .B(n281), .CI(n280), .CO(n310) );
  OAI22X1_RVT U541 ( .A1(n571), .A2(n261), .A3(n260), .A4(n299), .Y(n312) );
  OAI22X1_RVT U542 ( .A1(n115), .A2(n274), .A3(n262), .A4(n406), .Y(n311) );
  AO22X1_RVT U543 ( .A1(n143), .A2(n92), .A3(n212), .A4(n224), .Y(n642) );
  OAI22X1_RVT U544 ( .A1(n532), .A2(n278), .A3(n277), .A4(n169), .Y(n282) );
  AO21X1_RVT U545 ( .A1(n52), .A2(n170), .A3(n531), .Y(n545) );
  FADDX1_RVT U546 ( .A(n16), .B(n187), .CI(n669), .CO(n905) );
  AO22X1_RVT U547 ( .A1(n688), .A2(n687), .A3(n626), .A4(n686), .Y(n669) );
  XOR3X2_RVT U548 ( .A1(n482), .A2(n483), .A3(n481), .Y(n475) );
  FADDX1_RVT U549 ( .A(n66), .B(n481), .CI(n482), .CO(n500) );
  XOR3X2_RVT U550 ( .A1(n231), .A2(n232), .A3(n229), .Y(n770) );
  INVX0_RVT U551 ( .A(n230), .Y(n229) );
  OA22X1_RVT U552 ( .A1(n647), .A2(n209), .A3(n714), .A4(n716), .Y(n230) );
  OA22X1_RVT U553 ( .A1(n649), .A2(n227), .A3(n719), .A4(n228), .Y(n231) );
  NOR2X0_RVT U554 ( .A1(n461), .A2(n462), .Y(n464) );
  OAI22X1_RVT U555 ( .A1(n535), .A2(n273), .A3(n246), .A4(n536), .Y(n285) );
  NBUFFX2_RVT U556 ( .A(n597), .Y(n503) );
  AO21X1_RVT U557 ( .A1(n925), .A2(n240), .A3(n917), .Y(n233) );
  AND2X1_RVT U558 ( .A1(n240), .A2(n926), .Y(n234) );
  AND2X1_RVT U559 ( .A1(n432), .A2(n431), .Y(n235) );
  AND2X1_RVT U560 ( .A1(n419), .A2(n417), .Y(n236) );
  AO21X1_RVT U561 ( .A1(n468), .A2(n467), .A3(n466), .Y(n237) );
  OR2X1_RVT U562 ( .A1(n828), .A2(n829), .Y(n239) );
  OR2X1_RVT U563 ( .A1(n915), .A2(n916), .Y(n240) );
  OR2X1_RVT U564 ( .A1(n814), .A2(n175), .Y(n812) );
  AND2X1_RVT U565 ( .A1(n809), .A2(n803), .Y(n804) );
  OR2X1_RVT U566 ( .A1(n803), .A2(n400), .Y(n401) );
  OAI22X1_RVT U567 ( .A1(n115), .A2(n407), .A3(n816), .A4(n406), .Y(n411) );
  OAI22X1_RVT U568 ( .A1(n405), .A2(n403), .A3(n803), .A4(n83), .Y(n413) );
  OAI22X1_RVT U569 ( .A1(n354), .A2(n1), .A3(n380), .A4(n167), .Y(n390) );
  AOI21X1_RVT U570 ( .A1(n419), .A2(n418), .A3(n236), .Y(n423) );
  XNOR2X1_RVT U571 ( .A1(n811), .A2(n75), .Y(n676) );
  XNOR2X1_RVT U572 ( .A1(n104), .A2(n715), .Y(n646) );
  OAI22X1_RVT U573 ( .A1(n383), .A2(n251), .A3(n320), .A4(n319), .Y(n343) );
  OAI22X1_RVT U574 ( .A1(n571), .A2(n244), .A3(n261), .A4(n299), .Y(n286) );
  INVX1_RVT U575 ( .A(n889), .Y(n657) );
  XNOR2X1_RVT U576 ( .A1(n109), .A2(n75), .Y(n886) );
  NOR2X0_RVT U577 ( .A1(n459), .A2(n460), .Y(n458) );
  XNOR2X1_RVT U578 ( .A1(n9), .A2(n70), .Y(n873) );
  XNOR2X1_RVT U579 ( .A1(n104), .A2(n872), .Y(n293) );
  XNOR2X1_RVT U580 ( .A1(n14), .A2(n177), .Y(n301) );
  XNOR2X1_RVT U581 ( .A1(n870), .A2(re_2[2]), .Y(n257) );
  OAI22X2_RVT U582 ( .A1(n301), .A2(n10), .A3(n575), .A4(n257), .Y(n289) );
  XNOR2X1_RVT U583 ( .A1(n715), .A2(n378), .Y(n250) );
  XNOR2X1_RVT U584 ( .A1(im_2[2]), .A2(n547), .Y(n244) );
  XNOR2X1_RVT U585 ( .A1(im_2[1]), .A2(n547), .Y(n261) );
  XNOR2X1_RVT U586 ( .A1(n109), .A2(n378), .Y(n294) );
  OAI22X2_RVT U587 ( .A1(n571), .A2(n300), .A3(n244), .A4(n572), .Y(n290) );
  XNOR2X1_RVT U588 ( .A1(n608), .A2(n116), .Y(n278) );
  XNOR2X1_RVT U589 ( .A1(im_2[2]), .A2(n485), .Y(n247) );
  AND2X1_RVT U590 ( .A1(n802), .A2(n194), .Y(n314) );
  XNOR2X1_RVT U591 ( .A1(n811), .A2(n485), .Y(n341) );
  OAI22X1_RVT U592 ( .A1(n535), .A2(n247), .A3(n341), .A4(n536), .Y(n345) );
  XNOR2X1_RVT U593 ( .A1(n226), .A2(n79), .Y(n253) );
  NAND2X2_RVT U594 ( .A1(n96), .A2(n115), .Y(n406) );
  XNOR2X1_RVT U595 ( .A1(n803), .A2(n870), .Y(n248) );
  OR2X2_RVT U596 ( .A1(n802), .A2(n9), .Y(n252) );
  OAI22X2_RVT U597 ( .A1(n532), .A2(n277), .A3(n253), .A4(n321), .Y(n280) );
  NAND2X0_RVT U598 ( .A1(n328), .A2(n327), .Y(n268) );
  XNOR2X1_RVT U599 ( .A1(n802), .A2(n547), .Y(n260) );
  FADDX1_RVT U600 ( .A(n265), .B(n263), .CI(n264), .CO(n269), .S(n350) );
  NAND2X0_RVT U601 ( .A1(n328), .A2(n329), .Y(n267) );
  NAND2X0_RVT U602 ( .A1(n327), .A2(n329), .Y(n266) );
  NAND3X0_RVT U603 ( .A1(n268), .A2(n267), .A3(n266), .Y(n334) );
  AND2X1_RVT U604 ( .A1(n166), .A2(n272), .Y(n303) );
  XNOR2X1_RVT U605 ( .A1(n715), .A2(n485), .Y(n298) );
  AO21X1_RVT U606 ( .A1(n406), .A2(n115), .A3(n274), .Y(n284) );
  XOR3X2_RVT U607 ( .A1(n303), .A2(n304), .A3(n302), .Y(n296) );
  FADDX1_RVT U608 ( .A(n284), .B(n283), .CI(n282), .CO(n302), .S(n309) );
  FADDX1_RVT U609 ( .A(n286), .B(n287), .CI(n285), .CO(n306), .S(n308) );
  FADDX1_RVT U610 ( .A(n290), .B(n291), .CI(n292), .CO(n498) );
  AO21X1_RVT U611 ( .A1(n319), .A2(n383), .A3(n293), .Y(n488) );
  FADDX1_RVT U612 ( .A(n297), .B(n296), .CI(n295), .CO(n482), .S(n333) );
  XNOR2X1_RVT U613 ( .A1(n221), .A2(n547), .Y(n493) );
  INVX1_RVT U614 ( .A(n530), .Y(n494) );
  FADDX1_RVT U615 ( .A(n304), .B(n302), .CI(n303), .CO(n490) );
  FADDX1_RVT U616 ( .A(n307), .B(n306), .CI(n305), .CO(n489), .S(n335) );
  FADDX1_RVT U617 ( .A(n310), .B(n308), .CI(n309), .CO(n295), .S(n338) );
  HADDX1_RVT U618 ( .A0(n315), .B0(n314), .C1(n325), .SO(n363) );
  XNOR2X1_RVT U619 ( .A1(n15), .A2(n608), .Y(n353) );
  XNOR2X1_RVT U620 ( .A1(im_2[2]), .A2(n378), .Y(n354) );
  XNOR2X1_RVT U621 ( .A1(n104), .A2(n79), .Y(n352) );
  XNOR2X1_RVT U622 ( .A1(n803), .A2(n226), .Y(n322) );
  XOR3X2_RVT U623 ( .A1(n329), .A2(n328), .A3(n327), .Y(n336) );
  NAND2X0_RVT U624 ( .A1(n338), .A2(n336), .Y(n331) );
  NAND2X0_RVT U625 ( .A1(n339), .A2(n336), .Y(n330) );
  NAND3X0_RVT U626 ( .A1(n332), .A2(n330), .A3(n331), .Y(n473) );
  FADDX1_RVT U627 ( .A(n335), .B(n334), .CI(n333), .CO(n476), .S(n474) );
  AND2X1_RVT U628 ( .A1(n803), .A2(n61), .Y(n396) );
  INVX1_RVT U629 ( .A(n535), .Y(n342) );
  AND2X1_RVT U630 ( .A1(n802), .A2(n342), .Y(n395) );
  FADDX1_RVT U631 ( .A(n343), .B(n345), .CI(n344), .CO(n324), .S(n365) );
  FADDX1_RVT U632 ( .A(n348), .B(n347), .CI(n346), .CO(n351), .S(n364) );
  XNOR2X1_RVT U633 ( .A1(n15), .A2(n177), .Y(n375) );
  XNOR2X1_RVT U634 ( .A1(n811), .A2(n378), .Y(n380) );
  FADDX1_RVT U635 ( .A(n357), .B(n356), .CI(n355), .CO(n361), .S(n447) );
  FADDX1_RVT U636 ( .A(n360), .B(n359), .CI(n358), .CO(n362), .S(n446) );
  FADDX1_RVT U637 ( .A(n363), .B(n362), .CI(n361), .CO(n369), .S(n450) );
  XOR3X2_RVT U638 ( .A1(n373), .A2(n372), .A3(n371), .Y(n470) );
  AND2X1_RVT U639 ( .A1(n478), .A2(n511), .Y(n480) );
  AND2X1_RVT U640 ( .A1(n803), .A2(n123), .Y(n410) );
  AND2X1_RVT U641 ( .A1(n802), .A2(n374), .Y(n409) );
  XNOR2X1_RVT U642 ( .A1(n15), .A2(n79), .Y(n404) );
  XNOR2X1_RVT U643 ( .A1(n802), .A2(n378), .Y(n379) );
  XNOR2X1_RVT U644 ( .A1(n803), .A2(n104), .Y(n381) );
  FADDX1_RVT U645 ( .A(n389), .B(n388), .CI(n387), .CO(n454), .S(n428) );
  FADDX1_RVT U646 ( .A(n392), .B(n391), .CI(n390), .CO(n448), .S(n453) );
  HADDX1_RVT U647 ( .A0(n396), .B0(n395), .C1(n440), .SO(n444) );
  FADDX1_RVT U648 ( .A(n399), .B(n397), .CI(n398), .CO(n443), .S(n429) );
  INVX1_RVT U649 ( .A(n15), .Y(n400) );
  NAND2X0_RVT U650 ( .A1(n83), .A2(n401), .Y(n412) );
  HADDX1_RVT U651 ( .A0(n410), .B0(n409), .C1(n430), .SO(n425) );
  FADDX1_RVT U652 ( .A(n413), .B(n412), .CI(n411), .CO(n420), .S(n419) );
  AND2X1_RVT U653 ( .A1(n802), .A2(n809), .Y(n415) );
  AND2X1_RVT U654 ( .A1(n803), .A2(n814), .Y(n414) );
  AND2X1_RVT U655 ( .A1(n415), .A2(n414), .Y(n418) );
  OR2X1_RVT U656 ( .A1(n802), .A2(n96), .Y(n416) );
  NOR2X0_RVT U657 ( .A1(n115), .A2(n416), .Y(n417) );
  NAND2X0_RVT U658 ( .A1(n421), .A2(n420), .Y(n422) );
  OAI21X2_RVT U659 ( .A1(n424), .A2(n423), .A3(n422), .Y(n434) );
  FADDX1_RVT U660 ( .A(n427), .B(n426), .CI(n425), .CO(n431), .S(n421) );
  FADDX1_RVT U661 ( .A(n430), .B(n429), .CI(n428), .CO(n435), .S(n432) );
  OR2X1_RVT U662 ( .A1(n431), .A2(n432), .Y(n433) );
  NAND2X0_RVT U663 ( .A1(n436), .A2(n435), .Y(n437) );
  FADDX1_RVT U664 ( .A(n442), .B(n441), .CI(n440), .CO(n366), .S(n457) );
  FADDX1_RVT U665 ( .A(n445), .B(n444), .CI(n443), .CO(n456), .S(n452) );
  FADDX1_RVT U666 ( .A(n448), .B(n446), .CI(n447), .CO(n451), .S(n455) );
  FADDX1_RVT U667 ( .A(n451), .B(n450), .CI(n449), .CO(n371), .S(n462) );
  FADDX1_RVT U668 ( .A(n457), .B(n456), .CI(n455), .CO(n461), .S(n460) );
  NAND2X0_RVT U669 ( .A1(n460), .A2(n459), .Y(n465) );
  NAND2X0_RVT U670 ( .A1(n462), .A2(n461), .Y(n463) );
  NAND2X0_RVT U671 ( .A1(n470), .A2(n469), .Y(n515) );
  OA21X1_RVT U672 ( .A1(n515), .A2(n517), .A3(n518), .Y(n472) );
  NAND2X0_RVT U673 ( .A1(n476), .A2(n475), .Y(n507) );
  AO21X1_RVT U674 ( .A1(n480), .A2(n55), .A3(n479), .Y(n597) );
  XNOR2X1_RVT U675 ( .A1(n14), .A2(n18), .Y(n527) );
  XNOR2X1_RVT U676 ( .A1(n109), .A2(n485), .Y(n534) );
  FADDX1_RVT U677 ( .A(n491), .B(n490), .CI(n489), .CO(n522), .S(n481) );
  XNOR2X1_RVT U678 ( .A1(n715), .A2(n547), .Y(n533) );
  FADDX1_RVT U679 ( .A(n496), .B(n495), .CI(n494), .CO(n539), .S(n491) );
  FADDX1_RVT U680 ( .A(n499), .B(n498), .CI(n497), .CO(n537), .S(n483) );
  XOR3X2_RVT U681 ( .A1(n538), .A2(n539), .A3(n537), .Y(n521) );
  INVX1_RVT U682 ( .A(n540), .Y(n561) );
  NAND2X0_RVT U683 ( .A1(n501), .A2(n500), .Y(n559) );
  NAND2X0_RVT U684 ( .A1(n561), .A2(n559), .Y(n502) );
  XNOR2X2_RVT U685 ( .A1(n503), .A2(n502), .Y(mul_dout_re[3]) );
  OAI21X2_RVT U686 ( .A1(n472), .A2(n504), .A3(n512), .Y(n505) );
  NAND2X0_RVT U687 ( .A1(n507), .A2(n508), .Y(n509) );
  NAND2X0_RVT U688 ( .A1(n91), .A2(n512), .Y(n513) );
  XOR2X2_RVT U689 ( .A1(n514), .A2(n513), .Y(mul_dout_re[1]) );
  NAND2X0_RVT U690 ( .A1(n59), .A2(n518), .Y(n519) );
  XOR2X2_RVT U691 ( .A1(n520), .A2(n519), .Y(mul_dout_re[0]) );
  FADDX1_RVT U692 ( .A(n523), .B(n522), .CI(n521), .CO(n541), .S(n501) );
  FADDX1_RVT U693 ( .A(n526), .B(n525), .CI(n524), .CO(n554), .S(n523) );
  OAI22X2_RVT U694 ( .A1(n546), .A2(n10), .A3(n527), .A4(n575), .Y(n577) );
  INVX1_RVT U695 ( .A(n577), .Y(n551) );
  FADDX1_RVT U696 ( .A(n530), .B(n529), .CI(n528), .CO(n550), .S(n538) );
  XNOR2X1_RVT U697 ( .A1(n547), .A2(n4), .Y(n548) );
  FADDX1_RVT U698 ( .A(n539), .B(n538), .CI(n537), .CO(n552) );
  NAND2X0_RVT U699 ( .A1(n541), .A2(n542), .Y(n563) );
  OAI21X2_RVT U700 ( .A1(n562), .A2(n559), .A3(n563), .Y(n594) );
  AO21X1_RVT U701 ( .A1(n588), .A2(n597), .A3(n594), .Y(n558) );
  FADDX1_RVT U702 ( .A(n545), .B(n544), .CI(n543), .CO(n581), .S(n549) );
  XNOR2X1_RVT U703 ( .A1(n14), .A2(n70), .Y(n573) );
  XNOR2X1_RVT U704 ( .A1(n109), .A2(n547), .Y(n570) );
  FADDX1_RVT U705 ( .A(n551), .B(n550), .CI(n549), .CO(n579), .S(n553) );
  FADDX1_RVT U706 ( .A(n554), .B(n553), .CI(n552), .CO(n556), .S(n542) );
  NAND2X0_RVT U707 ( .A1(n556), .A2(n555), .Y(n590) );
  XOR2X2_RVT U708 ( .A1(n558), .A2(n147), .Y(mul_dout_re[5]) );
  AO21X1_RVT U709 ( .A1(n192), .A2(n561), .A3(n560), .Y(n566) );
  AND2X1_RVT U710 ( .A1(n564), .A2(n563), .Y(n565) );
  XOR2X2_RVT U711 ( .A1(n566), .A2(n565), .Y(mul_dout_re[4]) );
  OAI21X1_RVT U712 ( .A1(n587), .A2(n174), .A3(n590), .Y(n568) );
  AO21X1_RVT U713 ( .A1(n597), .A2(n569), .A3(n568), .Y(n586) );
  AO21X1_RVT U714 ( .A1(n107), .A2(n571), .A3(n570), .Y(n600) );
  AO21X1_RVT U715 ( .A1(n575), .A2(n10), .A3(n573), .Y(n601) );
  INVX1_RVT U716 ( .A(n601), .Y(n599) );
  FADDX1_RVT U717 ( .A(n578), .B(n577), .CI(n576), .CO(n598), .S(n580) );
  FADDX1_RVT U718 ( .A(n581), .B(n580), .CI(n579), .CO(n583), .S(n555) );
  INVX0_RVT U719 ( .A(n591), .Y(n584) );
  NAND2X0_RVT U720 ( .A1(n583), .A2(n582), .Y(n589) );
  AND2X1_RVT U721 ( .A1(n584), .A2(n589), .Y(n585) );
  XOR2X2_RVT U722 ( .A1(n586), .A2(n585), .Y(mul_dout_re[6]) );
  AND2X1_RVT U723 ( .A1(n593), .A2(n588), .Y(n596) );
  OAI21X1_RVT U724 ( .A1(n591), .A2(n590), .A3(n589), .Y(n592) );
  AO21X1_RVT U725 ( .A1(n192), .A2(n596), .A3(n595), .Y(n606) );
  FADDX1_RVT U726 ( .A(n600), .B(n599), .CI(n598), .CO(n602), .S(n582) );
  OR2X1_RVT U727 ( .A1(n601), .A2(n602), .Y(n604) );
  NAND2X0_RVT U728 ( .A1(n602), .A2(n601), .Y(n603) );
  AND2X1_RVT U729 ( .A1(n604), .A2(n603), .Y(n605) );
  XOR2X2_RVT U730 ( .A1(n606), .A2(n605), .Y(mul_dout_re[7]) );
  OAI22X1_RVT U731 ( .A1(n124), .A2(n656), .A3(n127), .A4(n615), .Y(n667) );
  AO21X1_RVT U732 ( .A1(n140), .A2(n807), .A3(n635), .Y(n628) );
  XNOR2X2_RVT U733 ( .A1(n109), .A2(n81), .Y(n616) );
  OAI22X1_RVT U734 ( .A1(n220), .A2(n616), .A3(n632), .A4(n160), .Y(n627) );
  FADDX1_RVT U735 ( .A(n624), .B(n623), .CI(n625), .CO(n666) );
  XNOR2X2_RVT U736 ( .A1(n70), .A2(n698), .Y(n661) );
  AO21X1_RVT U737 ( .A1(n228), .A2(n227), .A3(n612), .Y(n889) );
  AO21X1_RVT U738 ( .A1(n51), .A2(n25), .A3(n611), .Y(n664) );
  OAI22X1_RVT U739 ( .A1(n655), .A2(n880), .A3(n716), .A4(n614), .Y(n663) );
  OAI22X1_RVT U740 ( .A1(n621), .A2(n716), .A3(n880), .A4(n614), .Y(n653) );
  OAI22X1_RVT U741 ( .A1(n616), .A2(n127), .A3(n615), .A4(n124), .Y(n650) );
  XNOR2X2_RVT U742 ( .A1(n618), .A2(n617), .Y(n651) );
  OR2X1_RVT U743 ( .A1(n650), .A2(n653), .Y(n619) );
  AO22X1_RVT U744 ( .A1(n653), .A2(n650), .A3(n651), .A4(n619), .Y(n670) );
  INVX2_RVT U745 ( .A(n802), .Y(n816) );
  NAND2X2_RVT U746 ( .A1(n811), .A2(n816), .Y(n813) );
  AO21X1_RVT U747 ( .A1(n813), .A2(n816), .A3(n641), .Y(n673) );
  OAI22X1_RVT U748 ( .A1(n620), .A2(n25), .A3(n750), .A4(n645), .Y(n672) );
  OAI22X1_RVT U749 ( .A1(n621), .A2(n880), .A3(n716), .A4(n646), .Y(n671) );
  XOR3X2_RVT U750 ( .A1(n625), .A2(n624), .A3(n623), .Y(n686) );
  XOR3X2_RVT U751 ( .A1(n668), .A2(n670), .A3(n669), .Y(n694) );
  OAI22X1_RVT U752 ( .A1(n220), .A2(n632), .A3(n631), .A4(n160), .Y(n678) );
  OAI22X1_RVT U753 ( .A1(n807), .A2(n635), .A3(n648), .A4(n140), .Y(n682) );
  OAI22X1_RVT U754 ( .A1(n649), .A2(n78), .A3(n227), .A4(n639), .Y(n709) );
  OAI22X1_RVT U755 ( .A1(n676), .A2(n813), .A3(n816), .A4(n641), .Y(n707) );
  FADDX1_RVT U756 ( .A(n644), .B(n642), .CI(n643), .CO(n687), .S(n725) );
  OAI22X1_RVT U757 ( .A1(n647), .A2(n716), .A3(n880), .A4(n646), .Y(n723) );
  XOR3X2_RVT U758 ( .A1(n654), .A2(n653), .A3(n652), .Y(n691) );
  OAI22X1_RVT U759 ( .A1(n655), .A2(n716), .A3(n209), .A4(n879), .Y(n898) );
  OAI22X1_RVT U760 ( .A1(n656), .A2(n127), .A3(n884), .A4(n124), .Y(n897) );
  FADDX1_RVT U761 ( .A(n659), .B(n658), .CI(n657), .CO(n896), .S(n665) );
  OAI22X1_RVT U762 ( .A1(n661), .A2(n225), .A3(n876), .A4(n217), .Y(n887) );
  FADDX1_RVT U763 ( .A(n667), .B(n666), .CI(n665), .CO(n902), .S(n695) );
  XOR3X2_RVT U764 ( .A1(n903), .A2(n904), .A3(n902), .Y(n906) );
  FADDX1_RVT U765 ( .A(n673), .B(n672), .CI(n671), .CO(n688), .S(n732) );
  HADDX1_RVT U766 ( .A0(n675), .B0(n674), .C1(n708), .SO(n702) );
  FADDX1_RVT U767 ( .A(n679), .B(n678), .CI(n677), .CO(n684), .S(n705) );
  FADDX1_RVT U768 ( .A(n682), .B(n681), .CI(n680), .CO(n683), .S(n704) );
  FADDX1_RVT U769 ( .A(n685), .B(n684), .CI(n683), .CO(n690), .S(n730) );
  XOR3X2_RVT U770 ( .A1(n688), .A2(n687), .A3(n686), .Y(n734) );
  XOR3X2_RVT U771 ( .A1(n691), .A2(n690), .A3(n689), .Y(n733) );
  OR2X1_RVT U772 ( .A1(n735), .A2(n734), .Y(n692) );
  AO22X1_RVT U773 ( .A1(n735), .A2(n734), .A3(n733), .A4(n692), .Y(n862) );
  OAI22X1_RVT U774 ( .A1(n754), .A2(n140), .A3(n807), .A4(n699), .Y(n749) );
  OAI22X1_RVT U775 ( .A1(n742), .A2(n813), .A3(n816), .A4(n700), .Y(n748) );
  OAI22X1_RVT U776 ( .A1(n752), .A2(n51), .A3(n25), .A4(n710), .Y(n747) );
  FADDX1_RVT U777 ( .A(n702), .B(n701), .CI(n703), .CO(n706), .S(n768) );
  FADDX1_RVT U778 ( .A(n706), .B(n705), .CI(n704), .CO(n731), .S(n776) );
  FADDX1_RVT U779 ( .A(n709), .B(n708), .CI(n707), .CO(n726), .S(n729) );
  OAI22X1_RVT U780 ( .A1(n711), .A2(n25), .A3(n51), .A4(n710), .Y(n767) );
  OAI22X1_RVT U781 ( .A1(n880), .A2(n714), .A3(n713), .A4(n716), .Y(n757) );
  OAI22X1_RVT U782 ( .A1(n718), .A2(n209), .A3(n717), .A4(n716), .Y(n756) );
  XOR3X2_RVT U783 ( .A1(n722), .A2(n723), .A3(n721), .Y(n727) );
  FADDX1_RVT U784 ( .A(n775), .B(n99), .CI(n774), .CO(n859) );
  FADDX1_RVT U785 ( .A(n726), .B(n724), .CI(n725), .CO(n689), .S(n736) );
  FADDX1_RVT U786 ( .A(n732), .B(n730), .CI(n731), .CO(n735), .S(n737) );
  XOR3X2_RVT U787 ( .A1(n736), .A2(n738), .A3(n737), .Y(n860) );
  AND2X1_RVT U788 ( .A1(n954), .A2(n188), .Y(n940) );
  AND2X1_RVT U789 ( .A1(n940), .A2(n867), .Y(n869) );
  OAI22X1_RVT U790 ( .A1(n816), .A2(n742), .A3(n813), .A4(n794), .Y(n783) );
  OAI22X1_RVT U791 ( .A1(n743), .A2(n227), .A3(n176), .A4(n78), .Y(n797) );
  OAI22X1_RVT U792 ( .A1(n745), .A2(n25), .A3(n744), .A4(n51), .Y(n796) );
  OAI22X1_RVT U793 ( .A1(n25), .A2(n751), .A3(n746), .A4(n51), .Y(n795) );
  FADDX1_RVT U794 ( .A(n749), .B(n748), .CI(n747), .CO(n769), .S(n789) );
  OAI22X1_RVT U795 ( .A1(n752), .A2(n25), .A3(n751), .A4(n51), .Y(n787) );
  OAI22X1_RVT U796 ( .A1(n807), .A2(n754), .A3(n140), .A4(n777), .Y(n786) );
  OAI22X1_RVT U797 ( .A1(n755), .A2(n227), .A3(n78), .A4(n778), .Y(n785) );
  FADDX1_RVT U798 ( .A(n756), .B(n757), .CI(n758), .CO(n766), .S(n763) );
  FADDX1_RVT U799 ( .A(n759), .B(n760), .CI(n761), .CO(n765), .S(n762) );
  FADDX1_RVT U800 ( .A(n764), .B(n763), .CI(n762), .CO(n773), .S(n788) );
  FADDX1_RVT U801 ( .A(n767), .B(n766), .CI(n765), .CO(n728), .S(n772) );
  FADDX1_RVT U802 ( .A(n770), .B(n769), .CI(n768), .CO(n775), .S(n771) );
  FADDX1_RVT U803 ( .A(n773), .B(n772), .CI(n771), .CO(n854), .S(n852) );
  OAI22X1_RVT U804 ( .A1(n799), .A2(n140), .A3(n807), .A4(n777), .Y(n793) );
  FADDX1_RVT U805 ( .A(n784), .B(n783), .CI(n782), .CO(n790), .S(n838) );
  FADDX1_RVT U806 ( .A(n787), .B(n786), .CI(n785), .CO(n764), .S(n840) );
  FADDX1_RVT U807 ( .A(n839), .B(n122), .CI(n840), .CO(n846) );
  NOR2X0_RVT U808 ( .A1(n846), .A2(n847), .Y(n850) );
  FADDX1_RVT U809 ( .A(n793), .B(n792), .CI(n791), .CO(n839), .S(n830) );
  XNOR2X2_RVT U810 ( .A1(n811), .A2(n81), .Y(n798) );
  OAI22X1_RVT U811 ( .A1(n798), .A2(n813), .A3(n816), .A4(n794), .Y(n837) );
  FADDX1_RVT U812 ( .A(n797), .B(n796), .CI(n795), .CO(n782), .S(n836) );
  XNOR2X2_RVT U813 ( .A1(n15), .A2(n811), .Y(n815) );
  OAI22X1_RVT U814 ( .A1(n816), .A2(n798), .A3(n815), .A4(n813), .Y(n827) );
  OAI22X1_RVT U815 ( .A1(n807), .A2(n799), .A3(n140), .A4(n806), .Y(n826) );
  HADDX1_RVT U816 ( .A0(n801), .B0(n800), .C1(n791), .SO(n825) );
  NOR2X0_RVT U817 ( .A1(n830), .A2(n831), .Y(n834) );
  AND2X1_RVT U818 ( .A1(n814), .A2(n802), .Y(n805) );
  NAND2X0_RVT U819 ( .A1(n805), .A2(n804), .Y(n821) );
  OAI22X1_RVT U820 ( .A1(n809), .A2(n140), .A3(n807), .A4(n806), .Y(n817) );
  NAND2X0_RVT U821 ( .A1(n140), .A2(n810), .Y(n824) );
  NAND2X0_RVT U822 ( .A1(n813), .A2(n812), .Y(n823) );
  OAI22X1_RVT U823 ( .A1(n816), .A2(n815), .A3(n814), .A4(n813), .Y(n822) );
  NOR2X0_RVT U824 ( .A1(n817), .A2(n818), .Y(n820) );
  NAND2X0_RVT U825 ( .A1(n818), .A2(n817), .Y(n819) );
  FADDX1_RVT U826 ( .A(n824), .B(n823), .CI(n822), .CO(n828), .S(n818) );
  FADDX1_RVT U827 ( .A(n827), .B(n826), .CI(n825), .CO(n835), .S(n829) );
  NAND2X0_RVT U828 ( .A1(n831), .A2(n830), .Y(n832) );
  OA21X1_RVT U829 ( .A1(n834), .A2(n833), .A3(n832), .Y(n845) );
  XOR3X2_RVT U830 ( .A1(n840), .A2(n839), .A3(n838), .Y(n842) );
  NOR2X0_RVT U831 ( .A1(n841), .A2(n842), .Y(n844) );
  NAND2X0_RVT U832 ( .A1(n841), .A2(n842), .Y(n843) );
  OA21X1_RVT U833 ( .A1(n845), .A2(n844), .A3(n843), .Y(n849) );
  NAND2X0_RVT U834 ( .A1(n846), .A2(n847), .Y(n848) );
  NAND2X0_RVT U835 ( .A1(n851), .A2(n852), .Y(n857) );
  NAND2X0_RVT U836 ( .A1(n854), .A2(n853), .Y(n855) );
  AO21X1_RVT U837 ( .A1(n24), .A2(n217), .A3(n873), .Y(n922) );
  AO21X1_RVT U838 ( .A1(n127), .A2(n124), .A3(n875), .Y(n919) );
  OAI22X1_RVT U839 ( .A1(n878), .A2(n24), .A3(n873), .A4(n217), .Y(n882) );
  OAI22X1_RVT U840 ( .A1(n886), .A2(n127), .A3(n875), .A4(n124), .Y(n881) );
  INVX2_RVT U841 ( .A(n883), .Y(n892) );
  AO21X1_RVT U842 ( .A1(n716), .A2(n880), .A3(n879), .Y(n890) );
  FADDX1_RVT U843 ( .A(n883), .B(n882), .CI(n881), .CO(n918), .S(n894) );
  OAI22X1_RVT U844 ( .A1(n124), .A2(n886), .A3(n127), .A4(n884), .Y(n901) );
  FADDX1_RVT U845 ( .A(n889), .B(n888), .CI(n887), .CO(n900), .S(n903) );
  FADDX1_RVT U846 ( .A(n892), .B(n891), .CI(n890), .CO(n895), .S(n899) );
  FADDX1_RVT U847 ( .A(n895), .B(n894), .CI(n893), .CO(n916), .S(n913) );
  FADDX1_RVT U848 ( .A(n898), .B(n897), .CI(n896), .CO(n910), .S(n907) );
  FADDX1_RVT U849 ( .A(n901), .B(n900), .CI(n899), .CO(n893), .S(n909) );
  FADDX1_RVT U850 ( .A(n904), .B(n903), .CI(n902), .CO(n908) );
  NOR2X0_RVT U851 ( .A1(n913), .A2(n914), .Y(n931) );
  FADDX1_RVT U852 ( .A(n910), .B(n909), .CI(n908), .CO(n914), .S(n912) );
  NOR2X0_RVT U853 ( .A1(n911), .A2(n912), .Y(n929) );
  NOR2X0_RVT U854 ( .A1(n931), .A2(n929), .Y(n926) );
  NAND2X0_RVT U855 ( .A1(n912), .A2(n911), .Y(n936) );
  NAND2X0_RVT U856 ( .A1(n914), .A2(n913), .Y(n932) );
  NAND2X0_RVT U857 ( .A1(n916), .A2(n915), .Y(n927) );
  FADDX1_RVT U858 ( .A(n920), .B(n919), .CI(n918), .CO(n923), .S(n915) );
  NAND2X0_RVT U859 ( .A1(n923), .A2(n922), .Y(n924) );
  NAND2X0_RVT U860 ( .A1(n933), .A2(n932), .Y(n934) );
  NAND2X0_RVT U861 ( .A1(n937), .A2(n936), .Y(n938) );
  XNOR2X2_RVT U862 ( .A1(n935), .A2(n938), .Y(mul_dout_im[4]) );
  NOR2X0_RVT U863 ( .A1(n939), .A2(n54), .Y(n943) );
  NAND2X0_RVT U864 ( .A1(n944), .A2(n697), .Y(n945) );
  XOR2X2_RVT U865 ( .A1(n946), .A2(n945), .Y(mul_dout_im[3]) );
  NAND2X0_RVT U866 ( .A1(n30), .A2(n947), .Y(n948) );
  XOR2X2_RVT U867 ( .A1(n949), .A2(n948), .Y(mul_dout_im[2]) );
  NAND2X0_RVT U868 ( .A1(n188), .A2(n146), .Y(n952) );
  XOR2X2_RVT U869 ( .A1(n953), .A2(n952), .Y(mul_dout_im[1]) );
  NAND2X0_RVT U870 ( .A1(n58), .A2(n954), .Y(n955) );
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
  wire   n45, n46, dout_vld_d, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n44;
  wire   [7:0] add_dout_re;
  wire   [7:0] add_dout_im;
  wire   [7:0] mul_dout_re;
  wire   [7:0] mul_dout_im;
  wire   [7:0] result_re;
  wire   [7:0] result_im;
  wire   [7:0] dout_im_d;
  wire   [7:0] dout_re_d;

  complex_add u_complex_add ( .re_1({din_re_1[7], n27, n16, n14, n44, n22, n5, 
        din_re_1[0]}), .im_1({n3, n8, n33, n29, n34, n25, n24, din_im_1[0]}), 
        .re_2({n35, n15, n37, n28, n38, n32, n17, din_re_2[0]}), .im_2({
        din_im_2[7], n7, n40, n30, n39, n4, n36, din_im_2[0]}), .add_din_vld(
        1'b0), .add_dout_re(add_dout_re), .add_dout_im(add_dout_im) );
  complex_mul u_complex_mul ( .re_1({din_re_1[7:4], n44, din_re_1[2], n45, 
        din_re_1[0]}), .im_1({n46, din_im_1[6:0]}), .re_2(din_re_2), .im_2({
        din_im_2[7], n31, din_im_2[5:3], n23, din_im_2[1:0]}), .mul_din_vld(
        1'b0), .mul_dout_re(mul_dout_re), .mul_dout_im(mul_dout_im) );
  DFFARX1_RVT dout_vld_d_reg ( .D(din_vld), .CLK(clk), .RSTB(n_rst), .Q(
        dout_vld_d) );
  DFFARX1_RVT dout_vld_reg ( .D(dout_vld_d), .CLK(clk), .RSTB(n_rst), .Q(
        dout_vld) );
  DFFARX1_RVT dout_im_d_reg_7_ ( .D(result_im[7]), .CLK(clk), .RSTB(n_rst), 
        .Q(dout_im_d[7]) );
  DFFARX1_RVT dout_im_reg_7_ ( .D(dout_im_d[7]), .CLK(clk), .RSTB(n_rst), .Q(
        dout_im[7]) );
  DFFARX1_RVT dout_im_d_reg_6_ ( .D(result_im[6]), .CLK(clk), .RSTB(n_rst), 
        .Q(dout_im_d[6]) );
  DFFARX1_RVT dout_im_reg_6_ ( .D(dout_im_d[6]), .CLK(clk), .RSTB(n_rst), .Q(
        dout_im[6]) );
  DFFARX1_RVT dout_im_d_reg_5_ ( .D(result_im[5]), .CLK(clk), .RSTB(n_rst), 
        .Q(dout_im_d[5]) );
  DFFARX1_RVT dout_im_reg_5_ ( .D(dout_im_d[5]), .CLK(clk), .RSTB(n_rst), .Q(
        dout_im[5]) );
  DFFARX1_RVT dout_im_d_reg_4_ ( .D(result_im[4]), .CLK(clk), .RSTB(n_rst), 
        .Q(dout_im_d[4]) );
  DFFARX1_RVT dout_im_reg_4_ ( .D(dout_im_d[4]), .CLK(clk), .RSTB(n_rst), .Q(
        dout_im[4]) );
  DFFARX1_RVT dout_im_d_reg_3_ ( .D(result_im[3]), .CLK(clk), .RSTB(n_rst), 
        .Q(dout_im_d[3]) );
  DFFARX1_RVT dout_im_reg_3_ ( .D(dout_im_d[3]), .CLK(clk), .RSTB(n_rst), .Q(
        dout_im[3]) );
  DFFARX1_RVT dout_im_d_reg_2_ ( .D(result_im[2]), .CLK(clk), .RSTB(n_rst), 
        .Q(dout_im_d[2]) );
  DFFARX1_RVT dout_im_reg_2_ ( .D(dout_im_d[2]), .CLK(clk), .RSTB(n_rst), .Q(
        dout_im[2]) );
  DFFARX1_RVT dout_im_d_reg_1_ ( .D(result_im[1]), .CLK(clk), .RSTB(n_rst), 
        .Q(dout_im_d[1]) );
  DFFARX1_RVT dout_im_reg_1_ ( .D(dout_im_d[1]), .CLK(clk), .RSTB(n_rst), .Q(
        dout_im[1]) );
  DFFARX1_RVT dout_im_d_reg_0_ ( .D(result_im[0]), .CLK(clk), .RSTB(n_rst), 
        .Q(dout_im_d[0]) );
  DFFARX1_RVT dout_im_reg_0_ ( .D(dout_im_d[0]), .CLK(clk), .RSTB(n_rst), .Q(
        dout_im[0]) );
  DFFARX1_RVT dout_re_d_reg_7_ ( .D(result_re[7]), .CLK(clk), .RSTB(n_rst), 
        .Q(dout_re_d[7]) );
  DFFARX1_RVT dout_re_d_reg_6_ ( .D(result_re[6]), .CLK(clk), .RSTB(n_rst), 
        .Q(dout_re_d[6]) );
  DFFARX1_RVT dout_re_d_reg_5_ ( .D(result_re[5]), .CLK(clk), .RSTB(n_rst), 
        .Q(dout_re_d[5]) );
  DFFARX1_RVT dout_re_d_reg_4_ ( .D(result_re[4]), .CLK(clk), .RSTB(n_rst), 
        .Q(dout_re_d[4]) );
  DFFARX1_RVT dout_re_d_reg_3_ ( .D(result_re[3]), .CLK(clk), .RSTB(n_rst), 
        .Q(dout_re_d[3]) );
  DFFARX1_RVT dout_re_d_reg_2_ ( .D(result_re[2]), .CLK(clk), .RSTB(n_rst), 
        .Q(dout_re_d[2]) );
  DFFARX1_RVT dout_re_d_reg_1_ ( .D(result_re[1]), .CLK(clk), .RSTB(n_rst), 
        .Q(dout_re_d[1]) );
  DFFARX1_RVT dout_re_d_reg_0_ ( .D(result_re[0]), .CLK(clk), .RSTB(n_rst), 
        .Q(dout_re_d[0]) );
  DFFARX1_RVT dout_re_reg_7_ ( .D(dout_re_d[7]), .CLK(clk), .RSTB(n_rst), .Q(
        dout_re[7]) );
  DFFARX1_RVT dout_re_reg_6_ ( .D(dout_re_d[6]), .CLK(clk), .RSTB(n_rst), .Q(
        dout_re[6]) );
  DFFARX1_RVT dout_re_reg_5_ ( .D(dout_re_d[5]), .CLK(clk), .RSTB(n_rst), .Q(
        dout_re[5]) );
  DFFARX1_RVT dout_re_reg_4_ ( .D(dout_re_d[4]), .CLK(clk), .RSTB(n_rst), .Q(
        dout_re[4]) );
  DFFARX1_RVT dout_re_reg_3_ ( .D(dout_re_d[3]), .CLK(clk), .RSTB(n_rst), .Q(
        dout_re[3]) );
  DFFARX1_RVT dout_re_reg_2_ ( .D(dout_re_d[2]), .CLK(clk), .RSTB(n_rst), .Q(
        dout_re[2]) );
  DFFARX1_RVT dout_re_reg_1_ ( .D(dout_re_d[1]), .CLK(clk), .RSTB(n_rst), .Q(
        dout_re[1]) );
  DFFARX1_RVT dout_re_reg_0_ ( .D(dout_re_d[0]), .CLK(clk), .RSTB(n_rst), .Q(
        dout_re[0]) );
  INVX2_RVT U24 ( .A(n21), .Y(n6) );
  NBUFFX4_RVT U25 ( .A(din_re_1[1]), .Y(n45) );
  NBUFFX4_RVT U26 ( .A(din_im_2[6]), .Y(n31) );
  NBUFFX2_RVT U27 ( .A(n46), .Y(n3) );
  NBUFFX2_RVT U28 ( .A(n23), .Y(n4) );
  NBUFFX2_RVT U29 ( .A(n45), .Y(n5) );
  NBUFFX8_RVT U30 ( .A(din_im_2[2]), .Y(n23) );
  NBUFFX8_RVT U31 ( .A(din_re_1[3]), .Y(n44) );
  AND2X1_RVT U32 ( .A1(add_dout_im[7]), .A2(n21), .Y(n13) );
  AND2X1_RVT U33 ( .A1(add_dout_re[6]), .A2(n21), .Y(n12) );
  AND2X1_RVT U34 ( .A1(add_dout_re[5]), .A2(n21), .Y(n11) );
  INVX0_RVT U35 ( .A(din_vld), .Y(n18) );
  MUX21X2_RVT U36 ( .A1(add_dout_re[7]), .A2(mul_dout_re[7]), .S0(n6), .Y(
        result_re[7]) );
  MUX21X2_RVT U37 ( .A1(add_dout_re[4]), .A2(mul_dout_re[4]), .S0(n6), .Y(
        result_re[4]) );
  NBUFFX2_RVT U38 ( .A(n31), .Y(n7) );
  MUX21X1_RVT U39 ( .A1(add_dout_re[3]), .A2(mul_dout_re[3]), .S0(n6), .Y(
        result_re[3]) );
  NBUFFX8_RVT U40 ( .A(din_im_1[7]), .Y(n46) );
  NBUFFX2_RVT U41 ( .A(din_im_1[6]), .Y(n8) );
  AO21X1_RVT U42 ( .A1(mul_dout_im[7]), .A2(n6), .A3(n13), .Y(result_im[7]) );
  AO21X1_RVT U43 ( .A1(mul_dout_re[5]), .A2(n6), .A3(n11), .Y(result_re[5]) );
  AO21X1_RVT U44 ( .A1(mul_dout_re[6]), .A2(n6), .A3(n12), .Y(result_re[6]) );
  AND2X1_RVT U45 ( .A1(add_dout_im[6]), .A2(n21), .Y(n9) );
  AND2X1_RVT U46 ( .A1(add_dout_im[5]), .A2(n21), .Y(n10) );
  AO21X1_RVT U47 ( .A1(mul_dout_im[6]), .A2(n6), .A3(n9), .Y(result_im[6]) );
  AO21X1_RVT U48 ( .A1(mul_dout_im[5]), .A2(n6), .A3(n10), .Y(result_im[5]) );
  MUX21X1_RVT U49 ( .A1(add_dout_im[3]), .A2(mul_dout_im[3]), .S0(n6), .Y(
        result_im[3]) );
  NBUFFX2_RVT U50 ( .A(din_re_1[4]), .Y(n14) );
  NBUFFX2_RVT U51 ( .A(din_re_2[6]), .Y(n15) );
  NBUFFX2_RVT U52 ( .A(din_im_1[5]), .Y(n33) );
  NBUFFX2_RVT U53 ( .A(din_re_1[2]), .Y(n22) );
  NBUFFX2_RVT U54 ( .A(din_im_1[1]), .Y(n24) );
  NBUFFX2_RVT U55 ( .A(din_im_1[2]), .Y(n25) );
  NBUFFX2_RVT U56 ( .A(din_re_1[6]), .Y(n27) );
  NBUFFX2_RVT U57 ( .A(din_re_2[4]), .Y(n28) );
  NBUFFX2_RVT U58 ( .A(din_im_1[4]), .Y(n29) );
  NBUFFX2_RVT U59 ( .A(din_im_2[4]), .Y(n30) );
  NBUFFX2_RVT U60 ( .A(din_re_1[5]), .Y(n16) );
  NBUFFX2_RVT U61 ( .A(din_re_2[2]), .Y(n32) );
  NBUFFX2_RVT U62 ( .A(din_im_1[3]), .Y(n34) );
  NBUFFX2_RVT U63 ( .A(din_re_2[7]), .Y(n35) );
  NBUFFX2_RVT U64 ( .A(din_im_2[1]), .Y(n36) );
  NBUFFX2_RVT U65 ( .A(din_re_2[5]), .Y(n37) );
  NBUFFX2_RVT U66 ( .A(din_re_2[1]), .Y(n17) );
  NBUFFX2_RVT U67 ( .A(din_re_2[3]), .Y(n38) );
  NBUFFX2_RVT U68 ( .A(din_im_2[3]), .Y(n39) );
  NBUFFX2_RVT U69 ( .A(din_im_2[5]), .Y(n40) );
  NOR2X2_RVT U72 ( .A1(cal_mode), .A2(n18), .Y(n21) );
  MUX21X1_RVT U73 ( .A1(mul_dout_re[2]), .A2(add_dout_re[2]), .S0(n21), .Y(
        result_re[2]) );
  NAND2X0_RVT U74 ( .A1(add_dout_im[4]), .A2(n21), .Y(n20) );
  NAND2X0_RVT U75 ( .A1(mul_dout_im[4]), .A2(n6), .Y(n19) );
  NAND2X0_RVT U76 ( .A1(n20), .A2(n19), .Y(result_im[4]) );
  MUX21X1_RVT U77 ( .A1(mul_dout_im[0]), .A2(add_dout_im[0]), .S0(n21), .Y(
        result_im[0]) );
  MUX21X1_RVT U78 ( .A1(mul_dout_im[1]), .A2(add_dout_im[1]), .S0(n21), .Y(
        result_im[1]) );
  MUX21X1_RVT U79 ( .A1(mul_dout_im[2]), .A2(add_dout_im[2]), .S0(n21), .Y(
        result_im[2]) );
  MUX21X1_RVT U80 ( .A1(mul_dout_re[0]), .A2(add_dout_re[0]), .S0(n21), .Y(
        result_re[0]) );
  MUX21X1_RVT U81 ( .A1(mul_dout_re[1]), .A2(add_dout_re[1]), .S0(n21), .Y(
        result_re[1]) );
endmodule

