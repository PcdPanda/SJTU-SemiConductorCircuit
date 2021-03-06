`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/07/29 21:26:04
// Design Name: 
// Module Name: Lab7
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


module Lab7(clk,reset,control,equal,number,ring,SSD,OF);
    input reset,clk,control,equal;
    input [3:0]number;
    output [6:0]SSD;
    output [3:0]ring;
    output OF;
    reg [3:0]ring=4'b1110;
    reg [6:0]SSD;
    wire clk1;
    wire clk500;
    wire [3:0]R;
    wire [6:0]ssd1;
    wire [6:0]ssd2; 
    clock500(clk,reset,clk500);
    clock1(clk500,reset,clk1);
    ring(clk500,reset,R);
    always @(R)ring<=R;
    ID(clk1,ring,ssd1);
    SC(number,equal,ring,ssd2,OF);
    always @(*)begin
        if(control==0)SSD<=ssd1;
        else if(control==1)SSD<=ssd2;
    end
endmodule
module SC(number,e,ring,ssd0,OF);
    input [3:0]number,ring;
    input e;
    output [6:0]ssd0;
    output OF;
    reg [3:0]sum=4'b0000;
    reg [5:0]i=0;
    reg [6:0]ssd0=7'b1111111;
    reg [6:0]ssd1=7'b1111111;
    reg [6:0]ssd2=7'b1111111;
    reg d=0;
    reg OF=0;
    always @(posedge e)begin
        i<=i+1;
        d=sum[3];
        sum=sum+number; 
        if(sum[3]==1)begin
            ssd1<=7'b1111110;
            case(sum[2:0])
                3'b111: ssd2<=7'b1001111;
                3'b110: ssd2<=7'b0010010;
                3'b101: ssd2<=7'b0000110;
                3'b100: ssd2<=7'b1001100;
                3'b011: ssd2<=7'b0100100;
                3'b010: ssd2<=7'b0100000;
                3'b001: ssd2<=7'b0001111;
                3'b000: ssd2<=7'b0000000;
                default: ssd2<=7'b0000001;
            endcase
        end
        else begin
            ssd1<=7'b1111111;
            case(sum[2:0])
                3'b001: ssd2<=7'b1001111;
                3'b010: ssd2<=7'b0010010;
                3'b011: ssd2<=7'b0000110;
                3'b100: ssd2<=7'b1001100;
                3'b101: ssd2<=7'b0100100;
                3'b110: ssd2<=7'b0100000;
                3'b111: ssd2<=7'b0001111;
                default: ssd2<=7'b0000001;
            endcase
        end
        OF=((~d)&(~number[3])&sum[3])|(d&number[3]&(~sum[3]));
    end
    always @(ring)begin
        case (ring)  
            4'b1110:ssd0<=ssd2;
            4'b1101:ssd0<=ssd1;
            default:ssd0<=7'b1111111;
        endcase
    end 
endmodule
module ID(clk1,ring,ssd1);
    input clk1;
    input [3:0]ring;
    output [6:0]ssd1;
    reg [6:0]ssd1=7'b1111111;
    reg [3:0]s3=4'b1111,s2=4'b1111,s1=4'b1111,s0=4'b1111;
    reg [3:0]i=0;
    always @(posedge clk1)begin
        i<=i+1;
        case (i)
            1:s0<=4'b0101;
            2:s0<=4'b0001;
            3:s0<=4'b0110;
            4:s0<=4'b0011;
            5:s0<=4'b0111;
            6:s0<=4'b0000;
            7:s0<=4'b1001;
            8:s0<=4'b0001;
            9:s0<=4'b0000;
            10:s0<=4'b0001;
            11:s0<=4'b0010;
            12:s0<=4'b0001;
            13:s0<=4'b1111;
            14:s0<=4'b1111;
            15:s0<=4'b1111;
        endcase
        s3<=s2;s2<=s1;s1<=s0;
    end
    always @(ring) begin
    case (ring)
        4'b1110:begin
            case(s0)
                4'b0000: ssd1<=7'b0000001;
                4'b0001: ssd1<=7'b1001111;
                4'b0010: ssd1<=7'b0010010;
                4'b0011: ssd1<=7'b0000110;
                4'b0100: ssd1<=7'b1001100;
                4'b0101: ssd1<=7'b0100100;
                4'b0110: ssd1<=7'b0100000;
                4'b0111: ssd1<=7'b0001111;
                4'b1000: ssd1<=7'b0000000;
                4'b1001: ssd1<=7'b0000100;
                default: ssd1<=7'b1111111;
            endcase 
        end
        4'b1101:begin
            case(s1)
                4'b0000: ssd1<=7'b0000001;
                4'b0001: ssd1<=7'b1001111;
                4'b0010: ssd1<=7'b0010010;
                4'b0011: ssd1<=7'b0000110;
                4'b0100: ssd1<=7'b1001100;
                4'b0101: ssd1<=7'b0100100;
                4'b0110: ssd1<=7'b0100000;
                4'b0111: ssd1<=7'b0001111;
                4'b1000: ssd1<=7'b0000000;
                4'b1001: ssd1<=7'b0000100;
                default: ssd1<=7'b1111111;
            endcase            
        end
        4'b1011:begin
            case(s2)
                4'b0000: ssd1<=7'b0000001;
                4'b0001: ssd1<=7'b1001111;
                4'b0010: ssd1<=7'b0010010;
                4'b0011: ssd1<=7'b0000110;
                4'b0100: ssd1<=7'b1001100;
                4'b0101: ssd1<=7'b0100100;
                4'b0110: ssd1<=7'b0100000;
                4'b0111: ssd1<=7'b0001111;
                4'b1000: ssd1<=7'b0000000;
                4'b1001: ssd1<=7'b0000100;
                default: ssd1<=7'b1111111;
            endcase                  
        end
        4'b0111:begin
            case(s3)
                4'b0000: ssd1<=7'b0000001;
                4'b0001: ssd1<=7'b1001111;
                4'b0010: ssd1<=7'b0010010;
                4'b0011: ssd1<=7'b0000110;
                4'b0100: ssd1<=7'b1001100;
                4'b0101: ssd1<=7'b0100100;
                4'b0110: ssd1<=7'b0100000;
                4'b0111: ssd1<=7'b0001111;
                4'b1000: ssd1<=7'b0000000;
                4'b1001: ssd1<=7'b0000100;
                default: ssd1<=7'b1111111;
            endcase                
        end
        default:ssd1=7'b1111111;
    endcase
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
    reg [8:0]speed=9'b111110011;
    always @(posedge reset or posedge clock)begin
        if(reset==1)begin
            n<=0;
            clk1<=0;
        end
        else if(n>speed)begin
            n<=0;
            clk1<=1;
            speed<=speed-15;
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