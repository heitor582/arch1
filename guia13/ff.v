module dff (
    output reg q, output reg qnot,
    input d, input clk,
    input preset, input clear
);
    always @(posedge clk) begin
        if (clear) begin
            q <= 0; 
            qnot <= 1;
        end else if (preset) begin
            q <= 1; 
            qnot <= 0;
        end else begin
            q <= d; 
            qnot <= ~d;
        end
    end
endmodule // dff

module jkff (
    output reg q, output reg qnot,
    input j, input k,
    input clk, input preset, input clear
);
    always @(posedge clk or posedge preset or posedge clear) begin
        if (clear) begin
            q <= 0; 
            qnot <= 1;
        end else if (preset) begin
            q <= 1; 
            qnot <= 0;
        end else if (j & ~k) begin
            q <= 1; 
            qnot <= 0;
        end else if (~j & k) begin
            q <= 0; 
            qnot <= 1;
        end else if (j & k) begin
            q <= ~q; 
            qnot <= ~qnot;
        end
    end
endmodule // jkff

module tff (
    output reg q, output reg qnot,
    input t, input clk,
    input preset, input clear
);
    always @(posedge clk or negedge preset or negedge clear) begin
        if (~clear) begin
            q <= 0; 
            qnot <= 1;
        end else if (~preset) begin
            q <= 1; 
            qnot <= 0;
        end else if (t) begin
            q <= ~q; 
            qnot <= ~qnot;
        end
    end
endmodule // tff

module srff (
    output reg q, output reg qnot,
    input s, input r, input clk,
    input preset, input clear
);
    always @(posedge clk) begin
        if (clear) begin
            q <= 0; 
            qnot <= 1;
        end else if (preset) begin
            q <= 1; 
            qnot <= 0;
        end else if (s & ~r) begin
            q <= 1; 
            qnot <= 0;
        end else if (~s & r) begin
            q <= 0; 
            qnot <= 1;
        end else if (s & r) begin
            q <= 0; 
            qnot <= 0; // estado inválido ou arbitrário
        end
    end
endmodule // srff
