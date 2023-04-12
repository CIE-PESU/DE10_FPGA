`timescale 1ns / 1ps

module CAE_tb;
reg [31:0]i1,i2;
wire[31:0]o1,o2;
reg dir;
reg clk=1'b0;
reg rst=1'b0;
reg en=1'b1;
always #5 clk=~clk;
CAE /*#(.DATA_WIDTH(32))*/dut(.i1(i1),.i2(i2),.dir(dir),.o1(o1),.o2(o2),.clk(clk),.rst(rst),.en(en));
initial begin
$monitor("In_1:%0d,In_2:%0d,Dir:%0d,Out_1:%0d,Out_2:%0d",i1,i2,dir,o1,o2);
dir=1'b1;
i1=32'd3;
i2=32'd4;
#10;
i1=32'd4;
i2=32'd3;
#10;
dir=1'b0;
i1=32'd3;
i2=32'd4;
#10
i1=32'd4;
i2=32'd3;
#10;
$finish;
end
endmodule
