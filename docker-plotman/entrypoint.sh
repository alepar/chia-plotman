#!/bin/bash

set -Eeuo pipefail

source ./activate

./gomplate -d config=/root/config.yaml -f ./plotman.tmpl.yaml > /root/.config/plotman/plotman.yaml

plotman status