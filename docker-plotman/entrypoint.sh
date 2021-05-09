#!/bin/bash

set -Eeuxo pipefail

source ./activate

mkdir -p /root/.config/plotman
./gomplate -d config=/root/config.yaml -f ./plotman.tmpl.yaml > /root/.config/plotman/plotman.yaml

plotman plot