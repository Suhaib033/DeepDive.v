//1.Write an RTL and testbench for a 16x8 synchronous dual port RAM memory

module DP_Ram (
    rd, wr, rst, clk, rd_addr, wr_addr, data_in, data_out
);

    parameter width = 8;    
    parameter depth = 16;    
    parameter addr = 4;
    
    input rd, wr, clk ,rst;
    input [width-1:0]data_in;
    input [addr-1:0]rd_addr, wr_addr;
    output reg [width-1:0]data_out;

    integer i;

    reg [width-1:0]mem[depth-1:0];

    always @(posedge clk ) begin
        if(rst)
        begin
            data_out<=0;
            for (i = 0;i < depth ;i = i + 1 ) begin
                mem[i]<=0;
            end
        end
        else
        begin
            if(wr) mem[wr_addr]<=data_in;
            if(rd) data_out<=mem[rd_addr];
        end
    end
endmodule

module DP_Ram_tb (
    
);
    parameter width = 8;    
    parameter depth = 16;    
    parameter addr = 4;

    reg clk, rst, wr, rd;
    reg [width-1:0]data_in;
    reg [addr-1:0]rd_addr, wr_addr;
    wire [width-1:0]data_out;
    integer l;

    DP_Ram DUT(rd, wr, rst, clk, rd_addr, wr_addr, data_in, data_out);

    initial begin
            clk = 1'b0;
            forever 
            #10 clk = ~clk;
        end

    task reset;
    begin
        @(negedge clk) rst = 1'b1;
        @(negedge clk) rst = 1'b0;
    end
    endtask

    task write;
    @(negedge clk)
    begin
        wr = 1'b1;
        rd = 1'b0;
    end
    endtask

    task read;
    @(negedge clk)
    begin
        wr = 1'b0; 
        rd = 1'b1;
    end
    endtask
    
    task stimulus_wr(input [3:0]a, input [7:0]b);
    @(negedge clk)
    begin
        wr_addr = a;
        data_in = b;
    end
    endtask
    
    task stimulus_rd(input [3:0]a);
        @(negedge clk)
        begin
            rd_addr = a;
        end
        endtask

    initial begin
        $monitor("rd = %b, wr = %b, rd_addr = %b, wr_addr = %b, data_in = %b, data_out = %b", rd,wr,rd_addr,wr_addr,data_in,data_out);
        reset;
        write;
             for(l=0;l<16;l=l+1)
                begin
                   stimulus_wr(l,l);
                   #10;
                   read;
                   stimulus_rd(l);
                end
        #50 $finish;
    end
endmodule