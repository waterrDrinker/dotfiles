#!/bin/bash
set -e

# ── system ─────────────────────────────
system=(
  git
  base-devel
  man-db
  man-pages
  xdg-utils
  gvfs
)

# ── shell / cli ────────────────────────
cli=(
  neovim
  htop
  tree
  fzf
  zsh
  fastfetch
  openbsd-netcat
)

# ── wm / ui ────────────────────────────
ui=(
  waybar
  rofi
)

# ── terminal ───────────────────────────
terminal=(
  wezterm
)

# ── audio ──────────────────────────────
audio=(
  pipewire
  pipewire-alsa
  pipewire-pulse
  wireplumber
)

# ── fonts ──────────────────────────────
fonts=(
  ttf-jetbrains-mono-nerd
)

# ── apps ───────────────────────────────
apps=(
  firefox
  qbittorrent
  libreoffice
  mpv
  calibre
  cmus
  loupe
)

# ── file management ────────────────────
files=(
  thunar
)

# ── wayland utils ──────────────────────
wayland=(
  grim
  slurp
)

# ── dev ────────────────────────────────
dev=(
  nodejs
  postgresql
  ffmpeg
  iperf3
  perl-image-exiftool
  rust
)

# ── misc ───────────────────────────────
misc=(
  xdg-user-dirs
)

# ── merge all arrays ───────────────────
packages=(
  "${system[@]}"
  "${cli[@]}"
  "${ui[@]}"
  "${terminal[@]}"
  "${audio[@]}"
  "${fonts[@]}"
  "${apps[@]}"
  "${files[@]}"
  "${wayland[@]}"
  "${dev[@]}"
  "${misc[@]}"
)

echo "Installing packages..."
sudo pacman -S --needed --noconfirm "${packages[@]}"
