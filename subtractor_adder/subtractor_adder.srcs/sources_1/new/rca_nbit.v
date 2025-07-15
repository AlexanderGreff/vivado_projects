`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2025 03:58:00 PM
// Design Name: 
// Module Name: rca_nbit_df
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


module rca_nbit
    #(parameter n = 4) //parameter n; default value = 4
    (
    input [n - 1 : 0] x, y,
    input c_in,
    output [n-1 : 0] s,
    output c_out
    );
    wire [n : 0] c;
    assign c[0] = c_in;
    assign c_out = c[n];
    generate
        genvar k; //"generate variable", integer that cannot take negative values
        for (k = 0; k < n; k = k + 1) //same syntax as c, nothing like it functionality-wise, we are describing hardware, not algorithm
        begin: stage //name each instance
            full_adder FA 
            (
                .x(x[k]),
                .y(y[k]),
                .c_in(c[k]),
                .s(s[k]),
                .c_out(c[k + 1]) //index of next c
            );
        end
 
    endgenerate
    
endmodule
