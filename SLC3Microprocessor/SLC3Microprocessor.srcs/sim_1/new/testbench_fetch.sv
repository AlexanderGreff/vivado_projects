`timescale 1ns/1ps

module testbench_fetch;

  // Clock & reset
  logic clk;
  logic reset;
  logic run;
  logic cont;
  logic [15:0] sw;

  // Outputs
  logic [15:0] led;
  logic [7:0]  hex_seg_left, hex_seg_right;
  logic [3:0]  hex_grid_left, hex_grid_right;

  // DUT
  processor_top dut (
    .clk            (clk),
    .reset          (reset),
    .run_i          (run),
    .continue_i     (cont),
    .sw_i           (sw),
    .led_o          (led),
    .hex_seg_left   (hex_seg_left),
    .hex_grid_left  (hex_grid_left),
    .hex_seg_right  (hex_seg_right),
    .hex_grid_right (hex_grid_right)
  );

  // 100 MHz clock
  always #5 clk = ~clk;

  // Program we expect at addresses 0..2
  localparam logic [15:0] PROGRAM [0:2] = '{16'h1111, 16'h2222, 16'h3333};

  // === Grab internals (adjust hierarchy if yours differs) ===
  wire [15:0] pc        = dut.slc3.cpu.pc;
  wire [15:0] ir        = dut.slc3.cpu.ir;
  wire [15:0] mar       = dut.slc3.cpu.mar;

  // MDR input and output
// Probe the actual MDR input (into the load_reg instance)
wire [15:0] mdr_data_i = dut.slc3.cpu.mdr_reg.data_i;
wire [15:0] mdr_q      = dut.slc3.cpu.mdr;  // MDR output


// Show only when a READ occurs, after signals settle
always @(posedge clk) if (dut.slc3.cpu.mem_mem_ena && !dut.slc3.cpu.mem_wr_ena) begin
  #1ps;
  $display("%0t READ  addr=%h  mdr_data_i=%h  mdr_q=%h",
           $time, dut.slc3.cpu.mem_addr, mdr_data_i, mdr_q);
end


  // === Tiny ROM to act as memory for reads ===
  // Read condition: mem_mem_ena==1 and mem_wr_ena==0
  logic [15:0] rom [0:65535];

  initial begin
    integer i;
    for (i = 0; i < 65536; i++) rom[i] = '0;
    rom[16'h0000] = PROGRAM[0];
    rom[16'h0001] = PROGRAM[1];
    rom[16'h0002] = PROGRAM[2];
  end
    
// === Memory driver for CPU ===
logic [15:0] mem_rdata_tb;              // testbench driver for mem_rdata
assign dut.slc3.cpu.mem_rdata = mem_rdata_tb;  // connect it to DUT input

always_comb begin
  if (dut.slc3.cpu.mem_mem_ena && !dut.slc3.cpu.mem_wr_ena) begin
    mem_rdata_tb = rom[dut.slc3.cpu.mem_addr];
  end else begin
    mem_rdata_tb = 16'hZZZZ;  // no read
  end
end


  // === Helpers ===
  task step_instruction;
    begin
      cont = 1'b1;
      repeat (2) @(posedge clk);
      cont = 1'b0;
      repeat (6) @(posedge clk);
    end
  endtask

  task reset_and_run;
    begin
      reset = 1;
      repeat (5) @(posedge clk);
      reset = 0;
      run   = 1;
      @(posedge clk);
      run   = 0;
    end
  endtask

  // === Stimulus ===
  initial begin
    clk = 0;
    reset = 0;
    run = 0;
    cont = 0;
    sw = 16'h0000;

`ifdef VERILATOR
    $dumpfile("wave.vcd");
    $dumpvars(0, testbench_fetch);
`endif

    for (int cycle = 0; cycle < 5; cycle++) begin
      $display("\n=== Cycle %0d ===", cycle);

      reset_and_run();
      step_instruction();

      // After one fetch from address 0
      assert(ir  == PROGRAM[0])
        else $error("Cycle %0d: IR mismatch, got %h expected %h",
                    cycle, ir, PROGRAM[0]);
      assert(mar == 16'h0000)
        else $error("Cycle %0d: MAR mismatch, got %h expected %h",
                    cycle, mar, 16'h0000);
      assert(pc  == 16'h0001)
        else $error("Cycle %0d: PC mismatch, got %h expected %h",
                    cycle, pc, 16'h0001);

      $display("Cycle %0d Passed", cycle);
    end

    $display("All 5 reset/run/continue cycles passed!");
    $stop;
  end

endmodule
