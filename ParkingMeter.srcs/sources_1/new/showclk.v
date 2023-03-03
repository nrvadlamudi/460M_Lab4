`timescale 1ns / 1ps



module clkshow(
    input clk,
    input zflag,
    output clk_out
    );
    reg[15:0] count = 0;
    assign clk_out = count[15];

    always @(posedge clk) begin
        count = count + 1;
        if(clk_out) 
            count = 0;
    end
endmodule