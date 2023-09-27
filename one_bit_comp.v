module one_bit_comp(
  input s0,s1,
  output eq
);
  reg p0,p1;

  assign eq = p0|p1;
  assign p0 = ~s0 & ~s1;
  assign p1 = s0 & s1;
endmodule
