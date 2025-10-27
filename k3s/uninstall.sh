#! /bin/bash

# Only run the uninstaller if the `k3s` binary exists on the PATH.
if which k3s >/dev/null 2>&1; then
    echo "Uninstalling k3s..."
	sudo /usr/local/bin/k3s-uninstall.sh
else
	echo "k3s not found on PATH; nothing to uninstall."
	exit 0
fi