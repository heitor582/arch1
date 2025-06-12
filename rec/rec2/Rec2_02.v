/*
Rec2_02.v
867936-heitor_vieira
*/

module Rec2_02;
    reg x, y, w;
    wire a, b, c;

    assign b = (~x&~w) | (x&~y);
    assign c = (x|~w) & (~x|~y);

    initial begin : main
        $display ( "Atividade 2 resultado" );
        $display ( "Letra b)" );
        $display("m  | x y w | SoP(0,2,4,5)|");
        $display("-----------------------------------");
        
        for (integer i = 0; i < 8; i = i + 1) begin
            {x, y, w} = i;
            #1;
            $display(" %1d | %b %b %b |     %b    |", i, x,y,w, b);
        end

        $display ( "Letra c)" );
        $display("m  | x y w | PoS(1,3,6,7)");
        $display("-----------------------------------");
        
        for (integer i = 0; i < 8; i = i + 1) begin
            {x, y, w} = i;
            #1;
            $display(" %1d | %b %b %b |     %b   |", i, x,y,w, c);
        end
    end // main
endmodule

