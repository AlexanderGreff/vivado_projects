`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2025 07:20:00 PM
// Design Name: 
// Module Name: effective_addr_unit
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


module effective_addr_unit#
(
  parameter int DATA_WIDTH = 16
)(
        input logic [DATA_WIDTH-1:0]  pc,
        input logic [DATA_WIDTH-1:0] sr1_out,
        input logic addr1mux,
        input logic [1:0] addr2mux,
        input logic signed [DATA_WIDTH-1:0] offset6,
        input logic signed [DATA_WIDTH-1:0] pc_offset9,
        input logic signed [DATA_WIDTH-1:0] pc_offset11,
        
        output logic [DATA_WIDTH-1:0] effective_addr_out
    );
    
logic [DATA_WIDTH-1:0] addr1;
logic [DATA_WIDTH-1:0] addr2;
    
always_comb
begin 
    case(addr1mux)
    1'b0: addr1 = pc;
    1'b1: addr1 = sr1_out;
    endcase
end

always_comb
begin 
    case(addr2mux)
    2'b00: addr2 = pc_offset11;
    2'b01: addr2 = pc_offset9;
    2'b10: addr2 = offset6;
    2'b11: addr2 = 16'b0;
    endcase
end

assign effective_addr_out = addr1 + addr2;


    
endmodule
