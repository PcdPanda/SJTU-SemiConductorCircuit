`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/30 00:48:47
// Design Name: 
// Module Name: HW6
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


module HW6(clk,S,L,SI,D,Q);
input clk,S,L,SI;
input [3:0]D;
output [3:0]Q;
reg [3:0]Q;
always @(posedge ~clk)begin
    if(S) begin
        Q[2:0]<=Q[3:1];
        Q[3]<=SI;
    end
    else if (L)Q<=D;
    /*if(!S&&L) Q<=D;
    else if (S)begin
        Q[2:0]<=Q[3:1];
        Q[3]<=SI;
        end
    */
    else Q<=Q;
    end
endmodule
