`timescale 1ns / 1ps


module flip_flop(D, clk, reset,Q);
    input D, clk, reset;
    output reg Q;
    initial begin
        Q = 0;
    end
    always @(posedge clk or negedge reset) begin
        if (reset == 0) begin
            Q <= 1'b0;
        end
        else begin
            Q <= D;
        end
    end
endmodule
