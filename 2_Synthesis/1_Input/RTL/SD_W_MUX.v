module SD_W_MUX (
  input [31:0] blender_data,
  input [31:0] pci_read_data,
  input [31:0] risc_result_data,
  input [1:0] sd_w_select,
  output [31:0] sd_wfifo_data
);
  
  assign sd_wfifo_data = (sd_w_select == 2'b01) ? blender_data :
                         (sd_w_select == 2'b10) ? risc_result_data :
                         pci_read_data;

endmodule
