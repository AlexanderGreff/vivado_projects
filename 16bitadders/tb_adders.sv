`timescale 1ns/1ps
`default_nettype none

// === CONFIG FOR LOOKAHEAD ADDER (edit if needed) ============================
// If your lookahead_adder uses parameter .N  (common), leave as-is.
// If it uses .WIDTH instead, uncomment the next line:
// `define LA_PARAM_IS_WIDTH
//
// If your lookahead_adder's sum port is named .s (common), leave as-is.
// If it's named .sum, uncomment the next line:
// `define LA_SUM_PORT_IS_SUM
//
// Set the width you want to test:
`ifndef LA_WIDTH
  `define LA_WIDTH 16
`endif
// ============================================================================

module tb_adders;

  // -------------------
  // Half Adder Signals
  // -------------------
  logic a_ha, b_ha;
  logic s_ha, cout_ha;

  // -------------------
  // Full Adder Signals
  // -------------------
  logic a_fa, b_fa, cin_fa;
  logic s_fa, cout_fa;

  // -----------------------------
  // Lookahead Adder (N-bit) Sigs
  // -----------------------------
  localparam int N = `LA_WIDTH;
  logic [N-1:0] a_la, b_la;
  logic         cin_la;
  logic [N-1:0] sum_la;
  logic         cout_la;

  // -------------------
  // DUT Instantiations
  // -------------------

  // 1) Half Adder
  half_adder u_ha (
    .a   (a_ha),
    .b   (b_ha),
    .s   (s_ha),
    .cout(cout_ha)
  );

  // 2) Full Adder
  full_adder u_fa (
    .a   (a_fa),
    .b   (b_fa),
    .cin (cin_fa),
    .s   (s_fa),
    .cout(cout_fa)
  );

  // 3) Lookahead Adder (parameter & port name adapters)
  // Parameter adapter
  `ifdef LA_PARAM_IS_WIDTH
    lookahead_adder #(.WIDTH(N))
  `else
    lookahead_adder #(.N(N))
  `endif
  u_la (
    .a   (a_la),
    .b   (b_la),
    .cin (cin_la),
  `ifdef LA_SUM_PORT_IS_SUM
    .sum (sum_la),
  `else
    .s   (sum_la),
  `endif
    .cout(cout_la)
  );

  // -------------------
  // Reference helpers
  // -------------------
  function automatic void check_half_adder(input logic a, b,
                                           input logic s, cout);
    logic exp_s, exp_cout;
    exp_s   = a ^ b;
    exp_cout= a & b;
    assert (s == exp_s && cout == exp_cout)
      else $error("[HA] a=%0b b=%0b -> got s=%0b cout=%0b, exp s=%0b cout=%0b",
                  a,b,s,cout,exp_s,exp_cout);
  endfunction

  function automatic void check_full_adder(input logic a, b, cin,
                                           input logic s, cout);
    logic [1:0] exp;
    exp = a + b + cin;
    assert (s == exp[0] && cout == exp[1])
      else $error("[FA] a=%0b b=%0b cin=%0b -> got s=%0b cout=%0b, exp s=%0b cout=%0b",
                  a,b,cin,s,cout,exp[0],exp[1]);
  endfunction

  function automatic void check_lookahead(input int width,
                                          input logic [N-1:0] a, b,
                                          input logic cin,
                                          input logic [N-1:0] sum,
                                          input logic cout);
    logic [N:0] ext_sum;
    ext_sum = {1'b0,a} + {1'b0,b} + cin;
    assert (sum == ext_sum[N-1:0] && cout == ext_sum[N])
      else $error("[LA] N=%0d a=0x%0h b=0x%0h cin=%0b -> got sum=0x%0h cout=%0b, exp sum=0x%0h cout=%0b",
                  width, a, b, cin, sum, cout, ext_sum[N-1:0], ext_sum[N]);
  endfunction

  // ---------------
  // Test Sequences
  // ---------------
  initial begin
    $display("--------------------------------------------------");
    $display(" tb_adders: starting tests (N=%0d) ", N);
    $display("--------------------------------------------------");
    $dumpfile("tb_adders.vcd");
    $dumpvars(0, tb_adders);

    // ---- Half Adder exhaustive (4 cases)
    int ha_pass = 0;
    foreach ({a_ha, b_ha}) begin end // just to quiet tools
    for (int i=0;i<4;i++) begin
      {a_ha, b_ha} = i[1:0];
      #1; // settle
      check_half_adder(a_ha, b_ha, s_ha, cout_ha);
      ha_pass++;
    end
    $display("HA: ran %0d / 4 cases", ha_pass);

    // ---- Full Adder exhaustive (8 cases)
    int fa_pass = 0;
    for (int i=0;i<8;i++) begin
      {a_fa, b_fa, cin_fa} = i[2:0];
      #1;
      check_full_adder(a_fa, b_fa, cin_fa, s_fa, cout_fa);
      fa_pass++;
    end
    $display("FA: ran %0d / 8 cases", fa_pass);

    // ---- Lookahead Adder randomized
    int la_tests = 1000;
    if ($value$plusargs("LA_TESTS=%d", la_tests)) begin
      $display("LA: overriding test count via +LA_TESTS=%0d", la_tests);
    end

    int la_pass = 0;
    for (int t=0; t<la_tests; t++) begin
      a_la   = $urandom();
      b_la   = $urandom();
      cin_la = $urandom_range(0,1);
      #1;
      check_lookahead(N, a_la, b_la, cin_la, sum_la, cout_la);
      la_pass++;
    end
    $display("LA: ran %0d randomized cases (N=%0d)", la_pass, N);

    $display("--------------------------------------------------");
    $display(" tb_adders: all tests completed");
    $display(" (see tb_adders.vcd for waves)");
    $display("--------------------------------------------------");
    $finish;
  end

  // -----------------------
  // Simple immediate checks
  // -----------------------
  // (These also serve as quick sanity assertions during sim.)
  always @* begin
    // Half-adder sanity
    assert (s_ha == (a_ha ^ b_ha))
      else $error("HA S mismatch");
    assert (cout_ha == (a_ha & b_ha))
      else $error("HA Cout mismatch");

    // Full-adder sanity
    assert ({cout_fa, s_fa} == (a_fa + b_fa + cin_fa))
      else $error("FA sum mismatch");
  end

endmodule

`default_nettype wire