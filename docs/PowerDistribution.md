# AMDC Power Distribution

This document describes the design considerations and implementation details for the power distribution subsystem on the Advanced Motor Drive Controller (AMDC).

## Design Requirements and Considerations

Discussion related to inherient requirements and why those requirements exist.
- Low noise for ICs
- Single power input
- Efficient voltage conversion
- Inexpensive / small BOM

## Block Diagram / External Connections

Pictorial representation of power system, with blocks and descriptions of what they do.
- Spots to measure current / voltage

## Schematics

Discussion related to schematics for power subsystem:
- Related screenshots
- Hierarchy
- 2 differnet DC/DC available, with different enable logic (DNP resistor)
- Power protection calculations
- Inrush current limiting calculations
- etc

## PCB Layout

Discussion related to PCB layout for power subsystem:
- What area of board is it on?
- Switching vs LDOs noise
- Trace width

## Voltage Rails / Max Current Limitations

List of voltage rails on AMDC and what they power.
Probably table with subsystem, voltage rails, power draw, etc

## Datasheets

Appendix with links to relevant datasheets for the parts on the AMDC... DC/DCs, LDOs, power protection, etc.
