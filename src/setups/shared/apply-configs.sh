#!/bin/bash
set -e
shopt -s nullglob

ROOT_DIR="$(git -C "$(dirname "${BASH_SOURCE[0]}")" rev-parse --show-toplevel)"
SRC="$ROOT_DIR/src/configs/main"
DEST="$HOME/.config"

if [ ! -e "$HOME/.config.bak" ]; then
  cp -a ~/.config ~/.config.bak.$(date +%s)
fi

echo "Applying configs from: $SRC"

mkdir -p "$DEST"

for item in "$SRC"/*; do
  name="$(basename "$item")"
  target="$DEST/$name"

  [ -z "$target" ] && {
    echo "ERROR: empty target"
    exit 1
  }

  case "$target" in
  "$HOME/.config/"*) ;;
  *)
    echo "REFUSING unsafe path: $target"
    exit 1
    ;;
  esac

  # safety: ensure it's a directory or file we expect
  if [ -e "$target" ] || [ -L "$target" ]; then
    echo "→ replacing $target"
    rm -rf -- "$target"
  fi

  echo "→ linking $name"
  ln -s "$item" "$target"
done

echo "Done."
