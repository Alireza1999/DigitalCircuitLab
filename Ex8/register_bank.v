module register_bank(read_register_one, read_register_two, write_register, write_data, read_data_one, read_data_two, register_write, clk);
  output [63:0] read_data_one, read_data_two;
  input [4:0] write_register, read_register_one, read_register_two;
  input [63:0] write_data;
  input register_write;
  input clk;

  reg [63:0] registers [0:31];

integer  i;
initial 
begin
	for( i = 0; i < 32; i = i + 1)
		registers[i] = i;
end
assign read_data_one [2:0] = 3'b111;
assign read_data_one [63:3] = 61'b0; 
 //assign read_data_one = registers[read_register_one];
assign read_data_two [2:0] = 3'b101; 
assign read_data_two [63:3] = 61'b0;

  always @ (negedge clk) 
  begin
    if(register_write)
	registers[register_write] <= write_data;
  end
endmodule;