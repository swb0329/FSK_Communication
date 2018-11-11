module HammingEncoder(datain, dataout);
// 8-4 Hamming Code
// #0: 0001(1),	#1: 0010(2), 2: 0011(1,2)
// #3: 0100(3), 4: 0101(1,3), 5: 0110(2,3)
// 6: 0111(1,2,3), #7: 1000(4), 8: 1001(1,4)
// 9: 1010(2,4), 10: 1011(1,2,4), 11: 1100(3,4)

input [7:0] datain;
output [11:0] dataout;

assign dataout[2] = datain[0];
assign dataout[4] = datain[1];
assign dataout[5] = datain[2];
assign dataout[6] = datain[3];
assign dataout[8] = datain[4];
assign dataout[9] = datain[5];
assign dataout[10] = datain[6];
assign dataout[11] = datain[7];

assign dataout[0] = datain[0]^datain[1]^datain[3]^datain[4]^datain[6];
assign dataout[1] = datain[0]^datain[2]^datain[3]^datain[5]^datain[6];
assign dataout[3] = datain[1]^datain[2]^datain[3]^datain[7];
assign dataout[7] = datain[4]^datain[5]^datain[6]^datain[7];

endmodule