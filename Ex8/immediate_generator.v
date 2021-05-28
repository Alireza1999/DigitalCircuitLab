module immediate_generator(in, out, clk);

input[31:0] in;
output reg [63:0] out;

input clk;

wire opcode = in[1:0];

always@(posedge clk) begin
    case(opcode)
        2'b00: out <= {52'b0, in[11:0]}; //ld
        2'b01: out <= {52'b0, {in[31:25],in[11:7]}}; //sd
        2'b11 : out <= {51'b0, in[31], in[7], in[30:25], in[11:8], 1'b0};//beq
    endcase
end

endmodule;