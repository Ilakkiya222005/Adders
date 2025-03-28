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


module seq_gen_10110(
  input clkin,rst,
  output reg [2:0] out,
  output led);
  
  parameter s0 = 3'b001,
  s1 = 3'b000,
  s2 = 3'b011,
  s3 = 3'b101,
  s4 = 3'b110;
  
  reg [2:0] cur_state, next_state;
  
  div divi (clkin,rst,clk);
  
  assign led = clk;
  
  always @(posedge clk)
  begin
    if (rst) begin
      cur_state <= s0;
    end
    else
      cur_state <= next_state;
  end
  
  always @(cur_state)
  begin
      case (cur_state)
        s0: next_state = s1;
        s1: next_state = s2;
        s2: next_state = s3;
        s3: next_state = s4;
        s4: next_state = s0;
        default: next_state = s0;
      endcase
    out = cur_state;
  end
endmodule

/*

module seq_gen_test();
  reg clk,rst,en;
  wire [2:0] out;
  
  seq_gen_10110 dut (clk,rst,en,out);
  
  always #50 clk = ~clk;
  
  initial begin
    rst = 1'b1;
    clk = 1'b0;
    en = 1'b0;
    #100
    rst = 1'b0;
    en = 1'b1;
    #100
    #100
    #100
    #100
    #100
    #100
    #100
    #100
    $stop;
  end
endmodule
*/