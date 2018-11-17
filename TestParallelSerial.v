`timescale 1ns/1ns
module TestParallelSerial;
	reg sysclk;
	wire signal_in;	
	reg [11:0] parallel_data;
	wire signal_mod, signal_out;
	wire	[11:0]RX_Data;
	wire bit_clk, signal_clk, mid_clk; 
	reg [7:0]bit_times;
	reg [7:0]signal_times;
	reg [7:0]mid_times;


	ClkGenerate c8(mid_clk, sysclk, mid_times);
	ClkGenerate c208(signal_clk, sysclk, signal_times);
	ClkGenerate c2(bit_clk, mid_clk, bit_times);

	serializer s(signal_in,parallel_data, bit_clk);
	fsk_modulator m(signal_mod,signal_in,sysclk);
    fsk_demodulator d(signal_out,signal_mod,sysclk);
	deserializer ds(RX_Data,RX_Status,signal_out,sysclk);
	// deserializer ds(RX_Data,RX_Status,signal_in,sysclk);


	initial 
	fork
		sysclk<=0;
		bit_times <= 8'b0000_0010;
		signal_times <= 8'b1101_0000;
		mid_times <= 8'b0000_1000;
		
		forever #5 sysclk<=~sysclk;
		#5 parallel_data<=12'b1010_1010_1010;	
		#2085 parallel_data<=12'b1111_0000_1100;
		#4165 parallel_data<=12'b1100_0011_1100;



	join
endmodule
