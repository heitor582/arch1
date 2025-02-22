/*
Guia_0406.v
867936-heitor_vieira
*/

module Guia_0406;
    reg x, y,z;
    wire a,f;

    assign a = ~x&~y&~z | ~x&~y&z | ~x&y&z | x&~y&z | x&y&~z | x&y&z;
    assign f = ( ~x | y | z ) & ( x | ~y | z);
    initial begin : main
        $display ( "Atividade 6 resultado" );

        $display("m  | x y z | F |  SoP (0,1,3,5,6,7)");
        $display("-----------------------------------");
        
        for (integer i = 0; i < 8; i = i + 1) begin
            {x, y, z} = i;
            #1;
            $display(" %1d | %b %b %b | %b |  %b    |", i, x, y, z, f, a);
        end
    end // main
endmodule