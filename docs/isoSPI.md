# AMDC isoSPI and differential I/O interface

This document describes the design considerations and implementation details for the isoSPI and differential I/O interface on the Advanced Motor Drive Controller (AMDC). The block diagram of the implementation is presented and each block is discussed in detail. The PCB layout consideration and also connector pinout is described in this document.

## Design Requirements and Considerations

The isolated serial peripheral interface (isoSPI) has increased noise immunity and saftey compared to non-isolated SPI. The following describes the design requirements for the isoSPI and differential I/O interface.
1. Implementing four isoSPI and eight differential I/O interface in AMDC.
2. To be able to implement bidirectional translation of the standard SPI signals (MOSI, MISO, SCLK, NSS) into differential pulses. 
3. Differential tranciever for differential I/O to translate the signal that can be used by PicoZed.
4. Voltage level translator to change the voltage levels that is compatible with PicoZed.
5. Adding isolation to the communication signals

## Block Diagram / External Connections

Pictorial representation of isoSPI, with blocks and descriptions of what they do.

### 1. DB15 Connector

DB15 D-sub high density connecotors are used for isoSPI and diffenrential IO interface in AMDC. There are _ DB15 connecctors for this interface and each connector has 2 isoSPI communication interface, 4 differential IO interface, 1 pin for ground signals and 1 pin for 5V supply of the AMDC.

The pin mappings for each DB15 connnector is shown:

| Pin number | Signal name |
|------------|--------|
| 1 | 5V |
| 2 | Differential IO 1+ |
| 3 | Differential IO 1- |
| 4 | Differential IO 2+ |
| 5 | Differential IO 2- |
| 6 | NC |
| 7 | isoSPI 1+ |
| 8 | isoSPI 1- |
| 9 | isoSPI 2+ |
| 10 | isoSPI 2- |
| 11 | GND |
| 12 | Differential IO 3+ |
| 13 | Differential IO 3- |
| 14 | Differential IO 4+ |
| 15 | Differential IO 4- |

The mapping between the AMDC schematic labels, PicoZed pins, and Zynq-7000 balls used in Vivado, can be found at the isoSPI section of the [pin mapping document](RevD-PinMapping.md#encoder).

Location of these connectors in the AMDC is shown below:

<img src="images/amdc-encoder-input-highlighted.svg" />

More details on the DB15 connector can be found in [here](https://content.norcomp.net/rohspdfs/Connectors/17Y/178/513/178-H15-513R497.pdf)

### 2. isoSPI communication interface

The isoSPI communication interface is implemented using [LTC6820](https://www.analog.com/media/en/technical-documentation/data-sheets/LTC6820.pdf). This IC provides bi-directional interface between standard SPI signals and differential pulses. The SPI signals from PicoZed are in 1.8V voltage signals, this IC also translates the signals to 5V level. For termination, 120 ohms resitor is added. The maximum and minimum operating conditions are provided in the following table:

| Parameter                             |    Conditions     |   MIN   |  MAX  |
|---------------------------------------|-------------------|---------|-------|
| Supply voltage VDD (Differential side)|                   | 2.7 V   | 5.5 V |
| IO supply voltage VDDS (SPI side)     |                   | 1.7 V   | 5.5 V |
| High-level input voltage (logic HIGH) |VDDS = 2.7V to 5V  | 0.7 VDDS| VDDS  |
| High-level input voltage (logic HIGH) |VDDS = 1.7V to 2.7V| 0.8 VDDS| VDDS  |
| Low-level input voltage (logic LOW)   |VDDS = 2.7V to 5V  | 0       | 0.3 VDDS  |
| Low-level input voltage (logic LOW)   |VDDS = 1.7V to 2.7V| 0       | 0.2 VDDS  |

This IC an operate at maximum SPI communication rate of 1 Mbps. The maximum The bias resistors (RB1 and RB2) are used to adjust drive currents to the differential lines. The bias resistors (RB1 and RB2) used in the design will set the drive currents to 10 mA. The maximum currents consumed by the IC including to drive currents for differential lines is 15.8 mA which corresponds to 79 mW for 5 V supply. More information regarding the operating conditions, bias resistors, maximum throughput rate, can be found in [datasheet](https://www.analog.com/media/en/technical-documentation/data-sheets/LTC6820.pdf). 

### 3. isoSPI pulse transformer

To add isolation to the diffirential isoSPI signals, external isolation barrier is required. This is implemented by adding pulse transformer [HX1188NLT](https://media.digikey.com/pdf/Data%20Sheets/Pulse%20PDFs/10_100BASE-T%20Single%20Port%20SMD%20Magnetics_Rev2008.pdf) which has 1:1 turns ratio.

### 4. Differential IO reciever

### 5. Differential IO transmitter

### 6. Voltage level translator


## PCB Layout

Discussion related to PCB layout for power subsystem:
- Power distribution trace width
- Signal interface

## Datasheets

Appendix with links to relevant datasheets for the parts on the AMDC... Level translation, PWM drivers, etc

