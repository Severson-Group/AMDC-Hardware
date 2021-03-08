
# uInverter board

uInverter is an accessory board for the AMDC. The purpose of this board is to serve as a low-cost, micro-level prototype board to demonstrate three-phase current regulation using the AMDC.  

[High level schematic](system.jpg)

## Requirements 
Keeping the basic purpose of the board in mind, following requirements are defined -  

### Absolute Ratings
|  State variable     | Min   | Max	 | Unit |
| ------ | ----- | ----- | ---- |
| DC bus voltage : `Vdc` | 10 |35 | V |
| Switching frequency: `fsw` | 20 | 100 | kHz
| Load current (AC) : `i_ac` | 0 | 4 | A
| DC Bus Voltage ripple: `Δ V_dc` | | 1%|  
| Current sensing amplifier output: `V_out(i_sense)` | -10 | 10 | V
|  


## Rated operating conditions
- `Vdc = 12V`  


## Component selection

## Gate Driver

Main requirement for the Gate Driver is to be able to supply sustained required rated current to demonstrate current regulation. 
The IXYS [IXDN614YI](https://www.digikey.com/en/products/detail/ixys-integrated-circuits-division/IXDN614YI/2424709?s=N4IgTCBcDaIJIA0AiA5AbARgCwE04gF0BfIA) gate driver has an output current capability of `4A` `continuous current` as source as well as sink. The input voltage range is `10V to 35V`. Thus, for the purpose of low-cost circuitry for current regulation, this gate driver can be used to drive the RL load and eliminate the switching device altogether. This significantly reduces the circuit complexity and size. The driver suits the application requirements well.

## Current sense amplifier:
The AMDC supplies ±15V for analog sensing. The [INA143U](https://www.digikey.com/en/products/detail/texas-instruments/INA143U/301019) analog amplifier has a gain of `Ag` = `10x` and an acceptable Common Mode voltage range of `-15.4V` to `+15.4V`.  
`CM voltage = ±(1.1[(Vcc)–1.5])`.  

The maximum common mode voltage expected in the system at the 3-phase terminals 
`Vcm` = ± `Vdc`/2 = (±6V).  

To homoginize components accross accessory boards, the same difference amplifier is used for the uInverter as the one on the AMDC.

## Shunt Resistor:
Acceptable voltage at the output of the amplifier `Vout_isense` = ± 10V  
To maximize the resolution of current measurement, the shunt resistor value is selected such that the the output voltage `Vout_isense` would be maximum for the maximum current `I_ac` = 4A  
For this, the difference input voltage 
`Vr_isense_max`= `Vout_isense` / `Ag`  
`Vr_isense_max` = 10 / 10 = 1 V  
Thus, the shunt resistor must have 1V drop at maximum current `Iac` = 4A.  
Hence,  
>`R_shunt` = `Vr_isense_max` / `Iac`  
>`R_shunt` = 1V / 4A  
>`R_shunt` = 0.25 Ω  

 The current sense resistor [15FR250E](https://www.digikey.com/en/products/detail/ohmite/15FR250E/822921) is `0.25Ω` and rated for 5W, is fit for the purpose. 


## Load Inductor:
For determining the value of load inductor, following aspects of operation are connsidered -
1. **R/L ratio:** The purpose of the board is to demonstrate current regulation. Current regulation is predominantly used in motors for torque and speed control in numerous applications. Hence, the load R and L values are chosen to emulate a motor to some extent. Typically, the R/L ratio for [motors](Readme.md#References) lie somewhere in the range of 10 to 100 Ω/mH, with L being in the range of 20 to 100 uH. The inductor is chosen in such a way that the overall load resistance (seen the AC source) has ratio in the above-mentioned range.
2. __Resistance:__ The load inductor is selected to have a high resistance. This will eliminate the need of a separate resistor in the RL load and will also reduce the number of large components on the board (and hence, the size of the board).
3. __Load impedance:__
Maximum commutation frequency of regulation current fcw = 1kHz
Thus, for the load AC circuit, the current should be -  
    >Zm < Vac / Iac  
    Zm < 8V / 4A  
    Zm < 2 Ω
4. __Ripple current:__
The maximum ripple current in the load depends on the value of inductor and is given by the following equation -  
    >`ΔI` =(0.25 * `Vdc`) / (1.5 * `L`*`fs`)  
    `L` - phase inductance.  

    The factor of 1.5 comes in the denominator due to the 3-phase symmetrical load condition. At every time instant, all three inductors are connected to the DC bus ( 1 series and 2 parallel) The equivalent circuit is mentioned [below](eq_inductance.png).  

To pay due diligence to the aspect of emulating physical motor circuits and at the same time minimize the ripple current, a 100uH inductor [PA4344.104NLT](https://www.digikey.com/en/products/detail/pulse-electronics-power/PA4344.104NLT/5436742) 
 is chosen.  

 > `L` = 100 uH  


## DC link capacitor:
The main selection criterion for capacitor selection is the ripple voltage. 
Ripple voltage: The DC voltage is required to be less than 0.5% (<0.6V).
The maximum ripple in the voltage is given by -  

>`ΔV` = `Vdc` / (32 * `L` * `C` * `fs`<sup>2</sup>)   

Thus, for the given ripple, capacitance can be calculated using the above equation as follows -  

>`C` = `Vdc` / (32 * `L` * `ΔV` * `fs`<sup>2</sup> )

>`C` = 625 uF  


Considering a margin of 1.5, capacitor [EEU-FM1V102B](https://www.digikey.com/en/products/detail/panasonic-electronic-components/EEU-FM1V102B/6109617) of `1000uF` is selected.   


## References – 

[1] Benchmark motor specifications:  

| Motor                 | `R` (ohm) |  `L` (uH) | `R/L` (Ω/ mH) |
| -------               | ------- | ------- | ----------- |
| Thingap - LSI-25-10   | 0.993     | 11.878 | 83.6
| Thingap - TG2310       | 0.31 | 20 | 15.5 |
| Portescap - 16ECP36 Ultra EC | 0.47 | 40.4 | 11.7
|





