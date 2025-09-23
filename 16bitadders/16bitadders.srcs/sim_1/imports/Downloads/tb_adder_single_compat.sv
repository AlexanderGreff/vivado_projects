
`timescale 1ns/1ps
`default_nettype none

// -----------------------------------------------------------------------------
// tb_adder_single_compat.sv
// Single-DUT, self-checking testbench for an N-bit adder (RCA/CLA/CSA).
// Focus: maximum tool compatibility (no 'int'/'string' types, no covergroups/SVA).
// Select ONE DUT at compile time: +define+SELECT_RCA or +define+SELECT_CLA or +define+SELECT_CSA
// Defaults to SELECT_RCA if none provided.
// Assumed DUT ports: (a[N-1:0], b[N-1:0], cin) -> (s[N-1:0], cout).
// Random uses $random to maximize compatibility.
// -----------------------------------------------------------------------------

module tb_adder_single_compat;

  // -------------------
  // Parameters
  // -------------------
  // Override width by recompiling with: +define+WIDTH=<N>
`ifdef WIDTH
  parameter integer N = `WIDTH;
`else
  parameter integer N = 16;
`endif

  // -------------------
  // DUT I/O
  // -------------------
  reg  [N-1:0] a, b;
  reg          cin;
  wire [N-1:0] s;
  wire         cout;

  // -------------------
  // DUT Selection (exactly one)
  // -------------------
`ifndef SELECT_RCA
`ifndef SELECT_CLA
`ifndef SELECT_CSA
  // Default to ripple-carry if none specified
  `define SELECT_RCA
`endif
`endif
`endif

`ifdef SELECT_RCA
  `define DUT_KIND "RCA"
  ripple_adder u_dut (
    .a(a), .b(b), .cin(cin), .s(s), .cout(cout)
  );
`elsif SELECT_CLA
  `define DUT_KIND "CLA"
  lookahead_adder u_dut (
    .a(a), .b(b), .cin(cin), .s(s), .cout(cout)
  );
`elsif SELECT_CSA
  `define DUT_KIND "CSA"
  // Rename below if your CSA has a different module name/ports.
  carry_select_adder u_dut (
    .a(a), .b(b), .cin(cin), .s(s), .cout(cout)
  );
`else
  initial begin
    $display("ERROR: No adder selected. Define one of SELECT_RCA/SELECT_CLA/SELECT_CSA.");
    $finish;
  end
`endif

  // -------------------
  // Reference Model
  // -------------------
  reg [N:0] ref_sum;
  always @* begin
    ref_sum = a + b + cin;
  end

  // -------------------
  // Counters / results
  // -------------------
  integer tests;
  integer errors;

  // -------------------
  // Check Task (no 'automatic' to keep max compatibility)
  // -------------------
  task check;
    input [N-1:0] ai, bi;
    input         cini;
    reg   [N-1:0] s_local;
    reg           cout_local;
    reg   [N:0]   ref_local;
  begin
    a   = ai;
    b   = bi;
    cin = cini;
    #0; // settle delta

    s_local    = s;
    cout_local = cout;
    ref_local  = ai + bi + cini;

    tests = tests + 1;

    if ( {cout_local, s_local} !== ref_local ) begin
      errors = errors + 1;
      $display("[%0t] [%s] MISMATCH  a=%h b=%h cin=%0d  got={cout=%0d,sum=%h}  exp=%h",
               $time, `DUT_KIND, ai, bi, cini, cout_local, s_local, ref_local);
    end
  end
  endtask

  // -------------------
  // Directed Patterns
  // -------------------
  task run_directed;
    integer i;
  begin
    // Reset counters locally if desired
    // Basic
    check({N{1'b0}}, {N{1'b0}}, 1'b0);
    check({N{1'b0}}, {N{1'b0}}, 1'b1);

    // Identity
    check({N{1'b0}}, {N{1'b1}}, 1'b0);
    check({N{1'b1}}, {N{1'b0}}, 1'b0);

    // Overflow / boundary
    check({N{1'b1}}, {N{1'b0}}, 1'b1);
    check({N{1'b1}}, {{(N-1){1'b0}},1'b1}, 1'b0);

    // Alternating
    if ((N % 2) == 0) begin
      check({N/2{2'b01}}, {N/2{2'b01}}, 1'b0);
      check({N/2{2'b10}}, {N/2{2'b10}}, 1'b1);
      check({N/2{2'b01}}, {N/2{2'b10}}, 1'b0);
      check({N/2{2'b10}}, {N/2{2'b01}}, 1'b1);
    end

    // One-hot sweeps
    for (i = 0; i < N; i = i + 1) begin
      check({{(N-1){1'b0}},1'b1} << i, {N{1'b0}}, 1'b0);
      check({N{1'b0}}, {{(N-1){1'b0}},1'b1} << i, 1'b1);
    end

    // Edge mixes
    check({N{1'b1}}, {N{1'b1}}, 1'b1);
    check({N{1'b0}}, {N{1'b1}}, 1'b1);
    check({N{1'b1}}, {N{1'b0}}, 1'b0);
  end
  endtask

  // -------------------
  // Randomized Tests (uses $random for broad tool support)
  // -------------------
  task run_random;
    input integer iter;
    input integer seed_in;
    integer k;
    integer seed;
    reg [N-1:0] ra, rb;
    reg rc;
  begin
    seed = seed_in;
    for (k = 0; k < iter; k = k + 1) begin
      ra = $random(seed);
      rb = $random(seed);
      rc = $random(seed) & 1'b1;
      check(ra, rb, rc);
    end
  end
  endtask

  // -------------------
  // Test Sequence
  // -------------------
  initial begin
    a = {N{1'bx}}; b = {N{1'bx}}; cin = 1'bx;
    tests = 0; errors = 0;

    // Plusargs
    integer iter, seed;
    if (!$value$plusargs("ITER=%d", iter)) iter = 2000;
    if (!$value$plusargs("SEED=%d", seed)) seed = 32'h00C0FFEE;

    $display("[tb_adder_single_compat] N=%0d  ITER=%0d  DUT=%s",
             N, iter, `DUT_KIND);

    run_directed();
    run_random(iter, seed);

    $display("[tb_adder_single_compat] Done. Tests=%0d  Errors=%0d", tests, errors);
    if (errors == 0) begin
      $display("RESULT: PASS");
    end else begin
      $display("RESULT: FAIL");
    end
    $finish;
  end

endmodule

`default_nettype wire
