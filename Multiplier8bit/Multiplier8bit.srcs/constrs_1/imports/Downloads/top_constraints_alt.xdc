## =========================
## Multiplier8bit.xdc (Urbana)
## =========================
## Clock: 50 MHz on N15

## -------- Clock --------
set_property -dict { PACKAGE_PIN N15 IOSTANDARD LVCMOS33 } [get_ports {Clk}]
create_clock -period 10.000 -name Clk [get_ports {Clk}]  ;# 50 MHz => 20 ns

## -------- Switches SW[7:0] (2.5V bank) --------
set_property -dict { PACKAGE_PIN G1 IOSTANDARD LVCMOS25 } [get_ports {SW[0]}]
set_property -dict { PACKAGE_PIN F2 IOSTANDARD LVCMOS25 } [get_ports {SW[1]}]
set_property -dict { PACKAGE_PIN F1 IOSTANDARD LVCMOS25 } [get_ports {SW[2]}]
set_property -dict { PACKAGE_PIN E2 IOSTANDARD LVCMOS25 } [get_ports {SW[3]}]
set_property -dict { PACKAGE_PIN E1 IOSTANDARD LVCMOS25 } [get_ports {SW[4]}]
set_property -dict { PACKAGE_PIN D2 IOSTANDARD LVCMOS25 } [get_ports {SW[5]}]
set_property -dict { PACKAGE_PIN D1 IOSTANDARD LVCMOS25 } [get_ports {SW[6]}]
set_property -dict { PACKAGE_PIN C2 IOSTANDARD LVCMOS25 } [get_ports {SW[7]}]

## -------- LEDs for Bval[7:0] (3.3V bank) --------
set_property -dict { PACKAGE_PIN C13 IOSTANDARD LVCMOS33 } [get_ports {Bval[0]}]
set_property -dict { PACKAGE_PIN C14 IOSTANDARD LVCMOS33 } [get_ports {Bval[1]}]
set_property -dict { PACKAGE_PIN D14 IOSTANDARD LVCMOS33 } [get_ports {Bval[2]}]
set_property -dict { PACKAGE_PIN D15 IOSTANDARD LVCMOS33 } [get_ports {Bval[3]}]
set_property -dict { PACKAGE_PIN D16 IOSTANDARD LVCMOS33 } [get_ports {Bval[4]}]
set_property -dict { PACKAGE_PIN F18 IOSTANDARD LVCMOS33 } [get_ports {Bval[5]}]
set_property -dict { PACKAGE_PIN E17 IOSTANDARD LVCMOS33 } [get_ports {Bval[6]}]
set_property -dict { PACKAGE_PIN D17 IOSTANDARD LVCMOS33 } [get_ports {Bval[7]}]

## -------- LEDs for Aval[7:0] (3.3V bank) --------
set_property -dict { PACKAGE_PIN C17 IOSTANDARD LVCMOS33 } [get_ports {Aval[0]}]
set_property -dict { PACKAGE_PIN B18 IOSTANDARD LVCMOS33 } [get_ports {Aval[1]}]
set_property -dict { PACKAGE_PIN A17 IOSTANDARD LVCMOS33 } [get_ports {Aval[2]}]
set_property -dict { PACKAGE_PIN B17 IOSTANDARD LVCMOS33 } [get_ports {Aval[3]}]
set_property -dict { PACKAGE_PIN C18 IOSTANDARD LVCMOS33 } [get_ports {Aval[4]}]
set_property -dict { PACKAGE_PIN D18 IOSTANDARD LVCMOS33 } [get_ports {Aval[5]}]
set_property -dict { PACKAGE_PIN E18 IOSTANDARD LVCMOS33 } [get_ports {Aval[6]}]
set_property -dict { PACKAGE_PIN G17 IOSTANDARD LVCMOS33 } [get_ports {Aval[7]}]

## -------- Xval (RGB LED red) --------
set_property -dict { PACKAGE_PIN C9 IOSTANDARD LVCMOS33 } [get_ports {Xval}]

## -------- Seven-seg GRIDs (active-low, display A) --------
set_property -dict { PACKAGE_PIN G6 IOSTANDARD LVCMOS25 } [get_ports {hex_grid[0]}]
set_property -dict { PACKAGE_PIN H6 IOSTANDARD LVCMOS25 } [get_ports {hex_grid[1]}]
set_property -dict { PACKAGE_PIN C3 IOSTANDARD LVCMOS25 } [get_ports {hex_grid[2]}]
set_property -dict { PACKAGE_PIN B3 IOSTANDARD LVCMOS25 } [get_ports {hex_grid[3]}]

## -------- Seven-seg SEGMENTS (active-low, display A) --------
## Order: hex_segA[7:0] = {dp,g,f,e,d,c,b,a}
set_property -dict { PACKAGE_PIN E6 IOSTANDARD LVCMOS25 } [get_ports {hex_seg[0]}]  ;# a
set_property -dict { PACKAGE_PIN B4 IOSTANDARD LVCMOS25 } [get_ports {hex_seg[1]}]  ;# b
set_property -dict { PACKAGE_PIN D5 IOSTANDARD LVCMOS25 } [get_ports {hex_seg[2]}]  ;# c
set_property -dict { PACKAGE_PIN C5 IOSTANDARD LVCMOS25 } [get_ports {hex_seg[3]}]  ;# d
set_property -dict { PACKAGE_PIN D7 IOSTANDARD LVCMOS25 } [get_ports {hex_seg[4]}]  ;# e
set_property -dict { PACKAGE_PIN D6 IOSTANDARD LVCMOS25 } [get_ports {hex_seg[5]}]  ;# f
set_property -dict { PACKAGE_PIN C4 IOSTANDARD LVCMOS25 } [get_ports {hex_seg[6]}]  ;# g
set_property -dict { PACKAGE_PIN B5 IOSTANDARD LVCMOS25 } [get_ports {hex_seg[7]}]  ;# dp

## -------- Pushbuttons --------
set_property -dict { PACKAGE_PIN J2 IOSTANDARD LVCMOS25 } [get_ports {Reset_Load_Logic}]
set_property -dict { PACKAGE_PIN J1 IOSTANDARD LVCMOS25 } [get_ports {Run}]
