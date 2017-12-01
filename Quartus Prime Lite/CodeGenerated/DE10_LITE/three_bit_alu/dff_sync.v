//-------------------------------------------------------------
// ENGI 4054: Digitial VLSI Design
// Author: Craig Macsemchuk & Natalie Marcinkowski
//
// Filename: dff_sync.v
// Date: Nov. 27th, 2017
// Description: Double DFF synchronizer
//
// Inputs: Three sets of 1-bit numbers to be OR'd (in_a_one,in_b_one etc.),
//         a clock signal, and reset signal
// Outputs: three 1-bit number s_out etc. which is the resultant
//          of the bitwise OR operation
//-------------------------------------------------------------

module led_dff_sync(
   input rst_n,
   input clk,
   input [9:0]in_sync,
   output reg [9:0]sync_out
);
//----------WIRE/REG---------------------

reg dff_one_out;

always @(posedge clk)
   begin 
      if (!rst_n) //if reset low 
      begin
         dff_one_out <= 10'b0000000000;  //make all outputs 1'b0
         sync_out <= 10'b0000000000;
      end
   else //if reset high
      begin
         dff_one_out <= in_sync ; // sync 1
         sync_out <= dff_one_out ;
      end
   end
endmodule
