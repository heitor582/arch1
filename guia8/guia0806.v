/*
Guia_0806.v
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
module c1(output[5:0] s, input[5:0] a);
    not NOT1(s[0], a[0]);
    not NOT2(s[1], a[1]);
    not NOT3(s[2], a[2]);
    not NOT4(s[3], a[3]);
    not NOT5(s[4], a[4]);
    not NOT6(s[5], a[5]);
endmodule
module mux ( output s, input a, input b, input select );
    wire not_select;
    wire sa;
    wire sb;
    not NOT1 ( not_select, select );
    and AND1 ( sa, a, not_select );
    and AND2 ( sb, b, select );
    or OR1 ( s , sa, sb );
endmodule // mux
module mux6 (output [5:0] s, input [5:0] a, input [5:0] b, input select);
    mux M0(s[0], a[0], b[0], select);
    mux M1(s[1], a[1], b[1], select);
    mux M2(s[2], a[2], b[2], select);
    mux M3(s[3], a[3], b[3], select);
    mux M4(s[4], a[4], b[4], select);
    mux M5(s[5], a[5], b[5], select);
endmodule
module au(output[5:0] sumR, output[5:0] carry, input[5:0] a, input[5:0] b, input carryIn);
    wire[5:0] c1b, useB;
    c1 C1(c1b, b);
    mux6 MUX1(useB, b, c1b, carryIn);


    fullAdder FA0(sumR[0], carry[0], a[0], useB[0], carryIn);
    fullAdder FA1(sumR[1], carry[1], a[1], useB[1], carry[0]);
    fullAdder FA2(sumR[2], carry[2], a[2], useB[2], carry[1]);
    fullAdder FA3(sumR[3], carry[3], a[3], useB[3], carry[2]);
    fullAdder FA4(sumR[4], carry[4], a[4], useB[4], carry[3]);
    fullAdder FA5(sumR[5], carry[5], a[5], useB[5], carry[4]);
endmodule

module Guia_0806;
    reg [5:0] x;
    reg [5:0] y;
    reg carryIn = 0;
    wire [5:0] carry;
    wire [5:0] sumR;
    au AU1(sumR, carry, x, y, carryIn);
    initial begin : main
        x = 5'b01010;
        y = 5'b00101;
        #1;
        
        $display("x = %b, y = %b, sum = %b, carry = %b", x, y, sumR, carry[5]);
        x = 5'b01010;
        y = 5'b00101;
        carryIn=1;
        #1;
        
        $display("x = %b, y = %b, sum = %b, carry = %b", x, y, sumR, carry[5]);
        $finish;
    end // main
endmodule
