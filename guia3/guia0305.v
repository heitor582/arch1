/*
Guia_0305.v
867936-heitor_vieira
*/
module Guia_0305;
    reg signed[7:0] a = 8'b110110;
    reg signed[7:0] ab = 8'b1101;
    reg signed[7:0] abc2 = 0;
    reg signed[7:0] ar = 0;

    reg signed[7:0] b = 8'b101_1011;
    reg signed[7:0] bb = 8'o3_4;
    reg signed[7:0] bbc2 = 0;
    reg signed[7:0] br = 0;

    reg signed[7:0] c = 8'b101101; // 231 quartenary
    reg signed[7:0] cb = 8'h3a;
    reg signed[7:0] cbc2 = 0;
    reg signed[7:0] cr = 0;

    reg signed[7:0] d = 8'hd3;
    reg signed[7:0] db = 8'b1011101;
    reg signed[7:0] dbc2 = 0;
    reg signed[7:0] dr = 0;
    
    reg signed[7:0] e = 8'h5e;
    reg signed[7:0] eb = 8'h3c;
    reg signed[7:0] ebc2 = 0;
    reg signed[7:0] er = 0;  

    initial begin : main
        $display ( "Atividade 5 resultado" );
        
        abc2 = (~ab)+1;
        ar = a+abc2;
        $display ( " a) %b - %b -> c2(%b) = c2(%b)" , a, ab, abc2, ar );
        
        bbc2 = (~bb)+1;
        br = b+bbc2;
        $display ( " b) %b.%b - %o.%o -> c2(%b.%b) = c2(%b)" , b[7:4], b[3:0], bb[7:3], bb[2:0], bbc2[7:3], bbc2[2:0], br );

        cbc2 = (~cb)+1;
        cr = c+cbc2;
        $display ( " c) %b - %b -> c2(%b) = c2(%2b)" , c, cb, cbc2, cr );

        dbc2 = (~db)+1;
        dr = d+dbc2;
        $display ( " d) %x - %b -> c2(%b) = c2(%b)" , d, db, dbc2, dr );

        ebc2 = (~eb)+1;
        er = e+ebc2;
        $display ( " e) %x - %x -> c2(%b) = c2(%b)" , e, eb, ebc2, er );
    end // main
endmodule
