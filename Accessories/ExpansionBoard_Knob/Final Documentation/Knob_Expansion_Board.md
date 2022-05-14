
# Knob Board[](https://docs.amdc.dev/accessories/Knob/index.html#Knob-board "Permalink to this headline")

This document describes the design considerations and implementation details for the AMDC Knob (Encoder) expansion board. A block diagram is presented to explain each component in detail. 

[![PCD_3D](https://github.com/Severson-Group/AMDC-Hardware/raw/knob-board-rev-a-pcb/Accessories/ExpansionBoard_Knob/REV20220427A/PCB_3D_Top.png)](https://github.com/Severson-Group/AMDC-Hardware/blob/knob-board-rev-a-pcb/Accessories/ExpansionBoard_Knob/REV20220427A/PCB_3D_Top.png)
## Relevant Hardware Versions[](https://docs.amdc.dev/accessories/Knob/index.html#relevant-hardware-versions "Permalink to this headline")

-   `AMDC  REV  E`  with  `Knob  Board  REV  A`

## Design Requirements and Considerations[](https://docs.amdc.dev/accessories/Knob/index.html#design-requirements-and-considerations "Permalink to this headline")

The AMDC Knob expansion board was designed with the following requirements:

1.  Allow for an additional input to the AMDC
    
2.  Works with DB-15 and DB-9 connectors
    
3.  Designed to run off of 5V power supplied from the AMDC
    
4.  Minimize noise with debouncing and a Signal Differentiator 

### AMDC Connector 
The AMDC Knob expansion board interfaces with the AMDC via either the DB-15 (GPIO) connector or the DB-9 (encoder) connector.  The pinouts of the two connectors differ from one another as shown in the tables below.


### DB-15 Connector
  | Pin Number | Power Stack   |
  | ---------- | ------------- | 
  | 1          | `5V DB-15`    | 
  | 2          | `Encoder 1A`  | 
  | 3          | `Encoder ~1A` | 
  | 4          | `Encoder 1B`  | 
  | 5          | `Encoder ~1B` |
  | 6          | No Connect    |
  | 7          | `Encoder 1Z`  | 
  | 8          | `Encoder ~1Z` |   
  | 9          | No Connect    | 
  | 10         | No Connect    |
  | 11         | `GND`         |
  | 12         | No Connect    |
  | 13         | No Connect    |  
  | 14         | No Connect    | 
  | 15         | No Connect    | 

### DB-9 Connector
  | Pin Number | Power Stack   |
  | ---------- | ------------- | 
  | 1          | `Encoder 1A`  | 
  | 2          | `Encoder ~1A` | 
  | 3          | `Encoder 1B`  | 
  | 4          | `Encoder ~1B`  | 
  | 5          | `Encoder 1Z ` |
  | 6          | `Encoder ~1Z` |
  | 7          | `5V DB-9`     | 
  | 8          | `GND`         | 
  | 9          | `GND`         | 
  
  Both the DB-15 and DB-9 connectors can be connected to the Knob expansion board, however, the single jumper on the Knob board ensures power will only be pulled from one of the connectors.
  
  
  
  
  
  
  ## PCB Layout[](https://docs.amdc.dev/accessories/Knob/index.html#pcb-layout "Permalink to this headline")

Two polygon pours were used to reduce the number of required traces. The top pour is the +5V net, and the bottom pour is the GND net. All components and most traces are also located on the top of the board to simplify the fabrication of the board. Additional PCB properties are outlined in the table below.

| Property                | Value           |
| ----------------------- | --------------- |
| Size                    | 70mm x 80mm     |
| Number of Layers        | 2               |
| Thickness               | 1.6mm           |
| Min Track/Spacing       | 6/6mil          |
| Min Hole Size           | 0.3mm           |
| Surface Finish          | HASL (Tin-Lead) |
| Silkscreen              | Top Only        |
| Unique Part Count       | 9               |
| Unique SMD Part Count   | 5               |
| Total Parts             | 17              |
| Through-Hole Count      | 53              |
| Cost per Board (Unit 1) | $8.64           |
| Cost per Board (Unit 10)| $7.17           |

### LPFs[](https://docs.amdc.dev/accessories/Knob/index.html#lpfs "Permalink to this headline")

Low pass filters such as the one shown below are used throughout the Knob expansion board. These low pass filters are used to prevent debouncing while still allowing for signals to be sent at a rate of 160 times per second. 

  

[![../../_images/amdc-knob_lpf.svg](https://raw.githubusercontent.com/Severson-Group/AMDC-Hardware/knob-board-rev-a-pcb/Accessories/ExpansionBoard_Knob/Final%20Documentation/amdc-Knob_lpf.svg)](https://github.com/Severson-Group/AMDC-Hardware/blob/knob-board-rev-a-pcb/Accessories/ExpansionBoard_Knob/Final%20Documentation/amdc-Knob_lpf.svg)

  

The cutoff frequency is achieved based on the resistance and capacitance values of the filter:

  

_f_c = 1 / (2*_π*R_*C_)

  

The LPF’s cutoff frequency is set to 160Hz (a resistor with _R_ = 10kΩ and a capacitor with _C_ = 0.1μF achieves the desired frequency).
  
  ## Datasheets[](https://docs.amdc.dev/accessories/Knob/index.html#datasheets "Permalink to this headline")

-   Encoder: [`PEC12R-4220F-S0024-ND`](https://www.bourns.com/docs/Product-Datasheets/PEC12R.pdf)
    
-   Signal Differentiator: [`AM26C31CNS`](https://www.ti.com/lit/ds/symlink/am26c31.pdf?HQS=dis-dk-null-digikeymode-dsf-pf-null-wwe&ts=1652390392703&ref_url=https%253A%252F%252Fwww.ti.com%252Fgeneral%252Fdocs%252Fsuppproductinfo.tsp%253FdistId%253D10%2526gotoUrl%253Dhttps%253A%252F%252Fwww.ti.com%252Flit%252Fgpn%252Fam26c31)