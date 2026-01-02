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
function fix_system_python {
    (cd /usr/lib/python3/dist-packages
        sudo ln -s apt_pkg.cpython-310-x86_64-linux-gnu.so apt_pkg.so
    )
}

function install_packages {
    sudo apt-get update
    fix_system_python
    sudo apt-get install --reinstall python3-apt
    sudo apt-get install -y "${PACKAGES[@]}"
}

function main {
    echo "Bootstrap Linux"
    install_packages
}

main "$@"
