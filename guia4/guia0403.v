/*
Guia_0403.v
867936-heitor_vieira
*/

module Guia_0403;
    reg x, y,w,z;
    wire a, b, c, d, e;

    assign a = (~x & ~y & z) | (~x & y & ~z) | (x & y & ~z) | (x & y & z);

    assign b = (~x & y & z) | (x & ~y & z) | (x & y & ~z) | (x & y & z);

    assign c = (~x & y & ~w & z) | (~x & ~y & ~w & z) | (~x & ~y & ~w & ~z) | (~x & ~y & w & ~z) | (~x & ~y & w & z) | (x & ~y & w & z) | (x & ~y & w & ~z);

    assign d = (~x & y & ~w & z) | (~x & ~y & ~w & z) | (~x & ~y & w & ~z) | (x & ~y & ~w & ~z) | (x & ~y & w & ~z) | (x & ~y & w & z) | (x & ~y & w & ~z);

    assign e = (~x & ~y & ~w & ~z) | (~x & ~y & ~w & z) | (~x & y & ~w & z) | (~x & y & ~w & ~z) | (~x & y & w & ~z) | (x & ~y & w & ~z);

    initial begin : main
        $display ( "Atividade 3 resultado" );
        $display ( "Letra a)" );
        $display(" x y z | SoP (1,2,6,7)");
        $display("-----------------------------------");
        
        for (integer i = 0; i < 8; i = i + 1) begin
            {x, y, z} = i;
            #1;
            $display(" %b %b %b |     %b       |", x, y, z, a);
        end

        $display ( "Letra b)" );
        $display(" x y z | SoP (3,5,6,7)");
        $display("-----------------------------------");
        
        for (integer i = 0; i < 8; i = i + 1) begin
            {x, y, z} = i;
            #1;
            $display(" %b %b %b |     %b       |", x, y, z, b);
        end

        $display ( "Letra c)" );
        $display(" x y w z | SoP (1, 2, 3, 5, 7, 13, 15)");
        $display("-----------------------------------");
        
        for (integer i = 0; i < 16; i = i + 1) begin
            {x, y, w, z} = i;
            #1;
            $display(" %b %b %b %b |     %b       |", x, y, w, z, c);
        end

        $display ( "Letra d)" );
        $display(" x y w z | SoP (1, 2, 4, 8, 10, 12, 14)");
        $display("-----------------------------------");
        
        for (integer i = 0; i < 16; i = i + 1) begin
            {x, y, w, z} = i;
            #1;
            $display(" %b %b %b %b |     %b       |", x, y, w, z, d);
        end

        $display ( "Letra e)" );
        $display(" x y w z | SoP (0, 2, 6, 7, 8, 14)");
        $display("-----------------------------------");
        
        for (integer i = 0; i < 16; i = i + 1) begin
            {x, y, w, z} = i;
            #1;
            $display(" %b %b %b %b |     %b       |",x, y, w, z, e);
        end
    end // main
endmodule

