## uInverter Design Calculations


-   nominal dc link voltage - _12V_
-   rated phase current - _2.5A rms_
-   range of allowable switching frequency - _1kHz- 100kHz_
-   range of allowable power frequency (phase frequency) - _640- 1000 Hz_

 
### Core Components
 #### DC Barrel Jack
 
 The 2.1mm [DC barrel jack](https://www.digikey.com/en/products/detail/3643/1528-2553-ND/8346574) is rated for 15Vdc and is supplied from a standard [AC-DC wall adapter](digikey.com/en/products/detail/cui-inc/SWM30-12-NV-P5/7388285) rated for 12V. 

#### DC link 
A 3mF capacitor is selected as a DC link capacitor to protect the voltage ripple from input to the components comprising the half bridge. The capacitor is should be able to withstand a 12V input voltage. 

Using formula 
![](http://ec.kemet.com/wp-content/uploads/sites/4/2019/10/dc-link-design-tips-04-300x70.png)
 * where _Vp(max)_ is chosen to be 0.5V
 * duty cycle _(dc)_ assumed to be 0.75
 * Switching frequency _fsw_ is 100kHz
 * _Iout_ is a maximum of 7.5A 

A 500mF Capacitor with a 1nF capacitor in parallel (to reduce the effect of ESR) are chosen for the DC link.

#### Half Bridges

The half bridge inverter is designed using [MAX5054 Gate Driver](https://datasheets.maximintegrated.com/en/ds/MAX5054-MAX5057.pdf) with an On-State maximum current of 4 A. This works well for a phase current chosen as 2.5Arms. 

The gate driver uses the 12V input voltage as VDD, which fits in the defined range of 4V-15V. The protection circuit comprises 0.1uF capacitor, 1ohm resistor and a protection diode on the input side and a 1uF capacitor between Vdd and ground pins. 


#### R-L Load and Current Sense Resistor

Each phase of the inverter is connected to an R-L load and a sense resistor. Since each phase receives 50% of the bus voltage, i.e., 6V and 2.5Arms as regulated by the driver used in the half-bridge. 

Assuming phase frequency is 1kHz, a 320uH inductor and a 400mOhm resistor is chosen, where the resistor doubles up as a current sense resistor. The 400 mOhm value of the resistor will be justified in the next section, and the impedance of the inductor (Z= 2* *pi* **f* *L) is 2 ohm. In total, an impedance of 2.4ohm draws a maximum of 3.53A in each phase (set at 6V). 

#### Difference Amplifier as Current Sensor

The [INA2143UA](https://www.ti.com/lit/ds/symlink/ina143.pdf?ts=1603995270732&ref_url=https%253A%252F%252Fwww.google.com%252F) is chosen as the current sense unit for the design, same as that chosen for the AMDC board. 

The G=10 V/V configuration from Figure 1 of the datasheet is the most suitable for our design. The absolute maximum input for this IC is 1.1 • Vs = 13.2V which is far from the input expected across the current sense resistor. 

A single input of 12V is provided to each difference amplifier which has an input range of +4.5V to +36V. With a maximum output voltage limited to 10V (the limit on the ADC on the AMDC board. 

> Vo = Maximum Current * Rsense * Gain  
> or  Vo = 2.5A * 0.4 * 10V/V = 10V

Thus the choice of Rsense and the load resistance to be 0.4 Ohm or 400mOhm is justified. 

##### Similarly, the screw post terminals are selected based on the phase voltage and current limits
