module adder(data_one, data_two, out);
input [63:0] data_one, data_two;
output [63:0] out;

assign out = data_one + data_two;

endmodule;