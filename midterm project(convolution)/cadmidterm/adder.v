module adder (
  input [11:0] a,
  input [7:0] b,
  input clk,rst,add_en,
  output reg [11:0] sum
);

always @(posedge clk) 
begin
  if (rst) 
    sum <= 12'd0;
  else if (add_en)
    sum <= a + b;
end

endmodule



