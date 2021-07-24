`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/30 01:01:23
// Design Name: 
// Module Name: HW6test
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


module HW6test();
reg clk,S,L,SI;
reg [3:0]D;
wire [3:0]Q;
HW6 UUT(clk,S,L,SI,D,Q);
initial begin
#0 clk=0;S=1;L=0;D=12;SI=0;
#10 S=0;
#50 L=1;
#100 S=1;
#150 SI=1;
end
always #10 clk=~clk;
endmodule
