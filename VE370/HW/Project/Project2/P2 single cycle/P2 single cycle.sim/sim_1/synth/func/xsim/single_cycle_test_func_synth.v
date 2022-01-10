// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Nov 15 15:42:07 2018
// Host        : DESKTOP-C5CEFDM running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file {D:/PANDA/Study/VE370/Project/Project2/P2 single cycle/P2
//               single cycle.sim/sim_1/synth/func/xsim/single_cycle_test_func_synth.v}
// Design      : SingleCycle
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module ALU
   (O,
    DI,
    D,
    S,
    \nextPC_reg[6] ,
    Q,
    \currentPC_reg[6] ,
    \currentPC_reg[6]_0 ,
    PCsrc,
    \currentPC_reg[6]_1 ,
    \currentPC_reg[6]_2 );
  output [0:0]O;
  output [2:0]DI;
  output [3:0]D;
  output [2:0]S;
  output [1:0]\nextPC_reg[6] ;
  input [5:0]Q;
  input [0:0]\currentPC_reg[6] ;
  input [4:0]\currentPC_reg[6]_0 ;
  input PCsrc;
  input \currentPC_reg[6]_1 ;
  input \currentPC_reg[6]_2 ;

  wire [3:0]D;
  wire [2:0]DI;
  wire [0:0]O;
  wire PCsrc;
  wire [5:0]Q;
  wire [2:0]S;
  wire \_inferred__0/i__carry__0_n_3 ;
  wire \_inferred__0/i__carry__0_n_6 ;
  wire \_inferred__0/i__carry__0_n_7 ;
  wire \_inferred__0/i__carry_n_0 ;
  wire \_inferred__0/i__carry_n_1 ;
  wire \_inferred__0/i__carry_n_2 ;
  wire \_inferred__0/i__carry_n_3 ;
  wire \_inferred__0/i__carry_n_4 ;
  wire \_inferred__0/i__carry_n_5 ;
  wire \_inferred__0/i__carry_n_7 ;
  wire [0:0]\currentPC_reg[6] ;
  wire [4:0]\currentPC_reg[6]_0 ;
  wire \currentPC_reg[6]_1 ;
  wire \currentPC_reg[6]_2 ;
  wire i__carry__0_i_1_n_0;
  wire i__carry__0_i_2_n_0;
  wire i__carry_i_1_n_0;
  wire i__carry_i_2_n_0;
  wire i__carry_i_3_n_0;
  wire [1:0]\nextPC_reg[6] ;
  wire [3:1]\NLW__inferred__0/i__carry__0_CO_UNCONNECTED ;
  wire [3:2]\NLW__inferred__0/i__carry__0_O_UNCONNECTED ;

  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\_inferred__0/i__carry_n_0 ,\_inferred__0/i__carry_n_1 ,\_inferred__0/i__carry_n_2 ,\_inferred__0/i__carry_n_3 }),
        .CYINIT(1'b0),
        .DI({DI,1'b0}),
        .O({\_inferred__0/i__carry_n_4 ,\_inferred__0/i__carry_n_5 ,O,\_inferred__0/i__carry_n_7 }),
        .S({i__carry_i_1_n_0,i__carry_i_2_n_0,i__carry_i_3_n_0,Q[0]}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \_inferred__0/i__carry__0 
       (.CI(\_inferred__0/i__carry_n_0 ),
        .CO({\NLW__inferred__0/i__carry__0_CO_UNCONNECTED [3:1],\_inferred__0/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\currentPC_reg[6] }),
        .O({\NLW__inferred__0/i__carry__0_O_UNCONNECTED [3:2],\_inferred__0/i__carry__0_n_6 ,\_inferred__0/i__carry__0_n_7 }),
        .S({1'b0,1'b0,i__carry__0_i_1_n_0,i__carry__0_i_2_n_0}));
  LUT5 #(
    .INIT(32'hAAAAF0CC)) 
    \currentPC[3]_i_1 
       (.I0(DI[1]),
        .I1(Q[2]),
        .I2(\_inferred__0/i__carry_n_5 ),
        .I3(PCsrc),
        .I4(\currentPC_reg[6]_1 ),
        .O(D[0]));
  LUT5 #(
    .INIT(32'hAAAAF0CC)) 
    \currentPC[4]_i_1 
       (.I0(DI[2]),
        .I1(Q[3]),
        .I2(\_inferred__0/i__carry_n_4 ),
        .I3(PCsrc),
        .I4(\currentPC_reg[6]_1 ),
        .O(D[1]));
  LUT5 #(
    .INIT(32'hAAAAF0CC)) 
    \currentPC[5]_i_1 
       (.I0(\currentPC_reg[6] ),
        .I1(Q[4]),
        .I2(\_inferred__0/i__carry__0_n_7 ),
        .I3(PCsrc),
        .I4(\currentPC_reg[6]_1 ),
        .O(D[2]));
  LUT5 #(
    .INIT(32'hAAAAF0CC)) 
    \currentPC[6]_i_1 
       (.I0(\currentPC_reg[6]_2 ),
        .I1(Q[5]),
        .I2(\_inferred__0/i__carry__0_n_6 ),
        .I3(PCsrc),
        .I4(\currentPC_reg[6]_1 ),
        .O(D[3]));
  LUT6 #(
    .INIT(64'h5B6FFBFFA4900400)) 
    i__carry__0_i_1
       (.I0(\currentPC_reg[6]_0 [0]),
        .I1(\currentPC_reg[6]_0 [1]),
        .I2(\currentPC_reg[6]_0 [2]),
        .I3(\currentPC_reg[6]_0 [3]),
        .I4(\currentPC_reg[6]_0 [4]),
        .I5(Q[5]),
        .O(i__carry__0_i_1_n_0));
  LUT6 #(
    .INIT(64'h5B6D02DFA492FD20)) 
    i__carry__0_i_2
       (.I0(\currentPC_reg[6]_0 [0]),
        .I1(\currentPC_reg[6]_0 [1]),
        .I2(\currentPC_reg[6]_0 [2]),
        .I3(\currentPC_reg[6]_0 [3]),
        .I4(\currentPC_reg[6]_0 [4]),
        .I5(Q[4]),
        .O(i__carry__0_i_2_n_0));
  LUT6 #(
    .INIT(64'h5B6D7DE1A492821E)) 
    i__carry_i_1
       (.I0(\currentPC_reg[6]_0 [0]),
        .I1(\currentPC_reg[6]_0 [1]),
        .I2(\currentPC_reg[6]_0 [2]),
        .I3(\currentPC_reg[6]_0 [3]),
        .I4(\currentPC_reg[6]_0 [4]),
        .I5(Q[3]),
        .O(i__carry_i_1_n_0));
  LUT6 #(
    .INIT(64'h006B1F7BFF94E084)) 
    i__carry_i_2
       (.I0(\currentPC_reg[6]_0 [1]),
        .I1(\currentPC_reg[6]_0 [0]),
        .I2(\currentPC_reg[6]_0 [2]),
        .I3(\currentPC_reg[6]_0 [3]),
        .I4(\currentPC_reg[6]_0 [4]),
        .I5(Q[2]),
        .O(i__carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h05553BEBFAAAC414)) 
    i__carry_i_3
       (.I0(\currentPC_reg[6]_0 [2]),
        .I1(\currentPC_reg[6]_0 [0]),
        .I2(\currentPC_reg[6]_0 [3]),
        .I3(\currentPC_reg[6]_0 [1]),
        .I4(\currentPC_reg[6]_0 [4]),
        .I5(Q[1]),
        .O(i__carry_i_3_n_0));
  LUT5 #(
    .INIT(32'hAAAAF0CC)) 
    nextPC0_carry__0_i_1
       (.I0(\currentPC_reg[6]_2 ),
        .I1(Q[5]),
        .I2(\_inferred__0/i__carry__0_n_6 ),
        .I3(PCsrc),
        .I4(\currentPC_reg[6]_1 ),
        .O(\nextPC_reg[6] [1]));
  LUT5 #(
    .INIT(32'hAAAAF0CC)) 
    nextPC0_carry__0_i_2
       (.I0(\currentPC_reg[6] ),
        .I1(Q[4]),
        .I2(\_inferred__0/i__carry__0_n_7 ),
        .I3(PCsrc),
        .I4(\currentPC_reg[6]_1 ),
        .O(\nextPC_reg[6] [0]));
  LUT5 #(
    .INIT(32'hAAAAF0CC)) 
    nextPC0_carry_i_2
       (.I0(DI[2]),
        .I1(Q[3]),
        .I2(\_inferred__0/i__carry_n_4 ),
        .I3(PCsrc),
        .I4(\currentPC_reg[6]_1 ),
        .O(S[2]));
  LUT5 #(
    .INIT(32'hAAAAF0CC)) 
    nextPC0_carry_i_3
       (.I0(DI[1]),
        .I1(Q[2]),
        .I2(\_inferred__0/i__carry_n_5 ),
        .I3(PCsrc),
        .I4(\currentPC_reg[6]_1 ),
        .O(S[1]));
  LUT4 #(
    .INIT(16'h0A0C)) 
    nextPC0_carry_i_5
       (.I0(\_inferred__0/i__carry_n_7 ),
        .I1(Q[0]),
        .I2(\currentPC_reg[6]_1 ),
        .I3(PCsrc),
        .O(S[0]));
  LUT5 #(
    .INIT(32'hEAAAC590)) 
    \out_OBUF[0]_inst_i_1 
       (.I0(\currentPC_reg[6]_0 [4]),
        .I1(\currentPC_reg[6]_0 [1]),
        .I2(\currentPC_reg[6]_0 [3]),
        .I3(\currentPC_reg[6]_0 [0]),
        .I4(\currentPC_reg[6]_0 [2]),
        .O(DI[0]));
  LUT5 #(
    .INIT(32'hF8C8CBA8)) 
    \out_OBUF[1]_inst_i_1 
       (.I0(\currentPC_reg[6]_0 [4]),
        .I1(\currentPC_reg[6]_0 [3]),
        .I2(\currentPC_reg[6]_0 [2]),
        .I3(\currentPC_reg[6]_0 [0]),
        .I4(\currentPC_reg[6]_0 [1]),
        .O(DI[1]));
  LUT5 #(
    .INIT(32'hE1870930)) 
    \out_OBUF[2]_inst_i_1 
       (.I0(\currentPC_reg[6]_0 [4]),
        .I1(\currentPC_reg[6]_0 [3]),
        .I2(\currentPC_reg[6]_0 [2]),
        .I3(\currentPC_reg[6]_0 [1]),
        .I4(\currentPC_reg[6]_0 [0]),
        .O(DI[2]));
endmodule

(* ORIG_REF_NAME = "ALU" *) 
module ALU_0
   (CO,
    DI,
    S,
    \currentPC_reg[6] ,
    \currentPC_reg[6]_0 ,
    \currentPC_reg[6]_1 ,
    \currentPC_reg[6]_2 );
  output [0:0]CO;
  input [2:0]DI;
  input [3:0]S;
  input [0:0]\currentPC_reg[6] ;
  input [3:0]\currentPC_reg[6]_0 ;
  input [3:0]\currentPC_reg[6]_1 ;
  input [1:0]\currentPC_reg[6]_2 ;

  wire ALUresult2_carry__0_n_0;
  wire ALUresult2_carry__0_n_1;
  wire ALUresult2_carry__0_n_2;
  wire ALUresult2_carry__0_n_3;
  wire ALUresult2_carry__1_n_0;
  wire ALUresult2_carry__1_n_1;
  wire ALUresult2_carry__1_n_2;
  wire ALUresult2_carry__1_n_3;
  wire ALUresult2_carry__2_n_3;
  wire ALUresult2_carry_n_0;
  wire ALUresult2_carry_n_1;
  wire ALUresult2_carry_n_2;
  wire ALUresult2_carry_n_3;
  wire [0:0]CO;
  wire [2:0]DI;
  wire [3:0]S;
  wire [0:0]\currentPC_reg[6] ;
  wire [3:0]\currentPC_reg[6]_0 ;
  wire [3:0]\currentPC_reg[6]_1 ;
  wire [1:0]\currentPC_reg[6]_2 ;
  wire [3:0]NLW_ALUresult2_carry_O_UNCONNECTED;
  wire [3:0]NLW_ALUresult2_carry__0_O_UNCONNECTED;
  wire [3:0]NLW_ALUresult2_carry__1_O_UNCONNECTED;
  wire [3:2]NLW_ALUresult2_carry__2_CO_UNCONNECTED;
  wire [3:0]NLW_ALUresult2_carry__2_O_UNCONNECTED;

  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 ALUresult2_carry
       (.CI(1'b0),
        .CO({ALUresult2_carry_n_0,ALUresult2_carry_n_1,ALUresult2_carry_n_2,ALUresult2_carry_n_3}),
        .CYINIT(1'b0),
        .DI({1'b1,DI}),
        .O(NLW_ALUresult2_carry_O_UNCONNECTED[3:0]),
        .S(S));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 ALUresult2_carry__0
       (.CI(ALUresult2_carry_n_0),
        .CO({ALUresult2_carry__0_n_0,ALUresult2_carry__0_n_1,ALUresult2_carry__0_n_2,ALUresult2_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,\currentPC_reg[6] }),
        .O(NLW_ALUresult2_carry__0_O_UNCONNECTED[3:0]),
        .S(\currentPC_reg[6]_0 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 ALUresult2_carry__1
       (.CI(ALUresult2_carry__0_n_0),
        .CO({ALUresult2_carry__1_n_0,ALUresult2_carry__1_n_1,ALUresult2_carry__1_n_2,ALUresult2_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b1}),
        .O(NLW_ALUresult2_carry__1_O_UNCONNECTED[3:0]),
        .S(\currentPC_reg[6]_1 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 ALUresult2_carry__2
       (.CI(ALUresult2_carry__1_n_0),
        .CO({NLW_ALUresult2_carry__2_CO_UNCONNECTED[3:2],CO,ALUresult2_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b1,1'b1}),
        .O(NLW_ALUresult2_carry__2_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,\currentPC_reg[6]_2 }));
endmodule

module EX
   (CO,
    DI,
    S,
    \currentPC_reg[6] ,
    \currentPC_reg[6]_0 ,
    \currentPC_reg[6]_1 ,
    \currentPC_reg[6]_2 );
  output [0:0]CO;
  input [2:0]DI;
  input [3:0]S;
  input [0:0]\currentPC_reg[6] ;
  input [3:0]\currentPC_reg[6]_0 ;
  input [3:0]\currentPC_reg[6]_1 ;
  input [1:0]\currentPC_reg[6]_2 ;

  wire [0:0]CO;
  wire [2:0]DI;
  wire [3:0]S;
  wire [0:0]\currentPC_reg[6] ;
  wire [3:0]\currentPC_reg[6]_0 ;
  wire [3:0]\currentPC_reg[6]_1 ;
  wire [1:0]\currentPC_reg[6]_2 ;

  ALU_0 ALU
       (.CO(CO),
        .DI(DI),
        .S(S),
        .\currentPC_reg[6] (\currentPC_reg[6] ),
        .\currentPC_reg[6]_0 (\currentPC_reg[6]_0 ),
        .\currentPC_reg[6]_1 (\currentPC_reg[6]_1 ),
        .\currentPC_reg[6]_2 (\currentPC_reg[6]_2 ));
endmodule

module ID
   (PCsrc_reg,
    PCsrc_reg_0,
    PCsrc_reg_1,
    Q);
  output PCsrc_reg;
  output PCsrc_reg_0;
  output PCsrc_reg_1;
  input [4:0]Q;

  wire PCsrc_reg;
  wire PCsrc_reg_0;
  wire PCsrc_reg_1;
  wire [4:0]Q;

  control control
       (.PCsrc_reg(PCsrc_reg),
        .PCsrc_reg_0(PCsrc_reg_0),
        .PCsrc_reg_1(PCsrc_reg_1),
        .Q(Q));
endmodule

module MEM
   (PCsrc,
    \currentPC_reg[6] ,
    clk_IBUF_BUFG);
  output PCsrc;
  input \currentPC_reg[6] ;
  input clk_IBUF_BUFG;

  wire PCsrc;
  wire clk_IBUF_BUFG;
  wire \currentPC_reg[6] ;

  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    PCsrc_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\currentPC_reg[6] ),
        .Q(PCsrc),
        .R(1'b0));
endmodule

(* NotValidForBitStream *)
module SingleCycle
   (clk,
    out);
  input clk;
  output [31:0]out;

  wire \ALU/ALUresult0 ;
  wire ID_n_0;
  wire ID_n_1;
  wire ID_n_2;
  wire PCsrc;
  wire WB_n_27;
  wire WB_n_28;
  wire WB_n_29;
  wire WB_n_30;
  wire WB_n_31;
  wire WB_n_32;
  wire WB_n_33;
  wire WB_n_34;
  wire WB_n_35;
  wire WB_n_36;
  wire WB_n_37;
  wire WB_n_38;
  wire WB_n_39;
  wire WB_n_40;
  wire WB_n_41;
  wire WB_n_42;
  wire WB_n_43;
  wire WB_n_44;
  wire WB_n_45;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [6:2]currentPC;
  wire [31:0]out;
  wire [29:0]out_OBUF;

  EX EX
       (.CO(\ALU/ALUresult0 ),
        .DI({WB_n_31,WB_n_32,WB_n_33}),
        .S({WB_n_27,WB_n_28,WB_n_29,WB_n_30}),
        .\currentPC_reg[6] (WB_n_34),
        .\currentPC_reg[6]_0 ({WB_n_35,WB_n_36,WB_n_37,WB_n_38}),
        .\currentPC_reg[6]_1 ({WB_n_41,WB_n_42,WB_n_43,WB_n_44}),
        .\currentPC_reg[6]_2 ({WB_n_39,WB_n_40}));
  ID ID
       (.PCsrc_reg(ID_n_0),
        .PCsrc_reg_0(ID_n_1),
        .PCsrc_reg_1(ID_n_2),
        .Q(currentPC));
  MEM MEM
       (.PCsrc(PCsrc),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\currentPC_reg[6] (WB_n_45));
  WB WB
       (.CO(\ALU/ALUresult0 ),
        .DI({WB_n_31,WB_n_32,WB_n_33}),
        .PCsrc(PCsrc),
        .PCsrc_reg(WB_n_34),
        .PCsrc_reg_0({WB_n_35,WB_n_36,WB_n_37,WB_n_38}),
        .PCsrc_reg_1({WB_n_39,WB_n_40}),
        .PCsrc_reg_2({WB_n_41,WB_n_42,WB_n_43,WB_n_44}),
        .PCsrc_reg_3(WB_n_45),
        .Q(currentPC),
        .S({WB_n_27,WB_n_28,WB_n_29,WB_n_30}),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\currentPC_reg[6]_0 (ID_n_1),
        .\currentPC_reg[6]_1 (ID_n_2),
        .\currentPC_reg[6]_2 (ID_n_0),
        .out_OBUF({out_OBUF[29:23],out_OBUF[21:19],out_OBUF[17:15],out_OBUF[13:11],out_OBUF[5:0]}));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  OBUF \out_OBUF[0]_inst 
       (.I(out_OBUF[0]),
        .O(out[0]));
  OBUF \out_OBUF[10]_inst 
       (.I(1'b0),
        .O(out[10]));
  OBUF \out_OBUF[11]_inst 
       (.I(out_OBUF[11]),
        .O(out[11]));
  OBUF \out_OBUF[12]_inst 
       (.I(out_OBUF[12]),
        .O(out[12]));
  OBUF \out_OBUF[13]_inst 
       (.I(out_OBUF[13]),
        .O(out[13]));
  OBUF \out_OBUF[14]_inst 
       (.I(1'b0),
        .O(out[14]));
  OBUF \out_OBUF[15]_inst 
       (.I(out_OBUF[15]),
        .O(out[15]));
  OBUF \out_OBUF[16]_inst 
       (.I(out_OBUF[16]),
        .O(out[16]));
  OBUF \out_OBUF[17]_inst 
       (.I(out_OBUF[17]),
        .O(out[17]));
  OBUF \out_OBUF[18]_inst 
       (.I(1'b0),
        .O(out[18]));
  OBUF \out_OBUF[19]_inst 
       (.I(out_OBUF[19]),
        .O(out[19]));
  OBUF \out_OBUF[1]_inst 
       (.I(out_OBUF[1]),
        .O(out[1]));
  OBUF \out_OBUF[20]_inst 
       (.I(out_OBUF[20]),
        .O(out[20]));
  OBUF \out_OBUF[21]_inst 
       (.I(out_OBUF[21]),
        .O(out[21]));
  OBUF \out_OBUF[22]_inst 
       (.I(out_OBUF[13]),
        .O(out[22]));
  OBUF \out_OBUF[23]_inst 
       (.I(out_OBUF[23]),
        .O(out[23]));
  OBUF \out_OBUF[24]_inst 
       (.I(out_OBUF[24]),
        .O(out[24]));
  OBUF \out_OBUF[25]_inst 
       (.I(out_OBUF[25]),
        .O(out[25]));
  OBUF \out_OBUF[26]_inst 
       (.I(out_OBUF[26]),
        .O(out[26]));
  OBUF \out_OBUF[27]_inst 
       (.I(out_OBUF[27]),
        .O(out[27]));
  OBUF \out_OBUF[28]_inst 
       (.I(out_OBUF[28]),
        .O(out[28]));
  OBUF \out_OBUF[29]_inst 
       (.I(out_OBUF[29]),
        .O(out[29]));
  OBUF \out_OBUF[2]_inst 
       (.I(out_OBUF[2]),
        .O(out[2]));
  OBUF \out_OBUF[30]_inst 
       (.I(1'b0),
        .O(out[30]));
  OBUF \out_OBUF[31]_inst 
       (.I(out_OBUF[26]),
        .O(out[31]));
  OBUF \out_OBUF[3]_inst 
       (.I(out_OBUF[3]),
        .O(out[3]));
  OBUF \out_OBUF[4]_inst 
       (.I(out_OBUF[4]),
        .O(out[4]));
  OBUF \out_OBUF[5]_inst 
       (.I(out_OBUF[5]),
        .O(out[5]));
  OBUF \out_OBUF[6]_inst 
       (.I(1'b0),
        .O(out[6]));
  OBUF \out_OBUF[7]_inst 
       (.I(1'b0),
        .O(out[7]));
  OBUF \out_OBUF[8]_inst 
       (.I(1'b0),
        .O(out[8]));
  OBUF \out_OBUF[9]_inst 
       (.I(1'b0),
        .O(out[9]));
endmodule

module WB
   (out_OBUF,
    Q,
    S,
    DI,
    PCsrc_reg,
    PCsrc_reg_0,
    PCsrc_reg_1,
    PCsrc_reg_2,
    PCsrc_reg_3,
    clk_IBUF_BUFG,
    CO,
    \currentPC_reg[6]_0 ,
    PCsrc,
    \currentPC_reg[6]_1 ,
    \currentPC_reg[6]_2 );
  output [21:0]out_OBUF;
  output [4:0]Q;
  output [3:0]S;
  output [2:0]DI;
  output [0:0]PCsrc_reg;
  output [3:0]PCsrc_reg_0;
  output [1:0]PCsrc_reg_1;
  output [3:0]PCsrc_reg_2;
  output PCsrc_reg_3;
  input clk_IBUF_BUFG;
  input [0:0]CO;
  input \currentPC_reg[6]_0 ;
  input PCsrc;
  input \currentPC_reg[6]_1 ;
  input \currentPC_reg[6]_2 ;

  wire ALU_n_0;
  wire ALU_n_10;
  wire ALU_n_11;
  wire ALU_n_12;
  wire ALU_n_4;
  wire ALU_n_5;
  wire ALU_n_6;
  wire ALU_n_7;
  wire ALU_n_8;
  wire ALU_n_9;
  wire ALUresult2_carry_i_8_n_0;
  wire [0:0]CO;
  wire [2:0]DI;
  wire [2:2]\EX/ALUcontrol ;
  wire PCsrc;
  wire PCsrc_i_10_n_0;
  wire PCsrc_i_12_n_0;
  wire PCsrc_i_14_n_0;
  wire PCsrc_i_16_n_0;
  wire PCsrc_i_17_n_0;
  wire PCsrc_i_18_n_0;
  wire PCsrc_i_19_n_0;
  wire PCsrc_i_20_n_0;
  wire PCsrc_i_21_n_0;
  wire PCsrc_i_22_n_0;
  wire PCsrc_i_23_n_0;
  wire PCsrc_i_24_n_0;
  wire PCsrc_i_25_n_0;
  wire PCsrc_i_26_n_0;
  wire PCsrc_i_27_n_0;
  wire PCsrc_i_2_n_0;
  wire PCsrc_i_31_n_0;
  wire PCsrc_i_32_n_0;
  wire PCsrc_i_33_n_0;
  wire PCsrc_i_34_n_0;
  wire PCsrc_i_35_n_0;
  wire PCsrc_i_36_n_0;
  wire PCsrc_i_3_n_0;
  wire PCsrc_i_41_n_0;
  wire PCsrc_i_42_n_0;
  wire PCsrc_i_43_n_0;
  wire PCsrc_i_44_n_0;
  wire PCsrc_i_46_n_0;
  wire PCsrc_i_47_n_0;
  wire PCsrc_i_48_n_0;
  wire PCsrc_i_49_n_0;
  wire PCsrc_i_4_n_0;
  wire PCsrc_i_50_n_0;
  wire PCsrc_i_53_n_0;
  wire PCsrc_i_54_n_0;
  wire PCsrc_i_55_n_0;
  wire PCsrc_i_56_n_0;
  wire PCsrc_i_58_n_0;
  wire PCsrc_i_5_n_0;
  wire PCsrc_i_63_n_0;
  wire PCsrc_i_64_n_0;
  wire PCsrc_i_65_n_0;
  wire PCsrc_i_66_n_0;
  wire PCsrc_i_67_n_0;
  wire PCsrc_i_68_n_0;
  wire PCsrc_i_69_n_0;
  wire PCsrc_i_6_n_0;
  wire PCsrc_i_70_n_0;
  wire PCsrc_i_71_n_0;
  wire PCsrc_i_72_n_0;
  wire PCsrc_i_73_n_0;
  wire PCsrc_i_74_n_0;
  wire PCsrc_i_75_n_0;
  wire PCsrc_i_76_n_0;
  wire PCsrc_i_77_n_0;
  wire PCsrc_i_78_n_0;
  wire PCsrc_i_79_n_0;
  wire PCsrc_i_7_n_0;
  wire PCsrc_i_80_n_0;
  wire PCsrc_i_81_n_0;
  wire PCsrc_i_82_n_0;
  wire PCsrc_i_83_n_0;
  wire PCsrc_i_84_n_0;
  wire PCsrc_i_85_n_0;
  wire PCsrc_i_86_n_0;
  wire PCsrc_i_87_n_0;
  wire PCsrc_i_88_n_0;
  wire PCsrc_i_89_n_0;
  wire PCsrc_i_8_n_0;
  wire PCsrc_i_90_n_0;
  wire PCsrc_i_91_n_0;
  wire PCsrc_i_92_n_0;
  wire PCsrc_i_94_n_0;
  wire PCsrc_i_95_n_0;
  wire PCsrc_i_96_n_0;
  wire [0:0]PCsrc_reg;
  wire [3:0]PCsrc_reg_0;
  wire [1:0]PCsrc_reg_1;
  wire [3:0]PCsrc_reg_2;
  wire PCsrc_reg_3;
  wire PCsrc_reg_i_11_n_0;
  wire PCsrc_reg_i_11_n_1;
  wire PCsrc_reg_i_11_n_2;
  wire PCsrc_reg_i_11_n_3;
  wire PCsrc_reg_i_13_n_0;
  wire PCsrc_reg_i_13_n_1;
  wire PCsrc_reg_i_13_n_2;
  wire PCsrc_reg_i_13_n_3;
  wire PCsrc_reg_i_15_n_0;
  wire PCsrc_reg_i_15_n_1;
  wire PCsrc_reg_i_15_n_2;
  wire PCsrc_reg_i_15_n_3;
  wire PCsrc_reg_i_57_n_0;
  wire PCsrc_reg_i_57_n_1;
  wire PCsrc_reg_i_57_n_2;
  wire PCsrc_reg_i_57_n_3;
  wire PCsrc_reg_i_59_n_0;
  wire PCsrc_reg_i_59_n_1;
  wire PCsrc_reg_i_59_n_2;
  wire PCsrc_reg_i_59_n_3;
  wire PCsrc_reg_i_60_n_0;
  wire PCsrc_reg_i_60_n_1;
  wire PCsrc_reg_i_60_n_2;
  wire PCsrc_reg_i_60_n_3;
  wire PCsrc_reg_i_61_n_1;
  wire PCsrc_reg_i_61_n_2;
  wire PCsrc_reg_i_61_n_3;
  wire PCsrc_reg_i_9_n_0;
  wire PCsrc_reg_i_9_n_1;
  wire PCsrc_reg_i_9_n_2;
  wire PCsrc_reg_i_9_n_3;
  wire [4:0]Q;
  wire [3:0]S;
  wire clk_IBUF_BUFG;
  wire \currentPC[2]_i_1_n_0 ;
  wire \currentPC[6]_i_2_n_0 ;
  wire \currentPC_reg[6]_0 ;
  wire \currentPC_reg[6]_1 ;
  wire \currentPC_reg[6]_2 ;
  wire [31:1]data2;
  wire [6:1]nextPC;
  wire nextPC0_carry__0_n_3;
  wire nextPC0_carry__0_n_6;
  wire nextPC0_carry__0_n_7;
  wire nextPC0_carry_i_1_n_0;
  wire nextPC0_carry_i_4_n_0;
  wire nextPC0_carry_n_0;
  wire nextPC0_carry_n_1;
  wire nextPC0_carry_n_2;
  wire nextPC0_carry_n_3;
  wire nextPC0_carry_n_4;
  wire nextPC0_carry_n_5;
  wire nextPC0_carry_n_6;
  wire nextPC0_carry_n_7;
  wire [21:0]out_OBUF;
  wire [15:1]p_0_in;
  wire [0:0]NLW_PCsrc_reg_i_11_O_UNCONNECTED;
  wire [3:3]NLW_PCsrc_reg_i_61_CO_UNCONNECTED;
  wire [3:1]NLW_nextPC0_carry__0_CO_UNCONNECTED;
  wire [3:2]NLW_nextPC0_carry__0_O_UNCONNECTED;

  ALU ALU
       (.D({ALU_n_4,ALU_n_5,ALU_n_6,ALU_n_7}),
        .DI(out_OBUF[2:0]),
        .O(ALU_n_0),
        .PCsrc(PCsrc),
        .Q(nextPC),
        .S({ALU_n_8,ALU_n_9,ALU_n_10}),
        .\currentPC_reg[6] (out_OBUF[3]),
        .\currentPC_reg[6]_0 (Q),
        .\currentPC_reg[6]_1 (\currentPC[6]_i_2_n_0 ),
        .\currentPC_reg[6]_2 (out_OBUF[4]),
        .\nextPC_reg[6] ({ALU_n_11,ALU_n_12}));
  LUT6 #(
    .INIT(64'h0200200000000008)) 
    ALUresult2_carry__0_i_1
       (.I0(ALUresult2_carry_i_8_n_0),
        .I1(Q[4]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(Q[2]),
        .O(PCsrc_reg));
  LUT6 #(
    .INIT(64'hFBAAFFFDFFFFFFFF)) 
    ALUresult2_carry__0_i_2
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(Q[1]),
        .I5(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_reg_0[3]));
  LUT6 #(
    .INIT(64'hFBAAFFFDFFFFFFFF)) 
    ALUresult2_carry__0_i_3
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(Q[1]),
        .I5(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_reg_0[2]));
  LUT6 #(
    .INIT(64'hFBAAFFFDFFFFFFFF)) 
    ALUresult2_carry__0_i_4
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(Q[1]),
        .I5(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_reg_0[1]));
  LUT6 #(
    .INIT(64'hFFFEDF7FFFFFFFFF)) 
    ALUresult2_carry__0_i_5
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(Q[4]),
        .I5(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_reg_0[0]));
  LUT6 #(
    .INIT(64'hFBAAFFFDFFFFFFFF)) 
    ALUresult2_carry__1_i_1
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(Q[1]),
        .I5(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_reg_2[3]));
  LUT6 #(
    .INIT(64'hFBAAFFFDFFFFFFFF)) 
    ALUresult2_carry__1_i_2
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(Q[1]),
        .I5(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_reg_2[2]));
  LUT6 #(
    .INIT(64'hFBAAFFFDFFFFFFFF)) 
    ALUresult2_carry__1_i_3
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(Q[1]),
        .I5(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_reg_2[1]));
  LUT6 #(
    .INIT(64'hFBAAFFFDFFFFFFFF)) 
    ALUresult2_carry__1_i_4
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(Q[1]),
        .I5(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_reg_2[0]));
  LUT6 #(
    .INIT(64'hFBAAFFFDFFFFFFFF)) 
    ALUresult2_carry__2_i_1
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(Q[1]),
        .I5(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_reg_1[1]));
  LUT6 #(
    .INIT(64'hFBAAFFFDFFFFFFFF)) 
    ALUresult2_carry__2_i_2
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(Q[1]),
        .I5(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_reg_1[0]));
  LUT6 #(
    .INIT(64'h8880200A00A2A0A2)) 
    ALUresult2_carry_i_1
       (.I0(ALUresult2_carry_i_8_n_0),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(Q[0]),
        .I5(Q[4]),
        .O(DI[2]));
  LUT6 #(
    .INIT(64'h88208208AAAA0AA8)) 
    ALUresult2_carry_i_2
       (.I0(ALUresult2_carry_i_8_n_0),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[2]),
        .I4(Q[3]),
        .I5(Q[4]),
        .O(DI[1]));
  LUT6 #(
    .INIT(64'hFEEAE7B000000000)) 
    ALUresult2_carry_i_3
       (.I0(Q[4]),
        .I1(Q[1]),
        .I2(Q[3]),
        .I3(Q[0]),
        .I4(Q[2]),
        .I5(ALUresult2_carry_i_8_n_0),
        .O(DI[0]));
  LUT6 #(
    .INIT(64'hFFFFFBFFFFFFFFFF)) 
    ALUresult2_carry_i_4
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[4]),
        .I5(ALUresult2_carry_i_8_n_0),
        .O(S[3]));
  LUT6 #(
    .INIT(64'h627DCAF8FFFFFFFF)) 
    ALUresult2_carry_i_5
       (.I0(Q[4]),
        .I1(Q[0]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(ALUresult2_carry_i_8_n_0),
        .O(S[2]));
  LUT6 #(
    .INIT(64'h1A28B28BFFFFFFFF)) 
    ALUresult2_carry_i_6
       (.I0(Q[4]),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(ALUresult2_carry_i_8_n_0),
        .O(S[1]));
  LUT6 #(
    .INIT(64'h02171453FFFFFFFF)) 
    ALUresult2_carry_i_7
       (.I0(Q[4]),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(Q[0]),
        .I4(Q[1]),
        .I5(ALUresult2_carry_i_8_n_0),
        .O(S[0]));
  LUT5 #(
    .INIT(32'h1EE61559)) 
    ALUresult2_carry_i_8
       (.I0(Q[1]),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(Q[0]),
        .I4(Q[4]),
        .O(ALUresult2_carry_i_8_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    PCsrc_i_1
       (.I0(PCsrc_i_2_n_0),
        .I1(PCsrc_i_3_n_0),
        .I2(PCsrc_i_4_n_0),
        .I3(PCsrc_i_5_n_0),
        .I4(PCsrc_i_6_n_0),
        .I5(PCsrc_i_7_n_0),
        .O(PCsrc_reg_3));
  LUT6 #(
    .INIT(64'hFFFFFFEFEFFEFFEF)) 
    PCsrc_i_10
       (.I0(PCsrc_i_35_n_0),
        .I1(PCsrc_i_36_n_0),
        .I2(out_OBUF[2]),
        .I3(\currentPC_reg[6]_0 ),
        .I4(out_OBUF[3]),
        .I5(out_OBUF[0]),
        .O(PCsrc_i_10_n_0));
  LUT6 #(
    .INIT(64'hCCCCC800C800C800)) 
    PCsrc_i_12
       (.I0(data2[10]),
        .I1(\currentPC_reg[6]_2 ),
        .I2(data2[11]),
        .I3(PCsrc_i_10_n_0),
        .I4(out_OBUF[6]),
        .I5(PCsrc_i_27_n_0),
        .O(PCsrc_i_12_n_0));
  LUT6 #(
    .INIT(64'h0000000220000000)) 
    PCsrc_i_14
       (.I0(PCsrc_i_27_n_0),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(Q[0]),
        .I4(Q[1]),
        .I5(Q[4]),
        .O(PCsrc_i_14_n_0));
  LUT5 #(
    .INIT(32'hCCCCC800)) 
    PCsrc_i_16
       (.I0(data2[15]),
        .I1(\currentPC_reg[6]_2 ),
        .I2(data2[16]),
        .I3(PCsrc_i_10_n_0),
        .I4(PCsrc_i_58_n_0),
        .O(PCsrc_i_16_n_0));
  LUT6 #(
    .INIT(64'hFF00C000EA00C000)) 
    PCsrc_i_17
       (.I0(data2[13]),
        .I1(out_OBUF[8]),
        .I2(PCsrc_i_27_n_0),
        .I3(\currentPC_reg[6]_2 ),
        .I4(PCsrc_i_10_n_0),
        .I5(data2[14]),
        .O(PCsrc_i_17_n_0));
  LUT5 #(
    .INIT(32'hCCCCC800)) 
    PCsrc_i_18
       (.I0(data2[18]),
        .I1(\currentPC_reg[6]_2 ),
        .I2(data2[19]),
        .I3(PCsrc_i_10_n_0),
        .I4(PCsrc_i_58_n_0),
        .O(PCsrc_i_18_n_0));
  LUT6 #(
    .INIT(64'hF0F0F0F0F0E00000)) 
    PCsrc_i_19
       (.I0(data2[21]),
        .I1(data2[20]),
        .I2(\currentPC_reg[6]_2 ),
        .I3(data2[17]),
        .I4(PCsrc_i_10_n_0),
        .I5(PCsrc_i_58_n_0),
        .O(PCsrc_i_19_n_0));
  LUT5 #(
    .INIT(32'hFAAAEAAA)) 
    PCsrc_i_2
       (.I0(PCsrc_i_8_n_0),
        .I1(data2[4]),
        .I2(PCsrc_i_10_n_0),
        .I3(\currentPC_reg[6]_2 ),
        .I4(data2[3]),
        .O(PCsrc_i_2_n_0));
  LUT5 #(
    .INIT(32'hCCCCC800)) 
    PCsrc_i_20
       (.I0(data2[23]),
        .I1(\currentPC_reg[6]_2 ),
        .I2(data2[24]),
        .I3(PCsrc_i_10_n_0),
        .I4(PCsrc_i_58_n_0),
        .O(PCsrc_i_20_n_0));
  LUT6 #(
    .INIT(64'hF0F0F0F0F0E00000)) 
    PCsrc_i_21
       (.I0(data2[26]),
        .I1(data2[25]),
        .I2(\currentPC_reg[6]_2 ),
        .I3(data2[22]),
        .I4(PCsrc_i_10_n_0),
        .I5(PCsrc_i_58_n_0),
        .O(PCsrc_i_21_n_0));
  LUT5 #(
    .INIT(32'hCCCCC800)) 
    PCsrc_i_22
       (.I0(data2[28]),
        .I1(\currentPC_reg[6]_2 ),
        .I2(data2[29]),
        .I3(PCsrc_i_10_n_0),
        .I4(PCsrc_i_58_n_0),
        .O(PCsrc_i_22_n_0));
  LUT6 #(
    .INIT(64'hF0F0F0F0F0E00000)) 
    PCsrc_i_23
       (.I0(data2[31]),
        .I1(data2[30]),
        .I2(\currentPC_reg[6]_2 ),
        .I3(data2[27]),
        .I4(PCsrc_i_10_n_0),
        .I5(PCsrc_i_58_n_0),
        .O(PCsrc_i_23_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    PCsrc_i_24
       (.I0(out_OBUF[0]),
        .I1(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_24_n_0));
  LUT6 #(
    .INIT(64'h020200022202000A)) 
    PCsrc_i_25
       (.I0(\currentPC_reg[6]_1 ),
        .I1(Q[4]),
        .I2(Q[3]),
        .I3(Q[2]),
        .I4(Q[1]),
        .I5(Q[0]),
        .O(PCsrc_i_25_n_0));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    PCsrc_i_26
       (.I0(out_OBUF[1]),
        .I1(out_OBUF[0]),
        .I2(CO),
        .I3(\currentPC_reg[6]_0 ),
        .I4(out_OBUF[2]),
        .I5(out_OBUF[3]),
        .O(PCsrc_i_26_n_0));
  LUT6 #(
    .INIT(64'h0000010000000000)) 
    PCsrc_i_27
       (.I0(out_OBUF[1]),
        .I1(out_OBUF[3]),
        .I2(PCsrc_i_63_n_0),
        .I3(out_OBUF[2]),
        .I4(\currentPC_reg[6]_0 ),
        .I5(PCsrc_i_25_n_0),
        .O(PCsrc_i_27_n_0));
  LUT6 #(
    .INIT(64'h00000200FFFF0200)) 
    PCsrc_i_28
       (.I0(PCsrc_i_25_n_0),
        .I1(out_OBUF[0]),
        .I2(out_OBUF[2]),
        .I3(out_OBUF[1]),
        .I4(\currentPC_reg[6]_0 ),
        .I5(\currentPC_reg[6]_1 ),
        .O(\EX/ALUcontrol ));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_29
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[5]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(p_0_in[5]));
  LUT6 #(
    .INIT(64'hFFCCCCCCFECCCCCC)) 
    PCsrc_i_3
       (.I0(data2[7]),
        .I1(PCsrc_i_12_n_0),
        .I2(data2[9]),
        .I3(PCsrc_i_10_n_0),
        .I4(\currentPC_reg[6]_2 ),
        .I5(data2[8]),
        .O(PCsrc_i_3_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_30
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[4]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'h00000200FFFF0200)) 
    PCsrc_i_31
       (.I0(PCsrc_i_25_n_0),
        .I1(out_OBUF[0]),
        .I2(out_OBUF[2]),
        .I3(out_OBUF[1]),
        .I4(\currentPC_reg[6]_0 ),
        .I5(\currentPC_reg[6]_1 ),
        .O(PCsrc_i_31_n_0));
  LUT6 #(
    .INIT(64'h00000200FFFF0200)) 
    PCsrc_i_32
       (.I0(PCsrc_i_25_n_0),
        .I1(out_OBUF[0]),
        .I2(out_OBUF[2]),
        .I3(out_OBUF[1]),
        .I4(\currentPC_reg[6]_0 ),
        .I5(\currentPC_reg[6]_1 ),
        .O(PCsrc_i_32_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_33
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[5]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_33_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_34
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[4]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_34_n_0));
  LUT6 #(
    .INIT(64'hA4900400FFFFFFFF)) 
    PCsrc_i_35
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(Q[4]),
        .I5(\currentPC_reg[6]_1 ),
        .O(PCsrc_i_35_n_0));
  LUT6 #(
    .INIT(64'hDF9E7F1FEBFFFAFF)) 
    PCsrc_i_36
       (.I0(Q[4]),
        .I1(Q[0]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(\currentPC_reg[6]_0 ),
        .O(PCsrc_i_36_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_38
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[3]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(p_0_in[3]));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_39
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[2]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(p_0_in[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFEA00)) 
    PCsrc_i_4
       (.I0(PCsrc_i_14_n_0),
        .I1(PCsrc_i_10_n_0),
        .I2(data2[12]),
        .I3(\currentPC_reg[6]_2 ),
        .I4(PCsrc_i_16_n_0),
        .I5(PCsrc_i_17_n_0),
        .O(PCsrc_i_4_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_40
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[1]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(p_0_in[1]));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_41
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[3]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_41_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_42
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[2]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_42_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_43
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[1]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_43_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    PCsrc_i_44
       (.I0(out_OBUF[0]),
        .I1(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_44_n_0));
  LUT6 #(
    .INIT(64'hAAAA9AAAAAAAAAAA)) 
    PCsrc_i_45
       (.I0(\EX/ALUcontrol ),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(PCsrc_i_64_n_0),
        .I4(Q[4]),
        .I5(ALUresult2_carry_i_8_n_0),
        .O(p_0_in[11]));
  LUT6 #(
    .INIT(64'hAAAA9AAAAAAAAAAA)) 
    PCsrc_i_46
       (.I0(\EX/ALUcontrol ),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(PCsrc_i_64_n_0),
        .I4(Q[4]),
        .I5(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_46_n_0));
  LUT6 #(
    .INIT(64'h00000200FFFF0200)) 
    PCsrc_i_47
       (.I0(PCsrc_i_25_n_0),
        .I1(out_OBUF[0]),
        .I2(out_OBUF[2]),
        .I3(out_OBUF[1]),
        .I4(\currentPC_reg[6]_0 ),
        .I5(\currentPC_reg[6]_1 ),
        .O(PCsrc_i_47_n_0));
  LUT6 #(
    .INIT(64'h00000200FFFF0200)) 
    PCsrc_i_48
       (.I0(PCsrc_i_25_n_0),
        .I1(out_OBUF[0]),
        .I2(out_OBUF[2]),
        .I3(out_OBUF[1]),
        .I4(\currentPC_reg[6]_0 ),
        .I5(\currentPC_reg[6]_1 ),
        .O(PCsrc_i_48_n_0));
  LUT6 #(
    .INIT(64'h00000200FFFF0200)) 
    PCsrc_i_49
       (.I0(PCsrc_i_25_n_0),
        .I1(out_OBUF[0]),
        .I2(out_OBUF[2]),
        .I3(out_OBUF[1]),
        .I4(\currentPC_reg[6]_0 ),
        .I5(\currentPC_reg[6]_1 ),
        .O(PCsrc_i_49_n_0));
  LUT5 #(
    .INIT(32'hFFFFFF80)) 
    PCsrc_i_5
       (.I0(\currentPC_reg[6]_2 ),
        .I1(PCsrc_i_10_n_0),
        .I2(data2[1]),
        .I3(PCsrc_i_18_n_0),
        .I4(PCsrc_i_19_n_0),
        .O(PCsrc_i_5_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_50
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[9]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_50_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_51
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[8]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(p_0_in[13]));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_52
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[7]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(p_0_in[12]));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_53
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[9]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_53_n_0));
  LUT6 #(
    .INIT(64'h00000200FFFF0200)) 
    PCsrc_i_54
       (.I0(PCsrc_i_25_n_0),
        .I1(out_OBUF[0]),
        .I2(out_OBUF[2]),
        .I3(out_OBUF[1]),
        .I4(\currentPC_reg[6]_0 ),
        .I5(\currentPC_reg[6]_1 ),
        .O(PCsrc_i_54_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_55
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[8]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_55_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_56
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[7]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_56_n_0));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    PCsrc_i_58
       (.I0(PCsrc_i_25_n_0),
        .I1(PCsrc_i_73_n_0),
        .I2(PCsrc_i_63_n_0),
        .I3(out_OBUF[3]),
        .I4(out_OBUF[1]),
        .I5(out_OBUF[9]),
        .O(PCsrc_i_58_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    PCsrc_i_6
       (.I0(PCsrc_i_20_n_0),
        .I1(PCsrc_i_21_n_0),
        .I2(PCsrc_i_22_n_0),
        .I3(PCsrc_i_23_n_0),
        .O(PCsrc_i_6_n_0));
  LUT6 #(
    .INIT(64'h557777775FDFFDDF)) 
    PCsrc_i_63
       (.I0(ALUresult2_carry_i_8_n_0),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(Q[1]),
        .I5(Q[4]),
        .O(PCsrc_i_63_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    PCsrc_i_64
       (.I0(Q[1]),
        .I1(Q[0]),
        .O(PCsrc_i_64_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_65
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[9]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_65_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_66
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[9]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_66_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_67
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[9]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_67_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_68
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[9]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_68_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_69
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[9]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_69_n_0));
  LUT6 #(
    .INIT(64'hFFFFF88800000000)) 
    PCsrc_i_7
       (.I0(PCsrc_i_10_n_0),
        .I1(PCsrc_i_24_n_0),
        .I2(PCsrc_i_25_n_0),
        .I3(PCsrc_i_26_n_0),
        .I4(PCsrc_i_27_n_0),
        .I5(\currentPC_reg[6]_2 ),
        .O(PCsrc_i_7_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_70
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[9]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_70_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_71
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[9]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_71_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_72
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[9]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_72_n_0));
  LUT6 #(
    .INIT(64'hBBEFBEFBBFFBFEAB)) 
    PCsrc_i_73
       (.I0(\currentPC_reg[6]_0 ),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[2]),
        .I4(Q[3]),
        .I5(Q[4]),
        .O(PCsrc_i_73_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_74
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[9]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_74_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_75
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[9]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_75_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_76
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[9]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_76_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_77
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[9]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_77_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_78
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[9]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_78_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_79
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[9]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_79_n_0));
  LUT6 #(
    .INIT(64'hF0F0F0F0F0E00000)) 
    PCsrc_i_8
       (.I0(data2[6]),
        .I1(data2[5]),
        .I2(\currentPC_reg[6]_2 ),
        .I3(data2[2]),
        .I4(PCsrc_i_10_n_0),
        .I5(PCsrc_i_27_n_0),
        .O(PCsrc_i_8_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_80
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[9]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_80_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_81
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[9]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_81_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_82
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[9]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_82_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_83
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[9]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_83_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_84
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[9]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_84_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_85
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[9]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_85_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_86
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[9]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_86_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_87
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[9]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_87_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_88
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[9]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_88_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_89
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[9]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_89_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_90
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[9]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_90_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_91
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[9]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_91_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_92
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[9]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_92_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_93
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[9]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(p_0_in[15]));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_94
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[9]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_94_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_95
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[9]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_95_n_0));
  LUT3 #(
    .INIT(8'h6A)) 
    PCsrc_i_96
       (.I0(\EX/ALUcontrol ),
        .I1(out_OBUF[9]),
        .I2(ALUresult2_carry_i_8_n_0),
        .O(PCsrc_i_96_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 PCsrc_reg_i_11
       (.CI(1'b0),
        .CO({PCsrc_reg_i_11_n_0,PCsrc_reg_i_11_n_1,PCsrc_reg_i_11_n_2,PCsrc_reg_i_11_n_3}),
        .CYINIT(1'b0),
        .DI({p_0_in[3:1],\EX/ALUcontrol }),
        .O({data2[3:1],NLW_PCsrc_reg_i_11_O_UNCONNECTED[0]}),
        .S({PCsrc_i_41_n_0,PCsrc_i_42_n_0,PCsrc_i_43_n_0,PCsrc_i_44_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 PCsrc_reg_i_13
       (.CI(PCsrc_reg_i_9_n_0),
        .CO({PCsrc_reg_i_13_n_0,PCsrc_reg_i_13_n_1,PCsrc_reg_i_13_n_2,PCsrc_reg_i_13_n_3}),
        .CYINIT(1'b0),
        .DI({p_0_in[11],\EX/ALUcontrol ,\EX/ALUcontrol ,\EX/ALUcontrol }),
        .O(data2[11:8]),
        .S({PCsrc_i_46_n_0,PCsrc_i_47_n_0,PCsrc_i_48_n_0,PCsrc_i_49_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 PCsrc_reg_i_15
       (.CI(PCsrc_reg_i_13_n_0),
        .CO({PCsrc_reg_i_15_n_0,PCsrc_reg_i_15_n_1,PCsrc_reg_i_15_n_2,PCsrc_reg_i_15_n_3}),
        .CYINIT(1'b0),
        .DI({PCsrc_i_50_n_0,\EX/ALUcontrol ,p_0_in[13:12]}),
        .O(data2[15:12]),
        .S({PCsrc_i_53_n_0,PCsrc_i_54_n_0,PCsrc_i_55_n_0,PCsrc_i_56_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 PCsrc_reg_i_57
       (.CI(PCsrc_reg_i_15_n_0),
        .CO({PCsrc_reg_i_57_n_0,PCsrc_reg_i_57_n_1,PCsrc_reg_i_57_n_2,PCsrc_reg_i_57_n_3}),
        .CYINIT(1'b0),
        .DI({PCsrc_i_65_n_0,PCsrc_i_66_n_0,PCsrc_i_67_n_0,PCsrc_i_68_n_0}),
        .O(data2[19:16]),
        .S({PCsrc_i_69_n_0,PCsrc_i_70_n_0,PCsrc_i_71_n_0,PCsrc_i_72_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 PCsrc_reg_i_59
       (.CI(PCsrc_reg_i_57_n_0),
        .CO({PCsrc_reg_i_59_n_0,PCsrc_reg_i_59_n_1,PCsrc_reg_i_59_n_2,PCsrc_reg_i_59_n_3}),
        .CYINIT(1'b0),
        .DI({PCsrc_i_74_n_0,PCsrc_i_75_n_0,PCsrc_i_76_n_0,PCsrc_i_77_n_0}),
        .O(data2[23:20]),
        .S({PCsrc_i_78_n_0,PCsrc_i_79_n_0,PCsrc_i_80_n_0,PCsrc_i_81_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 PCsrc_reg_i_60
       (.CI(PCsrc_reg_i_59_n_0),
        .CO({PCsrc_reg_i_60_n_0,PCsrc_reg_i_60_n_1,PCsrc_reg_i_60_n_2,PCsrc_reg_i_60_n_3}),
        .CYINIT(1'b0),
        .DI({PCsrc_i_82_n_0,PCsrc_i_83_n_0,PCsrc_i_84_n_0,PCsrc_i_85_n_0}),
        .O(data2[27:24]),
        .S({PCsrc_i_86_n_0,PCsrc_i_87_n_0,PCsrc_i_88_n_0,PCsrc_i_89_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 PCsrc_reg_i_61
       (.CI(PCsrc_reg_i_60_n_0),
        .CO({NLW_PCsrc_reg_i_61_CO_UNCONNECTED[3],PCsrc_reg_i_61_n_1,PCsrc_reg_i_61_n_2,PCsrc_reg_i_61_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,PCsrc_i_90_n_0,PCsrc_i_91_n_0,PCsrc_i_92_n_0}),
        .O(data2[31:28]),
        .S({p_0_in[15],PCsrc_i_94_n_0,PCsrc_i_95_n_0,PCsrc_i_96_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 PCsrc_reg_i_9
       (.CI(PCsrc_reg_i_11_n_0),
        .CO({PCsrc_reg_i_9_n_0,PCsrc_reg_i_9_n_1,PCsrc_reg_i_9_n_2,PCsrc_reg_i_9_n_3}),
        .CYINIT(1'b0),
        .DI({\EX/ALUcontrol ,\EX/ALUcontrol ,p_0_in[5:4]}),
        .O(data2[7:4]),
        .S({PCsrc_i_31_n_0,PCsrc_i_32_n_0,PCsrc_i_33_n_0,PCsrc_i_34_n_0}));
  LUT5 #(
    .INIT(32'hAAAAF0CC)) 
    \currentPC[2]_i_1 
       (.I0(out_OBUF[0]),
        .I1(nextPC[2]),
        .I2(ALU_n_0),
        .I3(PCsrc),
        .I4(\currentPC[6]_i_2_n_0 ),
        .O(\currentPC[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h88208208)) 
    \currentPC[6]_i_2 
       (.I0(Q[4]),
        .I1(Q[0]),
        .I2(Q[3]),
        .I3(Q[2]),
        .I4(Q[1]),
        .O(\currentPC[6]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \currentPC_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\currentPC[2]_i_1_n_0 ),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \currentPC_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(ALU_n_7),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \currentPC_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(ALU_n_6),
        .Q(Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \currentPC_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(ALU_n_5),
        .Q(Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \currentPC_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(ALU_n_4),
        .Q(Q[4]),
        .R(1'b0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 nextPC0_carry
       (.CI(1'b0),
        .CO({nextPC0_carry_n_0,nextPC0_carry_n_1,nextPC0_carry_n_2,nextPC0_carry_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,nextPC0_carry_i_1_n_0,1'b0}),
        .O({nextPC0_carry_n_4,nextPC0_carry_n_5,nextPC0_carry_n_6,nextPC0_carry_n_7}),
        .S({ALU_n_8,ALU_n_9,nextPC0_carry_i_4_n_0,ALU_n_10}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 nextPC0_carry__0
       (.CI(nextPC0_carry_n_0),
        .CO({NLW_nextPC0_carry__0_CO_UNCONNECTED[3:1],nextPC0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_nextPC0_carry__0_O_UNCONNECTED[3:2],nextPC0_carry__0_n_6,nextPC0_carry__0_n_7}),
        .S({1'b0,1'b0,ALU_n_11,ALU_n_12}));
  LUT5 #(
    .INIT(32'hAAAAF0CC)) 
    nextPC0_carry_i_1
       (.I0(out_OBUF[0]),
        .I1(nextPC[2]),
        .I2(ALU_n_0),
        .I3(PCsrc),
        .I4(\currentPC[6]_i_2_n_0 ),
        .O(nextPC0_carry_i_1_n_0));
  LUT5 #(
    .INIT(32'h55550F33)) 
    nextPC0_carry_i_4
       (.I0(out_OBUF[0]),
        .I1(nextPC[2]),
        .I2(ALU_n_0),
        .I3(PCsrc),
        .I4(\currentPC[6]_i_2_n_0 ),
        .O(nextPC0_carry_i_4_n_0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \nextPC_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(nextPC0_carry_n_7),
        .Q(nextPC[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \nextPC_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(nextPC0_carry_n_6),
        .Q(nextPC[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \nextPC_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(nextPC0_carry_n_5),
        .Q(nextPC[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \nextPC_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(nextPC0_carry_n_4),
        .Q(nextPC[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \nextPC_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(nextPC0_carry__0_n_7),
        .Q(nextPC[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \nextPC_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(nextPC0_carry__0_n_6),
        .Q(nextPC[6]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h00000400)) 
    \out_OBUF[11]_inst_i_1 
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[4]),
        .O(out_OBUF[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h00004002)) 
    \out_OBUF[12]_inst_i_1 
       (.I0(Q[4]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(Q[3]),
        .O(out_OBUF[7]));
  LUT5 #(
    .INIT(32'h04550002)) 
    \out_OBUF[15]_inst_i_1 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(Q[1]),
        .O(out_OBUF[9]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h13F14DC0)) 
    \out_OBUF[16]_inst_i_1 
       (.I0(Q[4]),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(Q[0]),
        .I4(Q[1]),
        .O(out_OBUF[10]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00006700)) 
    \out_OBUF[17]_inst_i_1 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(out_OBUF[11]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h282A7FD1)) 
    \out_OBUF[19]_inst_i_1 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[3]),
        .O(out_OBUF[12]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00007F10)) 
    \out_OBUF[20]_inst_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(out_OBUF[13]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h04000406)) 
    \out_OBUF[21]_inst_i_1 
       (.I0(Q[4]),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(Q[0]),
        .O(out_OBUF[14]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h00002000)) 
    \out_OBUF[22]_inst_i_1 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(out_OBUF[8]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h00008000)) 
    \out_OBUF[23]_inst_i_1 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(out_OBUF[15]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \out_OBUF[24]_inst_i_1 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[4]),
        .O(out_OBUF[16]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h44404406)) 
    \out_OBUF[25]_inst_i_1 
       (.I0(Q[4]),
        .I1(Q[3]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[2]),
        .O(out_OBUF[17]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h88209748)) 
    \out_OBUF[27]_inst_i_1 
       (.I0(Q[4]),
        .I1(Q[0]),
        .I2(Q[3]),
        .I3(Q[2]),
        .I4(Q[1]),
        .O(out_OBUF[19]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h0000E500)) 
    \out_OBUF[28]_inst_i_1 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(out_OBUF[20]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h292A2AD5)) 
    \out_OBUF[29]_inst_i_1 
       (.I0(Q[4]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(Q[1]),
        .O(out_OBUF[21]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h00001444)) 
    \out_OBUF[31]_inst_i_1 
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[0]),
        .I4(Q[4]),
        .O(out_OBUF[18]));
  LUT5 #(
    .INIT(32'hE4D24C64)) 
    \out_OBUF[3]_inst_i_1 
       (.I0(Q[4]),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(Q[0]),
        .O(out_OBUF[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hA0800C20)) 
    \out_OBUF[4]_inst_i_1 
       (.I0(Q[4]),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(Q[0]),
        .O(out_OBUF[4]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h15000507)) 
    \out_OBUF[5]_inst_i_1 
       (.I0(Q[4]),
        .I1(Q[0]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .O(out_OBUF[5]));
endmodule

module control
   (PCsrc_reg,
    PCsrc_reg_0,
    PCsrc_reg_1,
    Q);
  output PCsrc_reg;
  output PCsrc_reg_0;
  output PCsrc_reg_1;
  input [4:0]Q;

  wire PCsrc_reg;
  wire PCsrc_reg_0;
  wire PCsrc_reg_1;
  wire [4:0]Q;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h40404004)) 
    BranchT
       (.I0(Q[4]),
        .I1(Q[3]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[2]),
        .O(PCsrc_reg));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h6D2A6B85)) 
    PCsrc_i_37
       (.I0(Q[4]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(Q[1]),
        .O(PCsrc_reg_0));
  LUT5 #(
    .INIT(32'hBBFFAAAF)) 
    PCsrc_i_62
       (.I0(Q[4]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(Q[1]),
        .O(PCsrc_reg_1));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
