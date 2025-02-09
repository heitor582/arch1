/*
Guia_0304.v
867936-heitor_vieira
*/
module Guia_0304;
    reg signed[4:0] a = 5'b11101;
    reg signed[3:0] ab = 4'b1101;
    reg signed[3:0] abc2 = 0;
    reg signed[4:0] ar = 0;

    reg signed[6:0] b = 7'b101_1001;
    reg signed[3:0] bb = 4'b10_01;
    reg signed[3:0] bbc2 = 0;
    reg signed[7:0] br = 0;

    reg signed[5:0] c = 6'b111001; // 321 quartenary
    reg signed[5:0] cb = 6'b100111; // 213 quartenary
    reg signed[5:0] cbc2 = 0;
    reg signed[5:0] cr = 0;

    reg signed[8:0] d = 9'o354;
    reg signed[8:0] db = 9'o265;
    reg signed[8:0] dbc2 = 0;
    reg signed[8:0] dr = 0;
    
    reg signed[11:0] e = 12'h6a2;
    reg signed[11:0] eb = 12'hc14;
    reg signed[11:0] ebc2 = 0;
    reg signed[11:0] er = 0;

    initial begin : main
        $display ( "Atividade 4 resultado" );
        
        abc2 = (~ab)+1;
        ar = a+abc2;
        $display ( " a) %b - %b -> c2(%b) = c2(%b)" , a, ab, abc2, ar );
        
        bbc2 = (~bb)+1;
        br = b+bbc2;
        $display ( " b) %b.%b - %b.%b -> c2(%b.%b) = c2(%b)" , b[6:4], b[3:0], bb[3:2], bb[1:0], bbc2[3:2], bbc2[1:0], br );

        cbc2 = (~cb)+1;
        cr = c+cbc2;
        $display ( " c) %b - %b -> c2(%b) = c2(%2b) = %d %d %d" , c, cb, cbc2, cr, cr[5:4], cr[3:2], cr[1:0] );

        dbc2 = (~db)+1;
        dr = d+dbc2;
        $display ( " d) %o - %o -> c2(%b) = c2(%b) = %o" , d, db, dbc2, dr, dr );

        ebc2 = (~eb)+1;
        er = e+ebc2;
        $display ( " e) %x - %x -> c2(%b) = c2(%b) = %x" , e, eb, ebc2, er, er );
    end // main
endmodule
