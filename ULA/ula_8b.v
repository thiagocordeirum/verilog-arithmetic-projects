module ula_8b (
    input [7:0] a, b,
    input x, y,
    output reg [7:0] s,
    output reg c, ov, z, n
);

    wire [8:0] soma_ext;      // Para detectar carry
    assign soma_ext = a + b;

    always @(a, b, x, y) begin
        // Operação principal
        case ({x, y})
            2'b00: s = a + b;
            2'b01: s = a & b;
            2'b10: s = a | b;
            2'b11: s = ~a;
        endcase

        // Flags
        if ({x, y} == 2'b00) begin // Caso {soma}
            c  = soma_ext[8];                          // Carry out do bit 8
            ov = (~a[7] & ~b[7] & s[7]) | (a[7] & b[7] & ~s[7]); // Overflow detectado via sinais
        end else begin
            c = 0;
            ov = 0;
        end

        z = (s == 8'b0);        // Zero
        n = s[7];               // Negativo (bit mais significativo)
    end

endmodule