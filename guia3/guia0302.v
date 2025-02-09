/*
Guia_0302.v
867936-heitor_vieira
*/
module Guia_0302;
    reg[5:0] a = 6'b011011; // 123 quartenary
    reg[7:0] b = 8'hc4;
    reg[5:0] c = 6'b110110; // 312 quartenary
    reg[5:0] cb = 0;
    reg[8:0] d = 9'o153;
    reg[9:0] db = 0;
    reg[7:0] e = 8'h7d;
    reg[7:0] eb = 0;
    initial begin : main
        $display ( "Atividade 2 resultado" );
        $display ( "a = %d %d %d -> c1,6(a) = %6b" , a[5:4], a[3:2], a[1:0], ~a );
        
        $display ( "b = %x -> c1,8(b) = %8b" , b, ~b  );

        cb = ~c+1;
        $display ( "c = %d %d %d -> C1,6(c) = %6b -> C2,6(c) = %6b", c[5:4], c[3:2], c[1:0], ~c, cb );

        db = ~d+1;
        $display ( "d = %o -> C1,10(d) = %10b -> C2,10(d) = %10b", d, ~d, db );

        eb = ~e+1;
        $display ( "e = %x -> C1,8(e) = %8b -> C2,8(e) = %8b", e, ~e, eb );
    end // main
endmodule
