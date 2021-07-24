`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/15 01:28:17
// Design Name: 
// Module Name: HW3_3
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


module HW3_3(RR1,RR2,WR,WD,RD1,RD2,write);
input [4:0]RR1;
input [4:0]RR2;
input [4:0]WR;
input [31:0]WD;
input write;
output [31:0]RD1;
output [31:0]RD2;
reg [31:0]RD1;
reg [31:0]RD2;
reg [31:0]REG[31:0];
always @(*)begin
    RD1='bz;
    RD2='bz;
    if(write)REG[WR]<=WD;  
    else if(!write)begin
        RD1<=REG[RR1];
        RD2<=REG[RR2];
    end
end
endmodule
