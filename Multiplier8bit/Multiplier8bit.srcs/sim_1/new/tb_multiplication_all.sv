`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2025 08:31:01 PM
// Design Name: 
// Module Name: tb_multiplication_all
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
`timescale 1ns/1ps

module tb_multiplication_all;

    logic [7:0] SW = 7'b0;
    logic Clk = 0;
    logic Reset_Load_Logic = 0;
    logic Run = 0;
    logic [3:0] hex_grid; 
    logic [7:0] hex_seg;
    logic [7:0] Aval;
    logic [7:0] Bval;
    logic Xval;
    
    Multiplier mult
    (
        //inputs
        .SW(SW),
        .Clk(Clk),
        .Reset_Load_Logic(Reset_Load_Logic),
        .Run(Run),
        //outputs
        .hex_grid(hex_grid),
        .hex_seg(hex_seg),
        .Aval(Aval),
        .Bval(Bval),
        .Xval(Xval)
 
    );
    
always #5 Clk = ~Clk;

  task automatic pulse_rll();
    begin
      Reset_Load_Logic = 1'b1;
      repeat (5) @(posedge Clk); // allow stable read with debouncer
      Reset_Load_Logic = 1'b0;
      repeat (3) @(posedge Clk);
    end
  endtask

  task automatic pulse_run();
    begin
      Run = 1'b1;
      repeat (5) @(posedge Clk);
      Run = 1'b0;
      repeat (3) @(posedge Clk);
    end
  endtask

  // Present B on SW, then press "Reset_Load_Logic" (ClrXA_LdB_SH) to clear X/A and load B.
  task automatic load_B(input logic signed [7:0] b);
    begin
      SW = b;
      repeat (3) @(posedge Clk); // let Din_sync sample a stable value
      pulse_rll();
    end
  endtask

  // Present S on SW, then press "Run" (Run_SH) to load S and start FSM.
  task automatic start_with_S(input logic signed [7:0] s);
    begin
      SW = s;
      repeat (3) @(posedge Clk);
      pulse_run();
    end
  endtask

  // Quick X-check
  `define NOTX(sig) if (^sig === 1'bX) $fatal(1, "Signal %s is X at %0t", `"sig`", $time)

  // Single test: load B, start with S, wait, then compare product
  task automatic do_test(input  logic signed [7:0] s,
                         input  logic signed [7:0] b,
                         input  string            label);
    logic signed [15:0] expected;
    logic signed [15:0] observed;
    begin
      expected = s * b;

      load_B(b);
      `NOTX(Aval); `NOTX(Bval); `NOTX(Xval); // after ClrXA_LdB we expect known values

      start_with_S(s);

      // Allow operation to complete: 8 add/shift ops + control overhead.
      // Bump this up if your FSM takes longer.
      repeat (24) @(posedge Clk);

      observed = $signed({Aval, Bval});

      if (observed !== expected) begin
        $error("[%s] MISMATCH: s=%0d b=%0d -> got %0d (0x%0h) exp %0d (0x%0h)",
               label, s, b, observed, observed, expected, expected);
        $fatal(1, "[%s] FAILED", label);
      end else begin
        $display("[%s] PASS: %0d * %0d = %0d (0x%0h) ; X=0x%0h A=0x%0h B=0x%0h",
                 label, s, b, observed, observed, Xval, Aval, Bval);
      end

      repeat (6) @(posedge Clk); // gap between tests
    end
  endtask

  // ---------------- Stimulus ----------------
  initial begin
    $dumpfile("tb_multiplication_all.vcd");
    $dumpvars(0, tb_multiplication_all);

    Reset_Load_Logic = 1'b0;
    Run              = 1'b0;
    SW               = 8'h00;

    // settle
    repeat (8) @(posedge Clk);

    // Four required cases to validate signed handling
    do_test(  8'sd7 ,  8'sd59 , "7 * 59");
    do_test( -8'sd7 ,  8'sd59 , "-7 * 59");
    do_test(  8'sd7 , -8'sd59 , "7 * -59");
    do_test( -8'sd7 , -8'sd59 , "-7 * -59");

    $display("All tests passed ✅");
    $finish;
  end

endmodule
