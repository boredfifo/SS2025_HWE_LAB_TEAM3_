set_property PACKAGE_PIN E3 [get_ports clock]
set_property IOSTANDARD LVCMOS33 [get_ports clock]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clock]

#anodes
set_property PACKAGE_PIN J17 [get_ports {finalAnodes[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {finalAnodes[0]}]

set_property PACKAGE_PIN J18 [get_ports {finalAnodes[1]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {finalAnodes[1]}]

set_property PACKAGE_PIN T9 [get_ports {finalAnodes[2]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {finalAnodes[2]}]

set_property PACKAGE_PIN J14 [get_ports {finalAnodes[3]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {finalAnodes[3]}]

set_property PACKAGE_PIN P14 [get_ports {finalAnodes[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {finalAnodes[4]}]

set_property PACKAGE_PIN T14 [get_ports {finalAnodes[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {finalAnodes[5]}]

set_property PACKAGE_PIN K2 [get_ports {finalAnodes[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {finalAnodes[6]}]

set_property PACKAGE_PIN U13 [get_ports {finalAnodes[7]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {finalAnodes[7]}]

#cathodes
set_property PACKAGE_PIN L18 [get_ports {finalOut[0]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {finalOut[0]}]

set_property PACKAGE_PIN R10 [get_ports {finalOut[1]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {finalOut[1]}]

set_property PACKAGE_PIN T10 [get_ports {finalOut[2]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {finalOut[2]}]

set_property PACKAGE_PIN T11 [get_ports {finalOut[3]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {finalOut[3]}]

set_property PACKAGE_PIN P15 [get_ports {finalOut[4]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {finalOut[4]}]

set_property PACKAGE_PIN K13 [get_ports {finalOut[5]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {finalOut[5]}]

set_property PACKAGE_PIN K16 [get_ports {finalOut[6]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {finalOut[6]}]

set_property PACKAGE_PIN H15 [get_ports {finalOut[7]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {finalOut[7]}]


#decider
set_property PACKAGE_PIN R17 [get_ports {additionOrSubtraction}] 
set_property IOSTANDARD LVCMOS33 [get_ports {additionOrSubtraction}]


#firstNummer
set_property PACKAGE_PIN J15 [get_ports {binary_0[0]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {binary_0[0]}]

set_property PACKAGE_PIN L16 [get_ports {binary_0[1]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {binary_0[1]}]

set_property PACKAGE_PIN M13 [get_ports {binary_0[2]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {binary_0[2]}]

set_property PACKAGE_PIN R15 [get_ports {binary_0[3]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {binary_0[3]}]

#secondNummer
set_property PACKAGE_PIN H6 [get_ports {binary_1[0]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {binary_1[0]}]

set_property PACKAGE_PIN U12 [get_ports {binary_1[1]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {binary_1[1]}]

set_property PACKAGE_PIN U11 [get_ports {binary_1[2]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {binary_1[2]}]

set_property PACKAGE_PIN V10 [get_ports {binary_1[3]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {binary_1[3]}]

