set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]


set_property PACKAGE_PIN J17 [get_ports {anodes[0]}] # G (middle)
set_property IOSTANDARD LVCMOS33 [get_ports {anodes[0]}]

set_property PACKAGE_PIN J18 [get_ports {anodes[1]}] # G (middle)
set_property IOSTANDARD LVCMOS33 [get_ports {anodes[1]}]

set_property PACKAGE_PIN T9 [get_ports {anodes[2]}] # G (middle)
set_property IOSTANDARD LVCMOS33 [get_ports {anodes[2]}]

set_property PACKAGE_PIN J14 [get_ports {anodes[3]}] # G (middle)
set_property IOSTANDARD LVCMOS33 [get_ports {anodes[3]}]

set_property PACKAGE_PIN P14 [get_ports {anodes[4]}] # G (middle)
set_property IOSTANDARD LVCMOS33 [get_ports {anodes[4]}]

set_property PACKAGE_PIN T14 [get_ports {anodes[5]}] # G (middle)
set_property IOSTANDARD LVCMOS33 [get_ports {anodes[5]}]

set_property PACKAGE_PIN K2 [get_ports {anodes[6]}] # G (middle)
set_property IOSTANDARD LVCMOS33 [get_ports {anodes[6]}]

set_property PACKAGE_PIN U13 [get_ports {anodes[7]}] # G (middle)
set_property IOSTANDARD LVCMOS33 [get_ports {anodes[7]}]

#cathodes
set_property PACKAGE_PIN T10 [get_ports {cathods[0]}] # G (middle)
set_property IOSTANDARD LVCMOS33 [get_ports {cathods[0]}]

set_property PACKAGE_PIN R10 [get_ports {cathods[1]}] # G (middle)
set_property IOSTANDARD LVCMOS33 [get_ports {cathods[1]}]

set_property PACKAGE_PIN K16 [get_ports {cathods[2]}] # G (middle)
set_property IOSTANDARD LVCMOS33 [get_ports {cathods[2]}]

set_property PACKAGE_PIN K13 [get_ports {cathods[3]}] # G (middle)
set_property IOSTANDARD LVCMOS33 [get_ports {cathods[3]}]

set_property PACKAGE_PIN P15 [get_ports {cathods[4]}] # G (middle)
set_property IOSTANDARD LVCMOS33 [get_ports {cathods[4]}]

set_property PACKAGE_PIN T11 [get_ports {cathods[5]}] # G (middle)
set_property IOSTANDARD LVCMOS33 [get_ports {cathods[5]}]

set_property PACKAGE_PIN L18 [get_ports {cathods[6]}] # G (middle)
set_property IOSTANDARD LVCMOS33 [get_ports {cathods[6]}]

set_property PACKAGE_PIN H15 [get_ports {cathods[7]}] # G (middle)
set_property IOSTANDARD LVCMOS33 [get_ports {cathods[7]}]
