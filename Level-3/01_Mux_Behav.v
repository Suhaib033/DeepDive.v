// 1.  Write behavioral description and test bench for 4:1 MUX

module Mux (input [3:0]i, input sel2,sel1, output reg y
);

always@(*)
begin
    if(sel2 == 0 && sel1 == 0) y = i[3];
    else if(sel2 == 0 && sel1 == 1) y = i[2];
    else if(sel2 == 1 && sel1 == 0) y = i[1];
    else y = i[0];
end
    
endmodule

module Mux_tb (
    
);

reg [3:0]i;
reg sel2,sel1;
wire y;

Mux DUT(i,sel2,sel1,y);

initial begin
    i = 5; sel2 = 0; sel1 = 0;#50;
    i = 4; sel2 = 0; sel1 = 1;#50;
    i = 9; sel2 = 1; sel1 = 0;#50;
    i = 15; sel2 = 1; sel1 = 1;#50;
    i = 10; sel2 = 1; sel1 = 0;#50;
    i = 1; sel2 = 0; sel1 = 1;#50;
    i = 8; sel2 = 1; sel1 = 0;#50;




end

initial $monitor("Input = %b, \tSelect = %b,%b, \tOutput = %b",i,sel2,sel1,y);

initial #400 $finish;
    
endmodule