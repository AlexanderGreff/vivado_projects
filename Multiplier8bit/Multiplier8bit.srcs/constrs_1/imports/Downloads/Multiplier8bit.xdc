# ========= Multiplier8bit.xdc (Urbana board) =========
# Trimmed to only the ports used by your Multiplier top module.
# Board: Urbana | Clock: 100 MHz | D0 seven-seg only

# ---- Global config / bitstream ----
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property BITSTREAM.Config.SPI_buswidth 4 [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN PULLUP [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

# ---- 100 MHz system clock ----
set_property -dict { PACKAGE_PIN N15 IOSTANDARD LVCMOS33 } [get_ports {Clk}]
create_clock -period 10.000 -name Clk [get_ports Clk]

# ---- Slide switches (use SW[7:0]) ----
set_property -dict { PACKAGE_PIN G1 IOSTANDARD LVCMOS25 } [get_ports {SW[0]}]
set_property -dict { PACKAGE_PIN F2 IOSTANDARD LVCMOS25 } [get_ports {SW[1]}]
set_property -dict { PACKAGE_PIN F1 IOSTANDARD LVCMOS25 } [get_ports {SW[2]}]
set_property -dict { PACKAGE_PIN E2 IOSTANDARD LVCMOS25 } [get_ports {SW[3]}]
set_property -dict { PACKAGE_PIN E1 IOSTANDARD LVCMOS25 } [get_ports {SW[4]}]
set_property -dict { PACKAGE_PIN D2 IOSTANDARD LVCMOS25 } [get_ports {SW[5]}]
set_property -dict { PACKAGE_PIN D1 IOSTANDARD LVCMOS25 } [get_ports {SW[6]}]
set_property -dict { PACKAGE_PIN C2 IOSTANDARD LVCMOS25 } [get_ports {SW[7]}]
# (If you later expand to SW[15:8], keep using the manufacturer pins.)

# ---- Buttons ----
# BTN0 = Reset_Load_Logic, BTN1 = Run
set_property -dict { PACKAGE_PIN J2 IOSTANDARD LVCMOS25 } [get_ports {Reset_Load_Logic}]
set_property -dict { PACKAGE_PIN J1 IOSTANDARD LVCMOS25 } [get_ports {Run}]

# ---- Discrete LEDs (LED[3:0]) ----
set_property -dict { PACKAGE_PIN C13 IOSTANDARD LVCMOS33 } [get_ports {LED[0]}]
set_property -dict { PACKAGE_PIN C14 IOSTANDARD LVCMOS33 } [get_ports {LED[1]}]
set_property -dict { PACKAGE_PIN D14 IOSTANDARD LVCMOS33 } [get_ports {LED[2]}]
set_property -dict { PACKAGE_PIN D15 IOSTANDARD LVCMOS33 } [get_ports {LED[3]}]

# ---- 7-seg display 0 (Active LOW) ----
# Map your generic hex bus to D0 only to keep the RTL unchanged.
# hex_grid -> anode enables; hex_seg -> segments (a..g, dp)
set_property -dict { PACKAGE_PIN G6 IOSTANDARD LVCMOS25 } [get_ports {hex_grid[0]}]  ; # D0_AN[0]
set_property -dict { PACKAGE_PIN H6 IOSTANDARD LVCMOS25 } [get_ports {hex_grid[1]}]  ; # D0_AN[1]
set_property -dict { PACKAGE_PIN C3 IOSTANDARD LVCMOS25 } [get_ports {hex_grid[2]}]  ; # D0_AN[2]
set_property -dict { PACKAGE_PIN B3 IOSTANDARD LVCMOS25 } [get_ports {hex_grid[3]}]  ; # D0_AN[3]

set_property -dict { PACKAGE_PIN E6 IOSTANDARD LVCMOS25 } [get_ports {hex_seg[0]}]   ; # D0_SEG[0] (CA)
set_property -dict { PACKAGE_PIN B4 IOSTANDARD LVCMOS25 } [get_ports {hex_seg[1]}]   ; # D0_SEG[1] (CB)
set_property -dict { PACKAGE_PIN D5 IOSTANDARD LVCMOS25 } [get_ports {hex_seg[2]}]   ; # D0_SEG[2] (CC)
set_property -dict { PACKAGE_PIN C5 IOSTANDARD LVCMOS25 } [get_ports {hex_seg[3]}]   ; # D0_SEG[3] (CD)
set_property -dict { PACKAGE_PIN D7 IOSTANDARD LVCMOS25 } [get_ports {hex_seg[4]}]   ; # D0_SEG[4] (CE)
set_property -dict { PACKAGE_PIN D6 IOSTANDARD LVCMOS25 } [get_ports {hex_seg[5]}]   ; # D0_SEG[5] (CF)
set_property -dict { PACKAGE_PIN C4 IOSTANDARD LVCMOS25 } [get_ports {hex_seg[6]}]   ; # D0_SEG[6] (CG)
set_property -dict { PACKAGE_PIN B5 IOSTANDARD LVCMOS25 } [get_ports {hex_seg[7]}]   ; # D0_SEG[7] (DP)
