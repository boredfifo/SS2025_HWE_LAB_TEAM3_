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
set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports { display[0] }]; #IO_L24N_T3_A00_D16_14 Sch=ca
set_property -dict { PACKAGE_PIN R10   IOSTANDARD LVCMOS33 } [get_ports { display[1] }]; #IO_25_14 Sch=cb
set_property -dict { PACKAGE_PIN K16   IOSTANDARD LVCMOS33 } [get_ports { display[2] }]; #IO_25_15 Sch=cc
set_property -dict { PACKAGE_PIN K13   IOSTANDARD LVCMOS33 } [get_ports { display[3] }]; #IO_L17P_T2_A26_15 Sch=cd
set_property -dict { PACKAGE_PIN P15   IOSTANDARD LVCMOS33 } [get_ports { display[4] }]; #IO_L13P_T2_MRCC_14 Sch=ce
set_property -dict { PACKAGE_PIN T11   IOSTANDARD LVCMOS33 } [get_ports { display[5] }]; #IO_L19P_T3_A10_D26_14 Sch=cf
set_property -dict { PACKAGE_PIN L18   IOSTANDARD LVCMOS33 } [get_ports { display[6] }]; #IO_L4P_T0_D04_14 Sch=cg
set_property -dict { PACKAGE_PIN H15   IOSTANDARD LVCMOS33 } [get_ports { display[7] }]; #IO_L19N_T3_A21_VREF_15 Sch=dp
set_property PACKAGE_PIN T10 [get_ports {display[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {display[0]}]

set_property PACKAGE_PIN R10 [get_ports {display[1]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {display[1]}]

set_property PACKAGE_PIN K16 [get_ports {display[2]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {display[2]}]

set_property PACKAGE_PIN K13 [get_ports {display[3]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {display[3]}]

set_property PACKAGE_PIN P15 [get_ports {display[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {display[4]}]

set_property PACKAGE_PIN T11 [get_ports {display[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {display[5]}]

set_property PACKAGE_PIN L18 [get_ports {display[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {display[6]}]

set_property PACKAGE_PIN H15 [get_ports {display[7]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {display[7]}]
#switches

set_property PACKAGE_PIN J15 [get_ports {F0}] 
set_property IOSTANDARD LVCMOS33 [get_ports {F0}]

set_property PACKAGE_PIN L16 [get_ports {F1}] 
set_property IOSTANDARD LVCMOS33 [get_ports {F1}]

set_property PACKAGE_PIN H6 [get_ports {A}] 
set_property IOSTANDARD LVCMOS33 [get_ports {A}]

set_property PACKAGE_PIN U12 [get_ports {EN_A}] 
set_property IOSTANDARD LVCMOS33 [get_ports {EN_A}]

set_property PACKAGE_PIN U11 [get_ports {B}] 
set_property IOSTANDARD LVCMOS33 [get_ports {B}]

set_property PACKAGE_PIN V10 [get_ports {EN_B}] 
set_property IOSTANDARD LVCMOS33 [get_ports {EN_B}]

set_property PACKAGE_PIN T13 [get_ports {INV_A}] 
set_property IOSTANDARD LVCMOS33 [get_ports {INV_A}]

set_property PACKAGE_PIN R16 [get_ports {CarryIn}] 
set_property IOSTANDARD LVCMOS33 [get_ports {CarryIn}]
