/*
Guia_0405.v
867936-heitor_vieira
*/

module Guia_0405;
    reg x, y,w,z;
    wire a, b, c, d, e,ab,bb,cb,db,eb;

    assign a = ~x & y;
    assign ab = (x|y) & (~x|y) & (~x|~y);

    assign b = ~x&~y | x&~y;
    assign bb = (x|~y) & (~x|~y);

    assign c = ~x&~y&~z | ~x&y&~z | ~x&y&z | x&~y&~z | x&y&~z | x&y&z;
    assign cb = (x|y|~z) & (~x|y|~z);

    assign d = ~x&~y&~z | ~x&y&~z | x&~y&~z | x&~y&z;
    assign db = (x|y|~z) & (x|~y|~z) & (~x|~y|z) & (~x|~y|~z);

    assign e = ~x&~y&~w&~z | ~x&~y&w&z | ~x&y&~w&z | ~x&y&w&~z | x&~y&~w&~z | x&~y&w&~z | x&y&~w&~z | x&y&w&~z | x&y&w&z;
    assign eb = (x | y | w | ~z) & (x | y | ~w | z) & (x | ~y | w | z) & (x | ~y | ~w | ~z) & (~x | y | w | ~z) & (~x | y | ~w | z) & (~x | ~y | w | ~z);
    
    initial begin : main
        $display ( "Atividade 5 resultado" );
        $display ( "Letra a)" );
        $display("m  | x y | SoP (1)| PoS (0,3,4)");
        $display("-----------------------------------");
        
        for (integer i = 0; i < 4; i = i + 1) begin
            {x, y} = i;
            #1;
            $display(" %1d | %b %b |     %b    | %b  |", i, x,y, a,ab);
        end

        $display ( "Letra b)" );
        $display("m  | x y | SoP (0,2)| PoS (1,4)");
        $display("-----------------------------------");
        
        for (integer i = 0; i < 4; i = i + 1) begin
            {x, y} = i;
            #1;
            $display(" %1d | %b %b |     %b   | %b  |", i, x,y, b,bb);
        end

        $display ( "Letra c)" );
        $display("m  | x y z | SoP (0,2,3,4,6,7)| PoS (1,5)");
        $display("-----------------------------------");
        
        for (integer i = 0; i < 8; i = i + 1) begin
            {x, y, z} = i;
            #1;
            $display(" %1d | %b %b %b |     %b   | %b  |",i,  x, y, z, c,cb);
        end

        $display ( "Letra d)" );
        $display("m  | x y z | SoP (0,2,4,5)| PoS (1,3,6,7)");
        $display("-----------------------------------");
        
        for (integer i = 0; i < 8; i = i + 1) begin
            {x, y, z} = i;
            #1;
            $display(" %1d | %b %b %b |     %b    | %b  |", i, x, y, z, d,db);
        end

        $display ( "Letra e)" );
        $display("m  | x y w z | SoP (0,3,5,6,8,10,12,14,15)| PoS (1,2,4,7,9,11,13)");
        $display("-----------------------------------");
        
        for (integer i = 0; i < 16; i = i + 1) begin
            {x, y, w, z} = i;
            #1;
            $display(" %1d | %b %b %b %b |     %b   | %b  |",i, x, y, w, z, e,eb);
        end
    end // main
endmodule

