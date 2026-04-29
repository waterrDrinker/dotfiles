#!/bin/bash
set -e

ROOT_DIR="$(git -C "$(dirname "${BASH_SOURCE[0]}")" rev-parse --show-toplevel 2>/dev/null)" || {
  echo "ERROR: not inside a git repo"
  exit 1
}
SHARED_JOBS_DIR="$ROOT_DIR/src/setups/shared/jobs"

extra_configs=(
  kitty
  hypr
)

echo "Apply main configs..."
source "$SHARED_JOBS_DIR/apply-configs.sh"
apply_configs "${extra_configs[@]}"
