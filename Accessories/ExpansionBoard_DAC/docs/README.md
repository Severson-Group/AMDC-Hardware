# AMDC DAC Expansion Board

This document describes the design features and capabilites of the AMDC DAC expansion board, which is an accessory board that plugs into either the IsoSPI or Power Stack ports on the AMDC and provides 8 analog outputs (+- 10V output).

## Relevant Hardware Versions

| Hardware | Version |
| ---- | ----- |
| AMDC | REV D |
| DAC Board | REV B |

## Hardware Features

1. Eight RC filters on each of the eight analog outputs (cutoff frequency set to 100kHz)
2. Configurable input pinouts to either the IsoSPI or Power Stack Connector configurations (All eight jumpers must all be installed on the same side of the pin headers)
3. Eight BNC connectors for each analog channel output
4. Eight Screw post terminals for each analog channel output and four screw post terminals for GND
5. +/- 5V or 10V analog output voltage range
6. Test points on all SPI signals and two of the DAC channels outputs before scaling
7. Asynchronous push button clear to 0V on all output channels

## Output Capabilities

1. All channels can be individually configured to update synchronously on a single trigger
2. All channels can be individually configured to be +/- 5V or +/- 10V
3. 12-bit samples ( 5mV resolution at +/- 10V)
4. Maximum sample rate of 781 kSps for a single channel only
