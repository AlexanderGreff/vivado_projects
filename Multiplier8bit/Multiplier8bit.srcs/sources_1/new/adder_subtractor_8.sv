`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2025 01:36:05 PM
// Design Name: 
// Module Name: adder_subtractor_8
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


module adder_subtractor_8
    (
        input logic [7:0] S, A,
        input logic Sub,
        input logic X_in,
        
        output logic [8:0] sum
    );
    
logic a8, s8;
logic [9 : 0] c;

assign a8 = A[7];
assign s8 = S[7] ^ Sub;
assign c[0] = Sub;


generate
	genvar i;
	for (i = 0; i < 8; i = i + 1)
	begin: stage
		full_adder FA
		(
			.a(A[i]),
			.b(S[i] ^ Sub),
			.cin(c[i]),
			.s(sum[i]),
			.cout(c[i+1])
		);
	end
endgenerate

	full_adder FA9
		(
			.a(X_in),
			.b(s8),
			.cin(c[8]),
			.s(sum[8]),
			.cout(c[9])
		);

endmodule
    
   
