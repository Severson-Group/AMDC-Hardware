# AMDC Expansion Board: Analog Inputs to BNC

This document describes the design considerations and implementation details for the AMDC analog input expansion board, which is an accessory board that plugs into the AMDC to allow easy use of the analog inputs via BNC cables.

## Relevant Hardware Versions

- Expansion Board: REV A
- AMDC: REV D (**not** REV C... the pin-out on the RJ45 connector is different and thus not compatible between hardware revisions!!)

## Purpose

The AMDC analog input to BNC expansion board is designed to let users easily interface BNC cables to the AMDC analog inputs.

## Design Considerations

The expansion board provides 8x BNC connectors which go to the eight analog inputs on the AMDC. Since each analog input on the AMDC is fully differential, the shields of the BNC connectors **are not** tied together. This means that each channel is completely seperate.

To reduce noise, no ground pour is used on the expansion board. A large ground pour would pick up radiated EMI and couple it back to the AMDC common. The expansion board is simply a wiring board, so there is no need for such pours.

All analog input traces are routed using differential pair routing, which helps to reject common-mode noise injections.
