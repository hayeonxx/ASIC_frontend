
module REG_FILE (
  input clk,
  input [6:0] Addr_A,
  input [6:0] Addr_B,
  input [6:0] Addr_C,
  input [15:0] RegPort_C,
  input Write_RegC,
  output reg [15:0] RegPort_A,
  output reg [15:0] RegPort_B
);
/*
  wire ti_low;
  wire ti_hi;
  wire we_n;
  wire [15:0] data_in;
  wire [15:0] data_out_A;
  wire [15:0] data_out_B;

  assign ti_low = 1'b0;
  assign ti_hi = 1'b1;
  assign we_n = ~Write_RegC;
  assign data_in = RegPort_C;
  assign RegPort_A = data_out_A;
  assign RegPort_B = data_out_B;
*/
  wire ti_low = 1'b0;
  wire ti_hi = 1'b1;
  reg we_n;
  reg [15:0] data_in;
  reg [15:0] data_out_A;
  reg [15:0] data_out_B;
  wire [15:0] bus_hi = 16'b1;

  always @(*) begin
   we_n <= ~Write_RegC;
   data_in <= RegPort_C;
   RegPort_A <= data_out_A;
   RegPort_B <= data_out_B;
  end


  SRAM2RW128x16 REG_FILE_A_RAM (
    .A1(Addr_C),
    .CE1(clk),
    .WEB1(we_n),
    .OEB1(ti_hi),
    .CSB1(ti_low),
    .I1(data_in),
    .I2(bus_hi),
    .A2(Addr_A),
    .CE2(clk),
    .WEB2(ti_hi),
    .OEB2(ti_low),
    .CSB2(ti_low),
    .O1(),
    .O2(data_out_A)
  );

  SRAM2RW128x16 REG_FILE_B_RAM (
    .A1(Addr_C),
    .CE1(clk),
    .WEB1(we_n),
    .OEB1(ti_hi),
    .CSB1(ti_low),
    .I1(data_in),
    .I2(bus_hi),
    .A2(Addr_B),
    .CE2(clk),
    .WEB2(ti_hi),
    .OEB2(ti_low),
    .CSB2(ti_low),
    .O1(),
    .O2(data_out_B)
  );

endmodule
