/*
Guia_0606.v
867936-heitor_vieira
*/

module normalFunction ( output s, input X, input Y, input W, input Z );
    assign s = (~(~X | ~Y | W) & ~(X&Y&~W)) | ~((Y&W&Z) | ~X);
endmodule

module minimizedFunctionA ( output s, input X, input Y, input W, input Z ); 
    assign s = X & (~Y|~W|~Z);  
endmodule

module Guia_0606;
    reg x, y, w, z;
    wire a,f;
    integer i;

    normalFunction normalFunction(a,x,y,w,z);
    minimizedFunctionA minimizedFunctionA(f,x,y,w,z);

    initial begin : main
        $display ( "Atividade 6 resultado" );

        $display(" m  | x y w z | PoS(0,1,2,3,8,9,10,11,15) | ( ~x | ~y ) - NAND");
        $display("-----------------------------------");
        
        for (i = 0; i < 16; i = i + 1) begin
            {x, y, w, z} = i;
            #1;
            $display(" %1d | %b %b %b %b | %b |  %b    |", i, x, y, w, z, a, f);
        end
    end // main
endmodule

