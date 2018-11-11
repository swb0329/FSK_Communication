module HammingDecoder(datain, dataout);

input [11:0] datain;
output reg[7:0] dataout;

reg [3:0] check=4'b0000;
reg [11:0] receive_data;
reg [7:0] data;

always @(datain) begin
	receive_data = datain;
	check[0] = datain[0]^datain[2]^datain[4]^datain[6]^datain[8]^datain[10];
	check[1] = datain[1]^datain[2]^datain[5]^datain[6]^datain[9]^datain[10];
	check[2] = datain[3]^datain[4]^datain[5]^datain[6]^datain[11];
	check[3] = datain[7]^datain[8]^datain[9]^datain[10]^datain[11];

	if (check != 0)
		receive_data[check-1] = ~receive_data[check-1];

	data[0] = receive_data[2];
	data[1] = receive_data[4];
	data[2] = receive_data[5];
	data[3] = receive_data[6];
	data[4] = receive_data[8];
	data[5] = receive_data[9];
	data[6] = receive_data[10];
	data[7] = receive_data[11];
	dataout = data;
end
endmodule