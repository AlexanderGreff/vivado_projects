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
 input logic Clk,
 input logic Reset_Load_Logic,
 input logic Run,
 
 output logic [3:0] hex_grid, 
 output logic [7:0] hex_seg,
 output logic [7:0] Aval,
 output logic [7:0] Bval,
 output logic Xval
 );
 //button sync
 	logic ClrXA_LdB_SH;
	logic Run_SH;
//Register
	logic [7:0] A; 
	logic [7:0] B; 
	logic [7:0] S; 
	logic X;

	logic Shift_En;
	logic [7:0] Din_S;
//condition for registers XA to load
	logic Ld_A_En;
//control unit's outputs
	logic ctrl_add_out;
	logic ctrl_sub_out;
//button press in FSM
//sum from adder-subtractor
	logic [8:0] sum;
//shifted out bits from resgisters A,B,S
	logic A_shift_out;
	logic B_shift_out;
	logic Clr_XA;
	logic ClrXA_LdB;
	 
	 
//We can use the "assign" statement to do simple combinational logic
	assign Aval = A;
	assign Bval = B;
	assign Xval = X;

//Instantiation of modules here
    assign Ld_A_En = ctrl_add_out | ctrl_sub_out;

	reg_8_unit reg_unit (
		.Clk        (Clk),
		.Reset      (1'b0),

		.Ld_A       (Ld_A_En | Clr_XA),
		.Ld_B       (ClrXA_LdB),
		.Ld_S        (Run_SH),
		.Shift_En   (Shift_En),
		.D_A        (Clr_XA ? 8'h00 : sum[7:0]),
		.D_B        (Din_S),
		.D_S        (Din_S),
		.A_In       (X),
		.B_In       (A_shift_out),
		.S_In(1'b0),
		
		.A_shift_out      (A_shift_out),
		.B_shift_out      (B_shift_out),
		.S_shift_out      (),

		.A_out          (A),
		.B_out         (B),
		.S_out (S)
	);
	
	    reg_1 reg_X
    (
    	.Clk            (Clk), 
		.Reset          (1'b0),

		.Shift_In       (X), 
		.Load           (Ld_A_En | Clr_XA), 
		.Shift_En       (Shift_En),   
		.D              (Clr_XA ? 1'b0  : sum[8]),

		.Shift_Out      (),
		.Data_Out       (X)
    );
                    
                    
    adder_subtractor_8 add_sub
    (
    .S(S), 
    .X_in(X),
    .A(A),
    .Sub(ctrl_sub_out),
            
    .sum(sum)
    );
    

	control_8 control_unit (
		.Clk        (Clk),
		.Reset_LoadB_ClearA (ClrXA_LdB_SH),
		.Run   (Run_SH),
		.B_out(B_shift_out),
		
		.Shift_En   (Shift_En),
		.Add (ctrl_add_out),
		.Sub (ctrl_sub_out),
		.ClrXA_Ld_B (ClrXA_LdB),
		.Clr_XA (Clr_XA)
		
	);
                    
 
//When you extend to 8-bits, you will need more HEX drivers to view upper nibble of registers, for now set to 0



HexDriver HexA (
		.clk        (Clk),
		.reset      (ClrXA_LdB_SH),

		.in         ({A[7:4],A[3:0],B[7:4],B[3:0]}),
		.hex_seg    (hex_seg),
		.hex_grid   (hex_grid)
	);
                            
//Input synchronizers required for asynchronous inputs (in this case, from the switches)
//These are array module instantiations
//Note: S stands for SYNCHRONIZED, H stands for active HIGH, in addition in synthesis they are also debounced

sync_debounce button_sync [1:0] (
    .Clk (Clk),
    .d   ({Reset_Load_Logic, Run}),
    .q   ({ClrXA_LdB_SH, Run_SH})
);

	sync_debounce Din_sync [7:0] (
		.Clk  (Clk), 

		.d    (SW), 
		.q    (Din_S)
	);

 
    

endmodule
