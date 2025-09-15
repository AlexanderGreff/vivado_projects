module lookahead_adder (
  input  logic  [15:0] a,
  input  logic  [15:0] b,
  input  logic         cin,
  output logic  [15:0] s,
  output logic         cout
);
  // 4-bit CLA block
  function automatic logic [4:0] cla4_carries(
    input logic [3:0] p, input logic [3:0] g, input logic c0
  );
    logic [4:0] c;
    c[0] = c0;
    c[1] = g[0] | (p[0] & c[0]);
    c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c[0]);
    c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c[0]);
    c[4] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0])
                 | (p[3] & p[2] & p[1] & p[0] & c[0]);
    return c;
  endfunction

  logic [15:0] p = a ^ b;
  logic [15:0] g = a & b;

  logic [3:0] Pblk, Gblk;
  for (genvar k=0; k<4; k++) begin : gp
    localparam int L = 4*k;
    assign Pblk[k] = &p[L+3:L];
    assign Gblk[k] = g[L+3] |
                     (p[L+3] & g[L+2]) |
                     (p[L+3] & p[L+2] & g[L+1]) |
                     (p[L+3] & p[L+2] & p[L+1] & g[L+0]);
  end

  logic [4:0] C;
  assign C[0] = cin;
  assign C[1] = Gblk[0] | (Pblk[0] & C[0]);
  assign C[2] = Gblk[1] | (Pblk[1] & C[1]);
  assign C[3] = Gblk[2] | (Pblk[2] & C[2]);
  assign C[4] = Gblk[3] | (Pblk[3] & C[3]);
  assign cout = C[4];

  for (genvar bidx=0; bidx<4; bidx++) begin : blocks
    localparam int L = 4*bidx;
    logic [4:0] c_local = cla4_carries(p[L+3:L], g[L+3:L], C[bidx]);
    assign s[L+3:L] = p[L+3:L] ^ c_local[3:0];
  end
endmodule