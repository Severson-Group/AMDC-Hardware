# AMDC DAC Expansion Board

This board was designed for the REV C AMDC hardware. It provided eight analog output channels between 0V and 4.096V.

It communicated via standard SPI to the GPIO headers on the REV C AMDC hardware.

Firmware for this board was written in the FPGA and tested. It worked fairly well, but the single-ended SPI interface was sensitive to EMI.