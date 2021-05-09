#!/bin/bash

set -Eeuxo pipefail

if [ ! -f "config.yaml" ]; then
	echo "Please run 'cp configs/config.example.yaml config.yaml', edit, and rerun"
	exit 1
fi

tmp_dir=$(grep "tmp_dir: " config.yaml | awk '{print $2;}')
store_dir=$(grep "store_dir: " config.yaml | awk '{print $2;}')

if [ ! -d "$tmp_dir" ]; then
	echo "WARNING! tmp_dir does not exist: $tmp_dir"
	exit 1
fi
if [ ! -d "$store_dir" ]; then
	echo "WARNING! store_dir does not exist: $store_dir"
	exit 1
fi

docker build -t plotman ./docker-plotman
docker run --rm -d --name plotman \
	-v ${tmp_dir}:/plots/tmp \
	-v ${store_dir}:/plots/store \
	-v $(pwd)/config.yaml:/root/config.yaml \
	plotman

echo "Started. Run './interactive.sh' for progress"