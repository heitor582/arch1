/*
Guia_0704.v
867936-heitor_vieira
*/

module f7 ( output s, input a, input b, input select, input select2);
    wire sao, sbo, saa, sba, s1,s2;
    
    or OR1 (sao, a, b);
    nor NOR1 (sbo, a, b);
    mux MUX1(s1, sao, sbo, select);

    and AND1 (saa, a, b);
    nand NAND1 (sba, a, b);
    mux MUX2(s2, saa, sba, select);

    mux MUX3(s, s1, s2, select2);
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

module Guia_0704;
    reg x;
    reg y;
    reg s;
    reg s2;
    wire w;
    integer i;

    f7 modulo ( w, x, y, s, s2);

    initial begin : main
        $display("================================");
        $display("|  x  |  y  |  s  |  s2 |  w  |");
        $display("|-----|-----|-----|-----|-----|");
        
        for (i = 0; i < 16; i = i + 1) begin
            {x, y, s, s2} = i;
            #1;
            $display("|  %b  |  %b  |  %b  |  %b  |  %b  |", x, y, s, s2, w);
        end
    end // main
endmodule
