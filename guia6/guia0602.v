/*
Guia_0602.v
867936-heitor_vieira
*/

module PoSA ( output s, input a, input b, input c );
    assign s = (a | b | ~c) & (~a | b | ~c) & (~a | ~b | ~c);
endmodule

module minimizedFunctionA ( output s, input a, input b, input c );
    assign s = (b | ~c) & (~a | ~c);  
endmodule

module PoSB ( output s, input a, input b, input c );
    assign s = (a | b | c) & (~a | b | c) & (~a | ~b | c);
endmodule

module minimizedFunctionB ( output s, input a, input b, input c );
    assign s = (b | c) & (~a | ~b | c);  
endmodule

module PoSC ( output s, input a, input b, input c );
    assign s = (a | b | ~c) & (a | ~b | c) & (a | ~b | ~c) & (~a | ~b | c);
endmodule

module minimizedFunctionC ( output s, input a, input b, input c );
    assign s = (a | ~c) & (a | ~b) & (~b | c);  
endmodule

module PoSD ( output s, input a, input b, input c );
    assign s = (a | b | c) & (a | b | ~c) & (~a | b | ~c) & (~a | ~b | c);
endmodule

module minimizedFunctionD ( output s, input a, input b, input c );
    assign s = (a | b) & (b | ~c) & (~a | ~b | c);  
endmodule

module PoSE ( output s, input a, input b, input c );
    assign s = (a | b | c) & (a | ~b | c) & (~a | b | c) & (~a | ~b | ~c);
endmodule

module minimizedFunctionE ( output s, input a, input b, input c );
    assign s = (b | c) & (a | c) & (~a | ~b | ~c);  
endmodule

module Guia_0602;
    reg x, y, z;
    wire a, af, b, bf, c, cf, d, df, e, ef;
    integer i;

    PoSA PoSA(a,x,y,z);
    minimizedFunctionA minimizedFunctionA(af,x,y,z);

    PoSB PoSB(b,x,y,z);
    minimizedFunctionB minimizedFunctionB(bf,x,y,z);

    PoSC PoSC(c,x,y,z);
    minimizedFunctionC minimizedFunctionC(cf,x,y,z);

    PoSD PoSD(d,x,y,z);
    minimizedFunctionD minimizedFunctionD(df,x,y,z);

    PoSE PoSE(e,x,y,z);
    minimizedFunctionE minimizedFunctionE(ef,x,y,z);

    initial begin : main
        $display ( "Atividade 2 resultado" );

        $display ( "A)" );
        $display(" m  | x y z | PoS(1,5,7) | (Y+Z') . (X'+Z')");
        $display("-----------------------------------");
        
        for (i = 0; i < 8; i = i + 1) begin
            {x, y, z} = i;
            #1;
            $display(" %1d | %b %b %b | %b |  %b    |", i, x, y, z, a, af);
        end

        $display ( "B)" );
        $display(" m  | x y z | PoS(0,4,6) | (Y+Z) . (X'+ Y' + Z)");
        $display("-----------------------------------");
        
        for (i = 0; i < 8; i = i + 1) begin
            {x, y, z} = i;
            #1;
            $display(" %1d | %b %b %b | %b |  %b    |", i, x, y, z, b, bf);
        end

        $display ( "C)" );
        $display(" m  | x y z | PoS(1,2,3,6) | (X+Z') . (X+Y') . (Y'+Z)");
        $display("-----------------------------------");
        
        for (i = 0; i < 8; i = i + 1) begin
            {x, y, z} = i;
            #1;
            $display(" %1d | %b %b %b | %b |  %b    |", i, x, y, z, c, cf);
        end

        $display ( "D)" );
        $display(" m  | x y z | PoS(0,1,5,6) | (X+Y) . (Y+Z') . (X'+Y'+Z)");
        $display("-----------------------------------");
        
        for (i = 0; i < 8; i = i + 1) begin
            {x, y, z} = i;
            #1;
            $display(" %1d | %b %b %b | %b |  %b    |", i, x, y, z, d, df);
        end

        $display ( "E)" );
        $display(" m  | x y z | PoS(0,2,4,7) | (Y+Z) . (X+Z) . (X'+Y'+Z') ");
        $display("-----------------------------------");
        
        for (i = 0; i < 8; i = i + 1) begin
            {x, y, z} = i;
            #1;
            $display(" %1d | %b %b %b | %b |  %b    |", i, x, y, z, e, ef);
        end
    end // main
endmodule

