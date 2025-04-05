/*
Guia_0805.v
867936-heitor_vieira
*/

// -------------------------
// half adder
// -------------------------
module halfAdder (output s1, output s0, input a, input b);
    xor XOR1 ( s1, a, b );
    and AND1 ( s0, a, b );
endmodule // halfAdder

module c1(output[5:0] s, input[5:0] a);
    not NOT1(s[0], a[0]);
    not NOT2(s[1], a[1]);
    not NOT3(s[2], a[2]);
    not NOT4(s[3], a[3]);
    not NOT5(s[4], a[4]);
    not NOT6(s[5], a[5]);
endmodule
module c2(output[5:0] s, input[5:0] x);
    wire [5:0] not_x;
    c1 C1(not_x, x);
    wire carryIn = 1'b1;
    wire [5:0] carry;
    halfAdder HA0(s[0], carry[0], not_x[0], carryIn);
    halfAdder HA1(s[1], carry[1], not_x[1], carry[0]);
    halfAdder HA2(s[2], carry[2], not_x[2], carry[1]);
    halfAdder HA3(s[3], carry[3], not_x[3], carry[2]);
    halfAdder HA4(s[4], carry[4], not_x[4], carry[3]);
    halfAdder HA5(s[5], carry[5], not_x[5], carry[4]);
endmodule
module Guia_0805;
    reg [5:0] x;
    wire [5:0] s;
    c2 C2(s, x);
    
    initial begin : main
        x = 5'b00111;
        #1;
        
        $display("x = %b, sum = %b", x, s);
        $finish;
    end // main
endmodule
