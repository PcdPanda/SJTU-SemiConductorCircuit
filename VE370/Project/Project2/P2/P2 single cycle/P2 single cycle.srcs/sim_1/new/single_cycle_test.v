`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/14 13:52:58
// Design Name: 
// Module Name: single_cycle_test
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


module single_cycle_test;
reg clk;
wire [31:0]PC,out1,out2,back;
SingleCycle UUT(clk,PC,out1,out2,back);
initial begin
#0 clk=0;
end
always #1 clk=~clk;
endmodule
