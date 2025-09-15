`timescale 1ns/1ps
module cla_unit_tb;

  localparam int N = 16;

  // DUT I/O
  logic [N-1:0] p, g;
  logic         cin;
  wire  [N:1]   c;
  wire          cout, PG, GG;

  cla_unit #(.N(N)) dut (
    .p(p), .g(g), .cin(cin),
    .c(c), .cout(cout), .PG(PG), .GG(GG)
  );

  // Reference model (combinational)
  function automatic logic [N:1] ref_carries(
      input logic [N-1:0] p_i,
      input logic [N-1:0] g_i,
      input logic         ci);
    logic [N:1] c_ref;
    logic       carry;
    carry = ci;
    for (int k = 0; k < N; k++) begin
      // C_{k+1} = g[k] | (p[k] & C_k)
      carry     = g_i[k] | (p_i[k] & carry);
      c_ref[k+1]= carry;
    end
    return c_ref;
  endfunction

  function automatic logic ref_PG(input logic [N-1:0] p_i);
    logic acc = 1'b1;
    for (int k = 0; k < N; k++) acc &= p_i[k];
    return acc; // P_group = p[N-1]&...&p[0]
  endfunction

  function automatic logic ref_GG(
      input logic [N-1:0] p_i,
      input logic [N-1:0] g_i);
    // G_group = g[N-1] | p[N-1]g[N-2] | p[N-1]p[N-2]g[N-3] | ... | p[N-1]...p[1]g[0]
    logic acc = 1'b0;
    logic prefixP = 1'b1;
    for (int k = N-1; k >= 0; k--) begin
      acc     |= prefixP & g_i[k];
      prefixP &= p_i[k];
    end
    return acc;
  endfunction

  // Bookkeeping
  int tests=0, errors=0;

  task automatic drive_and_check(input logic [N-1:0] p_i,
                                 input logic [N-1:0] g_i,
                                 input logic         ci);
    logic [N:1] c_ref;
    logic       PG_ref, GG_ref;
    begin
      p = p_i; g = g_i; cin = ci;
      #1; // settle
      c_ref  = ref_carries(p_i, g_i, ci);
      PG_ref = ref_PG(p_i);
      GG_ref = ref_GG(p_i, g_i);

      tests++;
      if (c       !== c_ref ||
          cout    !== c_ref[N] ||
          PG      !== PG_ref ||
          GG      !== GG_ref) begin
        $error("CLA mismatch\np=%h g=%h cin=%0d\nDUT:  c=%h cout=%0d PG=%0d GG=%0d\nREF:  c=%h cout=%0d PG=%0d GG=%0d",
               p_i, g_i, ci, c,    cout,    PG,    GG,
               c_ref, c_ref[N], PG_ref, GG_ref);
        errors++;
      end
    end
  endtask

  initial begin
    // Directed
    drive_and_check('0, '0, 1'b0);
    drive_and_check('0, '0, 1'b1);
    drive_and_check({N{1'b1}}, '0, 1'b0);
    drive_and_check({N{1'b1}}, '0, 1'b1);

    // Randomized (p = a^b, g = a&b) to mimic FA outputs from the figure
    for (int i=0; i<1000; i++) begin
      logic [N-1:0] a = $urandom;
      logic [N-1:0] b = $urandom;
      logic         ci= $urandom_range(0,1);
      drive_and_check(a ^ b, a & b, ci);
    end

    $display("CLA unit tests run=%0d, errors=%0d", tests, errors);
    $finish;
  end

endmodule
