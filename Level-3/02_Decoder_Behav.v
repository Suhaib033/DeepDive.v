/* 2.  Write a behavioral description for a 3:8 decoder and verify using test bench. */

module decoder(input [2:0]i, output reg [7:0]y);

	always@(*)
	begin
		case (i)
			0: y = 8'b00000001;
			1: y = 8'b00000010;
			2: y = 8'b00000100;
			3: y = 8'b00001000;
			4: y = 8'b00010000;
			5: y = 8'b00100000;
			6: y = 8'b01000000;
			7: y = 8'b10000000;
			default: y = 0;
		endcase
	end

endmodule

module decoder_tb();

reg [2:0]in;
wire [7:0]out;

decoder DUT(in,out);

initial
begin
	in = 6;#50;
	in = 1;#50;
	in = 4;#50;
	in = 2;#50;
	in = 8;#50;
	in = 3;#50;
	in = 5;#50;
	in = 7;#50;
	in = 9;#50;
end

initial $monitor("Input = %b, \tOutput = %b(%d)",in,out,out);

initial #500 $finish;
endmodule
