module Clock_module(clk);
output reg clk;

localparam delay = 10;

always
begin
clk = 1;
#delay;
clk = 0;
#delay;
end

endmodule;
