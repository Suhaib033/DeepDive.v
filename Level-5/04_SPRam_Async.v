// 4.Write an RTL and testbench for an 8x16 asynchronous single port RAM memory.

module SP_Ram_Async (
    data, address, we, en
);
    parameter width = 16;
    parameter depth = 8;
    parameter addr = 3;

    inout [width-1:0]data;
    input [addr-1:0]address;
    input we,en;

    reg [width-1:0]mem[depth-1:0];
    reg [width-1:0]temp;

    always @(*) begin
        if(we == 1 && en == 0) mem[address] <= data;
    end

    always @(*) begin
        if(we == 0 && en == 1) temp <= mem[address];
    end

    assign data = (~we & en) ? temp : 16'hz;
endmodule

module SP_Ram_Async_tb (
    
);
    parameter width = 16;    
    parameter depth = 8;    
    parameter addr = 3;

    wire [width-1:0]data;
    reg [addr-1:0]address;
    reg we,en;

    reg [width-1:0]temp;

    SP_Ram_Async DUT(data, address, we, en);
    
    assign data = ~en ? temp : 16'hz;

    initial begin
        $monitor("en = %b, we = %b, addr = %b, data_in = %b", en,we,address,data);
    end

    initial begin
        
        repeat(10)
        address = $random % 16; temp = $random % 256; we = 1; en = 0;
        
        #20;
        repeat(10)
        address = $random % 16; temp = $random % 256; we = 0; en = 1;
        
        #20;
        repeat(10)
        address = $random % 16; temp = $random % 256; we = 1; en = 0;
        
        #30;
        repeat(10)
        address = $random % 16; temp = $random % 256; we = 0; en = 1;
        
        #50 $finish;
        end
endmodule