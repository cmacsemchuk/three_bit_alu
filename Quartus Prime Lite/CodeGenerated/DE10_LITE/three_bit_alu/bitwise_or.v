//-------------------------------------------------------------
// ENGI 4054: Digital VLSI Design
// Author: Craig Macsemchuk & Natalie Marcinkowski
//
// Filename: bitwise_or.v
// Date: Nov. 27th, 2017
// Description: Synchonous bitwise OR operation for 3-bit numbers
//
// Inputs: Two 3-bit vectors to be OR'd
// Outputs: One 3-bit vector which is the resultant
//          of the bitwise OR operation
//-------------------------------------------------------------

module bitwise_or(
   input [2:0]a,
   input [2:0]b,
   output [5:0]bw_out //bitwise OR out
);

   or or_one(bw_out[0],a[0],b[0]);
   or or_two(bw_out[1],a[1],b[1]);
   or or_three(bw_out[2],a[2],b[2]);

   assign bw_out[5:3] = 3'b000;

endmodule
