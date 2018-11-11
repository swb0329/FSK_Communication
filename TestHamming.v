module TestHamming(encode_in, decode_out, encode_out, decode_in);
output reg [7:0] encode_in;
output [7:0] decode_out;
output reg [11:0] decode_in;
output [11:0] encode_out;
integer bit;
integer same;

HammingEncoder encoder(.datain(encode_in), .dataout(encode_out));
HammingDecoder decoder(.datain(decode_in), .dataout(decode_out));
initial 
begin
	#5 encode_in = 8'b00000000;
	forever #1440 encode_in = encode_in + 1;
end

always @(encode_in) begin
	if (encode_in == 8'b11111111)
		encode_in <= 8'b00000000;
end

always @(encode_out) begin
	decode_in = encode_out;
	bit = $random(encode_out) % 12;
	if (bit < 0) 
		bit = -bit;
	decode_in[bit] = ~decode_in[bit];
end

always @(decode_out) begin
	if (decode_out == encode_in)
		same = 1;
	else begin
		same = 0;
	end
end
endmodule
