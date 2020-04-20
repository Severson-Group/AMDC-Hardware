# Advanced Motor Drive Controller (AMDC) Hardware

![AMDC REV D Hardware](amdc-rev-d.jpg?raw=true "AMDC REV D Hardware")

AMDC is a platform that provides relevent interfaces which can be used to control power electronics. The AMDC hardware is a PCB that serves as a carrier card for a [PicoZed SoM](http://zedboard.org/product/picozed).

The provided interfaces include:
- 48 digital output channels (able to provide PWM signals for 8 three phase, two level inverters)
- 8 analog input channels (+- 10V differential input)
- 4 SPI ports with differential input and output lines
- 2 quadrature encoder input

![AMDC Block Diagram](amdc-block-diagram.png?raw=true "AMDC Block Diagram")

## Background

This project originated as [Nathan Petersen's](https://github.com/npetersen2) Independent Study project during Spring 2018, advised by Prof. Eric Severson. It is now actively maintained by the [Severson Research Group](http://severson.wempec.wisc.edu/) as a hardware platform for the AMDC system. Open source firmware is available on GitHub under the [AMDC-Firmware](https://github.com/Severson-Group/AMDC-Firmware) repository. 

## Repository Structure

The `altium` directory contains all files pertaining to schematics / board design in Altium Designer. These files should be the latest working copy of the project.

The `REVyyyymmdd*` directories represent snapshots of the project that were used to produce a physical PCB. These directories contain the *Gerber*, *Drill* (Excellon format), *Bill of Materials* (XLS), and *Schematic* (PDF) files.
- `REV` indicates a revision of design for manufacturing
- `yyyymmdd` indicates the date on which design was frozen
- `*` (letter) indicates which revision in sequence (A - first, B - second, etc.)
