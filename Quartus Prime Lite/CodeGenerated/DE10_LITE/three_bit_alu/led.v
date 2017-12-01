//
// ENGI 4054: Digital c
//


module de10lite(
	input 		         clk,
	input carry,
	input 					rst_n,
	input 	  [9:0]	ctrl,
	input      [5:0]final_in,
	output reg [2:0]a_out,
	output reg [2:0]b_out,
	output reg [1:0]op_code_out,
	output reg [9:0]led,
	output reg [7:0]op_code_dig_one,
	output reg [7:0]op_code_dig_two,
	output reg [7:0]dig_three,
	output reg [7:0]dig_four,
	output reg [7:0]dig_five,
	output reg [7:0]dig_six
);

reg [1:0]op_code;
reg [2:0]a;
reg [2:0]b;
reg [5:0]final_out;


// connect SW to LED
always @(posedge clk)
	begin
		if (!rst_n)
		begin
			led <= 10'b1111111111 ;
			op_code_dig_one <= 8'b11000000;
			op_code_dig_two <= 8'b11000000;
			dig_three <= 8'b11000000;
			dig_four <= 8'b11000000;
			dig_five <= 8'b11000000;
			dig_six <= 8'b11000000;

	end
		else 
			
			led[9:0] <= ctrl;
			led[1] <= carry;
			op_code <= ctrl[3:2];
			op_code_out <= op_code;
			a <= ctrl[9:7];
			b <= ctrl[6:4];
			final_out <= final_in;
			a_out <= ctrl[9:7];
			b_out <= ctrl[6:4];
			
			case(op_code)
			2'b00:
					begin
						op_code_dig_one <= 8'b11000000;
						op_code_dig_two <= 8'b11000000;
					end
			2'b01:
					begin
						op_code_dig_one <= 8'b11111001;
						op_code_dig_two <= 8'b11000000;
					end
					
			2'b10:
					begin
						op_code_dig_one <= 8'b11000000;
						op_code_dig_two <= 8'b11111001;
					end
			2'b11:
					begin
						op_code_dig_one <= 8'b11111001;
						op_code_dig_two <= 8'b11111001;
					end
			endcase
			
			case(a)
			3'b000 :
					begin
						dig_six <= 8'b11000000;
					end
			3'b001 :
					begin
						dig_six <= 8'b11111001;
					end
					
			3'b010 :
					begin
				dig_six <= 8'b10100100;
					end
			3'b011 :
					begin
					dig_six <= 8'b10110000;
					end
			3'b100 :
					begin
					dig_six <= 8'b10011001;
					end
			3'b101 :
					begin
					dig_six <= 8'b10010010;
					end
			3'b110 :
					begin
				dig_six <= 8'b10000010;
					end
			3'b111:
					begin
				dig_six <= 8'b11111000;
					end
			endcase
			
			case(b)
			3'b000 :
					begin
						dig_five <= 8'b11000000;
					end
			3'b001 :
					begin
						dig_five <= 8'b11111001;
					end
			3'b010 :
					begin
				dig_five <= 8'b10100100;
					end
			3'b011 :
					begin
					dig_five <= 8'b10110000;
					end
			3'b100 :
					begin
					dig_five <= 8'b10011001;
					end
			3'b101 :
					begin
					dig_five <= 8'b10010010;
					end
			3'b110 :
					begin
				dig_five <= 8'b10000010;
					end
			3'b111:
					begin
				dig_five <= 8'b11111000;
					end
			endcase
	case(final_out)
			6'b000000 :
					begin
				dig_three <= 8'b11000000;
				dig_four <= 8'b11000000;
					end
			6'b000001 :
					begin
				dig_three <= 8'b11111001;
				dig_four <= 8'b11000000;
					end
			6'b000010 :
					begin
				dig_three <= 8'b10100100;
				dig_four <= 8'b11000000;
					end
			6'b000011 :
					begin
					dig_three <= 8'b10110000;
					dig_four <= 8'b11000000;
					end
			6'b000100 :
					begin
					dig_three <= 8'b10011001;
					dig_four <= 8'b11000000;
					end
			6'b000101 :
					begin
					dig_three <= 8'b10010010;
					dig_four <= 8'b11000000;
					end
			6'b000110 :
					begin
				dig_three <= 8'b10000010;
				dig_four <= 8'b11000000;
					end
			6'b000111:
				begin
				dig_three <= 8'b11111000;
				dig_four <= 8'b11000000;
					end
			6'b001000:
				begin
				dig_three <= 8'b10000000;
				dig_four <= 8'b11000000;
					end
			6'b001001:
				begin
				dig_three <= 8'b10100000;
				dig_four <= 8'b11000000;
				end
			6'b001010:
				begin
				dig_three <= 8'b11000000;
				dig_four <= 8'b11111001;  //TEN
				end
				6'b001011 :
					begin
				dig_three <= 8'b11111001;
				dig_four <= 8'b11111001;
					end
			6'b001100 :
					begin
				dig_three <= 8'b10100100;
				dig_four <= 8'b11111001;
					end
			6'b001101 :
					begin
					dig_three <= 8'b10110000;
				dig_four <= 8'b11111001;
					end
			6'b001110 :
					begin
					dig_three <= 8'b10011001;
				dig_four <= 8'b11111001;
					end
			6'b001111 :
					begin
					dig_three <= 8'b10010010;
				dig_four <= 8'b11111001;
					end
			6'b010000 :
					begin
				dig_three <= 8'b10000010;
				dig_four <= 8'b11111001;
					end
			6'b010001:
				begin
				dig_three <= 8'b11111000;
				dig_four <= 8'b11111001;
					end
			6'b010010:
				begin
				dig_three <= 8'b10000000;
				dig_four <= 8'b11111001;
					end
			6'b010011:
				begin
				dig_three <= 8'b10100000;
				dig_four <= 8'b11111001; //19
				end
			6'b010100:
				begin
				dig_three <= 8'b11000000;
				dig_four <= 8'b10100100;  //20
				end
			6'b010101 :
					begin
				dig_three <= 8'b11111001;
				dig_four <= 8'b10100100;
					end
			6'b010110 :
					begin
				dig_three <= 8'b10100100;
				dig_four <= 8'b10100100;
					end
			6'b010111 :
					begin
					dig_three <= 8'b10110000;
				dig_four <= 8'b10100100;
					end
			6'b011000 :
					begin
					dig_three <= 8'b10011001;
				dig_four <= 8'b10100100;
					end
			6'b011001 :
					begin
					dig_three <= 8'b10010010;
				dig_four <= 8'b10100100;
					end
			6'b011010 :
					begin
				dig_three <= 8'b10000010;
				dig_four <= 8'b10100100;
					end
			6'b011011:
				begin
				dig_three <= 8'b11111000;
				dig_four <= 8'b10100100;
					end
			6'b011100:
				begin
				dig_three <= 8'b10000000;
				dig_four <= 8'b10100100;
					end
			6'b011101:
				begin
				dig_three <= 8'b10100000;
				dig_four <= 8'b10100100; //29
				end
			6'b011110:
				begin
				dig_three <= 8'b11000000;
				dig_four <= 8'b10110000;  //30
				end
			6'b011111 :
					begin
				dig_three <= 8'b11111001;
				dig_four <= 8'b10110000;
					end
			6'b100000 :
					begin
				dig_three <= 8'b10100100;
				dig_four <= 8'b10110000;
					end
			6'b100001 :
					begin
					dig_three <= 8'b10110000;
				dig_four <= 8'b10110000;
					end
			6'b100010 :
					begin
					dig_three <= 8'b10011001;
				dig_four <= 8'b10110000;
					end
			6'b100011 :
					begin
					dig_three <= 8'b10010010;
				dig_four <= 8'b10110000;
					end
			6'b100100 :
					begin
				dig_three <= 8'b10000010;
				dig_four <= 8'b10110000;
					end
			6'b100101:
				begin
				dig_three <= 8'b11111000;
				dig_four <= 8'b10110000;
					end
			6'b100110:
				begin
				dig_three <= 8'b10000000;
				dig_four <= 8'b10110000;
					end
			6'b100111:
				begin
				dig_three <= 8'b10100000;
				dig_four <= 8'b10110000; //39
				end
			6'b101000:
				begin
				dig_three <= 8'b11000000;
				dig_four <= 8'b10011001;  //40
				end
			6'b101001 :
					begin
				dig_three <= 8'b11111001;
				dig_four <= 8'b10011001;
					end
			6'b101010:
					begin
				dig_three <= 8'b10100100;
				dig_four <= 8'b10011001;
					end
			6'b101011 :
					begin
					dig_three <= 8'b10110000;
				dig_four <= 8'b10011001;
					end
			6'b101100 :
					begin
					dig_three <= 8'b10011001;
				dig_four <= 8'b10011001;
					end
			6'b101101:
					begin
					dig_three <= 8'b10010010;
				dig_four <= 8'b10011001;
					end
			6'b101110 :
					begin
				dig_three <= 8'b10000010;
				dig_four <= 8'b10011001;
					end
			6'b101111:
				begin
				dig_three <= 8'b11111000;
				dig_four <= 8'b10011001;
					end
			6'b110000:
				begin
				dig_three <= 8'b10000000;
				dig_four <= 8'b10011001;
					end
			6'b110001:
				begin
				dig_three <= 8'b10010000;
				dig_four <= 8'b10011001; //49. Yes.
				end
			endcase
	end
endmodule