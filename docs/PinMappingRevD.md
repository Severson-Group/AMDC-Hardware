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
| `LV_INV1_PWM1`  | JX2-20      | J1            |
| `LV_INV1_PWM2`  | JX2-18      | J2            |
| `LV_INV1_PWM3`  | JX2-43      | M1            |
| `LV_INV1_PWM4`  | JX2-41      | M2            |
| `LV_INV1_PWM5`  | JX2-13      | H8            |
| `LV_INV1_PWM6`  | JX2-17      | M4            |
| `LV_INV_STS_A1` | JX1-30      | B2            |
| `LV_INV_STS_B1` | JX3-99      | W15           |
| `LV_INV_STS_C1` | JX3-75      | Y19           |
| `LV_INV_STS_D1` | JX3-80      | Y12           |

### Inverter 2

| PCB Signal Name | PicoZed Pin | Zynq-7000 Pin |
|-----------------|-------------|---------------|
| `LV_INV2_PWM1`  | JX2-31      | R7            |
| `LV_INV2_PWM2`  | JX2-29      | P7            |
| `LV_INV2_PWM3`  | JX2-25      | L7            |
| `LV_INV2_PWM4`  | JX2-23      | K7            |
| `LV_INV2_PWM5`  | JX2-19      | M3            |
| `LV_INV2_PWM6`  | JX2-35      | N4            |
| `LV_INV_STS_A2` | JX1-26      | E3            |
| `LV_INV_STS_B2` | JX1-50      | C3            |
| `LV_INV_STS_C2` | JX3-79      | AA11          |
| `LV_INV_STS_D2` | JX3-82      | Y13           |

### Inverter 3

| PCB Signal Name | PicoZed Pin | Zynq-7000 Pin |
|-----------------|-------------|---------------|
| `LV_INV3_PWM1`  | JX2-56      | U1            |
| `LV_INV3_PWM2`  | JX2-54      | U2            |
| `LV_INV3_PWM3`  | JX2-50      | L4            |
| `LV_INV3_PWM4`  | JX2-48      | L5            |
| `LV_INV3_PWM5`  | JX2-44      | P1            |
| `LV_INV3_PWM6`  | JX2-42      | N1            |
| `LV_INV_STS_A3` | JX1-24      | E4            |
| `LV_INV_STS_B3` | JX1-48      | D3            |
| `LV_INV_STS_C3` | JX3-81      | AB11          |
| `LV_INV_STS_D3` | JX3-86      | V13           |

### Inverter 4

| PCB Signal Name | PicoZed Pin | Zynq-7000 Pin |
|-----------------|-------------|---------------|
| `LV_INV4_PWM1`  | JX2-26      | K2            |
| `LV_INV4_PWM2`  | JX2-30      | L2            |
| `LV_INV4_PWM3`  | JX2-32      | L1            |
| `LV_INV4_PWM4`  | JX2-36      | P3            |
| `LV_INV4_PWM5`  | JX2-38      | P2            |
| `LV_INV4_PWM6`  | JX2-24      | J3            |
| `LV_INV_STS_A4` | JX1-20      | F1            |
| `LV_INV_STS_B4` | JX1-44      | C4            |
| `LV_INV_STS_C4` | JX3-85      | V11           |
| `LV_INV_STS_D4` | JX3-88      | V14           |

### Inverter 5

| PCB Signal Name | PicoZed Pin | Zynq-7000 Pin |
|-----------------|-------------|---------------|
| `LV_INV5_PWM1`  | JX2-88      | N8            |
| `LV_INV5_PWM2`  | JX2-90      | P8            |
| `LV_INV5_PWM3`  | JX2-82      | N6            |
| `LV_INV5_PWM4`  | JX2-84      | N5            |
| `LV_INV5_PWM5`  | JX2-69      | K5            |
| `LV_INV5_PWM6`  | JX2-67      | J5            |
| `LV_INV_STS_A5` | JX1-18      | F2            |
| `LV_INV_STS_B5` | JX1-42      | D5            |
| `LV_INV_STS_C5` | JX3-87      | W11           |
| `LV_INV_STS_D5` | JX3-92      | R17           |

### Inverter 6

| PCB Signal Name | PicoZed Pin | Zynq-7000 Pin |
|-----------------|-------------|---------------|
| `LV_INV6_PWM1`  | JX2-64      | M6            |
| `LV_INV6_PWM2`  | JX2-68      | R5            |
| `LV_INV6_PWM3`  | JX2-70      | R4            |
| `LV_INV6_PWM4`  | JX2-74      | P6            |
| `LV_INV6_PWM5`  | JX2-76      | P5            |
| `LV_INV6_PWM6`  | JX2-62      | L6            |
| `LV_INV_STS_A6` | JX1-14      | E5            |
| `LV_INV_STS_B6` | JX1-38      | G1            |
| `LV_INV_STS_C6` | JX3-91      | W12           |
| `LV_INV_STS_D6` | JX3-94      | T17           |

### Inverter 7

| PCB Signal Name | PicoZed Pin | Zynq-7000 Pin |
|-----------------|-------------|---------------|
| `LV_INV7_PWM1`  | JX2-81      | J8            |
| `LV_INV7_PWM2`  | JX2-83      | K8            |
| `LV_INV7_PWM3`  | JX2-87      | M8            |
| `LV_INV7_PWM4`  | JX2-89      | M7            |
| `LV_INV7_PWM5`  | JX2-93      | AB21          |
| `LV_INV7_PWM6`  | JX2-95      | AB22          |
| `LV_INV_STS_A7` | JX1-12      | F5            |
| `LV_INV_STS_B7` | JX1-36      | H1            |
| `LV_INV_STS_C7` | JX3-93      | W13           |
| `LV_INV_STS_D7` | JX3-98      | V16           |

### Inverter 8

| PCB Signal Name | PicoZed Pin | Zynq-7000 Pin |
|-----------------|-------------|---------------|
| `LV_INV8_PWM1`  | JX2-94      | AB18          |
| `LV_INV8_PWM2`  | JX2-100     | T16           |
| `LV_INV8_PWM3`  | JX2-75      | J6            |
| `LV_INV8_PWM4`  | JX2-99      | AA20          |
| `LV_INV8_PWM5`  | JX2-97      | AA19          |
| `LV_INV8_PWM6`  | JX2-96      | AB19          |
| `LV_INV_STS_A8` | JX1-10      | H5            |
| `LV_INV_STS_B8` | JX1-32      | B1            |
| `LV_INV_STS_C8` | JX3-97      | V15           |
| `LV_INV_STS_D8` | JX3-100     | W16           |


## Analog

| PCB Signal Name | PicoZed Pin | Zynq-7000 Pin |
|-----------------|-------------|---------------|
| `ADC_CNV`       | JX1-9       | H6            |
| `ADC_SCK`       | JX1-37      | D8            |
| `ADC_CLKOUT`    | JX1-23      | G4            |
| `ADC_SDO1`      | JX1-11      | H4            |
| `ADC_SDO2`      | JX1-13      | H3            |
| `ADC_SDO3`      | JX1-17      | G3            |
| `ADC_SDO4`      | JX1-19      | G2            |
| `ADC_SDO5`      | JX1-25      | F4            |
| `ADC_SDO6`      | JX1-29      | G6            |
| `ADC_SDO7`      | JX1-31      | F6            |
| `ADC_SDO8`      | JX1-35      | E8            |

## Encoder

| PCB Signal Name | PicoZed Pin | Zynq-7000 Pin |
|-----------------|-------------|---------------|
| `LV_ENC_1A`     | JX1-54      | A2            |
| `LV_ENC_1B`     | JX1-56      | A1            |
| `LV_ENC_1Z`     | JX1-62      | D7            |
| `LV_ENC_2A`     | JX1-64      | D6            |
| `LV_ENC_2B`     | JX1-68      | A5            |
| `LV_ENC_2Z`     | JX1-70      | A4            |

## isoSPI

### SPI1

| PCB Signal Name | PicoZed Pin | Zynq-7000 Pin |
|-----------------|-------------|---------------|
| `LV_SPI1_SCLK`  | JX1-47      | B4            |
| `LV_SPI1_MISO`  | JX1-41      | C6            |
| `LV_SPI1_MOSI`  | JX1-49      | B3            |
| `LV_SPI1_NSS`   | JX1-42      | D5            |
| `LV_SPI1_IN`    | JX1-88      | Y14           |
| `LV_SPI1_OUT`   | JX1-74      | A7            |

### SPI2

| PCB Signal Name | PicoZed Pin | Zynq-7000 Pin |
|-----------------|-------------|---------------|
| `LV_SPI2_SCLK`  | JX1-61      | E2            |
| `LV_SPI2_MISO`  | JX1-67      | F7            |
| `LV_SPI2_MOSI`  | JX1-63      | D2            |
| `LV_SPI2_NSS`   | JX1-55      | C1            |
| `LV_SPI2_IN`    | JX1-90      | Y15           |
| `LV_SPI2_OUT`   | JX1-76      | A6            |

### SPI3

| PCB Signal Name | PicoZed Pin | Zynq-7000 Pin |
|-----------------|-------------|---------------|
| `LV_SPI3_SCLK`  | JX1-73      | G8            |
| `LV_SPI3_MISO`  | JX1-67      | F7            |
| `LV_SPI3_MOSI`  | JX1-75      | G7            |
| `LV_SPI3_NSS`   | JX1-69      | E7            |
| `LV_SPI3_IN`    | JX1-92      | V18           |
| `LV_SPI3_OUT`   | JX1-82      | C8            |

### SPI4

| PCB Signal Name | PicoZed Pin | Zynq-7000 Pin |
|-----------------|-------------|---------------|
| `LV_SPI4_SCLK`  | JX1-87      | AA14          |
| `LV_SPI4_MISO`  | JX1-81      | B7            |
| `LV_SPI4_MOSI`  | JX1-89      | AA15          |
| `LV_SPI4_NSS`   | JX1-83      | B6            |
| `LV_SPI4_IN`    | JX1-94      | W18           |
| `LV_SPI4_OUT`   | JX1-84      | B8            |

## RGB LEDs

| PCB Signal Name   | PicoZed Pin | Zynq-7000 Pin |
|-------------------|-------------|---------------|
| `LV_USER_LED_DIN` | JX2-14      | R8            |
