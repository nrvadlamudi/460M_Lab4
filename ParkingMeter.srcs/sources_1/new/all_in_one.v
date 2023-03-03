`timescale 1ns / 1ps

module all_in_one(b1,b2,b3,b4,clk,reset10,reset205,newsec,flag, zeroToggle);
    input b1,b2,b3,b4;
    input clk, reset10, reset205;
    output [14:0] newsec;
    output reg flag;
    output reg zeroToggle;
    reg [14:0] sec;
    reg [27:0] counter;
    initial begin
        sec = 0;
        counter = 0;
        zeroToggle = 0;
    end
    always @ (posedge clk) begin
        if (~reset10) begin
            sec = 10;
            counter = 1;
            zeroToggle = 0;
        end
        else if (~reset205) begin
            sec = 205;
            counter = 1;
            zeroToggle = 0;
        end
        else begin
            if (counter == 100000000) begin
                counter = 1;
                if(sec > 0)
                    sec = sec -1;
                else
                    sec = 0;
            end
            else begin
                counter = counter +1;
            end
            if (b1) begin
                sec = sec +10;
                zeroToggle = 0;
            end
            else if (b2) begin
                sec = sec + 180;
                zeroToggle = 0;
            end
            else if (b3) begin
                sec = sec +200;
                zeroToggle = 0;
            end
            else if (b4) begin
                sec = sec + 550;
                zeroToggle = 0;
            end
            else begin
                sec = sec;
                zeroToggle = 0;
            end
            if (sec > 9999) begin
                sec = 9999;
                zeroToggle = 0;
            end
            if (sec < 200 && sec % 2 > 0) begin
                flag = 1;
                zeroToggle = 0;
            end
            else begin
                if(sec == 0) begin
                    flag = 0;
                    zeroToggle = 1;
                end
                else begin
                    flag = 0;
                    zeroToggle = 0;
                end
            end
                
       end
  end
    assign newsec = sec;
endmodule