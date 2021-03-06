module	fsk_modulator(signal_out,signal_in,sysclk);
	output	signal_out;
	input	signal_in,sysclk;
	
	reg signal_out=1,enable=0;
	wire clk_low,clk_high;

	BaudRateGenerator brg(clk_low,clk_high,sysclk);

	always@(posedge sysclk)
	begin
		if(signal_in==0&&enable==0)
			enable<=1;
		if(enable==1)
		begin	
			if(signal_in==1)
				signal_out<=clk_high;
			else
				signal_out<=clk_low;
		end
	end

endmodule
