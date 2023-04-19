/* 1.  Work on Operators : */
/* a.  Logical */
/* b.  Bitwise */
/* c.  Reduction */
/* d.  Logical shift */
/* e.  Arithmetic shift */
/* f.  Relational operator */
/* g.  Equality operator */
/* h.  Arithmetic operators */


/*module logical; 
reg [3:0]a,b; reg [2:0]Logical;
  

initial
begin
a = 15;
b = 5;
Logical[2] = a && b;
Logical[1] = a || b;
Logical[0] = !b;

end
initial $monitor("Input A = %b, B = %b, Logical = %b\n", a,b,Logical);
endmodule*/

/*module bitwise;
reg [3:0]a,b; reg [2:0]Bitwise; 

initial
begin
#100
a = 15;
b = 5;
Bitwise[2] = a & b;
Bitwise[1] = a | b;
Bitwise[0] = a ^ b;
end
initial $monitor("Input A = %b, B = %b, Bitwise = %b\n", a,b,Bitwise);
endmodule*/

/*module reduction;
reg [3:0]a,b; reg[5:0]Reduction; 

initial
begin
#100
a = 15;
b = 5;
Reduction[5] = &a;
Reduction[4] = ~&b;
Reduction[3] = |a;
Reduction[2] = ~|b;
Reduction[1] = ^a;
Reduction[0] = ~^b;
end
initial $monitor("Input A = %b, B = %b, Reduction = %b\n", a,b,Reduction);
endmodule*/

/*module  shift;
reg [3:0]a,b; reg [3:0]Shift;
initial
begin
#100
a = 15;
b = 5;
Shift[3] = a >> b;
Shift[2] = b << a;
Shift[1] = a >>> 1;
Shift[0] = b <<< a;

end
initial $monitor("Input A = %b, B = %b, Shift = %d\n", a,b,Shift);
endmodule*/


/*module equality;
reg[3:0]a,b,Equality;

initial
begin

#100
a = 15;
b = 5;
Equality[3] = a == b;
Equality[2] = a != b;
Equality[1] = a === b;
Equality[0] = a !== b;

end
initial $monitor("Input A = %b, B = %b, Equality = %b\n", a,b,Equality);
endmodule*/


/*module relational;
reg [3:0]a,b; reg [3:0] Relational;

initial
begin
#100
a = 15;
b = 5;
Relational[3] = a >= b;
Relational[2] = a <= b;
Relational[1] = a > b;
Relational[0] = a < b;
end
initial $monitor("Input A = %b, B = %b, Relational = %b\n", a,b,Relational);
endmodule*/

module arithmetic;
reg [3:0]a,b; reg [5:1] Add,Sub,Mul,Div,MDiv;
initial
begin
#100

a = 15;
b = 5;
Add = a + b;
Sub = a - b;
Mul = a * b;
Div = a / b;
MDiv = a % b;
end
initial $monitor("Input A = %b, B = %b, \nAdd = %b Sub = %b Mul = %b Div = %b MDiv = %b\n", a,b,Add,Sub,Mul,Div,MDiv);
endmodule


