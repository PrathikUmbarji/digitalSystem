module free_run_shift #(parameter N=8)(
  input wire clk,rst,
  input wire s_in,
  output reg s_out
);

  reg [N-1:0] r_reg;
  wire [N-1:0] r_nxt;
  always @(posedge clk, posedge rst)
    begin
      if(rst)
        r_reg <= 0;
      else
        r_reg <= r_nxt;
    end
  assign r_nxt = {s_in,r_reg[N-1,1]};
  assign s_out = r_reg[0];
endmodule
