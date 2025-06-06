4-bit Ripple Carry Adder in Verilog

Overview

This project implements a 4-bit Ripple Carry Adder (RCA) in Verilog using structural modeling. The RCA adds two 4-bit numbers (a and b) with a carry-in (cin), producing a 4-bit sum (sum) and a carry-out (cout). It is built using four Full Adder modules. A testbench is included to verify functionality through simulation in Vivado.

Modules

fulladder





Description: A single-bit Full Adder used as a building block for the RCA.



Inputs:





a: First single-bit input.



b: Second single-bit input.



cin: Carry-in input.



Outputs:





sum: Single-bit sum output (a XOR b XOR cin).



carry: Single-bit carry-out output.



Functionality:





Sum: Computed using a three-input XOR gate (sum = a XOR b XOR cin).



Carry: Computed using three AND gates (t0 = a AND b, t1 = b AND cin, t2 = a AND cin) and an OR gate (carry = t0 OR t1 OR t2).



Style: Structural modeling with XOR, AND, and OR gates.

ripple_carry





Description: A 4-bit Ripple Carry Adder designed structurally.



Inputs:





a[3:0]: First 4-bit input number.



b[3:0]: Second 4-bit input number.



cin: Carry-in input.



Outputs:





sum[3:0]: 4-bit sum of a, b, and cin.



cout: Carry-out output.



Functionality:





Comprises four fulladder instances connected in series.



Each Full Adder’s carry-out feeds into the next stage’s carry-in (co1, co2, co3, cout).



Computes the sum bit-by-bit, propagating the carry through each stage.



Style: Structural modeling.

testbench





Description: A testbench to simulate and verify the 4-bit RCA.



Functionality:





Inputs: 4-bit vectors a and b, and single-bit cin.



Uses $random to generate 10 random test cases for a, b, and cin.



Applies a 10ns delay between test cases.





Time Scale: Defined as 1ns / 1ps for simulation precision.



Purpose: Verifies the RCA correctly computes the sum and carry-out for random input combinations.

Files





fulladder.v: Verilog module for the Full Adder.



ripple_carry.v: Verilog module for the 4-bit RCA.



testbench.v: Testbench for simulation.

Circuit Diagram

Below is the circuit diagram for the 4-bit Ripple Carry Adder.

![RCA](https://github.com/user-attachments/assets/9bc41444-7e5e-4bb2-988e-9f539dfb3234)




Simulation in Vivado





Setup:





Open Xilinx Vivado (e.g., 2023.2 or later).



Create a new RTL project and specify a project name/location.



Add Files:





Add fulladder.v, ripple_carry.v, and testbench.v via "Add Sources."



Set testbench as the top module for simulation.



Run Simulation:





Go to "Flow" > "Run Simulation" > "Run Behavioral Simulation."



Vivado’s XSim simulator executes the testbench.



View Results:





Open the waveform viewer to visualize signals.

Simulation Waveform

Below is the simulation waveform from Vivado, showing inputs a[3:0], b[3:0], cin, and outputs sum[3:0], cout over time.
![Screenshot 2025-06-06 184307](https://github.com/user-attachments/assets/45a15226-f154-46c8-a998-b2cd3fcf6cea)
