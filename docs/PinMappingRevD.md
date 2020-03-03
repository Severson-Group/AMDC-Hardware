# AMDC Pin Mapping &mdash; REV D

This document describes the pin mapping for signals on the AMDC hardware that connect to the PicoZed and Zynq-7000 FPGA module. The Vivado constraint file is based off of this mapping.

## UART

| PCB Signal Name | PicoZed Pin | Zynq-7000 Port |
|-----------------|-------------|----------------|
| `USB_UART_RXD`  | JX3-64      | MIO51 - UART1  |
| `USB_UART_TXD`  | JX3-66      | MIO50 - UART1  |


## EEPROM

| PCB Signal Name | PicoZed Pin | Zynq-7000 Port |
|-----------------|-------------|----------------|
| `EEPROM_CS`     | JX3-37      | MIO42 - SPI3   |
| `EEPROM_SCK`    | JX3-43      | MIO40 - SPI3   |
| `EEPROM_SI`     | JX3-38      | MIO45 - SPI3   |
| `EEPROM_SO`     | JX3-41      | MIO46 - SPI3   |

## Power Stack Interface

### Inverter 1

| PCB Signal Name | PicoZed Pin | Zynq-7000 Pin |
|-----------------|-------------|---------------|
| `LV_INV1_PWM1`  | JX2-20      | PB9?           |
| `LV_INV1_PWM2`  | JX2-18      | PB9?           |
| `LV_INV1_PWM3`  | JX2-43      | PB9?           |
| `LV_INV1_PWM4`  | JX2-41      | PB9?           |
| `LV_INV1_PWM5`  | JX2-13      | PB9?           |
| `LV_INV1_PWM6`  | JX2-17      | PB9?           |
| `LV_INV_STS_A1` | JX1-30      | PB9?           |
| `LV_INV_STS_B1` | JX3-99      | PB9?           |
| `LV_INV_STS_C1` | JX3-75      | PB9?           |
| `LV_INV_STS_D1` | JX3-80      | PB9?           |

### Inverter 2

| PCB Signal Name | PicoZed Pin | Zynq-7000 Pin |
|-----------------|-------------|---------------|
| `LV_INV2_PWM1`  | JX2-31      | PB9?           |
| `LV_INV2_PWM2`  | JX2-29      | PB9?           |
| `LV_INV2_PWM3`  | JX2-25      | PB9?           |
| `LV_INV2_PWM4`  | JX2-23      | PB9?           |
| `LV_INV2_PWM5`  | JX2-19      | PB9?           |
| `LV_INV2_PWM6`  | JX2-35      | PB9?           |
| `LV_INV_STS_A2` | JX1-26      | PB9?           |
| `LV_INV_STS_B2` | JX1-50      | PB9?           |
| `LV_INV_STS_C2` | JX3-79      | PB9?           |
| `LV_INV_STS_D2` | JX3-82      | PB9?           |

### Inverter 3

| PCB Signal Name | PicoZed Pin | Zynq-7000 Pin |
|-----------------|-------------|---------------|
| `LV_INV3_PWM1`  | JX2-56      | PB9?           |
| `LV_INV3_PWM2`  | JX2-54      | PB9?           |
| `LV_INV3_PWM3`  | JX2-50      | PB9?           |
| `LV_INV3_PWM4`  | JX2-48      | PB9?           |
| `LV_INV3_PWM5`  | JX2-44      | PB9?           |
| `LV_INV3_PWM6`  | JX2-42      | PB9?           |
| `LV_INV_STS_A3` | JX1-24      | PB9?           |
| `LV_INV_STS_B3` | JX1-48      | PB9?           |
| `LV_INV_STS_C3` | JX3-81      | PB9?           |
| `LV_INV_STS_D3` | JX3-86      | PB9?           |

### Inverter 4

| PCB Signal Name | PicoZed Pin | Zynq-7000 Pin |
|-----------------|-------------|---------------|
| `LV_INV4_PWM1`  | JX2-26      | PB9?           |
| `LV_INV4_PWM2`  | JX2-30      | PB9?           |
| `LV_INV4_PWM3`  | JX2-32      | PB9?           |
| `LV_INV4_PWM4`  | JX2-36      | PB9?           |
| `LV_INV4_PWM5`  | JX2-38      | PB9?           |
| `LV_INV4_PWM6`  | JX2-24      | PB9?           |
| `LV_INV_STS_A4` | JX1-20      | PB9?           |
| `LV_INV_STS_B4` | JX1-44      | PB9?           |
| `LV_INV_STS_C4` | JX3-85      | PB9?           |
| `LV_INV_STS_D4` | JX3-88      | PB9?           |

### Inverter 5

| PCB Signal Name | PicoZed Pin | Zynq-7000 Pin |
|-----------------|-------------|---------------|
| `LV_INV5_PWM1`  | JX2-88      | PB9?           |
| `LV_INV5_PWM2`  | JX2-90      | PB9?           |
| `LV_INV5_PWM3`  | JX2-82      | PB9?           |
| `LV_INV5_PWM4`  | JX2-84      | PB9?           |
| `LV_INV5_PWM5`  | JX2-69      | PB9?           |
| `LV_INV5_PWM6`  | JX2-67      | PB9?           |
| `LV_INV_STS_A5` | JX1-18      | PB9?           |
| `LV_INV_STS_B5` | JX1-42      | PB9?           |
| `LV_INV_STS_C5` | JX3-87      | PB9?           |
| `LV_INV_STS_D5` | JX3-92      | PB9?           |

### Inverter 6

| PCB Signal Name | PicoZed Pin | Zynq-7000 Pin |
|-----------------|-------------|---------------|
| `LV_INV6_PWM1`  | JX2-64      | PB9?           |
| `LV_INV6_PWM2`  | JX2-68      | PB9?           |
| `LV_INV6_PWM3`  | JX2-70      | PB9?           |
| `LV_INV6_PWM4`  | JX2-74      | PB9?           |
| `LV_INV6_PWM5`  | JX2-76      | PB9?           |
| `LV_INV6_PWM6`  | JX2-62      | PB9?           |
| `LV_INV_STS_A6` | JX1-14      | PB9?           |
| `LV_INV_STS_B6` | JX1-38      | PB9?           |
| `LV_INV_STS_C6` | JX3-91      | PB9?           |
| `LV_INV_STS_D6` | JX3-94      | PB9?           |

### Inverter 7

| PCB Signal Name | PicoZed Pin | Zynq-7000 Pin |
|-----------------|-------------|---------------|
| `LV_INV7_PWM1`  | JX2-81      | PB9?           |
| `LV_INV7_PWM2`  | JX2-83      | PB9?           |
| `LV_INV7_PWM3`  | JX2-87      | PB9?           |
| `LV_INV7_PWM4`  | JX2-89      | PB9?           |
| `LV_INV7_PWM5`  | JX2-93      | PB9?           |
| `LV_INV7_PWM6`  | JX2-95      | PB9?           |
| `LV_INV_STS_A7` | JX1-12      | PB9?           |
| `LV_INV_STS_B7` | JX1-36      | PB9?           |
| `LV_INV_STS_C7` | JX3-93      | PB9?           |
| `LV_INV_STS_D7` | JX3-98      | PB9?           |

### Inverter 8

| PCB Signal Name | PicoZed Pin | Zynq-7000 Pin |
|-----------------|-------------|---------------|
| `LV_INV8_PWM1`  | JX2-94      | PB9?           |
| `LV_INV8_PWM2`  | JX2-100     | PB9?           |
| `LV_INV8_PWM3`  | JX2-75      | PB9?           |
| `LV_INV8_PWM4`  | JX2-99      | PB9?           |
| `LV_INV8_PWM5`  | JX2-97      | PB9?           |
| `LV_INV8_PWM6`  | JX2-96      | PB9?           |
| `LV_INV_STS_A8` | JX1-10      | PB9?           |
| `LV_INV_STS_B8` | JX1-32      | PB9?           |
| `LV_INV_STS_C8` | JX3-97      | PB9?           |
| `LV_INV_STS_D8` | JX3-100     | PB9?           |


## Analog

| PCB Signal Name | PicoZed Pin | Zynq-7000 Pin |
|-----------------|-------------|---------------|
| `ADC_CNV`       | JX1-9      | PB9?           |
| `ADC_SCK`       | JX1-37      | PB9?           |
| `ADC_CLKOUT`    | JX1-23      | PB9?           |
| `ADC_SDO1`      | JX1-11      | PB9?           |
| `ADC_SDO2`      | JX1-13      | PB9?           |
| `ADC_SDO3`      | JX1-17      | PB9?           |
| `ADC_SDO4`      | JX1-19      | PB9?           |
| `ADC_SDO5`      | JX1-25      | PB9?           |
| `ADC_SDO6`      | JX1-29      | PB9?           |
| `ADC_SDO7`      | JX1-31      | PB9?           |
| `ADC_SDO8`      | JX1-35      | PB9?           |

## Encoder

| PCB Signal Name | PicoZed Pin | Zynq-7000 Pin |
|-----------------|-------------|---------------|
| `LV_ENC_1A`     | JX1-54      | PB9?           |
| `LV_ENC_1B`     | JX1-56      | PB9?           |
| `LV_ENC_1Z`     | JX1-62      | PB9?           |
| `LV_ENC_2A`     | JX1-64      | PB9?           |
| `LV_ENC_2B`     | JX1-68      | PB9?           |
| `LV_ENC_2Z`       JX1-70      | PB9?           |

## isoSPI

### SPI1

| PCB Signal Name | PicoZed Pin | Zynq-7000 Pin |
|-----------------|-------------|---------------|
| `LV_SPI1_SCLK`  | JX1-47      | PB9?           |
| `LV_SPI1_MISO`  | JX1-41      | PB9?           |
| `LV_SPI1_MOSI`  | JX1-49      | PB9?           |
| `LV_SPI1_NSS`   | JX1-42      | PB9?           |
| `LV_SPI1_IN`    | JX1-88      | PB9?           |
| `LV_SPI1_OUT`   | JX1-74      | PB9?           |

### SPI2

| PCB Signal Name | PicoZed Pin | Zynq-7000 Pin |
|-----------------|-------------|---------------|
| `LV_SPI2_SCLK`  | JX1-61      | PB9?           |
| `LV_SPI2_MISO`  | JX1-67      | PB9?           |
| `LV_SPI2_MOSI`  | JX1-63      | PB9?           |
| `LV_SPI2_NSS`   | JX1-55      | PB9?           |
| `LV_SPI2_IN`    | JX1-90      | PB9?           |
| `LV_SPI2_OUT`   | JX1-76      | PB9?           |

### SPI3

| PCB Signal Name | PicoZed Pin | Zynq-7000 Pin |
|-----------------|-------------|---------------|
| `LV_SPI3_SCLK`  | JX1-73      | PB9?           |
| `LV_SPI3_MISO`  | JX1-67      | PB9?           |
| `LV_SPI3_MOSI`  | JX1-75      | PB9?           |
| `LV_SPI3_NSS`   | JX1-69      | PB9?           |
| `LV_SPI3_IN`    | JX1-92      | PB9?           |
| `LV_SPI3_OUT`   | JX1-82      | PB9?           |

### SPI4

| PCB Signal Name | PicoZed Pin | Zynq-7000 Pin |
|-----------------|-------------|---------------|
| `LV_SPI4_SCLK`  | JX1-87      | PB9?           |
| `LV_SPI4_MISO`  | JX1-81      | PB9?           |
| `LV_SPI4_MOSI`  | JX1-89      | PB9?           |
| `LV_SPI4_NSS`   | JX1-83      | PB9?           |
| `LV_SPI4_IN`    | JX1-94      | PB9?           |
| `LV_SPI4_OUT`   | JX1-84      | PB9?           |

## RGB LEDs

| PCB Signal Name   | PicoZed Pin | Zynq-7000 Pin |
|-------------------|-------------|---------------|
| `LV_USER_LED_DIN` | JX2-14      | PB9?           |
