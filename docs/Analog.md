# AMDC Analog Input

This document describes the design considerations and implementation details for the analog input subsystem on the Advanced Motor Drive Controller (AMDC). A block diagram is presented and each component discussed in detail. Specifications of each component are provided based on the datasheet.

## Relevant Versions of AMDC Hardware

AMDC REV D

## Design Requirements and Considerations

There are several design requirements that must be met for the analog signal chain of AMDC:

1. Synchronously digitize differential analog inputs (bipolar, ±10 V at each input of the differential signal).
2. Operate ADC fast enough such that sampling can be aligned to PWM carrier waveform (>100ksps throughput on all channels with accurate timing).
3. High impedance inputs so no possiblity for ground loops.
4. High common-mode rejection ratio (CMRR) for wide range of inputs.
5. Low noise signal chain.

As it was mentioned, the analog input to AMDC should be bipolar differential with the voltage within ±10 V. Then, the analog front-end converts this into pseudo-differential bipolar which is needed by the analog-to-digital converter (ADC). More information on ADC input types and their definitions can be found [here](https://www.analog.com/media/en/technical-documentation/product-selector-card/2PB_sarinputtypesfb.pdf).

## Block Diagram / External Connections

<img src="images/amdc-analog.svg" />

### Analog connectors
Analog signal chain of AMDC can receive up to 8 bipolar differential analog inputs (16 signals in total – 8 positive and 8 negative). There are 4 analog connectors (modular jacks) each receiving up to 2 differential inputs. There are also 4 ESD protection chips to protect sensitive electronics from damage due to ESD. 

A table of the pin mappings for each analog connector is shown below:

| Pin number | Signal name |
|------------|--------|
| 1 | Analog P1 |
| 2 | Analog N1 |
| 3 | +15 V |
| 4 | GND |
| 5 | -15 V |
| 6 | GND |
| 7 | Analog P2 |
| 8 | Analog N2 |

To view the mapping between the AMDC schematic labels, PicoZed pins, and Zynq-7000 balls used in Vivado, take a look at the analog section of the [pin mapping document](RevD-PinMapping.md#analog).

Location of these 4 analog connectors in the AMDC (stacked as 2 x 2) is shown below:

<img src="images/amdc-analog-input-highlighted.svg" />

More detailed information on the analog connectors can be found in the [datasheet](https://media.digikey.com/pdf/Data%20Sheets/Amphenol%20PDFs/RJSAE_Brochure.pdf).

### Difference amplifiers
Analog input signals should be conditioned before transmitting to ADC. First stage of this conditioning is to decrease the voltage level. These are implemented using 4 [INA2143UA](http://www.ti.com/lit/ds/symlink/ina143.pdf) difference amplifier chips. Each chip has two op amps, totaling in 8 op amps each of which receives one differential analog input. These chips need a ±15 V supply which they receive from AMDC. Each op amp is configured as a non-inverting amplifier and the relationship between its input and output is as follows:


_V_<sub>i</sub> = _V_<sub>REF</sub>  + 0.1 (_V_<sub>i</sub><sup>+</sup> - _V_<sub>i</sub><sup>-</sup>)

where i = 1, 2, 3 ..., 8. (_V_<sub>i</sub><sup>+</sup> - _V_<sub>i</sub><sup>-</sup>) is bipolar differential input coming from analog connectors and _V_<sub>i</sub> is output of the op amp which is fed to the low-pass filter (next subsection). _V_<sub>REF</sub> = 2.048 V is supplied from AMDC and 0.1 gain is set using laser trimmed resistors during IC fab, so each resistance value internal to the [INA2143UA](http://www.ti.com/lit/ds/symlink/ina143.pdf) is very accurate. This results in very high CMRR. Differential input to the op amp can be between ±20 V (AC/DC, each input between ±10 V), which means the output can be in the range of 0.048 V and 4.048 V.

More detailed information on the operating conditions of the op amp can be found in the [datasheet](http://www.ti.com/lit/ds/symlink/ina143.pdf).
 
### Low-Pass Filters (LPFs)
After analog input voltage levels are decreased using op amps, the next stage is to remove high-frequency noises using low-pass filters. To implement this, 8 simple first-order RC filters are used each for 1 analog input. The cutoff frequency of the filter is selected based on the resistance and capacitance values:

_f_<sub>c</sub> = 1 / (2 π _RC_)

The main purpose of these LPFs, however, is for anti-aliasing. They are set to 50 kHz (resistor with _R_ = 100 Ω and capacitor with _C_ = 33 nF) since sampling is nominally done at 100 kHz for ADC, and control loop is nominally at 10 or 20 kHz.

### ADC

After analog input signal passes through analog front-end (voltage level decreased and high-frequeny noise removed), it can be inputted to ADC to convert to digital signal. [LTC2320-14](https://www.analog.com/media/en/technical-documentation/data-sheets/232014fa.pdf) high speed octal 14-bit + sign successive approximation register (SAR) ADC is used for this purpose which can receive up to 8 inputs. ADC chip is supplied by 5 V from AMDC to operate.

Each analog input to ADC is configured as pseudo-differential bipolar signal - its positive input signal is single-ended LPF output that can swing between 0.048 V and 4.048 V, and its negative input signal is at _V_<sub>REF</sub> = 2.048 V, resulting in differential input span of ±2 V which is digitized by ADC.

The outputs of the ADC chip are 8 serial data outputs each resulting from 1 differential analog input. The chip is also supplied by 1.8 V which is used as a digital HIGH of the output signal. These 8 digital signals are then transmitted to Picozed. There are other 3 digital signals (ADC CNV, ADC SCK and ADC CLKOUT) needed for the interface with FPGA.

More detailed information on the operating conditions of ADC can be found in the [datasheet](https://www.analog.com/media/en/technical-documentation/data-sheets/232014fa.pdf).

## PCB Layout

Analog connectors, difference amplifier chips and LPFs are located on the top layer, while ESD protection chips are located on the bottom layer. The bottom layer is used to route the signals from the analog connectors to the ESD protection chips and difference amplifiers, and from LPFs to ADC. The top layer is used to route the signals from difference amplifiers to the LPFs. All signal traces have 6 mil thickness. Supply and ground traces connected to the chips have thickness of 10 mil.

## Datasheets

- Analog connectors - https://media.digikey.com/pdf/Data%20Sheets/Amphenol%20PDFs/RJSAE_Brochure.pdf
- ESD protection - http://www.smc-diodes.com/propdf/SMDA03C%20THRU%20SMDA24C%20N0297%20REV.B.pdf
- Difference amplifiers - http://www.ti.com/lit/ds/symlink/ina143.pdf
- ADC – https://www.analog.com/media/en/technical-documentation/data-sheets/232014fa.pdf
