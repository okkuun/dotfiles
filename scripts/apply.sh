#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROFILE="${PROFILE:-personal}"

link_file() {
  local src="$1"
  local dest="$2"

  mkdir -p "$(dirname "$dest")"
  ln -sfn "$src" "$dest"
}

# Dotfiles
for file in .zshrc .gitconfig .tmux.conf; do
  if [[ -f "$REPO_ROOT/dotfiles/$file" ]]; then
    link_file "$REPO_ROOT/dotfiles/$file" "$HOME/$file"
  fi
done

# Profile-specific files (linked into HOME)
if [[ -d "$REPO_ROOT/profiles/$PROFILE" ]]; then
  for file in "$REPO_ROOT/profiles/$PROFILE"/*; do
    [[ -e "$file" ]] || continue
    link_file "$file" "$HOME/$(basename "$file")"
  done
fi

# ~/.config
mkdir -p "$HOME/.config"
for entry in "$REPO_ROOT/config"/*; do
  [[ -e "$entry" ]] || continue
  if [[ "$(basename "$entry")" == "README.md" ]]; then
    continue
  fi
  link_file "$entry" "$HOME/.config/$(basename "$entry")"
done
