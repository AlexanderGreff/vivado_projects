`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2025 04:16:46 PM
// Design Name: 
// Module Name: HexDriverExtended
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


module HexDriverExtended(
    input   logic           clk,
    input   logic           reset,

    input   logic   [3:0]   in[8],    // 8 nibbles (32 bits total)

    output  logic   [7:0]   hex_seg,  // segments
    output  logic   [7:0]   hex_grid  // 8 digit enables
);

    // --- Nibble to segment decoder ---
    module nibble_to_hex(
        input   logic   [3:0]   nibble,
        output  logic   [7:0]   hex
    );
        always_comb begin
            case(nibble)
                4'h0: hex = 8'b00111111; // 0
                4'h1: hex = 8'b00000110; // 1
                4'h2: hex = 8'b01011011; // 2
                4'h3: hex = 8'b01001111; // 3
                4'h4: hex = 8'b01100110; // 4
                4'h5: hex = 8'b01101101; // 5
                4'h6: hex = 8'b01111101; // 6
                4'h7: hex = 8'b00000111; // 7
                4'h8: hex = 8'b01111111; // 8
                4'h9: hex = 8'b01101111; // 9
                4'hA: hex = 8'b01110111; // A
                4'hB: hex = 8'b01111100; // b
                4'hC: hex = 8'b00111001; // C
                4'hD: hex = 8'b01011110; // d
                4'hE: hex = 8'b01111001; // E
                4'hF: hex = 8'b01110001; // F
            endcase
        end
    endmodule

    // --- Decode all 8 nibbles ---
    logic [7:0] hex [8];

    genvar i;
    generate
        for(i = 0; i < 8; i++) begin
            nibble_to_hex nibble_to_hex_inst(
                .nibble(in[i]),
                .hex(hex[i])
            );
        end
    endgenerate

    // --- Refresh counter ---
    logic [17:0] counter;   // one bit wider to support 8 digits

    always_ff @(posedge clk) begin
        if (reset)
            counter <= '0;
        else
            counter <= counter + 1;
    end

    // --- Multiplex 8 digits ---
    always_comb begin
        if (reset) begin
            hex_grid = '1;
            hex_seg  = '1;
        end else begin
            case (counter[17:15])   // now cycles through 0..7
                3'd0: begin hex_seg = ~hex[0]; hex_grid = 8'b11111110; end
                3'd1: begin hex_seg = ~hex[1]; hex_grid = 8'b11111101; end
                3'd2: begin hex_seg = ~hex[2]; hex_grid = 8'b11111011; end
                3'd3: begin hex_seg = ~hex[3]; hex_grid = 8'b11110111; end
                3'd4: begin hex_seg = ~hex[4]; hex_grid = 8'b11101111; end
                3'd5: begin hex_seg = ~hex[5]; hex_grid = 8'b11011111; end
                3'd6: begin hex_seg = ~hex[6]; hex_grid = 8'b10111111; end
                3'd7: begin hex_seg = ~hex[7]; hex_grid = 8'b01111111; end
            endcase
        end
    end
endmodule