/*
Rec_0102.v
867936-heitor_vieira
*/

module mux ( output s, input a, input b, input select );
    assign s = (a & ~select) | (b & select);
endmodule // mux

//mux(not(b), b, a)
module letterA ( output s, input a, input b);
    mux MUX1(s, ~b, b, a);
endmodule


//nand(nand(nand(a,a),b), nand(c,nand(b,b))))
module letterB ( output s, input a, input b, input c);
    assign s = ~(~(~(a&a) & b) & ~(c&(~(b&b))));
endmodule

module Rec_0102;
    reg a,b,c;
    wire ar, br;
    integer i;

    letterA letterA(ar,a,b);
    letterB letterB(br,a,b,c);

    initial begin : main
        $display ( "Atividade 2 resultado" );

        $display ( "A)" );
        $display("-----------------------------------");
        
        for (i = 0; i < 4; i = i + 1) begin
            {a,b} = i;
            #1;
            $display(" %1d | %b %b | %b", i, a,b, ar);
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

