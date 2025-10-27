#!/bin/bash
# Install helm. See: https://helm.sh/docs/intro/install/

if which helm >/dev/null 2>&1; then
	echo "helm is already installed; skipping install."
else

    echo "Installing helm..."
    sudo apt-get install curl gpg apt-transport-https --yes
    curl -fsSL https://packages.buildkite.com/helm-linux/helm-debian/gpgkey | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
    echo "deb [signed-by=/usr/share/keyrings/helm.gpg] https://packages.buildkite.com/helm-linux/helm-debian/any/ any main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
    sudo apt-get update
    sudo apt-get install helm
fi