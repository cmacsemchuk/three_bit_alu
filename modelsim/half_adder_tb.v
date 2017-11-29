
//-------------------------------------------------------------
// ENGI 4054: Digital VLSI Design
// Author: Craig Macsemchuk & Natalie Marcinkowski
//
// Filename: half_adder_tb.v
// Date: Nov. 27th, 2017
// Description: Testbench for half-adder
//-------------------------------------------------------------
`timescale 1ns/1ns
module half_adder_tb();
//----------WIRE/REG---------------------
   reg clk;
   reg rst;
//---------------------------------------
// Half Adder
//---------------------------------------
   reg a_h,b_h;
   wire a_h_d,b_h_d;

   wire sum_half, carry_half;

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
// Half Adder Test
//---------------------------------------
      a_h <= 1'b0;
      b_h <= 1'b0;
      #100;
      a_h <= 1'b1;
      b_h <= 1'b0;
      #100;
      a_h <= 1'b0;
      b_h <= 1'b1;
      #100;
      a_h <= 1'b1;
      b_h <= 1'b1;
      #100;
      a_h <= 1'b1;
      b_h <= 1'b1;
   end
//---------------------------------------
// Half Adder Instantiation
//---------------------------------------
dff_sync half_sync_a(
	.rst_n(rst),
	.clk(clk),
	.in_sync(a_h),
	.sync_out(a_h_d)
);
dff_sync half_sync_b(
	.rst_n(rst),
	.clk(clk),
	.in_sync(b_h),
	.sync_out(b_h_d)
);
half_adder_core half_adder_test(
	.rst_n(rst),
	.clk(clk),
	.in_a(a_h_d),
	.in_b(b_h_d),
	.s_out(sum_half),
	.c_out(carry_half)
);
endmodule 