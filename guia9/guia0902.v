/*
Guia_0902.v
867936-heitor_vieira
*/

`include "clock.v" 

// Pulso 1: baseado na borda de subida
module pulse1(output reg signal, input clock);
    always @ (posedge clock) begin
        signal = 1'b1;
        #4 signal = 1'b0;
        #4 signal = 1'b1;
        #4 signal = 1'b0;
        #4 signal = 1'b1;
        #4 signal = 1'b0;
    end
endmodule

// Pulso 2: pulso simples após borda de subida
module pulse2(output reg signal, input clock);
    always @ (posedge clock) begin
        signal = 1'b1;
        #5 signal = 1'b0;
    end
endmodule

// Pulso 3: baseado na borda de descida
module pulse3(output reg signal, input clock);
    always @ (negedge clock) begin
        signal = 1'b1;
        #15 signal = 1'b0;
        #15 signal = 1'b1;
    end
endmodule

// Pulso 4: três transições após borda de descida
module pulse4(output reg signal, input clock);
    always @ (negedge clock) begin
        signal = 1'b1;
        #20 signal = 1'b0;
        #20 signal = 1'b1;
        #20 signal = 1'b0;
    end
endmodule

module Guia0902;
    wire clock;
    wire p1, p2, p3, p4;

    clock clk(clock);
    pulse1 pls1(p1, clock);
    pulse2 pls2(p2, clock);
    pulse3 pls3(p3, clock);
    pulse4 pls4(p4, clock);

    initial begin
        $dumpfile("Guia_0902.vcd");
        $dumpvars(1, clock, p1, p2, p3, p4);
        #480 $finish;
    end
endmodule
