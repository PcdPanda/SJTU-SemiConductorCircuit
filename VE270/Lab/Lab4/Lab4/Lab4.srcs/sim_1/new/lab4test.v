`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/19 22:28:32
// Design Name: 
// Module Name: lab4test
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


module lab4test;
reg clk,ud,reset;
wire [3:0]x;
lab4 UUT(clk,ud,reset,x);
initial begin
#0 clk=0;ud=1;reset=0;
#200 reset=1;
#400 reset=0;
#700 ud=0;
end
always #10 clk=~clk;
initial #1000 $stop;
endmodule

