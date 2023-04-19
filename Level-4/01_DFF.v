// 1.Write an RTL description and test bench for a D flip flop.

module d_ff (
    input [1:0]d, input rst, clk, output reg [1:0]q, qb
);
    always @(posedge clk ) begin
        if (rst) q<=0;
        else q<=d;
        
    end
    always @(q) begin
        qb <= ~q;
    end
    
    initial #200 $finish;
    initial $monitor("Input D = %b, Rst = %b, Output Q = %b", d, rst, q);

endmodule

module d_ff_tb (
    
);
    reg [1:0]d;
    reg clk, rst;
    wire [1:0]q, qb;
    
    d_ff DUT(d, rst, clk, q, qb);
    initial begin
        clk = 1'b0;
        forever 
        #10 clk = ~clk;
    end

    task initialize;
    begin
        d = 2'b00;
        rst = 1'b1;
    end
    endtask

    task reset;
    begin
        @(negedge clk) rst = 1'b1;
        @(negedge clk) rst = 1'b0;
    end
    endtask

    task inputs(input [1:0] i);
    begin
        @(negedge clk) d = i;
    end
    endtask

    initial begin
        initialize;
        reset;
        inputs(2'b00);
        inputs(2'b01);
        inputs(2'b10);
        inputs(2'b11);
        inputs(2'b01);
        inputs(2'b11);
    end
endmodule