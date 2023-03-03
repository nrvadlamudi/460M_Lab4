`timescale 1ns / 1ps

module decrementer(
    input clk, 
    input [13:0] time_in,
    output reg [13:0] time_out
    );
    
    // on one sec clock
    always @(posedge clk) begin
        if(time_in > 0) 
            time_out = time_in - 1;
        else
            time_out = 0;
    end
endmodule
