module select_adder (
	input  logic  [15:0] a, 
    input  logic  [15:0] b,
	input  logic         cin,
	
	output logic  [15:0] s,
	output logic         cout
);

logic [7:0] c;
logic [3:0] c_blk;
assign c[0] = cin;
logic [27:0] s_init; 

fa_4bit fa4_0
    (
        .a(a[3:0]), 
        .b(b[3:0]),
        .cin(c[0]),
        
        .s(s_init[3:0]),
        .cout(c[1])
    );
    

fa_4bit fa4_1
    (
        .a(a[7:4]), 
        .b(b[7:4]),
        .cin(1'b0),
        
        .s(s_init[7:4]),
        .cout(c[2])

    );
    
fa_4bit fa4_2
    (
        .a(a[7:4]), 
        .b(b[7:4]),
        .cin(1'b1),
        
        .s(s_init[11:8]),
        .cout(c[3])

    );


fa_4bit fa4_3
    (
        .a(a[11:8]), 
        .b(b[11:8]),
        .cin(1'b0),
        
        .s(s_init[15:12]),
        .cout(c[4])

    );
fa_4bit fa4_4
    (
        .a(a[11:8]), 
        .b(b[11:8]),
        .cin(1'b1),
        
        .s(s_init[19:16]),
        .cout(c[5])

    );


fa_4bit fa4_5
    (
        .a(a[15:12]), 
        .b(b[15:12]),
        .cin(1'b0),
        
        .s(s_init[23:20]),
        .cout(c[6])
    );
    
fa_4bit fa4_6
    (
        .a(a[15:12]), 
        .b(b[15:12]),
        .cin(1'b1),
        
        .s(s_init[27:24]),
        .cout(c[7])
    );
    
always_comb
begin

    c_blk[0] = c[1];   
    c_blk[1] = (c_blk[0] & c[3]) | c[2];
    c_blk[2] = (c_blk[1] & c[5]) | c[4];
    c_blk[3] = (c_blk[2] & c[7]) | c[6];
    cout = c_blk[3];
    s[3:0] = s_init[3:0];
  
    if (c_blk[0] == 0)
    begin
        s[7:4] = s_init[7:4];
    end
    else
    begin 
       s[7:4] = s_init[11:8]; 
    end
    
    if (c_blk[1] == 0)
    begin
        s[11:8] = s_init[15:12];
    end
    else
    begin 
       s[11:8] = s_init[19:16]; 
    end

    if (c_blk[2] == 0)
    begin
        s[15:12] = s_init[23:20];
    end
    else
    begin 
       s[15:12] = s_init[27:24]; 
    end
end 

endmodule
