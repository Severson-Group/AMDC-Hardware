This document outlines basic electrical tests to verify the DAC expansion board. 

## Electrical Shorts
- Verify all pins on U12 have no shorts between adjacent pins

To power on the DAC expansion board, connect it to the AMDC via either an inverter power stack port, or the isoSPI port. Install all of the jumpers on their pin header locations with respect to the AMDC port used.

## Basic Voltage Tests
 - Verify pin 1 on U12 is at 2.5V with respect to GND (C40 is connected to 2.5 VREF and GND)
 - Verify pin 7 on U12 is at 5V with respect to GND (C36 and C37 connect 5V to GND)