`timescale 1ns / 1ps

module zero_flash_tb;

reg b1, b2, b3, b4;
reg clk, reset10, reset205; 
wire [14:0] newsec;
wire flag; 

all_in_one ut(b1, b2, b3, b4, clk, reset10, reset205, newsec, flag);

initial begin
    b1 = 0;
    b2 = 0; 
    b3 = 0; 
    b4 = 0;
    clk = 1; 
    reset10 = 1; 
    reset205 = 1;
end

always #5 clk = ~clk;

endmodule
