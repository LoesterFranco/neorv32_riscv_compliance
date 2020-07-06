#!/bin/bash

# Abort if any command returns != 0
set -e

# Project home folder
homedir="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
homedir=$homedir/..

# neorv32 home folder
NEORV32_HOME_DIR=$homedir/neorv32

echo ""
echo "Starting compliance tests..."
echo ""

# Run tests
make --silent -C $homedir/riscv-compliance NEORV32_HOME=$NEORV32_HOME_DIR RISCV_TARGET=neorv32 RISCV_DEVICE=rv32i     RISCV_ISA=rv32i     RISCV_PREFIX=riscv32-unknown-elf-
make --silent -C $homedir/riscv-compliance NEORV32_HOME=$NEORV32_HOME_DIR RISCV_TARGET=neorv32 RISCV_DEVICE=rv32im    RISCV_ISA=rv32im    RISCV_PREFIX=riscv32-unknown-elf-
make --silent -C $homedir/riscv-compliance NEORV32_HOME=$NEORV32_HOME_DIR RISCV_TARGET=neorv32 RISCV_DEVICE=rv32imc   RISCV_ISA=rv32imc   RISCV_PREFIX=riscv32-unknown-elf-
make --silent -C $homedir/riscv-compliance NEORV32_HOME=$NEORV32_HOME_DIR RISCV_TARGET=neorv32 RISCV_DEVICE=rv32Zicsr RISCV_ISA=rv32Zicsr RISCV_PREFIX=riscv32-unknown-elf-
