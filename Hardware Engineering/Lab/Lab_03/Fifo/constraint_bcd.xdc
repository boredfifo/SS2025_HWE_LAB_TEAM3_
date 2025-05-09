###############################################################################
# 4-bit inputs  a[3:0]  (SW0-SW3)
###############################################################################
set_property -dict { PACKAGE_PIN J15 IOSTANDARD LVCMOS33 } [get_ports {a[0]}] ;#SW0
set_property -dict { PACKAGE_PIN L16 IOSTANDARD LVCMOS33 } [get_ports {a[1]}] ;#SW1
set_property -dict { PACKAGE_PIN M13 IOSTANDARD LVCMOS33 } [get_ports {a[2]}] ;#SW2
set_property -dict { PACKAGE_PIN R15 IOSTANDARD LVCMOS33 } [get_ports {a[3]}] ;#SW3

###############################################################################
# 4-bit inputs  b[3:0]  (SW4-SW7)
###############################################################################
set_property -dict { PACKAGE_PIN R17 IOSTANDARD LVCMOS33 } [get_ports {b[0]}] ;#SW4
set_property -dict { PACKAGE_PIN T18 IOSTANDARD LVCMOS33 } [get_ports {b[1]}] ;#SW5
set_property -dict { PACKAGE_PIN U18 IOSTANDARD LVCMOS33 } [get_ports {b[2]}] ;#SW6
set_property -dict { PACKAGE_PIN R13 IOSTANDARD LVCMOS33 } [get_ports {b[3]}] ;#SW7

###############################################################################
# Add/Sub mode switch  k_FPGA  (SW8 - bank 34, 1.8 V!)
###############################################################################
set_property -dict { PACKAGE_PIN T8  IOSTANDARD LVCMOS18 } [get_ports k_FPGA] ;#SW8

###############################################################################
# Result LEDs  S_FPGA[3:0]  (LD0-LD3)
###############################################################################
set_property -dict { PACKAGE_PIN H17 IOSTANDARD LVCMOS33 } [get_ports {S_FPGA[0]}] ;#LD0
set_property -dict { PACKAGE_PIN K15 IOSTANDARD LVCMOS33 } [get_ports {S_FPGA[1]}] ;#LD1
set_property -dict { PACKAGE_PIN J13 IOSTANDARD LVCMOS33 } [get_ports {S_FPGA[2]}] ;#LD2
set_property -dict { PACKAGE_PIN N14 IOSTANDARD LVCMOS33 } [get_ports {S_FPGA[3]}] ;#LD3

###############################################################################
# Seven-segment display  segments  DISP(6 downto 0)
#   index 0=A … 6=G
###############################################################################
set_property -dict { PACKAGE_PIN T10 IOSTANDARD LVCMOS33 } [get_ports {DISP[0]}] ;#A
set_property -dict { PACKAGE_PIN R10 IOSTANDARD LVCMOS33 } [get_ports {DISP[1]}] ;#B
set_property -dict { PACKAGE_PIN K16 IOSTANDARD LVCMOS33 } [get_ports {DISP[2]}] ;#C
set_property -dict { PACKAGE_PIN K13 IOSTANDARD LVCMOS33 } [get_ports {DISP[3]}] ;#D
set_property -dict { PACKAGE_PIN P15 IOSTANDARD LVCMOS33 } [get_ports {DISP[4]}] ;#E
set_property -dict { PACKAGE_PIN T11 IOSTANDARD LVCMOS33 } [get_ports {DISP[5]}] ;#F
set_property -dict { PACKAGE_PIN L18 IOSTANDARD LVCMOS33 } [get_ports {DISP[6]}] ;#G

###############################################################################
# Optional: enable only digit 0 (active-low anode)
###############################################################################
set_property -dict { PACKAGE_PIN J17 IOSTANDARD LVCMOS33 } [get_ports an[0]] ;#AN0
set_property -dict { PACKAGE_PIN J18 IOSTANDARD LVCMOS33 } [get_ports an[1]]
set_property -dict { PACKAGE_PIN T9 IOSTANDARD LVCMOS33 } [get_ports an[2]]
set_property -dict { PACKAGE_PIN J14 IOSTANDARD LVCMOS33 } [get_ports an[3]]

set_property -dict { PACKAGE_PIN P14 IOSTANDARD LVCMOS33 } [get_ports pmod[3]]
set_property -dict { PACKAGE_PIN T14 IOSTANDARD LVCMOS33 } [get_ports pmod[2]]
set_property -dict { PACKAGE_PIN K2 IOSTANDARD LVCMOS33 } [get_ports pmod[1]]
set_property -dict { PACKAGE_PIN U13 IOSTANDARD LVCMOS33 } [get_ports pmod[0]]
