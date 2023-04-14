/* 6. Write an RTL for a bidirectional buffer and verify the same using testbench. */

module bidir_buffer(a,b,ctrl);
	inout a,b;
	input ctrl;
	bufif1 b1(b,a,ctrl);
	bufif0 b2(a,b,ctrl);
endmodule


module bidir_buffer_tb;

  wire a,b;
  reg ctrl;
  reg temp_a, temp_b;
  integer i;
  
  bidir_buffer bf1(a,b,ctrl);
  assign a = ctrl ? temp_a : 1'bz;
  assign b = ~ctrl ? temp_b : 1'bz;
  
  initial begin
    for(i = 0; i < 8; i = i + 1)
    begin
        {temp_a, temp_b, ctrl} = i;
        #10;
    end
    #30 $finish;
  end
  
initial $monitor("a = %b, b = %b, ctrl = %b",a,b,ctrl);

endmodule


