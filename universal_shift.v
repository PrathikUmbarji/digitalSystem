module uni_shift #(parameter N=8)(
  input wire clk,rst,
  input wire [1:0] clt,
  input wire [N-1:0] d,
  output wire [N-1:0] q
);
  reg [N-1:0] r_reg,r_nxt;

  always@(posedge clk,posedge rst)
    if(rst)
      r_reg <=0;
    else
      r_reg<=r_nxt;

  always @*
    case(clt)
      2'b00 : r_nxt = r_reg;
      2'b01 : r_nxt = {r_reg[N-2:0],d[0]};
      2'b10 : r_nxt = {d[N-1],r_reg[N-1:1]};
      default : r_nxt = d;
    endcase
  assign q = r_nxt;
endmodule
