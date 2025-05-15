`include "dff.v"
module ram1x4 (
  input clk,
  input we,
  input clear,
  input preset,
  input [3:0] din,
  output [3:0] dout
);

  wire [3:0] q;
  wire [3:0] qnot_unused;

  wire clk_en = clk & we;

  dff dff0 (q[0], qnot_unused[0], din[0], clk_en, preset, clear);
  dff dff1 (q[1], qnot_unused[1], din[1], clk_en, preset, clear);
  dff dff2 (q[2], qnot_unused[2], din[2], clk_en, preset, clear);
  dff dff3 (q[3], qnot_unused[3], din[3], clk_en, preset, clear);

  assign dout = q;

endmodule

module tb_ram1x4;

  reg clk;
  reg we;
  reg clear;
  reg preset;
  reg [3:0] din;
  wire [3:0] dout;

  ram1x4 uut (
    .clk(clk),
    .we(we),
    .clear(clear),
    .preset(preset),
    .din(din),
    .dout(dout)
  );

  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
    we = 0;
    clear = 0;
    preset = 0;
    din = 4'b0000;

    // Limpa o conteúdo (clear)
    clear = 1;
    #10;
    clear = 0;
    #10;

    // Testa preset (set)
    preset = 1;
    #10;
    preset = 0;
    #10;

    // Escreve 1010
    din = 4'b1010;
    we = 1;
    #10;

    we = 0;
    din = 4'b0000;
    #20;

    // Escreve 1100
    din = 4'b1100;
    we = 1;
    #10;

    we = 0;
    #20;

    $finish;
  end

  initial begin
    $monitor("Time=%0t | clear=%b preset=%b we=%b din=%b dout=%b", $time, clear, preset, we, din, dout);
  end

endmodule