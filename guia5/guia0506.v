/*
Guia_0506.v
867936-heitor_vieira
*/

module normalFunction ( output s, input a, input b );
    assign s = ~(a ^ b);// AB + A'B'
endmodule

module functionOnlyNand ( output s, input a, input b );


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

