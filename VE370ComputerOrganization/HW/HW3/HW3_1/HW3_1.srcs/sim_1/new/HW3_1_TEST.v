`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/15 00:21:24
// Design Name: 
// Module Name: HW3_1_TEST
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
module HW3_1_TEST();
reg clk,sel;
reg [31:0]A;
reg [31:0]B;
wire [31:0]F;
HW3_1 UUT(clk,A,B,F,sel);
initial begin
#0 clk=0;A=344;B=23;sel=0;;
#100 A=34;B=283;
#200 A=0;B=10;
end
always #10 clk=~clk;
always #50 sel=~sel;
endmodule
