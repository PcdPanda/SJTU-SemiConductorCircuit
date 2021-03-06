`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/15 00:00:57
// Design Name: 
// Module Name: lab4
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


module lab4(clk,ud,reset,x,SSD);
    input clk,ud,reset;
    output [3:0]x;
    output [6:0]SSD;
    reg [6:0]SSD;
    reg [3:0]x=4'b0000;
    always @(posedge clk or posedge reset) begin
        if(reset==1)x=4'b0000;
        else if(ud==1)x<=x+1;
        else x<=x-1;
    end
    always @(x)
    begin
         case (x)
         0: SSD = 7'b1000000;
         1: SSD = 7'b1111001;
         2: SSD = 7'b0100100;
         3: SSD = 7'b0110000;
         4: SSD = 7'b0011001;
         5: SSD = 7'b0010010;
         6: SSD = 7'b0000010;
         7: SSD = 7'b1111000;
         8: SSD = 7'b0000000;
         9: SSD = 7'b0010000;
         10:SSD = 7'b0001000;
         11:SSD = 7'b0000011;
         12:SSD = 7'b1000110;
         13:SSD = 7'b0100001;
         14:SSD = 7'b0000110;
         15:SSD = 7'b0001110;
      endcase
    end
endmodule
