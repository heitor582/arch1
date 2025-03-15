/*
Guia_0608.v
867936-heitor_vieira
*/

module normalFunction ( output s, input x, input y, input w, input z );
    assign s = (~x&~y&w&~z) + (x&~y&~w&~z) + (x&y&~w&z) + (x&y&w&~z);
endmodule

module minimizedFunctionA ( output s, input a, input b, input c, input d ); 
    assign s = (a & ~b & ~c & ~d) | (a & b & ~c & d) | (a & b & c & ~d) | (~a & ~b & c & ~d);  
endmodule

module Guia_0608;
    reg x, y, w, z;
    wire a,f;
    integer i;

    normalFunction normalFunction(a,x,y,w,z);
    minimizedFunctionA minimizedFunctionA(f,x,y,w,z);

    initial begin : main
        $display ( "Atividade 8 resultado" );

        $display(" m  | x y w z | SoP(2, 8, 13, 14) | ( ~x | ~y ) - NAND");
        $display("-----------------------------------");
        
        for (i = 0; i < 16; i = i + 1) begin
            {x, y, w, z} = i;
            #1;
            $display(" %1d | %b %b %b %b | %b |  %b    |", i, x, y, w, z, a, f);
        end
    end // main
endmodule

