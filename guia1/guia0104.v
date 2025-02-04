/*
Guia_0104.v
867936-heitor_vieira
*/
module Guia_0104;
    reg[7:0] a = 8'b10110;
    reg[7:0] b = 8'b11011;
    reg[7:0] c = 8'b100100;
    reg[7:0] d = 8'b101011;
    reg[7:0] e = 8'b101100;
    initial
        begin : main
            $display ( "Atividade 4 resultado" );
            $display ( "a = %d%d%d%d", a[7:6], a[5:4], a[3:2], a[1:0] );
            $display ( "b = %d%d%d", b[7:6], b[5:3], b[2:0] );
            $display ( "c = %d%d", c[7:4], c[3:0] );
            $display ( "d = %d%d%d", d[7:6], d[5:3], d[2:0] );
            $display ( "e = %d%d%d%d", e[7:6], e[5:4], e[3:2], e[1:0] );
        end // main
endmodule