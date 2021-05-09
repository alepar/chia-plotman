#!/bin/bash

set -Eeuo pipefail

# Setup Docker
apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    neovim

if [ ! -f "/usr/share/keyrings/docker-archive-keyring.gpg" ]; then
	curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
fi
if [ ! -f "/etc/apt/sources.list.d/docker.list" ]; then
	echo \
	  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
	  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
fi
which docker || apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io

# Make swap
if [ ! -f "/root/swap" ]; then
	dd if=/dev/zero of=/root/swap bs=1M count=4096
	mkswap /root/swap
	swapon /root/swap
fi
