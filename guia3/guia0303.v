/*
Guia_0303.v
867936-heitor_vieira
*/
module Guia_0303;
    reg signed[4:0] a = 5'b10101;
    reg signed[5:0] b = 6'b110101;
    reg signed[5:0] c = 6'b100110;
    reg signed[5:0] cr = 0;
    reg signed[6:0] d = 7'b1010111;
    reg signed[6:0] dr = 0;
    reg signed[7:0] e = 8'b11110101;
    reg signed[7:0] er = 0;
    initial
        begin : main
            $display ( "Atividade 2 resultado" );
            
            $display ( "c2(a) = %b -> (a)_(10) = %2d" , a, ~(a-1) );
            
            $display ( "c2(b) = %b -> (b)_(10) = %2d" , b, ~(b-1)  );

            cr = ~(c-1);
            $display ( "c2(c) = %b -> (c)_(2) = %5b", c, cr );

            dr = ~(d-1);
            $display ( "c2(d) = %b -> (d)_(2) = %7b", d, dr );

            er = ~(e-1);
            $display ( "c2(e) = %b -> (e)_(16) = %1x", e, er );
        end // main
endmodule
