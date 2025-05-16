`include "ram4x8.v"

module ram8x8 (
  input clk,
  input we,
  input clear,
  input preset,
  input [2:0] address,
  input [7:0] din,
  output [7:0] dout
);

  wire [7:0] dout0, dout1;
  wire we0 = we & ~address[2];
  wire we1 = we & address[2];

  // ram4x8 para endereços 000..011
  ram4x8 ram_lo (
    .clk(clk),
    .we(we0),
    .clear(clear),
    .preset(preset),
    .address(address[1:0]),
    .din(din),
    .dout(dout0)
  );

  ram4x8 ram_hi (
    .clk(clk),
    .we(we1),
    .clear(clear),
    .preset(preset),
    .address(address[1:0]),
    .din(din),
    .dout(dout1)
  );

  assign dout = (address[2] == 1'b0) ? dout0 : dout1;

endmodule
module tb_ram8x8;

  reg clk = 0;
  reg we = 0;
  reg clear = 0;
  reg preset = 0;
  reg [2:0] address = 0;   // endereço 3 bits
  reg [7:0] din = 8'b0;
  wire [7:0] dout;

  ram8x8 uut (
    .clk(clk),
    .we(we),
    .clear(clear),
    .preset(preset),
    .address(address),
    .din(din),
    .dout(dout)
  );

  always #5 clk = ~clk;  // clock 10 unidades

  initial begin
    $display("Time | clr prst we addr din      dout");
    $monitor("%4t |  %b   %b   %b  %03b  %08b %08b", $time, clear, preset, we, address, din, dout);

    // Reset
    clear = 1; preset = 0; we = 0; address = 0; din = 0;
    #10 clear = 0;

    // Preset
    #10 preset = 1;
    #10 preset = 0;

    // Escrever em cada endereço com valores diferentes
    #10 we = 1; address = 3'b000; din = 8'hAA;  // 10101010
    #10 address = 3'b001; din = 8'h55;         // 01010101
    #10 address = 3'b010; din = 8'hFF;         // 11111111
    #10 address = 3'b011; din = 8'h00;         // 00000000
    #10 address = 3'b100; din = 8'h0F;         // 00001111
    #10 address = 3'b101; din = 8'hF0;         // 11110000
    #10 address = 3'b110; din = 8'h99;         // 10011001
    #10 address = 3'b111; din = 8'h66;         // 01100110

    // Parar escrita ler dados de cada endereço
    we = 0; din = 0;
    #10 address = 3'b000;
    #10 address = 3'b001;
    #10 address = 3'b010;
    #10 address = 3'b011;
    #10 address = 3'b100;
    #10 address = 3'b101;
    #10 address = 3'b110;
    #10 address = 3'b111;

    $finish;
  end

endmodule
