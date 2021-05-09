#!/bin/bash

set -Eeuxo pipefail

docker build -t plotman ./docker-plotman
