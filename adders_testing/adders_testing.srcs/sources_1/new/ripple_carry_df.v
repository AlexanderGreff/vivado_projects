`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2025 03:35:56 PM
// Design Name: 
// Module Name: ripple_carry_df
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


module ripple_carry_df(
    input [3:0] x,
    input [3:0] y,    
    input c_in,
    output c_out,
    output [3:0] s
    );
    
    wire [3:1] c;
    
    full_adder_df FA0 (
        .x(x[0]), 
        .y(y[0]),
        .c_in(c_in),
        .s(s[0]),
        .c_out(c[1])
    );

    full_adder_df FA1 (
        .x(x[1]),
        .y(y[1]),
        .c_in(c[1]),
        .s(s[1]),
        .c_out(c[2])
    );

    full_adder_df FA2 (
        .x(x[2]),
        .y(y[2]),
        .c_in(c[2]),
        .s(s[2]),
        .c_out(c[3])
    );

    full_adder_df FA3 (
        .x(x[3]),
        .y(y[3]),
        .c_in(c[3]),
        .s(s[3]),
        .c_out(c_out)
    );

endmodule
