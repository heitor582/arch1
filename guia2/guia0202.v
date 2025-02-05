/*
Guia_0202.v
867936-heitor_vieira
*/

module Guia_0202;
    real x [0:4];
    reg[7:0] letters [0:4];
    reg[7:0] b = 0;
    reg[7:0] integerPart = 0;
    integer y = 7;
    integer i;
    integer iPart = 0;
    initial 
        begin : main
            $display ( "Atividade 2 resultado" );
            letters[0] = 8'd97;  // 'a'
            letters[1] = 8'd98;  // 'b'
            letters[2] = 8'd99;  // 'c'
            letters[3] = 8'd100; // 'd'
            letters[4] = 8'd101; // 'e'

            x[0] = 0.625;
            x[1] = 1.75;
            x[2] = 3.125;
            x[3] = 4.3125;
            x[4] = 7.875;

            for(i = 0; i < 5; i = i + 1) begin
                y=7;
                iPart = $floor(x[i]);
                x[i] = x[i] - iPart;

                while(x[i]<1 && y>=0) begin
                    if(x[i]*2.0 >= 1) begin
                    b[y] = 1;
                    x[i] = x[i] * 2.0 - 1.0;
                    end
                    else begin
                        b[y] = 0;
                        x[i] = x[i] * 2.0;
                    end
                    y = y-1;
                end

                for(y = 0; y < 8; y = y + 1) begin
                   integerPart[y] = iPart % 2; 
                   iPart = iPart/2; 
                end

                $display ( " %s = %b.%b", letters[i], integerPart, b );
            end
        end
endmodule