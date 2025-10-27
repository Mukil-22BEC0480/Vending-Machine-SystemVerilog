# Vending-Machine-SystemVerilog
FSM-based Vending Machine implemented in SystemVerilog. Accepts ₹5 and ₹10 coins, dispenses a ₹15 product, and returns change automatically.

---

## Overview

This project demonstrates an FSM-based digital design approach in **SystemVerilog**, simulating how a real vending machine works using clocked sequential logic.  
The design was verified through a **SystemVerilog testbench** using **Icarus Verilog** and waveform visualization in **GTKWave**.

---

## Features
- Accepts ₹5 and ₹10 coins  
- Product cost = ₹15  
- Dispenses product when balance ≥ ₹15  
- Returns ₹5 as change if overpaid (₹20 inserted)  
- Designed using **Moore FSM** structure  
- Verification via **SystemVerilog testbench**

---

## File Structure

Vending_Machine_Project/
├── vending_machine.v # RTL design of the vending FSM
├── tb_vending_machine.sv # SystemVerilog testbench
├── run_vending.py # Python script to compile & simulate
└── vending_wave.vcd # Simulation waveform file


---

## How to Run

### 1️ Install Tools
- **Icarus Verilog** → for compilation and simulation  
- **GTKWave** → for waveform visualization  
- **Python 3.x** → for running the automation script  

### 2 Run Simulation
```bash
python run_vending.py

This script will:

Compile both the RTL and testbench

Run the simulation

Generate vending_wave.vcd waveform file

to view View Waveform
gtkwave vending_wave.vcd

