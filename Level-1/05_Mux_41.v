// 5. Write an RTL and testbench for a 4:1 MUX using 2:1 MUX.

module mux_2x1 (input [3:0]a, input [3:0]b, input sel, 
  output [3:0]y
  
);
  
assign y = sel ? b : a;

endmodule


module mux_4x1 (a, b, c, d, sel, y);
  input [3:0]a;
  input [3:0]b;
  input [3:0]c;
  input [3:0]d;
  input [1:0]sel;
  output [3:0]y;
  wire [3:0]w1;
  wire [3:0]w2;

  mux_2x1 m1(a, b, sel[0], w1);
  mux_2x1 m2(c, d, sel[0], w2);
  mux_2x1 m3(w1, w2, sel[1], y);
endmodule


module mux_4x1_tb (
  
);

reg [3:0]a;
reg [3:0]b;
reg [3:0]c;
reg [3:0]d;
reg [1:0]sel;
wire [3:0]y;

mux_4x1 DUT(a,b,c,d,sel,y);

initial
begin

  sel = 2'b00; a = 4'b0000; b = 4'b0011; c = 4'b0100; d = 4'b0110; // y = a = 0;

 #20 sel = 2'b01; a = 4'b0000; b = 4'b0011; c = 4'b0100; d = 4'b0110; // y = b = 3;

 #20 sel = 2'b10; a = 4'b0000; b = 4'b0011; c = 4'b0100; d = 4'b0110; // y = c = 4;

 #20 sel = 2'b11; a = 4'b0000; b = 4'b0011; c = 4'b0100; d = 4'b0110; // y = d = 6;

end
  
initial $monitor("Input sel = %d, a = %d, b = %d, c =%d, d = %d, Output y = %d",sel,a,b,c,d,y);

initial #80 $finish;

endmodule
