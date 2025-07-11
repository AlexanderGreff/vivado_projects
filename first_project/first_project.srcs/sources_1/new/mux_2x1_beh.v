`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/08/2025 05:22:21 PM
// Design Name: 
// Module Name: mux_2x1_beh
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


module mux_2x1_beh(
    input x1, x2, s, 
    output reg f //must store output values
    );
    
    always @ (x1,x2,s)
    begin
    /*
        if (s)           //if-else version
        begin
            f = x2;           
        end
        else
        begin
            f = x1;
        end
    */    
        case (s)          //case version
        1: f = x2;
        0: f = x1;
        //default: <- useful for multiple cases
        endcase
    end
endmodule
