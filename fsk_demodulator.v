module	fsk_demodulator(signal_out,signal_in,sysclk);
	output	signal_out;
	input	signal_in,sysclk;

	reg enable=0,reset=1,signal_out=1;
	reg [9:0]count=0;
	reg [9:0]result=0,result_prev=0;
	wire   [9:0]num;

	counter	c(num,enable,reset,signal_in);

	always@(posedge sysclk)
	begin
		if(signal_in==0&&enable==0)
			enable<=1;
		if(count==15)
		begin
			result_prev<=result;
			result<=num;
			reset<=0;
			count<=0;
		end
		else
		begin
			if(enable==1)
			begin
				count<=count+1;
				reset<=1;
			end
		end
		if(result>5)
			signal_out<=1;
		else		
		begin
			if(result>0)
				signal_out<=0;
			else
				signal_out<=1;
		end
	end
endmodule
