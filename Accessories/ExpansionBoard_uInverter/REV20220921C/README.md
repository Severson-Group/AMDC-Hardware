# uInverter Board

This folder contains the compiled design outputs for the uInverter expansion board. This includes schematics, images of the PCB layout, the bill of materials (BOM) and the files needed to order boards from an online vendor. 

## Board Parameters

| Question          | Answer            |
|-------------------|-------------------|
| Board Size        | 3.5" x 6.9"       |
| Number of Layers  | 2 Layers          |
| Double Sided      | No                |
| Surface Finish	  | Tin lead          |
| Silkscreen        | White             |
| Material          | FR-4, TG150       |
| Board Thickness   | 1.7mm             |
| Min Track/Spacing | 0.15 mm (6 mil)   |
| Min Hole Size     | 0.38 mm (15 mil)  |
| Number of holes   | 198               |
| Solder Mask       | Black             |
| HASL or ENIG      | No                |
| Finished Copper   | 1 oz              |


## Assembly Details

| Question                     | Answer        |
|------------------------------|---------------|
| Unique Part Count            | 66            |
| Number of Total Parts        | 66            |



| Total SMT Part Count          | 89          |
| Total Through-hole Part Count | 3           |
| Total Mechanical Screws       | 2           |
| Total Mechanical Standoffs    | 2           |


## Bill of Materials

The [Bill of Materials (BOM)](uinv-rev-c-bom.csv) contains components for 1 board. If users of this repo discover that any components are unvailable, please maintain an alternate-components.md file in this folder that lists approved alternates.

## Connectors and connections

Please check the documentation at: [docs.amdc.dev/accessories/uinverter](https://docs.amdc.dev/accessories/uinverter/index.html) for more details on the connectors and pin-outs.


**Note:** If you wish/have to replace the gate driver heatsink part number, make sure that the new part has a slot of similar dimensions as in `part no.: 529702B02500G` in the bottom to accommodate decoupling capacitors on the board.

