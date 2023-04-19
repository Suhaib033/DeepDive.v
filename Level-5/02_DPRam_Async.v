// 2.Write an RTL and testbench for an 8x16 asynchronous dual port RAM memory.

module DP_Ram_Async (
    data_in, data_out, rd_addr, wr_addr, rd_clk, wr_clk, rst, re, we
);
    parameter width = 16;
    parameter depth = 8;
    parameter addr = 3;

    input [width-1:0] data_in;
    input [addr-1:0] rd_addr, wr_addr;
    input rd_clk, wr_clk, rst, re, we;
    output reg [width-1:0]data_out;

    integer i;

    reg [width-1:0]mem[depth-1:0];

    always @(posedge wr_clk, posedge rst ) begin
        if(rst) begin
            data_out <= 0;
            for (i = 0;i < depth ;i = i + 1) begin
                mem[i] <= 0;
            end
        end
        else if(we)
        begin
            mem[wr_addr] <= data_in;
        end
    end

    always @(posedge rd_clk, posedge rst ) begin
        if(rst) data_out <= 0;
        else if(re) data_out <= mem[rd_addr];
    end
endmodule

module DP_Ram_Async_tb (
    
);
    parameter width = 16;    
    parameter depth = 8;    
    parameter addr = 3;

    reg [width-1:0] data_in;
    reg [addr-1:0] rd_addr, wr_addr;
    reg rd_clk, wr_clk, rst, re, we;
    wire [width-1:0]data_out;
    integer l;

    DP_Ram_Async DUT(data_in, data_out, rd_addr, wr_addr, rd_clk, wr_clk, rst, re, we);

    initial begin
            wr_clk = 1'b0;
            forever 
            #10 wr_clk = ~wr_clk;
        end
    initial begin
            rd_clk = 1'b0;
            forever
            #10 rd_clk = ~rd_clk;
        end

    task reset;
    begin
        rst = 1'b1;
        #20 rst = 1'b0;
    end
    endtask

    task write;
    @(negedge wr_clk)
    begin
        we = 1'b1;
        re = 1'b0;
    end
    endtask

    task read;
    @(negedge rd_clk)
    begin
        we = 1'b0; 
        re = 1'b1;
    end
    endtask
    
    task stimulus_wr(input [3:0]a, input [7:0]b);
    @(negedge wr_clk)
    begin
        wr_addr = a;
        data_in = b;
    end
    endtask
    
    task stimulus_rd(input [3:0]a);
        @(negedge rd_clk)
        begin
            rd_addr = a;
        end
        endtask

    initial begin
        $monitor("re = %b, we = %b, rd_addr = %b, wr_addr = %b, data_in = %b, data_out = %b", re,we,rd_addr,wr_addr,data_in,data_out);
        end
        initial begin
        reset;
        write;
        repeat(10)
        stimulus_wr( $random % 16, $random % 256);
        
        #20 read;
        repeat(10)
        stimulus_rd( $random % 16 );
        
        #20 write;
        repeat(10)
        stimulus_wr( $random % 16, $random % 256);
        
        #30 read;
        repeat(5)
        stimulus_rd( $random % 16 );
        
        
        #20 reset;
        #50 $finish;
        end
endmodule