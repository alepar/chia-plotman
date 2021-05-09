#!/bin/bash

set -Eeuxo pipefail

# Make swap
if [ ! -f "/root/swap" ]; then
	dd if=/dev/zero of=/swapfile bs=1M count=4096
	mkswap /swapfile
	swapon /swapfile
fi

# Install Chia
git clone https://github.com/Chia-Network/chia-blockchain.git -b latest --recurse-submodules
cd chia-blockchain

sh install.sh

. ./activate
chia init

# Install Plotman
pip install --force-reinstall git+https://github.com/ericaltendorf/plotman@main

# Install supervisor
pip install supervisor