# verilog-arithmetic-projects
Coleção de projetos aritméticos em Verilog:
- ULA (Unidade Lógica e Aritmética) de 8 bits
- Multiplicador de 8 bits
- Divisor de 8 bits

Este repositório reúne três projetos desenvolvidos com foco em circuitos digitais descritos em Verilog, simulados com ModelSim e sintetizados usando Quartus Prime.


## 📁 Estrutura do Projeto
```
├── ULA/
│ ├── ula_8b.v
│ ├── tb_ula_8b.v
│ └── ULA_8Bits.pdf
│
├── Multiplicador/
│ ├── Multi_8b.v
│ ├── tb_Multi_8b.v
│ └── Circuito_Multiplicador.pdf
│
├── Divisor/
│ ├── Div_8b.v
│ ├── tb_Div_8b.v
│ └── Circuito_Divisor.pdf
````

## ⚙️ Descrição dos Módulos

### 🔸 ULA 8 Bits
Uma Unidade Lógica e Aritmética (ULA) capaz de realizar operações básicas como soma, , AND, OR e NOT.

-  **Operações suportadas**: `ADD`, `AND`, `OR`, `NOT`
-  **Entradas**: Dois valores de 8 bits cada (x, y)
-  **Saídas**: Resultado de 8 bits e flags carry|overflow|negative|zero
-  **[ULA_8_Bits.pdf](https://github.com/thiagocordeirum/verilog-arithmetic-projects/blob/main/ULA/ULA_8_Bits.pdf)**

### 🔸 Multiplicador Binário
Multiplicador assíncrono de dois números binários de 8 bits, com suporte a overflow e controle de sinal.

-  **Operação** suportada: `MUL` (multiplicação binária)
-  **Entradas**: Dois operandos de 8 bits
-  **Saída**: Resultado de 16 bits
-  **[Circuito_Multiplicador.pdf](https://github.com/thiagocordeirum/verilog-arithmetic-projects/blob/main/Multiplicador/Circuito_Multiplicador.pdf)**


### 🔸 Divisor Binário
Módulo que realiza a divisão binária entre dois números de 8 bits, fornecendo quociente e resto como resultado.

-  **Operação** suportada: `DIV` (divisão binária)
-  **Entradas**: Dividendo e divisor de 8 bits cada
-  **Saída**: Quociente e resto de 8 bits cada
-  **[Circuito_Multiplicador.pdf](https://github.com/thiagocordeirum/verilog-arithmetic-projects/blob/main/Divisor/Circuito_Divisor.pdf)**


## 🧰 Ferramentas Utilizadas

- **ModelSim**: Simulação dos projetos e testbenches
- **Quartus Prime**: Síntese, análise de temporização e geração de bitstream para FPGA
- **Verilog HDL**: Linguagem de descrição de hardware


## 🧪 Testes

Cada módulo possui um testbench correspondente:

* `tb_ULA_8b.v`
* `tb_Multi_8b.v`
* `tb_Div_8b.v`

Para simular foi utilizado o ModelSim com o Quartus Lite 20.1:

1. Abra o arquivo .qpf no Quartus.
2. Vá em *Assignments* --> *Settings* --> *Simulation* --> *Compile test bench* --> Escolha o arquivo de teste.
3. Compile o módulo e seu testbench.
4. Execute a simulação no ModelSim clicando em *Run --> Run Simulation Tool --> RTL Simulation*
