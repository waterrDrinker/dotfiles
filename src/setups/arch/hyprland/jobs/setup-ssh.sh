#!/bin/bash
set -e

# Ensure the SSH config directory exists
sudo mkdir -p /etc/ssh/sshd_config.d

# Deny root login
echo "PermitRootLogin no" | sudo tee /etc/ssh/sshd_config.d/20-deny_root.conf >/dev/null

# Restart SSH daemon to apply changes
sudo systemctl restart sshd

echo "SSH hardened: root login disabled."
