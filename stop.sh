#!/bin/bash

set -Eeuxo pipefail

echo Stopping supervisor
echo Note: any currently running plots will be kept
killall supervisord
