/* 9. write 8:3 priority encoder using structural model. */


module priorityencoder (input en, input [7:0]i,
  output reg [2:0]y
  
);

always@(en,i)
begin
  if(en == 1)
    begin
      if(i[7] == 1)       y = 3'b111;
      else if(i[6] == 1)  y = 3'b110;
      else if(i[5] == 1)  y = 3'b101;
      else if(i[4] == 1)  y = 3'b100;
      else if(i[3] == 1)  y = 3'b011;
      else if(i[2] == 1)  y = 3'b010;
      else if(i[1] == 1)  y = 3'b001;
      else if(i[0] == 1)  y = 3'b000;
      else if(i    == 0)  y = 3'b000;
    end
  else y = 3'bzzz;
end  

endmodule


module priorityencoder_tb (
  
);

reg en;
reg [7:0]i;
wire [2:0]y;

priorityencoder DUT(en,i,y);

initial
begin
  $monitor("Enable = %d, Input I = %b, Output y = %b",en,i,y);
  en = 0; i = 128; #10;
  en = 1; i = 258; #10;
  en = 1; i = 256; #10;
  en = 1; i = 126; #10;
  en = 1; i = 64;  #10;
  en = 1; i = 59;  #10;
  en = 1; i = 32;  #10;
  en = 1; i = 16;  #10;
  en = 1; i = 3;
end

initial #100 $finish;
  

endmodule
