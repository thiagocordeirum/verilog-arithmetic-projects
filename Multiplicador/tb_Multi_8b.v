`timescale 1ns/1ps

module tb_Multi_8b();

    // Entradas
    reg clk;
    reg rst;
    reg start;
    reg [7:0] A;
    reg [7:0] B;

    // Saídas
    wire [15:0] Result;
    wire fimOperacao;
    wire Z;
    wire OV;

    // Instanciação do módulo a ser testado
    Multi_8b uut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .A(A),
        .B(B),
        .Result(Result),
        .fimOperacao(fimOperacao),
        .Z(Z),
        .OV(OV)
    );

    // Clock: alterna a cada 5 ns
    always #5 clk = ~clk;

    initial begin
        // Inicialização
        clk = 0;
        rst = 1;
        start = 0;
        A = 8'd0;
        B = 8'd0;

        // Espera pelo reset
        #10;
        rst = 0;

        // Teste 1: 0 * 0
        A = 8'd0;
        B = 8'd0;
        start = 1;
        #10;
        start = 0;
        wait(fimOperacao);
        #10;

        // Teste 2: 5 * 10 = 50
        A = 8'd5;
        B = 8'd10;
        start = 1;
        #10;
        start = 0;
        wait(fimOperacao);
        #10;

        // Teste 3: 255 * 255 = 65025
        A = 8'd255;
        B = 8'd255;
        start = 1;
        #10;
        start = 0;
        wait(fimOperacao);
        #10;

        // Teste 4: 128 * 2 = 256
        A = 8'd128;
        B = 8'd2;
        start = 1;
        #10;
        start = 0;
        wait(fimOperacao);
        #10;

        // Teste 5: 1 * 200
        A = 8'd1;
        B = 8'd200;
        start = 1;
        #10;
        start = 0;
        wait(fimOperacao);
        #10;

        // Finaliza simulação
        $display("Testes finalizados.");
        $stop;
    end

endmodule
