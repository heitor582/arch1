`include "ram1x4.v" 
module ram1x8 (
  input clk,
  input we,
  input clear,
  input preset,
  input [7:0] din,
  output [7:0] dout
);

  ram1x4 ram_lo (
    .clk(clk),
    .we(we),
    .clear(clear),
    .preset(preset),
    .din(din[3:0]),
    .dout(dout[3:0])
  );

  ram1x4 ram_hi (
    .clk(clk),
    .we(we),
    .clear(clear),
    .preset(preset),
    .din(din[7:4]),
    .dout(dout[7:4])
  );

endmodule

module tb_ram1x8;

  reg clk = 0;
  reg we = 0;
  reg clear = 0;
  reg preset = 0;
  reg [7:0] din = 8'b00000000;
  wire [7:0] dout;

  ram1x8 uut (
    .clk(clk),
    .we(we),
    .clear(clear),
    .preset(preset),
    .din(din),
    .dout(dout)
  );

  always #5 clk = ~clk;

  initial begin
    $display("Time | clear preset we din dout");
    $monitor("%4t |    %b     %b  %b %b %b", $time, clear, preset, we, din, dout);

    //clear ativo
    clear = 1; preset = 0; we = 0; din = 8'b00000000;
    #10 clear = 0;

    // Preset ativo (seta todos bits para 1)
    #10 preset = 1;
    #10 preset = 0;

    // Escreve 8'b10101010
    #10 we = 1; din = 8'b10101010;
    #10;

    // Sem escrita, apenas leitura (din muda mas dout permanece)
    we = 0; din = 8'b00000000;
    #20;

    // Escreve 8'b11001100
    we = 1; din = 8'b11001100;
    #10;

    // Sem escrita mantem valor
    we = 0; din = 8'b11111111;
    #20;

    $finish;
  end

endmodule
