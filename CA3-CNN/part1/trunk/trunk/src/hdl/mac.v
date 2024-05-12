module mac #(parameter N)(
  input clk, reset, start,
  output ready
);
  wire  writeEnbuff, w_r_EnMem, wEnWindow, rEnConv, ldConvDone, addEn, winRst, wEnMem, wrofm;
  wire [5:0] buffCount, filterCount, winCount, convCount;
  wire [9:0] memAddress;
  wire [5:0] buffAddress;
  wire [7:0] ofmaddr;
  wire [N-1:0]wEnFilter;

//give parameter
  DataPath #(.N(N)) dp(
             .clk(clk),
             .rst(reset),
             .wEnBuff(writeEnbuff),
             .w_r_EnMem(wEnMem),
             .wEnFilter(wEnFilter),
             .writeEnwindow(wEnWindow),
             .readEnmac(rEnConv),
             .addEn(addEn),
             .winRst(winRst),
             .filterCount(filterCount),
             .macCount(convCount),
             .memAddress(memAddress),
             .buffAddress(buffAddress),
             //new
             .wrofm(wrofm),
             .ofmaddr(ofmaddr)
           );

           

  Controller #(.N(N)) ct(
               .clk(clk),
               .rst(reset),
               .start(start),
               .ready(ready),
               .writeEnbuff(writeEnbuff),
               .writeEnmem(wEnMem),
               .writeEnFilter(wEnFilter),
               .wEnWindow(wEnWindow),
               .rEnConv(rEnConv),
               .ldConvDone(ldConvDone),
               .addEn(addEn),
               .winRst(winRst),
               .buffCount(buffCount),
               .filtertemp(filterCount),
               .winCount(winCount),
               .convCount(convCount),
               .memAddress(memAddress),
               .buffAddress(buffAddress),
               //new
               .wrofm(wrofm),
               .ofmaddr(ofmaddr)
             );


endmodule
