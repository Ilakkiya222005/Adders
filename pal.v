module pal(
  input a,b,c,d,e,f,x,y,z,
  output f1,f2);
  assign a=x&~y;
  assign b=~y&z;
  assign c=x&z;
  assign d=~x&y&~z;
  assign e=~x&~y;
  assign f=z;
  assign f1=a|b|c|d;
  assign f2=e|f;
endmodule  
