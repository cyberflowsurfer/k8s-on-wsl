#!/bin/bash
# Install K9s Kubernetes CLI Dashboard
# Reference: https://github.com/derailed/k9s
wget https://github.com/derailed/k9s/releases/latest/download/k9s_linux_amd64.deb && sudo apt install ./k9s_linux_amd64.deb && rm k9s_linux_amd64.deb
k9s version
