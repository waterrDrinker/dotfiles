#!/bin/bash
set -e

ROOT_DIR="$(git -C "$(dirname "${BASH_SOURCE[0]}")" rev-parse --show-toplevel)"
source "$ROOT_DIR/src/setups/shared/utils/warn.sh"

echo "[dirs] setting up user dirs..."

mkdir -p ~/downloads ~/documents ~/pictures ~/music ~/videos ~/tmp

if command -v xdg-user-dirs-update &>/dev/null; then
  xdg-user-dirs-update
else
  warn "xdg-user-dirs-update not found, skipping"
fi
echo "[dirs] done"
