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
module three_bit_multiplier(
   input [2:0]a,
   input [2:0]b,
   output [5:0]product_out //bitwise AND out
);
//----------WIRE/REG---------------------
//---------------------------------------
// BIT ONE
//---------------------------------------
   wire a0_and_b1_w;
   wire a1_and_b0_w;
   wire carry_one_w;
   
//---------------------------------------
// BIT TWO
//---------------------------------------
   wire a2_and_b0_w;
   wire a1_and_b1_w;
   wire a0_and_b2_w;
   wire carry_two_full_w;
   wire carry_two_half_w;
   wire full_two_out_w;
   
//---------------------------------------
// BIT THREE
//---------------------------------------
   wire a2_and_b1_w;
   wire a1_and_b2_w;
  
   wire carry_three_full_w;
   wire carry_three_half_w;
   wire half_three_out_w; 

//---------------------------------------
// BIT FOUR
//---------------------------------------
   wire a2_and_b2_w; 

//-----------MODULE-INSTANTIATE-----------
//---------------------------------------
// BIT ZERO
//---------------------------------------
   and and_a0_b0(product_out[0], a[0],b[0]);

//---------------------------------------
// BIT ONE
//---------------------------------------
   and and_a0_b1(a0_and_b1_w, a[0], b[1]);
   and and_a1_b0(a1_and_b0_w, a[1], b[0]);
   
   half_adder_core ha_one(a0_and_b1_w,a1_and_b0_w,product_out[1],carry_one_w);

//---------------------------------------
// BIT TWO
//---------------------------------------
   and and_a2_b0(a2_and_b0_w, a[2], b[0]);
   and and_a1_b1(a1_and_b1_w, a[1], b[1]);
   and and_a0_b2(a0_and_b2_w, a[0], b[2]);
   
   full_adder_core fa_two(a1_and_b1_w,a2_and_b0_w,carry_one_w,full_two_out_w,carry_two_full_w);
   half_adder_core ha_two(a0_and_b2_w,full_two_out_w,product_out[2],carry_two_half_w);
   
//---------------------------------------
// BIT THREE
//---------------------------------------
   and and_a2_b1(a2_and_b1_w, a[2], b[1]);
   and and_a1_b2(a1_and_b2_w, a[1], b[2]);
   
   half_adder_core ha_three(carry_two_full_w,a2_and_b1_w,half_three_out_w,carry_three_half_w);
   full_adder_core fa_three(half_three_out_w,a1_and_b2_w,carry_two_half_w,product_out[3],carry_three_full_w);

//---------------------------------------
// BIT FOUR
//---------------------------------------
   and and_a2_b2(a2_and_b2_w, a[2], b[2]);
   
   full_adder_core fa_four(carry_three_half_w,a2_and_b2_w,carry_three_full_w,product_out[4],product_out[5]);


endmodule
