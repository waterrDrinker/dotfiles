#!/bin/sh
DOTFILES="$(git -C "$(dirname "$0")" rev-parse --show-toplevel)"
echo "DOTFILES: $DOTFILES"
