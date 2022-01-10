`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/24 23:45:03
// Design Name: 
// Module Name: Lab5Test
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


module Lab5Test;
reg clock,reset;
wire [6:0]SSD;
wire [3:0]ring;
Lab5 UUT(clock,reset,SSD,ring);
initial begin
#0 clock=0;reset=0;
end
always #0.001 clock=~clock;
//initial #1000000000 $stop;
endmodule
