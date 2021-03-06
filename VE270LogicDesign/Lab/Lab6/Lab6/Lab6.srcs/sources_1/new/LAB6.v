`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/07/16 17:51:43
// Design Name: 
// Module Name: LAB6
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
module lab6(col,clock,row,reset,ssd,anode,led);
    input [3:0]row;
    input clock;
    input reset;
    output [3:0] col;
    output [3:0] anode;
    output [6:0] ssd;
    output [2:0] led;
    wire clock_out;
    wire OR_row; 
    reg [2:0] led;  
    reg [3:0] col;
    reg [3:0] code;
    reg [3:0] cs,ns;
    reg [6:0] ssd;
    reg [3:0] anode=4'b0000;
    parameter s0=3'b000;
    parameter s1=3'b001;
    parameter s2=3'b010;  
    parameter s3=3'b011;
    parameter s4=3'b100;
    parameter s5=3'b101;
    clock1(clock,reset,clock_out);
    or(OR_row,row[0],row[1],row[2],row[3]);
always @ (posedge clock_out or posedge reset)begin
    if(reset==1) cs <= s0;    
    else cs <= ns;
    led<= ns;
    case (ns)
        s0: col<=4'b1111;
        s1: col<=4'b0001;
        s2: col<=4'b0010;
        s3: col<=4'b0100;
        s4: col<=4'b1000;
    endcase
end
always @(cs)begin
    case (cs)
        s0: begin
            code<=4'b0000; 
            if(OR_row==0) ns<=s0;
            else ns<=s1;
        end
        s1: begin      
            if(OR_row==0) begin ns<=s2;end
            else if(OR_row==1) ns<=s5;
            else;
        end
        s2: begin       
            if(OR_row==0) begin ns<=s3; end
            else if(OR_row==1)ns<=s5;
            else;
        end
        s3: begin       
            if(OR_row==0) begin ns<=s4; end
            else if(OR_row==1)ns<=s5;
            else;
        end
        s4: begin     
            if(OR_row==0) begin ns<=s0;end 
            else if(OR_row==1) ns<=s5;
            else;       
        end
        s5: begin
            if(OR_row==0) begin ns<=s0; end
            else if(OR_row==1) ns<=s5;
            else;
            case(col) 
            4'b0001: begin
                case(row)
                    4'b0001: code<=4'b0000;
                    4'b0010: code<=4'b0100;
                    4'b0100: code<=4'b1000;
                    4'b1000: code<=4'b1100;
                    default: code<=4'b0000;
                endcase
            end
                4'b0010:begin
                case(row) 
                    4'b0001: code<=4'b0001;
                    4'b0010: code<=4'b0101;
                    4'b0100: code<=4'b1001;
                    4'b1000: code<=4'b1101;
                    default: code<=4'b0000;
                endcase
            end
            4'b0100:begin
                case(row) 
                    4'b0001: code<=4'b0010;
                    4'b0010: code<=4'b0110;
                    4'b0100: code<=4'b1010;
                    4'b1000: code<=4'b1110;
                    default: code<=4'b0000;
                endcase                
            end
            4'b1000:begin
                case(row) 
                    4'b0001: code<=4'b0011;
                    4'b0010: code<=4'b0111;
                    4'b0100: code<=4'b1011;
                    4'b1000: code<=4'b1111;
                    default: code<=4'b0000;
                endcase
            end
        endcase
        end
    default: ns<=s0;
    endcase
end
always @(code)
    case(code)
        4'b0000: ssd <= 7'b0000001;
        4'b0001: ssd <= 7'b1001111;
        4'b0010: ssd <= 7'b0010010;
        4'b0011: ssd <= 7'b0000110;
        4'b0100: ssd <= 7'b1001100;
        4'b0101: ssd <= 7'b0100100;
        4'b0110: ssd <= 7'b0100000;
        4'b0111: ssd <= 7'b0001111;
        4'b1000: ssd <= 7'b0000000;
        4'b1001: ssd <= 7'b0000100;
        4'b1010: ssd <= 7'b0001000;
        4'b1011: ssd <= 7'b1100000;
        4'b1100: ssd <= 7'b0110001;
        4'b1101: ssd <= 7'b1000010;
        4'b1110: ssd <= 7'b0110000;
        4'b1111: ssd <= 7'b0111000;
    endcase
endmodule

module clock1(clock,reset,clk1);
    input clock,reset;
    output clk1;
    reg clk1=0;
    reg [27:0]n;
    always @(posedge reset or posedge clock)begin
        if(reset==1)begin
            n<=0;
            clk1<=0;
        end
        else if(n>99999999)begin
            n<=0;
            clk1<=1;
        end
        else begin
            n<=n+1;
            clk1<=0;
        end
    end
endmodule
