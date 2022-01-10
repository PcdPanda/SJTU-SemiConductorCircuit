`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/15 00:49:59
// Design Name: 
// Module Name: HW3_2
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


module HW3_2(clock,a,b,ainvert,binvert,result,carryin,op,set);
input clock;
input a;
input b;
input ainvert;
input binvert;
input carryin;
input [1:0]op;
output result;
output set;
reg result,set,a1,b1;
always @(posedge clock)begin
    if(ainvert==1)a1=~a;
    if(binvert==1)b1=~b;
    set=a1+b1+carryin;
    if(op==0)result=(a&&b);
    else if (op==1)result=(a||b);
    else if (op==2)result=set;
    else if(a<b)result=1;
    else result=0;
end
endmodule
