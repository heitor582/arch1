/*
Guia_0604.v
867936-heitor_vieira
*/

module PoSA ( output s, input a, input b, input c, input d );
    assign s = (a | b | ~c | d) & (a | ~b | c | ~d) & (a | ~b | ~c | ~d) & (~a | ~b | c | ~d);
endmodule

module minimizedFunctionA ( output s, input a, input b, input c, input d );
    assign s = (a|b|~c|d) & (a|~b|~d) & (~b|c|~d);  
endmodule

module PoSB ( output s, input a, input b, input c, input d );
    assign s = (a | ~b | c | d) & (a | ~b | ~c | d) & (~a | b | c | ~d) & (~a | b | ~c | ~d) & (~a | ~b | ~c | d);
endmodule

module minimizedFunctionB ( output s, input a, input b, input c, input d );
    assign s = (a | ~b | d) & (~b | ~c | d) & (~a | b | ~d);  
endmodule

module PoSC ( output s, input a, input b, input c, input d );
    assign s = (a | ~b | c | d) & (a | ~b | ~c | ~d) & (~a | b | c | d) & (~a | b | ~c | d) & (~a | ~b | c | d);
endmodule

module minimizedFunctionC ( output s, input a, input b, input c, input d );
    assign s = (a|~b|~c|~d) & (~b|c|d) & (~a|b|d);  
endmodule

module PoSD ( output s, input a, input b, input c, input d );
    assign s = (a | b | c | ~d) & (a | ~b | c | ~d) & (~a | b | c | ~d) & (~a | b | ~c | ~d) & (~a | ~b | c | ~d) & (~a | ~b | ~c | ~d);
endmodule

module minimizedFunctionD ( output s, input a, input b, input c, input d );
    assign s = (c|~d) & (~a|~d);  
endmodule

module PoSE ( output s, input a, input b, input c, input d );
    assign s = (a | b | ~c | d) & (a | b | ~c | ~d) & (a | ~b | ~c | d) & (a | ~b | ~c | ~d) & (~a | b | ~c | ~d) & (~a | ~b | c | ~d) & (~a | ~b | ~c | d);
endmodule

module minimizedFunctionE ( output s, input a, input b, input c, input d );
    assign s = (~a|~b|c|~d) & (b|~c|~d) & (a|~c) & (~b|~c|d);  
endmodule

module Guia_0604;
    reg x, y, w, z;
    wire a, af, b, bf, c, cf, d, df, e, ef;
    integer i;

    PoSA PoSA(a,x,y,w,z);
    minimizedFunctionA minimizedFunctionA(af,x,y,w,z);

    PoSB PoSB(b,x,y,w,z);
    minimizedFunctionB minimizedFunctionB(bf,x,y,w,z);

    PoSC PoSC(c,x,y,w,z);
    minimizedFunctionC minimizedFunctionC(cf,x,y,w,z);

    PoSD PoSD(d,x,y,w,z);
    minimizedFunctionD minimizedFunctionD(df,x,y,w,z);

    PoSE PoSE(e,x,y,w,z);
    minimizedFunctionE minimizedFunctionE(ef,x,y,w,z);

    initial begin : main
        $display ( "Atividade 4 resultado" );

        $display ( "A)" );
        $display(" m  | x y w z | PoS(2, 5, 7, 13) | X+Y+W'+Z) . (X+Y'+Z') . (Y'+W+Z')");
        $display("-----------------------------------");
        
        for (i = 0; i < 16; i = i + 1) begin
            {x, y, w, z} = i;
            #1;
            $display(" %1d | %b %b %b %b | %b |  %b    |", i, x, y, w, z, a, af);
        end

        $display ( "B)" );
        $display(" m  | x y w z | PoS(4, 6, 9, 11, 14) | (X'+Y+W'+Z') . (Y'+W'+Z) . (X+Y'+Z)");
        $display("-----------------------------------");
        
        for (i = 0; i < 16; i = i + 1) begin
            {x, y, w, z} = i;
            #1;
            $display(" %1d | %b %b %b %b | %b |  %b    |", i, x, y, w, z, b, bf);
        end

        $display ( "C)" );
        $display(" m  | x y w z | PoS(4, 7, 8, 10, 12) | (X'+Y+W'+Z') . (Y+W+Z) . (X+Y'+Z)");
        $display("-----------------------------------");
        
        for (i = 0; i < 16; i = i + 1) begin
            {x, y, w, z} = i;
            #1;
            $display(" %1d | %b %b %b %b | %b |  %b    |", i, x, y, w, z, c, cf);
        end

        $display ( "D)" );
        $display(" m  | x y w z | PoS(1, 5, 9, 11, 13, 15) | (W+Z') . (X'+Z')");
        $display("-----------------------------------");
        
        for (i = 0; i < 16; i = i + 1) begin
            {x, y, w, z} = i;
            #1;
            $display(" %1d | %b %b %b %b | %b |  %b    |", i, x, y, w, z, d, df);
        end

        $display ( "E)" );
        $display(" m  | x y w z | PoS(2, 3, 6, 7, 11, 13, 14) | (X'+Y+W'+Z') . (Y+W'+Z') . (X + W') . (Y'+W'+Z) ");
        $display("-----------------------------------");
        
        for (i = 0; i < 16; i = i + 1) begin
            {x, y, w, z} = i;
            #1;
            $display(" %1d | %b %b %b %b | %b |  %b    |", i, x, y, w, z, e, ef);
        end
    end // main
endmodule

