`timescale 1ns/100ps

module tb_not_gate();
	reg a;
	wire o;

	not_gate u_not_gate(
		.a(a),
		.o(o)
	);

	initial begin
		a = 1'b0;
		#10 a = 1'b1;
		#10 a = 1'b0;
		#10 a = 1'b1;
	end
	
	initial begin
		$display("%t: %b - %b", $time, a, o);
		#10 $display("%t: %b - %b", $time, a, o);
		#10 $display("%t: %b - %b", $time, a, o);
		#10 $display("%t: %b - %b", $time, a, o);
		#10 $finish;
	end

	initial begin
		$fsdbDumpfile("top.fsdb");
		$fsdbDumpvars(0);
	end

endmodule

