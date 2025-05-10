// --------------
// --- Mealy FSM
// --------------

/*
Mealy FSM Diagram
 ___________________
/                   \
1       v 1 0 1      | // found
[start] --> [id1] --> [id11] --> [id110]
  ^      \0 0 | 1 /     ^     0 | // not found
   \_/   /     \__/     |
     \__/              |
       \               |
        \             /
         \___________/
*/

// Constant definitions
`define found     1
`define notfound  0

// FSM by Mealy
module mealy_1101 (y, x, clk, reset);

  output y;
  input  x;
  input  clk;
  input  reset;

  reg y;

  parameter
    start  = 2'b00,
    id1    = 2'b01,
    id11   = 2'b11,
    id110  = 2'b10;

  reg [1:0] E1; // Current state
  reg [1:0] E2; // Next state

  // Next state logic
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
          E2 = id11;
        else
          E2 = start;

      id11:
        if (x)
          E2 = id11;
        else
          E2 = id110;

      id110:
        if (x) begin
          E2 = id1;
          y = `found;
        end else begin
          E2 = start;
          y = `notfound;
        end

      default:
        E2 = 2'bxx;
    endcase
  end

  // State variable update
  always @(posedge clk or negedge reset) begin
    if (reset)
      E1 <= E2;
    else
      E1 <= 0;
  end

endmodule // mealy_1101
