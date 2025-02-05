/*
Guia_0201.v
867936-heitor_vieira
*/

module Guia_0201;
    real x = 0;
    real power2 = 1.0;
    integer y = 7;
    reg[7:0] b [4:0]; // fractional part big endian
    reg[7:0] letters [4:0];
    integer alternativesCounter = 4;
    initial
        begin : main
            $display ( "Atividade 1 resultado" );
            
            b[4] = 8'b00101000; // complete with rights 0 because it is big endian
            b[3] = 8'b01101000;
            b[2] = 8'b10001000;
            b[1] = 8'b10111000;
            b[0] = 8'b11101000;
            
            letters[4] = 8'd97;  // 'a'
            letters[3] = 8'd98;  // 'b'
            letters[2] = 8'd99;  // 'c'
            letters[1] = 8'd100; // 'd'
            letters[0] = 8'd101; // 'e'

            while(alternativesCounter >= 0) begin
                x=0;
                power2=1.0;

                while(y >= 0) begin
                    power2 = power2/2.0;
                    if(b[alternativesCounter][y] == 1) begin
                        x = x+power2;
                    end
                    y = y - 1;
                end

                if(letters[alternativesCounter] == 8'd100) begin
                    x = x +1;
                end

                if(letters[alternativesCounter] == 8'd101) begin
                    x = x + 3;
                end

                $display ( " %s = %f", letters[alternativesCounter], x );

                alternativesCounter = alternativesCounter - 1;
                y=7;
            end
        end
endmodule