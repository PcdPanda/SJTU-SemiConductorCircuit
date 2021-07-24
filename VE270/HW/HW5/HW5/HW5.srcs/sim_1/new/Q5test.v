`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/17 22:38:44
// Design Name: 
// Module Name: Q5test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Q5test;
reg clk,reset;
wire [3:0]x;
wire upper;
Q5 UUT(clk,x,upper,reset);
initial begin
#0 clk=0;reset=0;
#50 reset=1;
#70 reset=0;
end
always #10 clk=~clk;
initial #1000 $stop;
endmodule
