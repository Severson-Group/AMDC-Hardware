# AMDC DAC Expansion Board

This project archives a board design by Nathan Petersen from March 2019. This was the first attempt at a DAC expansion board for the AMDC REV C. This board outputs eight analog channels. Each channel is 12-bit and is 0V to 4.096V, meaning the LSB equals 1mV.

A FPGA driver was created to interface to this board. This system worked, but was prone to noise issues due to the single-ended high-speed SPI.

During the summer of 2020, a new DAC board was designed (by an undergrad named Brandt) to specifcally work with REV D AMDC hardware.