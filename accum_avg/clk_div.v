module clk_div(
	input wire clk,
	input wire rst,
	input [15:0] interval,
	output wire clk_out
);

reg [15:0] counter = 16'd0;
reg clk_out_reg = 1'd0;

assign clk_out = clk_out_reg;

always @(posedge clk) begin
	if (rst) begin
		counter <= 16'd0;
		clk_out_reg <= 1'd0;
	end else begin
		if (counter == interval) begin
			counter <= 16'd0;
			clk_out_reg <= 1'd1;
		end else begin
			counter <= counter + 16'd1;
			clk_out_reg <= 1'd0;
		end
	end	
end

endmodule
