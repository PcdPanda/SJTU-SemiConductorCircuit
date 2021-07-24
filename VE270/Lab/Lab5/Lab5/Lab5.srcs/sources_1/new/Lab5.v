`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/24 17:26:59
// Design Name: 
// Module Name: Lab5
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


module Lab5(clock,reset,SSD,ring);
input clock,reset;
output [6:0]SSD;
output [3:0]ring;
reg [6:0]SSD;
reg [3:0]ring=4'b1110;
wire [3:0]R;
wire clk1;
wire clk500;
wire [3:0]one;
wire [3:0]ten;
wire [6:0]ssd1;
wire [6:0]ssd2;
wire sum;
reg Clk_500Hz=1'b0,Clk_1Hz=1'b0;
reg [3:0]ones=4'b0000;
reg [3:0]tens=3'b0000;

clock500(clock,reset,clk500);
clock1(clk500,reset,clk1);
ring(clk500,reset,R);
counter1(clk1,reset,one,sum);
counter2(clk1,reset,sum,ten);
display(ones,ssd1);
display(tens,ssd2);
always @(R)ring<=R;
always @(one)begin
    ones<=one;
    tens<=ten;
end
always@(ring)begin
    if(ring==4'b0111)SSD<=7'b1111111;
    else if (ring==4'b1011)SSD<=7'b1111111;
    else if (ring==4'b1101)SSD<=ssd2;
    else if (ring==4'b1110)SSD<=ssd1;
end   
endmodule

module clock500(clock,reset,clk500);
    input clock,reset;
    output clk500;
    reg clk500=0;
    reg [17:0]n;
    always @(posedge reset or posedge clock)begin
        if(reset==1)begin
            n<=0;
            clk500<=0;
        end
        else if(n>=18'b110000110100111111)begin
            n<=0;
            clk500<=1;
        end
        else begin
            n<=n+1;
            clk500<=0;
        end
    end
endmodule

module clock1(clock,reset,clk1);
    input clock,reset;
    output clk1;
    reg clk1=0;
    reg [8:0]n;
    always @(posedge reset or posedge clock)begin
        if(reset==1)begin
            n<=0;
            clk1<=0;
        end
        else if(n>=9'b0111110011)begin
            n<=0;
            clk1<=1;
        end
        else begin
            n<=n+1;
            clk1<=0;
        end
    end
endmodule

module ring(clk500,reset,ring);
    input clk500,reset;
    output ring;
    reg [3:0]ring;
    reg [8:0]n;
    always @(posedge reset or posedge clk500)begin
        if(reset==1)ring<=4'b1110;
        else begin
            ring[0]<=ring[3];
            ring[1]<=ring[0];
            ring[2]<=ring[1];
            ring[3]<=ring[2];
        end
    end
endmodule

module counter1(clk1,reset,one,sum);
    input clk1,reset;
    output [3:0]one;
    output sum;
    reg [3:0]one=0;
    reg sum=0;
    always@(posedge clk1 or posedge reset)begin
        if(reset==1)one<=0;
        else if(one[3]==1&&one[0]==0)begin
            sum<=1;
            one<=one+1;
        end
        else if(one[3]==1&&one[0]==1)begin
            one<=0;
            sum<=0;
        end
        else begin
            one<=one+1;
            sum<=0;
         end
    end
endmodule

module counter2(clk1,reset,sum,ten);
    input clk1,reset,sum;
    output [3:0]ten;
    reg [3:0]ten=4'b0000;
    always@(posedge clk1 or posedge reset)begin
        if(reset==1)ten<=0;
        else if(ten[0]==1&&ten[2]==1&&sum==1)ten<=0;
        else if(sum==1)ten<=ten+1;
        else ten<=ten; 
    end
endmodule

module display(one,ssd1);
    input [3:0]one;
    output [6:0]ssd1;
    reg [6:0]ssd1;
    always @(one)
        begin
         case (one)
         0: ssd1 <= 7'b1000000;
         1: ssd1 <= 7'b1111001;
         2: ssd1 <= 7'b0100100;
         3: ssd1 <= 7'b0110000;
         4: ssd1 <= 7'b0011001;
         5: ssd1 <= 7'b0010010;
         6: ssd1 <= 7'b0000010;
         7: ssd1 <= 7'b1111000;
         8: ssd1 <= 7'b0000000;
         9: ssd1 <= 7'b0010000;
      endcase
    end
endmodule
