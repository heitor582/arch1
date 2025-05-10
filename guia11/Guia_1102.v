/*
Guia_1102.v
867936-heitor_vieira
*/

// Constant definitions
`define found     1
`define notfound  0

// FSM by Mealy
module mealy_1010 (output reg y, input x, input clk, input reset);

 parameter
    start  = 3'b000,
    id1    = 3'b001,
    id10   = 3'b011,
    id101  = 3'b010,
    id1010  = 3'b100;

  reg [2:0] E1; // Current state
  reg [2:0] E2; // Next state

  always @(x or E1) begin
    y = `notfound;
    case (E1)
      start:
        if (x)
          E2 = id1;
        else
          E2 = start;

      id1:
        if (x)
          E2 = id1;
        else
          E2 = id10;

      id10:
        if (x)
          E2 = id101;
        else
          E2 = start;

      id101:
        if (x) begin
          E2 = id1;
          y = `notfound;
        end else begin
          E2 = id1010;
          y = `found;
        end

      id1010:
        if (x)
          E2 = id1;
        else
          E2 = start;

      default:
        E2 = 3'bxx;
    endcase
  end

  always @(posedge clk or negedge reset) begin
    if (reset)
      E1 <= E2;
    else
      E1 <= 0;
  end

endmodule

module Guia1102;
  reg clk, reset, x;
  wire m1;

  mealy_1010 mealy (m1, x, clk, reset);

  initial begin
    $display("Time X Mealy");

    // Valores iniciais
    clk = 1;
    reset = 0;
    x = 0;

    // Mudanças do sinal de entrada
    #5  reset = 1;
    #10 x = 1;
    #10 x = 0;
    #10 x = 0;
    #10 x = 1;
    #20 x = 0;
    #10 x = 1;
    #10 x = 0;
    #10 x = 1;
    #10 x = 0;
    #10 x = 1;
    #30 $finish;
  end

  // Geração do clock
  always #5 clk = ~clk;

  // Impressão na borda de subida do clock
  always @(posedge clk) begin
    $display("%4d %4b %5b", $time, x, m1);
  end
endmodule
