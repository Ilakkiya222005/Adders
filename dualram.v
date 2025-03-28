module dp_ram(clk,ada,adb,ina,inb,ena,enb,wea,web,outa,outb);
 input clk,ena,wea,enb,web;
 input[2:0] ada,adb;
 input[1:0] ina,inb;
 output reg [3:0] outa,outb;
 reg [3:0] mem [0:3];

initial begin
  outa = 3'b000;
  outb = 3'b000;
end
always@(posedge clk)
  if(ena)begin
  if(wea)
       mem[ada]=ina;
  else
     outa = mem[ada];
end
  else
   outa = outa;
always@(posedge clk)
  if(enb)begin
  if(web)
   mem[adb]=inb;
else
   outb = mem[adb];
end
else
outb = outb;
endmodule

