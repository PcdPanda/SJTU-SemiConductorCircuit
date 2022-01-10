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

//module Pipeline(clk, T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, S0, S1, S2, S3, S4, S5, S6, S7, PCout_monitor);
module Pipeline(clk, clock,PCorReg,SW1,SW2,SW3,SW4,SW5,SSD,ring);
    input clk;
    // IF stage
    wire [31:0] PCin, PCout, instruction, nextPC;
    wire [31:0] BranchAddress, JumpAddress;
    wire [1:0] PCsrc;
    // ID stage
    wire IFID_BranchT,IFID_BranchF,IFID_Jump; // use
    wire IFID_RegDst,IFID_MemRead,IFID_MemtoReg,IFID_MemWrite,IFID_ALUsrc,IFID_RegWrite; //pass
    wire [2:0] IFID_ALUop; // pass
    wire [5:0] IFID_func; // pass
    wire [4:0] IFID_Rs, IFID_Rt, IFID_Rd; // use & pass
    wire [31:0] IFID_nextPC, IFID_instruction; // use
    wire [31:0] IFID_SignExtend; // use & pass
        // data & control hazard
    wire DataEqual;
    wire [31:0] ReadData1, ReadData2, RD1, RD2;
    wire ID_Flush, IF_Flush, EX_Flush;
    wire ID_Flush1, ID_Flush2, ID_Flush3;
    wire PCWrite, IFIDWrite;
    wire PCWrite1, PCWrite2, IFIDWrite1, IFIDWrite2;
    wire [1:0] ForwardA, ForwardB;
    wire ForwardC, ForwardD;
    // EX stage
    wire IDEX_RegDst,IDEX_ALUsrc; // use
    wire IDEX_MemRead,IDEX_MemtoReg,IDEX_MemWrite,IDEX_RegWrite; // pass
    wire [31:0] IDEX_ReadData1, IDEX_ReadData2; // use (input of mux)
    wire [31:0] IDEX_SignExtend; // use (input of mux1)
    wire [31:0] ALUin1, ALUin2; // use (output of mux1; input of ALU); pass [ALUin2]
    wire [31:0] interMUX; // use (input/output of mux1)
    wire [2:0] IDEX_ALUop; // use (input of ALU_control)
    wire [5:0] IDEX_func; // use (input of ALU_control)
    wire [3:0] ALUcontrol; // use (output of ALU_control; input of ALU)
    wire [4:0] IDEX_Rs, IDEX_Rt; // use (input of Forwarding Unit)
    wire [4:0] IDEX_Rd_temp; // use (input of mux2)
    wire [4:0] IDEX_Rd; // pass (output of mux2)
    wire [31:0] IDEX_ALUresult; // pass
    // MEM stage
    wire EXMEM_MemRead,EXMEM_MemWrite; // use
    wire EXMEM_MemtoReg, EXMEM_RegWrite; // pass
    wire [4:0] EXMEM_Rd; // pass
    wire [31:0] EXMEM_WD; // use; [ALUin2] in EX stage
    wire [31:0] EXMEM_ALUresult; // use & pass
    wire [31:0] EXMEM_MEMresult; // pass
    // WB stage
    wire MEMWB_MemtoReg,MEMWB_RegWrite;
    wire [4:0] MEMWB_Rd;
    wire [31:0] MEMWB_ALUresult; // mux input
    wire [31:0] MEMWB_MEMresult; // mux input
    wire [31:0] MEMWB_WriteData; // mux output

    wire [31:0] t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, s0, s1, s2, s3, s4, s5, s6, s7;
    
    // For Simulation:
//    output [31:0] T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, S0, S1, S2, S3, S4, S5, S6, S7, PCout_monitor;
//    assign PCout_monitor = PCout;
//    assign T0 = t0;
//    assign T1 = t1;
//    assign T2 = t2;
//    assign T3 = t3;
//    assign T4 = t4;
//    assign T5 = t5;
//    assign T6 = t6;
//    assign T7 = t7;
//    assign T8 = t8;
//    assign T9 = t9;
//    assign S0 = s0;
//    assign S1 = s1;
//    assign S2 = s2;
//    assign S3 = s3;
//    assign S4 = s4;
//    assign S5 = s5;
//    assign S6 = s6;
//    assign S7 = s7;

    // For Demo:
    input clock,PCorReg,SW1,SW2,SW3,SW4,SW5; 
    output [6:0]SSD;
    output [3:0]ring;
    wire clk500;
    wire [4:0] RegID;
    wire [31:0] Data;
    assign RegID = {SW5, SW4, SW3, SW2, SW1};
    clock500 CK(clock,clk500);
    ring RG(clk500,ring);
    Display Display(ring,PCorReg,PCout,Data,SSD); 
    chooseData CHOOSE(Data,RegID,t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, s0, s1, s2, s3, s4, s5, s6, s7);
  
  
    // ============================ IF STAGE ============================
    MUX_3to1_32bit PCselect(PCin, nextPC, JumpAddress, BranchAddress, PCsrc);
    PC PC(PCout, nextPC, PCin, PCWrite, clk);
    IF IM(PCout,instruction);
    // ===================== IF/ID pipeline register =====================
    IFID IFID(IFID_nextPC, IFID_instruction, nextPC, instruction, IF_Flush, IFIDWrite, clk);
    // ============================ ID STAGE ============================
    control control(IFID_instruction[31:26],IFID_RegDst,IFID_BranchT,IFID_BranchF,IFID_MemRead,IFID_MemtoReg,IFID_ALUop,IFID_MemWrite,IFID_ALUsrc,IFID_RegWrite,IFID_Jump);
    assign IFID_SignExtend = {{16{IFID_instruction[15]}}, IFID_instruction[15:0]};
    assign IFID_Rs = IFID_instruction[25:21];
    assign IFID_Rt = IFID_instruction[20:16];
    assign IFID_Rd = IFID_instruction[15:11];
    assign IFID_func = IFID_instruction[5:0];
    PCsrcCalculate PCsrcCalculate (PCsrc, IFID_BranchT, IFID_BranchF, IFID_Jump, DataEqual);   
    register Reg (clk,MEMWB_RegWrite,IFID_Rs,IFID_Rt,MEMWB_Rd,MEMWB_WriteData,ReadData1,ReadData2, t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, s0, s1, s2, s3, s4, s5, s6, s7);
            // data hazard (part 1/2)
    HazardDetectionUnit DH1 (IFIDWrite1,PCWrite1, ID_Flush1, IDEX_MemRead, IFID_Rs, IFID_Rt, IDEX_Rt);
            // control hazard
    JumpAddressCalculate CH0 (JumpAddress, IFID_nextPC - 4, IFID_instruction[25:0]);
    BranchAddressCalculate CH1 (BranchAddress, IFID_SignExtend, IFID_nextPC);
    RegisterComparator CH2 (DataEqual, RD1, RD2);
    PenaltyDetect CH3 (IF_Flush, ID_Flush3, EX_Flush, IFID_BranchT, IFID_BranchF, DataEqual, IFID_Jump, PCWrite);
    NewDataHazardResolve CH4 (PCWrite2, IFIDWrite2, ID_Flush2, ForwardC, ForwardD, IFID_Rs, IFID_Rt, EXMEM_Rd, IDEX_Rd, EXMEM_MemRead, IDEX_MemRead, EXMEM_RegWrite, IDEX_RegWrite, IFID_BranchT, IFID_BranchF);
    MUX_2to1_32bit CH5 (RD1, ReadData1, EXMEM_ALUresult, ForwardC);
    MUX_2to1_32bit CH6 (RD2, ReadData2, EXMEM_ALUresult, ForwardD);
            // two 2-input AND gates and one 3-input OR gate
    and PCWrite_and (PCWrite, PCWrite1, PCWrite2);
    and IFIDWrite_and (IFIDWrite, IFIDWrite1, IFIDWrite2);
    or IDFlush_or (ID_Flush, ID_Flush1, ID_Flush2, ID_Flush3);
    // ===================== ID/EX pipeline register =====================
    IDEX IDEX(IDEX_RegDst,IDEX_ALUsrc,IDEX_MemRead,IDEX_MemtoReg,IDEX_MemWrite,IDEX_RegWrite,IDEX_ALUop,IDEX_func,IDEX_ReadData1,IDEX_ReadData2,IDEX_SignExtend,IDEX_Rs,IDEX_Rt,IDEX_Rd_temp,IFID_RegDst,IFID_MemRead,IFID_MemtoReg,IFID_MemWrite,IFID_ALUsrc,IFID_RegWrite,IFID_ALUop,IFID_func,IFID_Rs,IFID_Rt,IFID_Rd,ReadData1,ReadData2,IFID_SignExtend,clk,ID_Flush);
    // ============================ EX STAGE ============================
    ALU_control ALU_control(IDEX_func,IDEX_ALUop,ALUcontrol);
    ALU ALU(ALUcontrol,ALUin1,ALUin2,IDEX_ALUresult);
    MUX_2to1_32bit EX1 (ALUin2, interMUX, IDEX_SignExtend, IDEX_ALUsrc);
    MUX_2to1_5bit EX2 (IDEX_Rd, IDEX_Rt, IDEX_Rd_temp, IDEX_RegDst);
        // data hazard (part 2/2)
    ForwardUnit DH2 (ForwardA,ForwardB,IDEX_Rs,IDEX_Rt,EXMEM_Rd, MEMWB_Rd,EXMEM_RegWrite,MEMWB_RegWrite);
    MUX_3to1_32bit DH3 (ALUin1, IDEX_ReadData1, MEMWB_WriteData, EXMEM_ALUresult, ForwardA);
    MUX_3to1_32bit DH4 (interMUX, IDEX_ReadData2, MEMWB_WriteData, EXMEM_ALUresult, ForwardB);
    // ===================== EX/MEM pipeline register =====================
    EXMEM EXMEM(EXMEM_MemRead,EXMEM_MemWrite,EXMEM_MemtoReg,EXMEM_RegWrite,EXMEM_Rd,EXMEM_WD,EXMEM_ALUresult,IDEX_MemRead,IDEX_MemtoReg,IDEX_MemWrite,IDEX_RegWrite,interMUX,IDEX_ALUresult,IDEX_Rd,clk,EX_Flush);
    // ============================ MEM STAGE ============================
    MEM DM(clk,EXMEM_ALUresult,EXMEM_WD,EXMEM_MemRead,EXMEM_MemWrite,EXMEM_MEMresult);
    
    // ===================== MEM/WB pipeline register =====================
    MEMWB MEMWB(MEMWB_MemtoReg,MEMWB_RegWrite,MEMWB_Rd,MEMWB_ALUresult,MEMWB_MEMresult,EXMEM_MemtoReg,EXMEM_RegWrite,EXMEM_Rd,EXMEM_ALUresult,EXMEM_MEMresult,clk);
    // ============================ WE STAGE ============================
    MUX_2to1_32bit WB(MEMWB_WriteData, MEMWB_ALUresult, MEMWB_MEMresult, MEMWB_MemtoReg);
endmodule

//////////////////////////////////////////////////////////////////////////////////
// Pipeline Registers
//////////////////////////////////////////////////////////////////////////////////
module IFID(IFID_nextPC, IFID_instruction, nextPC, instruction, IF_Flush, IFIDWrite, clk);
output reg [31:0] IFID_nextPC, IFID_instruction;
input [31:0] nextPC, instruction;
input IFIDWrite, IF_Flush, clk;
initial begin
    IFID_nextPC = 32'b0;
    IFID_instruction = 32'b11111100000000000000000000000000;
end
always @(negedge clk)begin
    if (IF_Flush) begin
        IFID_nextPC <= 32'b0;
        IFID_instruction <= 32'b11111100000000000000000000000000;
    end
    if (!IF_Flush && IFIDWrite) begin
        IFID_nextPC <= nextPC;
        IFID_instruction <= instruction;
    end
end
endmodule

module IDEX(IDEX_RegDst,IDEX_ALUsrc,IDEX_MemRead,IDEX_MemtoReg,IDEX_MemWrite,IDEX_RegWrite,IDEX_ALUop,IDEX_func,IDEX_ReadData1,IDEX_ReadData2,IDEX_SignExtend,IDEX_Rs,IDEX_Rt,IDEX_Rd_temp,IFID_RegDst,IFID_MemRead,IFID_MemtoReg,IFID_MemWrite,IFID_ALUsrc,IFID_RegWrite,IFID_ALUop,IFID_func,IFID_Rs,IFID_Rt,IFID_Rd,ReadData1,ReadData2,IFID_SignExtend,clk,ID_Flush);
input clk;
input ID_Flush;
input IFID_RegDst,IFID_MemRead,IFID_MemtoReg,IFID_MemWrite,IFID_ALUsrc,IFID_RegWrite;
input [2:0] IFID_ALUop;
input [5:0] IFID_func;
input [31:0] ReadData1, ReadData2, IFID_SignExtend;
input [4:0] IFID_Rs, IFID_Rt, IFID_Rd;
output reg IDEX_RegDst,IDEX_ALUsrc,IDEX_MemRead,IDEX_MemtoReg,IDEX_MemWrite,IDEX_RegWrite;
output reg [2:0] IDEX_ALUop;
output reg [5:0] IDEX_func;
output reg [31:0] IDEX_ReadData1, IDEX_ReadData2, IDEX_SignExtend;
output reg [4:0] IDEX_Rs, IDEX_Rt, IDEX_Rd_temp;
initial begin
    IDEX_RegDst = 1'b0;
    IDEX_ALUsrc = 1'b0;
    IDEX_MemRead = 1'b0;
    IDEX_MemtoReg = 1'b0;
    IDEX_MemWrite = 1'b0;
    IDEX_RegWrite = 1'b0;
    IDEX_ALUop = 3'b0;
    IDEX_func = 6'b0;
    IDEX_ReadData1 = 32'b0;
    IDEX_ReadData2 = 32'b0;
    IDEX_SignExtend = 32'b0;
    IDEX_Rs = 5'b0;
    IDEX_Rt = 5'b0;
    IDEX_Rd_temp = 5'b0;
end
always @(negedge clk)begin
    IDEX_RegDst <= IFID_RegDst & (~ID_Flush);
    IDEX_ALUsrc <= IFID_ALUsrc & (~ID_Flush);
    IDEX_MemRead <= IFID_MemRead & (~ID_Flush);
    IDEX_MemtoReg <= IFID_MemtoReg & (~ID_Flush);
    IDEX_MemWrite <= IFID_MemWrite & (~ID_Flush);
    IDEX_RegWrite <= IFID_RegWrite & (~ID_Flush);
    IDEX_ALUop <= IFID_ALUop & (~ID_Flush);
    IDEX_func <= IFID_func & (~ID_Flush);
    IDEX_ReadData1 <= ReadData1;
    IDEX_ReadData2 <= ReadData2;
    IDEX_SignExtend <= IFID_SignExtend;
    IDEX_Rs <= IFID_Rs;
    IDEX_Rt <= IFID_Rt;
    IDEX_Rd_temp <= IFID_Rd;       
end
endmodule

module EXMEM(EXMEM_MemRead,EXMEM_MemWrite,EXMEM_MemtoReg,EXMEM_RegWrite,EXMEM_Rd,EXMEM_WD,EXMEM_ALUresult,IDEX_MemRead,IDEX_MemtoReg,IDEX_MemWrite,IDEX_RegWrite,interMUX,IDEX_ALUresult,IDEX_Rd,clk,EX_Flush);
input clk;
input EX_Flush;
input IDEX_MemRead, IDEX_MemtoReg, IDEX_MemWrite, IDEX_RegWrite;
input [31:0] interMUX, IDEX_ALUresult;
input [4:0] IDEX_Rd;
output reg EXMEM_MemRead, EXMEM_MemWrite, EXMEM_MemtoReg, EXMEM_RegWrite;
output reg [4:0] EXMEM_Rd;
output reg [31:0] EXMEM_WD, EXMEM_ALUresult; // [EXMEM_WD] = [interMUX] in EX stage
initial begin
    EXMEM_MemRead = 1'b0;
    EXMEM_MemWrite = 1'b0;
    EXMEM_MemtoReg = 1'b0;
    EXMEM_RegWrite = 1'b0;
    EXMEM_Rd = 5'b0;
    EXMEM_WD = 32'b0;
    EXMEM_ALUresult = 32'b0;
end
always @(negedge clk)begin
    EXMEM_MemRead <= IDEX_MemRead & (~EX_Flush);
    EXMEM_MemWrite <= IDEX_MemWrite & (~EX_Flush);
    EXMEM_MemtoReg <= IDEX_MemtoReg & (~EX_Flush);
    EXMEM_RegWrite <= IDEX_RegWrite & (~EX_Flush);
    EXMEM_Rd <= IDEX_Rd;
    EXMEM_WD <= interMUX;
    EXMEM_ALUresult <= IDEX_ALUresult;
end
endmodule

module MEMWB(MEMWB_MemtoReg,MEMWB_RegWrite,MEMWB_Rd,MEMWB_ALUresult,MEMWB_MEMresult,EXMEM_MemtoReg,EXMEM_RegWrite,EXMEM_Rd,EXMEM_ALUresult,EXMEM_MEMresult,clk);
input clk;
input EXMEM_MemtoReg, EXMEM_RegWrite;
input [4:0] EXMEM_Rd;
input [31:0] EXMEM_ALUresult, EXMEM_MEMresult;
output reg MEMWB_MemtoReg, MEMWB_RegWrite;
output reg [4:0] MEMWB_Rd;
output reg [31:0] MEMWB_ALUresult, MEMWB_MEMresult;

initial begin
    MEMWB_MemtoReg = 1'b0;
    MEMWB_RegWrite = 1'b0;
    MEMWB_Rd = 5'b0;
    MEMWB_ALUresult = 32'b0;
    MEMWB_MEMresult = 32'b0;
end
always @(negedge clk)begin
    MEMWB_MemtoReg <= EXMEM_MemtoReg;
    MEMWB_RegWrite <= EXMEM_RegWrite;
    MEMWB_Rd <= EXMEM_Rd;
    MEMWB_ALUresult <= EXMEM_ALUresult;
    MEMWB_MEMresult <= EXMEM_MEMresult;
end
endmodule


//////////////////////////////////////////////////////////////////////////////////
// Additional Pipeline Modules (modified from single cycle)
//////////////////////////////////////////////////////////////////////////////////
// ============================ IF stage ============================
module PC(PCout, nextPC, PCin, PCWrite, clk);
output reg [31:0] PCout, nextPC;
input [31:0] PCin;
input PCWrite, clk;
initial begin
    PCout = 32'b0;
    nextPC = 32'b100;
end
always @(negedge clk)begin
    if (PCWrite) begin
        PCout <= PCin;
        nextPC <= PCin + 4;
    end
end
endmodule

module IF(currentPC,instruction);
    input [31:0]currentPC;
    output [31:0] instruction;
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
    assign instruction = memory[currentPC>>2];
endmodule

// ============================ ID stage ============================
module PCsrcCalculate (PCsrc, IFID_BranchT, IFID_BranchF, IFID_Jump, DataEqual);
output [1:0] PCsrc;
input IFID_BranchT, IFID_BranchF, IFID_Jump, DataEqual;
reg [1:0] PCsrc;
initial PCsrc = 2'b00;
    always @(DataEqual, IFID_BranchT, IFID_BranchF, IFID_Jump) PCsrc <= { ( (DataEqual && IFID_BranchT) || (!DataEqual && IFID_BranchF) ), IFID_Jump};
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
            default: begin // other (initial)
                RegDst= 1'b0;
                BranchT=1'b0;
                BranchF=1'b0;
                MemRead= 1'b0;
                MemtoReg= 1'b0;
                MemWrite= 1'b0;
                ALUsrc= 1'b0;
                RegWrite= 1'b0;
                Jump=1'b0;
                ALUop=3'b000;
            end
        endcase
    end    
endmodule

module register(clk,RegWrite,ReadRegister1,ReadRegister2,WriteRegister,WriteData,ReadData1,ReadData2,t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, s0, s1, s2, s3, s4, s5, s6, s7);
    input clk,RegWrite;
    input[4:0]ReadRegister1,ReadRegister2,WriteRegister;
    input [31:0]WriteData;
    output [31:0]ReadData1,ReadData2;
    output [31:0]t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, s0, s1, s2, s3, s4, s5, s6, s7;
    parameter num=32;
    reg [31:0]Data[0:num-1],R;
    reg [5:0]i;
    initial for(i=0;i<num;i=i+1)Data[i]=0;
    //*******************************************************************************************************
    assign t0 = Data[8];
    assign t1 = Data[9];
    assign t2 = Data[10];
    assign t3 = Data[11];
    assign t4 = Data[12];
    assign t5 = Data[13];
    assign t6 = Data[14];
    assign t7 = Data[15];
    assign t8 = Data[24];
    assign t9 = Data[25];
    assign s0 = Data[16];
    assign s1 = Data[17];
    assign s2 = Data[18];
    assign s3 = Data[19];
    assign s4 = Data[20];
    assign s5 = Data[21];
    assign s6 = Data[22];
    assign s7 = Data[23]; 
    //*******************************************************************************************************
    assign ReadData1=Data[ReadRegister1];
    assign ReadData2=Data[ReadRegister2];
    always @(posedge clk) begin
        if(RegWrite) Data[WriteRegister]<=WriteData;
    end
endmodule

module HazardDetectionUnit(IFIDWrite1,PCWrite1, ID_Flush1, IDEX_MemRead, IFID_Rs, IFID_Rt, IDEX_Rt);
    output IFIDWrite1, PCWrite1, ID_Flush1;
    reg IFIDWrite1, PCWrite1, ID_Flush1;
    input IDEX_MemRead;
    input [4:0] IFID_Rs, IFID_Rt, IDEX_Rt;
    initial begin
        IFIDWrite1 = 1'b1;
        PCWrite1 = 1'b1;
        ID_Flush1 = 1'b0;
    end
    always @ (IDEX_MemRead, IFID_Rs, IFID_Rt, IDEX_Rt) begin
        if(IDEX_MemRead && ((IDEX_Rt == IFID_Rs) || (IDEX_Rt == IFID_Rt)) )
            begin
                IFIDWrite1 <= 1'b0;
                PCWrite1 <= 1'b0;
                ID_Flush1 <= 1'b1;
            end
        else
            begin
                IFIDWrite1 <= 1'b1;
                PCWrite1 <= 1'b1;
                ID_Flush1 <= 1'b0;
            end
    end
endmodule

// ============================ EX stage ============================
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

module  ALU(ALUcontrol,ALUin1,ALUin2,ALUresult); // delete [Zero] from single cycle
    input [3:0]ALUcontrol;
    input [31:0]ALUin1,ALUin2;
    output [31:0]ALUresult;
    reg [31:0]ALUresult;
    initial begin
        ALUresult=32'b0;
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
    end
endmodule

module ForwardUnit(ForwardA,ForwardB,IDEX_Rs,IDEX_Rt,EXMEM_Rd, MEMWB_Rd,EXMEM_RegWrite,MEMWB_RegWrite);
    output [1:0] ForwardA,ForwardB;
    reg [1:0] ForwardA,ForwardB;
    input [4:0] IDEX_Rs,IDEX_Rt,EXMEM_Rd, MEMWB_Rd;
    input EXMEM_RegWrite,MEMWB_RegWrite;
    initial begin
        ForwardA = 2'b00;
        ForwardB = 2'b00;
    end
    always @ (IDEX_Rs,IDEX_Rt,EXMEM_Rd, MEMWB_Rd,EXMEM_RegWrite,MEMWB_RegWrite) begin
        if (EXMEM_RegWrite && (EXMEM_Rd!=0) && EXMEM_Rd == IDEX_Rs)
            ForwardA = 2'b10;
        else if (MEMWB_RegWrite && (MEMWB_Rd!=0) && MEMWB_Rd == IDEX_Rs)
            ForwardA = 2'b01;
        else
            ForwardA = 2'b00;
        
        if(EXMEM_RegWrite && (EXMEM_Rd!=0) && EXMEM_Rd == IDEX_Rt)
            ForwardB = 2'b10;
        else if (MEMWB_RegWrite && (MEMWB_Rd!=0) && MEMWB_Rd == IDEX_Rt)
            ForwardB = 2'b01;
        else
            ForwardB = 2'b00;
    end
endmodule

// ============================ MEM stage ============================
module MEM(clk,Address,WD,MemRead,MemWrite,RD);// modified [MEM] from single cycle (delete PCsrc and Zero)
    input [31:0]Address,WD;
    input clk,MemRead,MemWrite;
    output [31:0]RD;
    reg [5:0]i;
    parameter num=32;
    reg [31:0]mem[0:num-1];
    initial for(i=0;i<num;i=i+1)mem[i]=0;
    assign RD=(MemRead==1) ? mem[Address]:0;
    always @(posedge clk)if(MemWrite)mem[Address]=WD;
endmodule

/* ================= WB stage [no additional module] ================= */


//////////////////////////////////////////////////////////////////////////////////
// Additional Modules for Control Hazard in ID stage
//////////////////////////////////////////////////////////////////////////////////
// Register Comparator and Target Address Calculation
module JumpAddressCalculate (JumpAddress, IFID_PC, RelativeAddress);
output [31:0] JumpAddress;
input [31:0] IFID_PC;
input [25:0] RelativeAddress;
assign JumpAddress = {IFID_PC[31:28], RelativeAddress, 2'b00};
endmodule

module BranchAddressCalculate (BranchAddress, SignExtend, IFID_nextPC);
output [31:0] BranchAddress;
input [31:0] SignExtend, IFID_nextPC;
assign BranchAddress = IFID_nextPC + (SignExtend << 2);
endmodule

module RegisterComparator (DataEqual, RD1, RD2);
output DataEqual;
input [31:0] RD1, RD2;
assign DataEqual = (RD1 == RD2);
endmodule

module PenaltyDetect (IF_Flush, ID_Flush3, EX_Flush, BranchT, BranchF, DataEqual, IFID_Jump, PCWrite);
output reg  IF_Flush, ID_Flush3, EX_Flush;
input BranchT, BranchF, DataEqual, IFID_Jump, PCWrite;
initial begin
    IF_Flush = 1'b0;
    ID_Flush3 = 1'b0;
    EX_Flush = 1'b0;
end
always @ (PCWrite, DataEqual, BranchT, BranchF, IFID_Jump) begin
    if (PCWrite)begin // NOT stall
        if (IFID_Jump) begin
            IF_Flush <= 1'b1;
            ID_Flush3 <= 1'b0;
            EX_Flush <= 1'b0;
        end
        else if ((DataEqual && BranchT) || (!DataEqual && BranchF))
        begin
            IF_Flush <= 1'b1;
            ID_Flush3 <= 1'b1;
            EX_Flush <= 1'b1;
        end
        else begin
            IF_Flush <= 1'b0;
            ID_Flush3 <= 1'b0;
            EX_Flush <= 1'b0;
        end
    end
    else begin // stall, then does not flush
            IF_Flush <= 1'b0;
            ID_Flush3 <= 1'b0;
            EX_Flush <= 1'b0;
    end
end
endmodule

// Resolve newly created Data Hazard caused by moving branch detection to ID stage
module NewDataHazardResolve (PCWrite2, IFIDWrite2, ID_Flush2, ForwardC, ForwardD, IFID_Rs, IFID_Rt, EXMEM_Rd, IDEX_Rd, EXMEM_MemRead, IDEX_MemRead, EXMEM_RegWrite, IDEX_RegWrite, IFID_BranchT, IFID_BranchF);
output PCWrite2, IFIDWrite2, ID_Flush2;
output ForwardC, ForwardD;
input [4:0] IFID_Rs, IFID_Rt, EXMEM_Rd, IDEX_Rd;
input EXMEM_MemRead, IDEX_MemRead, EXMEM_RegWrite, IDEX_RegWrite, IFID_BranchT, IFID_BranchF;
    // first part: stall detection
    StallPart SP (PCWrite2, IFIDWrite2, ID_Flush2, IFID_Rs, IFID_Rt, EXMEM_Rd, IDEX_Rd, EXMEM_MemRead, IDEX_MemRead, IDEX_RegWrite, IFID_BranchT, IFID_BranchF);
    // second part: forwarding
    ForwardingPart FP (ForwardC, ForwardD, IFID_Rs, IFID_Rt, EXMEM_Rd, EXMEM_RegWrite);
endmodule

module StallPart (PCWrite2, IFIDWrite2, ID_Flush2, IFID_Rs, IFID_Rt, EXMEM_Rd, IDEX_Rd, EXMEM_MemRead, IDEX_MemRead, IDEX_RegWrite, IFID_BranchT, IFID_BranchF);
output PCWrite2, IFIDWrite2, ID_Flush2;
reg PCWrite2, IFIDWrite2, ID_Flush2;
input [4:0] IFID_Rs, IFID_Rt, EXMEM_Rd, IDEX_Rd;
input EXMEM_MemRead, IDEX_MemRead, IDEX_RegWrite, IFID_BranchT, IFID_BranchF;
initial begin
    PCWrite2 = 1'b1;
    IFIDWrite2 = 1'b1;
    ID_Flush2 = 1'b0;
end
    always @ (IFID_BranchT, IFID_BranchF, IFID_Rs, IFID_Rt, EXMEM_Rd, IDEX_Rd, EXMEM_MemRead, IDEX_MemRead, IDEX_RegWrite) begin
    // stall if: immediatly pre. ALU || 2nd pre. Load || immediately pre. Load
        if (IFID_BranchT || IFID_BranchF) begin
            if (   (IDEX_RegWrite && (IDEX_Rd != 0) && ((IDEX_Rd == IFID_Rs)||(IDEX_Rd == IFID_Rt))) /* immediatly pre. ALU */
                || (EXMEM_MemRead && ((EXMEM_Rd == IFID_Rs)||(EXMEM_Rd == IFID_Rt))) /* 2nd pre. Load + immediately pre. Load (2/)*/
                || (IDEX_MemRead && ((IDEX_Rd == IFID_Rs)||(IDEX_Rd == IFID_Rt)))   ) /* immediately pre. Load (1/2) */
                begin PCWrite2 <= 1'b0; IFIDWrite2 <= 1'b0; ID_Flush2 <= 1'b1; end
            else begin PCWrite2 <= 1'b1; IFIDWrite2 <= 1'b1; ID_Flush2 <= 1'b0; end
            end
        end
endmodule

module ForwardingPart (ForwardC, ForwardD, IFID_Rs, IFID_Rt, EXMEM_Rd, EXMEM_RegWrite);
output ForwardC, ForwardD;
reg ForwardC, ForwardD;
input EXMEM_RegWrite;
input [4:0] IFID_Rs, IFID_Rt, EXMEM_Rd;
initial begin
    ForwardC = 1'b0;
    ForwardD = 1'b0;
end
    always @ (IFID_Rs, IFID_Rt, EXMEM_Rd, EXMEM_RegWrite) begin
    // forwarding if: 2nd pre. ALU
        if (EXMEM_RegWrite && (EXMEM_Rd != 0) && EXMEM_Rd == IFID_Rs) ForwardC <= 1'b1;
        else ForwardC <= 1'b0;
        if (EXMEM_RegWrite && (EXMEM_Rd != 0) && EXMEM_Rd == IFID_Rt) ForwardD <= 1'b1;
        else ForwardD <= 1'b0;
        end
endmodule


//////////////////////////////////////////////////////////////////////////////////
// Additional Modules ( MUXes )
//////////////////////////////////////////////////////////////////////////////////
module MUX_2to1_32bit (out, in1, in2, sel);
output [31:0] out;
reg [31:0] out;
input [31:0] in1, in2;
input sel;
initial out = 32'b0;
always @ (in1, in2, sel) begin
    case (sel)
            1'b0: out <= in1;
            1'b1: out <= in2;
            default: ;
    endcase
    end
endmodule

module MUX_3to1_32bit (out, in1, in2, in3, sel);
output [31:0] out;
reg [31:0] out;
input [31:0] in1, in2, in3;
input [1:0] sel;
initial out = 32'b0;
always @ (in1, in2, in3, sel) begin
    case (sel)
            2'b00: out <= in1;
            2'b01: out <= in2;
            2'b10: out <= in3;
            default: ;
    endcase
    end
endmodule

module MUX_2to1_5bit (out, in1, in2, sel);
output [4:0] out;
reg [4:0] out;
input [4:0] in1, in2;
input sel;
initial out = 5'b0;
always @ (in1, in2, sel) begin
    case (sel)
            1'b0: out <= in1;
            1'b1: out <= in2;
            default: ;
    endcase
    end
endmodule


//////////////////////////////////////////////////////////////////////////////////
// SSD
//////////////////////////////////////////////////////////////////////////////////
module clock500(clock,clk500);
    input clock;
    output clk500;
    reg clk500=0;
    reg [17:0]n;
    always @(posedge clock)begin
        if(n>=18'b110000110100111111)begin
            n<=0;
            clk500<=1;
        end
        else begin
            n<=n+1;
            clk500<=0;
        end
    end
endmodule

module ring(clk500,ring);
    input clk500;
    output [3:0]ring;
    reg [3:0]ring=4'b1110;
    reg [8:0]n;
    always @(posedge clk500)begin
        ring[0]<=ring[3];
        ring[1]<=ring[0];
        ring[2]<=ring[1];
        ring[3]<=ring[2];
    end
endmodule

module Display(ring,PCorReg,currentPC,Data,SSD);
    input [3:0]ring;
    input [31:0]currentPC,Data;
    input PCorReg;
    output [6:0]SSD;
    reg [6:0]SSD=7'b1111111;
    wire [15:0]OUT;
    reg [3:0]code;
    assign OUT=(PCorReg==1) ? currentPC[15:0]:Data[15:0];
    always @(ring)begin
        case(ring)
            4'b1110: code=OUT[3:0];
            4'b1101: code=OUT[7:4];
            4'b1011: code=OUT[11:8];
            4'b0111: code=OUT[15:12];            
        endcase
        case(code)
            4'b0000: SSD <= 7'b0000001;
            4'b0001: SSD <= 7'b1001111;
            4'b0010: SSD <= 7'b0010010;
            4'b0011: SSD <= 7'b0000110;
            4'b0100: SSD <= 7'b1001100;
            4'b0101: SSD <= 7'b0100100;
            4'b0110: SSD <= 7'b0100000;
            4'b0111: SSD <= 7'b0001111;
            4'b1000: SSD <= 7'b0000000;
            4'b1001: SSD <= 7'b0000100;
            4'b1010: SSD <= 7'b0001000;
            4'b1011: SSD <= 7'b1100000;
            4'b1100: SSD <= 7'b0110001;
            4'b1101: SSD <= 7'b1000010;
            4'b1110: SSD <= 7'b0110000;
            4'b1111: SSD <= 7'b0111000;
        endcase
    end
endmodule

module chooseData (Data,RegID, t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, s0, s1, s2, s3, s4, s5, s6, s7);
input [4:0] RegID;
input [31:0] t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, s0, s1, s2, s3, s4, s5, s6, s7;
output reg [31:0] Data;
initial Data <= 32'b0;
always @(RegID,t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, s0, s1, s2, s3, s4, s5, s6, s7)begin
    case (RegID)
        5'b01000: Data <= t0;
        5'b01001: Data <= t1;
        5'b01010: Data <= t2;
        5'b01011: Data <= t3;
        5'b01100: Data <= t4;
        5'b01101: Data <= t5;
        5'b01110: Data <= t6;
        5'b01111: Data <= t7;
        5'b11000: Data <= t8;
        5'b11001: Data <= t9;
        5'b10000: Data <= s0;
        5'b10001: Data <= s1;
        5'b10010: Data <= s2;
        5'b10011: Data <= s3;
        5'b10100: Data <= s4;
        5'b10101: Data <= s5;
        5'b10110: Data <= s6;
        5'b10111: Data <= s7;
        default: Data <= 32'b0;
    endcase
end
endmodule
