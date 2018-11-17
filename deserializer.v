module deserializer(RX_Data,RX_Status,UART_RX,clk);
	output	[11:0]RX_Data;
	output	RX_Status;
	input	UART_RX,clk;

	reg	[11:0]RX_Data;
	reg	status=0,RX_Status=0;
	reg	[7:0]count=9,bitcount=0;
	wire	[11:0]shreg;

	ShiftRegister	sr(shreg,status,count[3],UART_RX);

	always	@(posedge clk)
	begin
		if(status==1)
		begin
			if(count==216)
			begin
			  RX_Data[11:0]<=shreg[11:0];
				RX_Status<=1;
				count<=25;
			end
			else
			begin
				count<=count+1;
				RX_Status<=0;
			end
		end
		else
		begin
			count<=9;
			RX_Status<=0;
			if(UART_RX==0)
			     status<=1;
		end
	end
endmodule


