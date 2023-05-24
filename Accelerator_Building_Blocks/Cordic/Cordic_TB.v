`timescale 1ns / 1ps

module Cordic_TB;

   reg clock;
   reg [15:0] xstart;
   reg [15:0] ystart;
   reg [31:0] angle;

   wire [15:0] xout;
   wire [15:0] yout;
   wire        done;

   Cordic_Top uut (
		   .clock(clock), 
		   .xstart(xstart), 
		   .ystart(ystart), 
		   .angle(angle), 
		   .xout(xout), 
		   .yout(yout), 
		   .done(done)
		   );


   initial begin
      clock = 0;
      xstart = 0;
      ystart = 0;
      angle = 0;
      
      #100;
      
      xstart =32000;
      ystart = 0;
      // angle = 'b01110101010101010101010101010101;
      angle = 'b00100000000000000000000000000000; // 45 degrees
      clock = 'b0;
      forever
        begin
           #5 clock = !clock;
        end


   end
   
endmodule 
