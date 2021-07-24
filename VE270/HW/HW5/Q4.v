`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/15 16:46:04
// Design Name: 
// Module Name: Q4
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


module Q4(cnt,clear,set,clk,out);
input cnt,clear,set,clk;
output [3:0]out;
reg [3:0]out=4'b1111;
always @(posedge clk or posedge cnt or posedge clear or posedge set)begin
        if(set==1)out<=4'b1111;
        else if(clear==1)out<=4'b0000;
        else if(cnt==1)out<=out-4'b0001;    
end
endmodule
