/*
Guia_0301.v
867936-heitor_vieira
*/
module Guia_0301;
    reg[5:0] a = 6'b1011;
    reg[7:0] b = 8'b1100;
    reg[5:0] c = 6'b100011;
    reg[5:0] cb = 0;
    reg[5:0] d = 6'b101001;
    reg[6:0] db = 0;
    reg[5:0] e = 6'b111010;
    reg[7:0] eb = 0;
    initial
        begin : main
            $display ( "Atividade 1 resultado" );
            $display ( "a = %b -> c1,6(a) = %6b" , a, ~a );
            
            $display ( "b = %b -> c1,8(b) = %8b" , b, ~b  );

            cb = ~c+1;
            $display ( "c = %6b -> C1,6(c) = %6b -> C2,6(c) = %6b", c, ~c, cb );
            
            db = ~d+1;
            $display ( "d = %6b -> C1,7(d) = %7b -> C2,7(d) = %7b", d, ~d, db );
            
            eb = ~e+1;
            $display ( "e = %6b -> C1,8(e) = %8b -> C2,8(e) = %8b", e, ~e, eb );
        end // main
endmodule
