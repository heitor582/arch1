`include "ram1x8.v"

module ram1x16 (
  input clk,
  input we,
  input clear,
  input preset,
  input [15:0] din,
  output [15:0] dout
);

  wire [7:0] dout_lo, dout_hi;

  ram1x8 ram_lo (
    .clk(clk),
    .we(we),
    .clear(clear),
    .preset(preset),
    .din(din[7:0]),
    .dout(dout_lo)
  );

  ram1x8 ram_hi (
    .clk(clk),
    .we(we),
    .clear(clear),
    .preset(preset),
    .din(din[15:8]),
    .dout(dout_hi)
  );

  assign dout = {dout_hi, dout_lo};

endmodule
module tb_ram1x16;

  reg clk = 0;
  reg we = 0;
  reg clear = 0;
  reg preset = 0;
  reg [15:0] din = 16'b0;
  wire [15:0] dout;

  // Instancia ram1x16
  ram1x16 uut (
    .clk(clk),
    .we(we),
    .clear(clear),
    .preset(preset),
    .din(din),
    .dout(dout)
  );

  // Clock de 10 unidades de tempo
  always #5 clk = ~clk;

  initial begin
    $display("Time | clear preset we din            dout");
    $monitor("%4t |    %b     %b  %b %016b %016b", $time, clear, preset, we, din, dout);

    // Clear ativo (reset assíncrono)
    clear = 1; preset = 0; we = 0; din = 16'b0;
    #10 clear = 0;

    // Preset ativo (seta todos bits para 1)
    #10 preset = 1;
    #10 preset = 0;

    // Escreve 16'b1010101010101010
    #10 we = 1; din = 16'b1010101010101010;
    #10;

    // Sem escrita, só leitura
    we = 0; din = 16'b0;
    #20;

    // Escreve 16'b1100110011001100
    we = 1; din = 16'b1100110011001100;
    #10;

    // Sem escrita, mantém valor
    we = 0; din = 16'b1111111111111111;
    #20;

    $finish;
  end

endmodule
