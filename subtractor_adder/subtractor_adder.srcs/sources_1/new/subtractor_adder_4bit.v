`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2025 04:02:32 PM
// Design Name: 
// Module Name: subtractor_adder_4bit
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


module subtractor_adder_4bit(
    input [3:0] x,y,
    input add_n, //_n means that the add controller is asserted when the control bit is zero
    output [3:0] s,
    output c_out
    );

    wire [3:0] XORed_y;
    
    assign XORed_y[0] = y[0] ^ add_n;   
    assign XORed_y[1] = y[1] ^ add_n;   
    assign XORed_y[2] = y[2] ^ add_n;   
    assign XORed_y[3] = y[3] ^ add_n;   

    rca_4bit A0 (
        .x(x),
        .y(XORed_y),
        .c_in(add_n),
        .c_out(c_out)
    );

endmodule
