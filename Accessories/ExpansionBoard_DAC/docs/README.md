
# AMDC DAC Expansion Board

This document describes the design considerations and implementation details for the AMDC DAC expansion board. A block diagram is presented and each component is discussed in detail. Specifications of each component are provided based on the datasheet.

## Relevant Hardware Versions

| Hardware | Version |
| ---- | ----- |
| AMDC | REV D |
| DAC Board | REV B |

## Design Requirements and Considerations

The AMDC DAC expansion board was designed with the following requirements:
1. Work with both the IsoSPI and power stack ports through a single DB15 connector
2. Minimal I/O data lines as possible (simplified SPI interface I.E. CS, SCLK, MOSI)
3. All digital and power signals on the board are isolated from the AMDC
4. Operate the DAC fast enough such that all channels have a throughput of at least 20ksps
5. Slew rate > 1V/us
6. 12 bit samples
7. Output Voltage: +/- 10V on all channels

## Block Diagram / External Connections

<img src="images/amdc-dac.svg"> 

### AMDC Connector

The AMDC DAC expansion board interfaces with the AMDC via either the Power Stack or IsoSPI ports, both of which use a DB-15 connector. The pinouts of the two ports differ from one another, so jumpers are used to configure the DAC expansion board to a particular pinout. The jumper blocks are discussed in greater detail later in this document.

If the Power Stack port is to be used, additional configuration is required. Each Power Stack port on the AMDC has four status lines. Status lines A, B, and C must be configured as outputs by jumpers on the AMDC. The voltage of the status lines must be configured to 5V in the same manner. More information about the Power Stack can be found [here...](../../../docs/PowerStack.md) 

The DAC board contains the IsoSPI transceiver needed to communicate with the IsoSPI port on the AMDC. No additional configuration is needed to interface with the IsoSPI port.

A table of the pinouts for both connector types is shown below:

 
| Pin Number | Power Stack | IsoSPI     |
|------------|-------------|------------|
| 1          | No Connect  | `+5V`      |
| 2          | No Connect  | No Connect |
| 3          | No Connect  | No Connect |
| 4          | No Connect  | No Connect |
| 5          | No Connect  | No Connect |
| 6          | No Connect  | No Connect |
| 7          | No Connect  | `SPI_IP`   |
| 8          | `STS_A`     | `SPI_IM`   |
| 9          | `STS_B`     | No Connect |
| 10         | `STS_C`     | No Connect |
| 11         | No Connect  | `GND`      |
| 12         | No Connect  | No Connect |
| 13         | `+5V`       | No Connect |
| 14         | No Connect  | No Connect |
| 15         | `GND`       | No Connect |

### Jumper Blocks

There is a total of eight jumpers on the DAC board that configure the expected pinout from the DB-15 connector. 

- Jumpers JP1, JP2, and JP3 are used to route the SPI signals used to communicate with the DAC 
- Jumpers JP4 and JP5 are used to route the power signals to the board. 
- Jumpers JP6, JP7, and JP8 enable or disable the SPI signal digital isolator. 

All eight jumpers are critical to the operation of the DAC board, and must be installed on the appropriate side of the jumper blocks as designated by the silkscreen.

### DAC

### Op Amps

<img src="images/amdc-dac_op_amp.svg" width="60%">

### LPFs

<img src="images/amdc-dac_lpf.svg" width="50%">

### BNC Connectors / Screw Terminal 

## PCB Layout

## Datasheets