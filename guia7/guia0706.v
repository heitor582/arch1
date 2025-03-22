/*
Guia_0706.v
867936-heitor_vieira
*/

module f7 ( output s, input[3:0] a, input[3:0] b, input select);
    wire sa,sa1,sa2, sa3, sb, sb1, sb2, sb3, a1, a2;
    
    xor XOR1(sa, a[3], b[3]);
    xor XOR2(sa1, a[2], b[2]);
    xor XOR3(sa2, a[1], b[1]);
    xor XOR4(sa3, a[0], b[0]);

    xnor XNOR1(sb, a[3], b[3]);
    xnor XNOR2(sb1, a[2], b[2]);
    xnor XNOR3(sb2, a[1], b[1]);
    xnor XNOR4(sb3, a[0], b[0]);
    
    or OR1 ( a1, sa, sa1, sa2, sa3);
    and AND1 ( a2, sb, sb1, sb2, sb3 );

    mux MUX1(s, a1, a2, select);
endmodule

module mux ( output s, input a, input b, input select );
    wire not_select;
    wire sa, sb;
    not NOT1 ( not_select, select );
    
    and AND1 ( sa, a, not_select ); // 0
    and AND2 ( sb, b, select );     // 1

    or OR1 ( s, sa, sb);
endmodule // mux

module Guia_0706;
    reg[3:0] x;
    reg[3:0] y;
    reg s;
    wire w;
    integer i;

    f7 modulo ( w, x, y, s);

    initial begin : main
        $display("================================");
        $display("|  x  |  y  |   s   |  w  |");
        $display("|-----|-----|-------|-----|");
        
        for (i = 0; i < 512; i = i + 1) begin
            {x, y, s} = i;
            #1;
            $display("|  %b  |  %b  |  %b  |  %b  |", x, y, s, w);
        end
    end // main
endmodule
