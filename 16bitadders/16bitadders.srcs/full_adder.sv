module half_adder (
	input  logic a, 
    input  logic b,
    input  logic c,
	
	output logic  s,
	output logic  cout
);

logic c1, c2;
logic s1;

half_adder ha0
(
    .a(a),
    .b(b),
    .cout(c1),
    .s(s1)
)

half_adder ha1
(
    .a(s1),
    .b(c)
    .cout(c2)
    .s(s)
)

assign cout = c1 | c2;

endmodule

