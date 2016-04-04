
module g1 ( clk, a, rst, s );
  input clk, a, rst;
  output s;
  wire   N2, N10, N11, N12, N13, N14, N43, n32, n33, n34, n36,
         \add_36/carry[4] , \add_36/carry[3] , \add_36/carry[2] , n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65;
  wire   [4:0] cnt;

  DFFARX1_RVT \cnt_reg[0]  ( .D(n36), .CLK(clk), .RSTB(n65), .Q(cnt[0]), .QN(
        N10) );
  DFFARX1_RVT \cnt_reg[2]  ( .D(n33), .CLK(clk), .RSTB(n65), .Q(cnt[2]), .QN(
        n61) );
  DFFARX1_RVT \cnt_reg[1]  ( .D(n34), .CLK(clk), .RSTB(n65), .Q(cnt[1]), .QN(
        n64) );
  DFFARX1_RVT \cnt_reg[3]  ( .D(n32), .CLK(clk), .RSTB(n65), .Q(cnt[3]), .QN(
        n62) );
  DFFARX1_RVT s_reg ( .D(N43), .CLK(clk), .RSTB(n65), .Q(s) );
  AND2X1_RVT U32 ( .A1(rst), .A2(clk), .Y(N2) );
  SDFFARX1_RVT \cnt_reg[4]  ( .D(1'b0), .SI(n38), .SE(N14), .CLK(clk), .RSTB(
        n65), .Q(cnt[4]), .QN(n63) );
  HADDX1_RVT U34 ( .A0(cnt[1]), .B0(cnt[0]), .C1(\add_36/carry[2] ), .SO(N11)
         );
  HADDX1_RVT U35 ( .A0(cnt[2]), .B0(\add_36/carry[2] ), .C1(\add_36/carry[3] ), 
        .SO(N12) );
  HADDX1_RVT U36 ( .A0(cnt[3]), .B0(\add_36/carry[3] ), .C1(\add_36/carry[4] ), 
        .SO(N13) );
  XOR2X1_RVT U37 ( .A1(\add_36/carry[4] ), .A2(cnt[4]), .Y(N14) );
  INVX0_RVT U38 ( .A(N2), .Y(n65) );
  AO22X1_RVT U39 ( .A1(N10), .A2(n38), .A3(n39), .A4(a), .Y(n36) );
  AND2X1_RVT U40 ( .A1(n40), .A2(n41), .Y(n39) );
  AO21X1_RVT U41 ( .A1(n42), .A2(n43), .A3(n44), .Y(n41) );
  XOR2X1_RVT U42 ( .A1(n44), .A2(n45), .Y(n40) );
  AND2X1_RVT U43 ( .A1(N11), .A2(n38), .Y(n34) );
  AND2X1_RVT U44 ( .A1(N12), .A2(n38), .Y(n33) );
  AND2X1_RVT U45 ( .A1(N13), .A2(n38), .Y(n32) );
  XOR2X1_RVT U46 ( .A1(n46), .A2(n44), .Y(n38) );
  NAND2X0_RVT U47 ( .A1(n47), .A2(n45), .Y(n46) );
  INVX0_RVT U48 ( .A(n48), .Y(n45) );
  XNOR2X1_RVT U49 ( .A1(n42), .A2(n43), .Y(n47) );
  INVX0_RVT U50 ( .A(n49), .Y(n43) );
  INVX0_RVT U51 ( .A(n50), .Y(n42) );
  AO221X1_RVT U52 ( .A1(n44), .A2(n48), .A3(n63), .A4(n51), .A5(n52), .Y(N43)
         );
  MUX21X1_RVT U53 ( .A1(n53), .A2(n54), .S0(cnt[3]), .Y(n52) );
  AND2X1_RVT U54 ( .A1(n55), .A2(n56), .Y(n54) );
  AO21X1_RVT U55 ( .A1(n64), .A2(N10), .A3(n61), .Y(n55) );
  AND2X1_RVT U56 ( .A1(n57), .A2(cnt[4]), .Y(n53) );
  NAND2X0_RVT U57 ( .A1(n57), .A2(n62), .Y(n51) );
  INVX0_RVT U58 ( .A(n56), .Y(n57) );
  NAND3X0_RVT U59 ( .A1(n64), .A2(N10), .A3(n61), .Y(n56) );
  XOR2X1_RVT U60 ( .A1(n58), .A2(n59), .Y(n48) );
  AND2X1_RVT U61 ( .A1(n50), .A2(n49), .Y(n44) );
  AO22X1_RVT U62 ( .A1(cnt[1]), .A2(cnt[0]), .A3(n60), .A4(cnt[2]), .Y(n49) );
  AO22X1_RVT U63 ( .A1(cnt[4]), .A2(cnt[3]), .A3(n58), .A4(n59), .Y(n50) );
  XOR2X1_RVT U64 ( .A1(cnt[4]), .A2(cnt[3]), .Y(n59) );
  XOR2X1_RVT U65 ( .A1(cnt[2]), .A2(n60), .Y(n58) );
  XOR2X1_RVT U66 ( .A1(cnt[1]), .A2(cnt[0]), .Y(n60) );
endmodule

