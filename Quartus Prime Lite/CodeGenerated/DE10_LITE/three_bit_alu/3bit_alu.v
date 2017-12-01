//-------------------------------------------------------------
// ENGI 4054: Digital VLSI Design
// Author: Craig Macsemchuk & Natalie Marcinkowski
//
// Filename: 3bit_alu.v
// Date: Nov. 27th, 2017
// Description: **TODO
//
// Inputs: 
// Outputs: 
//-------------------------------------------------------------

module alu_core(
   input [2:0]a,
   input [2:0]b,
   input [1:0]op_code,
   input rst_n,
   input bbclk,
   output reg [5:0]op_out,
   output reg carry_out
);


wire [5:0]bw_and_out;
wire [5:0]bw_or_out;
wire [5:0]add_out;
wire [5:0]multi_out;
wire carry;


           //dff_sync sync_a0(rst_n,bbclk,a[0],a_d[0]);
          // dff_sync sync_a1(rst_n,bbclk,a[1],a_d[1]);
          // dff_sync sync_a2(rst_n,bbclk,a[2],a_d[2]); //Scary, please fix
           //dff_sync sync_b0(rst_n,bbclk,b[0],b_d[0]);
           //dff_sync sync_b1(rst_n,bbclk,b[1],b_d[1]);
           //dff_sync sync_b2(rst_n,bbclk,b[2],b_d[2]);

           //dff_sync sync_op1(rst_n,bbclk,b[2],b_d[2]);
           //dff_sync sync_op2(rst_n,bbclk,b[2],b_d[2]);

   bitwise_and u_one(a,b,bw_and_out);
   bitwise_or u_two(a,b,bw_or_out);
   three_bit_full_adder_core u_three(a,b,add_out,carry);
   three_bit_multiplier u_four(a,b,multi_out);

always @ (posedge bbclk or negedge rst_n)
   begin
      if (!rst_n)
         begin

         op_out <= 6'b000000;

         carry_out <= 1'b0;
        end 
     else     
   begin
   case(op_code)
   2'b00:op_out = bw_and_out;
   2'b01:op_out <= bw_or_out;
   2'b10:begin
         op_out <= add_out;
         carry_out <= carry;
         end
   2'b11:op_out <= multi_out;
	
   endcase
 end
        end
   

endmodule 