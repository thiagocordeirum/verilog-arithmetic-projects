`timescale 1ns/1ps

module tb_Div_8b();

    // Entradas
    reg clk;
    reg reset;
    reg start;
    reg [7:0] div1;
    reg [7:0] div2;

    // Saídas
    wire [7:0] quo;
    wire [7:0] resto;
    wire fim;
    wire zero_div;

    // Instanciação do módulo
    Div_8b uut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .div1(div1),
        .div2(div2),
        .quo(quo),
        .resto(resto),
        .fim(fim),
        .zero_div(zero_div)
    );

    // Clock gerado com período de 10ns
    always #5 clk = ~clk;

    initial begin
        // Inicialização
        clk = 0;
        reset = 1;
        start = 0;
        div1 = 0;
        div2 = 0;
        #20;

        reset = 0;

        // Teste 1: 100 / 5
        div1 = 8'd100;
        div2 = 8'd5;
        start = 1;
        #10 start = 0;
        wait(fim);
        #10;
        $display("Teste 1: 100 / 5 => quo = %d, resto = %d, zero_div = %b", quo, resto, zero_div);

        // Teste 2: 15 / 4
        div1 = 8'd15;
        div2 = 8'd4;
        start = 1;
        #10 start = 0;
        wait(fim);
        #10;
        $display("Teste 2: 15 / 4 => quo = %d, resto = %d, zero_div = %b", quo, resto, zero_div);

        // Teste 3: 200 / 1
        div1 = 8'd200;
        div2 = 8'd1;
        start = 1;
        #10 start = 0;
        wait(fim);
        #10;
        $display("Teste 3: 200 / 1 => quo = %d, resto = %d, zero_div = %b", quo, resto, zero_div);

        // Teste 4: divisão por zero
        div1 = 8'd50;
        div2 = 8'd0;
        start = 1;
        #10 start = 0;
        wait(fim);
        #10;
        $display("Teste 4: 50 / 0 => quo = %d, resto = %d, zero_div = %b", quo, resto, zero_div);

        // Teste 5: dividendo zero
        div1 = 8'd0;
        div2 = 8'd10;
        start = 1;
        #10 start = 0;
        wait(fim);
        #10;
        $display("Teste 5: 0 / 10 => quo = %d, resto = %d, zero_div = %b", quo, resto, zero_div);

        // Finaliza simulação
        $display("Todos os testes foram executados.");
        $stop;
    end

endmodule
