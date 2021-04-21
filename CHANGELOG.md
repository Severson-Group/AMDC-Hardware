# AMDC Changelog

This file describes any key changes between hardware revisions.

## [REV20210325E](https://github.com/Severson-Group/AMDC-Hardware/milestone/5)

- Remove isoSPI ([#141](https://github.com/Severson-Group/AMDC-Hardware/issues/141))
- Add shared UART and JTAG interface ([#158](https://github.com/Severson-Group/AMDC-Hardware/issues/158))
- Add more GPIO ports ([#140](https://github.com/Severson-Group/AMDC-Hardware/issues/140))
- Add mechanical parts to BOM ([#115](https://github.com/Severson-Group/AMDC-Hardware/issues/115))
- Add website to PCB silkscreen ([#173](https://github.com/Severson-Group/AMDC-Hardware/issues/173))
- Add reset signal pull-up and ESD protection ([#165](https://github.com/Severson-Group/AMDC-Hardware/issues/165))
- Add local decoupling to VREF ([#171](https://github.com/Severson-Group/AMDC-Hardware/issues/171))
- Add local decoupling to 2.048V ([#170](https://github.com/Severson-Group/AMDC-Hardware/issues/170))
- Add E-STOP logic signal to FPGA ([#160](https://github.com/Severson-Group/AMDC-Hardware/issues/160))
- Add PTC resettable fuses to PWM outputs ([#157](https://github.com/Severson-Group/AMDC-Hardware/issues/157))
- Add VDRIVE signal to PS interface ([#126](https://github.com/Severson-Group/AMDC-Hardware/issues/126))
- Add jumpers for default VDRIVE and ESTOP ([#102](https://github.com/Severson-Group/AMDC-Hardware/issues/102))
- Add pull-down to VCCIO_EN ([#121](https://github.com/Severson-Group/AMDC-Hardware/issues/121))
- Change power wiring in schematics ([#174](https://github.com/Severson-Group/AMDC-Hardware/issues/174))
- Change shield termination to VIN- ([#156](https://github.com/Severson-Group/AMDC-Hardware/issues/156))
- Change mounting holes to VIN- from GND ([#169](https://github.com/Severson-Group/AMDC-Hardware/issues/169))
- Change DB15 P/N to include screw posts ([#134](https://github.com/Severson-Group/AMDC-Hardware/issues/134))
- Change to USB type B recepticle ([#101](https://github.com/Severson-Group/AMDC-Hardware/issues/101))
- Update top-level block diagram ([#164](https://github.com/Severson-Group/AMDC-Hardware/issues/164))
- Fix 24V supply to GPIO port ([#103](https://github.com/Severson-Group/AMDC-Hardware/issues/103))
- Fix power protection circuitry ([#163](https://github.com/Severson-Group/AMDC-Hardware/issues/163))
- Fix board start-up PWM issues ([#137](https://github.com/Severson-Group/AMDC-Hardware/issues/137))
- Fix P/N for RC filter caps ([#96](https://github.com/Severson-Group/AMDC-Hardware/issues/96))
- Fix BOM components for DFM ([#159](https://github.com/Severson-Group/AMDC-Hardware/issues/159))
- Fix footprints ([#95](https://github.com/Severson-Group/AMDC-Hardware/issues/95), [#128](https://github.com/Severson-Group/AMDC-Hardware/issues/128))

## [REV20200129D](https://github.com/Severson-Group/AMDC-Hardware/milestone/4)

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

## [REV20181121C](https://github.com/Severson-Group/AMDC-Hardware/milestone/3)

- Add inrush current limiting to 5V5 rail
- Add more silkscreen labels
- Add test points
- Change ADC reference from 2.5V to 2.048V
- Change trim resistors for +/-16V DC/DCs
- Swap UART Tx / Rx pins
- Separate power stack shields between connectors
- Fix footprints

## [REV20180717B](https://github.com/Severson-Group/AMDC-Hardware/milestone/2)

- Add power input protection
- Add test points
- Add TVS to analog inputs
- Change power input DC/DC modules
- Fix BOM with correct part numbers
- Fix footprints
- 
## REV20180525A

- Initial design
