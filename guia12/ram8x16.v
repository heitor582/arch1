`include "ram1x16.v"

module ram8x16 (
  input clk,
  input we,
  input clear,
  input preset,
  input [2:0] address,
  input [15:0] din,
  output reg [15:0] dout
);

  wire [15:0] dout_array [7:0];
  wire [7:0] we_array;

  genvar i;
  generate
    for (i=0; i<8; i=i+1) begin : gen_ram
      assign we_array[i] = we & (address == i);
      ram1x16 ram_inst (
        .clk(clk),
        .we(we_array[i]),
        .clear(clear),
        .preset(preset),
        .din(din),
        .dout(dout_array[i])
      );
    end
  endgenerate

  always @(*) begin
    dout = dout_array[address];
  end

endmodule
module tb_ram8x16;

  reg clk = 0;
  reg we = 0;
  reg clear = 0;
  reg preset = 0;
  reg [2:0] address = 0;     // endereço 3 bits
  reg [15:0] din = 16'b0;
  wire [15:0] dout;

  ram8x16 uut (
    .clk(clk),
    .we(we),
    .clear(clear),
    .preset(preset),
    .address(address),
    .din(din),
    .dout(dout)
  );

  always #5 clk = ~clk;  // clock com período 10 unidades

  initial begin
    $display("Time | clr prst we addr  din           dout");
    $monitor("%4t |  %b   %b   %b  %03b  %016b %016b", $time, clear, preset, we, address, din, dout);

    // Reset assíncrono
    clear = 1; preset = 0; we = 0; address = 0; din = 0;
    #10 clear = 0;

    // Preset assíncrono
    #10 preset = 1;
    #10 preset = 0;

    // Escrever em cada endereço com valores diferentes
    #10 we = 1; address = 3'b000; din = 16'hA5A5;  // 1010010110100101
    #10 address = 3'b001; din = 16'h5A5A;         // 0101101001011010
    #10 address = 3'b010; din = 16'hFFFF;         // 1111111111111111
    #10 address = 3'b011; din = 16'h0000;         // 0000000000000000
    #10 address = 3'b100; din = 16'h0F0F;         // 0000111100001111
    #10 address = 3'b101; din = 16'hF0F0;         // 1111000011110000
    #10 address = 3'b110; din = 16'h1234;         // 0001001000110100
    #10 address = 3'b111; din = 16'hFEDC;         // 1111111011011100

    // Parar escrita, ler dados de cada endereço
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
