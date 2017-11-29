//-------------------------------------------------------------
// ENGI 4054: Digital VLSI Design
// Author: Craig Macsemchuk & Natalie Marcinkowski
//
// Filename: 3bit_multiplier.v
// Date: Nov. 27th, 2017
// Description: 
//
// Inputs:			**TODO
// Outputs: 
//          
//-------------------------------------------------------------
/*
module full_adder_core(
   input in_a, // augend
   input in_b, // addend
   input in_c, // carry-in flag
   output s_out, //summation out
   output c_out //summation carry out
*/
module three_bit_multiplier(
   input [2:0]a,
   input [2:0]b,
   output [5:0]product_out //bitwise AND out
);
   //Wires 
   //bit one
   wire a0_and_b0_w;
   wire a1_and_b0_w;
   wire carry_one_w;
   
   //bit two
   wire a2_and_b0_w;
   wire a1_and_b1_w;
   wire a0_and_b2_w;
   wire carry_two_full_w;
   wire carry_two_half_w;
   wire full_two_out_w;
   
   //bit three
   wire a2_and_b1_w;
   wire a1_and_b2_w;
  
   wire carry_three_full_w;
   wire carry_three_half_w;
   wire half_three_out_w; 

   //bit four
   wire a2_and_b2_w; 

   // Bit zero
   and and_a0_b1(product_out[0], a[0],b[0]);

   // Bit one
   and and_a0_b0(a0_and_b0_w, a[0], b[0]);
   and and_a1_b0(a1_and_b0_w, a[1], b[0]);
   half_adder_core ha_one(a0_and_b0_w,a1_and_b0_w,product_out[1],carry_one_wire);

   // Bit two
   and and_a2_b0(a2_and_b0_w, a[2], b[0]);
   and and_a1_b1(a1_and_b1_w, a[1], b[1]);
   and and_a0_b2(a0_and_b2_w, a[0], b[2]);
   full_adder_core fa_two(a0_and_b0_w,a1_and_b0_w,carry_one_w,stage_one_out_w,carry_two_full_w);
   half_adder_core ha_two(a0_and_b2_w,full_two_out_w,product_out[2],carry_two_half_w);
   
   // Bit three
   and and_a2_b1(a2_and_b1_w, a[2], b[1]);
   and and_a1_b2(a1_and_b2_w, a[1], b[2]);
   half_adder_core ha_three(carry_two_full,a2_and_b1_w,half_three_out_w,carry_three_half_w);
   full_adder_core fa_three(half_three_out,a1_and_b2_w,carry_two_half_w,product_out[3],carry_three_full_w);

   // Bit four
   and and_a2_b2(a2_and_b2_w, a[2], b[2]);
   full_adder_core fa_four(carry_three_half_w,a1_and_b2_w,carry_three_full_w,product_out[4],product_out[5]);




endmodule
