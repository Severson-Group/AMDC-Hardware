# AMDC Power Distribution

This document describes the design considerations and implementation details for the power distribution subsystem on the Advanced Motor Drive Controller (AMDC).

## Design Requirements and Considerations

The design requirements for the power input and distribution on the AMDC can be boiled down to a succient list of conflicting goals:

1. Single voltage input connection for all PCB power.
2. Efficient DC/DC conversion for various voltage rails (steady state should not be excessively hot for devices).
3. Low noise on power rails for circuitry (switching DC/DC are noisy; LDOs are preferred).
4. Power subsystem is not the main goal of AMDC, therefore BOM should be small and inexensive.

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
