// --------------
// --- Moore FSM
// --------------

/*
Moore FSM Diagram
 ___________________
/                   \
1 1     v 0 1 1      | // found
[start] --> [id1] --> [id11] --> [id110] --> [id1101]
   ^     \0 0 | 1   ^   \ 0 | 0 |
    \_/  /      \__/     |   |
      \_________/        |   |
          \              |   |
           \             |   |
            \           /
             \_________/
*/

/* --- Constant Definitions --- */
`define found     1
`define notfound  0

// FSM by Moore
module moore_1101 (y, x, clk, reset);

  output y;
  input  x;
  input  clk;
  input  reset;

  reg y;

  // State identifiers
  parameter
    start   = 3'b000,
    id1     = 3'b001,
    id11    = 3'b011,
    id110   = 3'b010,
    id1101  = 3'b110; // signal found

  reg [2:0] E1; // Current state
  reg [2:0] E2; // Next state

  // Next state logic
  always @(x or E1) begin
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
        if (x)
          E2 = id1101;
        else
          E2 = start;

      id1101:
        if (x)
          E2 = id11;
        else
          E2 = start;

      default: // Undefined state
        E2 = 3'bxxx;
    endcase
  end

  // State variable update
  always @(posedge clk or negedge reset) begin
    if (reset)
      E1 <= E2; // Update current state
    else
      E1 <= 0;  // Reset
  end

  // Output logic (Moore FSM: output depends only on state)
  always @(E1) begin
    y = E1[2]; // Output is 1 only for id1101 (when MSB is 1)
  end

endmodule // moore_1101
