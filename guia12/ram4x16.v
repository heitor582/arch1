`include "ram4x8.v"

module ram4x16 (
  input clk,
  input we,
  input clear,
  input preset,
  input [1:0] address,
  input [15:0] din,
  output [15:0] dout
);

  wire [7:0] dout_lo, dout_hi;

  ram4x8 ram_lo (
    .clk(clk),
    .we(we),
    .clear(clear),
    .preset(preset),
    .address(address),
    .din(din[7:0]),
    .dout(dout_lo)
  );

  ram4x8 ram_hi (
    .clk(clk),
    .we(we),
    .clear(clear),
    .preset(preset),
    .address(address),
    .din(din[15:8]),
    .dout(dout_hi)
  );

  assign dout = {dout_hi, dout_lo};

endmodule
module tb_ram4x16;

  reg clk = 0;
  reg we = 0;
  reg clear = 0;
  reg preset = 0;
  reg [1:0] address = 0;     // endereço 2 bits
  reg [15:0] din = 16'b0;
  wire [15:0] dout;

  ram4x16 uut (
    .clk(clk),
    .we(we),
    .clear(clear),
    .preset(preset),
    .address(address),
    .din(din),
    .dout(dout)
  );

  always #5 clk = ~clk; // clock com período 10 unidades

  initial begin
    $display("Time | clr prst we addr din             dout");
    $monitor("%4t |  %b   %b   %b  %02b  %016b %016b", $time, clear, preset, we, address, din, dout);

    // Reset
    clear = 1; preset = 0; we = 0; address = 0; din = 16'b0;
    #10 clear = 0;

    // Preset
    #10 preset = 1;
    #10 preset = 0;

    // Escrever em cada endereço com valores diferentes
    #10 we = 1; address = 2'b00; din = 16'hA5A5;    // 1010010110100101
    #10 address = 2'b01; din = 16'h5A5A;           // 0101101001011010
    #10 address = 2'b10; din = 16'hFF00;           // 1111111100000000
    #10 address = 2'b11; din = 16'h00FF;           // 0000000011111111

    // Parar escrita ler dados de cada endereço
    we = 0; din = 16'b0;
    #10 address = 2'b00;
    #10 address = 2'b01;
    #10 address = 2'b10;
    #10 address = 2'b11;

    $finish;
  end

endmodule
