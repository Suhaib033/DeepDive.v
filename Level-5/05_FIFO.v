//5. Write RTL and testbench code for 16x8 FIFO

module FIFO (
    re,we,clk,rst,data_in,data_out,empty,full
);
    parameter width = 8;
    parameter depth = 16;
    parameter addr = 5;

    input clk,rst,we,re;
    input [width-1:0]data_in;
    output reg [width-1:0]data_out;
    output empty, full;

    reg [width-1:0]mem[depth-1:0];
    reg [addr-1:0]wr_ptr, rd_ptr;

    integer i;

    always @(posedge clk ) begin
        if(rst) 
        for (i = 0;i < depth ;i = i + 1 ) begin
            mem[i]<=0;
            wr_ptr<=0;
        end
        else if(we == 1 && full == 0) 
        begin
            mem[wr_ptr[3:0]]<=data_in;
            wr_ptr<=wr_ptr+1;
        end
    end

    always @(posedge clk ) begin
        if(rst) begin data_out <= 0; rd_ptr<=0; end
        else if(re == 1 && empty == 0)
        begin
            data_out <= mem[rd_ptr[3:0]];
            rd_ptr <= rd_ptr+1;
        end
    end

    assign empty = (wr_ptr == rd_ptr) ? 1'b1 : 1'b0;

    assign full = (wr_ptr == {~rd_ptr[4],rd_ptr[3:0]}) ? 1'b1 : 1'b0;
endmodule

module FIFO_tb (
    
);
    parameter width = 8;    
    parameter depth = 16;    
    parameter addr = 5;

    reg clk, rst, we, re;
    reg [width-1:0]data_in;
    wire [width-1:0]data_out;
    wire empty,full;
    
    integer l;

    FIFO DUT(re,we,clk,rst,data_in,data_out,empty,full);

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
        we = 1'b1;
        re = 1'b0;
    end
    endtask

    task read;
    @(negedge clk)
    begin
        we = 1'b0; 
        re = 1'b1;
    end
    endtask
    
    task stimulus_wr(input [7:0]b);
    @(negedge clk)
    begin
        data_in = b;
    end
    endtask
    
//    task stimulus_rd(input [3:0]a);
//        @(negedge clk)
//        begin
//            rd_addr = a;
//        end
//        endtask

    initial begin
        $monitor("re = %b, we = %b, data_in = %b, data_out = %b, empty = %b, full  =%b", re,we,data_in,data_out,empty,full);
        reset;
        write;
             for(l=0;l<5;l=l+1)
                begin
                   stimulus_wr(l);
                end
                read;
                #50;
                write;
              for(l=0;l<7;l=l+1)
              begin
                    stimulus_wr(l);
              end
              read;
              #100;
              write;
              for(l=8;l<13;l=l+1)
              begin
                    stimulus_wr(l);
              end
              read;
        #50 $finish;
    end
endmodule