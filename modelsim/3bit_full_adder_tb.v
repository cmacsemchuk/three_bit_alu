//-------------------------------------------------------------
// ENGI 4054: Digital VLSI Design
// Author: Craig Macsemchuk & Natalie Marcinkowski
//
// Filename: three_bit_full_adder_tb.v
// Date: Nov. 27th, 2017
// Description: Testbench for  3-bit full-adder
//-------------------------------------------------------------
`timescale 1ns/1ps
module three_bit_full_adder_tb();
//----------WIRE/REG---------------------
   reg clk;
   reg rst;
//---------------------------------------
// Full Adder
//---------------------------------------
   reg [2:0]a; //First bit
   wire [2:0]a_d;
 
   reg [2:0]b; //Second bit
   wire [2:0]b_d;

   reg [2:0]c; //Third bit
   wire [2:0]c_d;
   
   wire [5:0]sum;
   wire carry;

//----------CLOCK-GEN--------------------
initial
  begin
     clk = 1'b0;
   end
always
   begin
      #0.5 clk = !clk;
   end

initial // Testing begin, start your engines.
   begin
      rst <= 1;

//---------------------------------------
// Full Adder Test
//---------------------------------------
      a <= 3'b000;
      b <= 3'b000;
      c <= 3'b000;
      #3;
      a <= 3'b001;
      b <= 3'b001;
      c <= 3'b001;
      #3;
      a <= 3'b001;
      b <= 3'b010;
      c <= 3'b100;
      #3;
      a <= 3'b001;
      b <= 3'b001;
      c <= 3'b000;
      #3;
      a <= 3'b111;
      b <= 3'b100;
      c <= 3'b101;	
   

end
///---------------------------------------
// Full Adder Instantiation
//---------------------------------------
dff_sync full_sync_a1(
	.rst_n(rst),
	.clk(clk),
	.in_sync(a[0]),
	.sync_out(a_d[0])
);
dff_sync full_sync_b1(
	.rst_n(rst),
	.clk(clk),
	.in_sync(b[0]),
	.sync_out(b_d[0])
);
dff_sync full_sync_c1(
	.rst_n(rst),
	.clk(clk),
	.in_sync(c[0]),
	.sync_out(c_d[0])
);
dff_sync full_sync_a2(
	.rst_n(rst),
	.clk(clk),
	.in_sync(a[1]),
	.sync_out(a_d[1])
);
dff_sync full_sync_b2(
	.rst_n(rst),
	.clk(clk),
	.in_sync(b[1]),
	.sync_out(b_d[1])
);
dff_sync full_sync_c2(
	.rst_n(rst),
	.clk(clk),
	.in_sync(c[1]),
	.sync_out(c_d[1])
);
dff_sync full_sync_a3(
	.rst_n(rst),
	.clk(clk),
	.in_sync(a[2]),
	.sync_out(a_d[2])
);
dff_sync full_sync_b3(
	.rst_n(rst),
	.clk(clk),
	.in_sync(b[2]),
	.sync_out(b_d[2])
);
dff_sync full_sync_c3(
	.rst_n(rst),
	.clk(clk),
	.in_sync(c[2]),
	.sync_out(c_d[2])
);
three_bit_full_adder_core three_bit_full_adder_test( //DO THIS RIGHT MAN
	.rst_n(rst),
	.clk(clk),
	.in_a(a_d),
	.in_b(b_d),
	.in_c(c_d),
	.s_out(sum),
	.c_out(carry)
);
endmodule