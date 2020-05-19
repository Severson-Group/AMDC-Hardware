# AMDC isoSPI and differential I/O interface

This document describes the design considerations and implementation details for the isoSPI and differential I/O interface on the Advanced Motor Drive Controller (AMDC). The block diagram of the implementation is presented and each block is discussed in detail. The PCB layout consideration and also connector pinout is described in this document.

## Design Requirements and Considerations

The isolated serial peripheral interface (isoSPI) has increased noise immunity and saftey compared to non-isolated SPI. The following describes the design requirements for the isoSPI and differential I/O interface.
1. Implementing four isoSPI and eight differential I/O interface in AMDC.
2. To be able to implement bidirectional translation of the standard SPI signals (MOSI, MISO, SCLK, NSS) into differential pulses and using pulse transformer for isolation.
3. Differential tranciever for differential I/O to translate the signal that can be used by PicoZed.
4. Voltage level translator to change the voltage levels that is compatible with PicoZed.

## Block Diagram / External Connections

Pictorial representation of isoSPI, with blocks and descriptions of what they do.

### 1. IsoSPI communication interface

The isoSPI communication interface is implemented using [LTC6820](https://www.analog.com/media/en/technical-documentation/data-sheets/LTC6820.pdf). This IC provides bi-directional translation between standard SPI signals and differential pulses. The SPI signal from PicoZed is low 1.8V voltage signals, LTC6820 IC also translates this signals to 5V level. At the begining of the differential signals, 120 ohms termination resitor is added. 

### 2. IsoSPI pulse transformer

To add isolation to the diffirential isoSPI signals, external isolation barrier is required. This is implemented by adding pulse transformer [HX1188NLT](https://media.digikey.com/pdf/Data%20Sheets/Pulse%20PDFs/10_100BASE-T%20Single%20Port%20SMD%20Magnetics_Rev2008.pdf) which has 1:1 turns ratio.

## Connector Pinout

Explaination and list of pinout

## Schematics

Discussion related to schematics

## PCB Layout

Discussion related to PCB layout for power subsystem:
- Power distribution trace width
- Signal interface

## Datasheets

Appendix with links to relevant datasheets for the parts on the AMDC... Level translation, PWM drivers, etc

