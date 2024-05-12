module Register (clk, rst, ld, din, dout);
    parameter N = 32;

    input clk, rst, ld;
    input [N-1:0] din;
    output [N-1:0] dout;

    reg [N-1:0] dout;

    always @(posedge rst or posedge clk) begin
        if (rst)
            dout <= 0;
        else if (ld)
            dout <= din;
    end
endmodule