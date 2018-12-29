#!/bin/bash
set -euo pipefail

function main() {
  # agrozyme.alpine.function.sh change_core
  # exec fluentd --user core --group core
  exec fluentd
}

main "$@"
