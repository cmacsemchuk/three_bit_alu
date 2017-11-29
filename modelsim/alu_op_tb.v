//-------------------------------------------------------------
// ENGI 4054: Digital VLSI Design
// Author: Craig Macsemchuk & Natalie Marcinkowski
//
// Filename: alu_op_tb.v
// Date: Nov. 27th, 2017
// Description: Testbench for ALU operations in order of half-adder,
//              full-adder, and 3 bit adder
//-------------------------------------------------------------
`timescale 1ns/1ns
module alu_op_tb();
//----------WIRE/REG---------------------
   reg clk;
   reg rst;
//---------------------------------------
// Half Adder
//---------------------------------------
   reg a_h,b_h;
   wire a_h_d,b_h_d;

   wire sum_half, carry_half;
//---------------------------------------
// Full Adder
//---------------------------------------
   reg a_f,b_f,c_f;
   wire a_f_d,b_f_d,c_f_d;
   reg sum_f,carry_f;

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
	.in_a(a_d),
	.in_b(b_d),
	.s_out(sum_half),
	.c_out(carry_half)
);

//---------------------------------------
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
/*full_adder_core full_adder_test(
	.rst_n(rst),
	.clk(clk),
	.in_a(a_f_d),
	.in_b(b_f_d),
	.in_c(c_f_d),
	.s_out(sum_full),
	.c_out(carry_full)
);*/
endmodule
