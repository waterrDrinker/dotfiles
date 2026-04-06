#!/bin/bash
set -e

# Keep sudo alive for entire script
sudo -v
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

# ── Update system ──────────────────────────────────────────
echo "Updating system..."
sudo pacman -Syu --noconfirm

# ── Packages ──────────────────────────────────────────────
packages=(
  # system
  git
  base-devel
  neovim
  htop
  rofi
  man-db
  man-pages
  openbsd-netcat
  gvfs
  tree
  fzf
  zsh

  # terminal
  wezterm

  # audio
  pipewire
  pipewire-alsa
  pipewire-pulse
  wireplumber

  # fonts
  ttf-jetbrains-mono-nerd

  # programms
  firefox
  qbittorrent
  neovim

  # tools
  thunar
  grim
  slurp
  xdg-user-dirs
)

echo "Installing packages..."
sudo pacman -S --needed --noconfirm "${packages[@]}"

# ── Install AUR helper ─────────────────────────────────────
sudo pacman -S --needed --noconfirm git base-devel

if ! command -v yay &>/dev/null; then
  echo "Installing yay..."
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  cd /tmp/yay && makepkg -si --noconfirm
  cd ~
fi

# ── AUR packages ───────────────────────────────────────────
aur_packages=(
  brave-bin
  sing-box
)

echo "Installing AUR packages..."
yay -S --noconfirm "${aur_packages[@]}"

# ── Enable services ────────────────────────────────────────
services=(
  NetworkManager
  bluetooth
  sshd
)

echo "Enabling services..."
for service in "${services[@]}"; do
  sudo systemctl enable --now "$service"
done

# ── User services ──────────────────────────────────────────
user_services=(
  pipewire
  pipewire-pulse
  wireplumber
)

echo "Enabling user services..."
for service in "${user_services[@]}"; do
  systemctl --user enable --now "$service"
done

# ── Run jobs ─────────────────────────────────────────────────
JOBS_DIR="$(dirname "$0")/jobs"

for job in "$JOBS_DIR"/*.sh; do
  echo "→ Running $job"
  bash "$job"
done

# ── Install Zsh ────────────────────────────────────────────
echo "Installing Zsh..."
sudo pacman -S --needed --noconfirm zsh
bash "$HOME/dotfiles/src/scripts/shared/install-zsh.sh"

echo "Done! Reboot recommended."
