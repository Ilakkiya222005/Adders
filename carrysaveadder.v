module carrysaveadder(a,b,cy,o,i);
  input [3:0]a;
  input [3:0]b;
  input [3:0]cy;
  wire [3:0]s;
  wire [7:0]c;
  output [4:0]o;
  output [3:0]i;
  assign cin=0;
  
  fulladder fa1(a[0],b[0],cy[0],s[0],c[0]);
  fulladder fa2(a[1],b[1],cy[1],s[1],c[1]);
  fulladder fa3(a[2],b[2],cy[2],s[2],c[2]);
  fulladder fa4(a[3],b[3],cy[3],s[3],c[3]);
  assign o[0]=s[0];
  fulladder fa5(c[0],s[1],cin,o[1],i[0]);
  fulladder fa6(c[1],s[2],cin,o[2],i[1]);
  fulladder fa7(c[2],s[3],cin,o[3],i[2]);
  fulladder fa8(c[3],{0},cin,o[4],i[3]);
endmodule
  
  module fulladder(a,b,c,sum,carry);
    input a,b,c;
    output sum,carry;
    assign sum=a^b^c;
    assign carry=(a&b)|(c&(a^b));
endmodule