## uInverter Design Calculations


-   nominal dc link voltage - _12V_
-   rated phase current - _2.5A_
-   range of allowable switching frequency - typically 100kHz
-   range of allowable power frequency - 47 − 63 Hz

 
### Core Components
 #### DC Barrel Jack
 
 The 2.1mm [DC barrel jack](https://www.digikey.com/en/products/detail/3643/1528-2553-ND/8346574) is rated for 15Vdc and is supplied from a standard [AC-DC wall adapter](digikey.com/en/products/detail/cui-inc/SWM30-12-NV-P5/7388285) rated for 12V. 

#### DC link 
A 3mF capacitor is selected as a DC link capacitor to protect the voltage ripple from input to the components comprising the half bridge. The capacitor is should be able to withstand a 12V input voltage. 

Using formula 
![](http://ec.kemet.com/wp-content/uploads/sites/4/2019/10/dc-link-design-tips-04-300x70.png)
 * where _Vp(max)_ is chosen to be 0.5V
 * duty cycle _(dc)_ assumed to be 0.75
 * Switching frequency _fsw_ is 1kHz
 * _Iout_ is a maximum of 7.5A 

we can use any capacitor >2.8mF. 

#### Half Bridges

The half bridge inverter is designed using [UCC27531 MOSFET gate drivers](https://www.ti.com/lit/ds/symlink/ucc27531.pdf?HQS=TI-null-null-mousermode-df-pf-null-wwe&ts=1603960573394) with an On-State maximum current of 2.5 A. This limits the current in each phase of the inverter to 2.5A and sets the maximum input current drawn to 7.5A.

The gate driver uses the 12V input voltage as VDD, which sits in the defined range of 10V-35V. As per the Figure on Page 41 of the datasheet, OUTH and OUTL are connected by a nominal 1ohm resistor. 

#### R-L Load and Current Sense Resistor

Each phase of the inverter is connected to an R-L load and a sense resistor. Since each phase receives 50% of the bus voltage, i.e., 6V and 2.5A as regulated by the driver used in the half-bridge. 

Given that the frequency of signal is 1kHz, a 320uH inductor and a 400mOhm resistor is chosen, where the resistor doubles up as the Rsense. The 400 mOhm resistor will be justified in the next section, and the impedance of the inductor (Z= 2* *pi* **f* *L) is 2 ohm. In total, the impedance of 2.4ohm draws a maximum of 2.5A in each phase (set at 6V). 

#### Difference Amplifier as Current Sensor

The [INA2143UA](https://www.ti.com/lit/ds/symlink/ina143.pdf?ts=1603995270732&ref_url=https%253A%252F%252Fwww.google.com%252F) is chosen as the current sense unit for the design, same as that chosen for the AMDC board. 

The G=10 V/V configuration from Figure 1 of the datasheet is the most suitable for our design.

A single input of 12V is provided to each difference amplifier which has an input range of +4.5V to +36V. With a maximum output voltage limited to 10V (the limit on the ADC on the AMDC board)   

> Vo = Maximum Current * Rsense * Gain  
> or  Vo = 2.5A * 0.4 * 10V/V = 10V

Thus the choice of Rsense and the load resistance to be 0.4 Ohm or 400mOhm is justified. 

##### Similarly, the screw post terminals are selected based on the phase voltage and current limits
