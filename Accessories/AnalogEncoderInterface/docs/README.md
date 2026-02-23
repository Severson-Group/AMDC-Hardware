# Analog Encoder Interface Board

**This file outlines the use of the Analog Encoder Interface Board and important revision changes.**

## Relevant Hardware Versions

| Hardware               | Version |
|------------------------|---------|
| AMDC                   | F       |

## Revision History

| Revision |                           Changelog                           |
|----------|-------------------------------------------------------------- |
| REV A    |implements buffer circuit to amplify signal from analog encoder|

## Purpose

The Analog Encoder Interface Board is intended to amplify signals from analog encoder to be able to measure rotor position with AMDC.

## Features

- Handles different signals
- Removes offset from the encoder signal
- Amplifies the signal by 10X
- Can be used with AMDC

## Block Diagram

<p align="center">
<img alt="image" src="image/circuit-block-diagram.svg">

This Analog Encoder Interface Board is an AMDC accessory adds the capability to read the position from the analog encoder, which generates the sin/cosine signal to estimate the rotor positions.

## External Connectors

There are 4 connectors on the boards. The details of the pinout are provided below.

### 6 pin connector J1: Encoder

| Pin number | Signal name                                           |
|------------|-------------------------------------------------------|
| 1          | 5 V                                                   |
| 2          | GND                                                   |
| 3          | VA_P                                                  |
| 4          | VA_N                                                  |
| 5          | VB_P                                                  |
| 6          | VB_N                                                  |

### 2 pin connector J2: Power supply

| Pin number | Signal name                                           |
|------------|-------------------------------------------------------|
| 1          | 24 V                                                  |
| 2          | GND_24V                                               |

### 6 pin connector J3: Drive

| Pin number | Signal name                                           |
|------------|-------------------------------------------------------|
| 1          | NC                                                    |
| 2          | GND                                                   |
| 3          | VB_N_OUT                                              |
| 4          | VB_P_OUT                                              |
| 5          | VA_N_OUT                                              |
| 6          | VA_P_OUT                                              |

### Ethernet connector J4: Board-to-AMDC

| Pin number | Signal name                                           |
|------------|-------------------------------------------------------|
| 1          | VA_P_OUT                                              |
| 2          | VA_N_OUT                                              |
| 3          | NC                                                    |
| 4          | GND                                                   |
| 5          | NC                                                    |
| 6          | GND                                                   |
| 7          | VB_P_OUT                                              |
| 8          | VB_N_OUT                                              |
