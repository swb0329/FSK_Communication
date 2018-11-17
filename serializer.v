`define HEAD 1
`define TAIL 1
`define DATA 12 
module serializer(serial_data, parallel_data, clk);
input [11:0] parallel_data;
input clk;
output reg serial_data; // 4'b0000 for start, 4'b1111 for end

reg first_sent=1'b1;
reg [3:0]count=4'b0000;
reg start_flag=1'b0; // mark whether it should start start sending
reg [11:0] cache_data;

always @(posedge clk) begin
	if (start_flag) begin
		if (count < `HEAD) begin
			serial_data = 0;
			count = count + 1;
		end
		else begin
			if (count < `HEAD + `DATA) begin
				serial_data = cache_data[0];
				cache_data = {1'b0, cache_data[11:1]};
				count = count + 1;
			end
			// else if (count < `HEAD + `DATA + `TAIL) begin
			// 	serial_data = 1;
			// 	count = count + 1;
			// end
			else begin
				// start_flag = 0;
				count = 1;
				serial_data = 0;
			end
		end
	end
		// else begin
		// 	serial_data = 1;
		// end
end

always @(parallel_data) begin
	cache_data = parallel_data;
	start_flag = 1;
end

endmodule