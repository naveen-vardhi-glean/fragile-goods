#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

readonly PACKAGES=(
    # Build essentials
    make
    build-essential

    # Core utilities
    coreutils
    findutils
    moreutils
    binutils
    diffutils

    # Shell
    bash-completion
    screen

    # Network
    curl
    wget
    rsync

    # Compression
    unzip
    zip

    # Editors
    vim
    nano

    # File utilities
    tree
    less

    # Search tools
    ripgrep
    fd-find
    fzf

    # JSON/XML
    jq
    xmlstarlet

    # Dev tools
    git
    sqlite3
    openssl
    shellcheck

    # Misc utilities
    bat
    pv
    aspell
    lynx
    pipx
    ffmpeg
    pandoc
    direnv
    tmux
    htop
    watch
    gnutls-bin
)
function fix_system_python {
    (cd /usr/lib/python3/dist-packages
        sudo ln -sf apt_pkg.cpython-310-x86_64-linux-gnu.so apt_pkg.so
    )
}

function install_packages {
    sudo apt-get update
    sudo apt-get install --reinstall python3-apt
    sudo apt-get install -y "${PACKAGES[@]}"
}

function main {
    echo "Bootstrap Linux"
    fix_system_python
    install_packages
}

main "$@"
