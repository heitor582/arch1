/*
Guia_0505.v
867936-heitor_vieira
*/

module normalFunction ( output s, input a, input b );
    assign s = (a ^ b);// ((a&b) || (a|b)')'
endmodule

module functionOnlyNor ( output s, input a, input b );
    wire AND_1, NOT_1, NOT_2, nor_4;
    nor NOR_1 (NOT_1, a, a);  
    nor NOR_2 (NOT_2, b, b); 

    nor NOR_3 (AND_1, NOT_1, NOT_2);

    nor NOR_4 (nor_4, a, b);
    nor NOR_5(s, AND_1, nor_4);
endmodule

module Guia_0505;
    reg x, y;
    wire a,f;
    integer i;

    normalFunction normalFunction(a,x,y);
    functionOnlyNor functionOnlyNor(f,x,y);

    initial begin : main
        $display ( "Atividade 5 resultado" );

        $display(" m  | x y | (x ^ y)  | (x ^ y) - NOR |");
        $display("-----------------------------------");
        
        for (i = 0; i < 4; i = i + 1) begin
            {x, y} = i;
            #1;
            $display(" %1d | %b %b | %b |  %b    |", i, x, y, a, f);
        end
    end // main
endmodule

