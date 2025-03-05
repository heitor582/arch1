/*
Guia_0502.v
867936-heitor_vieira
*/

module normalFunction ( output s, input a, input b );
    assign s = (~a | b); // (a & b')' de morgan
endmodule

module functionOnlyNand ( output s, input a, input b );
    wire NOT_1;
    nand NAND_1 (NOT_1, b, b);  
    nand NAND_2 (s, a, NOT_1);  
endmodule

module Guia_0502;
    reg x, y;
    wire a,f;
    integer i;

    normalFunction normalFunction(a,x,y);
    functionOnlyNand functionOnlyNand(f,x,y);

    initial begin : main
        $display ( "Atividade 2 resultado" );

        $display(" m  | x y | (~x | y) | (~x | y) - NAND");
        $display("-----------------------------------");
        
        for (i = 0; i < 4; i = i + 1) begin
            {x, y} = i;
            #1;
            $display(" %1d | %b %b | %b |  %b    |", i, x, y, a, f);
        end
    end // main
endmodule

