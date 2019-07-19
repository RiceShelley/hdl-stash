module accum_and_avg (
	input wire clk,
	input wire rst,
	input wire sample_ready,
	input wire [BIT_WIDTH - 1:0] sample,
	output wire [BIT_WIDTH - 1:0] avg
);

parameter BIT_WIDTH = 32;
assign avg = avg_reg;

reg [BIT_WIDTH - 1:0] avg_reg = 0;
reg [BIT_WIDTH - 1:0] accum = 0;
reg [BIT_WIDTH - 1:0] sample_size = 0;

wire div_done_clk;
reg start_div = 1'd0;
wire [BIT_WIDTH - 1:0] quotient;
reg [15:0] clk_counter_reg = 16'd33;


// div_clk MUX
wire div_clk = div_clk_reg;
reg div_clk_enable = 1'd0;
reg div_clk_reg = 1'd0;
always @(*) begin
	if (div_clk_enable) begin
		div_clk_reg <= clk;
	end else begin
		div_clk_reg <= 1'd0;
	end
end

clk_div div_clk_counter(
	.clk(div_clk),
	.rst(rst),
	.interval(clk_counter_reg),
	.clk_out(div_done_clk)
);

div compute_avg(
	.clk(div_clk),
	.start(start_div),
	.dividend(accum),
	.divider(sample_size),
	.quotient(quotient)
);

reg state = 1'd0;
always @(posedge clk) begin
	case (state)
	1'd0:
	begin
		// accumulate sample value
		if (sample_ready) begin
			accum <= accum + sample;
			sample_size <= sample_size + 1;
			// re-calc average with new accum value
			state <= 1'd1;
			start_div <= 1'd1;
			div_clk_enable <= 1'd1;
		end
	end
	1'd1:
	begin
		// average values
		if (div_done_clk) begin
			/*
			* when division is done go back
			* to waiting for more samples
			*/
			state <= 1'd0;
			start_div <= 1'd0;
			avg_reg <= quotient;
			div_clk_enable <= 1'd0;
		end
		
	end
	default:
	begin
		state <= 1'd0;
	end
	endcase
end

endmodule
