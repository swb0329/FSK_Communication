`timescale 1ns/1ns
module top_fsk;
	reg sysclk,signal_in;	
	wire signal_mod, signal_out;
	wire	[11:0]RX_Data;


	fsk_modulator m(signal_mod,signal_in,sysclk);
        fsk_demodulator d(signal_out,signal_mod,sysclk);
	deserializer ds(RX_Data,RX_Status,signal_out,sysclk);

	initial 
	fork
		sysclk<=0;
		signal_in<=1;
		forever #5 sysclk<=~sysclk;
		//data 1
		#160 signal_in<=1;
		// 13 bit start from here
		// #320 signal_in<=0;
		#480 signal_in<=0;
		#640 signal_in<=1;
		#800 signal_in<=1;
		#960 signal_in<=0;
		#1120 signal_in<=1;
		#1280 signal_in<=1;
		#1440 signal_in<=0;
		#1600 signal_in<=0;
		#1760 signal_in<=1;
		#1920 signal_in<=0;
		#2080 signal_in<=1;
		#2240 signal_in<=0;
		#2400 signal_in<=0;

		//data 2
		// 13 bit start from here
		#2560 signal_in<=0;
		#2720 signal_in<=0;
		#2880 signal_in<=0;
		#3040 signal_in<=1;
		#3200 signal_in<=0;
		#3360 signal_in<=0;
		#3520 signal_in<=1;
		#3680 signal_in<=1;
		#3840 signal_in<=0;
		#4000 signal_in<=1;
		#4160 signal_in<=1;
		#4320 signal_in<=0;
		#4480 signal_in<=0;
		// #4640 signal_in<=1;
		
		// #4800 signal_in<=0;
		// #4960 signal_in<=1;
		// #5120 signal_in<=0;
		// #5280 signal_in<=1;



	join
endmodule
