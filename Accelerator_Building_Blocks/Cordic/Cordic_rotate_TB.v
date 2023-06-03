`timescale 1ns / 1ps
module Cordic_rotate_TB;
   reg clock = 0;
   reg [15:0] x_in;
   reg [15:0] y_in;
   reg [31:0] angle;
   wire [15:0] x_out;
   wire [15:0] y_out;
   wire        done;

   Cordic_rotate uut (
		      .clock(clock), 
		      .x_in(x_in), 
		      .y_in(y_in), 
		      .angle(angle), 
		      .x_out(x_out), 
		      .y_out(y_out), 
		      .done(done)
		      );

   always #5 clock = ~clock;

   initial begin
      clock = 0;
      x_in = 0;
      y_in = 0;
      angle = 0;		
      #100;
      x_in =32000;
      y_in = 32000;
      
      angle = 'b00100000000000000000000000000000;
      
      clock = 'b0;
      
      
   end
   
endmodule
