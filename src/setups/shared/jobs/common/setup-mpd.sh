#!/bin/bash
set -e

MPD_HOME="$HOME/.config/mpd"

mkdir -p "$MPD_HOME" "$MPD_HOME/playlists" "$HOME/.local/state/mpd"

if ! command -v mpd >/dev/null 2>&1; then
  echo "MPD is not installed. Skipping..."
  exit 0
fi

if systemctl --user list-unit-files | grep -q "^mpd.service"; then
  systemctl --user enable --now mpd
else
  echo "mpd.service not found (systemd user service missing)"
  exit 0
fi
