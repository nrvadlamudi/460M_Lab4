`timescale 1ns / 1ps

module top(b1,b2,b3,b4,reset10,clk, reset205, sseg, an);
    input b1,b2,b3,b4;
    input clk;
    input reset10, reset205;
    output [6:0] sseg;
    output [3:0] an;
    wire bs1, bs2, bs3, bs4;
    wire reset;
    wire display_clk;
    wire flag;
    assign reset = reset10 & reset205;
    syncpress sync1(b1, clk, reset, bs1);
    syncpress sync2(b2, clk, reset, bs2);
    syncpress sync3(b3, clk, reset, bs3);
    syncpress sync4(b4, clk, reset, bs4);
    wire [14:0] sec_to_sub;
    wire [6:0] seven [3:0];
    wire [3:0] d1,d2,d3,d4;
    all_in_one a1( bs1, bs2, bs3, bs4,clk, reset10 ,reset205,sec_to_sub,flag,zflag);
    bin_to_BCD bc(clk,sec_to_sub,zflag,d1,d2,d3,d4);
    clkshow show1(clk,zflag,display_clk);
    sevenseg s1(d1, seven[0]);
    sevenseg s2(d2, seven[1]);
    sevenseg s3(d3, seven[2]);
    sevenseg s4(d4, seven[3]);
    mux m1(display_clk,seven[0],seven[1],seven[2],seven[3],zflag,an, sseg,clk,flag);
    
endmodule
