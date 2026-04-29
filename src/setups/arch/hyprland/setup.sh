#!/bin/bash
set -e

# Resolve directories
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(git -C "$SCRIPT_DIR" rev-parse --show-toplevel 2>/dev/null)" || {
  echo "ERROR: not inside a git repo"
  exit 1
}
SHARED_DIR="$ROOT_DIR/src/setups/shared"
SHARED_JOBS_DIR="$SHARED_DIR/jobs"

source "$SHARED_DIR/utils/keep-sudo.sh"
source "$SHARED_DIR/utils/warn.sh"
source "$SCRIPT_DIR/bootstrap/mirrors.sh"

LOG="/tmp/setup-$(date +%s).log"
exec > >(tee "$LOG") 2>&1
echo "Logging to $LOG"

keep_sudo
bootstrap_mirrors

echo "Updating system..."
sudo pacman -Syu --noconfirm

# --- Source core scripts in order ---
CORE_SCRIPTS=(
  "$SCRIPT_DIR/core/packages.sh"
  "$SCRIPT_DIR/core/aur.sh"
  "$SCRIPT_DIR/core/services.sh"
  "$SCRIPT_DIR/core/user-services.sh"
  "$SCRIPT_DIR/core/configs.sh"
)

for script in "${CORE_SCRIPTS[@]}"; do
  echo "→ Running $script"
  bash "$script"
done

# --- Run jobs ---
JOBS_DIR="$SCRIPT_DIR/jobs"
for job in "$JOBS_DIR"/*.sh; do
  [ -e "$job" ] || continue
  echo "→ Running job $job"
  bash "$job"
done

# --- Install Zsh at the end ---
echo "Installing Zsh..."
bash "$SHARED_JOBS_DIR/install-zsh.sh"

echo "Apply main configs..."
bash "$SHARED_JOBS_DIR/apply-configs.sh"

echo "Install informant..."
bash "$ROOT_DIR/src/setups/arch/shared/install-informant.sh"

echo "All done! Reboot recommended."

if [ -s $WARNINGS_LOG_PATH ]; then
  echo ""
  echo "=== Warnings ==="
  cat "$WARNINGS_LOG_PATH"
  rm "$WARNINGS_LOG_PATH"
fi
