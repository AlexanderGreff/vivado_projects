# =====================================================================
# Urbana Board — Consolidated Constraints (FIXED: no multiple drivers)
# - Uses both on-board 7-seg displays with SEPARATE segment buses:
#     hex0_seg[7:0] -> DISP0 segments, hex1_seg[7:0] -> DISP1 segments
# - Anodes combined in hex_grid[7:0]: [3:0]=DISP0, [7:4]=DISP1
# - Inputs: Din[7:0] from SW[7:0], R[1:0] from SW[8..9], F[2:0] from BTN[0..2]
# - Outputs: LED[3:0] to LEDs
# - Aval/Bval left as templates; choose PMOD pins and uncomment.
# =====================================================================

# ---- Switches -> Din[7:0] (inputs) ----
set_property -dict { PACKAGE_PIN G1 IOSTANDARD LVCMOS25 } [get_ports {Din[0]}]
set_property -dict { PACKAGE_PIN F2 IOSTANDARD LVCMOS25 } [get_ports {Din[1]}]
set_property -dict { PACKAGE_PIN F1 IOSTANDARD LVCMOS25 } [get_ports {Din[2]}]
set_property -dict { PACKAGE_PIN E2 IOSTANDARD LVCMOS25 } [get_ports {Din[3]}]
set_property -dict { PACKAGE_PIN E1 IOSTANDARD LVCMOS25 } [get_ports {Din[4]}]
set_property -dict { PACKAGE_PIN D2 IOSTANDARD LVCMOS25 } [get_ports {Din[5]}]
set_property -dict { PACKAGE_PIN D1 IOSTANDARD LVCMOS25 } [get_ports {Din[6]}]
set_property -dict { PACKAGE_PIN C2 IOSTANDARD LVCMOS25 } [get_ports {Din[7]}]

# ---- Extra switches -> R[1:0] (inputs) ----
set_property -dict { PACKAGE_PIN B2 IOSTANDARD LVCMOS25 } [get_ports {R[0]}]
set_property -dict { PACKAGE_PIN A4 IOSTANDARD LVCMOS25 } [get_ports {R[1]}]

# ---- Buttons -> F[2:0] (inputs) ----
set_property -dict { PACKAGE_PIN J2 IOSTANDARD LVCMOS25 } [get_ports {F[0]}]
set_property -dict { PACKAGE_PIN J1 IOSTANDARD LVCMOS25 } [get_ports {F[1]}]
set_property -dict { PACKAGE_PIN G2 IOSTANDARD LVCMOS25 } [get_ports {F[2]}]

# ---- LEDs -> LED[3:0] (outputs) ----
set_property -dict { PACKAGE_PIN C13 IOSTANDARD LVCMOS33 DRIVE 12 } [get_ports {LED[0]}]
set_property -dict { PACKAGE_PIN C14 IOSTANDARD LVCMOS33 DRIVE 12 } [get_ports {LED[1]}]
set_property -dict { PACKAGE_PIN D14 IOSTANDARD LVCMOS33 DRIVE 12 } [get_ports {LED[2]}]
set_property -dict { PACKAGE_PIN D15 IOSTANDARD LVCMOS33 DRIVE 12 } [get_ports {LED[3]}]

# ---- 7-seg anodes: DISP0 (hex_grid[3:0]) and DISP1 (hex_grid[7:4]) ----
set_property -dict { PACKAGE_PIN G6 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex_grid[0]}]
set_property -dict { PACKAGE_PIN H6 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex_grid[1]}]
set_property -dict { PACKAGE_PIN C3 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex_grid[2]}]
set_property -dict { PACKAGE_PIN B3 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex_grid[3]}]
set_property -dict { PACKAGE_PIN E4 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex_grid[4]}]
set_property -dict { PACKAGE_PIN E3 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex_grid[5]}]
set_property -dict { PACKAGE_PIN F5 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex_grid[6]}]
set_property -dict { PACKAGE_PIN H5 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex_grid[7]}]

# ---- 7-seg segments: DISP0 -> hex0_seg[7:0] ----
set_property -dict { PACKAGE_PIN E6 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex0_seg[0]}]
set_property -dict { PACKAGE_PIN B4 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex0_seg[1]}]
set_property -dict { PACKAGE_PIN D5 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex0_seg[2]}]
set_property -dict { PACKAGE_PIN C5 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex0_seg[3]}]
set_property -dict { PACKAGE_PIN D7 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex0_seg[4]}]
set_property -dict { PACKAGE_PIN D6 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex0_seg[5]}]
set_property -dict { PACKAGE_PIN C4 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex0_seg[6]}]
set_property -dict { PACKAGE_PIN B5 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex0_seg[7]}]

# ---- 7-seg segments: DISP1 -> hex1_seg[7:0] ----
set_property -dict { PACKAGE_PIN F3 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex1_seg[0]}]
set_property -dict { PACKAGE_PIN G5 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex1_seg[1]}]
set_property -dict { PACKAGE_PIN J3 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex1_seg[2]}]
set_property -dict { PACKAGE_PIN H4 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex1_seg[3]}]
set_property -dict { PACKAGE_PIN F4 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex1_seg[4]}]
set_property -dict { PACKAGE_PIN H3 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex1_seg[5]}]
set_property -dict { PACKAGE_PIN E5 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex1_seg[6]}]
set_property -dict { PACKAGE_PIN J4 IOSTANDARD LVCMOS25 DRIVE 12 } [get_ports {hex1_seg[7]}]

# ===================== Aval[7:0] / Bval[7:0] (choose PMOD pins) =====================
# Pick free PMOD pins (JA/JB) and **uncomment**. Ensure the header bank Vcco matches IOSTANDARD.
# Example (edit to match your wiring):
# set_property -dict { PACKAGE_PIN F14 IOSTANDARD LVCMOS33 DRIVE 12 } [get_ports {Aval[0]}]
# set_property -dict { PACKAGE_PIN F15 IOSTANDARD LVCMOS33 DRIVE 12 } [get_ports {Aval[1]}]
# set_property -dict { PACKAGE_PIN H13 IOSTANDARD LVCMOS33 DRIVE 12 } [get_ports {Aval[2]}]
# set_property -dict { PACKAGE_PIN H14 IOSTANDARD LVCMOS33 DRIVE 12 } [get_ports {Aval[3]}]
# set_property -dict { PACKAGE_PIN J13 IOSTANDARD LVCMOS33 DRIVE 12 } [get_ports {Aval[4]}]
# set_property -dict { PACKAGE_PIN J14 IOSTANDARD LVCMOS33 DRIVE 12 } [get_ports {Aval[5]}]
# set_property -dict { PACKAGE_PIN E14 IOSTANDARD LVCMOS33 DRIVE 12 } [get_ports {Aval[6]}]
# set_property -dict { PACKAGE_PIN E15 IOSTANDARD LVCMOS33 DRIVE 12 } [get_ports {Aval[7]}]

# set_property -dict { PACKAGE_PIN H18 IOSTANDARD LVCMOS33 DRIVE 12 } [get_ports {Bval[0]}]
# set_property -dict { PACKAGE_PIN G18 IOSTANDARD LVCMOS33 DRIVE 12 } [get_ports {Bval[1]}]
# set_property -dict { PACKAGE_PIN H16 IOSTANDARD LVCMOS33 DRIVE 12 } [get_ports {Bval[2]}]
# set_property -dict { PACKAGE_PIN H17 IOSTANDARD LVCMOS33 DRIVE 12 } [get_ports {Bval[3]}]
# set_property -dict { PACKAGE_PIN K16 IOSTANDARD LVCMOS33 DRIVE 12 } [get_ports {Bval[4]}]
# set_property -dict { PACKAGE_PIN J16 IOSTANDARD LVCMOS33 DRIVE 12 } [get_ports {Bval[5]}]
# # ...choose two more free pins for Bval[6], Bval[7]
