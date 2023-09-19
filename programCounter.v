module PC #(parameter WIDTH = 32)
(
	input wire clk,
	input wire rst,
	output wire [WIDTH-1:0] pc
);
	reg [3:0] next_pc;
	always__ff @(posedge clk or posedge rst) begin
		if(rst) begin
	 		next_pc <= 1'b0;
		end else
			next_pc <= next_pc;
	assign pc = next_pc;
	end
endmodule
	 	
