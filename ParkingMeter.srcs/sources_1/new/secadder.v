`timescale 1ns / 1ps

module secadder(clk,b1,b2,b3,b4,reset10, reset205, newsec);
    reg [14:0]sec;//D
    input b1,b2,b3,b4;
    output [14:0] newsec; 
    input clk, reset10, reset205;
    wire [14:0] result; //sum
    assign newsec = result;
    wire [14:0] feedback; //Q
    reg [14:0] addnum;
    initial begin
        sec = 0;
        addnum = 0;
    end
    wire reset;
    assign reset = reset10 & reset205;
    wire load = b1 || b2 || b3 || b4;
    
    always @ (*) begin
            if (b1 == 1) begin
                addnum = 10;
                end
            else if (b2 == 1) begin
                addnum = 180;
                end
            else if (b3 == 1) begin
                addnum = 200;
                end
            else if (b4 == 1) begin
                addnum = 550;
                end
            else begin
                addnum = 0;
                end
        end
    assign result = feedback + addnum;
    
    always @(*) begin
        if (~reset10) sec = 10;
        else if (~reset205) sec = 205;
        else sec = result;
    end        
    subtractor s1(clk,sec,feedback,reset,load);
endmodule