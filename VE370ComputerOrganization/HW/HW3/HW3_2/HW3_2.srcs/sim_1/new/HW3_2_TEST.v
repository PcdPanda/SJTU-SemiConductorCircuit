`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/15 01:02:41
// Design Name: 
// Module Name: HW3_2_TEST
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


module HW3_2_TEST();
reg clock;
reg a;
reg b;
reg ainvert;
reg binvert;
reg carryin;
reg [1:0]op;
wire result,set;
HW3_2 UUT(clock,a,b,ainvert,binvert,result,carryin,op,set);
initial begin
#0 clock=0;ainvert=0;binvert=0;op=0;a=0;b=1;carryin=0;
#10 ainvert=~ainvert;
#20 binvert=~binvert;
#25 ainvert=~ainvert;
#30 binvert=~binvert;op=1;
#40 op=2;
#50 op=3;
#60 carryin=1;
#70 op=4;

end
always #2 clock=~clock;
endmodule
