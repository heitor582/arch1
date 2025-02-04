/*
Guia_0101.v
867936-heitor_vieira
*/
module Guia_0101;
    integer a = 27;
    integer b = 51;
    integer c = 725;
    integer d = 132;
    integer e = 360;
    reg [9:0] bi = 0;
    initial
        begin : main
            $display ( "Atividade 1 resultado" );
            $display ( "a = %d" , a );
            bi = a;
            $display ( "binary = %b", bi );
            
            $display ( "b = %d" , b );
            bi = b;
            $display ( "binary = %b", bi );
            
            $display ( "c = %d" , c );
            bi = c;
            $display ( "binary = %b", bi );
            
            $display ( "d = %d" , d );
            bi = d;
            $display ( "binary = %b", bi );
            
            $display ( "e = %d" , e );
            bi = e;
            $display ( "binary = %b", bi );
        end // main
endmodule
