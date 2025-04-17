# AMDC REV20231010F

This folder contains the compiled design outputs for AMDC REV F. This includes the schematics, images of the PCB layout, the bill of materials (BOM), and the files needed to order fully populated boards from an online vendor.

## Board Parameters

| Question                | Answer           |
|-------------------------|------------------|
| Board Size              | 6" x 6.75"       |
| Numer of Layers         | 6 Layers         |
| Double Sided            | Yes              |
| Surface Finish          | Tin Lead         |
| Silkscreen              | White            |
| Material                | FR-4, TG150      |
| Board Thickness	      | 1.6 mm           |
| Min Trace Spacing       | 0.15 mm (6 mil)  |
| Min Hole Size           | 0.36 mm (14 mil) |
| Number of Holes         | 1528             |
| Solder Mask	          | Green            |
| Finished Copper         | 1 oz             |

## Assembly Details

| Question                   | Answer      |
|----------------------------|-------------|
| Unique Part Count[^1]      | 69          |
| Number of Total Parts[^1]  | 458         |
| Total SMT Part Count       | 416         |
| Total Thru Hole Part Count | 32          |
| Total Mechanical Screws    | 13          |
| Total Mechanical Standoffs | 13          |
| BGA / QFN                  | Yes         |
| Total SOP/QFP/QFN/BGA      | 52          |

## Bill of Materials

The [Bill of Materials (BOM)](bom-rev-f.csv) contains components for 1 board. If users of this repo discover that any components are unvailable, please maintain an `alternate-components.md` file in this folder that lists approved alternates.

[^1]: This number does not include screws or standoffs. With screws and standoffs included, the unique part count is 71 and total parts is 484. Users are advised to not have their assembly vendor place screws and standoffs.