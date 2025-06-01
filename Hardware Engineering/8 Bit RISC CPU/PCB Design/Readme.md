´´´´ bash

├── /schematic/             # KiCad schematic files
├── /pcb_layout/            # PCB layout design files
├── /block_diagram/         # Block diagram showing system architecture
├── /errors_and_fixes/      # Notes on schematic/layout errors and solutions
├── README.md               # You're here!

´´´´
### Overview
This board is designed for FPGA prototyping with the following key features:

-  FPGA: Lattice iCE40UP5K-SG48ITR50

- Power Supply: 3.3V and 1.2V LDO regulators

- Programming Interface: FT2232HL (USB-to-SPI/UART)

- Peripherals:

- 1. 4-digit 7-segment display (HDSP-B09G)

- 2. Push button for reset

- 3. DONE LED indicator

- Clock: 16 MHz oscillator

- Memory: SPI Flash (W25Q128) for configuration

