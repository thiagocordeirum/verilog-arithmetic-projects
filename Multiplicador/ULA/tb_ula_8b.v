`timescale 1ns/1ps

module tb_ula_8b;

    // Entradas
    reg [7:0] a, b;
    reg x, y;

    // Saídas
    wire [7:0] s;
    wire c, ov, z, n;

    // Instancia a ULA
    ula_8b dut (
        .a(a), .b(b), .x(x), .y(y),
        .s(s), .c(c), .ov(ov), .z(z), .n(n)
    );

    // Procedimento de teste
    initial begin
        $display("x y |     a     b   |    s    | c ov z n");
        $display("----+--------------+----------+----------");

        // Teste de soma sem overflow
        x = 0; y = 0; a = 8'd10; b = 8'd20; #10;
        $display("%b %b | %h %h | %h | %b  %b  %b %b", x, y, a, b, s, c, ov, z, n);

        // Teste de soma com carry e overflow (127 + 1)
        x = 0; y = 0; a = 8'd127; b = 8'd1; #10;
        $display("%b %b | %h %h | %h | %b  %b  %b %b", x, y, a, b, s, c, ov, z, n);

        // Teste de soma negativa com overflow (-128 + -128)
        x = 0; y = 0; a = 8'b10000000; b = 8'b10000000; #10;
        $display("%b %b | %b %b | %b | %b  %b  %b %b", x, y, a, b, s, c, ov, z, n);

        // Teste de soma com resultado zero (127 + -127)
        x = 0; y = 0; a = 8'd127; b = -8'd127; #10;
        $display("%b %b | %h %h | %h | %b  %b  %b %b", x, y, a, b, s, c, ov, z, n);

        // Teste de AND
        x = 0; y = 1; a = 8'b11001100; b = 8'b10101010; #10;
        $display("%b %b | %b %b | %b | %b  %b  %b %b", x, y, a, b, s, c, ov, z, n);

        // Teste de OR
        x = 1; y = 0; a = 8'b11001100; b = 8'b10101010; #10;
        $display("%b %b | %b %b | %b | %b  %b  %b %b", x, y, a, b, s, c, ov, z, n);

        // Teste de NOT
        x = 1; y = 1; a = 8'b11110000; b = 8'b00000000; #10; // b não importa no NOT
        $display("%b %b | %b %b | %b | %b  %b  %b %b", x, y, a, b, s, c, ov, z, n);

        $finish;
    end

endmodule
