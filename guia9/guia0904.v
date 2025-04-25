/*
Guia_0904.v
867936-heitor_vieira
*/

`include "clock.v" 

module pulse(output reg signal, input clock);
    reg [2:0] count = 0;

    initial begin
        signal = 0;
    end

    always @(posedge clock) begin
        if (count == 4) begin
            signal = 0;
            count = 0;
        end else begin
          	signal = 1;
            count = count + 1;
        end
    end
endmodule

module Guia0904;
    wire clock;
    wire p1;

    clock clk(clock);
    pulse pls(p1, clock);

    initial begin
        $dumpfile("Guia_0904.vcd");
        $dumpvars(1, clock, p1);
        #480 $finish;
    end
endmodule
