module booth_mul(a,b,clk,ans);
  input[4:0]a;
  input[4:0]b;
  input clk;
  output reg[9:0]ans;
  reg[9:0]temp=10'b0;
  reg[5:0]b1;
  reg[1:0]s;
  integer i=0;
  always @(posedge clk)
  begin
    b1=1'b0;
    ans=10'b0;
    for(i=0;i<=4;i=i+1)
    begin
      s=b1>>i;
      case(s)
        2'b00:
        temp=0;
        2'b01:
        temp=a;
        2'b10:
        temp=~({5'b00000,a})+1;
        2'b11:
        temp=0;
      endcase
      temp=temp<<i;
      ans=ans+temp;
    end
  end
endmodule