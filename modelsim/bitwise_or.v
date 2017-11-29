//-------------------------------------------------------------
// ENGI 4054: Digitial VLSI Design
// Author: Craig Macsemchuk & Natalie Marcinkowski
//
// Filename: bitwise_or.v
// Date: Nov. 27th, 2017
// Description: Synchonous bitwise OR operation for 3-bit numbers
//
// Inputs: Three sets of 1-bit numbers to be OR'd (in_a_one,in_b_one etc.),
//         a clock signal, and reset signal
// Outputs: three 1-bit number s_out etc. which is the resultant
//          of the bitwise OR operation
//-------------------------------------------------------------

module bitwise_or(
   input in_a_one, 
   input in_b_one, 
   input in_a_two, 
   input in_b_two, 
   input in_a_three, 
   input in_b_three, 
   input rst_n, // reset active low
   input clk, // sys clock
   output reg bw_one_out, //bitwise out
   output reg bw_two_out,
   output reg bw_three_out
);
//-----------MODULE-INSTANTIATE-----------

always @(posedge clk) 
   begin
      if (!rst_n) // if reset low
         begin
	 bw_one_out <= 1'b0;
         bw_two_out <= 1'b0;
         bw_three_out <= 1'b0; // make all outputs 1'b0
	 end
      else // else reset high
         begin
	 bw_one_out <= in_a_one || in_b_one; //set outputs from each seperate adder
         bw_two_out <= in_a_two || in_b_two;
         bw_three_out <= in_a_three || in_b_three;
	 end
    end
endmodule 