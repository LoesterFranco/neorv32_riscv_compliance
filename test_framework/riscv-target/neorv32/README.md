# Simulation

The NEORV32 is simulated using the project's default testbench.

Each architecture-specific makefile in the `device` folder uses an _uncool hack_: `sed` is used in the makefile to
nable/disable the required `CPU_EXTENSION_RISCV_xxx` VHDL configuration generics in the testbench (`neorv32/sim/neorv32_tb.vhd`).

For instance, the `rv32i` tests requires the `C`-extensions to be disabled - which is enabled by default in the testbench.

GHDL is used for simulating the processor.
The results are dumped via the data console and file output function of the processor's `DEVNULL` peripheral device.
