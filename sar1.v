module sar1(clk, rst, en, address, dout);
  input clk, rst, en;
  input [3:0] address;
  output reg [3:0] dout;
  reg [3:0] mem[15:0];

  initial begin
    mem[15] = 4'b0000;
    mem[14] = 4'b0001;
    mem[13] = 4'b0010;
    mem[12] = 4'b0011; 
    mem[11] = 4'b0100; 
    mem[10] = 4'b0101; 
    mem[9]  = 4'b0110; 
    mem[8]  = 4'b0111;
    mem[7]  = 4'b1000;
    mem[6]  = 4'b1001;
    mem[5]  = 4'b1010;
    mem[4]  = 4'b1011;
    mem[3]  = 4'b1100;
    mem[2]  = 4'b1101;
    mem[1]  = 4'b1110;
    mem[0]  = 4'b1111; 
  end

  always @(posedge clk)
   begin
    if (rst) 
    begin
      dout <= 4'b0000;
    end 
    else if (en) 
    begin
        dout <= mem[address];
      end
    end
endmodule


/*module main(clk,rst,en,address,dout);
reg clk, rst, en;
wire [3:0]address;
wire [3:0]dout;
sar1 gg(clk, rst, en, address, dout);
always @(posedge clk)
  initial begin
#5
address=4'b0000;
#5
address=4'b0001;
#5
address=4'b0010;
#5
address=4'b0011;
#5
address=4'b0100;
#5
address=4'b0101;
#5
address=4'b0110;
#5
address=4'b0111;
#5
address=4'b1000;
#5
address=4'b1001;
#5
address=4'b1010;
#5
address=4'b1011;
#5
address=4'b1100;
#5
address=4'b1101;
#5
address=4'b1110;
#5
address=4'b1111;
#5
$finish;
end

endmodule*/

