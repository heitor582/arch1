/*
Guia_0507.v
867936-heitor_vieira
*/

module normalFunction ( output s, input a, input b );
    assign s = ~( ~a ^ ~b );
endmodule

module functionOnlyNor ( output s, input a, input b );
    wire NOT_1, NOT_2, AND_1, AND_2, XNOR_1;
    nor NOR_1 (NOT_1, a, a);  
    nor NOR_2 (NOT_2, b, b); 

    nor NOR_3 (AND_1, a, NOT_2);
    nor NOR_4 (AND_2, NOT_1, b);

    nor NOR_5 (XNOR_1, AND_1, AND_2); 
    nor NOR_6 (s, XNOR_1, XNOR_1); 
endmodule

module Guia_0507;
    reg x, y;
    wire a,f;
    integer i;

    normalFunction normalFunction(a,x,y);
    functionOnlyNor functionOnlyNor(f,x,y);

    initial begin : main
        $display ( "Atividade 7 resultado" );

        $display(" m  | x y | ~( ~x ^ ~b )  | ~( ~x ^ ~b ) - NOR |");
        $display("-----------------------------------");
        
        for (i = 0; i < 4; i = i + 1) begin
            {x, y} = i;
            #1;
            $display(" %1d | %b %b | %b |  %b    |", i, x, y, a, f);
        end
    end // main
endmodule

