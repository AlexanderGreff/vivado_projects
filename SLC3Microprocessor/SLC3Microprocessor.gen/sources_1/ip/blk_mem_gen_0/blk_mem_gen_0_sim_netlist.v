// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Wed Oct  1 18:10:27 2025
// Host        : alexander-LT running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/alexa/vivado_projects/SLC3Microprocessor/SLC3Microprocessor.gen/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_11,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_11,Vivado 2025.1" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [15:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [15:0]dina;
  wire [15:0]douta;
  wire ena;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [15:0]NLW_U0_doutb_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.51805 mW" *) 
  (* C_FAMILY = "spartan7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "16" *) 
  (* C_READ_WIDTH_B = "16" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "16" *) 
  (* C_WRITE_WIDTH_B = "16" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_0_blk_mem_gen_v8_4_11 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[15:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b1),
        .regceb(1'b1),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[15:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
gydSV72FvW4hnoyUt6yZFJHfJqjRQWPUfYIuDKP0fpjrPOkLRbJGBr4Z9msYTvoIHRlYtXJ2YMY0
d1TIQb+FK4gKsTRru9wr397OxuFBsTRf4e+ZjpYZEdsnqYWcgMSzhN4yhPvO06GyZO15y/LKBxa8
3OKwxVlOLYXhv+sxdXg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
WHB6Zbfa5Qi47krP9T4L8UnPOlr881dWx7UcYaZfNGIQQM0gadcoXbhucIpRaUuyOKxv6yhKveRN
h0l+N9+KX6rbZ6+TRhP9JAMuPhlpI7T42QtRv5zx9+m3ct5S0NMszbFaK8zeTAYra5BGP7BHmtkr
MpKfLK5sFyaTE/A7ACtAace9MwFTHDZdl9uUs4aY6KJlm6GaypKduiqkNugukJp5vlFPX/ZapJqG
KMtMhI6grhcuYb1FJrwRZ4jW7hs9HxddSdGLzsZ0HsBcO/qaCPTst+ZA0YIQfd5ULlFmPqq39FfO
p1P+2hEH2n+LycbMj5cn4Dxfqv2R8eucM78R3w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
SmAzQA1VEuJXtJi5vXa2Jg7YvRqAJs6PX9HTZ1YqrJw4VfonBW3726gJ81BjlizpMkcf/Uk5sFIK
aPedVhEs4xCIZylz7gXYDshtytOA/pXUID2qV9nXr8qfI+FydSADUF3ScYDZmlkclFqlZrGq6DQ7
da3lJAzt2h/iR+cczrA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
iAph5JWb/chMQpLPX1UoLjQDxN5l2I8McM/k2xN5wRht7HXoE6F5yV8luDjn3zkI6vnfUYo7BaI1
mogRRx+R3XcwxvhHr+lngh4+/YLVex1TFncl+kiUMAsu3M/FjFSiqGMVMdKTNLDqr35DuZJVyuiF
lTwXob/KkbQDJiJjBEoxbt+968rKRKRyJGcqIjm4mqRBdqMcgo3HOJFG74SFsWAQrxvXfBhdLSG3
OfoLfls9XDojBjp7G83k0h82g1eeWgBfydm/OcX9o48Pst93NvI4ua8WShZL8MCvRWYqWZrrjrWi
cfUjXAF5SDACjq1/OU6arz/Idz6/a7AP/jmexw==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BY49GZBxBT/gjZDPyaSWlti/sctckoR7jK6NuWdhnF9tiyNfVU7BqjjwxSnyMi0Uucv1BKHXC18h
8hQbFWnNtrq71ilURotXux7sssHlVJ2i1CsJWU18DOcBWxm2ai89uwvxDJh3TJkBJixB5KPvsDhL
lWOjTvZWPoR+Ixy+Tzo+U5Vx7z7SOakRwTrn3u7+c3vmCEBphE+HKeJExhBAoOEd0SXK5iwXaByW
D7Wb7zq6NNUmnCyaJ2BG9kGxLVsf+md7SlocuaFsYyaRZhwPyTucxIlz1tLYwcytKzx0ovoax3no
nYgzlzP/F0/PDWk9BqXgr/tuclc4EZYX0cf4ng==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qGnCvL35qO7cbUEKCL50yDv1UvezcqBz601zctKop1954QlcjemzZWZHg1zJ00nJaToNdH2S8AKX
n8hNJvbQ+x5HEGL5DoSU9m5qjXd8xxocnZ0yzuZX/dGCT8kDn3gWJR2Gz13pT+w2LQUno1fX+MsC
ehgwvjBBT6GeYjdxHi+aybQUP9AblSxX/z3vh857SGCPohEWvghOgORCHAe45YD+ZWnL62FLxMM2
c+Ozq/Au/Q4q1Yzlzcfv8Mnsvg7OqOeEamQHbuYOfdkJUuYqOwsskEWW348u7FXtsf8m7P3pZyyz
IWyTDAW4igGguMPLHfbtK/twZx8ScJQmOKzglg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Hz+6K8+wh5/fukU4ZWNDXGsq6hreSVCSPP67nA6kUz9Vpjy4TtTnOrrl1BWY0ivEC7Ldyw8VI60A
VO/WPlt409LdAZdMZGsEZ1JuTZ0m9LPcgu9CPCyoMECctmd8LHE+otY6etTmYABB9syY61rk2hrv
RgbcyT/HCK9TzWxSm+XMqvx2nvagCLkMDPh/JZv51fj2zcKaBPnxsz8rnDipaeo0fEyVRC3Y1F/V
U3RmXojBjIumPHSJkQ537dENJEIA0Ra65u8EM/+ItUn1bcryLcIbKy1xGadrHmHdHRUoRcAodO2C
B48bNVeL0VnGg8P9ACIB04lMNzn5p6A1tPOb4Q==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
YDpb+UeT0rJ543Q8wCo2xSS3gpVAT+JoStgBlV5IMjJoUOWkiOPn691FGChmDi3BTq5NxC73KHHR
1galACCjeTGq6cv+0Zc2Ocm1oobdrnSPHp7TMDr5Zle8FX6WywJCiGdoWBODggZSlbOASIK/PVfY
cZM2z60M6RSvzsi3TnYHiKYHpju8THVoSgRd6r31GcbiSy9TjjARERXan0OVc79jGuAg90mmDEEq
91eqmn6NZ9yLI2fgBjFUZbtFCpmJ8WGxOL1h39niWnRK3ZXnk8jcpnZUlxLbYTPO0Z3vVr1zrvcn
RVQloU0OLqg7M95zSs7NtX5Vzvb6jGbMehWV+WMMyxWmxL2XOwsAwPSeX2dI2r77pioY7X6VzH7f
/JxMAnq9udra3WGPsUkD1G0CvPkCC3zdxjpVaflY37ztX9UONhKtzMQa8lJc1IL8GhXRY3R9Lg2c
HIeXSGkpNNuFDqKT6Khe/6Casq+SjFJq+IH9IUtz6RUZTkbFb0Xhgm2P

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Q+63zFEYw/LeMgxa7g8g79GGvSyIKDKD8RvvC4DHDQuGObf6n9OGZX4e17v/E/+EDEwUhsWQHFDI
Lp/aH+6fNRmhu9BEWVjxq2WRrQSl4eQjfIaSOXu2dlYh3JjRJwiUp4LteVh8RFAf5t5sRQO4dRIK
x+h28yliSgibaWEAv5FaJQ1EFbNwmgedAaSYjgf2A3afBUcBh5Uy9VHbW/zRzdhhJdsVNBjZYcFy
CVLOcf1toCRp8J4U5FlnFMOzFegUbdXFQhq2VmIhPRxWjrfTk6iR4BcMEN9UMij/5IHRAeBdksyD
CqEKsyFxosbI5KVMRZ1Ln75Zipn0JdsGekHkxg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DPUa5DLPYRWvbPnX0U412yoWvvvHyuq43DrYmDJGTK0cR5U4U6th8icYgizC1/hUAEzt19kM/hVa
zZh7bXSWACYLpcfhPY8dRTVGDZVjpbkraw0ceBryLP7jc6Jt5JdNw88tZtZpprCB7nQ25lUL82Hf
WTwL1ZqgGIvtfHhxO0JF5L5ES5giedwQ6u5ffXG3UB6ELcpQD1NvpW5lAz4mfXyvVDCAPZN581TF
tlAy79iKbPKlJ2zFn1BS2cuRIHHe2JRxwPo+0n5VD5CXVgg+lCYxTnCxI8CdyFaTumbs4IfAKwVI
wSN/btbwDUhW9hAHWHIRo+BpdJ4qeGcTDPKtsA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mf5hcf6JE6yLm0jNCQnHMVmogjLlPz6re0FwG67yvOJ3FuEorru0emIeAKEwgOoxjUYNWvcM7QAH
/UEeB2EIdjLl6glPAUda0HjtaCU2rdncVdM8k6DSMBggc4yo18Qx5F+1TD/RoBgoo0jNkMdDy6wJ
JHjqlN+R01z3yYIMQ9f2z6ZaYncbBYEp4+YAb7g1D7CSMxP5cFRpQznRpYp0JwqJfT9CHzlKgdab
8B288NxeLM66iYodiTS+GSRGLGtDWXpz9yeiuiPe6kJxae2GJyHIMSfluO/0Slc3m24DQNdbojf8
jdc0G2UnrDe5mCUTfYiDmpOWTUJOdYo0FK0N2g==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18928)
`pragma protect data_block
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
CtK2lg==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
