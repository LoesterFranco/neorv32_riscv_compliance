# NEORV32 RISC-V Compliance Test

[![Build Status](https://travis-ci.com/stnolting/neorv32_riscv_compliance.svg?branch=master)](https://travis-ci.com/stnolting/neorv32_riscv_compliance)


## Overview

This project tests the [NEORV32 processor](https://github.com/stnolting/neorv32) for RISC-V
compliance using the [official RISC-V compliance test suite](https://github.com/riscv/riscv-compliance).

Continous integration provided by [Travis CI](https://travis-ci.com/stnolting/neorv32_riscv_compliance)
and powered by [GHDL](https://github.com/ghdl/ghdl).

The following test are supported and executed by the `CI` build:
* `rv32i`
* `rv32im`
* `rv32imc`
* `rv32Zicsr`

The tests result can be found in the [Travic CI build log](https://travis-ci.com/stnolting/neorv32_riscv_compliance).
Passing all tests is indicated by a successful build.


## How It Works

The Travis CI build job is configured via the [`travis.yml`](https://github.com/stnolting/neorv32_riscv_compliance/blob/master/.travis.yml) file.
First, all prerequisistes are installed via the [`.ci/install.sh`](https://github.com/stnolting/neorv32_riscv_compliance/blob/master/.ci/install.sh) script:
* Download and extract the [prebuilt RISC-V GCC binaries](https://github.com/stnolting/riscv_gcc_prebuilt)
* Clone the [`riscv-compliance`](https://github.com/riscv/riscv-compliance) repository
* Clone the [NEORV32](https://github.com/stnolting/neorv32) repository
* Install (copy) the [`NEORV32` target](https://github.com/stnolting/neorv32_riscv_compliance/blob/master/test_framework/riscv-target) to the compliance test suite

Next, the actual tests are started via the [`.ci/run_tests.sh`](https://github.com/stnolting/neorv32_riscv_compliance/blob/master/.ci/run_tests.sh) script:

```
make -C $homedir/riscv-compliance NEORV32_HOME=$NEORV32_HOME_DIR RISCV_TARGET=neorv32 RISCV_DEVICE=rv32i     RISCV_ISA=rv32i     RISCV_PREFIX=riscv32-unknown-elf-
make -C $homedir/riscv-compliance NEORV32_HOME=$NEORV32_HOME_DIR RISCV_TARGET=neorv32 RISCV_DEVICE=rv32im    RISCV_ISA=rv32im    RISCV_PREFIX=riscv32-unknown-elf-
make -C $homedir/riscv-compliance NEORV32_HOME=$NEORV32_HOME_DIR RISCV_TARGET=neorv32 RISCV_DEVICE=rv32imc   RISCV_ISA=rv32imc   RISCV_PREFIX=riscv32-unknown-elf-
make -C $homedir/riscv-compliance NEORV32_HOME=$NEORV32_HOME_DIR RISCV_TARGET=neorv32 RISCV_DEVICE=rv32Zicsr RISCV_ISA=rv32Zicsr RISCV_PREFIX=riscv32-unknown-elf-
```

The invoked makefiles compile the test programs and use the `blink_led` example project from the NEORV32 repository to generate an executable. This
executable is installed as VHDL memory initilization file into the processor's `rtl/core` folder. Finally, GHDL is used to simulate the processor using
its default testbench, which configures a `rv32imc` + `rv32Zicsr` CPU. The results are dumped to a file using the processor's DEVNULL simulation output
feature.


For more information take a look a the [![NEORV32 datasheet](https://raw.githubusercontent.com/stnolting/neorv32/master/docs/figures/PDF_32.png) NEORV32 datasheet](https://raw.githubusercontent.com/stnolting/neorv32/master/docs/NEORV32.pdf).


## License

This is a hobby project released under the BSD 3-Clause license. No copyright infringement intended.
Other implied/used projects might have different licensing - see their documentation to get more information.
