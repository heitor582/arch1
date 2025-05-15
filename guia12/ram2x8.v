`include "ram1x8.v"

module ram2x8 (
  input clk,
  input we,
  input clear,
  input preset,
  input address,
  input [7:0] din,
  output [7:0] dout
);

  wire [7:0] dout0, dout1;

  wire we0 = we & ~address;
  wire we1 = we & address;

  ram1x8 ram0 (
    .clk(clk),
    .we(we0),
    .clear(clear),
    .preset(preset),
    .din(din),
    .dout(dout0)
  );

  ram1x8 ram1 (
    .clk(clk),
    .we(we1),
    .clear(clear),
    .preset(preset),
    .din(din),
    .dout(dout1)
  );

  assign dout = (address == 1'b0) ? dout0 : dout1;

endmodule
module tb_ram2x8;

  reg clk = 0;
  reg we = 0;
  reg clear = 0;
  reg preset = 0;
  reg address = 0;         // endereço 1 bit
  reg [7:0] din = 8'b0;
  wire [7:0] dout;

  ram2x8 uut (
    .clk(clk),
    .we(we),
    .clear(clear),
    .preset(preset),
    .address(address),
    .din(din),
    .dout(dout)
  );

  always #5 clk = ~clk; // clock 10 unidades de tempo

  initial begin
    $display("Time | clr prst we addr din      dout");
    $monitor("%4t |  %b   %b   %b    %b   %08b %08b", $time, clear, preset, we, address, din, dout);

    // Reset assíncrono
    clear = 1; preset = 0; we = 0; address = 0; din = 8'b0;
    #10 clear = 0;

    // Preset assíncrono
    #10 preset = 1;
    #10 preset = 0;

    // Escreve 10101010 no endereço 0
    #10 we = 1; address = 0; din = 8'b10101010;
    #10;

    // Escreve 11001100 no endereço 1
    address = 1; din = 8'b11001100;
    #10;

    // Desliga escrita e lê endereço 0
    we = 0; address = 0; din = 8'b0;
    #20;

    // Lê endereço 1
    address = 1;
    #20;

    $finish;
  end

endmodule
