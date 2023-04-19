//4.Write an RTL description for JK flip flop using parameter declaration for the respective scenarios HOLD, SET, RESET, TOGGLE.

module JK_FF (
    input j,k,clk,rst, output reg q,qb
);
    parameter HOLD = 2'b00;
    parameter SET = 2'b01;
    parameter RESET = 2'b10;
    parameter TOGGLE = 2'b11;
    
    always @(posedge clk) begin
        if(rst) q = 1'b0;
        else
        begin
            case({j,k})
                HOLD:q<=q;
                SET:q<=1'b1;
                RESET:q<=1'b0;
                TOGGLE:q<=~q;
            endcase
        end
        end
       always@(q) qb = ~q;
endmodule

module JK_FF_tb (
    
);
    reg j,k,clk, rst;
    wire q, qb;
    
    JK_FF DUT(j, k, clk, rst, q, qb);
    initial begin
        clk = 1'b0;
        forever 
        #10 clk = ~clk;
    end

    task initialize;
    begin
        j = 1'b0;
        k = 1'b0;
        rst = 1'b1;
    end
    endtask

    task reset;
    begin
        @(negedge clk) rst = 1'b1;
        @(negedge clk) rst = 1'b0;
    end
    endtask

    task inputs(input m,n);
    begin
        @(negedge clk) j = m; k = n;
    end
    endtask

    initial begin
        $monitor("J = %d, K = %d, Q = %d, Qb = %d",j,k,q,qb);
        initialize;
        reset;
        @(negedge clk) inputs(0,0);
        @(negedge clk) inputs(0,1);
        @(negedge clk) inputs(1,0);
        @(negedge clk) inputs(1,1);
        @(negedge clk) inputs(0,0);
        @(negedge clk) inputs(0,1);
        @(negedge clk) inputs(1,0);
        @(negedge clk) inputs(1,1);
        #20 $finish;
    end
endmodule