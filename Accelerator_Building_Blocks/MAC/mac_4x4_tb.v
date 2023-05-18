`timescale 1ns / 1ps

module mac_4x4_tb;
   reg clk = 0, rst = 0;
   reg [31:0] in_a0;
   reg [31:0] in_a1;
   reg [31:0] in_b0;
   reg [31:0] in_b1;

   wire [63:0] o00, o01, o10, o11;

   mac_4x4 dut (
		.clk(clk),
		.rst(rst),
		.in_a0(in_a0),
		.in_a1(in_a1),
		.in_b0(in_b0),
		.in_b1(in_b1),
		.o00(o00),
		.o01(o01),
		.o10(o10),
		.o11(o11)
		);

   always #5 clk = ~clk;

   initial begin
      rst = 0;
      #10;
      rst = 1;
      #10;
      rst = 0;
      #10;


      in_a0 = 10;
      in_a1 = 5;
      in_b0 = 2;
      in_b1 = 3;

      #20;

      $display("o00 = %d", o00);
      $display("o01 = %d", o01);
      $display("o10 = %d", o10);
      $display("o11 = %d", o11);

      $finish;
   end
endmodule
