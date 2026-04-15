#!/bin/bash
set -e

ROOT_DIR="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"

source "$ROOT_DIR/src/setups/shared/keep-sudo.sh"
source "$ROOT_DIR/src/setups/fedora/shared/pre-setup.sh"
keep_sudo
pre_setup

CORE_SCRIPTS=(
  "../shared/pre-setup.sh"
  "./core/packages.sh"
)

for script in "${CORE_SCRIPTS[@]}"; do
  echo "Running $script"
  source "$script"
done
