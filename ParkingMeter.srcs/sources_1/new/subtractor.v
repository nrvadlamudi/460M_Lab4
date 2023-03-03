`timescale 1ns / 1ps

module subtractor(clk,sec,outsec,reset,load);
    input clk,reset,load;
    input [14:0]sec;
    reg [14:0] holder;
    output [14:0]outsec;
    reg onehz;
    reg sec_counter;
    initial begin
        holder = sec;
    end
    
    always @ (posedge clk or negedge reset or posedge load) begin
            if (load) begin
            holder = sec;
            end
            if (~reset) begin
                holder = sec;
            end
            if (!reset)begin
                sec_counter = 1;
                end
            else begin
                if (sec_counter == 50000000) begin
                    onehz = ~onehz;
                    sec_counter = 1;
                    end
                else begin
                    sec_counter = sec_counter + 1;
                    end
            end
        end
    always @ (posedge onehz, negedge reset ) begin

        if (!reset) begin
            holder = sec;
        end
        else begin
            if (sec > 0) begin
                holder = sec - 1;
                end
            else begin
                holder = 0;
            end
        end
    end 
    assign outsec = holder;
endmodule