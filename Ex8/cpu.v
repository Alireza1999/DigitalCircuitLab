module cpu;

wire clk;
wire write=1;
reg clear;

wire zero;

//Controls
wire branch;
wire memory_read;
wire memory_to_register;
wire alu_optcode = 12'b1x0000000111;
wire memory_write;
wire alu_source;
wire register_write;

//Instruction Memory
wire read_data, write_data, write_en;
wire [63:0] instruction_memory_output;

wire [63:0] pc_output;

wire [63:0] multiplexer_after_adder_to_pc;
wire [63:0] default_adder_for_pc;
wire [63:0] adder_shift_for_pc;

wire [63:0] shift_left_to_adder;

wire [63:0] immediate_generator_output;

wire [63:0] register_bank_read_data_one_output;
wire [63:0] register_bank_read_data_two_output;

wire [63:0] alu_result;

wire [3:0] alu_control_output;

wire [63:0] multiplexer_after_register_bank_output;

wire [63:0] data_memory_read_data;

initial begin
    clear = 1;
    #10 clear = 0;
end

clock myClock(
    .clk(clk));

instruction_memory inst_mem(
    .clk(clk),
    .address(pc_output),
    .read_data(read_data),
    .write_data(write_data),
    .output_data(instruction_memory_output),
    .write_en(write_en)
);

register_bank reg_bank(
    .read_register_one(instruction_memory_output[19:15]),
    .read_register_two(instruction_memory_output[24:20]),
    .write_register(instruction_memory_output[11:7]),
    .write_data(multiplexer_after_data_memory_output),
    .register_write(register_write),
    .clk(clk),
    .read_data_one(register_bank_read_data_one_output),
    .read_data_two(register_bank_read_data_two_output)
);

register pc(
    .clear(clear),
    .write(write),
    .clk(clk),
    .out(pc_output),
    .data(multiplexer_after_adder_to_pc)
);

multiplexer mux_after_adder(
    .out(multiplexer_after_adder_to_pc),
    .option_one(default_adder_for_pc),
    .option_two(adder_shift_for_pc),
    .select(zero & branch)
);

multiplexer mux_after_register_bank(
    .out(multiplexer_after_register_bank_output),
    .option_one(register_bank_read_data_two_output),
    .option_two(immediate_generator_output),
    .select(alu_source)
);

multiplexer mux_after_data_memory(
    .out(multiplexer_after_data_memory_output),
    .option_one(data_memory_read_data),
    .option_two(alu_result),
    .select(memory_to_register)
);

adder default_adder(
    .out(default_adder_for_pc),
    .data_one(pc_output),
    .data_two(64'b100)
);

adder shift_adder_for_pc(
    .out(adder_shift_for_pc),
    .data_one(pc_output),
    .data_two(shift_left_to_adder)
);

shift left_shift(//Should check
    .in(immediate_generator_output),
    .out(shift_left_to_adder)
);

alu alu_base(
    .zero(zero),
    .input_one(register_bank_read_data_one_output),
    .input_two(multiplexer_after_register_bank_output),
    .result(alu_result),
    .control(alu_control_output)
);

alu_control alu_controller(
    .ALUOp(alu_optcode),
    .instruction({instruction_memory_output[30], instruction_memory_output[14:12]}),
    .ALUIn(alu_control_output)
);

immediate_generator imm_gen(
    .in(instruction_memory_output),
    .out(immediate_generator_output),
    .clk(clk)
);

data_memory data_mem(
    .address(alu_result),
    .write_data(register_bank_read_data_two_output),
    .read_data(data_memory_read_data),
    .memory_write(memory_write),
    .memory_read(memory_read),
    .clk(clk)
);

control controller(
    .instruction1(instruction_memory_output[6:0]),
    .branch(branch),
    .memRead(memory_read),
    .memToReg(memory_to_register),
    .ALUOp(alu_optcode),
    .memWrite(memory_write),
    .ALUSrc(alu_source),
    .regWrite(register_write)
);

endmodule;