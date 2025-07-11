`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/08/2025 04:34:53 PM
// Design Name: 
// Module Name: mux4x1
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


module mux4x1(input x0,x1,x2,x3,
input s0,s1,
output f
    );
    
    wire g0, g1;
    
    //mux2x1 M0 (x0, x1, s0, g0); 
    //unnamed port connection - bad if input order or number changes
    
    
    mux_2x1_beh M0(
    .x1(x0),
    .x2(x1),
    .s(s0),
    .f(g0)
    );
    
    mux2x1 M1 ( //named port conntection - good because specificity. Structual representation: gate-level modeling
    .x1(x2),
    .s(s0),
    .x2(x3),
    .f(g1)
    );
    
    
    mux_2x1_df M2 (
    .x1(g0),
    .s(s1),
    .x2(g1),
    .f(f)
    );
    
endmodule
