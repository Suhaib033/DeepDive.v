// 1. Write a verilog code for a half adder using data flow abstraction and verify using testbench.


module half_adder (a, b, sum, carry

);
input a, b;
output wire sum, carry;
assign sum = a ^ b;
assign carry = a & b;

endmodule




module half_adder_tb (
);

reg a, b;
wire sum, carry;
integer i;

half_adder DUT(a, b, sum, carry);

initial
  begin
    a = 1'b0;
    b = 1'b0;
  end

initial
  begin 
    for (i = 0; i < 8; i = i+1) 
      begin 
        {a,b} = i;
        #10;
      end
    end 

initial
  $monitor("Input a = %d, b = %d, Output sum = %d, carry = %d", a,b,sum,carry);
initial #100 $finish;


endmodule
