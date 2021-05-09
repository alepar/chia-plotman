#!/bin/bash

set -Eeuxo pipefail

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)
. ${script_dir}/chia.sh

if [ ! -f "/root/.config/plotman/plotman.yaml" ]; then
	echo "Missing plotman config, generating default"
	plotman config generate
	echo "Please edit plotman config file ('nvim /root/.config/plotman/plotman.yaml')"
	echo "Once done, rerun 'start.sh'"
	exit 1
fi

supervisord -c ${script_dir}/supervisor.yaml