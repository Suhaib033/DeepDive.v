//3. Write an RTL description for 4-bit synchronous loadable up counter and verify using test bench.

module counter_4bit_sync (
    input [3:0]data_in, input clk, load, rst, output [3:0]count
);
    reg [3:0] count_up;
    always @(posedge clk ) begin
        if(rst) count_up<=4'd0;
        else if(load) count_up<=data_in;
        else count_up<=count_up+4'd1;
    end
    assign count=count_up;
    initial begin
        $monitor("Reset = %d, Count = %d", rst, count);
    end
    
endmodule

module counter_4bit_sync_tb (
    
);
    reg clk, load, rst;
    reg [3:0]data_in;
    wire [3:0]count;
    
    counter_4bit_sync DUT(data_in,clk,load,rst,count);
    
    initial begin
        clk = 1'b0;
        forever #10 clk = ~clk;
    end
    
    task Load(input i, input [3:0]j);
    begin
    @(negedge clk);
        load = i;
        data_in = j;
    end
    endtask

    initial begin
        rst = 1'b1;
        #50 rst = 1'b0;
        #20 rst = 1'b1;
        #20 rst = 1'b0;
        #50 Load(1, 4'd13);
        #50 Load(0, 4'd13);
        #70 rst = 1'b1;
        #50 rst = 1'b0;
        #500 $finish;
    end
    
endmodule