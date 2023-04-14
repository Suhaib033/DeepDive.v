// 02. Write a verilog for a 1-bit full adder using 2 half adder and 1 or gate and verify using testbench.

module half_adder (a, b, s, c 

);

input a, b;
output wire s, c;
assign s = a ^ b;
assign c = a & b;


endmodule

module full_adder (a, b, cin, sum, cout
  
);
input a, b, cin;
output sum, cout;

wire w1, w2, w3;

half_adder HA1(a, b, w1, w2);

half_adder HA2(cin, w1, sum, w3);
  
or or1(cout, w2, w3);

endmodule

module full_adder_tb (
  
);
reg a, b, cin;
wire sum, cout;

integer i;

full_adder DUT(a, b, cin, sum, cout);

initial
  begin
    a = 1'b0;  

    b = 1'b0;  
    
    cin = 1'b0;  
  end

initial
 begin 
 for ( i = 0; i < 8; i = i + 1) 
 begin
  {a, b, cin} = i;
  #10;
 end
end 

initial $monitor("Input a = %d, b = %d, cin = %d, Output sum = %d, Carry = %d",a,b,cin,sum,cout);

initial #100 $finish;

endmodule
