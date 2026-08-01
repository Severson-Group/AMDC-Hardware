# AMDC DAC Expansion Board REV20262707D

This folder contains the compiled design outputs for the AMDC DAC Expansion Board REV D. This includes the schematics, images of PCB layout, the bill of materials (BOM), and the files needed to order PCBs from online vendors.

## Board Parameters

| Question                  | Answer                |
|---------------------------|-----------------------|
| Board Size                | 3.91" x 3.91"         |
| Number of Layers          | 2 Layers              |
| Double Sided              | Yes                   |
| Surface Finish            | Tin lead              |
| Silkscreen                | White (both sides)    |
| Material                  | FR-4                  |
| Board Thickness           | 1.6 mm                |
| Min Trace Spacing         | 0.152 mm (6 mil)      |
| Min Hole Size             | 0.36 mm (14 mil)      |
| Number of Holes           | 233                   |
| Solder Mask               | Green                 |
| HASL or ENIG              | HASL                  |
| Finished Copper           | 1 oz                  |

## Assembly Details

| Question                          | Answer           |
|-----------------------------------|------------------|
| Unique Part Count[^1]             | 27               |
| Number of Total Parts[^1]         | 117              |
| Total SMT Part Count              | 96               |
| Total Through-hole Part Count     | 21               |
| Total Mechanical Screws           | 4                |
| Total Mechanical Standoffs        | 4                |
| Total Jumper Connectors           | 8                |
| BGA / QFN                         | QFN (U12)        |

## Bill of Materials

The [Bill of Materials (BOM)](./dac-rev-d-bom.csv) contains components for 1 board. If users of this repo discover that any components are unavailable, please maintain an `alternate-components.md` file in this folder that lists approved alternates.

[^1]: This number does not include screws, standoffs, or jumper connectors. With screws, standoffs, and jumper connectors included, the unique part count is 30 and total parts is 133. Users are advised to not have their assembly vendor place screws, standoffs, and jumper connectors.
