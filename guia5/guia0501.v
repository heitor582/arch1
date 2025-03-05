/*
Guia_0501.v
867936-heitor_vieira
*/

module normalFunction ( output s, input a, input b );
    assign s = (a & ~b); // (a' | b)' de morgan
endmodule

module functionOnlyNor ( output s, input a, input b );
    wire NOT_1;
    nor NOR_1 (NOT_1, a, a);  
    nor NOR_2 (s, NOT_1, b);  
endmodule

module Guia_0501;
    reg x, y;
    wire a,f;
    integer i;

    normalFunction normalFunction(a,x,y);
    functionOnlyNor functionOnlyNor(f,x,y);

    initial begin : main
        $display ( "Atividade 1 resultado" );

        $display(" m  | x y | (x & ~y) | (x & ~y) - NOR |");
        $display("-----------------------------------");
        
        for (i = 0; i < 4; i = i + 1) begin
            {x, y} = i;
            #1;
            $display(" %1d | %b %b | %b |  %b    |", i, x, y, a, f);
        end
    end // main
endmodule

