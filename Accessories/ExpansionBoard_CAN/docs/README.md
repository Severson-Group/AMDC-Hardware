# CAN Board

This document describes the design considerations and implementation details for the CAN board. The purpose of the board is to enable the AMDC to communicate
with other nodes through CAN. 

## Relevant Hardware Versions
REV A

## Design Requirements and Considerations
The CAN board was designed with the following specifications: 
1. Two CAN buses
2. Isolated buses
3. Include screw terminal and DB-9 connectors for CAN outputs
4. Place all components on top of the board
5. Minimal routing on the bottom layer. 

## Pin Configuration
The pin out on the double stack DB-9 connector is...
1. PIN2: CAN-Low
2. PIN6: GND
3. PIN7: CAN-High

All other pins are no connects on the connector. 
