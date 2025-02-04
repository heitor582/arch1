/*
Guia_0103.v
867936-heitor_vieira
*/
module Guia_0103;
    integer a = 54;
    integer b = 67;
    integer c = 76;
    integer d = 157;
    integer e = 731;
    reg[7:0] bin = 0;
    initial
        begin : main
            bin = a;
            $display ( "Atividade 3 resultado" );
            $display ( "a = %d%d%d%d", bin[7:6], bin[5:4], bin[3:2], bin[1:0] );
            $display ( "b = %3o", b );
            $display ( "c = %2X", c );
            $display ( "e = %2X", d );
            $display ( "e = %3X", e );
        end // main
endmodule