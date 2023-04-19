// 2. Write an RTL structural code for T using D flip flop

module t_ff (
    input t, input rst, clk, output reg q, qb
);
    always@(posedge clk)
    begin
        if(rst) q <= 0;
        else q <= t^q;
    end
    always@(q)
    qb = ~q;
    
    initial #200 $finish;
    initial begin
        $monitor("Input t = %b, rst = %b, Output q = %b", t, rst, q);
    end
    
endmodule

module d_ff_tb (
    
);
    reg t;
    reg clk, rst;
    wire q, qb;
    
    t_ff DUT(t, rst, clk, q, qb);
    initial begin
        clk = 1'b0;
        forever 
        #10 clk = ~clk;
    end

    task initialize;
    begin
        t = 1'b0;
        rst = 1'b1;
    end
    endtask

    task reset;
    begin
        @(negedge clk) rst = 1'b1;
        @(negedge clk) rst = 1'b0;
    end
    endtask

    task inputs(input i);
    begin
        @(negedge clk) t = i;
    end
    endtask

    initial begin
        initialize;
        reset;
        inputs(0);
        inputs(1);
        inputs(1);
        inputs(0);
        inputs(1);
        inputs(0);
    end
endmodule