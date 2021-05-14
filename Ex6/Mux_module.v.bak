module Mux_module(select, option_one, option_two, out);
input select;
input [63:0] option_one, option_two;
output reg [63:0] out;

always@(select or option_one or option_two) begin
    if(select == 0)
        out <= option_one;
    else 
        out <= option_two;
end

endmodule;

