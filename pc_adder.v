module pc_adder #(parameter WIDTH = 5)(
	input [WIDTH-1:0] pc,
	output [WIDTH-1:0] pcplus4
	);
	assign pcplus4 = pc+4;
endmodule
