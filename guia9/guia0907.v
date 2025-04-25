/*
Guia_0907.v
867936-heitor_vieira
*/

`include "clock.v" 

module pulse(output reg signal, input clock);
    initial begin
        signal = 0;
    end

    always @(posedge clock) begin
        signal = 1'b1;
        #5 signal = 1'b0;
    end
endmodule

module Guia0907;
    wire clock;
    wire p1;

    clock clk(clock);
  	pulse pls(p1, clock);

    initial begin
        $dumpfile("Guia_0907.vcd");
        $dumpvars(1, clock, p1);
        #480 $finish;
    end
endmodule
