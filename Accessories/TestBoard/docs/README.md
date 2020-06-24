# AMDC Test Board

This document describes the design considerations and implementation details for the AMDC test board, which is an accessory board which plugs into the AMDC to test the functionality of the power stack and analog interfaces.

## Relevant Hardware Versions

Test Board: REV A, AMDC: REV D

## Purpose

The AMDC Test Board serves two purposes:

1. Test newly fabricated AMDCs to verify PWM and analog I/O are functional.
2. Act as breakout board for learning the AMDC peripherals (i.e. AMDC Labs).

## Features

The test board interfaces the inverter output port to the analog input port. It provides thefollowing features:

1. Six RC filters on each of the six PWM outputs (bandwidth set to 10kHz)
2. Four LEDs for each of the four status lines
3. Loopback capability for status lines (they can be input or output to AMDC)
4. One BNC connector to measure filtered PWM voltage (jumpers can select one of six filtered PWM)
5. Two power LEDs (VDD and VPS)
6. Test points on all important signals
7. Both positive and negative analog voltage inputs to the AMDC
8. +/- 10V input to AMDC (to test full input range)


## Testing Capability

Tests that can be conducted using the Test Board:

#### AMDC Power Stack Interface

1. Verify VDD power
2. Verify status lines as outputs
3. Verify status lines as inputs
4. Verify PWM duty ratio output

#### AMDC Analog Inputs

1. Verify both positive and negative voltage input
2. Verify full range +/- 10V input
3. Explicitly verify +15V rail
4. Implicitly verify -15V rail

## PCB

Designed to be cheap to fabricate:

- 2-layer, 3" x 3.9"
- Parts only on top layer (no silkscreen on bottom)
- BOM: $25 in single quantity
