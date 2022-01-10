`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/15 00:08:02
// Design Name: 
// Module Name: HW3_1
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


module HW3_1(clock,A,B,F,sel);
    input [31:0]A;
    input [31:0]B;
    input sel;
    input clock;
    output [31:0]F;
    reg [31:0]F;
    always @(posedge clock)begin
        if(sel==1)begin
            F<=A;
        end
        else begin
            F<=B;
        end
    end
    
endmodule
