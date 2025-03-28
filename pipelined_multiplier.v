module pipelined_multiplier (
    input clk,                 
    input rst,                 
    input [10:0] n1,           
    input [7:0] n2,           
    output reg [18:0] product  
);

    
    reg [10:0] reg_n1_stage1;
    reg [7:0] reg_n2_stage1;
    reg [18:0] partial_product_stage2;
    reg [18:0] final_product_stage3;

  
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            reg_n1_stage1 <= 11'b0;
            reg_n2_stage1 <= 8'b0;
        end else begin
            reg_n1_stage1 <= n1;
            reg_n2_stage1 <= n2;
        end
    end

  
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            partial_product_stage2 <= 19'b0;
        end else begin
            partial_product_stage2 <= reg_n1_stage1 * reg_n2_stage1; 
        end
    end

    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            final_product_stage3 <= 19'b0;
        end else begin
            final_product_stage3 <= {3'b000, partial_product_stage2};     
        end
    end

  
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            product <= 19'b0;
        end else begin
            product <= final_product_stage3;
        end
    end

endmodule