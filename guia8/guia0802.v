/*
Guia_0802.v
867936-heitor_vieira
*/

// -------------------------
// half subtractor
// -------------------------
module halfSubtractor (output s1, output s0, input a, input b);
    wire notA;
    xor XOR1 ( s1, a, b );
    not NOT1 (notA, a);
    and AND1 ( s0, notA, b );
endmodule // halfSubtractor

// -------------------------
// full subtractor
// -------------------------
module fullSubtractor (output s, output s0, input a, input b, input borrowIn);
    wire s1, c1, c2;

    halfSubtractor HS1(s1, c1, a, b);
    halfSubtractor HS2(s, c2, s1, borrowIn);
    or OR1(s0, c1, c2);  // borrow out
endmodule 

module Guia_0802;
    reg [4:0] x;
    reg [4:0] y;
    reg borrowIn = 0;
    wire [4:0] borrow;
    wire [5:0] sumR;
    fullSubtractor FS0(sumR[0], borrow[0], x[0], y[0], borrowIn);
    fullSubtractor FS1(sumR[1], borrow[1], x[1], y[1], borrow[0]);
    fullSubtractor FS2(sumR[2], borrow[2], x[2], y[2], borrow[1]);
    fullSubtractor FS3(sumR[3], borrow[3], x[3], y[3], borrow[2]);
    fullSubtractor FS4(sumR[4], borrow[4], x[4], y[4], borrow[3]);
    assign sumR[5]=borrow[4];
    initial begin : main
        x = 4'b1010;
        y = 4'b0110;
        #10;
        
        $display("x = %b, y = %b, sum = %b, borrow = %b", x, y, sumR, borrow[4]);
        $finish;
    end // main
endmodule
