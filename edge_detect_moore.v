module edge_detect_moore(
  input wire clk,rst,
  input wire level,
  output reg tick
);
  localparam [1:0]
    zero = 2'b00,
    edg = 2'b01,
    one = 2'b10;
  
  reg [1:0] reg_state,reg_next_state;
  always @(posedge clk,posedge rst)
    if(rst)
      reg_state<=0;
    else
      reg_state<=reg_next_state;

  always @*
    begin
      reg_next_state = reg_state;
      tick = 1'b0;
      case(reg_state)
        zero:
          if(level)
            reg_next_state = edg;
        edg:
          begin
            tick = 1'b1;
            if(level)
              reg_next_state = one;
            else
              reg_next_state = zero;
          end
        one:
          if(`level)
            reg_next_state = zero;
        default: reg_next_state = zero;
      
      endcase
    end
endmodule
