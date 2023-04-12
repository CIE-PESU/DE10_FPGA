`timescale 1ns / 1ps

module mac_1x1_tb#(parameter N=32);
reg clk = 0;
reg rst = 0;
reg [N-1:0] in_a, in_b;
wire [2*N-1:0] out_mac;

mac_1x1 mac (clk,rst,in_a,in_b,out_mac);

always #10 clk = ~clk;
initial begin
#10;
rst = 0; clk = 1;
#30;
rst = 1;
#10; rst = 0;
in_a = 32'b1001; // 9
in_b = 42'b0010; // 2
#100; $finish;
end

endmodule
