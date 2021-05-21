module shift(in,out);
input [63:0] in;
output [63:0] out;

assign out = {in[62:0],0};

endmodule
