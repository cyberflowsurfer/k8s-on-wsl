#!/bin/bash
# Install K3s packaged Kubernetes 
# https://k3s.io/

if which k3s >/dev/null 2>&1; then
	echo "k3s is already installed; skipping install."
else
    echo "Installing k3s..."
    curl -sfL https://get.k3s.io | sh -
fi


