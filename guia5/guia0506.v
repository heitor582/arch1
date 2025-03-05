/*
Guia_0506.v
867936-heitor_vieira
*/

module normalFunction ( output s, input a, input b );
    assign s = ~(a ^ b);
endmodule

module functionOnlyNand ( output s, input a, input b );
    wire nand_1, nand_2, nand_3, nand_4;
    nand NAND_1 (nand_1, a, b);  
    nand NAND_2 (nand_2, nand_1, b);  
    nand NAND_3 (nand_3, a, nand_1);
    nand NAND_4 (nand_4, nand_2, nand_3);
    nand NAND_5 (s, nand_4, nand_4);
endmodule

module Guia_0506;
    reg x, y;
    wire a,f;
    integer i;

    normalFunction normalFunction(a,x,y);
    functionOnlyNand functionOnlyNand(f,x,y);

    initial begin : main
        $display ( "Atividade 6 resultado" );

        $display(" m  | x y | ~(x ^ y) | ~(x ^ y) - NAND");
        $display("-----------------------------------");
        
        for (i = 0; i < 4; i = i + 1) begin
            {x, y} = i;
            #1;
            $display(" %1d | %b %b | %b |  %b    |", i, x, y, a, f);
        end
    end // main
endmodule

