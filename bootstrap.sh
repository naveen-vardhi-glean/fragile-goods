#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

case "$(uname)" in
    Linux)  platform='linux' ;;
    Darwin) platform='osx' ;;
    *)
        echo "Unsupported platform: $(uname)" >&2
        exit 1
        ;;
esac

# Execute OS specific bootstrap
"${DIR}"/bootstrap_${platform}.sh
"${DIR}"/bootstrap_common.sh
