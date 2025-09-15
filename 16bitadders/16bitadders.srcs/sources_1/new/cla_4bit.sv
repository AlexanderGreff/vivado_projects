`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2025 07:52:25 PM
// Design Name: 
// Module Name: cla_4bit
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


module cla_4bit
    (
     input  logic [3:0] a_in, 
    input  logic  [3:0] b_in,
	input  logic  cin,
	output logic  pbit,
    output logic gbit,
	output logic  [3:0] s_out
    );
    
logic  [3:0] p;
logic  [3:0] g;

genvar i;
for (i = 0; i < 4; i = i + 1)
begin
	assign p[i] = a_in[i] ^ b_in[i];
	assign g[i] = a_in[i] & b_in[i];
	assign s_out[i] = a_in[i] ^ b_in[i] ^ cin;
end	

	assign pbit = &p;
	assign gbit = g[3] | (g[2] & p[3]) | (g[1] & p[3] & p[2]) | (g[0] & p[3] & p[2] & p[1]);

endmodule
