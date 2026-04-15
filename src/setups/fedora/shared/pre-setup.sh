#!/bin/bash

pre_setup() {
  ROOT_DIR="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
  keep_sudo

  echo "Adding RPM Fusion repositories..."

  sudo dnf install -y \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

  echo "Updating system..."

  sudo dnf upgrade -y

  echo "Enabling COPR repository..."

  sudo dnf copr enable -y solopasha/hyprland

  echo "Final system sync..."

  sudo dnf upgrade -y

  echo "Installing NVIDIA driver..."

  sudo dnf install -y akmod-nvidia xorg-x11-drv-nvidia-cuda

  echo "Done. REBOOT REQUIRED."

}
