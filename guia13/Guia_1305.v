/*
Guia_1305.v
867936-heitor_vieira
*/
`include "ff.v"

module counter_seven_3bit_t (
    output [2:0] q,
    input clk,
    input preset,
    input clear
);
    wire q0not, q1not, q2not;

    tff tff0 (.q(q[0]), .qnot(q0not), .t(1'b1),        .clk(clk),  .preset(preset), .clear(clear));
    tff tff1 (.q(q[1]), .qnot(q1not), .t(q[0]),        .clk(clk),  .preset(preset), .clear(clear));
    tff tff2 (.q(q[2]), .qnot(q2not), .t(q[0] & q[1]), .clk(clk),  .preset(preset), .clear(clear));
endmodule

module Guia1305;
    reg clk;
    reg preset;
    reg clear;
    wire [2:0] q;

    counter_seven_3bit_t counter (
        .q(q),
        .clk(clk),
        .preset(preset),
        .clear(clear)
    );

    always #5 clk = ~clk;

    initial begin
        $display("Time\tClear\tPreset\tQ");
        $monitor("%0dns\t%b\t%b\t%b", $time, clear, preset, q);

        clk = 0;
        preset = 1;
        clear = 1;
        #10;
        clear = 0;
        #10;
        clear = 1;

        #100;

        $finish;
    end

endmodule
