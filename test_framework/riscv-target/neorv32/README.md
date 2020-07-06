# Simulation

The NEORV32 is simulated using the project's default testbench. Hence, all tests are
using the default processor configuration `rv32imc` + `Zicsr`. GHDL is used for simulating the processor.
The results are dumped via the data output function of the processor's `DEVNULL` peripheral device.
