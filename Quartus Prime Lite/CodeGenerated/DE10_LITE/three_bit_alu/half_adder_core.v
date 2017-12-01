//-------------------------------------------------------------
// ENGI 4054: Digital VLSI Design
// Author: Craig Macsemchuk & Natalie Marcinkowski
//
// Filename: half_adder_core.v
// Date: Nov. 27th, 2017
// Description: Synchronous 1-bit half-adder with reset
//
// Inputs: Two 1-bit numbers to be added (in_a,in_b),
//         a clock signal, and reset signal
// Outputs: A 1-bit number s_out which is the resultant sum
//          and a 1-bit number c_out which indicates a carry
//          from summation
//-------------------------------------------------------------

module half_adder_core(
   input in_a, // augend
   input in_b, // addend
   output s_out, //summation out
   output c_out //summation carry out
);
   xor xor_one(s_out,in_a,in_b); // in_a XOR in_b
   and and_one(c_out,in_a,in_b); // in_a AND in_b
endmodule 