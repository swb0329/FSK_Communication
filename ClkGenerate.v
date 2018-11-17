module ClkGenerate(bit_clk, sys_clk, times);
output bit_clk;
input sys_clk;
input [7:0]times;

reg [7:0]state_bit;
reg [7:0]divide_bit;
reg sigin_bit;

initial begin
	sigin_bit = 1'b0;
	state_bit = 8'b0000_0000;
end

assign bit_clk = sigin_bit;

always @(posedge sys_clk) begin
    divide_bit = times;
	if (state_bit==0) begin
		sigin_bit=~sigin_bit;
	end
	state_bit = state_bit + 8'b0000_0010;
	if (state_bit==divide_bit) begin
		state_bit = 8'b0000_0000;
	end
end

endmodule