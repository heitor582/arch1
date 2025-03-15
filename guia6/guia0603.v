/*
Guia_0603.v
867936-heitor_vieira
*/

module SoPA ( output s, input a, input b, input c, input d );
    assign s = (~a&~b&~c&d) + (~a&~b&c&~d) + (~a&b&c&~d) + (a&~b&~c&~d) + (a&b&~c&~d) + (a&b&c&~d);
endmodule

module minimizedFunctionA ( output s, input a, input b, input c, input d );
    assign s = (~a & ~b & ~c & d) | (~a & c & ~d) | (b & c & ~d) | (a & b & ~d) | (a & ~c & ~d);  
endmodule

module SoPB ( output s, input a, input b, input c, input d );
    assign s = (~a&~b&~c&~d) + (~a&~b&~c&d) + (~a&~b&c&d) + (~a&b&c&d) + (a&~b&~c&~d) + (a&b&~c&~d) + (a&b&c&d);
endmodule

module minimizedFunctionB ( output s, input a, input b, input c, input d );
    assign s = (~a & ~b & ~c) | (~a & ~b & d) | (~a & c & d) | (b & c & d) | (a & ~c & ~d);  
endmodule

module SoPC ( output s, input a, input b, input c, input d );
    assign s = (~a&~b&~c&~d) + (~a&~b&~c&d) + (~a&~b&c&~d) + (~a&b&c&d) + (a&~b&c&~d) + (a&~b&c&d) + (a&b&c&~d) + (a&b&c&d);
endmodule

module minimizedFunctionC ( output s, input a, input b, input c, input d );
    assign s = (~a & ~b & ~d) | (~a & ~b & ~c) | (b & c & d) | (a & c); 
endmodule

module SoPD ( output s, input a, input b, input c, input d );
    assign s = (~a&~b&c&~d) + (~a&b&~c&~d) + (~a&b&~c&d) + (~a&b&c&~d) + (a&~b&c&~d) + (a&b&~c&d) + (a&b&c&~d);
endmodule

module minimizedFunctionD ( output s, input a, input b, input c, input d );
    assign s = (~a & c & ~d) | (b & c & ~d) | (a & c & ~d) | (~a & b & ~c) | (b & ~c & d);
endmodule

module SoPE ( output s, input a, input b, input c, input d );
    assign s = (~a&~b&~c&~d) + (~a&~b&~c&d) + (~a&~b&c&d) + (~a&b&~c&d) + (a&~b&~c&~d) + (a&~b&~c&d) + (a&~b&c&d) + (a&b&~c&d);
endmodule

module minimizedFunctionE ( output s, input a, input b, input c, input d );
    assign s = (~c & d) | (~b & d) | (~b & ~c);  
endmodule

module Guia_0603;
    reg x, y, w, z;
    wire a, af, b, bf, c, cf, d, df, e, ef;
    integer i;

    SoPA SoPA(a,x,y,w,z);
    minimizedFunctionA minimizedFunctionA(af,x,y,w,z);

    SoPB SoPB(b,x,y,w,z);
    minimizedFunctionB minimizedFunctionB(bf,x,y,w,z);

    SoPC SoPC(c,x,y,w,z);
    minimizedFunctionC minimizedFunctionC(cf,x,y,w,z);

    SoPD SoPD(d,x,y,w,z);
    minimizedFunctionD minimizedFunctionD(df,x,y,w,z);

    SoPE SoPE(e,x,y,w,z);
    minimizedFunctionE minimizedFunctionE(ef,x,y,w,z);

    initial begin : main
        $display ( "Atividade 3 resultado" );

        $display ( "A)" );
        $display(" m  | x y w z | SoP(1,5,7) | (~y&z) | (x&z)");
        $display("-----------------------------------");
        
        for (i = 0; i < 16; i = i + 1) begin
            {x, y, w, z} = i;
            #1;
            $display(" %1d | %b %b %b %b | %b |  %b    |", i, x, y, w, z, a, af);
        end

        $display ( "B)" );
        $display(" m  | x y w z | SoP(0,4,6) | (~y&z) | (x&z)");
        $display("-----------------------------------");
        
        for (i = 0; i < 16; i = i + 1) begin
            {x, y, w, z} = i;
            #1;
            $display(" %1d | %b %b %b %b | %b |  %b    |", i, x, y, w, z, b, bf);
        end

        $display ( "C)" );
        $display(" m  | x y w z | SoP(1,2,3,6) | (~x & z) | (~x & y) | (y & ~z)");
        $display("-----------------------------------");
        
        for (i = 0; i < 16; i = i + 1) begin
            {x, y, w, z} = i;
            #1;
            $display(" %1d | %b %b %b %b | %b |  %b    |", i, x, y, w, z, c, cf);
        end

        $display ( "D)" );
        $display(" m  | x y w z | SoP(1,2,5,6) | (~y&z) | (y&~z)");
        $display("-----------------------------------");
        
        for (i = 0; i < 16; i = i + 1) begin
            {x, y, w, z} = i;
            #1;
            $display(" %1d | %b %b %b %b | %b |  %b    |", i, x, y, w, z, d, df);
        end

        $display ( "E)" );
        $display(" m  | x y w z | SoP(0,2,4,7) | y'z'+ xyz + x'yz' ");
        $display("-----------------------------------");
        
        for (i = 0; i < 16; i = i + 1) begin
            {x, y, w, z} = i;
            #1;
            $display(" %1d | %b %b %b %b | %b |  %b    |", i, x, y, w, z, e, ef);
        end
    end // main
endmodule

