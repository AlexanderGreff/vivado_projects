







module lookahead_adder (
	input  logic  [15:0] a, 
    input  logic  [15:0] b,
	input  logic         cin,
	
	output logic  [15:0] s,
	output logic         cout
);

logic [4 : 0] c;
logic [3:0] plog;
logic [3:0] glog;


assign c[0] = cin;


cla_4bit cla_4_0
(
	.a_in(a[3:0]),
	.b_in(b[3:0]),
	.cin(c[0]),
	.pbit(plog[0]),
	.gbit(glog[0]),
	.s_out(s[3:0])   
);

assign c[1] = glog[0] | ((c[0]) & plog[0]);

cla_4bit cla_4_1
(
	.a_in(a[7:4]),
	.b_in(b[7:4]),
	.cin(c[1]),
	.pbit(plog[1]),
	.gbit(glog[1]),
	.s_out(s[7:4])       
);
assign c[2] = glog[1] | (glog[0] & plog[1]) | (c[0] & plog[0] & plog[1]);

cla_4bit cla_4_2
(
	.a_in(a[11:8]),
	.b_in(b[11:8]),
	.cin(c[2]),
	.pbit(plog[2]),
	.gbit(glog[2]),
	.s_out(s[11:8])       
      
);
assign c[3] = glog[2] | (glog[1] & plog[2]) | (glog[0] & plog[2] & plog[1]) | (c[0] & plog[2] & plog[1] & plog[0]);

cla_4bit cla_4_3
(
	.a_in(a[15:12]),
	.b_in(b[15:12]),
	.cin(c[3]),
	.pbit(plog[3]),
	.gbit(glog[3]),
	.s_out(s[15:12])       
);

assign c[4] = glog[3] | (glog[2] & plog[3]) | (glog[1]  & plog[2] & plog[3]) 
|(glog[0] & plog[3] & plog[2] & plog[1])| (c[0] & plog[3] & plog[2] & plog[1] & plog[0]);

assign cout = c[4];	

endmodule
