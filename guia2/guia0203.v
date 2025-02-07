/*
Guia_0203.v
867936-heitor_vieira
*/

module Guia_0203;
    reg[7:0] a = 8'b01101000;
    reg[7:0] b = 8'b10001100;
    reg[7:0] c = 8'b10010100;

    reg[7:0] di = 8'b1; // d integer part
    reg[7:0] df = 8'b11100100; // d fractional part

    reg[7:0] ei = 8'b1011; // e integer part
    reg[7:0] ef = 8'b11010000; // e fractional part
    initial begin : main
        $display ( "Atividade 3 resultado" );

        $display ( "a) 0.%b = 0.%d%d%d%d (4)", a, a[7:6],a[5:4], a[3:2], a[1:0] );
        $display ( "b) 0.%b = 0.%o%o%o (8) ", b, b[7:5],b[4:2],b[1:0] );
        $display ( "c) 0.%b = 0.%x%x (16) ", c, c[7:4],c[3:0] );

        $display ( "d) %b.%b = %o%o%o.%o%o%o (8) ", di, df, di[7:5],di[4:2],di[1:0], df[7:5],df[4:2],df[1:0] );
        $display ( "e) %b.%b = %x%x.%x%x (16) ", ei, ef, ei[7:4],ei[3:0], ef[7:4],ef[3:0] );
    end
endmodule