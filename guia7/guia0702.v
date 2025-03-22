/*
Guia_0702.v
867936-heitor_vieira
*/

module f7 ( output s, input a, input b, input select);
    wire sa, sb;
    or OR1 (sa, a, b);
    nor NOR1 (sb, a, b);
    mux MUX1(s, sa, sb, select);
endmodule

module mux ( output s, input a, input b, input select );
    wire not_select;
    wire sa;
    wire sb;
    not NOT1 ( not_select, select );
    and AND1 ( sa, a, not_select );
    and AND2 ( sb, b, select );
    or OR1 ( s , sa, sb );
endmodule // mux

module Guia_0702;
    reg x;
    reg y;
    reg s;
    wire w;
    integer i;

    f7 modulo ( w, x, y, s);

    initial begin : main
        $display("================================");
        $display("|  x  |  y  |  s  |  w  |");
        $display("|-----|-----|-----|-----|");
        
        for (i = 0; i < 8; i = i + 1) begin
            {x, y, s} = i;
            #1;
            $display("|  %b  |  %b  |  %b  |  %b  |", x, y, s, w);
        end
    end // main
endmodule
