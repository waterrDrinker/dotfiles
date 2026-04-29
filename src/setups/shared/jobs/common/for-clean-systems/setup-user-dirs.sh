#!/bin/bash
set -e

echo "[dirs] setting up user dirs..."

mkdir -p ~/downloads ~/documents ~/pictures ~/music ~/videos ~/tmp

if command -v xdg-user-dirs-update &>/dev/null; then
  xdg-user-dirs-update
else
  warn "xdg-user-dirs-update not found, skipping"
fi
echo "[dirs] done"
