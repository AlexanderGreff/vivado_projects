`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2025 06:02:23 PM
// Design Name: 
// Module Name: fa_4bit
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


module fa_4bit
    (
        input  logic [3:0] a, 
        input  logic [3:0] b,
        input  logic cin,
        
        output logic  [3:0] s,
        output logic  cout
    );
    
  
  logic [3:0] c;
  assign c[0] = cin;
  
generate   
    genvar i;
    for (i = 0; i < 4; i = i + 1)
    begin
        full_adder FA
        (
    		.a(a[i]),
			.b(b[i]),
			.cin(c[i]),
			.s(s[i]),
			.cout(c[i+1])
		 );
    end
endgenerate
   
    assign cout = c[3];
    
    
endmodule
