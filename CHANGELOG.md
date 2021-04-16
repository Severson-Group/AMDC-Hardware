# AMDC Changelog

This file describes any key changes between hardware revisions.

## REV20210325E

- Remove isoSPI
- Add shared UART and JTAG interface
- Add more GPIO ports
- Add mechanical parts to BOM
- Add website to PCB silkscreen
- Add reset signal pull-up and ESD protection
- Add local decoupling to VREF
- Add local decoupling to 2.048V
- Add E-STOP logic signal to FPGA
- Add PTC resettable fuses to PWM outputs
- Add VDRIVE signal to PS interface
- Add jumpers for default VDRIVE and ESTOP
- Add pull-down to VCCIO_EN
- Change power wiring in schematics
- Change shield termination to VIN-
- Change mounting holes to VIN- from GND
- Change DB15 P/N to include screw posts
- Change to USB type B recepticle
- Update top-level block diagram
- Fix 24V supply to GPIO port
- Fix power protection circuitry
- Fix board start-up PWM issues
- Fix P/N for RC filter caps
- Fix BOM components for DFM
- Fix footprints

## REV20200129D

- New PCB form factor (6" x 6.75", 6 layers)
- Add power stack supply rail distribution
- Add isoSPI ports
- Add extra encoder port
- Add 0R resistors to subsection power for debugging
- Add 100k resistors across analog inputs
- Add serially addressable RGB LEDs
- Add EEPROM
- Add fiducials to layout
- Remove user button / switch
- Remove discrete RGB LED
- Remove ADC2, now just one ADC
- Remove unity gain op-amp driving ADC inputs
- Reduce bulk input
- Reduce 24V power filter component current ratings
- Reduce 3V3 LDO current rating
- Change level-shifter IC for UART signals
- Change JTAG to NC module
- Change JTAG pin headers to pads
- Change values for inrush limiting circuitry
- Change FPGA driven MOSFETs to lower Vth
- Change FPGA pin-out mapping
- Change power stack connector I/O
- Change encoder input signal chain
- Change Ethernet routing to correct diff. impedance
- Fix footprints

## REV20181121C

- Add inrush current limiting to 5V5 rail
- Add more silkscreen labels
- Add test points
- Change ADC reference from 2.5V to 2.048V
- Change trim resistors for +/-16V DC/DCs
- Swap UART Tx / Rx pins
- Separate power stack shields between connectors
- Fix footprints

## REV20180717B

- Add power input protection
- Add test points
- Add TVS to analog inputs
- Change power input DC/DC modules
- Fix BOM with correct part numbers
- Fix footprints
- 
## REV20180525A

- Initial design
