`timescale 1ns / 1ps

module bin_to_BCD(Q,out1,out2,out3,out4);
    input [14:0] Q;
    output [3:0] out1, out2, out3, out4;
    
    assign out1 = Q % 10;
    assign out2 = (Q%100) /10;
    assign out3 = (Q%1000)/100;
    assign out4 = Q/1000;
endmodule