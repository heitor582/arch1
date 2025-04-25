/*
Guia_0903.v
867936-heitor_vieira
*/

`include "clock.v" 

module pulse(output reg signal, input clock);
    reg [1:0] count = 0;

    initial begin
        signal = 0;
    end

    always @(posedge clock) begin
        if (count == 2) begin
            signal = 1;
            count = 0;
        end else begin
            count = count + 1;
          	signal = 0;
        end
    end
endmodule

module Guia0903;
    wire clock;
    wire p1;

    clock clk(clock);
    pulse pls(p1, clock);

    initial begin
        $dumpfile("Guia_0903.vcd");
        $dumpvars(1, clock, p1);
        #480 $finish;
    end
endmodule
