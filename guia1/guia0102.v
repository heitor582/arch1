/*
Guia_0102.v
867936-heitor_vieira
*/
module Guia_0102;
    integer x = 0;
    reg [7:0] a = 8'b10011;
    reg [7:0] b = 8'b10101;
    reg [7:0] c = 8'b10110;
    reg [7:0] d = 8'b110010;
    reg [7:0] e = 8'b111011;
    initial
        begin : main
            $display ( "Atividade 2 resultado" );
            x = a;
            $display ( "a = %8b", a );
            $display ( "x = %d" , x );
            
            x = b;
            $display ( "b = %8b", b );
            $display ( "x = %d" , x );
            
            x = c;
            $display ( "c = %8b", c );
            $display ( "x = %d" , x );
            
            x = d;
            $display ( "d = %8b", d );
            $display ( "x = %d" , x );
            
            x = e;
            $display ( "e = %8b", e );
            $display ( "x = %d" , x );
        end // main
endmodule
