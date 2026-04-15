#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(git -C "$SCRIPT_DIR" rev-parse --show-toplevel)"

source "$ROOT_DIR/src/setups/arch/shared/packages/main.sh"

hyprland_packages=(
  hyprland

  waybar
  wofi

  grim
  slurp

  kitty

  dunst

  polkit-gnome

  xdg-desktop-portal-hyprland
  xdg-desktop-portal-gtk

  gtk3
  gtk4
)

packages=(
  "${main_packages[@]}"
  "${hyprland_packages[@]}"
)

echo "Installing packages..."
sudo pacman -S --needed --noconfirm "${packages[@]}"
