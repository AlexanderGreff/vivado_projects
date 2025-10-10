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
logic ld_cc;

logic gate_pc;
logic gate_mdr;
logic gate_marmux;
logic gate_alu;

logic [DATA_WIDTH-1:0] marmux_out;
logic [DATA_WIDTH-1:0] alu_out;
logic [DATA_WIDTH-1:0] shared_bus;

logic [DATA_WIDTH-1:0] effective_addr_out;

//sr1 and control bit
//logic [2:0] sr1;
logic sr1mux;
logic sr2mux;

logic [DATA_WIDTH-1:0] sr1_out;
logic [DATA_WIDTH-1:0] sr2_out;

//sr2 3-bit input
logic [2:0] sr2;

logic [DATA_WIDTH-1:0] q [REG_COUNT];

logic [1:0] alu_k;
logic [DATA_WIDTH-1:0] alu_b_in;

//selector bits for muxes
logic [1:0] pcmux;
logic drmux;
logic mio_en;

logic [REG_COUNT-1:0]  we;

logic [DATA_WIDTH-1:0] mdr_in;

logic [DATA_WIDTH-1:0] mar; 
logic [DATA_WIDTH-1:0] mdr;
logic [DATA_WIDTH-1:0] ir;

logic signed [DATA_WIDTH-1:0] imm5;
logic signed [DATA_WIDTH-1:0] offset6;
logic signed [DATA_WIDTH-1:0] pc_offset9;
logic signed [DATA_WIDTH-1:0] pc_offset11;

assign imm5  = {{(DATA_WIDTH-5){ir[4]}},  ir[4:0]};
assign offset6 = {{(DATA_WIDTH-6){ir[5]}},  ir[5:0]};
assign pc_offset9 = {{(DATA_WIDTH-9){ir[8]}},  ir[8:0]};
assign pc_offset11= {{(DATA_WIDTH-11){ir[10]}}, ir[10:0]};



logic [DATA_WIDTH-1:0] pc;
logic ben;

assign mem_addr = mar;
assign mem_wdata = mdr;

logic addr1mux;
logic [1:0] addr2mux;

logic [2:0] cc;

// State machine, you need to fill in the code here as well
// .* auto-infers module input/output connections which have the same name
// This can help visually condense modules with large instantiations, 
// but can also lead to confusing code if used too commonly
control cpu_control (
    .*
);



always_comb begin
    if (ld_led)
        led_o = {4'b0, ir[11:0]};
    else
        led_o = ir; 
end

    
assign hex_display_debug = ir;

logic [DATA_WIDTH-1:0] pc_in;

always_comb
begin 
    pc_in = 16'b0;
    
    case(pcmux)
        2'b00: pc_in = pc + 16'd1;
        2'b01: pc_in = effective_addr_out;
        2'b10: pc_in = shared_bus;
        2'b11: pc_in = 16'b0; //(debugging) should never occur
    endcase
end

assign marmux_out = effective_addr_out;

always_comb
begin 
  shared_bus = '0;
  unique case (1'b1)
  gate_pc:     shared_bus = pc;
  gate_mdr:    shared_bus = mdr;
  gate_marmux: shared_bus = marmux_out;
  gate_alu:    shared_bus = alu_out;
endcase
end


load_reg #(.DATA_WIDTH(DATA_WIDTH)) ir_reg (
    .clk    (clk),
    .reset  (reset),

    .load   (ld_ir),
    .data_i (shared_bus),

    .data_q (ir)
);

assign alu_b_in = sr2mux ? imm5 : sr2_out;

alu #(.DATA_WIDTH(DATA_WIDTH)) alu_unit
(
    .a_in(sr1_out),
    .b_in(alu_b_in),
    .alu_k(alu_k),
    
    .alu_out(alu_out)
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
    .data_i(shared_bus),

    .data_q(mar)
);

assign mdr_in = mio_en ? shared_bus : mem_rdata;

load_reg #(.DATA_WIDTH(DATA_WIDTH)) mdr_reg (
    .clk(clk),
    .reset(reset),

    .load(ld_mdr),
    .data_i(mdr_in),

    .data_q(mdr)
);


reg_file #(.DATA_WIDTH(DATA_WIDTH),.REG_COUNT(REG_COUNT)) file_reg
(
    .ld_reg(ld_reg),
    .ir(ir),
    .drmux(drmux),
    .sr1mux(sr1mux),
    .sr2(sr2),
    .clk(clk),
    .reset(reset),
    .data_in(shared_bus),
    
    .sr1_out(sr1_out),
    .sr2_out(sr2_out)
);

effective_addr_unit #(.DATA_WIDTH(DATA_WIDTH)) eau
(
    .pc(pc),
    .sr1_out(sr1_out),
    .addr1mux(addr1mux),
    .addr2mux(addr2mux),
    .offset6(offset6),
    .pc_offset9(pc_offset9),
    .pc_offset11(pc_offset11),
    
    .effective_addr_out(effective_addr_out)
);

cc_logic #(.DATA_WIDTH(DATA_WIDTH)) nzp_unit
(
    .shared_bus(shared_bus),
    .ld_cc(ld_cc),
    .clk(clk),
    .cc(cc)
);

assign ben = (ir[11] & cc[2]) | (ir[10] & cc[1]) | (ir[9] & cc[0]);





endmodule