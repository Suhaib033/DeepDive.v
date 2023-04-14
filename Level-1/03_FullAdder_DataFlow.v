// 3. Write a verilog code for a full adder using data flow abstraction and verify using testbench.

module full_adder (input a, b, cin,
  output wire sum, cout
  
);

  assign sum = a ^ b ^ cin;
  assign cout = (a&b) | (b&cin) | (cin&a);

endmodule


module full_adder_tb (
  
);

reg a, b, cin;
wire sum, cout;
integer i;

full_adder DUT (a, b, cin, sum, cout);

initial
begin
  a = 1'b0;
  b = 1'b0;
  cin = 1'b0;
end


initial
begin
for (i = 0; i < 8; i = i + 1) begin
  {a,b,cin} = i;
  #10;

end
end

initial $monitor( " Input a = %d, b = %d, cin = %d; Output Sum = %d, cout = %d", a,b,cin,sum,cout);

initial #100 $finish;
  

endmodule
