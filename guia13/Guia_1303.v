/*
Guia_1303.v
867936-heitor_vieira
*/
`include "ff.v"

module async_ten_counter_5bit_jk (
    output [4:0] q,
    input clk,
    input preset,
    input clear
);
    wire q0not, q1not, q2not, q3not, q4not;


    wire reset_condition = q[3] & ~q[2] & q[1] & ~q[0];
    wire clear_internal = clear | reset_condition;

    jkff jkff0 (.q(q[0]), .qnot(q0not), .j(1'b1), .k(1'b1), .clk(clk),  .preset(preset), .clear(clear_internal));
    jkff jkff1 (.q(q[1]), .qnot(q1not), .j(1'b1), .k(1'b1), .clk(q0not), .preset(preset), .clear(clear_internal));
    jkff jkff2 (.q(q[2]), .qnot(q2not), .j(1'b1), .k(1'b1), .clk(q1not), .preset(preset), .clear(clear_internal));
    jkff jkff3 (.q(q[3]), .qnot(q3not), .j(1'b1), .k(1'b1), .clk(q2not), .preset(preset), .clear(clear_internal));
    jkff jkff4 (.q(q[4]), .qnot(q4not), .j(1'b0), .k(1'b0), .clk(q3not), .preset(preset), .clear(clear_internal));
endmodule

module Guia1303;
    reg clk;
    reg preset;
    reg clear;
    wire [4:0] q;

    async_ten_counter_5bit_jk counter (
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
        preset = 0;
        clear = 1;

        #10;
        clear = 0;

        #100;

        $finish;
    end

endmodule
