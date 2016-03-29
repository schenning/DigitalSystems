
module g1 ( clk, a, s );
  input clk, a;
  output s;
  wire   n1;

  DFFX1_RVT s_local_reg ( .D(n1), .CLK(clk), .Q(s) );
  XOR2X1_RVT U2 ( .A1(s), .A2(a), .Y(n1) );
endmodule

