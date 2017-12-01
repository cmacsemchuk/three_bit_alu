//-------------------------------------------------------------
// ENGI 4054: Digitial VLSI Design
// Author: Craig Macsemchuk & Natalie Marcinkowski
//
// Filename: 3bit_full_adder_core.v
// Date: Nov. 27th, 2017
// Description: Synchonous combination of three 1-bit full-adders
//              with reset to produce a 3-bit full-adder
//
// Inputs: Two 3-bit numbers to be added (in_a,in_b),
//         a clock signal, and reset signal
// Outputs: A 6-bit number s_out which is the resultant sum
//          and a 1-bit number c_out which indicates a carry
//          from summation
//-------------------------------------------------------------

module three_bit_full_adder_core(
   input [2:0]in_a, // 3-bit augend
   input [2:0]in_b, // 3-bit addend
   output [5:0]s_out, //6-bit summation out
   output c_out //summation carry out
);

//----------WIRE/REG---------------------
wire carry_one_w;
wire carry_two_w;
reg s_final_reg[2:0];

//-----------MODULE-INSTANTIATE-----------
half_adder_core ha_one( //FA1
   .in_a(in_a[0]),
   .in_b(in_b[0]),
   .s_out(s_out[0]),
   .c_out(carry_one_w) //output to carry reg
);
full_adder_core fa_two( //FA2
   .in_a(in_a[1]),
   .in_b(in_b[1]),
   .in_c(carry_one_w),
   .s_out(s_out[1]), 
   .c_out(carry_two_w) //output to carry reg
);
full_adder_core fa_three( //FA3
   .in_a(in_a[2]),
   .in_b(in_b[2]),
   .in_c(carry_two_w),
   .s_out(s_out[2]), 
   .c_out(c_out) //output to carry reg
);
endmodule 
