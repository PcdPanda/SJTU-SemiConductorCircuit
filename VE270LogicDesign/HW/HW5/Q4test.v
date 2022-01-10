`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/15 16:55:25
// Design Name: 
// Module Name: Q4test
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


module Q4test;
reg cnt,clear,set,clk;
wire[3:0]out;
Q4 UUT(cnt,clear,set,clk,out);
    initial begin
    #0 cnt=0;set=1;clk=1;clear=0;
    #10 set=0;cnt=1;
    #50 clear=1;cnt=0;
    #100 cnt=1;
    #120 clear=0;set=1;
    #150 set=0;
    end
always #5 clk=~clk;
initial  #1000 $stop;
endmodule
