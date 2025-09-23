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
    input  logic B_out,

    output logic Add,
    output logic Sub,
	output logic Shift_En, 
	output logic ClrXA_Ld_B
    );
    
    logic counter;
    
// Declare signals curr_state, next_state of type enum
// with enum values of s_start, s_count0, ..., s_done as the state values
// Note that the length implies a max of 8 states, so you will need to bump this up for 8-bits
	enum logic [3:0] {
		s_start, 
		s_shift,
		s_shift_add,
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
					if (B_out == 1'b1)
					begin
					   next_state = s_shift_add;
					end
					
                    else 
                    begin
                       next_state = s_shift;
                    end
                 end
			end
			
			 s_shift :
			 begin
			     Shift_En = 1'b1;
			     counter = counter + 1;
			     if (counter != 7)
			     begin
                     if (B_out == 1'b1)
                     begin
                         next_state = s_shift_add;
                     end
                     
                     else
                     begin
                         next_state = s_shift;
                     end    
                 end
                 
                 else
                 begin
                    next_state = s_done;
                 end
			 end
			
			 s_shift_add :
			 begin
			     Add = 1'b1;
			     Shift_En = 1'b1;
			     counter = counter + 1;
			     if (counter != 7)
			     begin
                     if (B_out == 1'b1)
                     begin
                         next_state = s_shift_add;
                     end
                     
                     else
                     begin
                         next_state = s_shift;
                     end    
                 end
                 
                 else
                 begin
                    next_state = s_done;
                 end
			 end
			 
			s_done:
			begin
			     if (B_out == 1)
			     begin
			         Sub = 1'b1;
			         Shift_En = 1'b1;
			         next_state = s_start;
			     end
			     
			     else
			     begin
			         Shift_En = 1'b1;
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
