# 4-bit ALU in SystemVerilog 

A 4-bit Arithmetic Logic Unit supporting 16 operations with status flags (Zero, Positive, Negative, etc).

## Features
- 16 operations:
  - ADD, SUB, INC, DEC
  - SHIFT LEFT/RIGHT, ROTATE LEFT/RIGHT
  - NOT A, NOT B, AND, OR, NAND, NOR, XOR, XNOR
- Status flags:
  - Zero, Positive, Negative
  - Unsigned (GT, LT, EQ)
  - Signed (GTS, LTS)

## Files
- `RTL_ALU.sv` — Main ALU design
- `RTL_ALU_TB.sv` — Testbench for simulation
- `Genus_Script.tcl` — Synthesis script

## Library (Cadence GPDK45)
- fast_vdd1v0_basicCells.lib
- slow_vdd1v0_basicCells.lib

## Simulation
Run using any SystemVerilog simulator Cadence Xcelium

--> For Wavefrom
```bash
xrun -sv RTL_ALU.sv RTL_ALU_TB.sv
```
--> For Synthesis
```bash
genus -f Genus_Script.tcl
```
