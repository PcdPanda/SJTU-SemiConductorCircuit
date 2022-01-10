`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/18 15:37:18
// Design Name: 
// Module Name: ppl_sim
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

module ppl_sim;
reg clk;
wire [31:0] T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, S0, S1, S2, S3, S4, S5, S6, S7, PCout_monitor;

Pipeline UUT (clk, T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, S0, S1, S2, S3, S4, S5, S6, S7, PCout_monitor);

initial begin
#0 clk=0;
end
always #1 begin
    clk=~clk;
end


always @(clk) begin
    $display("******************************************************");
    $display("Time: %t, CLK = %b, PC = %h\n", $time, clk, PCout_monitor);
    $display("[$s0] = %h, [$s1] = %h, [$s2] = %h\n", S0, S1, S2);
    $display("[$s3] = %h, [$s4] = %h, [$s5] = %h\n", S3, S4, S5);
    $display("[$s6] = %h, [$s7] = %h, [$t0] = %h\n", S6, S7, T0);
    $display("[$t1] = %h, [$t2] = %h, [$t3] = %h\n", T1, T2, T3);
    $display("[$t4] = %h, [$t5] = %h, [$t6] = %h\n", T4, T5, T6);
    $display("[$t7] = %h, [$t8] = %h, [$t9] = %h\n", T7, T8, T9);
end


initial #80 $stop;
endmodule
