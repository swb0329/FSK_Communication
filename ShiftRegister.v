module ShiftRegister(shreg,reset,clk,in);
	output	[11:0] shreg;
	input	reset,in,clk;
	reg	[11:0] shreg;

	always @(negedge clk,negedge reset)
	begin
		if(~reset)
    			 shreg <= 12'b000000000000;
    		else
		begin
			if (in)
				shreg = {1'd1,shreg[11:1]};
			else
				shreg = {1'd0,shreg[11:1]};
		end
	end

	initial	
	begin
		shreg <= 12'b000000000000;
	end
endmodule
