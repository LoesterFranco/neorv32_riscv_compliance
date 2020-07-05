# NEORV32 RISC-V Compliance Test

[![Build Status](https://travis-ci.com/stnolting/neorv32_riscv_compliance.svg?branch=master)](https://travis-ci.com/stnolting/neorv32_riscv_compliance)


## Overview

This project tests the [NEORV32 processor](https://github.com/stnolting/neorv32) for RISC-V
compliance using the [official RISC-V compliance test suite](https://github.com/riscv/riscv-compliance).

Continous integration provided by [Travis CI](https://travis-ci.com/stnolting/neorv32_riscv_compliance)
and powered by [GHDL](https://github.com/ghdl/ghdl).

The following test are executed:
* `rv32i`
* `rv32im`
* `rv32imc`
* `rv332Zicsr`

The tests result can be found in the [Travic CI build log](https://travis-ci.com/stnolting/neorv32_riscv_compliance).
Passing all tests is indicated by a successful build.


## How This Project Works

The Travis CI build job is configured via the `travis.yml` file. First, all prerequisistes are installed
via the [`.ci/install.sh`](https://github.com/stnolting/neorv32_riscv_compliance/blob/master/.ci/install.sh) script:
* Download and extract the [prebuilt RISC-V GCC binaries](https://github.com/stnolting/riscv_gcc_prebuilt)
* Clone the [`riscv-compliance`](https://github.com/riscv/riscv-compliance) repository
* Clone the [NEORV32](https://github.com/stnolting/neorv32) repository

The provided new [target folder (`neorv32`)](https://github.com/stnolting/neorv32_riscv_compliance/blob/master/test_framework/riscv-target) is automatically copied into the RISC-V compliance test suite.

Next, the actual tests are started via the [`.ci/run_tests.sh`](https://github.com/stnolting/neorv32_riscv_compliance/blob/master/.ci/run_tests.sh) script:


## License

This is a hobby project released under the BSD 3-Clause license. No copyright infringement intended.
Other implied/used projects might have different licensing - see their documentation to get more information.
