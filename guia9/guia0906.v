/*
Guia_0906.v
867936-heitor_vieira
*/

`include "clock.v" 

module pulse(output reg signal, input clock);
    initial begin
        signal = 0;
    end

    always @(negedge clock) begin
        signal = 1'b1;
        #4 signal = 1'b0;
    end
endmodule

module Guia0906;
    wire clock;
    wire p1;

    clock clk(clock);
  	pulse pls(p1, clock);

    initial begin
        $dumpfile("Guia_0906.vcd");
        $dumpvars(1, clock, p1);
        #480 $finish;
    end
endmodule
