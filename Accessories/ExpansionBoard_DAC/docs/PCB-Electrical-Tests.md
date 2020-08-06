#AMDC DAC Expansion Board

This document outlines basic electrical tests to verify the AMDC DAC expansion board, an accessory for the AMDC Rev D. The expansion board plugs into the AMDC via the Power Stack or IsoSPI interfaces. 

## Electrical Shorts
1. Verify all pins on U12 have no shorts between adjacent pins

## Applying Power
>All power signals on the DAC board are isolated from the supplied power from the AMDC. To differentiate this document will prefix all supply signals with SUPPLY_

The DAC expansion board signals, +/- 12V, +5V, and 0V, all are generated from DC/DC converters U10 and U7. The DC/DC converters are supplied each with SUPPLY_5V and SUPPLY_GND to generate these signals. 
1. SUPPLY_5V must be applied to pin 1 on U7 and pin 2 on U10. 
2. SUPPLY_GND must be applied to pin 2 on U7 and pin 1 on U10.

>Pin 1 can be identified on both U7 and U10 by a square pad.

## Basic Voltage Tests
 1. Verify pin 1 on U12 is at 2.5V with respect to GND (C40 is connected to 2.5 VREF and GND)
 2. Verify pin 7 on U12 is at 5V with respect to GND (C36 and C37 connect 5V to GND)
 3. Verify pin 3 on U8 is at +12V with respect to GND (C28 is connected to +12V and GND)
 4. Verify pin 3 on U6 is at -12V with respect to GND (C31 is connected to -12V and GND)


 The DAC expansion board requires SUPPLY_5V and SUPPLY_GND. Board power signals, +/- 12V, +5V, and 0V, are generated from DC/DC converters U10 and U7.  