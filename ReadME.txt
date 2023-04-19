LEVEL – 1: Verilog Abstraction Levels
Questions:
1. Write a verilog code for a half adder using data flow abstraction and verify using testbench.
2. Write a verilog for a 1-bit full adder using 2 half adder and 1 or gate and verify using testbench.
3. Write a verilog code for a full adder using data flow abstraction and verify using testbench.
4. Write an RTL and testbench for 2:4 decoder using data flow abstraction.
5. Write an RTL and testbench for a 4:1 MUX using 2:1 MUX.
6. Write an RTL for a bidirectional buffer and verify the same using testbench.
7. Write an RTL and testbench and testbench for a 4-bit Ripple carry adder using 1-bit full adder.
8. Write an RTL for 4X1 mux using decoder and tri state buffer and verify the same using testbench.
9. write 8:3 priority encoder using structural model.

LEVEL – 2: Verilog Operators 
Questions: 
1.  Work on Operators :
a.  Logical
b.  Bitwise
c.  Reduction
d.  Logical shift
e.  Arithmetic shift
f.  Relational operator
g.  Equality operator
h.  Arithmetic operators

2.  Write an RTL and Test bench for ALU using arithmetic and logical operators.

LEVEL – 3: Combinational Logic using behavioral level
Questions: 
1.  Write behavioral description and test bench for 4:1 MUX. 
2.  Write a behavioral description for a 3:8 decoder and verify using test bench. 
3.  Write an behavioral description and test bench 8:3 priority encoder

LEVEL - 4: Sequential Logic (Flip-Flop, Counters, Shift registers)
Questions
1.Write an RTL description and test bench for a D flip flop.
2.Write structural model for T flip flop using D flip flop.
3.Write an RTL description for 4-bit synchronous loadable up counter and verify using test bench.
4.Write an RTL description for JK flip flop using parameter declaration for the respective scenarios 
HOLD, SET, RESET, TOGGLE.
5.Implement SR latch in gate level modelling and verify using test bench.
6.Write an RTL to design 4-bit MOD12 loadable binary up counter and verify using test bench
7.Write a RTL to design 4 bit loadable binary synchronous up down counter.
8.Write an RTL and testbench for 4-bit SISO.

LEVEL - 5: Memory design (Random & Sequential memory)
Questions
1.Write an RTL and testbench for a 16x8 synchronous dual port RAM memory
2.Write an RTL and testbench for an 8x16 asynchronous dual port RAM memory.
3.Write an RTL and testbench for a clock buffer. 
4.Write an RTL and testbench for an 8x16 asynchronous single port RAM memory.
5.Write an RTL and test bench for 16 x 8 FIFO memory and verify using testbench.

LEVEL - 6 – FSM Design
1. Verilog Code for 101 sequence detector

2. Verilog Code for Vending Machine that can take only two types of coins of denomination 1 and 2 in any order. It delivers only one product that is priced Rs. 3. On receiving Rs. 3 the product is delivered by asserting an output X=1 which otherwise remains 0. If it gets Rs. 4 then the product is delivered by asserting X and also a coin return mechanism is activated by output Y = 1 to return a Re. 1 coin . There are two sensors to sense the denomination of the coins that give binary output as shown in the following table. The clock speed is much higher than human response time i.e. no two coins can be deposited in same clock cycle. 
I J Coin 0 X No coin dropped 
1 0 One Rupee
1 1 Two Rupees