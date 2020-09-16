# Micro Advanced Motor Drive Controller (uAMDC) Hardware

## Table of Contents
- [uAMDC Overview](https://github.com/Severson-Group/AMDC-Hardware/tree/uamdc-rev-a-pcb/uAMDC#uamdc-overview)
- [uAMDC Documentation](https://github.com/Severson-Group/AMDC-Hardware/tree/uamdc-rev-a-pcb/uAMDC#uamdc-documentation)
- [Background](https://github.com/Severson-Group/AMDC-Hardware/tree/uamdc-rev-a-pcb/uAMDC#background)
- [Repository Structure](https://github.com/Severson-Group/AMDC-Hardware/tree/uamdc-rev-a-pcb/uAMDC#repository-structure)

## uAMDC Overview
![uAMDC 3D Image](https://github.com/Severson-Group/AMDC-Hardware/blob/uamdc-rev-a-pcb/uAMDC/docs/Images/uAMDC_3D.JPG?raw=true)

The uAMDC is a low-cost and compact version of the AMDC platform. The uAMDC is a PCB with a STM32H753 DSP, an inexpensive ($13) high-performance single-core ARM Cortex-M7 microprocessor, and a Lattice iCE40 HX4K FPGA that is reasonably powerful and inexpensive ($6). 

The PCB provides the following interfaces to interact with power electronics: 
- 24 digital output channels (via 4 three phase, two level inverters)
- 8 analog input channels (+- 10V differential input)
- 4 SPI ports with differential input and output lines
- 2 quadrature encoder input

## uAMDC Documentation
Detailed documentation about the hardware of the uAMDC is available. Check it out [here...](https://github.com/Severson-Group/AMDC-Hardware/tree/uamdc-rev-a-pcb/uAMDC/docs)

## Background
The purpose of this project is to create an inexpensive and smaller version of the existing AMDC platform.

## Repository Structure
The `altium` directory contains all files pertaining to schematics / board design in Altium Designer. These files should be the latest working copy of the project.

The `RevxxA` directory currently contains 3D images of the uAMDC, the BOM, and a pdf copy of the uAMDC schematics.
