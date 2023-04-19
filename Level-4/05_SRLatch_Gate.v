//5.Implement SR latch in gate level modelling and verify using test bench.

module sr_Latch (
    input s, r, output q, qb
);
    nand n1(q, s, qb);
    nand n2(qb, r, q);
endmodule

module sr_Latch_tb (
    
);

    reg s,r;
    wire q,qb;
    sr_Latch DUT(s,r,q,qb);

    initial begin
        $monitor("S = %d, R = %d, Q = %d, Qb = %d",s,r,q,qb);
        s = 0; r= 0;
        #5 r = 1;
        #5 r = 0;
        #5 s = 1;
        #5 s = 0;
        #5 r = 1;
        #5 r = 0;
        #5 s = 1;
        #5 s = 0;
        #10 $finish;
    end
    
endmodule