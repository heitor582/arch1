/*
Guia_0704.v
867936-heitor_vieira
*/

module f7 ( output s, input a, input b, input[1:0] select);
    wire sa, sb, sc, sd;
    
    xnor XNOR1 (sa, a, b);
    xor XOR1(sb, a, b);
    or OR1 (sc, a, b);
    nor NOR1 (sd, a, b);

    mux MUX1(s, sa, sb, sc, sd, select);
endmodule

module mux ( output s, input a, input b, input c, input d, input[1:0] select );
    wire not_select, not_select2;
    wire sa, sb, sc, sd;
    not NOT1 ( not_select, select[0] );
    not NOT2 ( not_select2, select[1] );
    
    and AND1 ( sa, a, not_select2, not_select ); // 00
    and AND2 ( sb, b, not_select2, select[0] );  // 01
    and AND3 ( sc, c, select[1], not_select );   // 10
    and AND4 ( sd, d, select[1], select[0] );    // 11
    or OR1 ( s , sa, sb, sc, sd );
endmodule // mux

module Guia_0704;
    reg x;
    reg y;
    reg[1:0] s;
    wire w;
    integer i;

    f7 modulo ( w, x, y, s);

    initial begin : main
        $display("================================");
        $display("|  x  |  y  |  s   |  w  |");
        $display("|-----|-----|------|-----|");
        
        for (i = 0; i < 16; i = i + 1) begin
            {x, y, s} = i;
            #1;
            $display("|  %b  |  %b  |  %b  |  %b  |", x, y, s, w);
        end
    end // main
endmodule
