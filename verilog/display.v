module display(in_val, clk, in_dot, seg, an, dp);

    input [15:0] in_val;
    input clk;
    input [3:0] in_dot;

    output reg [6:0] seg;
    output reg dp;
    output reg [3:0] an;

    reg [17:0] count;
    reg [3:0] digit;

    always @(posedge clk)
        begin
            count <= count + 1;
            if(count == 0)
                case(an)
                    4'b1110 : begin
                        an <= 4'b1101;
                        digit <= in_val[7:4];
                        dp <= in_dot[1];
                    end
                    4'b1101 : begin
                        an <= 4'b1011;
                        digit <= in_val[11:8];
                        dp <= in_dot[2];
                    end
                    4'b1011 : begin
                        an <= 4'b0111;
                        digit <= in_val[15:12];
                        dp <= in_dot[3];
                    end
                    4'b0111 : begin
                        an <= 4'b1110;
                        digit <= in_val[3:0];
                        dp <= in_dot[0];
                    end
                    default : begin
                        an <= 4'b1110;
                        digit <= in_val[3:0];
                        dp <= in_dot[0];
                    end
                endcase
        end

    always @(*)
        case(digit)
            4'h0 : seg <= 7'b1000000;
            4'h1 : seg <= 7'b1111001;
            4'h2 : seg <= 7'b0100100;
            4'h3 : seg <= 7'b0110000;
            4'h4 : seg <= 7'b0011001;
            4'h5 : seg <= 7'b0010010;
            4'h6 : seg <= 7'b0000010;
            4'h7 : seg <= 7'b1111000;
            4'h8 : seg <= 7'b0000000;
            4'h9 : seg <= 7'b0010000;
            4'hA : seg <= 7'b0001000;
            4'hB : seg <= 7'b0000011;
            4'hC : seg <= 7'b1000110;
            4'hD : seg <= 7'b0100001;
            4'hE : seg <= 7'b0000110;
            4'hF : seg <= 7'b0001110;
        endcase

endmodule
