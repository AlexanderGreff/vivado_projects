`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/08/2025 02:37:29 PM
// Design Name: 
// Module Name: mux4_1_test
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


module mux4_1_test(
 input x0,
 input x1, 
 input x2, 
 input x3,
 input s1,
 input s0,
 output f
    );
    wire w0;
    wire w1;
    wire w2;
    wire w3;
    assign w0 = x0 & ~s1 & ~s0;
    assign w1 = x1 & ~s1 & s0;
    assign w2 = x2 & s1 & ~s0;
    assign w3 = x3 & s1 & s0;
    assign f = (w0 | w1 | w2 | w3);

endmodule
