#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

readonly PACKAGES=(
    git
    curl
    wget
    vim
    tmux
    htop
    tree
    jq
    ripgrep
    fzf
    fd-find
    bat
    unzip
    zip
    make
    build-essential
)

sudo apt-get update
sudo apt-get install -y "${PACKAGES[@]}"
