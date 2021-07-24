`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/17 22:33:20
// Design Name: 
// Module Name: Q5
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


module Q5(clk,x,upper,reset);
input clk,reset;
output upper;
output [3:0]x;

reg [3:0]x=4'b0000;
reg upper=1'b0;
always @(posedge clk or posedge reset)begin
    if(reset==1'b0001)x=4'b0000;
    else x=x+4'b0001;
    if(x>=8)upper=1'b1;
    else upper=1'b0;
end
endmodule
