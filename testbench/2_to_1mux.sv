
module tb;
  reg a,b,sel;
  wire c;
  integer i;

  mux_2_1 dut(.a(a),.b(b),.sel(sel),.c(c));

  initial begin
    a<=0;
    b<=0;
    sel<=0;

    $monitor("a=%0b b=%0b sel=%0b c=%0b",a,b,sel,c);

    for(i =0;i<3;i++) begin
      {a,b,sel} = i;
    #10;
    end
  end
endmodule
