## =========================
## Inputs (slide switches)
## =========================
set_property PACKAGE_PIN G1  [get_ports {Din[0]}] ; set_property IOSTANDARD LVCMOS25 [get_ports {Din[0]}]
set_property PACKAGE_PIN F2  [get_ports {Din[1]}] ; set_property IOSTANDARD LVCMOS25 [get_ports {Din[1]}]
set_property PACKAGE_PIN F1  [get_ports {Din[2]}] ; set_property IOSTANDARD LVCMOS25 [get_ports {Din[2]}]
set_property PACKAGE_PIN E2  [get_ports {Din[3]}] ; set_property IOSTANDARD LVCMOS25 [get_ports {Din[3]}]
set_property PACKAGE_PIN E1  [get_ports {Din[4]}] ; set_property IOSTANDARD LVCMOS25 [get_ports {Din[4]}]
set_property PACKAGE_PIN D2  [get_ports {Din[5]}] ; set_property IOSTANDARD LVCMOS25 [get_ports {Din[5]}]
set_property PACKAGE_PIN D1  [get_ports {Din[6]}] ; set_property IOSTANDARD LVCMOS25 [get_ports {Din[6]}]
set_property PACKAGE_PIN C1  [get_ports {Din[7]}] ; set_property IOSTANDARD LVCMOS25 [get_ports {Din[7]}]

## Extra switches (F[0..2] = SW8..SW10)
set_property PACKAGE_PIN B2  [get_ports {F[0]}]  ; set_property IOSTANDARD LVCMOS25 [get_ports {F[0]}]
set_property PACKAGE_PIN B1  [get_ports {F[1]}]  ; set_property IOSTANDARD LVCMOS25 [get_ports {F[1]}]
set_property PACKAGE_PIN E5  [get_ports {F[2]}]  ; set_property IOSTANDARD LVCMOS25 [get_ports {F[2]}]   ;# corrected

## Extra switches (R[0..1] = SW11..SW12)
set_property PACKAGE_PIN A6  [get_ports {R[0]}]  ; set_property IOSTANDARD LVCMOS25 [get_ports {R[0]}]
set_property PACKAGE_PIN A5  [get_ports {R[1]}]  ; set_property IOSTANDARD LVCMOS25 [get_ports {R[1]}]

## Push buttons (match your HDL names)
set_property PACKAGE_PIN J2  [get_ports {Reset}]   ; set_property IOSTANDARD LVCMOS25 [get_ports {Reset}]   ;# KEY0
set_property PACKAGE_PIN J1  [get_ports {LoadB}]   ; set_property IOSTANDARD LVCMOS25 [get_ports {LoadB}]   ;# KEY1
set_property PACKAGE_PIN G2  [get_ports {LoadA}]   ; set_property IOSTANDARD LVCMOS25 [get_ports {LoadA}]   ;# KEY2
set_property PACKAGE_PIN H2  [get_ports {Execute}] ; set_property IOSTANDARD LVCMOS25 [get_ports {Execute}] ;# KEY3

## On-board 100 MHz clock (from oscillator)
set_property PACKAGE_PIN N15 [get_ports {Clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {Clk}]
create_clock -name sys_clk -period 10.000 [get_ports {Clk}]  ;# 100 MHz

## ===================================
## Seven-seg HEX Displays (grids)
## ===================================
set_property PACKAGE_PIN G6 [get_ports {hex_grid[0]}] ; set_property IOSTANDARD LVCMOS25 [get_ports {hex_grid[0]}]
set_property PACKAGE_PIN H6 [get_ports {hex_grid[1]}] ; set_property IOSTANDARD LVCMOS25 [get_ports {hex_grid[1]}]
set_property PACKAGE_PIN C3 [get_ports {hex_grid[2]}] ; set_property IOSTANDARD LVCMOS25 [get_ports {hex_grid[2]}]
set_property PACKAGE_PIN B3 [get_ports {hex_grid[3]}] ; set_property IOSTANDARD LVCMOS25 [get_ports {hex_grid[3]}]

## Seven-seg HEX Displays (segments a..dp mapped to [0]..[7])
set_property PACKAGE_PIN E6 [get_ports {hex_seg[0]}] ; set_property IOSTANDARD LVCMOS25 [get_ports {hex_seg[0]}]
set_property PACKAGE_PIN B4 [get_ports {hex_seg[1]}] ; set_property IOSTANDARD LVCMOS25 [get_ports {hex_seg[1]}]
set_property PACKAGE_PIN D5 [get_ports {hex_seg[2]}] ; set_property IOSTANDARD LVCMOS25 [get_ports {hex_seg[2]}]
set_property PACKAGE_PIN C5 [get_ports {hex_seg[3]}] ; set_property IOSTANDARD LVCMOS25 [get_ports {hex_seg[3]}]   ;# confirmed
set_property PACKAGE_PIN D7 [get_ports {hex_seg[4]}] ; set_property IOSTANDARD LVCMOS25 [get_ports {hex_seg[4]}]
set_property PACKAGE_PIN D6 [get_ports {hex_seg[5]}] ; set_property IOSTANDARD LVCMOS25 [get_ports {hex_seg[5]}]
set_property PACKAGE_PIN C4 [get_ports {hex_seg[6]}] ; set_property IOSTANDARD LVCMOS25 [get_ports {hex_seg[6]}]   ;# confirmed
set_property PACKAGE_PIN B5 [get_ports {hex_seg[7]}] ; set_property IOSTANDARD LVCMOS25 [get_ports {hex_seg[7]}]

## =========================
## Discrete LEDs (Bval[0..7])
## =========================
set_property PACKAGE_PIN C13 [get_ports {Bval[0]}] ; set_property IOSTANDARD LVCMOS33 [get_ports {Bval[0]}]
set_property PACKAGE_PIN C14 [get_ports {Bval[1]}] ; set_property IOSTANDARD LVCMOS33 [get_ports {Bval[1]}]
set_property PACKAGE_PIN D14 [get_ports {Bval[2]}] ; set_property IOSTANDARD LVCMOS33 [get_ports {Bval[2]}]
set_property PACKAGE_PIN D15 [get_ports {Bval[3]}] ; set_property IOSTANDARD LVCMOS33 [get_ports {Bval[3]}]
set_property PACKAGE_PIN D16 [get_ports {Bval[4]}] ; set_property IOSTANDARD LVCMOS33 [get_ports {Bval[4]}]
set_property PACKAGE_PIN F18 [get_ports {Bval[5]}] ; set_property IOSTANDARD LVCMOS33 [get_ports {Bval[5]}]
set_property PACKAGE_PIN E17 [get_ports {Bval[6]}] ; set_property IOSTANDARD LVCMOS33 [get_ports {Bval[6]}]
set_property PACKAGE_PIN D17 [get_ports {Bval[7]}] ; set_property IOSTANDARD LVCMOS33 [get_ports {Bval[7]}]

## =========================
## Discrete LEDs (Aval[0..7])
## =========================
set_property PACKAGE_PIN C17 [get_ports {Aval[0]}] ; set_property IOSTANDARD LVCMOS33 [get_ports {Aval[0]}]
set_property PACKAGE_PIN B18 [get_ports {Aval[1]}] ; set_property IOSTANDARD LVCMOS33 [get_ports {Aval[1]}]
set_property PACKAGE_PIN A17 [get_ports {Aval[2]}] ; set_property IOSTANDARD LVCMOS33 [get_ports {Aval[2]}]
set_property PACKAGE_PIN B17 [get_ports {Aval[3]}] ; set_property IOSTANDARD LVCMOS33 [get_ports {Aval[3]}]
set_property PACKAGE_PIN C18 [get_ports {Aval[4]}] ; set_property IOSTANDARD LVCMOS33 [get_ports {Aval[4]}]
set_property PACKAGE_PIN D18 [get_ports {Aval[5]}] ; set_property IOSTANDARD LVCMOS33 [get_ports {Aval[5]}]
set_property PACKAGE_PIN E18 [get_ports {Aval[6]}] ; set_property IOSTANDARD LVCMOS33 [get_ports {Aval[6]}]
set_property PACKAGE_PIN G17 [get_ports {Aval[7]}] ; set_property IOSTANDARD LVCMOS33 [get_ports {Aval[7]}]

## =========================
## On-board RGB LEDs (pins as listed)
## =========================
set_property PACKAGE_PIN C9  [get_ports {LED[0]}] ; set_property IOSTANDARD LVCMOS33 [get_ports {LED[0]}]   ;# RGB0_R
set_property PACKAGE_PIN B11 [get_ports {LED[1]}] ; set_property IOSTANDARD LVCMOS33 [get_ports {LED[1]}]   ;# RGB1_B
set_property PACKAGE_PIN C10 [get_ports {LED[2]}] ; set_property IOSTANDARD LVCMOS33 [get_ports {LED[2]}]   ;# RGB1_G
set_property PACKAGE_PIN A11 [get_ports {LED[3]}] ; set_property IOSTANDARD LVCMOS33 [get_ports {LED[3]}]   ;# RGB1_R
