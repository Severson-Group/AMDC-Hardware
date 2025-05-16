# Kaman I/O Converter Board

This folder contains the compiled design outputs for the Kaman I/O Converter. This includes the schematics, images of the PCB layout, the bill of materials (BOM), and the files needed to order boards from an online vendor.


## Board Parameters

| Question                | Answer             |
|-------------------------|--------------------|
| Board Size              | 2.4" x 2.5"        |
| Numer of Layers         | 2 Layers           |
| Double Sided            | Yes                |
| Surface Finish          | Tin Lead           |
| Silkscreen              | White              |
| Material                | FR-4, TG150        |
| Board Thickness         | 1.6 mm (63 mil)    |
| Min Trace Spacing       | 0.15 mm (6 mil)    |
| Min Hole Size           | 0.36 mm (14 mil)   |
| Number of Holes         | 112                |
| Solder Mask             | Green              |
| HASL or ENIG            | No                 |
| Finished Copper         | 1 oz               |

## Assembly Details

| Question                      | Answer      |
|-------------------------------|-------------|
| Unique Part Count[^1]         | 16          |
| Number of Total Parts[^1]     | 92          |
| Total SMT Part Count          | 89          |
| Total Through-hole Part Count | 3           |
| Total Mechanical Screws       | 2           |
| Total Mechanical Standoffs    | 2           |

## Bill of Materials

The [Bill of Materials (BOM)](io-converter-board-bom.csv) contains components for 1 board. If users of this repo discover that any components are unvailable, please maintain an `alternate-components.md` file in this folder that lists approved alternates.


[^1]: This number does not include screws and standoffs. With these components included, the unique part count is 18 and total parts is 96. Users are advised to not have their assembly vendor place these components.
