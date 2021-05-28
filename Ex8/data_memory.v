module data_memory(address, write_data, read_data, memory_write, memory_read, clk);

input [63:0] address, write_data;
output reg [63:0] read_data;
input memory_write, memory_read, clk;

reg [63:0] memory [1023:0];

integer i;

initial begin
  read_data <= 0;
  for (i = 0; i < 256; i = i + 1) begin
    memory[i] = 0;
  end
end

always @(posedge clk) begin
  if (memory_write) begin
    memory[address] <= write_data;
  end

  if (memory_read) begin
    read_data <= memory[address];
  end

end

endmodule;