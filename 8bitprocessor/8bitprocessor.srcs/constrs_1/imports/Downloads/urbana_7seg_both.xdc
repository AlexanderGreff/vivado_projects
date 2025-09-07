# ===================== On-board 7-segment displays (DISP0 & DISP1) =====================
# Both displays are 4-digit, common-anode, each with its own segment bus.
# Here we map your 8-bit anode bus across both displays and expose TWO segment buses:
#   - hex_grid[3:0] -> DISP0 (D0_AN[3:0])
#   - hex_grid[7:4] -> DISP1 (D1_AN[3:0])
#   - hex0_seg[7:0] -> DISP0 segments (D0_SEG[7:0])
#   - hex1_seg[7:0] -> DISP1 segments (D1_SEG[7:0])

# ---- DISP0 anodes (hex_grid[3:0]) ----
set_property -dict { PACKAGE_PIN G6 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex_grid[0]}]
set_property -dict { PACKAGE_PIN H6 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex_grid[1]}]
set_property -dict { PACKAGE_PIN C3 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex_grid[2]}]
set_property -dict { PACKAGE_PIN B3 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex_grid[3]}]

# ---- DISP1 anodes (hex_grid[7:4]) ----
set_property -dict { PACKAGE_PIN E4 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex_grid[4]}]
set_property -dict { PACKAGE_PIN E3 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex_grid[5]}]
set_property -dict { PACKAGE_PIN F5 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex_grid[6]}]
set_property -dict { PACKAGE_PIN H5 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex_grid[7]}]

# ---- DISP0 segments (hex0_seg[7:0]) ----
set_property -dict { PACKAGE_PIN E6 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex0_seg[0]}]  # a
set_property -dict { PACKAGE_PIN B4 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex0_seg[1]}]  # b
set_property -dict { PACKAGE_PIN D5 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex0_seg[2]}]  # c
set_property -dict { PACKAGE_PIN C5 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex0_seg[3]}]  # d
set_property -dict { PACKAGE_PIN D7 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex0_seg[4]}]  # e
set_property -dict { PACKAGE_PIN D6 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex0_seg[5]}]  # f
set_property -dict { PACKAGE_PIN C4 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex0_seg[6]}]  # g
set_property -dict { PACKAGE_PIN B5 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex0_seg[7]}]  # dp

# ---- DISP1 segments (hex1_seg[7:0]) ----
set_property -dict { PACKAGE_PIN F3 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex1_seg[0]}]  # a
set_property -dict { PACKAGE_PIN G5 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex1_seg[1]}]  # b
set_property -dict { PACKAGE_PIN J3 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex1_seg[2]}]  # c
set_property -dict { PACKAGE_PIN H4 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex1_seg[3]}]  # d
set_property -dict { PACKAGE_PIN F4 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex1_seg[4]}]  # e
set_property -dict { PACKAGE_PIN H3 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex1_seg[5]}]  # f
set_property -dict { PACKAGE_PIN E5 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex1_seg[6]}]  # g
set_property -dict { PACKAGE_PIN J4 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex1_seg[7]}]  # dp
