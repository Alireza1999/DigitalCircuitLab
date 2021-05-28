module register(clear, write, data, out, clk);

parameter n = 64;

input clk;
input clear, write;
input [n-1:0] data;
output reg [n-1:0] out;

//Init

always@(posedge clk)
begin

if(clear)
  begin
    out <= 0;
  end

else
  begin
    if(write)
      out = data;
  end

end

endmodule;