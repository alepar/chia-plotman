#!/bin/bash

set -Eeuxo pipefail

apt update && apt install -y git

git clone https://github.com/alepar/chia-plotman.git

cd chia-plotman

./prepare.sh
./start.sh