`define SIM_CYCLES 1000

module testbench8(); //even though the testbench doesn't create any hardware, it still needs to be a module

	timeunit 10ns;	// This is the amount of time represented by #1 
	timeprecision 1ns;

	// These signals are internal because the processor will be 
	// instantiated as a submodule in testbench.
	logic       clk;
	logic       reset;
	logic       run_i;
	logic [15:0] sw_i;
	
	logic       sign_led;
	logic [7:0] hex_seg_a;
	logic [7:0] hex_seg_b;
	logic [3:0] hex_grid_a;
	logic [3:0] hex_grid_b;



			

	// To store expected results
	
	// Instantiating the DUT (Device Under Test)
	// Make sure the module and signal names match with those in your design
	// Note that if you called the 8-bit version something besides 'Processor'
	// You will need to change the module name
	adder_toplevel addertop0 (.*);	


	initial begin: CLOCK_INITIALIZATION
		clk = 1'b1;
	end 

	// Toggle the clock
	// #1 means wait for a delay of 1 timeunit, so simulation clock is 50 MHz technically 
	// half of what it is on the FPGA board 

	// Note: Since we do mostly behavioral simulations, timing is not accounted for in simulation, however
	// this is important because we need to know what the time scale is for how long to run
	// the simulation
	always begin : CLOCK_GENERATION
		#1 clk = ~clk;
	end

	// Testing begins here
	// The initial block is not synthesizable on an FPGA
	// Everything happens sequentially inside an initial block
	// as in a software program

	// Note: Even though the testbench happens sequentially,
	// it is recommended to use non-blocking assignments for most assignments because
	// we do not want any dependencies to arise between different assignments in the 
	// same simulation timestep. The exception is for reset, which we want to make sure
	// happens first. 
	initial begin: TEST_VECTORS //initial means at time t = 0, non-synthesizable construct (not the same as reset)
		reset = 1;		// Toggle Reset (use blocking operator), because we want to have this happen 'first'
		sw_i <= 16'h0000;
		run_i <= 1'b0;

		repeat (3) @(posedge clk); //each @(posedge Clk) here means to wait for 1 clock edge, so this waits for 3 clock edges
		#0.1 reset <= 1'b0;
		#0.1 sw_i <= 16'h0003;
	    #0.1 run_i <= 1'b1; //wait a little bit after clock edge, no more pure software artifacts
	    
	    repeat (20) @(posedge clk);
	    #0.1 run_i <= 1'b1;
	    
	    repeat (20) @(posedge clk);
	    #0.1 run_i <= 1'b0;
	    
	    repeat (20) @(posedge clk);
	    #0.1 run_i <= 1'b1;
	    
	    repeat (20) @(posedge clk);
	    #0.1 run_i <= 1'b0;


	    
	    
	    repeat (`SIM_CYCLES) @(posedge clk);
	    
		$finish(); //this task will end the simulation if the Vivado settings are properly configured


end
endmodule
