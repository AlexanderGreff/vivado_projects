`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2025 08:03:22 PM
// Design Name: 
// Module Name: cc_logic
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


module cc_logic#
(
  parameter int DATA_WIDTH = 16
)(
    input logic [DATA_WIDTH-1:0] shared_bus,
    input logic ld_cc,
    input logic clk,
    
    output logic [2:0] cc
  );
  
always_ff @(posedge clk) begin
    if (ld_cc) begin
      if (shared_bus == '0)
        cc <= 3'b010;        // Z
      else if (shared_bus[DATA_WIDTH-1])
        cc <= 3'b100;        // N
      else
        cc <= 3'b001;        // P
    end
  end
endmodule
