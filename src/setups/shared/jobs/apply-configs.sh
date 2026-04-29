#!/bin/bash
set -e
shopt -s nullglob

apply_configs() {
  ROOT_DIR="$(git -C "$(dirname "${BASH_SOURCE[0]}")" rev-parse --show-toplevel)"
  MAIN="$ROOT_DIR/src/configs/main"
  OPTIONAL="$ROOT_DIR/src/configs/optional"
  DEST="$HOME/.config"

  mkdir -p "$DEST"
  cp -a ~/.config "$HOME/.config.bak.$(date +%s)" 2>/dev/null || true

  for item in "$MAIN"/*/; do
    name="$(basename "$item")"
    [ -d "$item" ] || {
      echo "SKIP: $item"
      continue
    }
    target="$DEST/$name"
    { [ -e "$target" ] || [ -L "$target" ]; } && rm -rf -- "$target"
    ln -s "$item" "$target"
  done

  for name in "$@"; do
    [ -n "$name" ] || {
      echo "SKIP: empty name"
      continue
    }
    item="$OPTIONAL/$name"
    [ -d "$item" ] || {
      echo "SKIP: $item not found"
      continue
    }
    target="$DEST/$name"
    { [ -e "$target" ] || [ -L "$target" ]; } && rm -rf -- "$target"
    ln -s "$item" "$target"
  done
}
