`timescale 1ns/1ns
module TestClk;
	reg sysclk;
	wire bit_clk, signal_clk; 


	ClkGenerator c(bit_clk, signal_clk, sysclk);

	initial 
	fork
		sysclk<=0;
		forever #5 sysclk<=~sysclk;
	join
endmodule
