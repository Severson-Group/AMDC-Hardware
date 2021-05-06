# I/O Converter Expansion Board

This folder contains the compiled design outputs for the Kaman I/O Converter REV B. This includes the schematics, images of the PCB layout, and the bill of materials (BOM).

## Revision History
| Revision | Changelog |
|----------|-----------|
| REV B | This revision is specifically designed for the Kaman KD-5690-FE eddy current sensor. The general purpose screw post outputs were replaced with the specific DSUB micro 9-D connector used by the Kaman sensor. Addionally, pads for glitch filters and passive filters were added to increase the boards noise immunity.|
| REV A | This revision implements a general purpose differential to single ended I/O converter. No filters are present on the board.|

## Glitch Filtering
The Kaman I/O Converter Board REV B features glitch filters implemted using cascading schmitt triggers. The schmitt triggers are cascaded to prevent metastability issues.

## PCB Properties
| Question          | Answer        |
|-------------------|---------------|
| Size              | 2.4" x 2.5"   |
| Number of Layers  | 2               |
| Thickness         | 1.6mm            |
| Min Track/Spacing | 6/6mil          |
| Min Hole Size     | 0.3mm           |
| Surface Finish    | HASL (Tin Lead) |
| Silkscreen        | Both sides      |
| Unique Part Count | 14            |
| SMT Part Count    | 65            |
| Trough-Hole Count | 3            |


## Recommended Cables

The I/O Converter board requires cables to interface with the AMDC IsoSPI connectors. The following are the recommended cables to buy.

### IsoSPI Cables

<img src="https://media.digikey.com/Photos/Amphenol%20Photos/MFG_CS-DSDHD15MM0.jpg" width="25%" />

Digi-Key Part Number: `CS-DSDHD15MM0-007.5-ND`

Only one cable is required.
