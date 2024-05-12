module memory (w_out, a_out, mem_en);
  output reg [31:0] w_out [0:3][0:3];
  output reg [31:0] a_out [0:3];
  input mem_en;

  // always @(posedge mem_en) begin
  //     a_out[0] = 32'b00111110010011001100110011001101;
  //     a_out[1] = 32'b00111110110011001100110011001101;
  //     a_out[2] = 32'b00111111000110011001100110011010;
  //     a_out[3] = 32'b00111111010011001100110011001101;
  // end

  integer i, j;
  always @(posedge mem_en) begin
    for (i = 0; i < 4; i = i + 1)
    begin
      for (j = 0; j < 4; j = j + 1)
      begin
        if (i == j)
          w_out[i][j] = 32'b00111111100000000000000000000000;
        else
          w_out[i][j] = 32'b10111110010011001100110011001101;
      end
    end
    a_out[0] = 32'b00111110010011001100110011001101;
    a_out[1] = 32'b00111110110011001100110011001101;
    a_out[2] = 32'b00111111000110011001100110011010;
    a_out[3] = 32'b00111111010011001100110011001101;
  end

endmodule
