/*
Rec_0104.v
867936-heitor_vieira
*/

//(a'+b.c)'
module letterA ( output s, input a, input b, input c);
    assign s = ~(~a|b&c);
endmodule

module letterB ( output s, input a, input b, input c);
    assign s = ~(~(~(b&c)&a)&~(~(b&c)&a));
endmodule

module Rec_0104;
    reg a,b,c;
    wire ar, br;
    integer i;

    letterA letterA(ar,a,b,c);
    letterB letterB(br,a,b,c);

    initial begin : main
        $display ( "Atividade 2 resultado" );

        $display ( "A)" );
        $display("-----------------------------------");
        
        for (i = 0; i < 8; i = i + 1) begin
            {a,b,c} = i;
            #1;
            $display(" %1d | %b %b %b | %b", i, a,b,c, ar);
        end

        $display ( "B)" );
        $display("-----------------------------------");
        
        for (i = 0; i < 8; i = i + 1) begin
            {a,b,c} = i;
            #1;
            $display(" %1d | %b %b %b | %b", i, a,b,c, br);
        end
    end // main
endmodule

