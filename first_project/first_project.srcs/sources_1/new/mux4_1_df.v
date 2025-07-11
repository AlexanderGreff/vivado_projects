`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/08/2025 04:14:50 PM
// Design Name: 
// Module Name: mux4_1_df
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


module mux4_1_df(
 input x0,
 input x1, 
 input x2, 
 input x3,
 input s1,
 input s0,
 output f
    );
    assign f = (~s1 & ~s0 & x0) | (~s1 & s0 & x1) | (s1 & ~s0 & x2) | (s1 & s0 & x3);
endmodule
