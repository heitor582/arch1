/*
Guia_0803.v
867936-heitor_vieira
*/

module comparator (output s1, input [4:0] a, input[4:0] b);
    wire x1,x2,x3,x4,x5;
    xnor XNOR1(x1, a[0], b[0]);
    xnor XNOR2(x2, a[1], b[1]);
    xnor XNOR3(x3, a[2], b[2]);
    xnor XNOR4(x4, a[3], b[3]);
    xnor XNOR5(x5, a[4], b[4]);
    and AND1(s1,x1,x2,x3,x4,x5);
endmodule

module Guia_0803;
    reg [4:0] x;
    reg [4:0] y;
    wire s;
    comparator Comparator(s, x, y);
    initial begin : main
        x = 4'b1010;
        y = 4'b0110;
        #1;
        
        $display("x = %b, y = %b, res = %b", x, y, s);

        x = 4'b1010;
        y = 4'b1010;
        #1;
        $display("x = %b, y = %b, res = %b", x, y, s);
        $finish;
    end // main
endmodule
