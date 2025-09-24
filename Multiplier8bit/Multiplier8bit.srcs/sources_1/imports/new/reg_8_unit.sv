`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2025 02:16:25 PM
// Design Name: 
// Module Name: reg_8_unit
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


module reg_8_unit
(
	input  logic        Clk, 
	input  logic        Reset,
	input  logic        A_In,
	input  logic        B_In,
	input  logic        S_In,
	input  logic        Ld_A,
	input  logic        Ld_B, 
	input  logic        Ld_S,
	input  logic        Shift_En,
	input  logic [7:0]  D_A, 
	input  logic [7:0]  D_B, 
	input  logic [7:0]  D_S, 

	output logic        A_shift_out, 
	output logic        B_shift_out, 
	output logic        S_shift_out, 
	output logic [7:0]  A_out,
	output logic [7:0]  B_out,
	output logic [7:0]  S_out
);
    
	reg_8 reg_A (
		.Clk            (Clk), 
		.Reset          (Reset),

		.Shift_In       (A_In), 
		.Load           (Ld_A), 
		.Shift_En       (Shift_En),
		.D              (D_A),

		.Shift_Out      (A_shift_out),
		.Data_Out       (A_out)
	);

	reg_8 reg_B (
		.Clk            (Clk), 
		.Reset          (Reset),

		.Shift_In       (B_In), 
		.Load           (Ld_B), 
		.Shift_En       (Shift_En),
		.D              (D_B),

		.Shift_Out      (B_shift_out),
		.Data_Out       (B_out)
	);
	
		reg_8 reg_S (
		.Clk            (Clk), 
		.Reset          (Reset),

		.Shift_In       (S_In), 
		.Load           (Ld_S), 
		.Shift_En       (1'b0),   
		.D              (D_S),

		.Shift_Out      (S_shift_out),
		.Data_Out       (S_out)
	);
	


    
endmodule
