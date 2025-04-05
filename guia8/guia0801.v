/*
Guia_0801.v
867936-heitor_vieira
*/

// -------------------------
// half adder
// -------------------------
module halfAdder (output s1, output s0, input a, input b);
    xor XOR1 ( s1, a, b );
    and AND1 ( s0, a, b );
endmodule // halfAdder

// -------------------------
// full adder
// -------------------------
module fullAdder (output s, output s0, input a, input b, input carryIn);
    wire s1, c1, c2;

    halfAdder HA1(s1, c1, a, b);
    halfAdder HA2(s, c2, s1, carryIn);
    or OR1(s0, c1, c2);  // carry out
endmodule 

module Guia_0801;
    reg [4:0] x;
    reg [4:0] y;
    reg carryIn = 0;
    wire [4:0] carry;
    wire [5:0] sumR;
    fullAdder FA0(sumR[0], carry[0], x[0], y[0], carryIn);
    fullAdder FA1(sumR[1], carry[1], x[1], y[1], carry[0]);
    fullAdder FA2(sumR[2], carry[2], x[2], y[2], carry[1]);
    fullAdder FA3(sumR[3], carry[3], x[3], y[3], carry[2]);
    fullAdder FA3(sumR[4], carry[4], x[4], y[4], carry[3]);
    assign sumR[5]=carry[4];
    initial begin : main
        x = 4'b1010;
        y = 4'b0101;
        #10;
        
        $display("x = %b, y = %b, sum = %b, carry = %b", x, y, sumR, carry[4]);
        $finish;
    end // main
endmodule
