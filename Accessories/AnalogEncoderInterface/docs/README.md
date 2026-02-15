# Analog Encoder Interfacing Board
This file outlines the use of the Analog Encoder Interfacing Board and important revision changes.

## Relevant Hardware Versions

| Hardware               | Version |
|------------------------|---------|
| AMDC                   | F       |
| Super CU               | NA      |

## Revision History

| Revision |                           Changelog                           |
|----------|-------------------------------------------------------------- |
| REV A    |implements buffer circuit to amplify signal from analog encoder|

## Purpose

The Analog Encoder Interfacing Board is intended to amplify signals from analog encoder to able to measure rotor position with AMDC/SUper CU.

## Design Requirements, Considerations, and Features

### System Design Requirements
- Input Voltage: 24 VDC
- Output Voltage: 5 V
- Differential signaling

### Features

- Handles different signals 
- Removes offset for  the encoder signal 
- Amplifies the singal by 10X
- Can be used with AMDC or Super CU drive

## Block Diagram

<p align="center">
<img alt="image" src="image/circuit-block-diagram.png">

This Analog Encoder Interfacing Board is an AMDC accessory adds the capability to read the position from the resolvers, which generates the sin/cosine signal to estimate the rotor positions.

## External Connectors

There are 2 interfacing 6 pin connectors on the Full Bridge Converter board.  The first connector is used for interfacing with AMDC for PWM signals. The second connector is interfacing with AMDC for USART and isoSPI signals.  The third connector is intended to serve as a daisy chain connection between multiple Full Bridge Converter boards. There are also 5 additional header pin board-to-board connectors for connection with the power board.

### 6 pin connector J1: Encoder-to-Board
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

### 6 pin connector J3: Board-to-Super CU
| Pin number | Signal name                                           |
|------------|-------------------------------------------------------|
| 1          | NC                                                    |
| 2          | GND                                                   |
| 3          | VB_N_OUT                                              |
| 4          | VB_p_OUT                                              |
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
| 7          | VB_p_OUT                                              |
| 8          | VB_N_OUT                                              |