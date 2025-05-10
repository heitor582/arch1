// ------------------------
// --- Mealy-Moore FSMs ---
// ------------------------

`include "mealy_1101.v"
`include "moore_1101.v"

module Guia_1101;

  reg clk, reset, x;
  wire m1, m2;

  // Instâncias dos módulos Mealy e Moore
  mealy_1101 mealy1 (m1, x, clk, reset);
  moore_1101 moore1 (m2, x, clk, reset);

  initial begin
    $display("Time X Mealy Moore");

    // Valores iniciais
    clk = 1;
    reset = 0;
    x = 0;

    // Mudanças do sinal de entrada
    #5  reset = 1;
    #10 x = 1;
    #10 x = 0;
    #10 x = 1;
    #20 x = 0;
    #10 x = 1;
    #10 x = 1;
    #10 x = 0;
    #10 x = 1;
    #30 $finish;
  end

  // Geração do clock
  always #5 clk = ~clk;

  // Impressão na borda de subida do clock
  always @(posedge clk) begin
    $display("%4d %4b %5b %5b", $time, x, m1, m2);
  end

endmodule // Guia_1101
