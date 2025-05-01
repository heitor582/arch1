/*
Rec_0101.v
867936-heitor_vieira
*/

// 1,3,4,5,7,A,B,D,F
// (a'b'c'd) + (a'b'cd) + (a'bc'd') + (a'bc'd) + (a'bcd) + (ab'cd') + (ab'cd) + (abc'd) + (abcd)
module SoP ( output s, input a, input b, input c, input d );
    assign s = (~a&~b&~c&d) + (~a&~b&c&d) + (~a&b&~c&~d) + (~a&b&~c&d) + (~a&b&c&d) + (a&~b&c&~d) + (a&~b&c&d) + (a&b&~c&d) + (a&b&c&d);
endmodule

//  ___________________________ 
// | ab\cd | 00 | 01 | 11 | 10 |
// |-------|----|----|----|----|
// | 00    |    | 1  | 1  |    |
// |-------|----|----|----|----|
// | 01    | 1  | 1  | 1  |    |
// |-------|----|----|----|----|
// | 11    |    | 1  | 1  |    |
// |-------|----|----|----|----|
// | 10    |    |    | 1  | 1  |
// |_______|____|____|____|____|
// (a'bc') + (a'd) + (bd) + (ab'c)
module minimizedSoP ( output s, input a, input b, input c, input d );
    assign s = (~a&b&~c) | (~a&d) | (b&d) + (a&~b&c);
endmodule

// ((a'b')'' * (c'd)'')'' + ((a'b')'' * (cd)'')'' + ((a'b)'' * (c'd')'')''
// + ((a'b)'' * (c'd)'')'' + ((a'b)'' * (cd)'')'' + ((ab')'' * (cd')'')'' 
// + ((ab')'' * (cd)'')'' + ((ab)'' * (c'd)'')'' + ((ab)'' * (cd)'')''
module SoPNand ( output s, input a, input b, input c, input d );
    wire t1, t2, t3, t4, t5, t6, t7, t, t9;
    assign t1 = ~(~(~(~(~a & ~b)) & ~(~(~c &  d))));
    assign t2 = ~(~(~(~(~a & ~b)) & ~(~( c &  d))));
    assign t3 = ~(~(~(~(~a &  b)) & ~(~(~c & ~d))));
    assign t4 = ~(~(~(~(~a &  b)) & ~(~(~c &  d))));
    assign t5 = ~(~(~(~(~a &  b)) & ~(~( c &  d))));
    assign t6 = ~(~(~(~( a & ~b)) & ~(~( c & ~d))));
    assign t7 = ~(~(~(~( a & ~b)) & ~(~( c &  d))));
    assign t8 = ~(~(~(~( a &  b)) & ~(~(~c &  d))));
    assign t9 = ~(~(~(~( a &  b)) & ~(~( c &  d))));

    assign s = ~((~t1) & (~t2) & (~t3) & (~t4) & (~t5) & (~t6) & (~t7) & (~t8) & (~t9));
endmodule

// 0,2,6,8,9,C,E
// (A+B+C+D) * (A+B+C'+D) * (A+B'+C'+D) * (A'+B+C+D) * (A'+B+C+D') * (A'+B'+C+D) * (A'+B'+C'+D)
module PoS ( output s, input A, input B, input C, input D );
    assign s = (A|B|C|D) & (A|B|~C|D) & (A|~B|~C|D) & (~A|B|C|D) & (~A|B|C|~D) & (~A|~B|C|D) & (~A|~B|~C|D);
endmodule

//  ___________________________ 
// | ab\cd | 00 | 01 | 11 | 10 |
// |-------|----|----|----|----|
// | 00    | 0  |    |    | 0  |
// |-------|----|----|----|----|
// | 01    |    |    |    | 0  |
// |-------|----|----|----|----|
// | 11    | 0  |    |    | 0  |
// |-------|----|----|----|----|
// | 10    | 0  | 0  |    |    |
// |_______|____|____|____|____|
// (A+B+D) * (B'+C'+D) * (A'+C+D) * (A'+B+C)
module minimizedPoS ( output s, input A, input B, input C, input D );
    assign s = (A|B|D) & (~B|~C|D) & (~A|C|D) & (~A|B|C);
endmodule

// ((A+B)'' + (C+D)'')'' * ((A+B)'' + (C'+D)'')'' * ((A+B')'' + (C'+D)'')'' * ((A'+B)'' + (C+D)'')''
// * ((A'+B)'' + (C+D')'')'' * ((A'+B')'' + (C+D)'')'' * ((A'+B')'' + (C'+D)'')''
module PoSNor ( output s, input A, input B, input C, input D );
    wire t1, t2, t3, t4, t5, t6, t7;
    
    assign t1 = ~(~(~(~(A  | B) ) | ~(~(C | D))));
    assign t2 = ~(~(~(~(A  | B) ) | ~(~(~C | D))));
    assign t3 = ~(~(~(~(A  | ~B)) | ~(~(~C | D))));
    assign t4 = ~(~(~(~(~A | B) ) | ~(~(C | D))));
    assign t5 = ~(~(~(~(~A | B) ) | ~(~(C | ~D))));
    assign t6 = ~(~(~(~(~A | ~B)) | ~(~(C | D))));
    assign t7 = ~(~(~(~(~A | ~B)) | ~(~(~C | D))));

    assign s = ~(~t1 | ~t2 | ~t3 | ~t4 | ~t5 | ~t6 | ~t7);
endmodule

module Rec_0101;
    reg a,b,c,d;
    wire sop, sopm, sopn, pos, posm, posn;
    integer i;

    SoP SoP(sop,a,b,c,d);
    minimizedSoP minimizedSoP(sopm,a,b,c,d);
    SoPNand SoPNand(sopn,a,b,c,d);

    PoS PoS(pos,a,b,c,d);
    minimizedPoS minimizedPoS(posm,a,b,c,d);
    PoSNor PoSNor(posn,a,b,c,d);

    initial begin : main
        $display ( "Atividade 1 resultado" );

        $display ( "A)" );
        $display("-----------------------------------");
        
        for (i = 0; i < 16; i = i + 1) begin
            {a,b,c,d} = i;
            #1;
            $display(" %1d | %b %b %b %b | %b", i, a,b,c,d, sop);
        end

        $display ( "B)" );
        $display("-----------------------------------");
        
        for (i = 0; i < 16; i = i + 1) begin
            {a,b,c,d} = i;
            #1;
            $display(" %1d | %b %b %b %b | %b", i, a,b,c,d, pos);
        end

        $display ( "C)" );
        $display("-----------------------------------");
        
        for (i = 0; i < 16; i = i + 1) begin
            {a,b,c,d} = i;
            #1;
            $display(" %1d | %b %b %b %b | %b", i, a,b,c,d, sopm);
        end

        $display ( "D)" );
        $display("-----------------------------------");
        
        for (i = 0; i < 16; i = i + 1) begin
            {a,b,c,d} = i;
            #1;
            $display(" %1d | %b %b %b %b | %b", i, a,b,c,d, posm);
        end

        $display ( "E)" );
        $display("-----------------------------------");
        
        for (i = 0; i < 16; i = i + 1) begin
            {a,b,c,d} = i;
            #1;
            $display(" %1d | %b %b %b %b | %b", i, a,b,c,d, sopn);
        end
        
        $display ( "F)" );
        $display("-----------------------------------");
        
        for (i = 0; i < 16; i = i + 1) begin
            {a,b,c,d} = i;
            #1;
            $display(" %1d | %b %b %b %b | %b", i, a,b,c,d, posn);
        end
    end // main
endmodule

