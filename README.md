# 8-BIT-ALU-DESIGN
8-bit ALU implemented in Logisim-evolution with full flag support (Z, C, V, N).
# 8-Bit Arithmetic Logic Unit (ALU) Design

## Project Overview
This project presents an 8-bit Arithmetic Logic Unit (ALU) designed and simulated using **Logisim-evolution** and implemented in **Verilog HDL**. The design handles 8-bit signed/unsigned operations with full hardware flag evaluation ($Z, C, V, N$). Functional correctness was verified via timing waveforms generated in EDA Playground using Icarus Verilog.

## Hardware Architecture & Status Flags
The ALU features four status flags evaluated dynamically based on the current output $Y$:

- **Zero Flag ($Z$)**: Outputs `1` when all output bits $Y[7:0]$ are `0` (implemented using an 8-input NOR gate).
- **Carry Flag ($C$)**: Captures addition carry-out or subtraction borrow-out.
- **Overflow Flag ($V$)**: Outputs `1` when signed arithmetic overflow occurs, evaluated via $V = (\overline{A_7 \oplus B_7}) \cdot (A_7 \oplus Y_7)$ for addition.
- **Negative Flag ($N$)**: Directly mirrors the Most Significant Bit ($Y_7$) to represent negative values in 2's complement.
---
## Opcode Functionality Table

| Opcode (4-bit) | Operation | Description |
| :---: | :---: | :--- |
| `0000` | **ADD** | Addition ($A + B$) |
| `0001` | **SUB** | Subtraction ($A - B$) |
| `0010` | **AND** | Bitwise AND ($A \land B$) |
| `0011` | **OR**  | Bitwise OR ($A \lor B$) |
| `0100` | **XOR** | Bitwise XOR ($A \oplus B$) |
| `0101` | **NOT** | Bitwise NOT ($\sim A$) |
| `0110` | **SLL** | Shift Left Logical ($A \ll B[2:0]$) |
| `0111` | **SLR** | Shift Right Logical ($A \gg B[2:0]$) |
---  
## Repository Files
- `ALU_Final.circ` - Complete Logisim-evolution circuit schematic.
- `alu_8bit.v` - Verilog HDL design module.
- ## Online Simulation
- View and run the interactive simulation on EDA Playground: [EDA Playground Project Link](https://edaplayground.com/x/ErqJ)
- `tb_alu_8bit.v` - Verilog testbench file.
- `waveform_results.png` - Simulation timing waveforms from EDA Playground.
