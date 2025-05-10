/*
Guia_1104.v
867936-heitor_vieira
*/

`define found     1
`define notfound  0

module fsm_x111 (output reg y, input x, input clk, input reset);

  parameter
    start  = 3'b000,
    idx    = 3'b001,
    idx1   = 3'b011,
    idx11  = 3'b010,
    idx111  = 3'b100;

  reg [2:0] E1; // Current state
  reg [2:0] E2; // Next state

  always @(x or E1) begin
    y = `notfound;
    case (E1)
      start:
        if (x)
          E2 = idx;
        else
          E2 = idx;

      idx:
        if (x)
          E2 = idx1;
        else
          E2 = idx;

      idx1:
        if (x)
          E2 = idx11;
        else
          E2 = idx;

      idx11:
        if (x) begin
          E2 = idx111;
          y = `found;
        end else begin
          E2 = idx;
          y = `notfound;
        end

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
module Guia1104;
reg clk, reset, x;
  wire m1;

  fsm_x111 fsm (m1, x, clk, reset);

  initial begin
    $display("Time X FSM");

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
    #10 x = 1;
    #10 x = 0;
    #10 x = 1;
    #10 x = 1;
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
