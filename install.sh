#!/bin/bash

apt update && apt install -y git neovim \
&& git clone https://github.com/alepar/chia-plotman.git \
&& cd chia-plotman \
&& (
	./prepare.sh
	./start.sh
)