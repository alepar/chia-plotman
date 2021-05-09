#!/bin/bash

set -Eeuxo pipefail

docker exec -it plotman /bin/bash -c 'cd /chia-blockchain && source ./activate && plotman interactive'
