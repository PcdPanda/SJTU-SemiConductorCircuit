`timescale 1ns / 1ps                        
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/12 12:16:08
// Design Name: 
// Module Name: single cycle
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


module SingleCycle(clk,PC,s0,s1,s2,s3,s4,s5,s6,s7,t0,t1,t2,t3,t4,t5,t6,t7,t8,t9);
    input clk;
    output [31:0]PC,s0,s1,s2,s3,s4,s5,s6,s7,t0,t1,t2,t3,t4,t5,t6,t7,t8,t9; 
    wire[31:0]currentPC,instruction,SignExtend,ReadData1,ReadData2,ALUresult,MemData,WriteData;
    wire RegDst,MemRead,MemtoReg,MemWrite,ALUsrc,RegWrite,Jump,Zero,PCsrc,BranchT,BranchF;
    wire [2:0]ALUop;
    wire [4:0]WriteRegister;
    assign PC=currentPC;
    IF IF(currentPC,instruction);
    ID ID(clk,instruction,SignExtend,ReadData1,ReadData2,WriteData,BranchT,BranchF,MemRead,MemtoReg,ALUop,MemWrite,ALUsrc,RegWrite,WriteRegister,Jump,s0,s1,s2,s3,s4,s5,s6,s7,t0,t1,t2,t3,t4,t5,t6,t7,t8,t9);
    EX EX(ALUsrc,ALUop,ReadData1,ReadData2,SignExtend,ALUresult,Zero);
    MEM MEM(clk,ALUresult,ReadData2,Zero,MemRead,MemWrite,BranchT,BranchF,MemData,PCsrc);
    WB WB(clk,instruction,MemtoReg,MemData,RegWrite,WriteRegister,ALUresult,PCsrc,SignExtend,Jump,currentPC,WriteData);
endmodule


module IF(currentPC,instruction);
    input [31:0]currentPC;
    output[31:0] instruction;
    reg [31:0]memory[0:29];
    initial begin
    memory[0] = 32'b00100000000010000000000000100000; //addi $t0, $zero, 0x20
    memory[1] = 32'b00100000000010010000000000110111; //addi $t1, $zero, 0x37
    memory[2] = 32'b00000001000010011000000000100100; //and $s0, $t0, $t1
    memory[3] = 32'b00000001000010011000000000100101; //or $s0, $t0, $t1
    memory[4] = 32'b10101100000100000000000000000100; //sw $s0, 4($zero)
    memory[5] = 32'b10101100000010000000000000001000; //sw $t0, 8($zero)
    memory[6] = 32'b00000001000010011000100000100000; //add $s1, $t0, $t1
    memory[7] = 32'b00000001000010011001000000100010; //sub $s2, $t0, $t1
    memory[8] = 32'b00010010001100100000000000001001; //beq $s1, $s2, error0
    memory[9] = 32'b10001100000100010000000000000100; //lw $s1, 4($zero)
    memory[10]= 32'b00110010001100100000000001001000; //andi $s2, $s1, 0x48
    memory[11] =32'b00010010001100100000000000001001; //beq $s1, $s2, error1
    memory[12] =32'b10001100000100110000000000001000; //lw $s3, 8($zero)
    memory[13] =32'b00010010000100110000000000001010; //beq $s0, $s3, error2
    memory[14] =32'b00000010010100011010000000101010; //slt $s4, $s2, $s1 (Last)
    memory[15] =32'b00010010100000000000000000001111; //beq $s4, $0, EXIT
    memory[16] =32'b00000010001000001001000000100000; //add $s2, $s1, $0
    memory[17] =32'b00001000000000000000000000001110; //j Last
    memory[18] =32'b00100000000010000000000000000000; //addi $t0, $0, 0(error0)
    memory[19] =32'b00100000000010010000000000000000; //addi $t1, $0, 0
    memory[20] =32'b00001000000000000000000000011111; //j EXIT
    memory[21] =32'b00100000000010000000000000000001; //addi $t0, $0, 1(error1)
    memory[22] =32'b00100000000010010000000000000001; //addi $t1, $0, 1
    memory[23] =32'b00001000000000000000000000011111; //j EXIT
    memory[24] =32'b00100000000010000000000000000010; //addi $t0, $0, 2(error2)
    memory[25] =32'b00100000000010010000000000000010; //addi $t1, $0, 2
    memory[26] =32'b00001000000000000000000000011111; //j EXIT
    memory[27] =32'b00100000000010000000000000000011; //addi $t0, $0, 3(error3)
    memory[28] =32'b00100000000010010000000000000011; //addi $t1, $0, 3
    memory[29] =32'b00001000000000000000000000011111; //j EXIT
    end
    assign instruction=memory[currentPC>>2];
endmodule   

module ID(clk,instruction,SignExtend,ReadData1,ReadData2,WriteData,BranchT,BranchF,MemRead,MemtoReg,ALUop,MemWrite,ALUsrc,RegWrite,WriteRegister,Jump,s0,s1,s2,s3,s4,s5,s6,s7,t0,t1,t2,t3,t4,t5,t6,t7,t8,t9);
    input clk;
    input [31:0]instruction,WriteData;
    output [31:0]SignExtend,ReadData1,ReadData2;
    output BranchT,BranchF,MemRead,MemtoReg,MemWrite,ALUsrc,RegWrite,Jump;
    output[2:0]ALUop;
    output [4:0]WriteRegister;   
    output [31:0]s0,s1,s2,s3,s4,s5,s6,s7,t0,t1,t2,t3,t4,t5,t6,t7,t8,t9;
    wire RegDst,BranchT,BranchF,MemRead,MemtoReg,MemWrite,ALUsrc,RegWrite,Jump;
    reg [31:0]SignExtend;
    initial  SignExtend=0;
    control control(instruction[31:26],RegDst,BranchT,BranchF,MemRead,MemtoReg,ALUop,MemWrite,ALUsrc,RegWrite,Jump);
    always@(instruction)SignExtend = {{16{instruction[15]}}, instruction[15:0]};//SignExtend
    assign WriteRegister = (RegDst == 1'b0) ? instruction[20:16] : instruction[15:11];
    register register(clk,RegWrite,instruction[25:21],instruction[20:16],WriteRegister,WriteData,ReadData1,ReadData2,s0,s1,s2,s3,s4,s5,s6,s7,t0,t1,t2,t3,t4,t5,t6,t7,t8,t9);
endmodule

module EX(ALUsrc,ALUop,ReadData1,ReadData2,SignExtend,ALUresult,Zero);
    input ALUsrc;
    input [2:0]ALUop;
    input [31:0]ReadData1,ReadData2,SignExtend;
    output [31:0]ALUresult;
    output Zero;
    wire [3:0]ALUcontrol;
    wire [31:0]ALUin;
    assign ALUin = (ALUsrc == 1'b0) ? ReadData2 :SignExtend; 
    ALU_control ALU_control(SignExtend[5:0],ALUop,ALUcontrol);  
    ALU ALU(ALUcontrol,ReadData1,ALUin,ALUresult,Zero);
endmodule

module MEM(clk,Address,ReadData,Zero,MemRead,MemWrite,BranchT,BranchF,MemData,PCsrc);
    input [31:0]Address,ReadData;
    input clk,Zero,MemRead,MemWrite,BranchT,BranchF;
    output [31:0]MemData;
    output PCsrc;
    reg [5:0]i;
    parameter num=32;
    reg [31:0]mem[0:num-1];
    initial for(i=0;i<num;i=i+1)mem[i]=0;
    assign MemData=(MemRead==1) ? mem[Address]:0;
    assign PCsrc=(Zero&&BranchT)||(!Zero&&BranchF);
    always @(negedge clk)if(MemWrite)mem[Address]=ReadData;

endmodule

module WB(clk,instruction,MemtoReg,MemData,RegWrite,WriteRegister,ALUresult,PCsrc,SignExtend,Jump,currentPC,WriteData);
    input clk,MemtoReg,PCsrc,RegWrite,Jump;
    input [31:0]instruction,MemData,ALUresult,SignExtend;
    input [4:0]WriteRegister;
    output [31:0]currentPC;
    wire [31:0]ReadData1,ReadData2;
    wire Zero;
    reg [31:0]currentPC,nextPC,WriteData;
    wire [31:0]BranchAddress,BranchALUResult,BranchResult,JumpAddress;
    output [31:0]WriteData;
    initial begin 
        currentPC=32'b0;  
        nextPC=32'b0;
        WriteData=0;
    end
    always@(MemData,ALUresult,MemtoReg)begin
        if(MemtoReg)WriteData<=MemData;
        else WriteData<=ALUresult;
    end 
    ALU ALU(4'b0010,nextPC,(SignExtend<<2),BranchALUResult,Zero);
    assign BranchResult=(PCsrc==1'b1) ? BranchALUResult:nextPC;  
    assign JumpAddress={nextPC[31:28],instruction[25:0],2'b00};
    always @(negedge clk) begin
        currentPC=(Jump==1'b1) ? JumpAddress:BranchResult;
        nextPC=currentPC+4;      
    end
endmodule

module control(opcode,RegDst,BranchT,BranchF,MemRead,MemtoReg,ALUop,MemWrite,ALUsrc,RegWrite,Jump);
    input[5:0]opcode;
    output RegDst,BranchT,BranchF,MemRead,MemtoReg,MemWrite,ALUsrc,RegWrite,Jump;
    output [2:0]ALUop;
    reg RegDst,BranchT,BranchF,MemRead,MemtoReg,MemWrite,ALUsrc,RegWrite,Jump;
    reg [2:0]ALUop;    
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
        ALUop=3'b000;
    end
    always @(opcode)begin
        case (opcode)
            6'b000000: begin //R
                RegDst= 1'b1;
                BranchT=1'b0;
                BranchF=1'b0;
                MemRead= 1'b0;
                MemtoReg= 1'b0;
                MemWrite= 1'b0;
                ALUsrc= 1'b0;
                RegWrite= 1'b1;
                Jump=1'b0;
                ALUop=3'b010;
            end
            6'b000010: begin // j
                RegDst= 1'b0;
                BranchT=1'b0;
                BranchF=1'b0;
                MemRead= 1'b0;
                MemtoReg= 1'b0;
                MemWrite= 1'b0;
                ALUsrc= 1'b0;
                RegWrite= 1'b0;
                Jump=1'b1;
                ALUop=3'b010;
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
                Jump=1'b0;
                ALUop=3'b001;
            end
            6'b000101: begin // bne
                RegDst= 1'b1;
                BranchT=1'b0;
                BranchF=1'b1;
                MemRead= 1'b0;
                MemtoReg= 1'b0;
                MemWrite= 1'b0;
                ALUsrc= 1'b0;
                RegWrite= 1'b0;
                Jump=1'b0;
                ALUop=3'b001;
            end
            6'b001000: begin // addi
                RegDst= 1'b0;
                BranchT=1'b0;
                BranchF=1'b0;
                MemRead= 1'b0;
                MemtoReg= 1'b0;
                MemWrite= 1'b0;
                ALUsrc= 1'b1;
                RegWrite= 1'b1;
                Jump=1'b0;
                ALUop=3'b011;
            end
            6'b001100: begin // andi
                RegDst= 1'b0;
                BranchT=1'b0;
                BranchF=1'b0;
                MemRead= 1'b0;
                MemtoReg= 1'b0;
                MemWrite= 1'b0;
                ALUsrc= 1'b1;
                RegWrite= 1'b1;
                Jump=1'b0;
                ALUop=3'b100;
            end
            6'b100011: begin // lw
                RegDst= 1'b0;
                BranchT=1'b0;
                BranchF=1'b0;
                MemRead= 1'b1;
                MemtoReg= 1'b1;
                MemWrite= 1'b0;
                ALUsrc= 1'b1;
                RegWrite= 1'b1;
                Jump=1'b0;
                ALUop=3'b000;
            end
            6'b101011: begin // sw
                RegDst= 1'b0;
                BranchT=1'b0;
                BranchF=1'b0;
                MemRead= 1'b0;
                MemtoReg= 1'b0;
                MemWrite= 1'b1;
                ALUsrc= 1'b1;
                RegWrite= 1'b0;
                Jump=1'b0;
                ALUop=3'b000;
            end
        endcase
    end    
endmodule

module register(clk,RegWrite,ReadRegister1,ReadRegister2,WriteRegister,WriteData,ReadData1,ReadData2,s0,s1,s2,s3,s4,s5,s6,s7,t0,t1,t2,t3,t4,t5,t6,t7,t8,t9);
    input clk,RegWrite;
    input[4:0]ReadRegister1,ReadRegister2,WriteRegister;
    input [31:0]WriteData;
    output [31:0]ReadData1,ReadData2;
    output [31:0]s0,s1,s2,s3,s4,s5,s6,s7,t0,t1,t2,t3,t4,t5,t6,t7,t8,t9;
    parameter num=32;
    reg [31:0]Data[0:num-1],R;
    reg [5:0]i;
    initial for(i=0;i<num;i=i+1)Data[i]=0;
    assign ReadData1=Data[ReadRegister1];
    assign ReadData2=Data[ReadRegister2];
    assign s0=Data[16];
    assign s1=Data[17];
    assign s2=Data[18];
    assign s3=Data[19];
    assign s4=Data[20];
    assign s5=Data[21];
    assign s6=Data[22];
    assign s7=Data[23];
    assign t0=Data[8];
    assign t1=Data[9];
    assign t2=Data[10];
    assign t3=Data[11];
    assign t4=Data[12];
    assign t5=Data[13];
    assign t6=Data[14];
    assign t7=Data[15];  
    assign t8=Data[24];
    assign t9=Data[25];   
    always @(posedge clk)if(RegWrite)Data[WriteRegister]<=WriteData;
endmodule

module ALU_control(fun,ALUop,ALUcontrol);
    input [5:0]fun;
    input [2:0]ALUop;
    output [3:0]ALUcontrol;
    reg [3:0]ALUcontrol;
    initial ALUcontrol=4'b0000;
    always@(fun,ALUop)begin
        case (ALUop)
        3'b000:ALUcontrol = 4'b0010;
        3'b001:ALUcontrol = 4'b0110;
        3'b010:
            case (fun)
                6'b100000:ALUcontrol = 4'b0010;
                6'b100010:ALUcontrol = 4'b0110;
                6'b100100:ALUcontrol = 4'b0000;
                6'b100101:ALUcontrol = 4'b0001;
                6'b101010:ALUcontrol = 4'b0111;
                default:ALUcontrol=4'b0010;
            endcase
        3'b011:ALUcontrol=4'b0010;
        3'b100:ALUcontrol=4'b0000;//andi
        default :ALUcontrol=4'b0010;
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
    initial begin
        Zero=0;
        ALUresult=0;
    end
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