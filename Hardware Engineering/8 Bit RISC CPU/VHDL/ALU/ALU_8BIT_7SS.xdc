#clock
set_property PACKAGE_PIN E3 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
#anodes
set_property PACKAGE_PIN J17 [get_ports {anodes[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {anodes[0]}]

set_property PACKAGE_PIN J18 [get_ports {anodes[1]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {anodes[1]}]

set_property PACKAGE_PIN T9 [get_ports {anodes[2]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {anodes[2]}]

set_property PACKAGE_PIN J14 [get_ports {anodes[3]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {anodes[3]}]

set_property PACKAGE_PIN P14 [get_ports {anodes[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {anodes[4]}]

set_property PACKAGE_PIN T14 [get_ports {anodes[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {anodes[5]}]

set_property PACKAGE_PIN K2 [get_ports {anodes[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {anodes[6]}]

set_property PACKAGE_PIN U13 [get_ports {anodes[7]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {anodes[7]}]

#cathodes
set_property PACKAGE_PIN L18 [get_ports {display[0]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {display[0]}]

set_property PACKAGE_PIN R10 [get_ports {display[1]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {display[1]}]

set_property PACKAGE_PIN T10 [get_ports {display[2]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {display[2]}]

set_property PACKAGE_PIN T11 [get_ports {display[3]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {display[3]}]

set_property PACKAGE_PIN P15 [get_ports {display[4]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {display[4]}]

set_property PACKAGE_PIN K13 [get_ports {display[5]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {display[5]}]

set_property PACKAGE_PIN K16 [get_ports {display[6]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {display[6]}]

set_property PACKAGE_PIN H15 [get_ports {display[7]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {display[7]}]




##Switches
set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { A[0] }]; #IO_L24N_T3_RS0_15 Sch=sw[0]
set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33 } [get_ports { A[1] }]; #IO_L3N_T0_DQS_EMCCLK_14 Sch=sw[1]
set_property -dict { PACKAGE_PIN M13   IOSTANDARD LVCMOS33 } [get_ports { A[2] }]; #IO_L6N_T0_D08_VREF_14 Sch=sw[2]
set_property -dict { PACKAGE_PIN R15   IOSTANDARD LVCMOS33 } [get_ports { A[3] }]; #IO_L13N_T2_MRCC_14 Sch=sw[3]
set_property -dict { PACKAGE_PIN R17   IOSTANDARD LVCMOS33 } [get_ports { A[4] }]; #IO_L12N_T1_MRCC_14 Sch=sw[4]
set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports { A[5] }]; #IO_L7N_T1_D10_14 Sch=sw[5]
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports { A[6] }]; #IO_L17N_T2_A13_D29_14 Sch=sw[6]
set_property -dict { PACKAGE_PIN R13   IOSTANDARD LVCMOS33 } [get_ports { A[7] }]; #IO_L5N_T0_D07_14 Sch=sw[7]
set_property -dict { PACKAGE_PIN T8    IOSTANDARD LVCMOS18 } [get_ports { B[0] }]; #IO_L24N_T3_34 Sch=sw[8]
set_property -dict { PACKAGE_PIN U8    IOSTANDARD LVCMOS18 } [get_ports { B[1] }]; #IO_25_34 Sch=sw[9]
set_property -dict { PACKAGE_PIN R16   IOSTANDARD LVCMOS33 } [get_ports { B[2] }]; #IO_L15P_T2_DQS_RDWR_B_14 Sch=sw[10]
set_property -dict { PACKAGE_PIN T13   IOSTANDARD LVCMOS33 } [get_ports { B[3] }]; #IO_L23P_T3_A03_D19_14 Sch=sw[11]
set_property -dict { PACKAGE_PIN H6    IOSTANDARD LVCMOS33 } [get_ports { B[4] }]; #IO_L24P_T3_35 Sch=sw[12]
set_property -dict { PACKAGE_PIN U12   IOSTANDARD LVCMOS33 } [get_ports { B[5] }]; #IO_L20P_T3_A08_D24_14 Sch=sw[13]
set_property -dict { PACKAGE_PIN U11   IOSTANDARD LVCMOS33 } [get_ports { B[6] }]; #IO_L19N_T3_A09_D25_VREF_14 Sch=sw[14]
set_property -dict { PACKAGE_PIN V10   IOSTANDARD LVCMOS33 } [get_ports { B[7] }]; #IO_L21P_T3_DQS_14 Sch=sw[15]

#LEDs
set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { LED[0] }]; #IO_L18P_T2_A24_15 Sch=led[0]
set_property -dict { PACKAGE_PIN K15   IOSTANDARD LVCMOS33 } [get_ports { LED[1] }]; #IO_L24P_T3_RS1_15 Sch=led[1]
set_property -dict { PACKAGE_PIN J13   IOSTANDARD LVCMOS33 } [get_ports { LED[2] }]; #IO_L17N_T2_A25_15 Sch=led[2]
set_property -dict { PACKAGE_PIN N14   IOSTANDARD LVCMOS33 } [get_ports { LED[3] }]; #IO_L8P_T1_D11_14 Sch=led[3]
set_property -dict { PACKAGE_PIN R18   IOSTANDARD LVCMOS33 } [get_ports { LED[4] }]; #IO_L7P_T1_D09_14 Sch=led[4]

#Buttons
set_property -dict { PACKAGE_PIN N17   IOSTANDARD LVCMOS33 } [get_ports { F0 }]; #IO_L9P_T1_DQS_14 Sch=btnc
set_property -dict { PACKAGE_PIN M18   IOSTANDARD LVCMOS33 } [get_ports { F1 }]; #IO_L4N_T0_D05_14 Sch=btnu
set_property -dict { PACKAGE_PIN P17   IOSTANDARD LVCMOS33 } [get_ports { EN_A }]; #IO_L12P_T1_MRCC_14 Sch=btnl
#set_property -dict { PACKAGE_PIN P17   IOSTANDARD LVCMOS33 } [get_ports { EN_B }]; #IO_L10N_T1_D15_14 Sch=btnr
set_property -dict { PACKAGE_PIN M17   IOSTANDARD LVCMOS33 } [get_ports { CarryIn }]; #IO_L10N_T1_D15_14 Sch=btnr
set_property -dict { PACKAGE_PIN P18   IOSTANDARD LVCMOS33 } [get_ports { INV_A }]; #IO_L9N_T1_DQS_D13_14 Sch=btnd
