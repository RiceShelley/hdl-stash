module div(
	input wire clk,
	input wire start,
	input wire [31:0] dividend,
	input wire [31:0] divider,
	output wire [31:0] quotient
);

assign quotient = result;

reg [31:0] quotient_reg;
reg [31:0] result;
reg [63:0] dividend_copy, divider_copy, diff;
wire [31:0] remander = dividend_copy[31:0];

reg [5:0] bit = 6'd0;
wire ready = !bit;

always @( posedge clk )
begin
	if ( ready && start ) begin
		bit = 6'd32;
		result <= quotient_reg;
		quotient_reg = 0;
		dividend_copy = {32'd0, dividend};	
		divider_copy = {1'b0, divider, 31'd0};
	end else begin
		diff = dividend_copy - divider_copy;
		// if negitave shift a 0 into quotient
		quotient_reg = {quotient_reg[30:0], ~diff[63]};
		divider_copy = {1'b0, divider_copy[63:1]};
		if (!diff[63])
			dividend_copy = diff;
		bit = bit - 1;
	end
end

endmodule
