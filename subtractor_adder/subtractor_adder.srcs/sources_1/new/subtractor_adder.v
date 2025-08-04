`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2025 04:02:32 PM
// Design Name: 
// Module Name: subtractor_adder
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


module subtractor_adder
    #(parameter n = 4)
    (
    input [n-1:0] x,y,
    input add_n, //_n means that the add controller is asserted when the control bit is zero
    output [n-1:0] s,
    output c_out,
    output overflow
    );

    wire [n-1:0] XORed_y;

    generate
        genvar k;

        for (k = 0; k < n; k = k + 1)
        begin: bit
            assign XORed_y[k] = y[k] ^ add_n;
        end 
    endgenerate

    rca_nbit #(.n(n)) A0 (
        .x(x),
        .y(XORed_y),
        .c_in(add_n),
        .s(s),
        .c_out(c_out)
    );

    assign overflow = (x[n - 1] & XORed_y[n - 1] & ~s[n - 1] | (~x[n - 1] & ~XORed_y[n - 1] & s[n - 1]));

endmodule
