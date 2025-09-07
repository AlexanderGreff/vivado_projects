## Real Digital Urbana (V2I1) — Constraints for 8-bit Processor top (module Processor)
## Matches port names exactly as in Processor.sv
## Clock
set_property -dict { PACKAGE_PIN N15 IOSTANDARD LVCMOS33 } [get_ports {Clk}]
create_clock -period 10.000 -name sys_clk_100MHz [get_ports {Clk}]

## Global config (consistent with reference XDC)
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property BITSTREAM.Config.SPI_buswidth 4 [current_design]

## ----------------------
## Inputs: Slide Switches
## ----------------------
## Din[7:0]  -> SW[7:0]
set_property -dict { PACKAGE_PIN G1 IOSTANDARD LVCMOS25 } [get_ports {Din[0]}]   ;# SW0
set_property -dict { PACKAGE_PIN F2 IOSTANDARD LVCMOS25 } [get_ports {Din[1]}]   ;# SW1
set_property -dict { PACKAGE_PIN F1 IOSTANDARD LVCMOS25 } [get_ports {Din[2]}]   ;# SW2
set_property -dict { PACKAGE_PIN E2 IOSTANDARD LVCMOS25 } [get_ports {Din[3]}]   ;# SW3
set_property -dict { PACKAGE_PIN E1 IOSTANDARD LVCMOS25 } [get_ports {Din[4]}]   ;# SW4
set_property -dict { PACKAGE_PIN D2 IOSTANDARD LVCMOS25 } [get_ports {Din[5]}]   ;# SW5
set_property -dict { PACKAGE_PIN D1 IOSTANDARD LVCMOS25 } [get_ports {Din[6]}]   ;# SW6
set_property -dict { PACKAGE_PIN C2 IOSTANDARD LVCMOS25 } [get_ports {Din[7]}]   ;# SW7

## F[2:0] -> SW[10:8]
set_property -dict { PACKAGE_PIN B2 IOSTANDARD LVCMOS25 } [get_ports {F[0]}]     ;# SW8
set_property -dict { PACKAGE_PIN A4 IOSTANDARD LVCMOS25 } [get_ports {F[1]}]     ;# SW9
set_property -dict { PACKAGE_PIN A5 IOSTANDARD LVCMOS25 } [get_ports {F[2]}]     ;# SW10

## R[1:0] -> SW[12:11]
set_property -dict { PACKAGE_PIN A6 IOSTANDARD LVCMOS25 } [get_ports {R[0]}]     ;# SW11
set_property -dict { PACKAGE_PIN C7 IOSTANDARD LVCMOS25 } [get_ports {R[1]}]     ;# SW12

## ----------------------
## Inputs: Push Buttons
## ----------------------
## Reset=BTN0, LoadA=BTN1, LoadB=BTN2, Execute=BTN3
set_property -dict { PACKAGE_PIN J2 IOSTANDARD LVCMOS25 } [get_ports {Reset}]    ;# BTN0
set_property -dict { PACKAGE_PIN J1 IOSTANDARD LVCMOS25 } [get_ports {LoadA}]    ;# BTN1
set_property -dict { PACKAGE_PIN G2 IOSTANDARD LVCMOS25 } [get_ports {LoadB}]    ;# BTN2
set_property -dict { PACKAGE_PIN H2 IOSTANDARD LVCMOS25 } [get_ports {Execute}]  ;# BTN3

## --------------------------------
## Outputs: Seven-Segment (DISP0)
## --------------------------------
## hex_grid[3:0] are digit enables (Active-LOW through PNP drivers)
set_property -dict { PACKAGE_PIN G6 IOSTANDARD LVCMOS25 } [get_ports {hex_grid[0]}]
set_property -dict { PACKAGE_PIN H6 IOSTANDARD LVCMOS25 } [get_ports {hex_grid[1]}]
set_property -dict { PACKAGE_PIN C3 IOSTANDARD LVCMOS25 } [get_ports {hex_grid[2]}]
set_property -dict { PACKAGE_PIN B3 IOSTANDARD LVCMOS25 } [get_ports {hex_grid[3]}]

## hex_seg[7:0] are segments CA..CG,DP (Active-LOW)
set_property -dict { PACKAGE_PIN E6 IOSTANDARD LVCMOS25 } [get_ports {hex_seg[0]}]  ;# CA
set_property -dict { PACKAGE_PIN B4 IOSTANDARD LVCMOS25 } [get_ports {hex_seg[1]}]  ;# CB
set_property -dict { PACKAGE_PIN D5 IOSTANDARD LVCMOS25 } [get_ports {hex_seg[2]}]  ;# CC
set_property -dict { PACKAGE_PIN C5 IOSTANDARD LVCMOS25 } [get_ports {hex_seg[3]}]  ;# CD
set_property -dict { PACKAGE_PIN D7 IOSTANDARD LVCMOS25 } [get_ports {hex_seg[4]}]  ;# CE
set_property -dict { PACKAGE_PIN D6 IOSTANDARD LVCMOS25 } [get_ports {hex_seg[5]}]  ;# CF
set_property -dict { PACKAGE_PIN C4 IOSTANDARD LVCMOS25 } [get_ports {hex_seg[6]}]  ;# CG
set_property -dict { PACKAGE_PIN B5 IOSTANDARD LVCMOS25 } [get_ports {hex_seg[7]}]  ;# DP

## --------------------------------
## Outputs: Green LEDs (16x)
## --------------------------------
## Map Bval[7:0] to LED[7:0]
set_property -dict { PACKAGE_PIN C13 IOSTANDARD LVCMOS33 } [get_ports {Bval[0]}]  ;# LED0
set_property -dict { PACKAGE_PIN C14 IOSTANDARD LVCMOS33 } [get_ports {Bval[1]}]  ;# LED1
set_property -dict { PACKAGE_PIN D14 IOSTANDARD LVCMOS33 } [get_ports {Bval[2]}]  ;# LED2
set_property -dict { PACKAGE_PIN D15 IOSTANDARD LVCMOS33 } [get_ports {Bval[3]}]  ;# LED3
set_property -dict { PACKAGE_PIN D16 IOSTANDARD LVCMOS33 } [get_ports {Bval[4]}]  ;# LED4
set_property -dict { PACKAGE_PIN F18 IOSTANDARD LVCMOS33 } [get_ports {Bval[5]}]  ;# LED5
set_property -dict { PACKAGE_PIN E17 IOSTANDARD LVCMOS33 } [get_ports {Bval[6]}]  ;# LED6
set_property -dict { PACKAGE_PIN D17 IOSTANDARD LVCMOS33 } [get_ports {Bval[7]}]  ;# LED7

## Map Aval[7:0] to LED[15:8]
set_property -dict { PACKAGE_PIN C17 IOSTANDARD LVCMOS33 } [get_ports {Aval[0]}]  ;# LED8
set_property -dict { PACKAGE_PIN B18 IOSTANDARD LVCMOS33 } [get_ports {Aval[1]}]  ;# LED9
set_property -dict { PACKAGE_PIN A17 IOSTANDARD LVCMOS33 } [get_ports {Aval[2]}]  ;# LED10
set_property -dict { PACKAGE_PIN B17 IOSTANDARD LVCMOS33 } [get_ports {Aval[3]}]  ;# LED11
set_property -dict { PACKAGE_PIN C18 IOSTANDARD LVCMOS33 } [get_ports {Aval[4]}]  ;# LED12
set_property -dict { PACKAGE_PIN D18 IOSTANDARD LVCMOS33 } [get_ports {Aval[5]}]  ;# LED13
set_property -dict { PACKAGE_PIN E18 IOSTANDARD LVCMOS33 } [get_ports {Aval[6]}]  ;# LED14
set_property -dict { PACKAGE_PIN G17 IOSTANDARD LVCMOS33 } [get_ports {Aval[7]}]  ;# LED15

## -----------------------------
## Outputs: Debug LED[3:0]
## -----------------------------
## Route the 4-bit debug bus to the RGB LEDs channels (LVCMOS33)
set_property -dict { PACKAGE_PIN C9  IOSTANDARD LVCMOS33 } [get_ports {LED[0]}]   ;# RGB0_R
set_property -dict { PACKAGE_PIN B11 IOSTANDARD LVCMOS33 } [get_ports {LED[1]}]   ;# RGB1_B
set_property -dict { PACKAGE_PIN C10 IOSTANDARD LVCMOS33 } [get_ports {LED[2]}]   ;# RGB1_G
set_property -dict { PACKAGE_PIN A11 IOSTANDARD LVCMOS33 } [get_ports {LED[3]}]   ;# RGB1_R
