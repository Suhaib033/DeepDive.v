module siso_4bit(
  input wire clk, rst, si,
  output wire so
);

  reg [3:0] shift_reg;

  always @(posedge clk) begin
    if (rst) begin
      shift_reg <= 4'b0000;
    end
    else begin
      shift_reg <= {shift_reg[2:0], si};
    end
  end

  assign so = shift_reg[0];
  initial $monitor("Input si =%d, Rst = %d, Output so =%d",si,rst,so);

endmodule

module siso_4bit_tb;

  reg clk, rst, si;
  wire so;

  siso_4bit uut (
    .clk(clk),
    .rst(rst),
    .si(si),
    .so(so)
  );

  initial begin
    clk = 0;
    rst = 1;
    si = 0;
    #10 rst = 0; 
    #10 si = 1; 
    #10 si = 0; 
    #10 si = 1; 
    #10 si = 1; 
    #10 si = 0; 
    #10 si = 1; 
    #10 $finish; 
  end

  always #5 clk <= ~clk; // Generate clock signal

endmodule
