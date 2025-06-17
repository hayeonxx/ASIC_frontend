module PCI_W_MUX (
  input [31:0] blender_data,
  input [31:0] sdram_read_data,
  input [31:0] risc_result_data,
  input [1:0] pci_w_select,
  output [31:0] pci_wfifo_data
);
  
  assign pci_wfifo_data = (pci_w_select == 2'b01) ? blender_data :
                          (pci_w_select == 2'b10) ? sdram_read_data :
                          risc_result_data;

endmodule
