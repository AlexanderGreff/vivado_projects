`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2025 04:37:42 PM
// Design Name: 
// Module Name: reg_file
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


module reg_file #(
parameter int REG_COUNT  = 8,
parameter int DATA_WIDTH = 16
)(
    input logic ld_reg,
    input logic clk,
    input logic [DATA_WIDTH-1:0] ir,
    input logic drmux,
    input logic sr1mux,
    input logic [2:0] sr2,
    
    
    output logic [DATA_WIDTH-1:0] sr1_out,
    output logic [DATA_WIDTH-1:0] sr2_out
 );
 
logic [2:0] dr;
assign dr = drmux ? 3'b111 : ir[11:9];

logic [2:0] sr1;
logic [REG_COUNT-1:0]  we;
logic [DATA_WIDTH-1:0] q [REG_COUNT];
 
genvar i;
generate
    for (i = 0; i < REG_COUNT; i++)
    begin
        assign we[i] = ld_reg & (dr == i[2:0]); //demux
        load_reg #(.DATA_WIDTH(DATA_WIDTH)) file_reg
        (
            .clk(clk),
            .reset(reset),
        
            .load(we[i]),
            .data_i(data_in),
        
            .data_q(q[i])        
        );
    end
endgenerate

assign sr1 = sr1mux ? ir[11:9] : ir[8:6];
assign sr1_out = q[sr1];
assign sr2_out = q[sr2];

 
 
endmodule
