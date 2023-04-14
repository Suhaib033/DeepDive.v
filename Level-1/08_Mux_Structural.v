/* 8. Write an RTL for 4X1 mux using decoder and tri state buffer and verify the same using testbench. */


module decoder (input a,b,output [3:0]y
  
);

assign y[0] = ~a & ~b;
assign y[1] = ~a & b;
assign y[2] = a & ~b;
assign y[3] = a & b;
  

endmodule

module mux (input a, b ,input [3:0]i, output wor d
  
);
  
wire [3:0]w;

decoder d1 (a, b, w);

bufif1(d, i[0],w[0]);
bufif1(d, i[1],w[1]);
bufif1(d, i[2],w[2]);
bufif1(d, i[3],w[3]);

endmodule

module mux_tb (
  
);

reg a,b;
reg [3:0]i;
wor d;

mux DUT(a,b,i,d);

initial
 begin
   a = 1'b0; b = 1'b0; i = 4'b0001; #10;
   a = 1'b0; b = 1'b1; i = 4'b0100; #10;
   a = 1'b1; b = 1'b0; i = 4'b0100; #10;
   a = 1'b1; b = 1'b1; i = 4'b1000; #10;
   
  
end
initial $monitor("Input a = %b, b = %b, Output d = %b",a,b,d);
initial #50 $finish;
  

endmodule
