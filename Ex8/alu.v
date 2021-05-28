module alu(input_one, input_two, control, result, zero);

input [63:0] input_one, input_two;
input [3:0] control;

output [63:0] result;
output zero;

reg [63:0] result_temporary;
reg zero_temporary;

always@(*) begin
    zero_temporary = 0;
    case(control)
        4'b0000: #5 result_temporary = input_one & input_two;
	4'b0001: #5 result_temporary = input_one | input_two;
	4'b0010: #5 result_temporary = input_one + input_two;
	4'b0110: #5 result_temporary = input_one - input_two;
    endcase

    if(result_temporary[63:0] == 0) begin
	    zero_temporary = 1;
    end

end

assign result = result_temporary[63:0];
assign zero = zero_temporary;

endmodule;