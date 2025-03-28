module dual_rom(
input clk,
input [5:0]ad,
output reg [7:0]d,

wire [7:0]d_next,
reg [63:0] mem_data [7:0],
reg [7:0] byte_data
);
assign loc0=64'h0000000000000001;
assign loc1=64'h0000000000000002;
assign loc2=64'h0000000000000003;
assign loc3=64'h0000000000000004;
assign loc4=64'h0000000000000005;
assign loc5=64'h0000000000000006;
assign loc6=64'h0000000000000012;
assign loc7=64'h0000000000011301;
always@(loc1 or loc2 or loc3 or loc4 or loc5 or loc6 or loc7)
begin
  mem[0]=loc0;
  mem[1]=loc1;
  mem[2]=loc2;
  mem[3]=loc3;
  mem[4]=loc4;
  mem[5]=loc5;
  mem[6]=loc6;
  mem[7]=loc7;
end
always@(mem_data)
begin
  byte_data[0]=mem_data[63:56];
  byte_data[1]=mem_data[55:48];
  byte_data[2]=mem_data[47:40];
  byte_data[3]=mem_data[39:32];
  byte_data[4]=mem_data[31:24];
  byte_data[5]=mem_data[23:16];
  byte_data[6]=mem_data[15:8];
  byte_data[7]=mem_data[7:0];
end
assign mem_data=mem[d[5:3]];
assign d_next=byte_data[d[2:0]];
always@(posedge clk)
begin
  d<=d_next;
end
endmodule
  
  
  

