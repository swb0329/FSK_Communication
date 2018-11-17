module BaudRateGenerator(clk_low,clk_high,sysclk);
	input	sysclk;//100MHz
	output	clk_low;//25 MHz
	output	clk_high;//50 MHz
	reg	clk_low=0,clk_high=0;
	reg	count=0;

	always@(posedge sysclk)
	begin
		if(count==1)//100M/25M/2
			count<=0;
		else
			count<=count+1;
        	clk_low=(count==1)?~clk_low:clk_low;
		clk_high=~clk_high;
	end
endmodule
