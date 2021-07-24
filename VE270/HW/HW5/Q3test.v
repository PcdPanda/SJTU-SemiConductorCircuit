`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/15 16:38:01
// Design Name: 
// Module Name: Q3test
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


module Q3test;
            reg clk;
            wire [3:0] x;
            Q3 UUT(clk,x);
            initial begin
            #0 clk=0;
            end
            always #10 clk=~clk;
            initial  #1000 $stop;
endmodule
