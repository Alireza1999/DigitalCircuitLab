module instruction_memory(clk, address, read_data, output_data, write_data, write_en);
integer i;
parameter n = 64;

input clk, write_en;
input[n-1:0] address;
input[n-1:0] read_data;
output [n-1:0] output_data;
output reg [n-1:0] write_data;

reg[n-1:0] ram [0:255];

initial 
  begin
    for(i = 0; i < 256; i = i + 1)
       ram[i] = i;	
  end
begin
	//r-type
 	ram[0] = 64'b00110011;
	//sd
	ram[1] = 64'b01000111;
	//ld
	ram[2]= 64'b00000011;
	//beq
	ram[3]= 64'b01100011;
end

 assign output_data [7:0] = 8'b00110011;
 assign output_data [63:8] = 56'b0;
endmodule;