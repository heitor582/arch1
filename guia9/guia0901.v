/*
Guia_0901.v
867936-heitor_vieira
*/

module clock(output reg clk);

    initial begin
        clk = 1'b0;
    end

    always begin
        #12 clk = ~clk;
    end
endmodule

// ---------------------------
// -- Pulse Generator
// ---------------------------

module pulse(output reg signal, input clock);
    always @ (clock) begin
        signal = 1'b1;
        #3 signal = 1'b0;
        #3 signal = 1'b1;
        #3 signal = 1'b0;
    end
endmodule

// ---------------------------
// -- Trigger Generator
// ---------------------------

module trigger(output reg signal, input on, input clock);
    always @ (posedge clock & on) begin
        #60 signal = 1'b1;
        #60 signal = 1'b0;
    end
endmodule

// ---------------------------
// -- Testbench: Guia0901
// ---------------------------

module Guia0901;
    wire clock;
    clock clk(clock);

    reg p;
    wire p1, t1;

    pulse pulse1(p1, clock);
    trigger trigger1(t1, p, clock);

    initial begin
        p = 1'b0;
    end

    initial begin
        $dumpfile("Guia_0901.vcd");
        $dumpvars(1, clock, p1, p, t1);

        #60  p = 1'b1;
        #120 p = 1'b0;
        #180 p = 1'b1;
        #240 p = 1'b0;
        #300 p = 1'b1;
        #360 p = 1'b0;
        #376 $finish;
    end
endmodule
