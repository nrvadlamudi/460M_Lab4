`timescale 1ns / 1ps

module bin_to_BCD(clk,Q,zflag,out1,out2,out3,out4);
    input clk;
    input [14:0] Q;
    input zflag;
    output reg [3:0] out1, out2, out3, out4;
    
    reg [27:0] counter;
    reg toggle = 0;
    
    always @(posedge clk) begin
    if(!zflag) begin
        counter = 0;
        out1 = Q % 10;
        out2 = (Q%100) /10;
        out3 = (Q%1000)/100;
        out4 = Q/1000;
    end
    else begin
        if(counter >= 50000000) begin
            toggle = ~toggle;
            counter = 0;
        end
        if(toggle) begin
            counter = counter+1;
            out1 = 0;
            out2 = 0;
            out3 = 0;
            out4 = 0;
        end
        else begin
            counter = counter + 1;
            out1 = 11;
            out2 = 11; 
            out3 = 11;
            out4 = 11;
        end
    end
    end
endmodule