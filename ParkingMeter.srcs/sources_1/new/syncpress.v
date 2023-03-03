module syncpress(b1, clk,reset, b1_out);
    input b1, clk, reset;
    output  b1_out;
    wire q1,q2,q3;

    flip_flop f1(b1, clk, reset, q1);
    flip_flop f2(q1, clk, reset, q2);
    flip_flop f3(q2, clk, reset, q3);
    
    assign b1_out = q2 & ~q3;
endmodule