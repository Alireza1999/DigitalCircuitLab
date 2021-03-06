module Multiplexer_2_1 (w0, w1, s, f);
 input [0:63] w0;
 input [0:63] w1;
 input s;
 output reg [0:63] f;

  always @(w0, w1, s)
   if (s == 0)
     f = w0;
   else
     f = w1;
endmodule

//test bench //

module mux_tb();

reg [0:63] w0,w1;
wire [0:63] f;
reg s;

Multiplexer_2_1 mux1(w0,w1,s,f);

initial
begin 

w0=0;
w1=12;
s=0;
#100;

w0=135;
w1=1;
s=1;
#100;

w0=95;
w1=0;
s=0;
#100;

w0=10;
w1=102;
s=1;
#100;

w0=0;
w1=12;
s=0;
#100;

end
endmodule