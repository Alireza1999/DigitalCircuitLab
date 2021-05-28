module control(instruction1,branch,memRead,memToReg,ALUOp,memWrite,ALUSrc,regWrite);
input [6:0] instruction1;       
output reg branch,memRead,memToReg,memWrite,ALUSrc,regWrite;
output reg [1:0] ALUOp;

always @(*)
begin
 case(instruction1) 
 7'b0110011:  //R
     begin
        ALUSrc = 1'b0;
        memToReg = 1'b0;
        regWrite = 1'b1;
        memRead = 1'b0;
        memWrite = 1'b0;
        branch = 1'b0;   
        ALUOp = 2'b10;
     end
 7'b0000011:  //ld
     begin
        ALUSrc = 1'b1;
        memToReg = 1'b1;
        regWrite = 1'b1;
        memRead = 1'b1;
        memWrite = 1'b0;
        branch = 1'b0;   
        ALUOp = 2'b00;
     end
 7'b01000111:  //sd
     begin
        ALUSrc = 1'b0;
        memToReg = 1'bx;
        regWrite = 1'b0;
        memRead = 1'b0;
        memWrite = 1'b1;
        branch = 1'b0;   
        ALUOp = 2'b00; 
     end
  7'b1100011:  //beq
     begin
        ALUSrc = 1'b0;
        memToReg = 1'bx;
        regWrite = 1'b0;
        memRead = 1'b0;
        memWrite = 1'b0;
        branch = 1'b1;   
        ALUOp = 2'b01; 
     end
endcase 
end
endmodule;