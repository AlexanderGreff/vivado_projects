`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2025 05:18:45 PM
// Design Name: 
// Module Name: multi_adders
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


module multi_adders(
    input [15 : 0] a, b,
    input [33:0] x, y,
    output [15 : 0] s_ab,
    output [33 : 0] s_xy,
    output c_out_ab,
    output c_out_xy
    );
    
    rca_nbit_df #(.n(16)) adder_16 (
        .x(a),
        .y(b),
        .c_in(0),
        .s(s_ab),
        .c_out(c_out_ab)  
    );
    
    rca_nbit_df #(.n(34)) adder_34 (
        .x(a),
        .y(b),
        .c_in(0),
        .s(s_xy),
        .c_out(c_out_xy)
        
        
    );
    
    
endmodule
