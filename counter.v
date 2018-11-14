module counter(num,enable,reset,signal);
	output [9:0]num;
	input  enable,reset,signal;

	reg   [9:0]count=0;
	assign num=count;

	always@(posedge signal or negedge reset)
	begin
		if(~reset)
		  count<=0;
		else
		begin
		if(enable)
			count<=count+1;
		end		
	end
endmodule
