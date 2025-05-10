/*
Guia_1105.v
867936-heitor_vieira
*/

`define found     1
`define notfound  0

module fsm_010OR101 (output reg y, input x, input clk, input reset);

  parameter
    start  = 3'b000,
    id1    = 3'b001,
    id10   = 3'b011,
    id101  = 3'b010,
    id0    = 3'b100,
    id01   = 3'b101,
    id010  = 3'b110;

  reg [2:0] E1; // Current state
  reg [2:0] E2; // Next state

  always @(x or E1) begin
    y = `notfound;
    case (E1)
      start:
        if (x)
          E2 = id1;
        else
          E2 = id0;

      id1:
        if (x)
          E2 = id1;
        else
          E2 = id10;

      id10:
        if (x) begin
          y = `found;
          E2 = id101;
        end
        else
          E2 = id0;
    
      id0:
        if (x)
          E2 = id01;
        else
          E2 = id0;
      id01:
        if (x)
          E2 = id1;
        else begin
          y = `found;
          E2 = id010;
        end

      default:
        E2 = 3'bxx;
    endcase
  end

  always @(posedge clk or negedge reset) begin
    if (reset)
      E1 <= E2;
    else
      E1 <= start;
  end

endmodule

module Guia1105;
reg clk, reset, x;
  wire m1;

  fsm_010OR101 fsm (m1, x, clk, reset);

  initial begin
    $display("Time X FSM");

    // Valores iniciais
    clk = 1;
    reset = 0;
    x = 0;

    // Mudanças do sinal de entrada
    #5  reset = 0;
    #10  reset = 1;
    #10 x = 1;
    #10 x = 0;
    #10 x = 0;
    #10 x = 1;
    #10 x = 0;
    #10  reset = 0;
    #10  reset = 1;
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
    $display("%4d %4b %5b", $time, x, m1);
  end
endmodule