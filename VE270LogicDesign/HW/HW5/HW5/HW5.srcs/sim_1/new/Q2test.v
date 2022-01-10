`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/15 16:05:13
// Design Name: 
// Module Name: Q2test
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


module Q2test;
        reg [3:0] Data_in;
        reg clk,R;
        wire [3:0] Data_out;
        Q2 UUT(Data_in, clk, R ,Data_out);
        initial begin
            #0 clk=0;R=0; Data_in=0;
            #20 Data_in=1;
            #20 Data_in=2;
            #20 Data_in=3;
            #20 Data_in=4;
            #20 Data_in=5;
            #20 Data_in=6;
            #20 Data_in=7;
            #20 Data_in=8;
            #20 Data_in=9;
            #20 Data_in=10;
            #20 Data_in=11;
            #20 Data_in=12;
            #20 Data_in=13;
            #20 Data_in=14;
            #20 Data_in=15;
        end
        always #15 R=~R;
        always #5 clk=~clk;
        initial  #1000 $stop;
endmodule
