/*
Guia_0105.v
867936-heitor_vieira
*/
module Guia_0105;
    reg[0:8][7:0] a = "PUC-Minas";
    reg[0:6][7:0] b = "2025-01";
    reg[0:20][7:0] c = "Belo Horizonte - M.G.";
    reg[0:4][7:0] d = { 8'o156, 8'o157, 8'o151, 8'o164, 8'o145 };
    reg[0:4][7:0] e = { 8'h4D, 8'h61, 8'h6E, 8'h68, 8'h61 };
    initial
        begin : main
            $display ( "Atividade 5 resultado" );
            $display ( "a = %X", a );
            $display ( "b = %X", b );
            $display ( "c = %b", c );
            $display ( "d = %s", d );
            $display ( "e = %s", e );
        end // main
endmodule