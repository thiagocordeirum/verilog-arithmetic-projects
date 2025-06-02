module Div_8b (
    input clk,             
    input reset,            
    input start,            
    input [7:0] div1,          
    input [7:0] div2,          
    output reg [7:0] quo,     
    output reg [7:0] resto,     
    output reg fim,        
    output reg zero_div     
);
    reg [3:0] count;
    reg [15:0] rem_reg;
    reg [7:0] divisor;
    reg [2:0] state;
    localparam IDLE  = 3'b000,
               CHECK = 3'b001,
               LOAD  = 3'b010,
               DIV   = 3'b011,
               DONE  = 3'b100;
    always @(posedge clk) begin
        if (reset) begin
            quo <= 0;
            resto <= 0;
            fim <= 0;
            zero_div <= 0;
            state <= IDLE;
        end else begin
            case (state)
                IDLE: begin
                    fim <= 0;
                    if (start) state <= CHECK;
                end

                CHECK: begin
                    if (div2 == 0) begin
                        zero_div <= 1;
                        state <= DONE;
                    end else begin
                        zero_div <= 0;
                        state <= LOAD;
                    end
                end

                LOAD: begin
                    rem_reg <= {8'b0, div1};
                    divisor <= div2;
                    quo <= 0;
                    count <= 8;
                    state <= DIV;
                end

                DIV: begin
                    rem_reg = rem_reg << 1;
                    rem_reg[0] = quo[7];

                    rem_reg[15:8] = rem_reg[15:8] - divisor;

                    if (rem_reg[15]) begin
                        rem_reg[15:8] = rem_reg[15:8] + divisor;
                        quo = quo << 1;
                    end else begin
                        quo = (quo << 1) | 1'b1;
                    end

                    count = count - 1;
                    if (count == 0) state <= DONE;
                end

                DONE: begin
                    resto <= rem_reg[15:8];
                    fim <= 1;
                    state <= IDLE;
                end
            endcase
        end
    end
endmodule
