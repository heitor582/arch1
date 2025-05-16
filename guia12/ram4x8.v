`include "ram2x8.v"

module ram4x8 (
  input clk,
  input we,
  input clear,
  input preset,
  input [1:0] address,
  input [7:0] din,
  output [7:0] dout
);

  wire [7:0] dout0, dout1;
  wire we0 = we & ~address[1];
  wire we1 = we & address[1];

  // RAM de endereços 00 e 01
  ram2x8 ram_lo (
    .clk(clk),
    .we(we0),
    .clear(clear),
    .preset(preset),
    .address(address[0]),
    .din(din),
    .dout(dout0)
  );

  ram2x8 ram_hi (
    .clk(clk),
    .we(we1),
    .clear(clear),
    .preset(preset),
    .address(address[0]),
    .din(din),
    .dout(dout1)
  );

  assign dout = (address[1] == 1'b0) ? dout0 : dout1;

endmodule
module tb_ram4x8;

  reg clk = 0;
  reg we = 0;
  reg clear = 0;
  reg preset = 0;
  reg [1:0] address = 0;    // endereço 2 bits
  reg [7:0] din = 8'b0;
  wire [7:0] dout;

  ram4x8 uut (
    .clk(clk),
    .we(we),
    .clear(clear),
    .preset(preset),
    .address(address),
    .din(din),
    .dout(dout)
  );

  always #5 clk = ~clk;

  initial begin
    $display("Time | clr prst we addr din      dout");
    $monitor("%4t |  %b   %b   %b   %02b   %08b %08b", $time, clear, preset, we, address, din, dout);

    // Reset
    clear = 1; preset = 0; we = 0; address = 0; din = 8'b0;
    #10 clear = 0;

    // Preset
    #10 preset = 1;
    #10 preset = 0;

    // Escrever dados diferentes em cada endereço de 00 a 11
    #10 we = 1; address = 2'b00; din = 8'b10101010; 
    #10 address = 2'b01; din = 8'b11001100; 
    #10 address = 2'b10; din = 8'b11110000; 
    #10 address = 2'b11; din = 8'b00001111;

    // Parar a escrita e ler dados de todos os endereços
    we = 0; din = 8'b0;
    #10 address = 2'b00;
    #10 address = 2'b01;
    #10 address = 2'b10;
    #10 address = 2'b11;

    $finish;
  end

endmodule
