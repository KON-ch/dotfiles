#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ -x /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew could not be found after installation." >&2
  exit 1
fi

brew install git fzf
brew install --cask docker google-chrome visual-studio-code firefox microsoft-edge zoom

for config_file in .zshrc .bash_profile .bashrc .shellrc; do
  source_file="$script_dir/$config_file"
  target_file="$HOME/$config_file"

  if [ ! -e "$target_file" ] && [ ! -L "$target_file" ]; then
    ln -s "$source_file" "$target_file"
    echo "Created $target_file -> $source_file"
  fi
done

echo "Open a new terminal, or run: source ~/.zshrc"
