module main_buff (
    clk, rst, writeEn, 
    address, memory_input,buff_out
  );

  input clk, rst, writeEn;
  input [5:0] address;
  input [31:0] memory_input;
  output reg [7:0] buff_out [0:3];

  reg [7:0] memory [0:7][0:7];

  integer i, j;
  always @(posedge clk or posedge rst)
  begin
    if (rst)
    begin
        for (i = 0; i < 8; i = i + 1)
          for (j = 0; j < 8; j = j + 1)
            memory[i][j] <= 8'h00;
    end
    else if (writeEn)  //write
    begin
        memory[address / 2][(address % 2) * 4] <= memory_input [7:0];
        memory[address / 2][(address % 2) * 4 + 1] <= memory_input [15:8];
        memory[address / 2][(address % 2) * 4 + 2] <= memory_input [23:16];
        memory[address / 2][(address % 2) * 4 + 3] <= memory_input [31:24];
    end
  end

  always @(address)  //read
  begin
    begin
      for (i = 0; i < 4; i = i + 1)
        buff_out [i] <= memory[i * 2 + address / 8][address % 8];
    end
  end

endmodule
