
module g1 ( clk, a, rst, s );
  input clk, a, rst;
  output s;
  wire   N9, N10, N11, N12, N13, N42, n22, n23, n24, n37, n38, n39, n40, n41,
         \add_34/carry[4] , \add_34/carry[3] , \add_34/carry[2] , n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61;
  wire   [4:0] cnt;

  DFFARX1_RVT s_reg ( .D(N42), .CLK(clk), .RSTB(n61), .Q(s) );
  DFFX1_RVT \cnt_reg[0]  ( .D(n41), .CLK(clk), .Q(cnt[0]), .QN(N9) );
  DFFX1_RVT \cnt_reg[4]  ( .D(n40), .CLK(clk), .Q(n47) );
  DFFX1_RVT \cnt_reg[3]  ( .D(n37), .CLK(clk), .Q(cnt[3]), .QN(n22) );
  DFFX1_RVT \cnt_reg[2]  ( .D(n38), .CLK(clk), .Q(n50), .QN(n23) );
  DFFX1_RVT \cnt_reg[1]  ( .D(n39), .CLK(clk), .Q(n49), .QN(n24) );
  HADDX1_RVT U32 ( .A0(n49), .B0(cnt[0]), .C1(\add_34/carry[2] ), .SO(N10) );
  HADDX1_RVT U33 ( .A0(n50), .B0(\add_34/carry[2] ), .C1(\add_34/carry[3] ), 
        .SO(N11) );
  HADDX1_RVT U34 ( .A0(cnt[3]), .B0(\add_34/carry[3] ), .C1(\add_34/carry[4] ), 
        .SO(N12) );
  XOR2X1_RVT U35 ( .A1(\add_34/carry[4] ), .A2(n47), .Y(N13) );
  MUX21X1_RVT U36 ( .A1(cnt[0]), .A2(n42), .S0(n43), .Y(n41) );
  AO21X1_RVT U37 ( .A1(N9), .A2(n44), .A3(n45), .Y(n42) );
  AO22X1_RVT U38 ( .A1(n46), .A2(n47), .A3(N13), .A4(n48), .Y(n40) );
  AO22X1_RVT U39 ( .A1(n46), .A2(n49), .A3(N10), .A4(n48), .Y(n39) );
  AO22X1_RVT U40 ( .A1(n46), .A2(n50), .A3(N11), .A4(n48), .Y(n38) );
  AO22X1_RVT U41 ( .A1(n46), .A2(cnt[3]), .A3(N12), .A4(n48), .Y(n37) );
  NOR3X0_RVT U42 ( .A1(n45), .A2(n51), .A3(n46), .Y(n48) );
  INVX0_RVT U43 ( .A(n43), .Y(n46) );
  OA21X1_RVT U44 ( .A1(n52), .A2(n45), .A3(n61), .Y(n43) );
  INVX0_RVT U45 ( .A(rst), .Y(n61) );
  OA21X1_RVT U46 ( .A1(n53), .A2(n51), .A3(a), .Y(n45) );
  INVX0_RVT U47 ( .A(n44), .Y(n51) );
  NAND3X0_RVT U48 ( .A1(n54), .A2(n44), .A3(n55), .Y(N42) );
  OA22X1_RVT U49 ( .A1(n56), .A2(n57), .A3(n53), .A4(n47), .Y(n55) );
  INVX0_RVT U50 ( .A(n52), .Y(n53) );
  NAND3X0_RVT U51 ( .A1(n49), .A2(cnt[0]), .A3(n56), .Y(n44) );
  AND3X1_RVT U52 ( .A1(cnt[3]), .A2(n50), .A3(n47), .Y(n56) );
  NAND3X0_RVT U53 ( .A1(n24), .A2(n58), .A3(N9), .Y(n54) );
  NAND2X0_RVT U54 ( .A1(n57), .A2(n59), .Y(n58) );
  NAND3X0_RVT U55 ( .A1(n23), .A2(n52), .A3(n22), .Y(n59) );
  OR3X1_RVT U56 ( .A1(n47), .A2(n60), .A3(cnt[3]), .Y(n52) );
  NAND2X0_RVT U57 ( .A1(n60), .A2(cnt[3]), .Y(n57) );
  NAND3X0_RVT U58 ( .A1(n24), .A2(n23), .A3(N9), .Y(n60) );
endmodule

