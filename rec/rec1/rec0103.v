/*
Rec_0103.v
867936-heitor_vieira
*/

//(~a&d) | (a&~b)
module letterA ( output s, input a, input b, input d);
    assign s = (~a&d) | (a&~b);
endmodule


//(a'.c'.d)+(a.b')+(b'd)
module letterB ( output s, input a, input b, input c, input d);
    assign s = (~a&~c&d)|(a&~b)|(~b&d);
endmodule

module Rec_0103;
    reg a,b,c,d;
    wire ar, br;
    integer i;

    letterA letterA(ar,a,b,d);
    letterB letterB(br,a,b,c,d);

    initial begin : main
        $display ( "Atividade 2 resultado" );

        $display ( "A)" );
        $display("-----------------------------------");
        
        for (i = 0; i < 8; i = i + 1) begin
            {a,b,d} = i;
            #1;
            $display(" %1d | %b %b %b | %b", i, a,b,c ar);
        end

        $display ( "B)" );
        $display("-----------------------------------");
        
        for (i = 0; i < 16; i = i + 1) begin
            {a,b,c,d} = i;
            #1;
            $display(" %1d | %b %b %b %b | %b", i, a,b,c,d br);
        end
    end // main
endmodule

