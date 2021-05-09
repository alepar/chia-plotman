#!/bin/bash

set -Eeuo pipefail

docker exec -it --name plotman /bin/bash -c 'cd /chia-blockchain && source ./activate && plotman interactive'
