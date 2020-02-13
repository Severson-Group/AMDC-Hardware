# AMDC Power Distribution

This document describes the design considerations and implementation details for the power distribution subsystem on the Advanced Motor Drive Controller (AMDC). A block diagram is presented and discussed in detail, along with PCB layout considerations.

## Design Requirements

The design requirements for the power input and distribution on the AMDC can be boiled down to a succient list of conflicting goals. The remainder of this document will summarize the resulting AMDC power system design and how it adheres to these goals. The following describes these goals:

1. Single voltage input connection for all PCB power.
2. Efficient DC/DC conversion for various voltage rails (steady state should not be excessively hot for devices).
3. Low noise on power rails for circuitry (switching DC/DC are noisy; LDOs are preferred).
4. Power subsystem is not the main goal of AMDC, therefore BOM should be small and inexpensive.

## Block Diagram

<img src="images/amdc-power-distribution.svg" />

### 1. Input

A screw terminal input is the main source of power. The nominal voltage is 24V, but can support 20-34V range. Around 12W of power is needed to run all of AMDC.

| Nominal Inputs | Value | Units |
|----------------|-------|-------|
| Voltage        | 24    | V     |
| Current        | 0.5   | A     |
| Power          | 12    | W     |

### 2. Power Protection

To protect the circuitry on the AMDC from over-voltage, under-voltage, and reverse voltage input, [back-to-back series MOSFETs](https://www.vishay.com/docs/75642/si4946cdy.pdf) are used  to act as a switch for input voltage. The gates of these MOSFETs are controlled by the [LTC4365](https://www.analog.com/media/en/technical-documentation/data-sheets/LTC4365.pdf) device, which is configured to only allow a certian range of voltages (20V to 34V). See the note in the schematics for calculation of the resistor values.

### 3. Filter

Once the power protection circuitry has "approved" the input voltage, it then passes through a Class B EMC Emissions filtering stage. This consists of inductors and capacitors which prevent the source for being affected by poor dynamic AMDC power draw.

### 4. Bulk DC/DC Conversion

The filtered input voltage of 24V is then used by three DC/DC converters to efficiently buck the voltage down to levels needed by the circuitry.

- 24V to 5V (trimmed to 5.5V) &mdash; _(P/N: [SHHD003A0A4Z](http://apps.geindustrial.com/publibrary/checkout/SHHD003A0A?TNR=Data%20Sheets|SHHD003A0A|generic))_
- 24V to 15V (trimmed to 16V, 2x) &mdash; _(P/N: [RS6-2415S](https://recom-power.com/pdf/Econoline/RS6.pdf))_

All three DC/DCs are trimmed such that their output is +10% higher than the required voltage so that LDOs can be used later (i.e. 5.5V is the DC/DC output so that a 5V LDO can be used). Note that two different versions of the DC/DCs are available, with the only difference being where the trim resistor goes. Both footprints are provided on the AMDC to allow user BOM flexibility, and one resistor is marked DNP.

The two 15V DC/DC are isolated, which means that their outputs can be used in series to create both positive and negative voltage rails (+/-15V). The mid-point is tied to AMDC common voltage rail (`GND`).

The output of the 5.5V DC/DC is used by the majority of the AMDC (PicoZed, nearly all ICs, etc), and thus has a large amount of bulk capacitence on its output. In prior AMDC designs, issues arose when the 5.5V DC/DC output was directly connected to the rest of the board -- the inrush current caused the DC/DC to current limit and turn itself off. Once it was off, it tried turning back on, thus repeating the cycle and causing a "hiccuping" effect.

To solve this, the inrush limiting block is used on the 5.5V DC/DC output. The main device behind this is the [TI TPS22965](http://www.ti.com/lit/ds/symlink/tps22965.pdf), a load switch with adjustable rise time. The rise time, set by external capacitor, is set such that the DC/DC does not register a current limiting event. Calculations are provided in the schematics to size this capacitor, but a slower rise time (larger capacitor value) is used in the final design which resulted from experimental test data.

### 5. Individual LDO Conversion

After the DC/DC converters efficiently step the input 24V down to various voltage rails (+/-16V, +5.5V), local LDOs are used to filter the "noisy" DC/DC output for the rest of the AMDC. These LDOs can be grouped into three categories of voltage rails:

1. Analog front-end
    1. +15V &mdash; _(P/N: [MC78M15CDTRKG](https://www.onsemi.com/pub/Collateral/MC78M00-D.PDF))_
    2. -15V &mdash; _(P/N: [MC79M15CDTRKG](https://www.onsemi.com/pub/Collateral/MC79M00-D.PDF))_
2. PicoZed
    1. VIN_HDR (PicoZed main 5V supply) &mdash; _(P/N: [LT1529CQ-5#PBF](https://www.analog.com/media/en/technical-documentation/data-sheets/1529fb.pdf))_
    2. VCCO (PicoZed 1.8V I/O supply) &mdash; _(P/N: [AP2112K-1.8TRG1](https://www.diodes.com/assets/Datasheets/AP2112.pdf))_
3. General purpose
    1. 5V &mdash; _(P/N: [LT1529CQ-5#PBF](https://www.analog.com/media/en/technical-documentation/data-sheets/1529fb.pdf))_
    2. 3.3V &mdash; _(P/N: [AP2114H-3.3TRG1](https://www.diodes.com/assets/Datasheets/AP2114.pdf))_
    3. 1.8V &mdash; _(P/N: [LT1764EQ-1.8#PBF](https://www.analog.com/media/en/technical-documentation/data-sheets/1764fb.pdf))_

The PicoZed requires power-on sequencing for its two supply rails: `VIN_HDR` and `VCCO`. The PicoZed output `LV_VCCIO_EN` is a 1.8V active high signal that the PicoZed asserts when the carrier board must provide the VCCO voltage rail. This feeds the enable pin of the `VCCO` LDO.

## PCB Layout

The floor plan of the AMDC circuit board layout is divided into regions for each subsystem. The power input and conversion region is grouped on the left side, with all signals routed using thick traces. A [trace width calculator](https://www.4pcb.com/trace-width-calculator.html) is used to determine an appropriate trace width for various current levels. The copper weight is assumed to be 1oz and a 10-20C tempurature rise is considered reasonable. Based upon this, various voltage rails require different trace thicknesses.

As an example, the majority of ICs consume less than 100mA of current, so a default 10mil trace width is used, resulting in negligible tempurature rise. However, the power distribution rail for the power stack is designed to support a maximum of 2A, so 50-80mil trace widths are used.

High frequency switching noise is emitted from the DC/DC modules which can affect AMDC operation. Therefore, these "dirty" power rails are kept away from "clean" signals. The voltage rails post LDOs are assumed to be clean, so they are freely routed around the PCB, while DC/DC rails are kept short and localized.

## Voltage Rails / Max Current Limitations

When trying to reason about max power draw on AMDC, remember that the power distribution resembles a tree structure. This means that the sum of power consumed by leaf nodes must be less than what their parent is able to provide (i.e. since `5V`, `3.3V`, `1.8V`, `VIN_HDR`, `VCCO`, and `VREF` all are generated by LDOs from the +5.5V DC/DC converter, the __sum__ of the low-voltage power must be less than the DC/DC capability).

The PicoZed power requirements change depending on what is running in the FPGA and the clock speeds of the DSPs. Xilinx provides a [spreadsheet calculator](https://www.xilinx.com/content/dam/xilinx/support/documentation/sw_manuals/xilinx2019_2/ug440-xilinx-power-estimator.pdf) which can be used to help estimate maximum power draw. Note that typical AMDC firmware does not utilize all FPGA resources, thus does not draw maximum power.

| Voltage Rail Name | Nominal Voltage | Usage                | Nominal Current | Max Current |
|-------------------|-----------------|----------------------|-----------------|-------------|
| `VIN`             | 24V             | All of AMDC          | 500mA           | ~1A (?)     |
| `+15V`            | +15V            | Analog positive rail | ???             | 400mA       |
| `-15V`            | -15V            | Analog negative rail | ???             | 400mA       |
| `VIN_HDR`         | 5V              | PicoZed main power   | ???             | 3A          |
| `VCCO`            | 1.8V            | PicoZed I/O          | ???             | 3A          |
| `5V`              | 5V              | Nearly all ICs       | ???             | 3A          |
| `3.3V`            | 3.3V            | JTAG                 | ???             | 1A          |
| `1.8V`            | 1.8V            | VIO for FPGA         | ???             | 3A          |
| `VREF`            | 2.048V          | Analog inputs        | ???             | 25mA        |

_The above "???" entries will be measured on the REV D design and this document will be updated accordingly._
