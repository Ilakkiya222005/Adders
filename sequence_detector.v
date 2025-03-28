//non overlapping mealy
/*module div(clk,rst,q);
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
   assign q=sig[24]; 
endmodule*/

module sequence_detector(clk,rst,x,out);
  input clk, rst, x;
  output reg out;
  reg[2:0] cs,ns; 
  parameter a=3'b000,
            b=3'b001,
            c=3'b010,
            d=3'b011,
            e=3'b100,
            f=3'b101;
  always @(posedge clk)
    if(rst)
      begin
        ns<=a;
    end
  else
    begin
      cs<=ns;
  end
  always @(cs or x)
  begin 
    case(cs)
      a:
      begin
      ns=x?b:a;
      out=1'b0;
    end
      b:begin
      ns=x?b:c;
      out=1'b0;
    end
      c:begin
      ns=x?d:a;
      out=1'b0;
    end
      d:begin
      ns=x?e:c;
      out= 1'b0;

    end
      e:begin
      ns=x?b:f;
      out =1'b0;
    end
      f:begin
      ns=x?b:a;
      out=1'b1;
    end
      default: 
         begin
         ns=3'b000;
         out=1'b0;
       end
    endcase
  end
endmodule
          
            
  
  