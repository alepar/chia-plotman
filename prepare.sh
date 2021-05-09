#!/bin/bash

set -Eeuxo pipefail

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

# Make swap
if [ ! -f "/swapfile" ]; then
	dd if=/dev/zero of=/swapfile bs=1M count=4096
	mkswap /swapfile
	swapon /swapfile
fi

# Install Chia
rm -rf ./chia-blockchain
git clone https://github.com/Chia-Network/chia-blockchain.git -b latest --recurse-submodules
cd chia-blockchain

sh install.sh

. ./activate
chia init

# Install Plotman
pip install --force-reinstall git+https://github.com/ericaltendorf/plotman@main

# Install supervisor
pip install supervisor

cat <<EOF > ${script_dir}/supervisor.yaml
[supervisord]
logfile=/var/log/supervisord.log

[program:plotman]
command=${script_dir}/plot.sh
EOF