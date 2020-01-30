# AMDC Power Stack Interface

This document describes the design considerations and implementation details for the power stack interface subsystem on the Advanced Motor Drive Controller (AMDC).

## Design Requirements and Considerations

Discussion related to inherient requirements and why those requirements exist.

- Main design point: interface with as many power stacks as possible... Flexibility...
  - Designed with certain CREE gate drive in mind...

- Designed to work mainly with three-phase two-level power stacks
- User supplied PWM voltage level for flexiblity
- Power distribution for power stacks
- Selectable status I/O voltage level
- Generic status signals with selectable direction
  - What is purpose of statuses? example status ideas?

## Block Diagram / External Connections

Pictorial representation of power stack interface, with blocks and descriptions of what they do.
- Show where 0R resistors are for disconnecting power etc
- Jumper selections do WHAT?
- Status lines?

## Connector Pinout

Explaination and list of pinout

Picture of all 8 power stack connectors with arrows which correspond to firmware names etc

## Schematics

Discussion related to schematics for power stack interface...

## PCB Layout

Discussion related to PCB layout for power subsystem:
- Power distribution trace width
- Signal interface for PWM I/O (fast edges, close traces, ...bad)

## Voltage Rails / Max Current Limitations

Etc

## Datasheets

Appendix with links to relevant datasheets for the parts on the AMDC... Level translation, PWM drivers, etc
