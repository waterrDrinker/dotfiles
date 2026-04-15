#!/bin/bash
set -e

ROOT_DIR="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"

sway=(
  sway
  swaybg
  swaylock
  swayidle
)

# ── terminal ───────────────────────────
terminal=(
  kitty
)

# ── wm / ui ────────────────────────────
ui=(
  waybar
  wofi
)

# ── wayland utils ──────────────────────
wayland=(
  grim
  slurp
)

sway_packages=(
  "${sway[@]}"
  "${wayland[@]}"
  "${terminal[@]}"
  "${ui[@]}"
)

sudo dnf install -y "${sway_packages[@]}"
