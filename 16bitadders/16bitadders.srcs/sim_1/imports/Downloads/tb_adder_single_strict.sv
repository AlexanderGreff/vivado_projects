
`timescale 1ns/1ps
`default_nettype none

// -----------------------------------------------------------------------------
// tb_adder_single_strict.sv
// Rigorous, self-checking testbench for a *single* N-bit adder DUT.
// Choose exactly ONE at compile time with +define+SELECT_RCA or +define+SELECT_CLA or +define+SELECT_CSA
// Defaults to SELECT_RCA if none provided.
// Assumes DUT ports: (a[N-1:0], b[N-1:0], cin) -> (s[N-1:0], cout).
//   - Compares DUT to a synthesizable reference (a + b + cin)
//   - Directed edge cases + randomized tests
//   - Functional coverage and assertions
// Usage (examples):
//   - iverilog/questa: +define+SELECT_RCA
//   - vivado xsim:     -d SELECT_CLA
//   - iterations:      +ITER=10000  seed: +SEED=123
// -----------------------------------------------------------------------------

module tb_adder_single_strict;

  timeunit 1ns;
  timeprecision 1ps;

  // -------------------
  // Parameters
  // -------------------
  parameter int N = 16;

  // -------------------
  // DUT I/O
  // -------------------
  logic [N-1:0] a, b;
  logic         cin;
  wire  [N-1:0] s;
  wire          cout;

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

  // Map selection to module instantiation.
  // Adjust module names here to match your source files.
`ifdef SELECT_RCA
  localparam string DUT_KIND = "RCA";
  ripple_adder #(/*AUTOPARAM if needed*/) u_dut (
    .a(a), .b(b), .cin(cin), .s(s), .cout(cout)
  );
`elsif SELECT_CLA
  localparam string DUT_KIND = "CLA";
  lookahead_adder #(/*AUTOPARAM if needed*/) u_dut (
    .a(a), .b(b), .cin(cin), .s(s), .cout(cout)
  );
`elsif SELECT_CSA
  localparam string DUT_KIND = "CSA";
  // If your carry-select module has a different name/ports, edit below.
  carry_select_adder #(/*AUTOPARAM if needed*/) u_dut (
    .a(a), .b(b), .cin(cin), .s(s), .cout(cout)
  );
`else
  initial $fatal(1, "No adder selected. Define one of SELECT_RCA/SELECT_CLA/SELECT_CSA.");
`endif

  // -------------------
  // Reference Model
  // -------------------
  logic [N:0] ref_sum;
  always_comb ref_sum = a + b + cin;

  // -------------------
  // Check Task
  // -------------------
  event sample_ev;

  task automatic check(input logic [N-1:0] ai, bi, input logic cini);
    logic [N:0] ref_local;
    logic [N-1:0] s_local;
    logic cout_local;

    a   = ai;
    b   = bi;
    cin = cini;
    #0; // settle

    s_local    = s;
    cout_local = cout;
    ref_local  = ai + bi + cini;

    // Correctness check vs reference
    assert ({cout_local, s_local} == ref_local)
      else $error("[%s] Mismatch: a=%h b=%h cin=%0d  got={cout=%0d,sum=%h}  exp=%h",
                  DUT_KIND, ai, bi, cini, cout_local, s_local, ref_local);

    -> sample_ev; // coverage
  endtask

  // -------------------
  // Functional Coverage
  // -------------------
  covergroup cg_adder @(sample_ev);
    coverpoint cin { bins c0 = {0}; bins c1 = {1}; }
    coverpoint cout { bins no_carry = {0}; bins carry_out = {1}; }

    coverpoint s {
      bins zero     = { '0 };
      bins all_ones = { {N{1'b1}} };
      bins alt01    = { {N/2{2'b01}} } iff (N%2==0);
      bins alt10    = { {N/2{2'b10}} } iff (N%2==0);
    }

    coverpoint a {
      bins a_zero     = { '0 };
      bins a_allones  = { {N{1'b1}} };
      // one-hot bins (tool may limit auto-bin count for large N; that's okay)
      bins a_onehot[] = { [1: (1<<N)-1] } with ( $onehot(item) );
      bins a_alt01    = { {N/2{2'b01}} } iff (N%2==0);
      bins a_alt10    = { {N/2{2'b10}} } iff (N%2==0);
    }

    coverpoint b {
      bins b_zero     = { '0 };
      bins b_allones  = { {N{1'b1}} };
      bins b_onehot[] = { [1: (1<<N)-1] } with ( $onehot(item) );
      bins b_alt01    = { {N/2{2'b01}} } iff (N%2==0);
      bins b_alt10    = { {N/2{2'b10}} } iff (N%2==0);
    }

    // Focused cross to avoid explosion
    cross cin, cout;
  endgroup

  cg_adder cov = new();

  // -------------------
  // Directed Patterns
  // -------------------
  task automatic run_directed();
    // Basic
    check('0, '0, 0);
    check('0, '0, 1);

    // Identity
    check('0, '1, 0);
    check('1, '0, 0);

    // Overflow / boundary
    check({N{1'b1}}, '0, 1);
    check({N{1'b1}}, 1, 0);

    // Alternating
    if (N % 2 == 0) begin
      check({N/2{2'b01}}, {N/2{2'b01}}, 0);
      check({N/2{2'b10}}, {N/2{2'b10}}, 1);
      check({N/2{2'b01}}, {N/2{2'b10}}, 0);
      check({N/2{2'b10}}, {N/2{2'b01}}, 1);
    end

    // One-hot sweeps
    for (int i = 0; i < N; i++) begin
      check(1 << i, '0, 0);
      check('0, 1 << i, 1);
      check(1 << i, 1 << ((i+1)%N), i[0]);
    end

    // Random-ish edges
    check({N{1'b1}}, {N{1'b1}}, 1);
    check({N{1'b0}}, {N{1'b1}}, 1);
    check({N{1'b1}}, {N{1'b0}}, 0);
  endtask

  // -------------------
  // Randomized Tests
  // -------------------
  task automatic run_random(input int iter);
    int seed;
    if (!$value$plusargs("SEED=%d", seed)) seed = 32'hC0FFEE;
    void'($urandom(seed));
    for (int k = 0; k < iter; k++) begin
      logic [N-1:0] ra = $urandom();
      logic [N-1:0] rb = $urandom();
      logic rc = $urandom_range(0,1);
      check(ra, rb, rc);
    end
  endtask

  // -------------------
  // Concurrent Assertion (sanity: combinational adder should equal ref in same delta)
  // -------------------
  property p_matches_ref;
    ##0 ({cout, s} == (a + b + cin));
  endproperty
  assert property (p_matches_ref);

  // -------------------
  // Test Sequence
  // -------------------
  initial begin
    a = 'x; b = 'x; cin = 'x;

    int iter = 2000;
    void'($value$plusargs("ITER=%d", iter));

    $display("[tb_adder_single_strict] N=%0d  ITER=%0d  DUT=%s",
             N, iter, DUT_KIND);

    run_directed();
    run_random(iter);

    $display("[tb_adder_single_strict] Completed.");
    $finish;
  end

endmodule

`default_nettype wire
