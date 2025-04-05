/*
Guia_0806.v
867936-heitor_vieira
*/
module comparatorE (output s1, input [5:0] a, input[5:0] b);
    wire x1,x2,x3,x4,x5;
    xnor XNOR1(x1, a[0], b[0]);
    xnor XNOR2(x2, a[1], b[1]);
    xnor XNOR3(x3, a[2], b[2]);
    xnor XNOR4(x4, a[3], b[3]);
    xnor XNOR5(x5, a[4], b[4]);
    and AND1(s1,x1,x2,x3,x4,x5);
endmodule
module comparatorD (output s1, input [5:0] a, input[5:0] b);
    wire x1,x2,x3,x4,x5;
    xor XOR1(x1, a[0], b[0]);
    xor XOR2(x2, a[1], b[1]);
    xor XOR3(x3, a[2], b[2]);
    xor XOR4(x4, a[3], b[3]);
    xor XOR5(x5, a[4], b[4]);
    or OR1(s1,x1,x2,x3,x4,x5);
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
module lu(output result, input[5:0] a, input[5:0] b, input select);
    wire e, d;
    comparatorD D(d, a, b);
    comparatorE E(e, a, b);
    mux MUX1(result, e,d, select);
endmodule

module Guia_0806;
    reg [5:0] x;
    reg [5:0] y;
    reg select = 0;
    wire result;
    lu LU1(result, x, y, select);
    initial begin : main
        x = 5'b00101;
        y = 5'b00101;
        #1;
        
        $display("x = %b, y = %b, result = %b, select = %b", x, y, result, select);

        x = 5'b01101;
        y = 5'b00101;
        #1;
        
        $display("x = %b, y = %b, result = %b, select = %b", x, y, result, select);

        x = 5'b01010;
        y = 5'b00101;
        select=1;
        #1;
        
        $display("x = %b, y = %b, result = %b, select = %b", x, y, result, select);

        x = 5'b01010;
        y = 5'b01010;
        select=1;
        #1;
        
        $display("x = %b, y = %b, result = %b, select = %b", x, y, result, select);
        $finish;
    end // main
endmodule
