## =====================================================================
## Board Constraints (.xdc)
## NOTE: Per your note, Aval[*] and Bval[*] are SIM-ONLY and are
## intentionally **not** constrained here.
## =====================================================================

## ----------------------
## Clocks
## ----------------------
## 50 MHz on-board clock
set_property PACKAGE_PIN N15 [get_ports {Clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {Clk}]
create_clock -name sys_clk -period 20.000 [get_ports {Clk}]

## ----------------------
## Push Buttons
## ----------------------
set_property PACKAGE_PIN J2 [get_ports {Reset_Load_Clear}]
set_property IOSTANDARD LVCMOS25 [get_ports {Reset_Load_Clear}]

set_property PACKAGE_PIN J1 [get_ports {Run}]
set_property IOSTANDARD LVCMOS25 [get_ports {Run}]

## ----------------------
## Slider Switches SW[7:0]
## ----------------------
set_property PACKAGE_PIN G1 [get_ports {SW[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {SW[0]}]

set_property PACKAGE_PIN F2 [get_ports {SW[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {SW[1]}]

set_property PACKAGE_PIN F1 [get_ports {SW[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {SW[2]}]

set_property PACKAGE_PIN E2 [get_ports {SW[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {SW[3]}]

set_property PACKAGE_PIN E1 [get_ports {SW[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {SW[4]}]

set_property PACKAGE_PIN D2 [get_ports {SW[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {SW[5]}]

set_property PACKAGE_PIN D1 [get_ports {SW[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {SW[6]}]

set_property PACKAGE_PIN C2 [get_ports {SW[7]}]
set_property IOSTANDARD LVCMOS25 [get_ports {SW[7]}]

## ----------------------
## Seven-Segment Display A
## Grids (anodes / enables) hex_gridA[3:0]
## ----------------------
set_property PACKAGE_PIN G6 [get_ports {hex_gridA[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_gridA[0]}]

set_property PACKAGE_PIN H6 [get_ports {hex_gridA[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_gridA[1]}]

set_property PACKAGE_PIN C3 [get_ports {hex_gridA[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_gridA[2]}]

set_property PACKAGE_PIN B3 [get_ports {hex_gridA[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_gridA[3]}]

## ----------------------
## Seven-Segment Display A
## Segments hex_segA[7:0]
## ----------------------
set_property PACKAGE_PIN E6 [get_ports {hex_segA[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_segA[0]}]

set_property PACKAGE_PIN B4 [get_ports {hex_segA[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_segA[1]}]

set_property PACKAGE_PIN D5 [get_ports {hex_segA[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_segA[2]}]

set_property PACKAGE_PIN C5 [get_ports {hex_segA[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_segA[3]}]

set_property PACKAGE_PIN D7 [get_ports {hex_segA[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_segA[4]}]

set_property PACKAGE_PIN D6 [get_ports {hex_segA[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_segA[5]}]

set_property PACKAGE_PIN C4 [get_ports {hex_segA[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_segA[6]}]

set_property PACKAGE_PIN B5 [get_ports {hex_segA[7]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hex_segA[7]}]

## ----------------------
## RGB LED0 - Red only
## ----------------------
set_property PACKAGE_PIN C9 [get_ports {Xval}]
set_property IOSTANDARD LVCMOS33 [get_ports {Xval}]

## ======================
## END OF CONSTRAINTS
## ======================
