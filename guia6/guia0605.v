/*
Guia_0605.v
867936-heitor_vieira
*/

module normalFunction ( output s, input a, input b, input c );
    assign s = (~(~a|~b) & ~(a&b)) | ~((b&c) | ~a);
endmodule

module minimizedFunctionA ( output s, input a, input b , input c ); 
    assign s = (a&~b) | (a&~c);  
endmodule

module Guia_0605;
    reg x, y, z;
    wire a,f;
    integer i;

    normalFunction normalFunction(a,x,y,z);
    minimizedFunctionA minimizedFunctionA(f,x,y,z);

    initial begin : main
        $display ( "Atividade 5 resultado" );

        $display(" m  | x y z | ( ~x | ~y ) | ( ~x | ~y ) - NAND");
        $display("-----------------------------------");
        
        for (i = 0; i < 8; i = i + 1) begin
            {x, y, z} = i;
            #1;
            $display(" %1d | %b %b %b | %b |  %b    |", i, x, y, z, a, f);
        end
    end // main
endmodule

