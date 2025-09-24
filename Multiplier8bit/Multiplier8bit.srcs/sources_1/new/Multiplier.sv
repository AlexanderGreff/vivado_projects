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
 output logic [7:0] Sval,
 output logic [3:0]  LED,
 output logic Xval
 );
 //button sync
 	logic Reset_SH;
 	logic ClrXA_LdB_SH;
	logic Execute_SH;
//Register
	logic X;
	logic [7:0] A; 
	logic [7:0] B; 
	logic [7:0] S; 
//debounce bits
	logic [2:0] F_S;
	logic [1:0] R_S;
//

	logic Shift_En;
	logic [7:0] Din_S;
//condition for registers XA to load
	logic Ld_A_En;
//control unit's outputs
	logic ctrl_add_out;
	logic ctrl_sub_out;
//button press in FSM
	logic ClrA_LdB;
//sum from adder-subtractor
	logic [8:0] sum;
//shifted out bits from resgisters A,B,S
	logic A_shift_out;
	logic B_shift_out;
	logic S_shift_out;
	 
	 
//We can use the "assign" statement to do simple combinational logic
	assign Aval = A;
	assign Bval = B;
	assign Sval = S;
	assign Xval = X;
	assign LED = {ctrl_sub_out, ctrl_add_out, Execute_SH, ClrXA_LdB_SH};

//Instantiation of modules here
    assign Ld_A_En = ctrl_add_out | ctrl_sub_out;

	reg_8_unit reg_unit (
		.Clk        (Clk),
		.Reset      (Reset_SH),

		.Ld_A       (Ld_A_En),
		.Ld_B       (ClrA_LdB),
		.Ld_S        (Execute_SH),
		.Shift_En   (Shift_En),
		.D_A        (sum[7:0]),
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
		.Reset          (Reset_SH),

		.Shift_In       (X), 
		.Load           (Ld_A_En), 
		.Shift_En       (Shift_En),   
		.D              (sum[8]),

		.Shift_Out      (),
		.Data_Out       (X)
    );
                    
    //Adder goes here
    adder_subtractor_8 add_sub
    (
    .S(S), 
    .A(A),
    .Sub(ctrl_sub_out),
            
    .X(X),
    .sum(sum)
    );
    

	control_8 control_unit (
		.Clk        (Clk),
		.Reset_LoadB_ClearA (Reset_SH),
		.Run   (Execute_SH),
		.B_out(B_shift_out),
		
		.Shift_En   (Shift_En),
		.Add (ctrl_add_out),
		.Sub (ctrl_sub_out),
		.ClrXA_Ld_B (ClrA_LdB)
	);
                    
 
//When you extend to 8-bits, you will need more HEX drivers to view upper nibble of registers, for now set to 0
HexDriverExtended HexAll (
    .clk      (Clk),
    .reset    (Reset_SH),

    .in       ({
               {3'b000, X},  // digit 7: X (MSB of product)
            A[7:4],       // digit 6: A high nibble
            A[3:0],       // digit 5: A low nibble
            B[7:4],       // digit 4: B high nibble
            B[3:0],       // digit 3: B low nibble
            S[7:4],       // digit 2: S high nibble
            S[3:0],       // digit 1: S low nibble
            4'h0          // digit 0: padding or unused
              }),

    .hex_seg  (hex_seg),
    .hex_grid (hex_grid)
);
                            
//Input synchronizers required for asynchronous inputs (in this case, from the switches)
//These are array module instantiations
//Note: S stands for SYNCHRONIZED, H stands for active HIGH, in addition in synthesis they are also debounced

sync_debounce button_sync [2:0] (
    .Clk (Clk),
    .d   ({Reset_Load_Logic, Run, ClrXA_LdB}),
    .q   ({Reset_SH, Execute_SH, ClrXA_LdB_SH})
);

	sync_debounce Din_sync [7:0] (
		.Clk  (Clk), 

		.d    (SW), 
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
