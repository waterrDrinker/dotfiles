#!/bin/bash
set -e

if ! command -v yay &>/dev/null; then
  echo "Installing yay..."
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  cd /tmp/yay && makepkg -si --noconfirm
fi

aur_packages=(
  brave-bin
  sing-box
  darkman
)

echo "Installing AUR packages..."
yay -S --noconfirm "${aur_packages[@]}"
