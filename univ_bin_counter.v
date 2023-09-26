module univ_bin_counter#(parameter N=8)(
  input wire clk,rst,
  input wire en,syn_clr,up,load,
  input wire [N-1:0] d,
  output wire [N-1:0] q,
  output wire max_tick,min_tick
);

  reg [N-1:0] r_reg,r_nxt;

  always@(posedge clk,posedge rst)
    if(rst)
      r_reg <=0;
    else
      r_reg <=r_nxt;

  always @*
    if(syn_clr)
      r_nxt = 0;
  else if (load)
    r_nxt = d;
  else if (en & up)
    r_nxt = r_reg +1;
  else if (en & ~up)
    r_nxt = r_reg-1;

  assign max_tick = (r_reg == 2**N-1)? 1'b1:1'b0;
  assign min_tick = (r_reg == 0)?1'b1:1'b0;
endmodule
