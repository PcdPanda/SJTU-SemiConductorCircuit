`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/15 01:37:10
// Design Name: 
// Module Name: HW3_3_TEST
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


module HW3_3_TEST();
reg [4:0]RR1;
reg [4:0]RR2;
reg [4:0]WR;
reg [31:0]WD;
reg write;
wire [31:0]RD1;
wire [31:0]RD2;
HW3_3 UUT(RR1,RR2,WR,WD,RD1,RD2,write);
initial begin
#0 write=1;WR=0;WD=0;RR1=0;RR2=0;
#5 WR=1;WD=7;
#10 WR=3;WD=100;
#25 write=0;RR1=1;RR2=3;WR=5;WD=9;
#30 RR2=1;RR1=3;
end
endmodule
