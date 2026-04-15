#!/bin/bash
set -e

# ── system ─────────────────────────────
system=(
  git
  polkit
  polkit-gnome
  man-db
  man-pages
  xdg-utils
  gvfs
  darkman # ⚠️ NOT in official Fedora repos (likely COPR/AUR equivalent)
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

# ── audio ──────────────────────────────
audio=(
  pipewire
  pipewire-alsa
  pipewire-pulseaudio # ⚠ Fedora uses pipewire-pulseaudio (NOT pipewire-pulse)
  wireplumber
)

# ── apps ───────────────────────────────
apps=(
  qbittorrent
  libreoffice
  mpv
  calibre
  cmus
  loupe
)

# ── file management ────────────────────
files=(
  nautilus
)

# ── dev ────────────────────────────────
dev=(
  nodejs
  postgresql
  ffmpeg
  iperf3
  perl-Image-ExifTool # ⚠ Fedora package name differs
  rust
)

# ── misc ───────────────────────────────
misc=(
  xdg-user-dirs
  xdg-desktop-portal
)

# ── merge all arrays ───────────────────
main_packages=(
  "${system[@]}"
  "${cli[@]}"
  "${audio[@]}"
  "${apps[@]}"
  "${files[@]}"
  "${dev[@]}"
  "${misc[@]}"
)

sudo dnf install -y "${main_packages[@]}"
