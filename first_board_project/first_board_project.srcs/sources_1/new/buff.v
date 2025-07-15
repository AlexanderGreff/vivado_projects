`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2025 01:23:15 PM
// Design Name: 
// Module Name: buff
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


module buff(
    input in_0,
    input in_1,
    input [8:3] I,
    output out_0,
    output out_1,
    output [8:3] O
    );
    assign out_0 = in_0;
    assign out_1 = in_1;   
    assign O = I; 

endmodule
