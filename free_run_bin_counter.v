module free_run_counter #(parameter N=8)(
  input wire clk,rst,
  output wire max_tick,
  output wire [N-1:0] q
);
  reg [N-1:0] r_reg;
  wire [N-1:0] r_nxt;

  always@(posedge clk,posedge rst)
    if(rst)
      r_reg <=0;
    else
      r_reg <= r_nxt;

  assign r_nxt = r_reg +1;
  assign q = r_reg;
  assign max_tick = (r_reg == 2**N-1)?1'b1:1'b0;
endmodule
