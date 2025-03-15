/*
Guia_0601.v
867936-heitor_vieira
*/

module SoPA ( output s, input a, input b, input c );
    assign s = (~a&~b&c) + (a&~b&c) + (a&b&c);
endmodule

module minimizedFunctionA ( output s, input a, input b, input c );
    assign s = (~b&c) | (a&c);  
endmodule

module SoPB ( output s, input a, input b, input c );
    assign s = (~a&~b&~c) + (a&~b&~c) + (a&b&~c);
endmodule

module minimizedFunctionB ( output s, input a, input b, input c );
    assign s = (~b&~c) | (a&b&~c);  
endmodule

module SoPC ( output s, input a, input b, input c );
    assign s = (~a&~b&c) + (~a&b&~c) + (~a&b&c) + (a&b&~c);
endmodule

module minimizedFunctionC ( output s, input a, input b, input c );
    assign s = (~a & c) | (~a & b) | (b & ~c);  
endmodule

module SoPD ( output s, input a, input b, input c );
    assign s = (~a&~b&c) + (~a&b&~c) + (a&~b&c) + (a&b&~c);
endmodule

module minimizedFunctionD ( output s, input a, input b, input c );
    assign s = (~b&c) | (b&~c);  
endmodule

module SoPE ( output s, input a, input b, input c );
    assign s = (~a&~b&~c) + (~a&b&~c) + (a&~b&~c) + (a&b&c);
endmodule

module minimizedFunctionE ( output s, input a, input b, input c );
    assign s = (~b & ~c) | (a & b & c) | (~a & b & ~c);  
endmodule

module Guia_0601;
    reg x, y, z;
    wire a, af, b, bf, c, cf, d, df, e, ef;
    integer i;

    SoPA SoPA(a,x,y,z);
    minimizedFunctionA minimizedFunctionA(af,x,y,z);

    SoPB SoPB(b,x,y,z);
    minimizedFunctionB minimizedFunctionB(bf,x,y,z);

    SoPC SoPC(c,x,y,z);
    minimizedFunctionC minimizedFunctionC(cf,x,y,z);

    SoPD SoPD(d,x,y,z);
    minimizedFunctionD minimizedFunctionD(df,x,y,z);

    SoPE SoPE(e,x,y,z);
    minimizedFunctionE minimizedFunctionE(ef,x,y,z);

    initial begin : main
        $display ( "Atividade 1 resultado" );

        $display ( "A)" );
        $display(" m  | x y z | SoP(1,5,7) | (~y&z) | (x&z)");
        $display("-----------------------------------");
        
        for (i = 0; i < 8; i = i + 1) begin
            {x, y, z} = i;
            #1;
            $display(" %1d | %b %b %b | %b |  %b    |", i, x, y, z, a, af);
        end

        $display ( "B)" );
        $display(" m  | x y z | SoP(0,4,6) | (~y&z) | (x&z)");
        $display("-----------------------------------");
        
        for (i = 0; i < 8; i = i + 1) begin
            {x, y, z} = i;
            #1;
            $display(" %1d | %b %b %b | %b |  %b    |", i, x, y, z, b, bf);
        end

        $display ( "C)" );
        $display(" m  | x y z | SoP(1,2,3,6) | (~x & z) | (~x & y) | (y & ~z)");
        $display("-----------------------------------");
        
        for (i = 0; i < 8; i = i + 1) begin
            {x, y, z} = i;
            #1;
            $display(" %1d | %b %b %b | %b |  %b    |", i, x, y, z, c, cf);
        end

        $display ( "D)" );
        $display(" m  | x y z | SoP(1,2,5,6) | (~y&z) | (y&~z)");
        $display("-----------------------------------");
        
        for (i = 0; i < 8; i = i + 1) begin
            {x, y, z} = i;
            #1;
            $display(" %1d | %b %b %b | %b |  %b    |", i, x, y, z, d, df);
        end

        $display ( "E)" );
        $display(" m  | x y z | SoP(0,2,4,7) | y'z'+ xyz + x'yz' ");
        $display("-----------------------------------");
        
        for (i = 0; i < 8; i = i + 1) begin
            {x, y, z} = i;
            #1;
            $display(" %1d | %b %b %b | %b |  %b    |", i, x, y, z, e, ef);
        end
    end // main
endmodule

