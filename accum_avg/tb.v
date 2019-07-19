module tb;

reg clk_reg = 1'd0;
wire clk = clk_reg;
wire rst = 0;

reg sample_ready_reg = 1'd1;
wire sample_ready = sample_ready_reg;

reg [31:0] sample = 32'd0;
wire [31:0] avg;

task clk_div;
	begin
		#5
		clk_reg <= ~clk_reg;
		#5
		clk_reg <= ~clk_reg;
	end
endtask

integer i;
initial
begin
	$dumpfile("output.vcd");
	$dumpvars(0, tb);
	sample <= 32'd5;
	#5
	$monitor("avg = %d\n", avg);
	for (i = 0; i < 3000; i++) begin
		clk_div();
		sample <= 32'd7;
	end
	$finish;
end

accum_and_avg aaa(
	.clk(clk),
	.rst(rst),
	.sample_ready(sample_ready),
	.sample(sample),
	.avg(avg)
);

endmodule
