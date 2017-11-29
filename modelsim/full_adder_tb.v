//-------------------------------------------------------------
// ENGI 4054: Digital VLSI Design
// Author: Craig Macsemchuk & Natalie Marcinkowski
//
// Filename: full_adder_tb.v
// Date: Nov. 27th, 2017
// Description: Testbench for full-adder
//-------------------------------------------------------------
`timescale 1ns/1ns
module full_adder_tb();
//----------WIRE/REG---------------------
   reg clk;
   reg rst;
//---------------------------------------
// Full Adder
//---------------------------------------
   reg a_f,b_f,c_f;
   wire a_f_d,b_f_d,c_f_d;

//----------CLOCK-GEN--------------------
initial
  begin
     clk = 1'b0;
   end
always
   begin
      #1 clk = !clk;
   end

initial // Testing begin, start your engines.
   begin
      rst <= 1;

//---------------------------------------
// Full Adder Test
//---------------------------------------
      a_f <= 1'b0;
      b_f <= 1'b0;
      c_f <= 1'b0;
      #100;
      a_f <= 1'b1;
      b_f <= 1'b0;
      c_f <= 1'b0;
      #100;
      a_f <= 1'b0;
      b_f <= 1'b1;
      c_f <= 1'b0;
      #100;
      a_f <= 1'b1;
      b_f <= 1'b1;
      c_f <= 1'b0;
      #100;
      a_f <= 1'b1;
      b_f <= 1'b1;
      c_f <= 1'b1;	
   

end
///---------------------------------------
// Full Adder Instantiation
//---------------------------------------
dff_sync full_sync_a(
	.rst_n(rst),
	.clk(clk),
	.in_sync(a_f),
	.sync_out(a_f_d)
);
dff_sync full_sync_b(
	.rst_n(rst),
	.clk(clk),
	.in_sync(b_f),
	.sync_out(b_f_d)
);
dff_sync full_sync_c(
	.rst_n(rst),
	.clk(clk),
	.in_sync(c_f),
	.sync_out(c_f_d)
);
full_adder_core full_adder_test(
	.rst_n(rst),
	.clk(clk),
	.in_a(a_f_d),
	.in_b(b_f_d),
	.in_c(c_f_d),
	.s_out(sum_full),
	.c_out(carry_full)
);
endmodule