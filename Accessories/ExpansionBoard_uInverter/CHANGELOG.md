
## REVB

- Provide parallel decoupling capacitance as suggested in [Gate Driver](https://www.digikey.com/en/products/detail/ixys-integrated-circuits-division/IXDN614CI/2424705) datasheet
- Add small (10 uF) ceramic capacitor for DC link
- Reverse current sensing differential amplifier input polarity (#193)
- Add low pass filter capacitor at DC bus voltage sensing point (#192)
- Remove screw connectors and provide cutout in PCB for current sensing (#197)
- Replace SMD components with 0603 size by 0805 sized components
- Fix BOM with correct part number for DC bus voltage potential devider resistors

## [REV20210506A](https://github.com/Severson-Group/AMDC-Hardware/tree/uInverter_revB_Sch/Accessories/ExpansionBoard_uInverter/REV20210506A)

- Initial design
