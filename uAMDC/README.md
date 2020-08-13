# Micro Advanced Motor Drive Controller (uAMDC) Hardware

uAMDC is a low-cost and compact version of the AMDC platform. The uAMDC is a PCB with a STM32H753 DSP, an inexpensive ($13) high-performance single-core ARM Cortex-M7 microprocessor, and a Lattice iCE40 HX4K FPGA that is reasonably powerful and inexpensive ($6). 

The DSP and FPGA communicate via the DSP's Flexible Memory Controller (FMC), an internal controller that allows the DSP to connect to external memories, including SRAM, PSRAM, SDRAM, NOR Flash, and NAND Flash. Upon startup, there is a configuration SPI bus that is used to send a bitstream from the DSP to the FPGA. Additionally, there is an 8-bit address bus and an 8-bit data bus between the DSP and FPGA. This allows for faster communication than a normal SPI bus. However, a normal SPI bus has also been electrically connected between the two as a backup communication interface.

The PCB provides the following interfaces to interact with power electronics: 
- 24 digital output channels (via 4 three phase, two level inverters)
- 8 analog input channels (+- 10V differential input)
- 4 SPI ports with differential input and output lines
- 2 quadrature encoder input

<img width="992" alt="Screen Shot 2020-08-09 at 6 17 43 PM" src="https://user-images.githubusercontent.com/52708670/89743847-da2e1e00-da6c-11ea-90eb-54a3054414af.png">

## uAMDC Documentation
Below are the links to:
- [uAMDC.pdf](https://github.com/Severson-Group/AMDC-Hardware/blob/uamdc-rev-a-sch/uAMDC/uAMDC_sch.pdf)
- [BOM](https://github.com/Severson-Group/AMDC-Hardware/blob/uamdc-rev-a-sch/uAMDC/uAMDC_BOM.csv)
- [PCB 3D screen capture from Altium](https://github.com/Severson-Group/AMDC-Hardware/blob/uamdc-rev-a-sch/uAMDC/uAMDC_3D.JPG)
