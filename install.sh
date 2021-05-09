#!/bin/bash

apt update && apt install -y git \
&& git clone https://github.com/alepar/chia-plotman.git \
&& cd chia-plotman \
&& (
	./prepare.sh
	./build.sh
	./start.sh
)