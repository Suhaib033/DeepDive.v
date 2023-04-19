//7.Write a RTL to design 4 bit loadable binary synchronous up down counter.

module UpDown_Counter (
    input [3:0]data_in, input rst, load, clk, up, down, output [3:0]count
);
    reg [3:0] data;
    always @(posedge clk ) begin
        if(rst) data <= 0;
        else if(load) data<=data_in;
        else
            if (up) begin
                data <= data + 4'd1;
            end
            else if (down) begin
                data <= data - 4'd1;
            end

    end
    assign count = data;
    initial begin
        $monitor("Input Rst = %d, Up = %d, Down = %d, Output Count = %d",rst,up,down,count);
    end
endmodule

module UpDown_Counter_tb (
    
);
    reg rst, load, clk, up, down;
    reg [3:0]data_in;
    wire [3:0]count;

    UpDown_Counter DUT(data_in,rst,load,clk,up,down,count);

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
        rst = 1'b1; up = 1'b0; down = 1'b0;
        #50 rst = 1'b0; up = 1'b1; down = 1'b0;
        #20 rst = 1'b0; up = 1'b0; down = 1'b1;
        #50 Load(1, 4'd13); up = 1'b0; down = 1'b1;
        #50 Load(0, 4'd13); up = 1'b0; down = 1'b1;
        #50 Load(1, 4'd7); up = 1'b1; down = 1'b0;
        #50 Load(0, 4'd7); up = 1'b1; down = 1'b0;
        #20 rst = 1'b1; up = 1'b1; down = 1'b0;
        #30 rst = 1'b0; up = 1'b0; down = 1'b1;
        #50 Load(1, 4'd11); up = 1'b1; down = 1'b0;
        #50 Load(0, 4'd3); up = 1'b0; down = 1'b1;
        #20 rst = 1'b0; up = 1'b1; down = 1'b0;
        
        #50 $finish;
    end
endmodule