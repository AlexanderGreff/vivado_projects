`timescale 1ns/1ps

module tb_processor_bindtop;

  // DUT I/O
  logic clk = 0, reset = 0, run = 0, cont = 0;
  logic [15:0] sw = 16'h0000;
  logic [15:0] led;
  logic [7:0]  hex_seg_left, hex_seg_right;
  logic [3:0]  hex_grid_left, hex_grid_right;

  // Device under test (your full top)
  processor_top dut (
    .clk(clk), .reset(reset),
    .run_i(run), .continue_i(cont), .sw_i(sw),
    .led_o(led),
    .hex_seg_left(hex_seg_left), .hex_grid_left(hex_grid_left),
    .hex_seg_right(hex_seg_right), .hex_grid_right(hex_grid_right)
  );

  // 100 MHz clock
  always #5 clk = ~clk;

  // --- Dump waveform (open fetch.vcd in GTKWave) ---
  initial begin
    $dumpfile("fetch.vcd");
    // Dump CPU core + control so PC/MAR/MDR/IR and state are visible
    $dumpvars(0, tb_processor_bindtop.dut.slc3.cpu);
    $dumpvars(0, tb_processor_bindtop.dut.slc3.cpu.cpu_control);
  end

  // Debounce-friendly pulses (COUNTER_WIDTH=1 in sim => hold several cycles)
  task do_reset;              begin reset = 1; repeat(8) @(posedge clk); reset = 0; repeat(6) @(posedge clk); end endtask
  task press_release_run;     begin run   = 1; repeat(6) @(posedge clk); run   = 0; repeat(6) @(posedge clk); end endtask
  task press_release_continue;begin cont  = 1; repeat(6) @(posedge clk); cont  = 0; repeat(10)@(posedge clk); end endtask

  // Sequence: reset -> run -> continue x2 (enough to show the pattern)
  initial begin
    do_reset();
    press_release_run();         // leave halted, start fetch
    press_release_continue();    // fetch #0  (MAR <= PC, MDR read, IR <= MDR, PC++)
    press_release_continue();    // fetch #1
    // add more continues if you want more steps in the wave
    repeat(20) @(posedge clk);   // idle so the wave settles
    $stop;
  end

endmodule