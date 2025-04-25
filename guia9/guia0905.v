/*
Guia_0905.v
867936-heitor_vieira
*/

`include "clock.v" 

module pulse1(output reg signal, input clock);
    initial begin
        signal = 0;
    end
    always @ (posedge clock) begin
        signal = 1'b1;
        #3 signal = 1'b0;
        #3 signal = 1'b1;
        #3 signal = 1'b0;
    end
endmodule

module pulse(output reg signal, input signalPulse1, input clock);
    initial begin
        signal = 0;
    end

    always @(posedge clock & signalPulse1) begin
        signal = 1'b1;
        #3 signal = 1'b0;
    end
endmodule

module Guia0905;
    wire clock;
    wire p1, p2;

    clock clk(clock);
    pulse1 pls1(p2, clock);
  	pulse pls(p1, p2, clock);

    initial begin
        $dumpfile("Guia_0905.vcd");
      $dumpvars(1, clock, p2, p1);
        #480 $finish;
    end
endmodule
