#!/usr/bin/env bash
set -euo pipefail

BACKUP_DIR="$HOME/dotfiles-backup/$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

for file in .zshrc .gitconfig .tmux.conf .zshrc.profile .gitconfig.profile; do
  if [[ -f "$HOME/$file" ]]; then
    cp -a "$HOME/$file" "$BACKUP_DIR/"
  fi
done

echo "Backup created at: $BACKUP_DIR"
