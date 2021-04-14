# PicoZed

This document descibes considerations for the PicoZed selection: part numbers and variants, capabilities, etc.

**Summary: the AMDC uses the [7Z030 version of the PicoZed](https://www.avnet.com/shop/us/products/avnet-engineering-services/aes-z7pz-7z030-som-i-g-rev-e-3074457345635303359).** The 7Z015 version can work with the AMDC hardware design, but would require very slight firmware changes.

## Background

The AMDC board is techniquely a "carrier card" for the PicoZed module. The PicoZed plugs into the AMDC board via the three high-density connectors. All the processing power of the AMDC is directly from the PicoZed -- the AMDC hardware PCB has no processing capability of its own. The AMDC will not operate without the PicoZed! The AMDC hardware design is owned by the Severson Group and is available publicly on [GitHub](https://github.com/Severson-Group/AMDC-Hardware).

The PicoZed is techniquely a "system-on-module" (SoM) for the Xilinx Zynq processor. This means that the PicoZed includes all relevant circuitry to power and use the raw Xilinx processor. This includes the sensitive power supply circuitry, decoupling caps, volatile RAM and non-volatile storage, and PHY devices (e.g. for Ethernet). The PicoZed comes in a variety of flavors -- different Xilinx Zynq processors models. The cost per PicoZed varies from ~$180 to ~$380 depending on the performance and I/O capabilities.

The actual processor which drives the AMDC is the Xilinx Zynq System-on-Chip (SoC). All code runs on this processor. It is responsible for interfacing to the PCB subsystems, running the real-time user control code, and interfacing to the host PC system. The Xilinx Zynq SoC is a very interesting device with a complex architecture -- it can be thought of as including a discrete FPGA and discrete DSP in the same device, with high-performance communication between them. Discussion on how the Zynq SoC works is beyond the scope of this article.

## PicoZed Version Selection

The PicoZed is sold in various versions that differ by the Xilinx Zynq part model. The functionality is grouped as follows:

- 7Z010 / 7Z020 have similar functionality and are fairly interchangable
- 7Z015 / 7Z030 have similar functionality and are fairly interchangable

However, the two groups are not exactly interchangable -- the I/O changes fairly drastically between the groups. The AMDC is designed for the 7Z015/7Z030 group since these have more I/O available.

### `7Z015` vs. `7Z030`

TODO: How to pick ...

## Picozed Supplier(s)

There is only one supplier: Avnet. See their PicoZed product offering on their [website](https://www.avnet.com/wps/portal/us/products/avnet-boards/avnet-board-families/picozed/).
