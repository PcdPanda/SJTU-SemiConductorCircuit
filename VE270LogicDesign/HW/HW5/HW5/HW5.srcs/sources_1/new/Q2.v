`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/15 15:54:49
// Design Name: 
// Module Name: Q2
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


module Q2(Data_in, clk, R ,Data_out);
    input [3:0] Data_in;
    input clk,R;
    output [3:0] Data_out;
    reg [3:0] Data_out;
    always @(posedge clk or negedge clk)
    if(R==1'b0) Data_out <= 4'b0;
    else Data_out <= Data_in;
endmodule
