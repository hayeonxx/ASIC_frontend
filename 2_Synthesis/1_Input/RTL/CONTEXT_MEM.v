module CONTEXT_MEM (
    	input sys_clk,
    	input sys_rst_n,
    	input context_en,
    	input [7:0] cmd,
    	input [31:0] pci_data_in,
    	output reg [31:0] pci_context_data
);

  	wire ti_hi = 1;
  	wire ti_low = 0;
        wire [31:0] bus_hi = 32'b1;
  	reg [31:0] pci_data_in_buf;
  	reg [31:0] context_data_0;
  	reg [31:0] context_data_1;
  	reg [31:0] context_data_2;
  	reg [31:0] context_data_3;
  	reg [5:0] ram_write_addr;
  	reg [5:0] ram_read_addr;
  	reg [2:0] read_op;
  	reg [3:0] write_op;
  	reg [3:0] ram_write_cs;
  	reg we_n;

	always  
	begin
		read_op <= cmd[2:0];
		write_op <= cmd[6:3];
		we_n <= cmd[7];
		pci_data_in_buf <= pci_data_in;
	end

	// read_addr_gen
	always @(posedge sys_clk or negedge sys_rst_n)
	begin
		if (!sys_rst_n)
		begin
			ram_read_addr <= 6'b000000;
		end
		else 
		begin
			if (context_en && read_op[2]) 
			begin
      				ram_read_addr <= ram_read_addr + 1;
    			end 
			else if (context_en && !read_op[2]) 
			begin
      				ram_read_addr <= ram_read_addr + 1;
    			end
			else
			begin
				ram_read_addr <= ram_read_addr;
			end
  		end
	end

	// ram_chip_sel_decode
	always @(write_op) 
	begin
		case (write_op[1:0])
			2'b00: ram_write_cs <= 4'b1000;
      			2'b01: ram_write_cs <= 4'b0100;
      			2'b10: ram_write_cs <= 4'b0010;
      			default: ram_write_cs <= 4'b0001;
    		endcase
  	end

	// write_addr_gen
	always @(posedge sys_clk or negedge sys_rst_n)
	begin
		if (!sys_rst_n)
		begin
			ram_write_addr <= 6'b000000;
		end
		else
		begin
			if (!write_op[3]) 
			begin
      				ram_write_addr <= 6'b000000;
    			end 
			else if (context_en && write_op[2]) 
			begin
      				ram_write_addr <= ram_write_addr + 1;
    			end 
			else if (context_en && !write_op[2]) 
			begin
      				ram_write_addr <= ram_write_addr + 1;
			end
			else
			begin
				ram_write_addr <= ram_write_addr;
			end
	    	end
  	end

	// pci_context_selector
  	always @(pci_data_in, context_en, read_op, context_data_0, context_data_1, context_data_2, context_data_3) 
	begin
    		case ({context_en, read_op[1:0]})
      			3'b100: pci_context_data <= context_data_0;
      			3'b101: pci_context_data <= context_data_1;
      			3'b110: pci_context_data <= context_data_2;
      			3'b111: pci_context_data <= context_data_3;
      			default: pci_context_data <= pci_data_in;
    		endcase
  	end

  	SRAM2RW64x32 CONTEXT_RAM0 (
    		.A1(ram_write_addr),
    		.CE1(sys_clk),
    		.WEB1(we_n),
    		.OEB1(ti_hi),
    		.CSB1(ram_write_cs[0]),
    		.I1(pci_data_in_buf),
    		.I2(bus_hi),

    		.A2(ram_read_addr),
    		.CE2(sys_clk),
    		.WEB2(ti_hi),
    		.OEB2(ti_low),
    		.CSB2(ti_low),
    		.O1(),
    		.O2(context_data_0)
  	);

  	SRAM2RW64x32 CONTEXT_RAM1 (
    		.A1(ram_write_addr),
    		.CE1(sys_clk),
    		.WEB1(we_n),
    		.OEB1(ti_hi),
    		.CSB1(ram_write_cs[1]),
    		.I1(pci_data_in_buf),
    		.I2(bus_hi),

    		.A2(ram_read_addr),
    		.CE2(sys_clk),
    		.WEB2(ti_hi),
    		.OEB2(ti_low),
    		.CSB2(ti_low),
    		.O1(),
    		.O2(context_data_1)
  	);	

  	SRAM2RW64x32 CONTEXT_RAM2 (
  		.A1(ram_write_addr),
    		.CE1(sys_clk),
    		.WEB1(we_n),
    		.OEB1(ti_hi),
    		.CSB1(ram_write_cs[2]),
    		.I1(pci_data_in_buf),
    		.I2(bus_hi),

    		.A2(ram_read_addr),
    		.CE2(sys_clk),
    		.WEB2(ti_hi),
    		.OEB2(ti_low),
    		.CSB2(ti_low),
    		.O1(),
    		.O2(context_data_2)
  	);

  	SRAM2RW64x32 CONTEXT_RAM3 (
    		.A1(ram_write_addr),
    		.CE1(sys_clk),
    		.WEB1(we_n),
    		.OEB1(ti_hi),
    		.CSB1(ram_write_cs[3]),
    		.I1(pci_data_in_buf),
    		.I2(bus_hi),

    		.A2(ram_read_addr),
    		.CE2(sys_clk),
    		.WEB2(ti_hi),
    		.OEB2(ti_low),
    		.CSB2(ti_low),
    		.O1(),
    		.O2(context_data_3)
  	);

endmodule

