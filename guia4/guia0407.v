/*
Guia_0407.v
867936-heitor_vieira
*/

module Guia_0407;
    reg x, y,z;
    wire a,f;

    assign a = (x|y|z) & (x|~y|z) & (x|~y|~z) & (~x|y|z) & (~x|~y|z) & (~x|~y|~z);
    assign f = ( ~x & ~y & z ) | ( x & ~y & z);
    initial begin : main
        $display ( "Atividade 7 resultado" );

        $display("m  | x y z | F |  PoS (0,2,3,4,6,7)");
        $display("-----------------------------------");
        
        for (integer i = 0; i < 8; i = i + 1) begin
            {x, y, z} = i;
            #1;
            $display(" %1d | %b %b %b | %b |  %b    |", i, x, y, z, f, a);
        end
    end // main
endmodule

