#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

function main {
    echo "Bootstrap Common"
    sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply .
}

main "$@"
