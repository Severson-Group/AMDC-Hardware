# AMDC Encoder Input

This document describes the design considerations and implementation details for the encoder input subsystem on the Advanced Motor Drive Controller (AMDC). A block diagram is presented and each component discussed in detail. Specifications of each component are provided based on the datasheet.

## Design Requirements

There are several design requirements while designing encoder subsystem of AMDC:
1.	To be able to operate with many standard incremental encoders.
2.	Inner compatibility between chips: differential to single-ended converter chip output should be compatible with level shifter chip input.
3.	Level shifter reduces signal voltage levels enough so that they can be transmitted to PicoZed.

## Block Diagram

<img src="images/amdc-encoder.svg" />

### 1. Encoders
Two encoders can be connected to AMDC Rev D simultaneously. These encoders should be incremental encoders outputting differential ABZ signals. For each pulse, there is non-inverting and inverting output. For example, for pulse A, there is a non-inverting output A and an inverting output A̅. If the encoder gives single-ended ABZ signals, an adapter which converts from single-ended to differential should be used to connect to AMDC. Encoder ground should be connected to the AMDC ground through a port of d-sub connector. Encoder can be supplied from a separate source or from AMDC which gives 5 V supply through a port of d-sub connector.
### 2. D-Sub Connector
Each d-sub connecter has 9 ports – 6 for differential ABZ signals, 2 for ground signals and 1 for 5 V supply which can be connected to encoder as a DC supply. A jumper should be connected if encoder is powered by 5 V from AMDC. More information on d-sub connector can be found [here]( https://www.alliedelec.com/m/d/c3366066d9274ddf3c20bc3008518f5b.pdf?src-supplier=Allied+Electronics)
### 3. Differential to single-ended converters
After passing through d-sub connector, differential ABZ signals (A, A̅, A, B̅, Z, Z̅) are converted to single-ended ABZ signals (OUT A, OUT B, OUT Z) using [AM26C32](http://www.ti.com/lit/ds/symlink/am26c32.pdf) chip. This chip is supplied by Vcc = 5 V DC source from AMDC. The following table summarizes absolute maximum ratings taken from the datasheet:   

| Parameter | MIN            | MAX                | 
|-------------------|-----------------|----------------------|
| Supply voltage Vcc             |                 | 7 V          |
| Input voltage (A, A̅, A, B̅, Z or Z̅)           | -11 V            | 14 V     |
| Differential input voltage      | -14 V            | 14 V    |
| Output voltage (OUT A, OUT B, OUT Z) | -0.5 V              | (Vcc + 0.5) V  |

Exposure to absolute maximum ratings for extended period of time may affect device reliability. Therefore, it is recommended to operate under recommended operating conditions:

| Parameter | MIN            | NOM                | MAX|
|-------------------|-----------------|----------------------|----------------------|
| Supply voltage Vcc             | 4.5 V | 5 V          | 5.5 V |
| High-level input voltage (logic HIGH) | 2 V |      | Vcc     |
| Low-level input voltage (logic LOW)   | 0 V |      | 0.8 V    |
| Common-mode input voltage | -7 V      |      | 7 V  |

When chip is operated at nominal conditions (Vcc = 5 V, room temperature 25<sup>0</sup>), the output signals of the chip are such that the high-level output voltage is 3.8 V or more and low-level output voltage is around 0.2 V. Typical current the chip consumes is about 10 mA. This translates to about 50 mW of power consumption with 5 V supply. The rise and fall times of the output signal are both approximately equal to 4 ns. Assuming the system as first order, the bandwidth of the chip would approximately be equal to 0.35/4 ns = 87.5 MHz.

Before connecting encoder to AMDC, it should be checked whether encoder output signals satisfy recommended operating conditions of the chip. More detailed information on the operating conditions can be found in the [datasheet](http://www.ti.com/lit/ds/symlink/am26c32.pdf).


### 4. Level Shifter
After encoder differential signals are converted to single-ended, these signals are then level-shifted/translated to a lower voltage, allowing compatibility with PicoZed. The level shifter [SN74LVC8T245](http://www.ti.com/lit/ds/symlink/sn74lvc8t245.pdf) uses two separate configurable power-supply rails and allows for bidirectional operation. Signals on each side (input or output) are referenced to their respective voltage rail. In AMDC Rev D, the input voltage rail is at 5V and the output voltage rail is at 1.8 V. The maximum output current can be up to 32 mA when
device is powered by 5 V. The outputs of this chip (6 signals in total if 2 encoders are connected) are then transmitted to PicoZed.
The rise and fall times of the output signal are both approximately equal to 1ns. Assuming the system as first order, the bandwidth of the chip would approximately be equal to 0.35/1 ns = 350 MHz.

## PCB Layout

All chips and d-sub connectors are located on the top layer. Signal routes from d-sub connectors to differential to single-ended converter and then to level shifter are all located on the top layer as well, while signals from level shifter to PicoZed are located in the intermediate level and each inverting and non-inverting pair of encoder signals are connected between each other by the termination resistor on the bottom layer. All signal traces have 6 mil thickness. Supply and ground traces connected to the chips have thickness of 10 mil.

It is recommended that bypass capacitors are used on the power supplies to reduce noise, and, if possible, short trace lengths should be used to avoid excessive loading.




