`timescale 1ns / 1ps
module counter_tb;

reg clk = 0, reset;
wire [7:0] counter;

counter counter_inst (.clk(clk), .reset(reset), .counter(counter));

always #5 clk = ~ clk;
initial begin 
$dumpfile("countr_dump.vcd");
$dumpvars();
#10;
reset = 0;
#10;

reset = 1;
#10;

reset = 0;
#10;


reset = 0;
#10;
$finish;
end

initial begin
$monitor("The value of count = %b", counter);
end
endmodule

