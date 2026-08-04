# 4-Bit Binary Subtractor

## 📌 Overview
This repository contains the SystemVerilog implementation of a 4-bit binary subtractor. The circuit is designed using a structural modeling approach, cascading one Half Subtractor and three Full Subtractors to compute the difference between two 4-bit binary numbers.

## 📂 Repository Contents
* **`design.sv`**: The main SystemVerilog design file. It includes the modules for the `half_subtractor`, `full_subtractor`, and the top-level `subtractor_4bit` (which utilizes a `generate` block to instantiate the sub-modules).
* **`testbench.sv`**: The testbench file used to apply stimulus to the design, checking various input vectors to ensure the logic works as expected.
* **`waveform.pdf`**: The exported simulation waveform that visually verifies the correct operation of the subtractor, displaying the input combinations alongside the difference and borrow-out signals.

## ⚙️ Circuit Architecture
The 4-bit subtractor is built using a ripple-borrow architecture. It takes two 4-bit inputs (`A` and `B`) and produces a 4-bit difference (`Diff`) along with a final borrow-out (`Bout_final`). 

* **Bit 0 (LSB)**: Computed using a **Half Subtractor**.
* **Bits 1 to 3**: Computed using **Full Subtractors**, which take the borrow-out from the previous stage as their borrow-in to ensure accurate multi-bit subtraction.

## 🚀 How to Simulate
You can run and verify this design using any standard Verilog/SystemVerilog simulator such as **ModelSim**, **Xilinx Vivado**, **Icarus Verilog**, or an online platform like **EDA Playground**.

1. Create a new project or workspace in your simulator.
2. Compile both `design.sv` and `testbench.sv`.
3. Set the top-level module to your testbench.
4. Run the simulation and observe the console output or generate the waveform. 
*(Note: You can view the `waveform.pdf` included in this repo to see the verified expected output).*
