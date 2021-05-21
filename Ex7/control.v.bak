module alu_control(ALUOp,instruction,ALUIn);
 input [1:0] ALUOp;
 input [3:0] instruction;
 output reg[3:0] ALUIn;
 wire [11:0] ALUControlIn;
 
 assign ALUControlIn = {ALUOp,instruction};
 always @(ALUControlIn)
     casex (ALUControlIn)
         12'b00xxxxxxxxxx: ALUIn=4'b0010;
         12'bx1xxxxxxxxxx: ALUIn=4'b0110;
         12'b1x0000000000: ALUIn=4'b0010;
         12'b1x0100000000: ALUIn=4'b0110;
         12'b1x0000000111: ALUIn=4'b0000;
         12'b1x0000000110: ALUIn=4'b0001;
      endcase
endmodule

