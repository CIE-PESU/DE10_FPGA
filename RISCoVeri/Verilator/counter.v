`timescale 1ns/1ps
module counter(input wire clk, reset, 
		output wire [7:0] counter);
reg [7:0] count_reg;
always@(posedge clk) begin
if(reset) begin 
count_reg <=8'b0;
end
else begin
count_reg = count_reg + 1;
end
end
assign counter = counter_reg;
endmodule

