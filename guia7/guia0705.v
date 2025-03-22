/*
Guia_0705.v
867936-heitor_vieira
*/

module f7 ( output s, input a, input b, input[2:0] select);
    wire sa, sb, sc, sd, se, sf, sg, sh;
    
    not NOT1(sa, a);
    and AND1(sb, a, b);
    nand NAND1(sc, a, b);
    or OR1(sd, a, b);
    nor NOR1(se, a, b);
    xor XOR1(sf, a, b);
    xnor XNOR1(sg, a, b);
    not NOT2(sh, b);

    mux MUX1(s, sa, sb, sc, sd, se, sf, sg, sh, select);
endmodule

module mux ( output s, input a, input b, input c, input d, input e, input f, input g, input h, input[2:0] select );
    wire not_select, not_select2, not_select3;
    wire sa, sb, sc, sd, se, sf, sg, sh;
    not NOT1 ( not_select, select[0] );
    not NOT2 ( not_select2, select[1] );
    not NOT3 ( not_select3, select[2] );
    
    and AND1 ( sa, a, not_select3, not_select2, not_select ); // 000
    and AND2 ( sb, b, not_select3, not_select2, select[0] );  // 001
    and AND3 ( sc, c, not_select3, select[1], not_select );   // 010
    and AND4 ( sd, d, not_select3, select[1], select[0] );    // 011
    and AND5 ( se, e, select[2], not_select2, not_select );   // 100
    and AND6 ( sf, f, select[2], not_select2, select[0] );    // 101
    and AND7 ( sg, g, select[2], select[1], not_select );     // 110
    and AND8 ( sh, h, select[2], select[1], select[0] );      // 111

    or OR1 ( s, sa, sb, sc, sd, se, sf, sg, sh);
endmodule // mux

module Guia_0705;
    reg x;
    reg y;
    reg[2:0] s;
    wire w;
    integer i;

    f7 modulo ( w, x, y, s);

    initial begin : main
        $display("================================");
        $display("|  x  |  y  |   s   |  w  |");
        $display("|-----|-----|-------|-----|");
        
        for (i = 0; i < 32; i = i + 1) begin
            {x, y, s} = i;
            #1;
            $display("|  %b  |  %b  |  %b  |  %b  |", x, y, s, w);
        end
    end // main
endmodule
