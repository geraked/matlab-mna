# MATLAB MNA
Modified Nodal Analysis using MATLAB

This program gets an electrical circuit netlist like HSPICE and gives you the Bode (Frequency Response) Plot using Modified Nodal Analysis in MATLAB.

## Getting Started

To run the program, first open Matlab and add to path the **`matlab-mna`** folder and its subfolders.

Open **`Main.m`** and assign your netlist file name to the **`file`** variable.

The netlist file is similar to Hspice, but there are some minor differences:
*	Don’t write **`ac`** for independent voltage sources. (Only **ac** independent voltage sources are supported by this program, so there is no need to mention.)
*	Also don’t mention **`ac`** for the method of analysis.
*	You must determine the **input** and **output** **nodes** of the circuit for computing the frequency response.
*	You don’t need to write **`.end`** in the last line of the netlist file.
*	Only **integer numbers** are allowed to define **nodes**.
* Only these components are supported:
  * **`R`** (Resistor)
  * **`C`** (Capacitor)
  * **`L`** (Inductor)
  * **`V`** (Voltage Source)
  * **`I`** (Current Source)
  * **`E`** (Voltage Controlled Voltage Source)
  * **`G`** (Voltage Controlled Current Source)

* Use the following format to define necessary fields for analysis plot:
```
.    <min-frequency>    <max-frequency>    <input-node>    <output-node>
```
![help](docs/help.gif)