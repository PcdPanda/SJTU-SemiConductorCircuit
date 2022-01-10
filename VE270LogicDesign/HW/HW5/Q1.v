`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/15 15:26:31
// Design Name: 
// Module Name: Q1
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


module Q1(A,B,Sel,F);
	input [31:0]A,B;
	input Sel;
	output [31:0] F;
	reg [31:0] F;
	always @(A,B,Sel)begin
		case(Sel)
			0'b0: F=A;
			1'b1: F=B;
			default F=0;
		endcase
	end
endmodule

