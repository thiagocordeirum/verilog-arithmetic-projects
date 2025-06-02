module Multi_8b (
    input clk,             
    input rst,             
    input start,           
    input [7:0] A,         
    input [7:0] B,         
    output reg [15:0] Result,   
    output reg fimOperacao,       
    output reg Z,  
    output reg OV 
);
    reg [7:0] reg_A, reg_B;    
    reg [15:0] acc;            
    reg [3:0] count;           
    reg execution;                  
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            Result <= 16'b0;
            reg_A <= 8'b0;
            reg_B <= 8'b0;
            acc <= 16'b0;
            count <= 4'b0;
            fimOperacao <= 1'b0;
            execution <= 1'b0;
            Z <= 1'b0;
            OV <= 1'b0;
        end 
        else if (start && !execution) begin
            reg_A <= A;
            reg_B <= B;
            acc <= 16'b0;
            count <= 4'b0;
            fimOperacao <= 1'b0;
            execution <= 1'b1;
        end 
        else if (execution) begin
            if (count < 8) begin
                if (reg_B[0]) begin
                    acc <= acc + (reg_A << count);
                end
                reg_B <= reg_B >> 1;
                count <= count + 1;
            end 
            else begin
                Result <= acc;
                fimOperacao <= 1'b1;
                Z <= (acc == 16'b0);
                OV <= |acc[15:8];
                execution <= 1'b0;
            end
        end
    end

endmodule