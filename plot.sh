#!/bin/bash

set -Eeuxo pipefail

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

. ${script_dir}/chia.sh                 
plotman plot