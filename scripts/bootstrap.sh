#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROFILE="${PROFILE:-personal}"

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "This script is for macOS only." >&2
  exit 1
fi

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is not installed. Please install it from https://brew.sh/." >&2
  exit 1
fi

# Apply Brewfile(s)
if [[ -f "$REPO_ROOT/brew/Brewfile.common" ]]; then
  brew bundle --file "$REPO_ROOT/brew/Brewfile.common"
fi
if [[ -f "$REPO_ROOT/brew/Brewfile.${PROFILE}" ]]; then
  brew bundle --file "$REPO_ROOT/brew/Brewfile.${PROFILE}"
fi

PROFILE="$PROFILE" "$REPO_ROOT/scripts/apply.sh"
