// 6.Write an RTL to design 4-bit MOD12 loadable binary up counter and verify using test bench

module mod12_counter (
    input [3:0]data_in,input rst, load, clk, output [3:0]count
);

    reg [3:0]data;
    always @(posedge clk ) begin
        if(rst) data = 0;
        else if(load) data<=data_in;
        else if(data>=4'b1100) data = 0;
        else data = data + 4'd1;
    end
    assign count = data;
    
    initial $monitor("Input rst = %d, Output Data = %d",rst,count);
    
endmodule

module mod12_counter_tb (
    
);
    reg rst, load, clk;
    reg [3:0]data_in;
    wire [3:0]count;

    mod12_counter DUT(data_in,rst, load, clk, count);

    initial begin
        clk = 1'b0;
        forever begin
            #10 clk = ~clk;
        end
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
            #50 Load(1, 4'd8);
            #50 Load(0, 4'd8);
            #70 rst = 1'b1;
            #50 rst = 1'b0;
            #500 $finish;
    end
    
endmodule