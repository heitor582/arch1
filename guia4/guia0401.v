/*
Guia_0401.v
867936-heitor_vieira
*/
module Guia_0401;
    reg x, y, z;
    wire a, b, c, d, e;

    assign a = ~x & ~(y | ~z);
    assign b = ~(~x | y) & z;
    assign c = ~(~x & ~y) & ~z;
    assign d = ~(x & ~y) & z;
    assign e = (~x | ~y) & ~(y | ~z);

    initial begin : main
        $display ( "Atividade 1 resultado" );

        $display(" x y z | x' & (y+z')' | (x'+y)' & z | (x'&y')'& z' | (x&y')' & z | (x' + y') & (y+z')'");
        $display("--------------------------------------------------------------------------------------");
        
        for (integer i = 0; i < 8; i = i + 1) begin
            {x, y, z} = i;  // Atribui as combinações de x, y, z
            #1;
            $display(" %b %b %b |     %b       |     %b       |      %b        |     %b      |        %b        ", x, y, z, a, b, c, d, e);
        end
    end // main
endmodule

