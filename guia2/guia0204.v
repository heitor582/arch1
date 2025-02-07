/*
Guia_0204.v
867936-heitor_vieira
*/

module Guia_0204;
    reg[5:0] a = 6'b101101; // 231 on binary
    reg[11:0] b = 12'h5c2;
    reg[8:0] c = 9'o735;

    reg[2:0] di = 3'o6; // d integer part
    reg[11:0] df = 12'o2345; // d fractional part

    reg[3:0] ei = 4'hb; // e integer part
    reg[11:0] ef = 12'ha5e; // e fractional part
    
    initial begin : main
        $display ( "Atividade 4 resultado" );

        $display ( "a) 0.%d = 0.%b (2)", a, a );
        $display ( "b) 0.%x = 0.%d%d%d%d%d%d (4) ", b, b[11:10], b[9:8], b[7:6], b[5:4], b[3:2], b[1:0] );
        $display ( "c) 0.%o = 0.%b (2) ", c, c );

        $display ( "d) %o.%o = %d%d.%d%d%d%d%d%d (4) ", di, df, di[2:2], di[1:0] , df[11:10], df[9:8], df[7:6], df[5:4], df[3:2], df[1:0]  );
        $display ( "e) %x.%x = %d%d.%d%d%d%d%d%d (4) ", ei, ef, ei[3:2], ei[1:0] , ef[11:10], ef[9:8], ef[7:6], ef[5:4], ef[3:2], ef[1:0]  );
    end
endmodule