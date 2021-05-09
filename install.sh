#!/bin/bash

set -Eeuxo pipefail

apt update && apt install -y git

git clone https://github.com/alepar/chia-plotman.git

(
	./prepare.sh
	./build.sh
	./start.sh
)