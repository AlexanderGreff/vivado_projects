`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2025 02:38:41 PM
// Design Name: 
// Module Name: control_8
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


module control_8(
    input  logic Clk, 
	input  logic Reset_LoadB_ClearA,
	input  logic Run,

    output logic Add,
    output logic Sub,
	output logic Shift_En, 
	output logic ClrXA_Ld_B
    );
    
    logic op_type;
    logic counter;
    
// Declare signals curr_state, next_state of type enum
// with enum values of s_start, s_count0, ..., s_done as the state values
// Note that the length implies a max of 8 states, so you will need to bump this up for 8-bits
	enum logic [3:0] {
		s_start, 
		s_count0, 
		s_count1, 
		s_count2, 
		s_count3, 
		s_count4,
		s_count5,
		s_count6,
		s_count7,
		s_done
	} curr_state, next_state; 

	always_comb
	begin
	// Assign outputs based on 'state'
		unique case (curr_state) 
			s_start: 
			begin
			    ClrXA_Ld_B = Reset_LoadB_ClearA;
				Shift_En = 1'b0;
			end

			s_done: 
			begin
				Shift_En = 1'b0;
			end

			default:  //default case, can also have default assignments for Ld_A and Ld_B before case
			begin 
			  ClrXA_Ld_B  = 1'b0;
			end
		endcase
	end

// Assign outputs based on state
	always_comb
	begin

		next_state  = curr_state;	//required because I haven't enumerated all possibilities below. Synthesis would infer latch without this
		unique case (curr_state) 

			s_start :    
			begin
				if (Run) 
				begin
					next_state = s_count0;
				end
			end

			s_count0 :    next_state = s_count1;
			s_count1 :    next_state = s_count2;
			s_count2 :    next_state = s_count3;
			s_count3 :    next_state = s_count4;
			s_count4 :    next_state = s_count5;
			s_count5 :    next_state = s_count6;
			s_count6 :    next_state = s_count7;
			s_count7 :    next_state = s_done;

			s_done :    
			begin
				if (~Run) 
				begin
					next_state = s_start;
				end
			end
					
		endcase
	end



	//updates flip flop, current state is the only one
	always_ff @(posedge Clk)  
	begin
		if (Reset_LoadB_ClearA)
		begin
			curr_state <= s_start;
		end
		else 
		begin
			curr_state <= next_state;
		end
	end

endmodule
