module Guia_0205;
    reg[5:0] a = 6'b101_010;
    reg[5:0] ab = 6'b010_011;
    reg[5:0] ar;

    reg[6:0] b = 7'b1000_001;
    reg[4:0] bb = 5'b10_010;
    reg[6:0] br;

    reg[5:0] c = 6'b101_110;
    reg[5:0] cb = 6'b010_001;
    reg[9:0] cr;

    reg[7:0] d = 8'b10110_010;
    reg[4:0] db = 5'b11_011;
    reg[4:0] dr;

    reg[6:0] e = 7'b1101101;
    reg[3:0] eb = 4'b1011;
    reg[3:0] er;

    initial begin : main
        ar = a + ab;
        br = b - bb;
        cr = c * cb;
        dr = d / db;
        er = e % eb;
        
        $display ( "Atividade 5 resultado" );

        $display ( "a) %b.%b + %b.%b = %b.%b (2)", a[5:3], a[2:0], ab[5:3], a[2:0], ar[5:3], ar[2:0] );
        $display ( "b) %b.%b - %b.%b = %b.%b (2)", b[6:3], b[2:0], bb[4:3], bb[2:0], br[6:3], br[2:0] );
        $display ( "c) %b.%b * %b.%b = %b.%b (2)", c[5:3], b[2:0], cb[5:3], cb[2:0], cr[9:6], cr[5:0] );

        $display ( "d) %b.%b / %b.%b = %b (2)", d[7:3], d[2:0], db[4:3], db[2:0], dr);
        $display ( "e) %b %% %b = %b (2)", e, eb, er );
    end
endmodule;