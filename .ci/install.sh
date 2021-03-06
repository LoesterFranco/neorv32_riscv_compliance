#!/bin/bash

# Abort if any command returns != 0
set -e

# Download toolchain
echo ""
echo "Downloading prebuilt RISC-V GCC toolchain..."
echo ""
rm -f riscv32-unknown-elf.gcc-9.2.0.rv32i.ilp32.tar.gz
wget https://github.com/stnolting/riscv_gcc_prebuilt/raw/master/data/riscv32-unknown-elf.gcc-9.2.0.rv32i.ilp32.tar.gz

# Decompress toolchain
rm -rf riscv
mkdir riscv
tar -xzf riscv32-unknown-elf.gcc-9.2.0.rv32i.ilp32.tar.gz -C riscv/
pwd
rm -f riscv32-unknown-elf.gcc-9.2.0.rv32i.ilp32.tar.gz

# Download RISC-V compliance test suite
echo ""
echo "Downloading RISC-V Compliance Test Suite"
echo ""
rm -rf riscv-compliance
git clone https://github.com/riscv/riscv-compliance.git

# Download NEORV32 project
echo ""
echo "Downloading NEORV32 Project..."
echo ""
rm -rf neorv32
git clone https://github.com/stnolting/neorv32.git
# check toolchain and compile image generator
make -C neorv32/sw/example/blink_led check

# Copy neorv32 target folder into test suite
echo ""
echo "Installing neorv32 test target..."
echo ""
cp -r test_framework/riscv-target/neorv32 riscv-compliance/riscv-target/.

# Done
ls -al
ls -al riscv/
echo ""
echo "Installation done."
echo ""
