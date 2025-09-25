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
	output logic ClrXA_Ld_B,
	output logic Clr_XA
    );
    
    logic [2:0] curr_counter;
    logic [2:0] next_counter;
    
    
// Declare signals curr_state, next_state of type enum
// with enum values of s_start, s_count0, ..., s_done as the state values
// Note that the length implies a max of 8 states, so you will need to bump this up for 8-bits
	enum logic [3:0] {
		s_start, 
		s_shift,
		s_op,
		s_done
	} curr_state, next_state; 

    always_ff @(posedge Clk) 
    begin
      if (Reset_LoadB_ClearA) 
      begin
        curr_state   <= s_start;
        curr_counter <= 3'd0;
      end
      
      else 
      begin
        curr_state   <= next_state;
        curr_counter <= next_counter;   
      end
    end
    
    always_comb begin
      Add=0;
       Sub=0;
       Shift_En=0;
      ClrXA_Ld_B = Reset_LoadB_ClearA;   
      Clr_XA = 1'b0;
      next_state   = curr_state;          
      next_counter = curr_counter;
    
      unique case (curr_state)
      s_start: 
      begin
          if (Run) 
          begin
          
            next_counter = 3'd0;
            next_state   = s_op;
            Clr_XA = 1'b1;
          end
        end
    
        s_op: 
        begin
          if (curr_counter == 3'd7)
          begin
                Sub = B_out;
          end
           else
           begin
                Add = B_out;
           end
          next_state = s_shift;
        end
    
        s_shift:
        begin
          Shift_En     = 1'b1;
          next_counter = curr_counter + 3'd1;
          next_state   = (curr_counter == 3'd7) ? s_done : s_op;
        end
    
        s_done: 
        begin
          if (!Run) 
          begin
            next_counter = 3'd0;
            next_state   = s_start;  
          end
        end
      endcase
    end
    endmodule
