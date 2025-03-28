// parallel multiplier

module div(clk,rst,q);
  input clk,rst;
  output q;
  reg [27:0]sig;
  assign LED=q;
always @(posedge clk)
begin
  if(rst==1)
    sig=28'b0;
  else if (rst==0)
    sig=sig+1;
  end
  assign q=sig[25]; 
endmodule

module para_multi(
  input [4:0] mul,
  input [3:0] Q,
  input clk,rst,
  output reg [8:0] res);
  

  reg [8:0] partial [3:0];
  reg [8:0] adder_out[2:0];
  wire [8:0] w_adder_out[2:0];
  wire [8:0] w_partial [3:0];
  wire [8:0] w_out;

  
 // div divi (clkin,rst,clk);
  
  assign w_partial[0] = Q[0]?{4'b0,mul}:9'b0;
  assign w_partial[1] = Q[1]?({4'b0,mul}<<1):9'b0;
  assign w_partial[2] = Q[2]?({4'b0,mul}<<2):9'b0;
  assign w_partial[3] = Q[3]?({4'b0,mul}<<3):9'b0;

        
    
  always @(posedge clk)
  begin
    partial[0] <= rst?9'b0:w_partial[0];
    partial[1] <= rst?9'b0:w_partial[1];
    partial[2] <= rst?9'b0:w_partial[2];
    partial[3] <= rst?9'b0:w_partial[3];  
  end
    assign w_adder_out[0] = partial[0] + partial[1];
    assign w_adder_out[1] = partial[2] + partial[3];

    
    always @(posedge clk)
    begin
    adder_out[0] <= rst?9'b0:w_adder_out[0];
    adder_out[1] <= rst?9'b0:w_adder_out[1];
    end
    
    assign w_out = (adder_out[0] + adder_out[1]);
    
    always @(posedge clk)
    begin
      res <= rst?9'b0:w_out;
    end
  
endmodule
  

module test();

reg [4:0] mul;
reg [3:0] Q;
reg clk,rst;
wire [8:0] res;

para_multi dut (mul,Q,clk,rst,res);

always #5  clk = ~clk;
initial begin
    clk = 0;
    rst = 1;
    mul = 5'b10100;   // 20 in decimal
    Q = 4'b1001;      // 9 in decimal
    #20 rst = 0;      // Release reset
    
    // Test cases
    #20 mul = 5'b01111; Q = 4'b1010;  // 15 * 10
    #20 mul = 5'b10011; Q = 4'b1101;  // 19 * 13
    #20 mul = 5'b00011; Q = 4'b1111;  // 3 * 15
     $stop;
  end

endmodule

