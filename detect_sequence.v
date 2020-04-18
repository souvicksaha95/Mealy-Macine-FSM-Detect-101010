`timescale 10ns/1ns

module detect_sequence(clk, in, reset, out, state);
	input clk, in, reset;
	output reg out;
	parameter s0 = 0, s1 = 1, s2 = 2, s3 = 3, s4 = 4, s5 = 5;
	reg [0:2] PS, NS;
	output reg [0:2] state;
	
always @(posedge clk or posedge reset)
	begin
		if(reset) PS <= s0;
		else 	  PS <= NS;
	end
	
always @(PS,in)
	begin
	state <= PS;
	case (PS)
		s0 : begin
				 out <= in ? 0 : 0;
				 NS <= in ? s1 : s0;
			 end
		s1 : begin
				 out <= in ? 0 : 0;
				 NS <= in ? s1 : s2;
			 end
		s2 : begin
				 out <= in ? 0 : 0;
				 NS <= in ? s3 : s0;
			 end
		s3 : begin
				 out <= in ? 0 : 0;
				 NS <= in ? s1 : s4;
			 end
 		s4 : begin
				 out <= in ? 0 : 0;
				 NS <= in ? s5 : s0;
			 end
		s5 : begin
				 out <= in ? 0 : 1;
				 NS <= in ? s1 : s4;
			 end
	endcase
	end
endmodule