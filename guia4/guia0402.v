/*
Guia_0402.v
867936-heitor_vieira
*/
module Guia_0402;
    reg x, y;
    wire a, b, c, d, e;
    wire ao, bo, co, do, eo;

    assign a = ~x & ~(x | y);
    assign ao = ~x & ~y;

    assign b = (x | ~y) | (~x & ~y);
    assign bo = x | ~y;

    assign c = ~(x & ~y) & (x | y);
    assign co = y;

    assign d = ~(x & ~y) | ~(x | ~y);
    assign do = ~x | y;

    assign e = (y | ~x) & ~(~y | x);
    assign eo = y & ~x;

    initial begin : main
        $display ( "Atividade 2 resultado" );
        $display ( "Letra a)" );
        $display(" x y | x' . (x + y)' | x' . y'");
        $display("-----------------------------------");
        
        for (integer i = 0; i < 4; i = i + 1) begin
            {x, y} = i;
            #1;
            $display(" %b %b |     %b       |     %b       |", x, y, a, ao);
        end

        $display ( "Letra b)" );
        $display(" x y | (x + y') + (x'+ y') | x + y'");
        $display("-----------------------------------");
        
        for (integer i = 0; i < 4; i = i + 1) begin
            {x, y} = i;
            #1;
            $display(" %b %b |     %b       |     %b       |", x, y, b, bo);
        end

        $display ( "Letra c)" );
        $display(" x y | (x . y')'. (x + t) | y");
        $display("-----------------------------------");
        
        for (integer i = 0; i < 4; i = i + 1) begin
            {x, y} = i;
            #1;
            $display(" %b %b |     %b       |     %b       |", x, y, c, co);
        end

        $display ( "Letra d)" );
        $display(" x y | (x.y') + (x+y')' | x' + y");
        $display("-----------------------------------");
        
        for (integer i = 0; i < 4; i = i + 1) begin
            {x, y} = i;
            #1;
            $display(" %b %b |     %b       |     %b       |", x, y, d, do);
        end

        $display ( "Letra e)" );
        $display(" x y | (y+x') . (y'+x)' | y . x'");
        $display("-----------------------------------");
        
        for (integer i = 0; i < 4; i = i + 1) begin
            {x, y} = i;
            #1;
            $display(" %b %b |     %b       |     %b       |", x, y, e, eo);
        end
    end // main
endmodule

