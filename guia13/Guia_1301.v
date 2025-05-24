/*
Guia_1301.v
867936-heitor_vieira
*/
`include "ff.v"

module reverse_async_counter_6bit_jk (
    output [5:0] q,
    input clk,
    input preset,
    input clear
);
    wire q0not, q1not, q2not, q3not, q4not, q5not;

    jkff jkff0 (.q(q[0]), .qnot(q0not), .j(1'b1), .k(1'b1), .clk(clk),  .preset(preset), .clear(clear));
    jkff jkff1 (.q(q[1]), .qnot(q1not), .j(1'b1), .k(1'b1), .clk(q[0]), .preset(preset), .clear(clear));
    jkff jkff2 (.q(q[2]), .qnot(q2not), .j(1'b1), .k(1'b1), .clk(q[1]), .preset(preset), .clear(clear));
    jkff jkff3 (.q(q[3]), .qnot(q3not), .j(1'b1), .k(1'b1), .clk(q[2]), .preset(preset), .clear(clear));
    jkff jkff4 (.q(q[4]), .qnot(q4not), .j(1'b1), .k(1'b1), .clk(q[3]), .preset(preset), .clear(clear));
    jkff jkff5 (.q(q[5]), .qnot(q5not), .j(1'b1), .k(1'b1), .clk(q[4]), .preset(preset), .clear(clear));
endmodule

module Guia1301;
    reg clk;
    reg preset;
    reg clear;
    wire [5:0] q;

    reverse_async_counter_6bit_jk counter (
        .q(q),
        .clk(clk),
        .preset(preset),
        .clear(clear)
    );

    always #2 clk = ~clk;

    initial begin
        $display("Time\tClear\tPreset\tQ");
        $monitor("%0dns\t%b\t%b\t%b", $time, clear, preset, q);

        clk = 0;
        preset = 0;
        clear = 1;

        #10;
        clear = 0;

        #520;

        $finish;
    end

endmodule
