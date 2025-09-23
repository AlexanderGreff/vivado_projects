`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2025 02:24:38 PM
// Design Name: 
// Module Name: Multiplier
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


module Multiplier
(
 input logic [7:0] SW,
 input logic CLK,
 input logic Reset_Load_Logic,
 input logic Run,
 
 output logic [3:0] hex_grid, 
 output logic [7:0] hex_seg,
 output logic [7:0] Aval,
 output logic [7:0] Bval,
 output logic Xval
 );
 	logic Reset_SH;
	logic LoadA_SH;
	logic LoadB_SH;
	logic Execute_SH;

	logic [2:0] F_S;
	logic [1:0] R_S;
	logic       Ld_A;
	logic       Ld_B;
	logic       newA;
	logic       newB;
	logic       bitA;
	logic       bitB;
	logic       Shift_En;
	logic       F_A_B;
	logic       opA;
	logic       opB;
	logic [7:0] A; 
	logic [7:0] B; 
	logic [7:0] Din_S;
	 
	 
//We can use the "assign" statement to do simple combinational logic
	assign Aval = A;
	assign Bval = B;
	assign LED  = {Execute_SH, LoadA_SH, LoadB_SH, Reset_SH}; //Concatenate is a common operation in HDL

//Instantiation of modules here
	reg_8_unit reg_unit (
		.Clk        (Clk),
		.Reset      (Reset_SH),

		.Ld_A       (Ld_A),
		.Ld_B       (Ld_B),
		.Shift_En   (Shift_En),
		.S          (Din_S),
		.A_In       (newA),
		.B_In       (newB),
		.A_out      (opA),
		.B_out      (opB),

		.A          (A),
		.B          (B) 
	);
                    
//Adder goes here

	control_8 control_unit (
		.Clk        (Clk),
		.Reset_LoadB_ClearA (Reset_SH),

		.Run   (Execute_SH),
		.Shift_En   (Shift_En),
		.Add (),
		.Sub (),
		.Ld_B       (Ld_B) 
	);
                    
//When you extend to 8-bits, you will need more HEX drivers to view upper nibble of registers, for now set to 0
	HexDriver HexA (
		.clk        (Clk),
		.reset      (Reset_SH),

		.in         ({B[7:4],B[3:0],A[7:4],A[3:0]}),
		.hex_seg    (hex_seg),
		.hex_grid   (hex_grid)
	);

                            
//Input synchronizers required for asynchronous inputs (in this case, from the switches)
//These are array module instantiations
//Note: S stands for SYNCHRONIZED, H stands for active HIGH, in addition in synthesis they are also debounced

	sync_debounce button_sync [3:0] (
		.Clk  (Clk),

		.d    ({Reset, LoadA, LoadB, Execute}),
		.q    ({Reset_SH, LoadA_SH, LoadB_SH, Execute_SH})
	);

	sync_debounce Din_sync [7:0] (
		.Clk  (Clk), 

		.d    (Din), 
		.q    (Din_S)
	);

	sync_debounce F_sync [2:0] (
		.Clk  (Clk), 

		.d    (F), 
		.q    (F_S)
	);

	sync_debounce R_sync [1:0] (
		.Clk  (Clk), 

		.d    (R), 
		.q    (R_S)
	);
	  
 
    

endmodule
