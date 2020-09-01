# Micro Advanced Motor Drive Controller (uAMDC) Hardware

This document describes the design requirements, implementation details, and similarities/differences between the uAMDC and AMDC platform. A high level block diagram of the uAMDC is presented and 3D images of the uAMDC and AMDC are shown to easily compare the two platforms. 

## Relevant Hardware Versions: 
REVA

## Design Requirements

The uAMDC board was designed with the following requirements: 
1. Motor drive peripherals on the uAMDC should be in the same relative locations as the AMDC such that the boards are easily swappable. 
2. The uAMDC should have half the number of power stack interfaces. 
3. The uAMDC should be significantly smaller than the AMDC.
4. Mounting holes on the uAMDC should be in the same location as the AMDC.

## uAMDC v. AMDC

### Systems on Board
Below is a table that compares the processing technologies, host interface, and motor drive peripherals between the uAMDC and the AMDC. 
|                   | uAMDC               | AMDC                |
|-------------------| --------------------|---------------------|
| Processing        | STM DSP and FPGA    | PicoZed             |
| Analog Inputs     | 8x                  | 8x                  |
| Encoder Interface | 2x Quadrature       | 2x Quadrature       |
| Power Stack Interface      | 4x three phase PWM  | 8x three phase PWM  |
| GPIO Exapansion Interface  | 2x                  | 2x                 |
| Host Interface    | Ethernet, USB-UART, USB | Ethernet, USB-UART      |
| Debug Interface   | SWD Debug           | JTAG Debug          |

The major differences between the two platforms are:
1. The expensive PicoZed that has a FPGA and DSP as a unit is replaced with two distinct devices: an STM DSP and iCE Lattice FPGA.
2. The number of power stack interfaces on the uAMDC is half the amount that the AMDC has.

### Shape and Size
The shape and size of the uAMDC were determined based on the design requirement that the mounting holes on the uAMDC should be in the same location as the AMDC. The board sizes are listed below:

- uAMDC: 4.34 x 5.12 inches
- AMDC:  6.00 x 6.75 inches

Below is a diagram to better illustrate the mounting hole locations and size differences between the two boards. The yellow X marks a mouting hole location on the AMDC board. The mounting holes on the bottom and right side of the uAMDC are in the exact same locations as the mounting holes on the AMDC. 


### Connector Locations
Below are 3D images of the uAMDC and the AMDC illustrating how the connectors on the uAMDC are in the same relative locations as the AMDC. Motor drive peripherals were placed close to the FPGA and the host interface systems are nearby the DSP.


## Processing (DSP + FPGA)

The DSP and FPGA on the uAMDC together handle the functionality similar to the PicoZed on the AMDC. Because two distinct devices were chosen, there is a clear separation of tasks between the two:
- The DSP communicates with the host and handles the application processing.
- The FPGA interfaces with the motor drive peripherals and handles the bulk of the I/O.

Below is a high level block diagram to easily visualize the purpose of the DSP and FPGA. 

Insert block diagram here...


### DSP and FPGA Communication

Unlike the AMDC, the communication between the DSP and FPGA must be handled directly. There were three options that were being considered for the communication interface, all of which are available peripherals on the STM DSP: 
1. Normal SPI
2. Quad SPI
3. Flexible Memory Controller Interface (FMC)

With the goal of sending data as quickly as possible between the two devices, the FMC interface was chosen because the data line bus width could be 8-, 16-, or 32-bits. Out of the three options, this communication interface sends the most data in one clock cycle between the two devices. 

The Flexible Memory Controller (FMC) is an internal controller on the DSP to connect to external memories, including SRAM, PSRAM, SDRAM, NOR Flash, and NAND Flash. Verilog will be used to model SRAM memory within the FPGA to communicate between the two devices. Upon startup, there is a configuration SPI bus that will be used to send a bitstream from the DSP to the FPGA. The table below describes the pinout between the two devices for communication. 

| Signal Name | Description |
|-------------|-------------|
| FMC_D[0..7] | 8-bit bidirectional data bus |
| FMC_A[0..7] | 8-bit address bus
| FMC_NE[1..4]| Memory bank select (always bank 1 for SRAM)
| FMC_NBL[0..1] | Chip select (4 subanks within a bank)
| FMC_NWE | Memory write enable
| FMC_NOE | Memory output enable

An extra high speed SPI bus has been connected between the two devices as a back up communication option.

## Motor Drive Peripherals

The motor drive peripherals are the exact same as the AMDC. Extensive documentation on the peripherals can be found in the AMDC documentation.