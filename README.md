# FPGA-Based ALU and Finite State Machine (FSM)

This project implements a digital system designed in VHDL that integrates multiple Arithmetic Logic Units (ALUs) with a Finite State Machine (FSM) to perform and control arithmetic and logical operations. The system was developed as part of a digital systems / computer engineering laboratory course.

## Project Overview

- Modular ALU components capable of performing arithmetic and bitwise logic operations  
- FSM-based control logic to manage operation sequencing and state transitions  
- Emphasis on clean hardware design, signal coordination, and correctness through simulation  

## Features

- Arithmetic operations (e.g., addition, subtraction)  
- Logical operations (e.g., AND, OR, XOR)  
- Control-driven function selection  
- FSM-based coordination between modules  
- Verified behavior through simulation and debugging  

## Technologies Used

- VHDL  
- Digital Logic Design  
- Finite State Machines (FSMs)  
- FPGA simulation tools  

## Testing and Verification

The design was validated through simulation to ensure:
- Correct state transitions  
- Accurate ALU outputs  
- Proper signal timing and control behavior  

## Project Structure

FPGA-ALU-FSM/
├── src/
│   ├── alu.vhd              # Arithmetic Logic Unit implementation
│   ├── fsm.vhd              # Finite State Machine control logic
│   ├── control_unit.vhd     # Operation selection and signal coordination
│   └── top_level.vhd        # Top-level module integrating ALU and FSM
│
├── sim/
│   ├── alu_tb.vhd           # ALU testbench
│   ├── fsm_tb.vhd           # FSM testbench
│   └── system_tb.vhd        # Full system simulation testbench
│
├── docs/
│   ├── lab_report.pdf       # Final lab report
│   └── design_notes.md      # Design decisions and implementation details
│
├── constraints/
│   └── pin_assignments.xdc  # FPGA pin constraints (if applicable)
│
├── README.md
└── LICENSE
