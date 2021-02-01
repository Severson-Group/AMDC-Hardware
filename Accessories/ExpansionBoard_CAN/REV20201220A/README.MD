# AMDC CAN Expansion Board

This folder contains the compiled design outputs for the AMDC CAN REV A expansion board (design frozen on Dec 20, 2020). This includes schematics, images of the PCB layout, the bill of materials (BOM), and the files needed to order fully populated boards. 

## PCB Properties
| Question          | Answer        |
|-------------------|---------------|
| Size              | 2.98" x 2.45"   |
| Number of Layers  | 2               |
| Thickness         | 1.6mm            |
| Min Track/Spacing | 6/6mil          |
| Min Hole Size     | 0.3mm           |
| Surface Finish    | HASL (Tin Lead) |
| Silkscreen        | Top Only      |
| Unique Part Count | 16            |
| SMT Part Count    | 13            |
| Through-Hole Count | 3            |

## DB-9 Pin Out Connection

There are two CAN buses on the board, each with their own pair of screw terminals and DB-9 connectors. Below is all relevant information to understanding the pinout of the DB-9 connectors. 

- Top connector: CAN A
- Bottom connector: CAN B
- Pin 2: CANL signal
- Pin 6: GND signal from CAN chip
- Pin 7: CANH signal
