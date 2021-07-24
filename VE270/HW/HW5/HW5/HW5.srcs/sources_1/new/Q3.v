`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/15 16:17:20
// Design Name: 
// Module Name: Q3
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


module Q3(clk,x);
input clk;
output [3:0]x;
reg [3:0]x=4'b0001;
always @(posedge clk)
    begin
    x[0]<=x[1];
    x[1]<=x[2];
    x[2]<=x[3];
    x[3]<=x[0]+x[3];
    end
endmodule
