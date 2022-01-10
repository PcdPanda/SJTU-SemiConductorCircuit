`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/15 15:28:50
// Design Name: 
// Module Name: Q1test
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


module Q1test;
    reg [31:0] A,B;
    reg Sel;
    wire [31:0] F;
    Q1 UUT(A,B,Sel,F);
    initial begin
        #0 Sel=0; A=0;B=1;
        #50 A=23;B=800;
    end
    always #10 Sel=~Sel;
    initial  #1000 $stop;
endmodule
