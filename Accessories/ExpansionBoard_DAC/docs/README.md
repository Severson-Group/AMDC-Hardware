
# AMDC DAC Expansion Board

This document describes the design considerations and implementation details for the AMDC DAC expansion board. A block diagram is presented and each component is discussed in detail. Specifications of each component are provided based on the datasheet.

## Relevant Hardware Versions

| Hardware | Version |
| ---- | ----- |
| AMDC | REV D |
| DAC Board | REV B |

## Design Requirements and Considerations

The AMDC DAC expansion board was designed with the following requirements:
1. Work with both the IsoSPI and power stack ports through a single DB-15 connector
2. Minimal I/O data lines as possible (simplified SPI interface)
3. All digital and power signals on the board are isolated from the AMDC
4. Operate the DAC fast enough such that all channels have a throughput of at least 20ksps
5. Slew rate greater than 1V/us
6. 12-bit samples
7. Output Voltage: +/- 10V on all channels

## Block Diagram / External Connections

<img src="images/amdc-dac.svg"> 

### AMDC Connector

The AMDC DAC expansion board interfaces with the AMDC via either the Power Stack or IsoSPI ports, both of which use a DB-15 connector. The pinouts of the two ports differ from one another; jumpers are used to configure the DAC expansion board to a particular pinout. The jumper blocks are discussed in greater detail later in this document.

If the Power Stack port is to be used, additional configuration of the AMDC is required. Each Power Stack port on the AMDC has four status lines. Status lines A, B, and C must be configured as outputs by jumpers on the AMDC. The voltage of the status lines must be configured to 5V in the same manner. More information about the Power Stack can be found [here...](../../../docs/PowerStack.md)

The DAC board contains the IsoSPI transceiver needed to communicate with the IsoSPI port on the AMDC. No additional configuration is needed to interface with the IsoSPI port.

A table of the pinouts for both connector types is shown below:

 
| Pin Number | Power Stack | IsoSPI     |
|------------|-------------|------------|
| 1          | No Connect  | `+5V`      |
| 2          | No Connect  | No Connect |
| 3          | No Connect  | No Connect |
| 4          | No Connect  | No Connect |
| 5          | No Connect  | No Connect |
| 6          | No Connect  | No Connect |
| 7          | No Connect  | `SPI_IP`   |
| 8          | `STS_A`     | `SPI_IM`   |
| 9          | `STS_B`     | No Connect |
| 10         | `STS_C`     | No Connect |
| 11         | No Connect  | `GND`      |
| 12         | No Connect  | No Connect |
| 13         | `+5V`       | No Connect |
| 14         | No Connect  | No Connect |
| 15         | `GND`       | No Connect |

### Jumper Blocks

There is a total of eight jumpers on the DAC board that configure the expected pinout from the DB-15 connector. 

- Jumpers JP1, JP2, and JP3 are used to route the SPI signals used to communicate with the DAC 
- Jumpers JP4 and JP5 are used to route the power signals to the board. 
- Jumpers JP6, JP7, and JP8 enable or disable the SPI signal digital isolator. 

All eight jumpers are critical to the operation of the DAC board and must be installed on the appropriate side of the jumper blocks as designated by the silkscreen.

### DAC

The [DAC60508MC](../REV20200720B/datasheets/dac60508.pdf) 12-bit DAC was selected for its minimal SPI interface. The CS, SCLK, and MOSI lines (supplied by the AMDC) are all that's required to drive each of the eight channels' outputs. The DAC is supplied at 5V with an internally generated _V_<sub>_REF_</sub> = 2.5V. On powerup, the DAC resets all channels' outputs to midscale which scales to 0V across the op amps. A powerup reset event can also be initiated asynchronously of the SPI interface via the onboard push button.

Each of the DAC's channels operates between 0V and _V_<sub>_REF_</sub>. The output voltage is specified by writing data over the SPI interface to an internal data register for each channel. The output voltage follows the equation:

_V_<sub>_DAC_</sub> (_CODE_) = _CODE_ / 2<sup>12</sup> x _V_<sub>_REF_</sub>

More detailed information on the operating conditions of the DAC can be found in the [datasheet](../REV20200720B/datasheets/dac60508.pdf).

### Op Amps

The DAC output voltage ranges between 0V and _V_<sub>_REF_</sub> and must be scaled to the desired range of +/- 10V before being output on the BNC connectors. To achieve this, two [OPA4192IDR](../REV20200720B/datasheets/opa4192.pdf) operational amplifiers implement the desired scaling. Each chip contains four op amps (eight in total), each of which receives a single channel output from the DAC. These Op amps receive +/- 12V supply from onboard power supplies. The non-inverting configuration used on the AMDC DAC expansion board can be seen below:

<img src="images/amdc-dac_op_amp.svg" width="25%">

The equation for the output voltage is as follows:

_V_<sub>_out_</sub> = (_V_<sub>_DAC_</sub>) ( 1 + R<sub>3</sub> / R<sub>2</sub> + R<sub>3</sub> / R<sub>1</sub>) - (V<sub>REF</sub> x R<sub>3</sub> / R<sub>1</sub>)

More detailed information on the operating conditions of the op amps can be found in the [datasheet](../REV20200720B/datasheets/opa4192.pdf).

### LPFs

After the analog output voltage levels are scaled to the desired range of +/- 10V, low-pass filters are implemented to prevent high-frequency noise from reaching the output connectors. A single first-order RC filter is used for each analog output:

<img src="images/amdc-dac_lpf.svg" width="25%">

The cutoff frequency is achieved based on  the resistance and capacitance values of the filter:

_f_<sub>c</sub> = 1 / (2 π _RC_)

The LPF's cutoff frequency is set to 130kHz (a resistor with _R_ = 120Ω and a capacitor with _C_ = 10nF achieves the desired frequency).

### BNC Connectors / Screw Terminal 

There are eight BNC connectors in total (one for each DAC channel) which act as the main output connection for the analog signals. Additionally, there are twelve screw terminals, one for each channel output, and four that are ground connections. The analog voltages for each channel are linked to a single BNC connector as well as a single screw terminal. There are also [ESD protection devices](../REV20200720B/datasheets/SMDA03C-4_THRU_SMDA24C-4_N0298_REV_A.pdf) connected to the channel outputs.

## PCB Layout

Minimal components were placed on the top layer in order to maximize the space between the BNC connectors as well as protect components from physical damage. All analog signals are routed on the bottom layer within the area containing the BNC connectors to shield them from noise generated by the SPI lines. All signal traces have 6mil thickness. Power supply and ground signals have 10mil thickness.

## Datasheets
- [DAC60508MC](../REV20200720B/datasheets/dac60508.pdf)
- [OPA4192IDR](../REV20200720B/datasheets/opa4192.pdf)
- [ESD protection devices](../REV20200720B/datasheets/SMDA03C-4_THRU_SMDA24C-4_N0298_REV_A.pdf)