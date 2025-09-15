module ripple_adder
(
	input  logic  [15:0] a, 
    input  logic  [15:0] b,
	input  logic         cin,
	
	output logic  [15:0] s,
	output logic         cout
);

logic [16 : 0] c;
assign c[0] = cin;
assign cout = c[16];

generate
	genvar i;
	for (i = 0; i < 16; i = i + 1)
	begin: stage
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

endmodule

