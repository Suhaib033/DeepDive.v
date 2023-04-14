// 4. Write an RTL and testbench for 2:4 decoder using data flow abstraction.

module Decoder2_4 (input en, a, b, 
  output [3:0]y
  
);
  
assign y[0] = en & ~a & ~b;
assign y[1] = en & ~a & b;
assign y[2] = en & a & ~b;
assign y[3] = en & a & b;

endmodule



module Decoder2_4_tb (
  
);

reg en, a, b;
wire [3:0]y;

Decoder2_4 DUT (en, a, b, y);

initial
begin
  en = 0; a = 1'bx; b = 1'b1;

  #10 en = 0; a = 1'b0; b = 1'bx;

  #10 en = 1; a = 1'b0; b = 1'b0;

  #10 en = 1; a = 1'b0; b = 1'b1;

  #10 en = 1; a = 1'b1; b = 1'b0;

  #10 en = 1; a = 1'b1; b = 1'b1;

end 

initial
  $monitor("Input Enable = %d, a = %d, b = %d, Output y = %d",en,a,b,y);

initial #70 $finish;
endmodule
