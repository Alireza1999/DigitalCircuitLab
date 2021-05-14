module Cpu(inPC,PC);

input  [63:0] inPC;
output wire [63:0] PC;

wire clk;
wire [63:0] default_adder_for_pc;
wire [63:0] multiplexer_after_adder_to_pc;



Clock_module myClock(
    .clk(clk));

Mux_module mux_after_adder(
    .out(multiplexer_after_adder_to_pc),
    .option_one(default_adder_for_pc),
    .option_two(5),
    .select(0)
);

Adder_module default_adder(
    .out(PC),
    .data_one(PC),
    .data_two(64'b100)
);

endmodule;



//testbench//

module tb_cpu();
  wire [63:0] out;
  
Cpu cpu1(0,out);

initial
 begin 
	
	#100;

end

endmodule