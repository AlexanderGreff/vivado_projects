//------------------------------------------------------------------------------
// Company: 		 UIUC ECE Dept.
// Engineer:		 Stephen Kempf
//
// Create Date:    
// Design Name:    ECE 385 Given Code - SLC-3 core
// Module Name:    SLC3
//
// Comments:
//    Revised 03-22-2007
//    Spring 2007 Distribution
//    Revised 07-26-2013
//    Spring 2015 Distribution
//    Revised 09-22-2015 
//    Revised 06-09-2020
//	  Revised 03-02-2021
//    Xilinx vivado
//    Revised 07-25-2023 
//    Revised 12-29-2023
//    Revised 09-25-2024
//------------------------------------------------------------------------------

module cpu #
(
  parameter int REG_COUNT  = 8,
  parameter int DATA_WIDTH = 16
)(


    input   logic        clk,
    input   logic        reset,

    input   logic        run_i,
    input   logic        continue_i,
    output  logic [DATA_WIDTH-1:0] hex_display_debug,
    output  logic [DATA_WIDTH-1:0] led_o,
   
    input   logic [DATA_WIDTH-1:0] mem_rdata,
    output  logic [DATA_WIDTH-1:0] mem_wdata,
    output  logic [DATA_WIDTH-1:0] mem_addr,
    output  logic        mem_mem_ena,
    output  logic        mem_wr_ena
);


// Internal connections, follow the datapath block diagram and add the additional needed signals
logic ld_mar; 
logic ld_mdr; 
logic ld_ir; 
logic ld_pc; 
logic ld_reg;
logic ld_led;

logic gate_pc;
logic gate_mdr;
logic gate_marmux;
logic gate_alu;

//sr1 and control bit
//logic [2:0] sr1;
logic sr1mux;

logic [DATA_WIDTH-1:0] sr1_out;
logic [DATA_WIDTH-1:0] sr2_out;

//sr2 3-bit input
logic [2:0] sr2;

logic [DATA_WIDTH-1:0] q [REG_COUNT];


//selector bits for muxes
logic [1:0] pcmux;
logic drmux;
logic mio_en;

logic [REG_COUNT-1:0]  we;

logic [DATA_WIDTH-1:0] data_in;

logic [DATA_WIDTH-1:0] mar; 
logic [DATA_WIDTH-1:0] mdr;
logic [DATA_WIDTH-1:0] ir;
logic [DATA_WIDTH-1:0] pc;
logic ben;
logic [2:0] dr;

assign mem_addr = mar;
assign mem_wdata = mdr;



// State machine, you need to fill in the code here as well
// .* auto-infers module input/output connections which have the same name
// This can help visually condense modules with large instantiations, 
// but can also lead to confusing code if used too commonly
control cpu_control (
    .*
);


assign led_o = ir;
assign hex_display_debug = ir;

logic [DATA_WIDTH-1:0] pc_in;
always_comb 
begin
    pc_in = pc;
    if (pcmux == 2'b00)
    begin
        pc_in = pc + 16'd1;
//        pc = pc_in;
    end
    
//begin case(pcmux)
//    2'b00: pc_in = pc_next;
//    2'b01: pc_in = gate_mdr;
//    2'b10: pc_in = 16'b0;
//    2'b11: pc_in = 16'b0;
//    endcase
end

load_reg #(.DATA_WIDTH(DATA_WIDTH)) ir_reg (
    .clk    (clk),
    .reset  (reset),

    .load   (ld_ir),
    .data_i (mdr),

    .data_q (ir)
);

load_reg #(.DATA_WIDTH(DATA_WIDTH)) pc_reg (
    .clk(clk),
    .reset(reset),

    .load(ld_pc),
    .data_i(pc_in),

    .data_q(pc)
);

load_reg #(.DATA_WIDTH(DATA_WIDTH)) mar_reg (
    .clk(clk),
    .reset(reset),

    .load(ld_mar),
    .data_i(pc),

    .data_q(mar)
);

load_reg #(.DATA_WIDTH(DATA_WIDTH)) mdr_reg (
    .clk(clk),
    .reset(reset),

    .load(ld_mdr),
    .data_i(mem_rdata),

    .data_q(mdr)
);

always_comb
begin case(drmux)
    1'b0: dr = ir[11:9];
    1'b1: dr = 3'b111;
    endcase
end

reg_file #(.DATA_WIDTH(DATA_WIDTH),.REG_COUNT(REG_COUNT)) file_reg
(
    .ld_reg(ld_reg),
    .ir(ir),
    .dr(dr),
    .sr1mux(sr1mux),
    .sr2(sr2),
    .clk(clk),
    
    .sr1_out(sr1_out),
    .sr2_out(sr2_out)
);





endmodule