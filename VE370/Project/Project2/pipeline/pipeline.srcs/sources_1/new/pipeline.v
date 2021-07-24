`timescale 1ns / 1ps
`include "memory.txt"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/13 12:15:25
// Design Name: 
// Module Name: pipeline
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


module pipeline(clk);
    input clk;
    wire[31:0]currentPC,nextPC,instruction,SignExtend,ReadData1,ReadData2,ALUresult,MemData;
    wire RegDst,MemRead,MemtoReg,ALUop,MemWrite,ALUsrc,RegWrite,Jump,Zero,PCsrc,BranchT,BranchF;
    wire IFflush,IDflush,EXflush,stall;
    wire [4:0]WriteRegister;

    IF(currentPC,instruction);
    ID(clk,instruction,SignExtend,ReadData1,ReadData2,BranchT,BranchF,MemRead,MemtoReg,ALUop,MemWrite,ALUsrc,RegWrite,WriteRegister,Jump);
    EX(ALUsrc,ALUop,ReadData1,ReadData2,SignExtend,ALUresult,Zero);
    MEM(clk,ALUresult,ReadData2,Zero,MemRead,MemWrite,BranchT,BranchF,MemData,PCsrc);
    WB(clk,instruction,MemtoReg,MemData,RegWrite,WriteRegister,ALUresult,PCsrc,SignExtend,Jump,nextPC,currentPC);
endmodule

module PC(clk,stall,currentPC,nextPC);
    input clk,stall;
    input [31:0]currentPC;
    output [31:0]nextPC;
    reg [31:0]nextPC;
    initial nextPC<=31'b0;
    always @(posedge clk)if(!stall)nextPC<=currentPC+4;
endmodule

module IF(clk,stall,currentPC,nextPC,instruction);
    input clk,stall;
    input [31:0]currentPC;
    output[31:0] instruction,nextPC;
    reg i;    
    parameter num=30;
    reg [31:0]memory[0:num-1],nextPC;
    PC(clk,stall,currentPC,nextPC);
    initial for(i=0;i<num;i=i+1)memory[i]=32'b0;
    assign instruction=memory[currentPC>>2];
endmodule   

module ID(clk,instruction,SignExtend,ReadData1,ReadData2,BranchT,BranchF,MemRead,MemtoReg,ALUop,MemWrite,ALUsrc,RegWrite,WriteRegister,Jump);
    input clk;
    input [31:0]instruction;
    output [31:0]SignExtend,ReadData1,ReadData2;
    output BranchT,BranchF,MemRead,MemtoReg,MemWrite,ALUsrc,RegWrite,Jump;
    output[1:0]ALUop;
    output [4:0]WriteRegister;
    wire RegDst,Branch,MemRead,MemtoReg,MemWrite,ALUsrc,RegWrite,Jump;
    wire [1:0]ALUop;
    wire [31:0]WriteData,ReadData1,ReadData2;
    reg [31:0]SignExtend;
    initial begin
        SignExtend=0;
    end
    control(instruction[31:26],RegDst,Branch,MemRead,MemtoReg,ALUop,MemWrite,ALUsrc,RegWrite,Jump);
    always@(instruction)SignExtend = {{16{instruction[15]}}, instruction[15:0]};//SignExtend
    
    assign WriteRegister = (RegDst == 1'b0) ? instruction[20:16] : instruction[15:11];
    register(clk,RegWrite,instruction[25:21],instruction[20:16],WriteRegister,WriteData,ReadData1,ReadData2);

endmodule

module EX(ALUsrc,ALUop,ReadData1,ReadData2,SignExtend,ALUresult,Zero);
    input ALUsrc;
    input [1:0]ALUop;
    input [31:0]ReadData1,ReadData2,SignExtend;
    output [31:0]ALUresult;
    output Zero;
    reg Zero; 
    wire [3:0]ALUcontrol;
    wire [31:0]ALUin;
    initial Zero=0;
    ALU_control(SignExtend[5:0],ALUop,ALUcontrol);
    assign ALUin = (ALUsrc == 1'b0) ? ReadData2 :SignExtend;
    ALU(ALUcontrol,ReadData1,ALUin,ALUresult,Zero);
endmodule

module MEM(clk,Address,ReadData,Zero,MemRead,MemWrite,BranchT,BranchF,MemData,PCsrc);
    input [31:0]Address,ReadData;
    input clk,Zero,MemRead,MemWrite,BranchT,BranchF;
    output [31:0]MemData;
    output PCsrc;
    reg i;
    parameter num=32;
    reg [31:0]mem[0:num-1],MemData;
    initial begin
        for(i=0;i<num;i=i+1)mem[i]=0;
        MemData=0;
    end
    always @(posedge clk)begin
        if(MemRead)mem[Address]=ReadData;
        if(MemWrite)MemData=mem[Address];
    end  
    assign PCsrc=(Zero&&BranchT)||(!Zero&&BranchF);
endmodule

module WB(clk,instruction,MemtoReg,MemData,RegWrite,WriteRegister,ALUresult,PCsrc,SignExtend,Jump,nextPC,currentPC);
    input clk,MemtoReg,PCsrc,RegWrite,Jump;
    input [31:0]instruction,MemData,ALUresult,nextPC,SignExtend;
    input [4:0]WriteRegister;
    output [31:0]currentPC;
    reg ReadData1,ReadData2;
    reg Zero;
    wire [31:0]WriteData,BranchAddress,BranchALUResult,BranchResult,JumpAddress;
    assign WriteData = (MemtoReg== 1'b1) ? MemData:ALUresult;
    register(clk,RegWrite,instruction[25:21],instruction[20:16],WriteRegister,WriteData,ReadData1,ReadData2);
    ALU(4'b0010,nextPC,(SignExtend<<2),BranchALUResult,Zero);
    assign BranchResult=(PCsrc==1'b1) ? BranchALUResult:nextPC;  
    assign JumpAddress={nextPC[31:28],instruction[25:0],2'b00};
    assign currentPC=(Jump==1'b1) ? JumpAddress:BranchResult;
endmodule

module control(opcode,RegDst,BranchT,BranchF,MemRead,MemtoReg,ALUop,MemWrite,ALUsrc,RegWrite,Jump);
    input[5:0]opcode;
    output RegDst,BranchT,BranchF,MemRead,MemtoReg,MemWrite,ALUsrc,RegWrite,Jump;
    output [1:0]ALUop;
    reg RegDst,BranchT,BranchF,MemRead,MemtoReg,MemWrite,ALUsrc,RegWrite,Jump;
    reg [1:0]ALUop;    
    initial begin
        RegDst=1'b0;
        BranchT=1'b0;
        BranchF=1'b0;
        MemRead=1'b0;
        MemtoReg=1'b0;
        MemWrite=1'b0;
        ALUsrc=1'b0;
        RegWrite=1'b0;
        Jump=1'b0;
        ALUop=2'b00;
    end
    always @(opcode)begin
        case (opcode)
            6'b000000: begin //R
                RegDst<= 1'b1;
                BranchT<=1'b0;
                BranchF<=1'b0;
                MemRead<= 1'b0;
                MemtoReg<= 1'b0;
                MemWrite<= 1'b0;
                ALUsrc<= 1'b0;
                RegWrite<= 1'b1;
                Jump<=1'b0;
                ALUop<=2'b10;
            end
            6'b000010: begin // j
                RegDst<= 1'b0;
                BranchT<=1'b0;
                BranchF<=1'b0;
                MemRead<= 1'b0;
                MemtoReg<= 1'b0;
                MemWrite<= 1'b0;
                ALUsrc<= 1'b0;
                RegWrite<= 1'b0;
                Jump<=1'b1;
                ALUop<=2'b10;
            end
            6'b000100: begin // beq
                RegDst<= 1'b1;
                BranchT<=1'b1;
                BranchF<=1'b0;
                MemRead<= 1'b0;
                MemtoReg<= 1'b0;
                MemWrite<= 1'b0;
                ALUsrc<= 1'b0;
                RegWrite<= 1'b0;
                Jump<=1'b0;
                ALUop<=2'b01;
            end
            6'b000101: begin // bne
                RegDst<= 1'b1;
                BranchT<=1'b0;
                BranchF<=1'b1;
                MemRead<= 1'b0;
                MemtoReg<= 1'b0;
                MemWrite<= 1'b0;
                ALUsrc<= 1'b0;
                RegWrite<= 1'b0;
                Jump<=1'b0;
                ALUop<=2'b01;
            end
            6'b001000: begin // addi
                RegDst<= 1'b0;
                BranchT<=1'b0;
                BranchF<=1'b0;
                MemRead<= 1'b0;
                MemtoReg<= 1'b0;
                MemWrite<= 1'b0;
                ALUsrc<= 1'b1;
                RegWrite<= 1'b1;
                Jump<=1'b0;
                ALUop<=2'b11;
            end
            6'b001100: begin // andi
                RegDst<= 1'b0;
                BranchT<=1'b0;
                BranchF<=1'b0;
                MemRead<= 1'b0;
                MemtoReg<= 1'b0;
                MemWrite<= 1'b0;
                ALUsrc<= 1'b1;
                RegWrite<= 1'b1;
                Jump<=1'b0;
                ALUop<=2'b11;
            end
            6'b100011: begin // lw
                RegDst<= 1'b0;
                BranchT<=1'b0;
                BranchF<=1'b0;
                MemRead<= 1'b1;
                MemtoReg<= 1'b1;
                MemWrite<= 1'b0;
                ALUsrc<= 1'b1;
                RegWrite<= 1'b1;
                Jump<=1'b0;
                ALUop<=2'b00;
            end
            6'b101011: begin // sw
                RegDst<= 1'b0;
                BranchT<=1'b0;
                BranchF<=1'b0;
                MemRead<= 1'b0;
                MemtoReg<= 1'b0;
                MemWrite<= 1'b1;
                ALUsrc<= 1'b1;
                RegWrite<= 1'b0;
                Jump<=1'b0;
                ALUop<=2'b00;
            end
        endcase
    end    
endmodule

module register(clk,RegWrite,ReadRegister1,ReadRegister2,WriteRegister,WriteData,ReadData1,ReadData2);
    input clk,RegWrite;
    input[4:0]ReadRegister1,ReadRegister2,WriteRegister;
    input [31:0]WriteData;
    output [31:0]ReadData1,ReadData2;
    wire [31:0]ReadData1,ReadData2;
    parameter num=32;
    reg [31:0]Data[0:num-1];
    reg i;
    initial for(i=0;i<num;i=i+1)Data[i]=0;
    assign ReadData1=Data[ReadRegister1];
    assign ReadData2=Data[ReadRegister2];
    always @(negedge clk)if(RegWrite)Data[WriteRegister]=WriteData;
endmodule

module ALU_control(fun,ALUop,ALUcontrol);
    input [5:0]fun;
    input [1:0]ALUop;
    output [3:0]ALUcontrol;
    reg [3:0]ALUcontrol;
    initial ALUcontrol=4'b0000;
    always@(fun,ALUop)begin
        case (ALUop)
        2'b00:ALUcontrol = 4'b0010;
        2'b01:ALUcontrol = 4'b0110;
        2'b10:
            case (fun)
                6'b100000:ALUcontrol = 4'b0010;
                6'b100010:ALUcontrol = 4'b0110;
                6'b100100:ALUcontrol = 4'b0000;
                6'b100101:ALUcontrol = 4'b0001;
                6'b101010:ALUcontrol = 4'b0111;
                default:ALUcontrol=4'b0010;
            endcase
        2'b11:
            case(fun)
                6'b001000:ALUcontrol=4'b0010;//addi
                6'b001100:ALUcontrol=4'b0000;//andi
                default:ALUcontrol=4'b0010;
            endcase
        endcase
    end
endmodule 

module  ALU(ALUcontrol,ALUin1,ALUin2,ALUresult,Zero);
    input [3:0]ALUcontrol;
    input [31:0]ALUin1,ALUin2;
    output [31:0]ALUresult;
    output Zero;
    reg [31:0]ALUresult;
    reg Zero;
    initial ALUresult=0;
    always @ ( ALUcontrol,ALUin1,ALUin2) begin
        case (ALUcontrol)
            4'b0000:ALUresult=ALUin1&ALUin2;
            4'b0001:ALUresult=ALUin1|ALUin2;
            4'b0010:ALUresult=ALUin1+ALUin2;
            4'b0110:ALUresult=ALUin1-ALUin2;
            4'b0111:ALUresult=(ALUin1<ALUin2) ? 1:0;
            4'b1100:ALUresult=~(ALUin1|ALUin2);
            default: ;
        endcase
        Zero=(ALUresult==0);        
    end
endmodule