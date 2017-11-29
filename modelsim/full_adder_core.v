//-------------------------------------------------------------
// ENGI 4054: Digital VLSI Design
// Author: Craig Macsemchuk & Natalie Marcinkowski
//
// Filename: full_adder_core.v
// Date: Nov. 27th, 2017
// Description: Synchonous combination of two 1-bit half-adders
//              with reset to produce a full-adder
//
// Inputs: Two 1-bit numbers to be added (in_a,in_b),
//         a carry in (in_c), a clock signal, and reset signal
// Outputs: A 1-bit number s_out which is the resultant sum
//          and a 1-bit number c_out which indicates a carry
//          from summation
//-------------------------------------------------------------

module full_adder_core(
   input in_a, // augend
   input in_b, // addend
   input in_c, // carry-in flag
   input rst_n, // reset active low
   output s_out, //summation out
   output c_out //summation carry out
);
//----------WIRE/REG---------------------
wire s_one_w;
wire c_one_w;
wire c_two_w;
//-----------MODULE-INSTANTIATE-----------
half_adder_core ha_one( //HA1
   .in_a(in_a),
   .in_b(in_b),
   .rst_n(rst_n),
   .s_out(s_one_w), //wire from s_out HA1 to in_a HA2
   .c_out(c_one_w) //output to carry reg
);
half_adder_core ha_two( //HA2
   .in_a(s_one_w), //sum from HA1
   .in_b(in_c), //carry in
   .rst_n(rst_n),
   .s_out(s_out), //output S is final sum after each HA stage
   .c_out(c_two_w) //output to carry reg
);
   or or_one(c_out,c_one_w,c_two_w); // (HA1 carry)OR(HA2 carry)
endmodule 