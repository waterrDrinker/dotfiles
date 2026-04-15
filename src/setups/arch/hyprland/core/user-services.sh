#!/bin/bash
set -e

user_services=(
  pipewire
  pipewire-pulse
  wireplumber
  darkman
  xdg-desktop-portal
)

echo "Enabling user services..."
for service in "${user_services[@]}"; do
  systemctl --user enable --now "$service"
done
