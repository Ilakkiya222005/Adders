module parallel_adder(p0,p1,p2,p3,p4,p5,p6,p7,sum,clk);
  input p0[3:0],p1[3:0],p2[3:0],p3[3:0],p4[3:0],p5[3:0],p6[3:0],p7[3:0];
  input clk;
  wire w0[12:0];
  wire w1[12:0];
  wire w2[12:0];
  wire w3[12:0];
  wire w4[13:0];
  wire w5[13:0];
  output sum[14:0];
  begin
  always @(posedge clk)
  begin
      w0=p0[0]+p0[1]+p0[2]+p0[3]+p1[0]+p1[1]+p1[2]+p1[3];
      w1=p2[0]+p2[1]+p2[2]+p2[3]+p3[0]+p3[1]+p3[2]+p3[3];
      w2=p4[0]+p4[1]+p4[2]+p4[3]+p5[0]+p5[1]+p5[2]+p5[3];
      w3=p6[0]+p6[1]+p6[2]+p6[3]+p7[0]+p7[1]+p7[2]+p7[3];
  end
  always @(posedge clk)
  begin
    w4=w0+w1;
    w5=w2+w3;
  end
  always @(posedge clk)
  begin
    sum=w4+w5;
  end
 end
endmodule
      
  
  
  