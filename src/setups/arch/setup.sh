#!/bin/bash
set -e

# Resolve directories
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../../.." && pwd)"

# Keep sudo alive
source "$ROOT_DIR/src/setups/shared/keep-sudo.sh"
keep_sudo_alive

echo "Updating system..."
sudo pacman -Syu --noconfirm

# --- Source core scripts in order ---
CORE_SCRIPTS=(
  "$SCRIPT_DIR/core/packages.sh"
  "$SCRIPT_DIR/core/aur.sh"
  "$SCRIPT_DIR/core/services.sh"
  "$SCRIPT_DIR/core/user-services.sh"
)

for script in "${CORE_SCRIPTS[@]}"; do
  echo "→ Running $script"
  source "$script"
done

# --- Run jobs ---
JOBS_DIR="$SCRIPT_DIR/jobs"
for job in "$JOBS_DIR"/*.sh; do
  [ -e "$job" ] || continue
  echo "→ Running job $job"
  source "$job"
done

# --- Install Zsh at the end ---
echo "Installing Zsh..."
bash "$ROOT_DIR/src/setups/shared/install-zsh.sh"

echo "All done! Reboot recommended."
