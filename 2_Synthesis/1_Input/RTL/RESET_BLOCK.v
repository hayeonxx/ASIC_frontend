module RESET_BLOCK (
  input  pclk,
  input  sys_clk,
  input  sys_2x_clk,
  input  sdram_clk,
  input  prst_n,
  input  test_mode,
  output pci_rst_n,
  output sdram_rst_n,
  output sys_rst_n,
  output sys_2x_rst_n
);

  reg prst_ff;
  reg sdram_rst_ff;
  reg sys_rst_ff;
  reg sys_2x_rst_ff;

  reg pci_rst_n_buf;
  reg sys_rst_n_buf;
  reg sys_2x_rst_n_buf;
  reg sdram_rst_n_buf;

  // Reset the PCI and SDRAM domains:
  always @(posedge pclk or negedge prst_n) begin
    if (!prst_n) begin
      prst_ff <= 1'b0;
      pci_rst_n_buf <= 1'b0;
    end else begin
      prst_ff <= 1'b1;
      pci_rst_n_buf <= prst_ff;
    end
  end

  // Reset the SDRAM domain:
  always @(posedge sdram_clk or negedge prst_n) begin
    if (!prst_n) begin
      sdram_rst_ff <= 1'b0;
      sdram_rst_n_buf <= 1'b0;
    end else begin
      sdram_rst_ff <= 1'b1;
      sdram_rst_n_buf <= sdram_rst_ff;
    end
  end

  // Reset the system clock domains:
  always @(posedge sys_clk or negedge prst_n) begin
    if (!prst_n) begin
      sys_rst_ff <= 1'b0;
      sys_rst_n_buf <= 1'b0;
    end else begin
      sys_rst_ff <= 1'b1;
      sys_rst_n_buf <= sys_rst_ff;
    end
  end

  // Reset the 2x system clock domain:
  always @(posedge sys_2x_clk or negedge prst_n) begin
    if (!prst_n) begin
      sys_2x_rst_ff <= 1'b0;
      sys_2x_rst_n_buf <= 1'b0;
    end else begin
      sys_2x_rst_ff <= 1'b1;
      sys_2x_rst_n_buf <= sys_2x_rst_ff;
    end
  end

  // Assign reset signals with test_mode consideration:
//  assign pci_rst_n = (!test_mode & pci_rst_n_buf) | (test_mode & prst_n);
//  assign sdram_rst_n = (!test_mode & sdram_rst_n_buf) | (test_mode & prst_n);
//  assign sys_rst_n = (!test_mode & sys_rst_n_buf) | (test_mode & prst_n);
//  assign sys_2x_rst_n = (!test_mode & sys_2x_rst_n_buf) | (test_mode & prst_n);
  // Assign reset signals with test_mode consideration:
  assign pci_rst_n = (~test_mode && pci_rst_n_buf) || (test_mode && prst_n);
  assign sdram_rst_n = (~test_mode && sdram_rst_n_buf) || (test_mode && prst_n);
  assign sys_rst_n = (~test_mode && sys_rst_n_buf) || (test_mode && prst_n);
  assign sys_2x_rst_n = (~test_mode && sys_2x_rst_n_buf) || (test_mode && prst_n);

endmodule

