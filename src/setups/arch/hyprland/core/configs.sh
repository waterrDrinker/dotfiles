#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(git -C "$SCRIPT_DIR" rev-parse --show-toplevel)"
SHARED_SETUPS_DIR="$ROOT_DIR/src/setups/shared/jobs"

extra_configs=(
  kitty
  hypr
)

echo "Apply main configs..."
source "$SHARED_SETUPS_DIR/apply-configs.sh"
apply_configs "${extra_configs[@]}"
