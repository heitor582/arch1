module dff (
  output reg q,
  output reg qnot,
  input d,
  input clk,
  input preset,
  input clear
);

always @(posedge clk or posedge clear or posedge preset) begin
  if (clear) begin
    q <= 0;
    qnot <= 1;
  end
  else if (preset) begin
    q <= 1;
    qnot <= 0;
  end
  else begin
    q <= d;
    qnot <= ~d;
  end
end

endmodule // dff
