# FPGA-Based Random Number Generator with LFSR on Basys 3

## Project Overview
This project focuses on the implementation of an 8-bit random number generator utilizing a Linear Feedback Shift Register (LFSR) and a tapping technique to ensure avoidance of repetition. The design is specifically tailored for the Basys 3 FPGA board and is developed using SystemVerilog (SV) within the Xilinx Vivado environment.

## Structure of the Project

### Directory: RandomNumberGenerator.srcs

#### sim_1/new
This subdirectory contains a basic simulation file for initial testing and validation.

#### sources_1
Here lies the comprehensive design of the project, encompassing the core logic and functionalities.

#### utils_1/imports/synth_1
Within this directory, you'll find files that have already been implemented on my GitHub profile, including essential modules such as debounce and slow clock modules. These components contribute to the overall functionality and efficiency of the project.

#### constrs_1
This file is the .xdc for the Basys3 rev B board
