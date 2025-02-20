/*
Guia_0404.v
867936-heitor_vieira
*/

module Guia_0404;
    reg x, y,w,z;
    wire a, b, c, d, e;

    assign a = (x | y | ~z) & (x | ~y | ~z) & (~x | ~y | z) & (~x | ~y | ~z);

    assign b = (x | y | z) & (x | ~y | z) & (~x | ~y | z) & (~x | ~y | ~z);

    assign c = (x | y | w | z) & (x | y | w | ~z) & (x | y | ~w | z) & (x | ~y | w | ~z) & (x | ~y | ~w | z) & (x | ~y | ~w | ~z) & (~x | y | ~w | ~z) & (~x | ~y | w | ~z);

    assign d = (x | y | w | ~z) & (x | y | ~w | z) & (x | ~y | w | z) & (x | ~y | ~w | z) & (~x | y | w | z) & (~x | y | w | ~z) & (~x | ~y | ~w | z);

    assign e = (x | y | w | z) & (x | y | w | ~z) & (x | y | ~w | z) & (x | ~y | w | z) & (x | ~y | w | ~z) & (~x | y | ~w | ~z) & (~x | ~y | ~w | ~z);
    
    initial begin : main
        $display ( "Atividade 4 resultado" );
        $display ( "Letra a)" );
        $display("M  | x y z | Pos (1,3,6,7)");
        $display("-----------------------------------");
        
        for (integer i = 0; i < 8; i = i + 1) begin
            {x, y, z} = i;
            #1;
            $display(" %1d | %b %b %b |     %b       |", i, x, y, z, a);
        end

        $display ( "Letra b)" );
        $display("M  | x y z | Pos (0,2,6,7)");
        $display("-----------------------------------");
        
        for (integer i = 0; i < 8; i = i + 1) begin
            {x, y, z} = i;
            #1;
            $display(" %1d | %b %b %b |     %b       |", i, x, y, z, b);
        end

        $display ( "Letra c)" );
        $display("M  | x y w z | Pos (0,1,2,5,6,7,11,13)");
        $display("-----------------------------------");
        
        for (integer i = 0; i < 16; i = i + 1) begin
            {x, y, w, z} = i;
            #1;
            $display(" %1d | %b %b %b %b |     %b       |",i,  x, y, w, z, c);
        end

        $display ( "Letra d)" );
        $display("M  | x y w z | Pos (1,2,4,6,8,9,14)");
        $display("-----------------------------------");
        
        for (integer i = 0; i < 16; i = i + 1) begin
            {x, y, w, z} = i;
            #1;
            $display(" %1d | %b %b %b %b |     %b       |", i, x, y, w, z, d);
        end

        $display ( "Letra e)" );
        $display("M  | x y w z | Pos (0,1,2,4,5,11,15)");
        $display("-----------------------------------");
        
        for (integer i = 0; i < 16; i = i + 1) begin
            {x, y, w, z} = i;
            #1;
            $display(" %1d | %b %b %b %b |     %b       |",i, x, y, w, z, e);
        end
    end // main
endmodule

