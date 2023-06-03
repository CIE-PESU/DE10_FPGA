`timescale 1ns / 1ps
//CIE SWS Cordic Implementation for rotation - Sai Govardhan

//This code rotates x_in and y_in by a given angle

module Cordic_rotate(
		     input wire 	       clock,
		     input wire signed [15:0]  x_in,
		     input wire signed [15:0]  y_in,
		     input wire signed [31:0]  angle,
		     output wire signed [15:0] x_out,
		     output wire signed [15:0] y_out,
		     output reg 	       done
		     );

   wire signed [31:0] 			       LUT_atan[0:15]; // 32 rotations in total

   // Strength reduction -> 

   // atan 1/2^0 is tan inverse of 1 -> 45 degrees, represented here as 53,68,70,912 in decimal, which is 4
   // To fit all angles from 360 to 0 between a 32 bit number, assume 360 degrees corresponds to 2^32
   // Then 45 degrees is 
   // 45 x (2^32 / 360) = 536870912, which is 2^30 -> `b00100000000000000000000000000000
   assign LUT_atan[00] = 'b00100000000000000000000000000000; 
   assign LUT_atan[01] = 'b00010010111001000000010100011101;
   assign LUT_atan[02] = 'b00001001111110110011100001011011;
   assign LUT_atan[03] = 'b00000101000100010001000111010100;
   assign LUT_atan[04] = 'b00000010100010110000110101000011;
   assign LUT_atan[05] = 'b00000001010001011101011111100001;
   assign LUT_atan[06] = 'b00000000101000101111011000011110;
   assign LUT_atan[07] = 'b00000000010100010111110001010101;
   assign LUT_atan[08] = 'b00000000001010001011111001010011;
   assign LUT_atan[09] = 'b00000000000101000101111100101110;
   assign LUT_atan[10] = 'b00000000000010100010111110011000;
   assign LUT_atan[11] = 'b00000000000001010001011111001100;
   assign LUT_atan[12] = 'b00000000000000101000101111100110;
   assign LUT_atan[13] = 'b00000000000000010100010111110011;
   assign LUT_atan[14] = 'b00000000000000001010001011111001;
   assign LUT_atan[15] = 'b00000000000000000101000101111100;

   parameter width = 16;

   reg signed [15:0] 			       x_reg, y_reg;
   reg [3:0] 				       out = 4'b0000;


   wire [1:0] 				       quad;
   assign quad = angle[31:30];

   reg signed [width:0] 		       x [0:width-1];
   reg signed [width:0] 		       y [0:width-1];
   reg signed [31:0] 			       z [0:width-1];

   always @(posedge clock)
     begin

	x_reg = (x_in>>>1)+(x_in>>>4)+(x_in>>>5);
	y_reg = (y_in>>>1)+(y_in>>>4)+(y_in>>>5);

	case(quad)
	  2'b00,2'b11:
	    begin		
	       x[0] <= x_reg;
	       y[0] <= y_reg;
	       z[0] <= angle;
	    end
	  2'b01:				
	    begin
	       x[0] <= -y_reg;
	       y[0] <= x_reg;
	       z[0] <= {2'b00,angle[29:0]};
	    end
	  2'b10:				
	    begin
	       x[0] <= y_reg;			
	       y[0] <= -x_reg;
	       z[0] <= {2'b11,angle[29:0]};
	    end
	  
	endcase
     end

   genvar i;
   generate
      for (i=0;i<15;i=i+1)
	begin

	   wire signed [width:0] xshift, yshift;

	   assign xshift = x[i] >>> i;
	   assign yshift = y[i] >>> i;

	   always @(posedge clock)
	     begin
		x[i+1] <= z[i][31] ? x[i] + yshift :x[i]-yshift;
		y[i+1] <= z[i][31] ? y[i] - xshift :y[i]+xshift;
		z[i+1] <= z[i][31] ? z[i]+LUT_atan[i] :z[i]-LUT_atan[i];
		out <= out+1;
		if (out == 4'b1111)
		  done = 'b1;
		else
		  done = 'b0;
	     end
	end
   endgenerate

   assign x_out = x[width-1];
   assign y_out = y[width-1];

endmodule
