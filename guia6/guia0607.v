/*
Guia_0607.v
867936-heitor_vieira
*/

module normalFunction ( output s, input x, input y, input z );
    assign s = ( x | y | z ) & (~x | ~y | z) & (~x | ~y | z);
endmodule

module minimizedFunctionA ( output s, input x, input y, input z ); 
    assign s = ( x | y | z ) & (~x | ~y | z);  
endmodule

module Guia_0607;
    reg x, y, z;
    wire a,f;
    integer i;

    normalFunction normalFunction(a,x,y,z);
    minimizedFunctionA minimizedFunctionA(f,x,y,z);

    initial begin : main
        $display ( "Atividade 7 resultado" );

        $display(" m  | x y z | PoS(0, 6) | ( ~x | ~y ) - NAND");
        $display("-----------------------------------");
        
        for (i = 0; i < 8; i = i + 1) begin
            {x, y, z} = i;
            #1;
            $display(" %1d | %b %b %b | %b |  %b    |", i, x, y, z, a, f);
        end
    end // main
endmodule

