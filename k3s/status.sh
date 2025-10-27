!#/bin/bash
systemctl list-units --type=service --state=running | grep k3s
ps aux | grep k3s
