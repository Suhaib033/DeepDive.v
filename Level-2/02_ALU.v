/* 2.  Write an RTL and Test bench for ALU using arithmetic and logical operators. */

module ALU (input [7:0]a, b, input [3:0]sel, 
  output [7:0]out, output cout
  
);
reg [7:0]result;
assign out = result;
wire [8:0]temp;
assign temp = {1'b0,a} + {1'b0,b};
assign cout = temp[8];
always @(*)
begin
  case(sel)
    4'b0000: result = a +  b; //Addition
    4'b0001: result = a -  b; //Subtraction
    4'b0010: result = a *  b; //Multiplication
    4'b0011: result = a /  b; //Division
    4'b0100: result = a << b; //Logical left shit
    4'b0101: result = a >> b; //Logical right shift
    4'b0110: result = a && b; //Logical and
    4'b0111: result = a || b; //Logical or
    4'b1000: result = a &  b; //Bitwise and
    4'b1001: result = a |  b; //Bitwise or
    4'b1010: result = a ^  b; //Bitwise xor
    4'b1011: result = a == b; //Logical Equality
    4'b1100: result = a != b; //Logical Inequality
    4'b1101: result = a >  b; //Greater than
    4'b1110: result = a <  b; //Less than
    4'b1111: result = a %  b; //Modulo Division
    default: result = a + b;
  endcase
end
endmodule

module tb_alu;
 reg[7:0] A,B;
 reg[3:0] ALU_Sel;

 wire[7:0] ALU_Out;
 wire CarryOut;
 integer i;
 ALU DUT(A, B, ALU_Sel, ALU_Out, CarryOut);
    initial 
    begin
    $monitor("Input A = %d, B = %d, Sel = %d, Output = %d, Cout = %d",A,B,ALU_Sel,ALU_Out,CarryOut);
      A = 8'h0A;
      B = 4'h02;
      ALU_Sel = 4'h0;
      
      for (i=0;i<=15;i=i+1)
      begin
       ALU_Sel = ALU_Sel + 8'h01;
       #10;
      end;
      
      A = 8'hF6;
      B = 8'h0A;
      
    end
    initial #200 $finish;
endmodule
