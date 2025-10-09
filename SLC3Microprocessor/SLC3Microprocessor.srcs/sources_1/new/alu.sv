`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2025 05:58:57 PM
// Design Name: 
// Module Name: alu
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


module alu#
(
  parameter int DATA_WIDTH = 16
)(
        input logic [DATA_WIDTH-1:0] a_in,
        input logic [DATA_WIDTH-1:0] b_in,
        input logic [1:0]  alu_k,
        
        output logic [DATA_WIDTH-1:0] alu_out
    );
    
    always_comb begin 
        case (alu_k)
            2'b00: alu_out = a_in + b_in;    // ADD
            2'b01: alu_out = a_in & b_in;    // AND
            2'b10: alu_out = ~a_in;       // NOT
            2'b11: alu_out = a_in; //return A as it is (debugging)
        endcase 
    end
    
    
    
endmodule
